module.exports = {
  parser: "@typescript-eslint/parser",
  extends: [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "plugin:prettier/recommended",
    "prettier/@typescript-eslint",
    "plugin:react/recommended",
  ],
  plugins: ["react-hooks", "@asbjorn/groq"],
  rules: {
    "@typescript-eslint/explicit-module-boundary-types": 0,
    "@typescript-eslint/explicit-function-return-type": 0,
    "@typescript-eslint/no-explicit-any": 0,
    "react/prop-types": 0,
    "react/react-in-jsx-scope": "off",
    "@asbjorn/groq/no-syntax-errors": "error",
    "@asbjorn/groq/no-template-expressions": "error",
  },
  parserOptions: {
    ecmaVersion: 6,
    sourceType: "module",
  },
  env: {
    node: true,
    browser: true,
    es6: true,
  },
  settings: {
    react: {
      version: "detect",
    },
  },
};
