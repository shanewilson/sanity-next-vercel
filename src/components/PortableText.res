@react.component
let make = (~blocks) => {
    Sanity.createPortableTextComponent(. SanityCMS.config)(. {"blocks": blocks})
}
