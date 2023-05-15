# Riverpod pattern

## Riverpod state management system

>**Objective**  
> - Learning riverpod.  
> - Standard structure with riverpod.   

## How does it work? 

### Structure in modules
```
_/lib/app

    #all data related files will go here
     - data
     
       #all data model will go here
       - models
         - photo_response.dart
         - post_response.dart
         
       #this is our middleman. The responsibility of the repository is to provide data to controller. Also we cal call it viewmodel
       #also we have implemented a repository provider to provide repository instances via provider
       - repository
         - photo_repository.dart
         - post_repository.dart
         - repository_provider.dart
         
       # service will provide all api data to repository
       # service provider to provide service instances via provider
       - service
         - photo_service.dart
         - post_service.dart
         - service_provider.dart
       
     
     #all extension files will go here like (padding,mergin,validation)
     - extension
       - paddding_extension.dart
     
     #all screen related files will go here
     - modules
       - home
         - home_provider.dart
         - home_screen.dart
     
     # main file which will be called for the first time.
     - main.dart

```
