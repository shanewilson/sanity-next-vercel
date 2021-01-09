@bs.val external process: 'a = "process"

let client = Sanity.createClient({
  projectId: process["env"]["NEXT_PUBLIC_SANITY_PROJECT_ID"],
  dataset: process["env"]["NEXT_PUBLIC_SANITY_DATASET"],
  useCdn: true,
})
