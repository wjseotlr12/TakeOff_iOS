//
//  PostUploadViewModel.swift
//  TakeOff
//
//  Created by Jun on 2021/09/06.
//

import Foundation
import RxSwift
import RxCocoa
import Photos
import UIKit

class PostUploadViewModel {
    static let instance = PostUploadViewModel()
   
    
    let disposeBag = DisposeBag()
    
    var selectedImage:[UIImage] = []
    
    var totalImage = PublishRelay<[UIImage]>()
    
    init() {
        
        
    }
    
    
    /**
        사진 파일 가져오기 옵션값 리턴
     */
    fileprivate func assetsFetchOptions() -> PHFetchOptions {
        let fetchOptions = PHFetchOptions()
        fetchOptions.fetchLimit = 30
        
        let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: false)
        fetchOptions.sortDescriptors = [sortDescriptor]
        return fetchOptions
    }
    
    
    /**
     사진 App에 있는 사진 이미지를 Observable로 하나씩 리턴
     */
    func fetchPhotos() -> Observable<[UIImage]> {
        let allPhotos = PHAsset.fetchAssets(with: .image, options: assetsFetchOptions())
        
        return Observable.create { observe in
            var images:[UIImage] = []
            allPhotos.enumerateObjects { asset, count, stop in
                let imageManager = PHImageManager.default()
                let targetSize = CGSize(width: 100, height: 100)
                let options = PHImageRequestOptions()
                options.deliveryMode = .highQualityFormat
                options.isSynchronous = true
                imageManager.requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFit, options: options) { image, info in
                    if let image = image {
                        images.append(image)
                    }
                }
            }
            observe.onNext(images)
            observe.onCompleted()
            return Disposables.create()
        }
    }
    
    
}

