; extends

(fenced_code_block
  (info_string
    (language) @language
    (#eq? @language "ojs"))
  (code_fence_content) @javascript)

(fenced_code_block
  (info_string
    (language) @language
    (#eq? @language "{ojs}"))
  (code_fence_content) @javascript)
