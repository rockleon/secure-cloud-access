import Vue from 'vue';
import VueRouter from 'vue-router';
import Admin from '@/views/Admin';
import Client from '@/views/Client';
import FileList from '@/views/FileList';

Vue.use(VueRouter);

const routes = [
    // {
    //     path: '/',
    //     name: 'Home',
    //     component: Home
    // },
    {
        path: '/admin',
        name: 'Admin',
        component: Admin
    },
    {
        path: '/client',
        name: 'Client',
        component: Client
    },
    {
        path: '/files',
        name: 'Files',
        component: FileList
    },
]

const router = new VueRouter({
    mode: "history",
    // base: process.env.BASE_URL,
    routes
});

export default router;