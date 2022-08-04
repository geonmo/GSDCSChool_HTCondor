{
// Plot the energy spectrum of the primary particles
gROOT -> Reset();

TFile f("brachytherapy.root");
  
// Draw histos filled by Geant4 simulation 
//   
  
TCanvas* c1 = new TCanvas("c1", " ");
h20->GetXaxis()->SetRangeUser(-5,5);
h20->GetYaxis()->SetRangeUser(-5,5);
h20->Draw("colz");
}
