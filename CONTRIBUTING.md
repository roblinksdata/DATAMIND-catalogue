# Contributing to the DATAMIND Catalogue

Thank you for helping improve the catalogue.

## The easiest route: open an issue

You do not need to know Git or edit any files. Use the [guided catalogue change form](https://github.com/DATAMIND-UK/catalogue/issues/new?template=catalogue-change.yml). Provide a title, short description, project status, authors or teams, institutions and working links. A maintainer can turn the request into a catalogue entry.

## Make a pull request

1. Fork this repository and create a branch.
2. Copy `_templates/catalogue-entry.md` into the appropriate collection:
   - `_data-resources/`
   - `_software/`
   - `_data-pipelines/`
3. Give the file a short lowercase name using hyphens, for example `example-resource.md`.
4. Complete all front matter fields. Use full `https://` URLs.
5. Remove placeholder text and make sure claims are suitable for public display.
6. Run `ruby scripts/validate_catalogue.rb` if Ruby is available.
7. Open a pull request. GitHub Actions will validate the entry automatically.

## Editorial expectations

Use plain language, represent authors and institutions accurately, link to authoritative resource pages, and do not include confidential, sensitive or personal data. Maintainers may edit submissions for clarity and consistency.

## Project status

Use one of the following exact values:

- **Planned:** Announced or proposed, but substantive work has not started.
- **In Development:** Currently being built or substantially revised.
- **Active:** Available for use and actively maintained.
- **Mature:** Stable, established and maintained, with relatively infrequent major changes.
- **Paused:** Work or maintenance has temporarily stopped.
- **Archived:** No longer actively developed or maintained.
