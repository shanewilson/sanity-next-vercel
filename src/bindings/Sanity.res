type opts = {
  projectId: string,
  dataset: string,
  useCdn: bool,
}

type t = {
    fetch: (. string) => Js.Promise.t<Js.Json.t>
}

@module("@sanity/client") external createClient: opts => t = "default"