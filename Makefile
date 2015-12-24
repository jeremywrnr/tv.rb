g=tv.rb
v=0.1

build: clean
	gem build $(g).gemspec
	gem install ./$(g)-$(v).gem

clean:
	@rm -vf *.gem

push: build
	gem push $(g)-$(v).gem

dev:
	filewatcher "**/*.rb" "clear && ruby spec/tv_spec.rb"

