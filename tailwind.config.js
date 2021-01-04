module.exports = {
    purge: {
      // Specify the paths to all of the template files in your project
      content: [
        './src/components/**/*.res',
        './src/layouts/**/*.res',
        './src/*.res',
        './pages/**/*.{js,ts,jsx,tsx}'
      ],
      options: {
        safelist: ["html", "body"],
      }
    },
    darkMode: false, // or 'media' or 'class'
    theme: {
      extend: {
      },
    },
    variants: {
      width: ['responsive']
    },
    plugins: []
  }