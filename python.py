# https://blog.esciencecenter.nl/testing-shell-commands-from-python-2a2ec87ebf71

# Running SHELL commands from python
# bash: python setup.py install
import sh
sh.python(['setup.py', 'install'])

# Running a shell command test from python
import pytest
import os
import sh
def test_install(cookies):
  # generate a temporary project using the cookiecutter
  # cookies fixture
  project = cookies.bake()                                                  
  # remember the directory where tests should be run from
  cwd = os.getcwd()
  # change directories to the generated project directory 
  # (the installation command must be run from here)
  os.chdir(str(project.project))
  try:
    # run the shell command
    sh.python(['setup.py', 'install'])
  except sh.ErrorReturnCode as e:
    # print the error, so we know what went wrong
    print(e)
    # make sure the test fails
    pytest.fail(e)
  finally:
    # always change directories to the test directory
    os.chdir(cwd)

    
    
# Max Level sanitization for user provided input
def sanitize(unsafe_input):
        """
        Removes (hopefully) everything besides non-escapable characters.
        Also truncates the output to 35 characters.
        """
        return re.sub('[^ a-zA-Z0-9\u00C0-\u017F]','',unsafe_input)[:35]

# Get containing folder of the current file regardless of current working dir
os.path.abspath(os.path.dirname(__file__))

# Check whether program is run on its own or imported by calling program
# if run on its own: start some tests.
if __name__ == '__main__':
  run_tests()

# Execute command only if variable debugging is set to true:
debugging and print("Here I am!")

# delete all occurences of 'Foo' in list using list comprehension
list = [value for value in list if value != 'Foo']
