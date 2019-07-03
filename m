From: Derek Basehore <dbasehore@chromium.org>
Subject: [PATCH v5 4/4] drm/mtk: add panel orientation property
Date: Wed,  3 Jul 2019 16:02:10 -0700
Message-ID: <20190703230210.85342-5-dbasehore@chromium.org>
References: <20190703230210.85342-1-dbasehore@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190703230210.85342-1-dbasehore@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Derek Basehore <dbasehore@chromium.org>
List-Id: linux-mediatek@lists.infradead.org

This inits the panel orientation property for the mediatek dsi driver
if the panel orientation (connector.display_info.panel_orientation) is
not DRM_MODE_PANEL_ORIENTATION_UNKNOWN.

Signed-off-by: Derek Basehore <dbasehore@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index b91c4616644a..2920458ae2fb 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -790,10 +790,18 @@ static int mtk_dsi_create_connector(struct drm_device *drm, struct mtk_dsi *dsi)
 			DRM_ERROR("Failed to attach panel to drm\n");
 			goto err_connector_cleanup;
 		}
+
+		ret = drm_connector_init_panel_orientation_property(&dsi->conn);
+		if (ret) {
+			DRM_ERROR("Failed to init panel orientation\n");
+			goto err_panel_detach;
+		}
 	}
 
 	return 0;
 
+err_panel_detach:
+	drm_panel_detach(dsi->panel);
 err_connector_cleanup:
 	drm_connector_cleanup(&dsi->conn);
 	return ret;
-- 
2.22.0.410.gd8fdbe21b5-goog
