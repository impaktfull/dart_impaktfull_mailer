# 0.0.5

## Fix

- Sync the html templates with dart

# 0.0.4

## CI

- Fix the github actions to publish to pub.dev (secrets file)

# 0.0.3

## CI

- Fix the github actions to publish to pub.dev (secrets.txt -> secrets.dart)

# 0.0.2

## Breaking change

- Changed the default variable replacer from `BracketVariableReplacer` to `DelimiterVariableReplacer`

## Feature

- Added `DelimiterVariableReplacer` with `{{` as prefix and `}}` as suffix by default
- Export HtmlMailTemplates & HtmlMailTemplate

## CI

- Added github actions to create a tag when a new version is released to pub.dev

## Fix

- Fixed the variable replacement in the email template.
- imports

## Docs

- Added propper docs in README.md

# 0.0.1

- Initial version.
