import os, sys, re

#get version into from module without importing it
version_re = re.compile("""__version__[\s]*=[\s]*['|"](.*)['|"]""")

with open('helloworld.py') as f:
    content = f.read()
    match = version_re.search(content)
    version = match.group(1)

readme = os.path.join(os.path.dirname(__file__), 'README.md')
long_description = open(readme).read()

SETUP_ARGS = dict(
    name='helloworld',
    version=version,
    description=('Description ..'),
    long_description=long_description,
    url='https://github.com/pramitmitra/Helloworld',
    license='MIT',
    include_package_data=True,
    classifiers=[
        'Development Status :: 4 - Beta',
        'Environment :: Web Environment',
    ],
    py_modules = ['helloworld',],
    install_requires = [
        'requests>=2.22',
    ],
)


if __name__=='__main__':
    from setuptools import setup, find_packages

    SETUP_ARGS['packages'] = find_packages()
    setup(**SETUP_ARGS)