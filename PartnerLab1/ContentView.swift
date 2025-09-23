//
//  ContentView.swift
//  PartnerLab1
//
//  Created by ToriZhang on 9/22/25.
//

import SwiftUI

struct ContentView: View {
    
    // Array for dog names and descriptions
    let dogNames = [
        "Airedale Terrier",
        "American Foxhound",
        "Dutch Shepherd",
        "Havanese",
        "Leonberger",
        "Mudi",
        "Norwegian Lundehund",
        "Pharaoh Hound",
        "Scottish Terrier",
        "Tosa"
    ]
    
    let dogDescriptions = [
        "The Airedale Terrier stands among the world's most versatile dog breeds and has distinguished himself as hunter, athlete, and companion.",
        "American Foxhounds are good-natured, low-maintenance hounds who get on well with kids, dogs, even cats, but come with special considerations for prospective owners.",
        "The Dutch Shepherd is a lively, athletic, alert and intelligent breed, and has retained its herding instinct for which it was originally developed.",
        "The Havanese, the only dog breed native to Cuba, are vivacious and sociable companions and are especially popular with American city dwellers.",
        "The Leonberger is a lush-coated giant of German origin. They have a gentle nature and serene patience and they relish the companionship of the whole family.",
        "The Mudi is an extremely versatile, intelligent, alert, agile, all-purpose Hungarian farm dog. The breed is a loyal protector of property and family members without being overly aggressive.",
        "From Norway’s rocky island of Vaeroy, the uniquely constructed Norwegian Lundehund is the only dog breed created for the job of puffin hunting. With puffins now a protected species, today’s Lundehund is a friendly, athletic companion.",
        "The Pharaoh Hound, ancient \"Blushing Dog\" of Malta, is an elegant but rugged sprinting hound bred to course small game over punishing terrain. Quick and tenacious on scent, these friendly, affectionate hounds settle down nicely at home.",
        "A solidly compact dog of vivid personality, the Scottish Terrier is an independent, confident companion of high spirits. Scotties have a dignified, almost-human character.",
        "The Tosa's temperament is marked by patience, composure, boldness and courage. He is normally a tranquil, quiet, and obedient dog, with a calm but vigilant demeanor."
    ]
    
    // Dictionary to store dog name and description
    @State private var dogDict: [String:String] = [:]
    
    //State variable for the selected dog decription
    @State private var selectedDescription: String? = nil
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            
            // Introduction
            Text("Tap on the dog to see the description")
                .background(Color.black)
                .font(.largeTitle)
            //    .fontWeight(.bold)
                .foregroundColor(Color.yellow)
                .multilineTextAlignment(.center)
                .padding([.bottom], 30)
            //    .underline()
            
            // Dog images
            LazyVGrid(columns: columns, spacing:20){
                ForEach(dogNames, id: \.self) { dogName in
                    Image(dogName)
                        .resizable()
                        .scaledToFit()
                        .frame(width:100, height:100)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .onTapGesture {self.selectedDescription = self.dogDict[dogName]}
                }
            }
            
            // Selected dog description
            if let description = selectedDescription {
                Text(description)
                    .padding()
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity)
                    .background(Color.secondary.opacity(0.1))
                    .cornerRadius(10)
            } else {
                Text("Choose a dog to see its description.")
                    .italic()
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            self.dogDict = Dictionary(uniqueKeysWithValues: zip(self.dogNames, self.dogDescriptions))
        }
    }
}

#Preview {
    ContentView()
}
