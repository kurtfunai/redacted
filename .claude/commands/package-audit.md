# Package Audit

Check Ruby gem dependencies for security vulnerabilities and outdated packages.

## Steps

1. Update the vulnerability database and run security audit:
```bash
bundle audit update && bundle audit
```

2. Check for outdated gems:
```bash
bundle outdated
```

3. For targeted updates, use filters:
   - `bundle outdated --filter-patch` - patch updates only (safest)
   - `bundle outdated --filter-minor` - minor version updates
   - `bundle outdated --filter-major` - major version updates

4. Fix vulnerabilities by updating affected gems:
```bash
bundle update <gem_name>
```

5. Run tests after updates to verify nothing broke:
```bash
rake test
```

## Notes

- Prioritize patch updates first, then minor, then major
- Review changelogs for major version updates before upgrading
- The audit cross-references Gemfile.lock against the Ruby Advisory Database
