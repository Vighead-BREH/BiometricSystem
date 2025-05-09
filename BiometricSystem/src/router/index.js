import { createRouter, createWebHistory } from 'vue-router'
import LoginView from '../views/LoginView.vue'
import DashboardView from '../views/DashboardView.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: LoginView,
    },
    {
      path: '/dashboard',
      name: 'DashboardView',
      component: DashboardView,
    },
    {
      path: '/records',
      name: 'RecordsView',
      component: () => import('../views/RecordsView.vue'),
    },
    {
      path: '/analytics',
      name: 'Analytics',
      component: () => import('../views/Analytics.vue'),
    },
    // {
    //   path: '/analytics',
    //   name: 'Analytics',
    //   component: () => import('../views/Analytics.vue'),
    // },
    {
      path: '/',
      name: 'Login',
      component: () => import('../views/LoginView.vue'),
    },
  ],
})

export default router
