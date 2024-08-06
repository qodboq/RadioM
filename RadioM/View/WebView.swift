//
//  Program.swift
//  RadioM
//
//  Created by Erik Valigurský on 06/08/2024.
//

import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: UIViewType, context: Context) {
        let url = URL(string: "https://www.radiomaria.sk")
        if let url = url {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
}

#Preview {
    WebView()
}
 
