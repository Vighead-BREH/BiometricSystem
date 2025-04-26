import { ref } from 'vue'
import { useRouter } from 'vue-router'

export function useAuth() {
  const router = useRouter()
  const user = ref(null)
  
  const loadUser = () => {
    const isAuthenticated = localStorage.getItem('isAuthenticated') === 'true'
    if (isAuthenticated) {
      const userData = JSON.parse(localStorage.getItem('user') || '{}')
      if (userData && userData.email) {
        user.value = userData
        return true
      }
    }
    return false
  }
  
  const logout = () => {

    localStorage.removeItem('isAuthenticated')
    localStorage.removeItem('user')
    user.value = null
    
    router.push('/login')
  }
  
  return {
    user,
    loadUser,
    logout
  }
}