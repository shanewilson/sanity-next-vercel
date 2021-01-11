@bs.val external process: 'a = "process"

let config: Sanity.opts = {
  projectId: process["env"]["NEXT_PUBLIC_SANITY_PROJECT_ID"],
  dataset: process["env"]["NEXT_PUBLIC_SANITY_DATASET"],
  useCdn: true,
  token: ""
}

/**
 * Set up a helper function for generating Image URLs with only the asset reference data in your documents.
 * Read more: https://www.sanity.io/docs/image-url
 **/
let urlFor = source => Sanity.createImageUrlBuilder(config).image(. source)

// Set up the live preview subscription hook
let usePreviewSubscription = Sanity.createPreviewSubscriptionHook(config)

// Set up the client for fetching data in the getProps page functions
let sanityClient = Sanity.createClient(config)
// Set up a preview client with serverless authentication for drafts
let previewClient = Sanity.createClient({
  ...config,
  useCdn: false,
  token: process["env"]["SANITY_API_TOKEN"],
})

// Helper function for easily switching between normal client and preview client
let getClient = (usePreview) => (usePreview ? previewClient : sanityClient)

// Helper function for using the current logged in user account
let useCurrentUser = Sanity.createCurrentUserHook(config)