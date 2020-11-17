import json

f = open('package.json')

pkgObj = json.load(f)

pkgObj["scripts"]["dev"] = "yarn start"

pkgJson = json.dumps(pkgObj)

f.close()

pkgFile = open('package.json', 'w')

pkgFile.write(pkgJson)

pkgFile.close()

