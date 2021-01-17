import Error from "next/error";
import { groq } from "next-sanity";
import { useRouter } from "next/router";
import LandingPage from "../components/LandingPage";
import { getClient, usePreviewSubscription } from "../utils/sanity";

const query = groq`*[_type == "page" && slug.current == $slug][0]`;

function PageContainer({ initialData, preview }) {
  const router = useRouter();
  if (!router.isFallback && !initialData) {
    return <Error statusCode={404} />;
  }

  const { data = {} } = usePreviewSubscription(query, {
    params: { slug: initialData?.slug?.current },
    initialData,
    enabled: preview || "preview" in router.query,
  });

  return <LandingPage page={data} />;
}

export async function getStaticProps({ params, preview = false }) {
  const initialData = await getClient(preview).fetch(query, {
    slug: params.slug,
  });

  return {
    props: { preview, initialData },
  };
}

export async function getStaticPaths() {
  const query = groq`*[_type == "page" && defined(slug.current)][].slug.current`;
  const paths = await getClient().fetch(query);

  return {
    paths: paths.map((slug) => ({ params: { slug } })),
    fallback: true,
  };
}

export default PageContainer;
