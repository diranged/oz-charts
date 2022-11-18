## Tool Binaries
HELM_DOCS_VER ?= v1.11.0
HELM_DOCS     ?= $(LOCALBIN)/helm-docs

LOCALBIN ?= $(shell pwd)/bin
$(LOCALBIN):
	mkdir -p $(@)

$(HELM_DOCS): $(LOCALBIN) Makefile
	GO111MODULE=on GOBIN=$(LOCALBIN) go install github.com/norwoodj/helm-docs/cmd/helm-docs@$(HELM_DOCS_VER)

.PHONY: helm-docs
helm-docs: $(HELM_DOCS)
	$(HELM_DOCS)
	git diff --exit-code
