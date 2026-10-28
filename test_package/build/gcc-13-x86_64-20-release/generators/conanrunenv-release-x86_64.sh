script_folder="/home/ecku/develop/holoscan/external_sources/conan-slang-rhi/test_package/build/gcc-13-x86_64-20-release/generators"
echo "echo Restoring environment" > "$script_folder/deactivate_conanrunenv-release-x86_64.sh"
for v in LD_LIBRARY_PATH DYLD_LIBRARY_PATH PATH
do
   is_defined="true"
   value=$(printenv $v) || is_defined="" || true
   if [ -n "$value" ] || [ -n "$is_defined" ]
   then
       echo export "$v='$value'" >> "$script_folder/deactivate_conanrunenv-release-x86_64.sh"
   else
       echo unset $v >> "$script_folder/deactivate_conanrunenv-release-x86_64.sh"
   fi
done

export LD_LIBRARY_PATH="/home/ecku/.conan2/p/b/slang729e5ea07ba19/p/lib:/home/ecku/.conan2/p/b/slangea533cae8c945/p/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export DYLD_LIBRARY_PATH="/home/ecku/.conan2/p/b/slang729e5ea07ba19/p/lib:/home/ecku/.conan2/p/b/slangea533cae8c945/p/lib${DYLD_LIBRARY_PATH:+:$DYLD_LIBRARY_PATH}"
export PATH="/home/ecku/.conan2/p/b/slangea533cae8c945/p/bin:/home/ecku/.conan2/p/b/slangea533cae8c945/p/bin${PATH:+:$PATH}"