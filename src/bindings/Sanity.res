type opts = {
  projectId: string,
  dataset: string,
  useCdn: bool,
  token: string,
}

type createClient = {
    fetch: (. string) => Js.Promise.t<Js.Json.t>
}

type createImageUrlBuilder = {
    image: (. string) => string
}

type createPortableTextComponent = (. {"blocks": string}) => React.element

@module("next-sanity") external groq: opts => unit = "groq"
@module("next-sanity") external createClient: opts => createClient = "createClient"
@module("next-sanity") external createImageUrlBuilder: opts => createImageUrlBuilder = "createImageUrlBuilder"
@module("next-sanity") external createPortableTextComponent: (. opts) =>  createPortableTextComponent = "createPortableTextComponent"
@module("next-sanity") external createPreviewSubscriptionHook: opts => unit = "createPreviewSubscriptionHook"
@module("next-sanity") external createCurrentUserHook: opts => unit = "createCurrentUserHook"
