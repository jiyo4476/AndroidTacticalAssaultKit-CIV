#ifndef TAK_ENGINE_MODEL_SCENEINFO_H_INCLUDED
#define TAK_ENGINE_MODEL_SCENEINFO_H_INCLUDED

#include "port/String.h"
#include "port/Set.h"
#include "core/GeoPoint2.h"
#include "feature/AltitudeMode.h"
#include "feature/Envelope2.h"
#include "math/Point2.h"
#include "math/Matrix2.h"
#include "model/ResourceMapper.h"
#include "port/Collection.h"
#include "model/Georeferencer.h"

namespace TAK {
    namespace Engine {
        namespace Model {

            struct ENGINE_API SceneInfo {
                enum CapabilitiesType {
                    AltitudeAdjustable = 1 << 0,
                    BoundsAdjustable = 1 << 1,
                    OpacityAdjustable = 1 << 2,
                    XRay = 1 << 3,
                    MaterialColor = 1 << 4,
                    ManualColor = 1 << 5,
                    IntensityColor = 1 << 6,
                    ZValueColor = 1 << 7,
                    All = AltitudeAdjustable | BoundsAdjustable | OpacityAdjustable | XRay | MaterialColor | ManualColor | IntensityColor |
                          ZValueColor,
                };

                static constexpr unsigned int DEFAULT_XRAY_COLOR = 0x3F07FFFFu;

                /**
                 * minimum display threshold, in meters-per-pixel
                 */
	            double minDisplayResolution;
                /**
                 * maximum display threshold, in meters-per-pixel
                 */
	            double maxDisplayResolution;
                /**
                 * nominal resolution (in meters-per-pixel) of scene at LOD 0.
                 */
                double resolution;

	            Port::String uri;
				
	            Port::String name;
				
	            Port::String type;
				
                Core::GeoPoint2Ptr location;
				
                /**
                 * Returns the local frame matrix used to convert vertex position data into
                 * the Spatial Reference. If <code>null</code>, the vertex position data is
                 * already in the Spatial Reference Coordinate System and no local frame is
                 * used.
                 */
	            Math::Matrix2Ptr_const localFrame;

                ResourceAliasCollectionPtr resourceAliases;

	            Feature::AltitudeMode altitudeMode;

                CapabilitiesType capabilities;

                unsigned int xrayColor;
				
                /**
                 * The AABB for the scene, in the LCS, if known.
                 */
                Feature::Envelope2Ptr aabb;

                /**
                 * Returns the Spatial Reference ID (EPSG code) for the position vertex
                 * data of the model. If a value of <code>-1</code> is returned, the model
                 * is not georeferenced.
                 */
	            int srid;

                SceneInfo() NOTHROWS;

	            SceneInfo(const SceneInfo &other) NOTHROWS;

	            ~SceneInfo() NOTHROWS;

                SceneInfo &operator=(const SceneInfo &other) NOTHROWS;
            };

            inline SceneInfo::CapabilitiesType operator|(SceneInfo::CapabilitiesType a, SceneInfo::CapabilitiesType b) {
                return static_cast<SceneInfo::CapabilitiesType>(static_cast<unsigned short>(a) | static_cast<unsigned short>(b));
            }

            inline SceneInfo::CapabilitiesType operator&(SceneInfo::CapabilitiesType a, SceneInfo::CapabilitiesType b) {
                return static_cast<SceneInfo::CapabilitiesType>(static_cast<unsigned short>(a) & static_cast<unsigned short>(b));
            }

            typedef std::shared_ptr<SceneInfo> SceneInfoPtr;

            ENGINE_API Util::TAKErr SceneInfo_getBoundingBoxWGS84(Feature::Envelope2 *value, const SceneInfo &info) NOTHROWS;

            class ENGINE_API SceneInfoSpi {
            public:
                virtual ~SceneInfoSpi() NOTHROWS;
                virtual int getPriority() const NOTHROWS = 0;
                virtual const char *getName() const NOTHROWS = 0;
                virtual bool isSupported(const char *path) NOTHROWS = 0;
                virtual TAK::Engine::Util::TAKErr create(TAK::Engine::Port::Collection<SceneInfoPtr> &scenes, const char *path) NOTHROWS = 0;
            };

            ENGINE_API TAK::Engine::Util::TAKErr SceneInfoFactory_registerSpi(const std::shared_ptr<SceneInfoSpi> &spiPtr) NOTHROWS;
            ENGINE_API TAK::Engine::Util::TAKErr SceneInfoFactory_unregisterSpi(const std::shared_ptr<SceneInfoSpi> &spiPtr) NOTHROWS;
            ENGINE_API TAK::Engine::Util::TAKErr SceneInfoFactory_create(TAK::Engine::Port::Collection<SceneInfoPtr> &scenes, const char *path, const char *hint) NOTHROWS;
            ENGINE_API bool SceneInfoFactory_isSupported(const char *path, const char *hint) NOTHROWS;
            ENGINE_API TAK::Engine::Util::TAKErr SceneInfoFactory_registerGeoreferencer(const std::shared_ptr<Georeferencer> &georeferencer) NOTHROWS;
            ENGINE_API TAK::Engine::Util::TAKErr SceneInfoFactory_unregisterGeoreferencer(const std::shared_ptr<Georeferencer> &georeferencer) NOTHROWS;
        }
    }
}

#endif