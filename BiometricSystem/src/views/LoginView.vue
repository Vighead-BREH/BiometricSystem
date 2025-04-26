<script setup>
import { ref, onMounted, computed, watch } from "vue";
import { useRouter } from "vue-router";

const email = ref("");
const password = ref("");
const confirmPassword = ref("");
const rememberMe = ref(false);
const forgotEmail = ref("");
const newUserName = ref("");
const newUserEmail = ref("");
const newUserPassword = ref("");
const router = useRouter();
const isLoading = ref(false);
const errorMessage = ref("");
const successMessage = ref("");

const currentView = ref("login"); 


const passwordValidation = ref({
  validLength: false,
  hasUpperCase: false,
  hasLowerCase: false,
  hasNumber: false
});


const isNameValid = computed(() => {

  return newUserName.value.trim() !== "" && !/\d/.test(newUserName.value);
});


watch(newUserPassword, (newValue) => {
  validatePassword(newValue);
});

const validatePassword = (pwd) => {
  passwordValidation.value = {
    validLength: pwd.length >= 8,  
    hasUpperCase: /[A-Z]/.test(pwd),
    hasLowerCase: /[a-z]/.test(pwd),
    hasNumber: /[0-9]/.test(pwd)
  };
};


const isPasswordStrong = computed(() => {
  const { validLength, hasUpperCase, hasLowerCase, hasNumber } = passwordValidation.value;
  return validLength && hasUpperCase && hasLowerCase && hasNumber;
});

const isSignUpFormValid = computed(() => {
  return isNameValid.value && 
         newUserEmail.value.trim() !== "" && 
         isPasswordStrong.value &&
         newUserPassword.value === confirmPassword.value;
});

onMounted(() => {
  if (localStorage.getItem('rememberMe') === 'true') {
    const savedUser = JSON.parse(localStorage.getItem('user') || '{}');
    if (savedUser.email) {
      email.value = savedUser.email;
      rememberMe.value = true;
    }
  }
  
  if (localStorage.getItem('isAuthenticated') === 'true') {
    router.push("/dashboard");
  }
});

const switchView = (view) => {

  errorMessage.value = "";
  successMessage.value = "";
  isLoading.value = false;
  currentView.value = view;
  
 
  if (view === 'signup') {
    newUserPassword.value = "";
    confirmPassword.value = "";
    newUserName.value = "";
    newUserEmail.value = "";
    validatePassword("");
  }
};

const login = async () => {
  try {
    errorMessage.value = "";
    isLoading.value = true;

    await new Promise(resolve => setTimeout(resolve, 800));

    if (email.value === "admin@gmail.com" && password.value === "123123") {
      const userData = {
        email: email.value,
        displayName: email.value.split('@')[0] || 'Admin',
        role: 'Admin',
        lastLogin: new Date().toISOString()
      };
      
      localStorage.setItem('user', JSON.stringify(userData));
      localStorage.setItem('isAuthenticated', 'true');
      
      if (rememberMe.value) {
        localStorage.setItem('rememberMe', 'true');
      } else {
        localStorage.removeItem('rememberMe');
      }
      
      router.push("/dashboard");
      return;
    } 

    const existingUsers = JSON.parse(localStorage.getItem('users') || '[]');
    const foundUser = existingUsers.find(user => user.email === email.value);
    
    if (foundUser && foundUser.password === password.value) {
      const userData = {
        ...foundUser,
        lastLogin: new Date().toISOString()
      };
      
      localStorage.setItem('user', JSON.stringify(userData));
      localStorage.setItem('isAuthenticated', 'true');
      
      if (rememberMe.value) {
        localStorage.setItem('rememberMe', 'true');
      } else {
        localStorage.removeItem('rememberMe');
      }
      
      router.push("/dashboard");
      return;
    }
  
    throw new Error("Invalid credentials");
  } catch (error) {
    errorMessage.value = error.message || "Invalid credentials! Please try again.";
  } finally {
    isLoading.value = false;
  }
};

const signUp = async () => {
  try {
    errorMessage.value = "";
    isLoading.value = true;

    if (!isNameValid.value) {
      throw new Error("Full name cannot contain numbers");
    }

    if (newUserPassword.value !== confirmPassword.value) {
      throw new Error("Passwords do not match");
    }
    
    if (!isPasswordStrong.value) {
      throw new Error("Password does not meet the requirements");
    }
   
    await new Promise(resolve => setTimeout(resolve, 800));
    
    const userData = {
      email: newUserEmail.value,
      displayName: newUserName.value,
      password: newUserPassword.value, 
      role: 'User',
      createdAt: new Date().toISOString()
    };
    
    const existingUsers = JSON.parse(localStorage.getItem('users') || '[]');
    
    if (existingUsers.some(user => user.email === newUserEmail.value)) {
      throw new Error("Email already exists");
    }

    existingUsers.push(userData);
    localStorage.setItem('users', JSON.stringify(existingUsers));

    successMessage.value = "Account created successfully! You can now login.";
    newUserName.value = "";
    newUserEmail.value = "";
    newUserPassword.value = "";
    confirmPassword.value = "";
    
    setTimeout(() => {
      switchView('login');
    }, 2000);
    
  } catch (error) {
    errorMessage.value = error.message || "Failed to create account. Please try again.";
  } finally {
    isLoading.value = false;
  }
};

const resetPassword = async () => {
  try {
    errorMessage.value = "";
    isLoading.value = true;

    await new Promise(resolve => setTimeout(resolve, 1000));

    successMessage.value = "Password reset instructions sent to your email.";
    forgotEmail.value = "";
    
    setTimeout(() => {
      switchView('login');
    }, 3000);
    
  } catch (error) {
    errorMessage.value = error.message || "Failed to reset password. Please try again.";
  } finally {
    isLoading.value = false;
  }
};
</script>

<template>
  <div class="login-container" v-if="currentView === 'login'">
    <div class="login-title">
      <h1>Biometric System</h1>
      <p>Sign in to continue</p>
    </div>
    
    <form @submit.prevent="login" class="login-form">
      <div class="form-group">
        <label for="email" class="form-label">Email Address</label>
        <div class="input-container">
          <input 
            type="email" 
            id="email" 
            class="form-input" 
            required 
            placeholder="emailAddress@gmail.com"
            v-model="email"
            :disabled="isLoading"
          >
        </div>
      </div>
      
      <div class="form-group">
        <label for="password" class="form-label">Password</label>
        <div class="input-container">
          <input 
            type="password" 
            id="password" 
            class="form-input" 
            required 
            placeholder="Enter your password"
            v-model="password"
            :disabled="isLoading"
          >
        </div>
      </div>
      
      <div class="error-message" v-if="errorMessage">
        {{ errorMessage }}
      </div>
      
      <div class="success-message" v-if="successMessage">
        {{ successMessage }}
      </div>
      
      <div class="form-actions">
        <div class="form-remember">
          <input type="checkbox" id="remember" v-model="rememberMe" :disabled="isLoading">
          <label for="remember">Remember me</label>
        </div>
        <a href="#" class="text-green-500" @click.prevent="switchView('forgot')">Forgot password?</a>
      </div>
      
      <button type="submit" class="btn-login" :disabled="isLoading">
        <span v-if="!isLoading">Sign In</span>
        <span v-else class="loading-spinner"></span>
      </button>
    </form>
    
    <div class="login-signup">
      <p>
        Don't have an account? 
        <a href="#" @click.prevent="switchView('signup')">Sign up</a>
      </p>
    </div>
  </div>
  

  <div class="login-container signup-container" v-if="currentView === 'signup'">
    <div class="login-title">
      <h1>Create Account</h1>
      <p>Join our platform</p>
    </div>
    
    <form @submit.prevent="signUp" class="login-form">
      <div class="form-group">
        <label for="newUserName" class="form-label">Full Name</label>
        <div class="input-container">
          <input 
            type="text" 
            id="newUserName" 
            class="form-input" 
            required 
            placeholder="Your full name"
            v-model="newUserName"
            :disabled="isLoading"
          >
        </div>
        <div v-if="newUserName.trim() !== '' && !isNameValid">
          <div class="name-validation-text">
            Name cannot contain numbers
          </div>
        </div>
      </div>
      
      <div class="form-group">
        <label for="newUserEmail" class="form-label">Email Address</label>
        <div class="input-container">
          <input 
            type="email" 
            id="newUserEmail" 
            class="form-input" 
            required 
            placeholder="youremail@example.com"
            v-model="newUserEmail"
            :disabled="isLoading"
          >
        </div>
      </div>
      
      <div class="form-group">
    <label for="newUserPassword" class="form-label">Password</label>
    <div class="input-container">
      <input 
        type="password" 
        id="newUserPassword" 
        class="form-input" 
        required 
        placeholder="Create a strong password"
        v-model="newUserPassword"
        :disabled="isLoading"
      >
    </div>
    
        <div class="password-condition-message" v-if="newUserPassword && !isPasswordStrong">
          The password must be a combination of at least 8 uppercase letters, lowercase letters, and digits
        </div>
      </div>
      
      <div class="form-group">
        <label for="confirmPassword" class="form-label">Confirm Password</label>
        <div class="input-container">
          <input 
            type="password" 
            id="confirmPassword" 
            class="form-input" 
            required 
            placeholder="Confirm your password"
            v-model="confirmPassword"
            :disabled="isLoading"
          >
        </div>
        <div v-if="confirmPassword && newUserPassword && confirmPassword !== newUserPassword">
          <div class="password-mismatch-text">
            Passwords do not match
          </div>
        </div>
      </div>
      
      <div class="error-message" v-if="errorMessage">
        {{ errorMessage }}
      </div>
      
      <div class="success-message" v-if="successMessage">
        {{ successMessage }}
      </div>
      
      <button type="submit" class="btn-login" :disabled="isLoading || !isSignUpFormValid">
        <span v-if="!isLoading">Create Account</span>
        <span v-else class="loading-spinner"></span>
      </button>
    </form>
    
    <div class="login-signup">
      <p>
        Already have an account? 
        <a href="#" @click.prevent="switchView('login')">Sign in</a>
      </p>
    </div>
  </div>
  
 
  <div class="login-container" v-if="currentView === 'forgot'">
    <div class="login-title">
      <h1>Reset Password</h1>
      <p>We'll send you reset instructions</p>
    </div>
    
    <form @submit.prevent="resetPassword" class="login-form">
      <div class="form-group">
        <label for="forgotEmail" class="form-label">Email Address</label>
        <div class="input-container">
          <input 
            type="email" 
            id="forgotEmail" 
            class="form-input" 
            required 
            placeholder="Enter your email address"
            v-model="forgotEmail"
            :disabled="isLoading"
          >
        </div>
      </div>
      
      <div class="error-message" v-if="errorMessage">
        {{ errorMessage }}
      </div>
      
      <div class="success-message" v-if="successMessage">
        {{ successMessage }}
      </div>
      
      <button type="submit" class="btn-login" :disabled="isLoading || !forgotEmail">
        <span v-if="!isLoading">Reset Password</span>
        <span v-else class="loading-spinner"></span>
      </button>
    </form>
    
    <div class="login-signup">
      <p>
        Remember your password? 
        <a href="#" @click.prevent="switchView('login')">Back to login</a>
      </p>
    </div>
  </div>
</template>

<style scoped>
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: scale(0.95);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

@keyframes float {
  0% {
    transform: translateY(0px);
  }
  50% {
    transform: translateY(-20px);
  }
  100% {
    transform: translateY(0px);
  }
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

.login-container {
  width: 100%;
  max-width: 400px;
  margin: 49px auto;
  padding: 10px 50px 20px 30px; 
  background-color: #1F2937;
  border-radius: 2rem;
  box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.4);
  position: relative;
  z-index: 10;
  
  opacity: 0;
  animation: fadeIn 1s ease-out forwards;
  animation-delay: 0.2s;
  border: 1px solid rgba(75, 85, 99, 0.4);
}


.signup-container {
  padding: 10px 50px 20px 30px; 
  margin-top: 2px;
  margin-bottom: 15px;
  border-radius: 1rem;
}

.login-container::before {
  position: absolute;
  top: -1px;
  left: -1px;
  right: -1px;
  bottom: -1px;
  background: linear-gradient(45deg, transparent, rgba(16, 185, 129, 0.2), transparent);
  border-radius: 1.1rem;
  z-index: -1;
  opacity: 0;
  transition: opacity 0.5s ease;
}

.login-container:hover::before {
  opacity: 1;
}

.login-title {
  text-align: center;
  margin-bottom: 2rem;
  transform: translateY(20px);
  opacity: 0;
  animation: fadeIn 0.8s ease-out forwards, float 6s ease-in-out infinite;
  animation-delay: 0.4s;
}

.login-title h1 {
  font-size: 2.5rem;
  color: white;
  margin-bottom: 0.5rem;
  letter-spacing: -1px;
  background: linear-gradient(to right, #10B981, #059669);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.login-title p {
  color: #9CA3AF;
}

.login-form {
  display: flex;
  flex-direction: column;
  gap: 1.25rem; 
}

.password-condition-message{
    color: yellow;
    margin-top: 10px;
    font-size: 14px;
}

.name-validation-text {
    color: rgb(217, 22, 22);
    margin-top: 10px;
    font-size: 14px;
}

.form-group {
  margin-bottom: 0.25rem; 
  transform: translateY(20px);
  opacity: 0;
  animation: fadeIn 0.8s ease-out forwards;
}

.form-group:nth-child(1) {
  animation-delay: 0.6s;
}

.form-group:nth-child(2) {
  animation-delay: 0.8s;
}

.form-group:nth-child(3) {
  animation-delay: 1s;
}

.form-group:nth-child(4) {
  animation-delay: 1.2s;
}

.form-label {
  display: block;
  margin-bottom: 0.4rem; 
  color: #D1D5DB;
  font-size: 0.875rem;
  font-weight: 500;
}

.input-container {
  position: relative;
}

.form-input {
  width: 100%;
  padding: 12px 12px; 
  background-color: #374151;
  border: 1px solid #4B5563;
  border-radius: 0.5rem;
  color: white;
  transition: all 0.3s ease;
}

.form-input:focus {
  outline: none;
  border-color: #10B981;
  box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.2);
}

.form-input:disabled {
  opacity: 0.7;
  cursor: not-allowed;
}

.error-message {
  background-color: rgba(239, 68, 68, 0.1);
  color: #ef4444;
  padding: 0.75rem;
  border-radius: 0.375rem;
  font-size: 0.875rem;
  border-left: 3px solid #ef4444;
  animation: fadeIn 0.3s ease-out forwards;
  margin-top: 0.5rem; 
}

.success-message {
  background-color: rgba(16, 185, 129, 0.1);
  color: #10B981;
  padding: 0.75rem;
  border-radius: 0.375rem;
  font-size: 0.875rem;
  border-left: 3px solid #10B981;
  animation: fadeIn 0.3s ease-out forwards;
  margin-top: 0.5rem; 
}

.form-actions {
  display: flex;
  justify-content: space-between;
  align-items: center;
  transform: translateY(20px);
  opacity: 0;
  animation: fadeIn 0.8s ease-out forwards;
  animation-delay: 1s;
  margin-top: 0.5rem; 
  margin-bottom: 0.5rem; 
}

.form-remember {
  display: flex;
  align-items: center;
}

.form-remember input {
  margin-right: 0.5rem;
  cursor: pointer;
}

.text-green-500 {
  color: #10B981;
  text-decoration: none;
  transition: color 0.3s ease;
}

.text-green-500:hover {
  color: #059669;
  text-decoration: underline;
}

.btn-login {
  width: 100%;
  padding: 12px 2px 15px 15px; 
  background-color: #10B981;
  color: white;
  border: none;
  border-radius: 0.5rem;
  cursor: pointer;
  transition: all 0.3s ease;
  opacity: 0;
  animation: fadeIn 0.8s ease-out forwards;
  animation-delay: 1.2s;
  font-weight: 600;
  display: flex;
  justify-content: center;
  align-items: center;
}

.btn-login:hover:not(:disabled) {
  background-color: #059669;
  transform: translateY(-2px);
  box-shadow: 0 10px 20px rgba(0,0,0,0.2);
}

.btn-login:disabled {
  opacity: 0.7;
  cursor: not-allowed;
  background-color: #6B7280;
}


.login-signup {
  text-align: center;
  margin-top: 1.5rem;
  color: #9CA3AF;
  transform: translateY(20px);
  opacity: 0;
  animation: fadeIn 0.8s ease-out forwards;
  animation-delay: 1.4s;
  padding-bottom: 5px; 
}

.login-signup a {
  color: #10B981;
  text-decoration: none;
  transition: color 0.3s ease;
  font-weight: 500;
}

.login-signup a:hover {
  color: #059669;
  text-decoration: underline;
}
</style>