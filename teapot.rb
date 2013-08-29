
#
#  This file is part of the "Teapot" project, and is released under the MIT license.
#

teapot_version "0.8.0"

define_target "sdl" do |target|
	target.build do |environment|
		build_external(package.path, "SDL-2.0.0-7712", environment) do |config, fresh|
			Commands.run("./configure",
				"--prefix=#{config.install_prefix}",
				"--disable-dependency-tracking",
				"--enable-shared=no",
				"--enable-static=yes",
				*config.configure
			) if fresh
				
			Commands.make_install
		end
	end
	
	target.depends :platform
	
	target.provides "Library/sdl" do
		append linkflags "-lsdl"
	end
end
