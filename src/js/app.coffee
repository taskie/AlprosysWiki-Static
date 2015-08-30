require "./ga"

document.addEventListener "DOMContentLoaded", ->
    title = document.querySelector("#content .pageTitle a")
    html = title.innerHTML
    breadcrumb = document.querySelector(".breadcrumb")
    breadcrumbHtml = decodeURIComponent(breadcrumb.innerHTML)
    
    components = html.split("/")
    if components[0] != "ALPROSYS Wiki"
        components.unshift("ALPROSYS Wiki")
    console.log components

    breadcrumbs = breadcrumbHtml.split("/")
    console.log breadcrumbs

    for i in [0 ... components.length]
        href = breadcrumbs[0 .. i].join("/")
        if href == ""
          href = "/"
        components[i] = "<a href=\"#{href}\">#{components[i]}</a>"
    # components.unshift("<a href=\"http://alprosys.com\">ALPROSYS</a>")

    breadcrumbs = document.querySelectorAll(".breadcrumb")
    for breadcrumb in breadcrumbs
        breadcrumb.innerHTML = components.join("/")
        breadcrumb.style.visibility = "visible"
