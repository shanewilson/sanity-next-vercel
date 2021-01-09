module Head = Next.Head

type greeting = {
    title: string,
    text: string
}

type props = {
  greeting
}

let default = (props) => {
    <div >
      <Head>
        <title>{React.string("Next.js + Sanity")}</title>
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <main>
        <h1 >{React.string(props.greeting.title)}</h1>
        <Button>{React.string("beep")}</Button>
        <p >{React.string(props.greeting.text)}</p>
        <p >
          {React.string("Head over to your ")}
          <a  href="/studio/desk/message;welcome">
            {React.string("Sanity Studio")}
          </a>
          {React.string(" to edit the above title and description")}
        </p>
        <p >
          {React.string("Get started by editing ")}
          <code >{React.string("pages/index.js")}</code>
        </p>

        <div >
          <a href="https://nextjs.org/docs" >
            <h3>{React.string("Next.js documentation &rarr;")}</h3>
            <p>{React.string("Find in-depth information about Next.js features and API.")}</p>
          </a>
          <a href="https://sanity.io/docs" >
            <h3>{React.string("Sanity.io documentation &rarr;")}</h3>
            <p>{React.string("Find in-depth information about Sanity.io features and API.")}</p>
          </a>
        </div>
      </main>
      <footer >
        <a
          href="https://vercel.com?utm_source=create-next-app&utm_medium=default-template&utm_campaign=create-next-app"
          target="_blank"
          rel="noopener noreferrer"
        >
          {React.string("Powered by ")}
          <img src="/vercel.svg" alt="Vercel Logo" />
          {React.string(" and ")}
          <img src="/sanity.svg" alt="Sanity Logo"/>
        </a>
      </footer>
    </div>
}

let getStaticProps = _ctx => {
  let greeting = SanityCMS.client.fetch(. "*[_id == 'welcome'][0]")
  greeting->Js.Promise.then_(value => {
  Js.Promise.resolve({
    "props": {
      greeting: value
    },
  })
  }, _)
}
