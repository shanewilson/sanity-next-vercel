import Head from 'next/head'
import styles from '../styles/Index.module.css'
import { sanityClient } from '../lib/sanityClient'

export default function Index(props) {
  return (
    <div className={styles.container}>
      <Head>
        <title>Next.js + Sanity</title>
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <main className={styles.main}>
        <h1 className={styles.title}>{props.greeting?.title}</h1>

        <p className={styles.description}>{props.greeting?.text}</p>
        <p className={styles.description}>
          Head over to your{' '}
          <a className={styles.editLink} href="/studio/desk/message;welcome">
            Sanity Studio
          </a>{' '}
          to edit the above title and description
        </p>
        <p className={styles.description}>
          Get started by editing{' '}
          <code className={styles.code}>pages/index.js</code>
        </p>

        <div className={styles.grid}>
          <a href="https://nextjs.org/docs" className={styles.card}>
            <h3>Next.js documentation &rarr;</h3>
            <p>Find in-depth information about Next.js features and API.</p>
          </a>
          <a href="https://sanity.io/docs" className={styles.card}>
            <h3>Sanity.io documentation &rarr;</h3>
            <p>Find in-depth information about Sanity.io features and API.</p>
          </a>
        </div>
      </main>

      <footer className={styles.footer}>
        <a
          href="https://vercel.com?utm_source=create-next-app&utm_medium=default-template&utm_campaign=create-next-app"
          target="_blank"
          rel="noopener noreferrer"
        >
          Powered by{' '}
          <img src="/vercel.svg" alt="Vercel Logo" className={styles.logo} />{' '}
          and{' '}
          <img src="/sanity.svg" alt="Sanity Logo" className={styles.logo} />
        </a>
      </footer>
    </div>
  )
}

export async function getStaticProps({ params = {}, preview = false }) {
  return {
    props: {
      greeting: await sanityClient.fetch(`*[_id == 'welcome'][0]`),
    },
  }
}
