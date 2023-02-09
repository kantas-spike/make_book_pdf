BUILD_DIR := ./build
DOWNLOAD_DIR := $(BUILD_DIR)/pdf
OUTLINE_TOOL_DIR := $(BUILD_DIR)/pdfoutline
URL_LIST := ./URL.txt
TOC_FILE := ./toc.txt
ADDITIONAL_PDF := ./additional_info.pdf


COMBINED_PDF := $(BUILD_DIR)/_make.pdf
OUTPUT_PDF := make_merged.pdf


DOWNLOAD_INTERVAL_SEC := 15

QUIET = @

# commands
TOUCH = touch
CURL = curl
GS = gs
GIT = git
PYTHON3 = python3

.PHONY: all
all: $(OUTPUT_PDF)

.PHONY: clean
clean:
	rm -rf $(DOWNLOAD_DIR)
	rm $(COMBINED_PDF)
	rm $(BUILD_DIR)/downloaded
	rm $(OUTPUT_PDF)

.PHONY: clean-all
clean-all:
	rm -rf $(BUILD_DIR)
	rm $(OUTPUT_PDF)


# add toc to combined pdf
$(OUTPUT_PDF): $(TOC_FILE) $(OUTLINE_TOOL_DIR) $(COMBINED_PDF)
	$(PYTHON3) $(OUTLINE_TOOL_DIR)/pdfoutline.py $(COMBINED_PDF) $(TOC_FILE) $@

# clone tool
$(OUTLINE_TOOL_DIR):
	$(GIT) clone https://github.com/yutayamamoto/pdfoutline.git $@

# combine pdf
$(COMBINED_PDF): $(BUILD_DIR)/downloaded $(ADDITIONAL_PDF)
	cp -p $(ADDITIONAL_PDF) $(DOWNLOAD_DIR)/025.pdf
	$(GS) -dNOPAUSE -sDEVICE=pdfwrite -sOUTPUTFILE=$@ -dBATCH $(DOWNLOAD_DIR)/*.pdf

# download from URL_LIST
$(BUILD_DIR)/downloaded: $(URL_LIST) $(DOWNLOAD_DIR)
	$(QUIET) idx=1;												\
	while read line || [ -n "$${line}" ];						\
	do															\
		output_path=$(DOWNLOAD_DIR)/`printf "%02d" $$idx`0.pdf;	\
		echo "download $${line} to $${output_path} ...";		\
		$(CURL) $${line} -o $${output_path};						\
		idx=$$(($$idx+1));										\
		echo "sleep $(DOWNLOAD_INTERVAL_SEC)sec...";			\
		sleep $(DOWNLOAD_INTERVAL_SEC);							\
	done < $<
	$(TOUCH) $@


$(DOWNLOAD_DIR):
	mkdir -p $(DOWNLOAD_DIR)