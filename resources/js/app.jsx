import '../css/app.css';
import './bootstrap';

import { createInertiaApp } from '@inertiajs/react';
import { resolvePageComponent } from 'laravel-vite-plugin/inertia-helpers';
import { createRoot } from 'react-dom/client';
import axios from 'axios'; // ✅ tambahkan ini

// Setup CSRF token untuk semua request axios
const token = document.querySelector('meta[name="csrf-token"]')?.content;
if (token) {
  axios.defaults.headers.common['X-CSRF-TOKEN'] = token;
}
axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

// Nama aplikasi
const appName = import.meta.env.VITE_APP_NAME || 'Laravel';

createInertiaApp({
  title: (title) => `${title} - ${appName}`,
  resolve: (name) =>
    resolvePageComponent(`./Pages/${name}.jsx`, import.meta.glob('./Pages/**/*.jsx')),
  setup({ el, App, props }) {
    const root = createRoot(el);
    root.render(<App {...props} />);
  },
  progress: {
    color: '#4B5563',
  },
});
