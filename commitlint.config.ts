import type { UserConfig } from "@commitlint/types";
import { RuleConfigSeverity } from "@commitlint/types";

const Configuration: UserConfig = {
  extends: ["@commitlint/config-conventional"],
  formatter: "@commitlint/format",
  rules: {
    "scope-enum": [
      RuleConfigSeverity.Error,
      "always",
      [
        "deps",
        "deps-dev",
        "tooling",
        "packages",
        "portal-company",
        "portal-talent",
        "portal-backend",
        "ui",
        "terraform",
      ],
    ],
  },
};

export default Configuration;
