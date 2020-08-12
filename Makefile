# Makefile by Sahan Kumarasinghe
# Use for automatic email generation for Open-Source at Illinois

.PHONY: clean

build/%.html: %.md template.html build _send
	pandoc -w html --template=template.html --metadata title="OSAI Email: %" -o build/%.html $<	
	cp build/%.html _send/email.html
	grep subject $< | awk '{ gsub("subject: ", ""); print $0 }' > _send/subject.txt

_send:
	mkdir _send

build:
	mkdir build

clean:
	rm -rf build/
	rm -rf _send/ 
