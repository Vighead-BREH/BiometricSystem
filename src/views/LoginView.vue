<script setup>
import { ref } from "vue";
import { useRouter } from "vue-router";

const email = ref("");
const password = ref("");
const router = useRouter();

const login = () => {
  if (email.value === "admin@gmail.com" && password.value === "123123") {
    router.push("/dashboard");
  } else {
    alert("Invalid credentials! Please try again.");
  }
};
</script>
<template>
    <meta charset="UTF-8">
    <title>Project Hub Login</title>
    <div class="login-background"></div>
    <div class="login-container">
        <div class="login-title">
            <h1>Biometric System</h1>
            <p>Sign in to continue</p>
        </div>
        <form @submit.prevent="login">
            <div class="form-group">
                <label for="email" class="form-label">Email Address</label>
                <input 
                    type="email" 
                    id="email" 
                    class="form-input" 
                    required 
                    placeholder="emailAddress@gmail.com"
                    v-model="email"
                >
            </div>
            <div class="form-group">
                <label for="password" class="form-label">Password</label>
                <input 
                    type="password" 
                    id="password" 
                    class="form-input" 
                    required 
                    placeholder="Enter your password"
                    v-model="password"
                >
            </div>
            <div class="form-actions">
                <div class="form-remember">
                    <input type="checkbox" id="remember">
                    <label for="remember">Remember me</label>
                </div>
                <a href="#" class="text-green-500">Forgot password?</a>
            </div>
            <button type="submit" class="btn-login">
                Sign In
            </button>
        </form>
        <div class="login-signup">
            <p>
                Don't have an account? 
                <a href="#">Sign up</a>
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

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: "Poppins", sans-serif;
    background-color: #111827;
    color: #ffffff;
    line-height: 1.6;
    overflow: hidden;
}

.login-background {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(135deg, #111827 0%, #1F2937 100%);
    z-index: -1;
}

.login-container {
    width: 100%;
    max-width: 400px;
    margin: 8rem auto;
    padding: 2rem;
    background-color: #1F2937;
    border-radius: 0.75rem;
    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
    position: relative;
    z-index: 10;
    
   
    opacity: 0;
    animation: fadeIn 1s ease-out forwards;
    animation-delay: 0.2s;
}

.login-container::before {
    content: '';
    position: absolute;
    top: -1px;
    left: -1px;
    right: -1px;
    bottom: -1px;
    background: linear-gradient(45deg, transparent, rgba(16, 185, 129, 0.1), transparent);
    border-radius: 0.85rem;
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
    animation: fadeIn 0.8s ease-out forwards;
    animation-delay: 0.4s;
}

.login-title h1 {
    font-size: 2.5rem;
    color: white;
    margin-bottom: 0.5rem;
    letter-spacing: -1px;
}

.login-title p {
    color: #9CA3AF;
}

.form-group {
    margin-bottom: 1.5rem;
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

.form-label {
    display: block;
    margin-bottom: 0.5rem;
    color: #D1D5DB;
    font-size: 0.875rem;
}

.form-input {
    width: 100%;
    padding: 0.75rem;
    background-color: #374151;
    border: 1px solid #4B5563;
    border-radius: 0.375rem;
    color: white;
    transition: all 0.3s ease;
}

.form-input:focus {
    outline: none;
    border-color: #10B981;
    box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.2);
}

.form-actions {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 1.5rem;
    transform: translateY(20px);
    opacity: 0;
    animation: fadeIn 0.8s ease-out forwards;
    animation-delay: 1s;
}

.btn-login {
    width: 100%;
    padding: 0.75rem;
    background-color: #10B981;
    color: white;
    border: none;
    border-radius: 0.375rem;
    cursor: pointer;
    transition: all 0.3s ease;
    transform: translateY(20px);
    opacity: 0;
    animation: fadeIn 0.8s ease-out forwards;
    animation-delay: 1.2s;
}

.btn-login:hover {
    background-color: #059669;
    transform: translateY(-5px);
    box-shadow: 0 10px 20px rgba(0,0,0,0.2);
}

.login-signup {
    text-align: center;
    margin-top: 1rem;
    color: #9CA3AF;
    transform: translateY(20px);
    opacity: 0;
    animation: fadeIn 0.8s ease-out forwards;
    animation-delay: 1.4s;
}

.login-signup a {
    color: #10B981;
    text-decoration: none;
    transition: color 0.3s ease;
}

.login-signup a:hover {
    color: #059669;
}
</style>