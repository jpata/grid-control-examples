import ROOT, os

#All your parameters are environment variables
DATASETPATH = os.environ["DATASETPATH"]
FILE_NAMES = os.environ["FILE_NAMES"].split()
MY_SETTING = os.environ["MY_SETTING"]

print "processing dataset", DATASETPATH
print "processing {0} files".format(len(FILE_NAMES))
print "my custom setting MY_SETTING=", MY_SETTING

of = ROOT.TFile("out.root", "RECREATE")
for fi in FILE_NAMES:
    fn = "root://t3dcachedb.psi.ch:1094///pnfs/psi.ch/cms/trivcat" + fi
    print "opening", fn
    tf = ROOT.TFile.Open(fn)
    tt = tf.Get("tree")
    of.cd()
    tt.Draw("numJets >> numJets")
of.Write()
of.Close()
