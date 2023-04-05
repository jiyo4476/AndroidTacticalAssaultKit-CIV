# Support script for mapengine/CMakeLists.txt that sets sources, definitions, includes, link libraries, link directories,
# and compiler options that are used for all platform targets.

set(takenginejni_COMMON_INCS
    ../cpp
    ${SRC_DIR}
    ${tinygltf-tak_INCLUDE_DIRS}
    ${tinygltfloader-tak_INCLUDE_DIRS}
    ${ttp-dist_INCLUDE_DIRS}
)

set(takenginejni_COMMON_SRCS
    ${SRC_DIR}/atakjni.cpp
    ${SRC_DIR}/c3dt/GLTF.cpp
    ${SRC_DIR}/c3dt/GLTFRenderer.cpp
    ${SRC_DIR}/c3dt/GLTFRenderer_v1.cpp
    ${SRC_DIR}/c3dt/GLTFRenderer_v2.cpp
    ${SRC_DIR}/c3dt/GLTFv1.cpp
    ${SRC_DIR}/c3dt/GLTFv2.cpp
    ${SRC_DIR}/c3dt/jgltf.cpp
    ${SRC_DIR}/c3dt/shaders.cpp
    ${SRC_DIR}/c3dt/tiny_gltf.cpp
    ${SRC_DIR}/c3dt/tiny_gltf_loader.cpp
    ${SRC_DIR}/common.cpp
    ${SRC_DIR}/interop/core/Interop.cpp
    ${SRC_DIR}/interop/core/ManagedLayer.cpp
    ${SRC_DIR}/interop/core/ManagedMapRenderer2.cpp
    ${SRC_DIR}/interop/core/ManagedProjection.cpp
    ${SRC_DIR}/interop/core/ManagedRenderContext.cpp
    ${SRC_DIR}/interop/core/ManagedRenderSurface.cpp
    ${SRC_DIR}/interop/core/ManagedVisibilityListener.cpp
    ${SRC_DIR}/interop/db/Interop.cpp
    ${SRC_DIR}/interop/db/ManagedDatabaseProvider.cpp
    ${SRC_DIR}/interop/db/ManagedDatabase2.cpp
    ${SRC_DIR}/interop/db/ManagedStatement.cpp
    ${SRC_DIR}/interop/db/ManagedQuery.cpp
    ${SRC_DIR}/interop/elevation/Interop.cpp
    ${SRC_DIR}/interop/elevation/ManagedElevationChunk.cpp
    ${SRC_DIR}/interop/elevation/ManagedElevationSource.cpp
    ${SRC_DIR}/interop/feature/Interop.cpp
    ${SRC_DIR}/interop/feature/ManagedFeatureDataSource2.cpp
    ${SRC_DIR}/interop/java/JNICollection.cpp
    ${SRC_DIR}/interop/java/JNIEnum.cpp
    ${SRC_DIR}/interop/java/JNIIterator.cpp
    ${SRC_DIR}/interop/java/JNILocalRef.cpp
    ${SRC_DIR}/interop/java/JNIPair.cpp
    ${SRC_DIR}/interop/java/JNIPrimitive.cpp
    ${SRC_DIR}/interop/java/JNIRunnable.cpp
    ${SRC_DIR}/interop/JNIByteArray.cpp
    ${SRC_DIR}/interop/JNIDoubleArray.cpp
    ${SRC_DIR}/interop/JNIFloatArray.cpp
    ${SRC_DIR}/interop/JNIIntArray.cpp
    ${SRC_DIR}/interop/JNILongArray.cpp
    ${SRC_DIR}/interop/JNINotifyCallback.cpp
    ${SRC_DIR}/interop/JNIStringUTF.cpp
    ${SRC_DIR}/interop/math/Interop.cpp
    ${SRC_DIR}/interop/math/ManagedGeometryModel.cpp
    ${SRC_DIR}/interop/model/Interop.cpp
    ${SRC_DIR}/interop/Pointer.cpp
    ${SRC_DIR}/interop/formats/quantizedmesh/Interop.cpp
    ${SRC_DIR}/interop/formats/quantizedmesh/ManagedQMESourceLayer.cpp
    ${SRC_DIR}/interop/renderer/core/Interop.cpp
    ${SRC_DIR}/interop/renderer/core/ManagedGLLayer2.cpp
    ${SRC_DIR}/interop/renderer/core/ManagedGLLayerSpi2.cpp
    ${SRC_DIR}/interop/renderer/core/ManagedGLMapRenderable2.cpp
    ${SRC_DIR}/interop/renderer/ManagedTextFormat2.cpp
    ${SRC_DIR}/interop/util/ManagedDataInput2.cpp
    ${SRC_DIR}/interop/util/ManagedDataOutput2.cpp
    ${SRC_DIR}/jattributeset.cpp
    ${SRC_DIR}/jcameracontroller.cpp
    ${SRC_DIR}/jconfigoptions.cpp
    ${SRC_DIR}/jdatabaseimpl.cpp
    ${SRC_DIR}/jdatatype.cpp
    ${SRC_DIR}/jdrginfo.cpp
    ${SRC_DIR}/jdtedelevationsource.cpp
    ${SRC_DIR}/jegm96.cpp
    ${SRC_DIR}/jelevationheatmaplayer.cpp
    ${SRC_DIR}/jelevationmanager.cpp
    ${SRC_DIR}/jelevationsourcemanager.cpp
    ${SRC_DIR}/jelmgrterrainrenderservice.cpp
    ${SRC_DIR}/jenginelibrary.cpp
    ${SRC_DIR}/jfeature.cpp
    ${SRC_DIR}/jfrustum.cpp
    ${SRC_DIR}/jgdallibrary.cpp
    ${SRC_DIR}/jgeocalculations.cpp
    ${SRC_DIR}/jgeomagneticfield.cpp
    ${SRC_DIR}/jgeometry.cpp
    ${SRC_DIR}/jgeometryfactory.cpp
    ${SRC_DIR}/jgllabelmanager.cpp
    ${SRC_DIR}/jgllayerfactory.cpp
    ${SRC_DIR}/jgllinebatch.cpp
    ${SRC_DIR}/jglmapview.cpp
    ${SRC_DIR}/jglninepatch.cpp
    ${SRC_DIR}/jglobe.cpp
    ${SRC_DIR}/jglquadtilenode2.cpp
    ${SRC_DIR}/jglrenderbatch2.cpp
    ${SRC_DIR}/jglrenderglobals.cpp
    ${SRC_DIR}/jgltext.cpp
    ${SRC_DIR}/jioproviderfactory.cpp
    ${SRC_DIR}/jmapprojectiondisplaymodel.cpp
    ${SRC_DIR}/jmapscenemodel.cpp
    ${SRC_DIR}/jmatrix.cpp
    ${SRC_DIR}/jmesh.cpp
    ${SRC_DIR}/jmodelbuilder.cpp
    ${SRC_DIR}/jmodels.cpp
    ${SRC_DIR}/jmsaccessdatabasefactory.cpp
    ${SRC_DIR}/jmvtfeaturedatasource.cpp
    ${SRC_DIR}/jnativeelevationchunk.cpp
    ${SRC_DIR}/jnativeelevationsource.cpp
    ${SRC_DIR}/jnativeelevationsourcecursor.cpp
    ${SRC_DIR}/jnativefeaturecursor.cpp
    ${SRC_DIR}/jnativefeaturedatasource.cpp
    ${SRC_DIR}/jnativefeaturedatastore.cpp
    ${SRC_DIR}/jnativefeaturesetcursor.cpp
    ${SRC_DIR}/jnativefilecursor.cpp
    ${SRC_DIR}/jnativegeometrymodel.cpp
    ${SRC_DIR}/jnativegllayer3.cpp
    ${SRC_DIR}/jnativegllayerspi2.cpp
    ${SRC_DIR}/jnativeglmaprenderable2.cpp
    ${SRC_DIR}/jnativelayer.cpp
    ${SRC_DIR}/jnativemodel.cpp
    ${SRC_DIR}/jnativeprojection.cpp
    ${SRC_DIR}/jnativerendersurfacesizechangedlistener.cpp
    ${SRC_DIR}/jnativerunnable.cpp
    ${SRC_DIR}/josrutils.cpp
    ${SRC_DIR}/jpersistentdatasourcefeaturedatastore2.cpp
    ${SRC_DIR}/jpersistentrasterdatastore.cpp
    ${SRC_DIR}/jprojectionfactory.cpp
    ${SRC_DIR}/jqmesourcemanager.cpp
    ${SRC_DIR}/jqueryimpl.cpp
    ${SRC_DIR}/jrendercontextinterop.cpp
    ${SRC_DIR}/jskirt.cpp
    ${SRC_DIR}/jstatementimpl.cpp
    ${SRC_DIR}/jstyle.cpp
    ${SRC_DIR}/jterrainslopelayer.cpp
    ${SRC_DIR}/jtessellate.cpp
    ${SRC_DIR}/jtilecoord.cpp
    ${SRC_DIR}/junsafe.cpp
    ${SRC_DIR}/jvertexdatalayout.cpp
    ${SRC_DIR}/jzipcommentgeoreferencer.cpp
    ${SRC_DIR}/ManagedModel.cpp
    ${SRC_DIR}/vsi_jfile.cpp
)
