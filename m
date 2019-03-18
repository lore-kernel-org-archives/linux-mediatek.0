From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH] gpu/drm: mediatek: call mtk_dsi_stop() after
 mtk_drm_crtc_atomic_disable()
Date: Mon, 18 Mar 2019 12:09:15 +0800
Message-ID: <20190318040915.101218-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

mtk_dsi_stop() should be called after mtk_drm_crtc_atomic_disable(), which needs
ovl irq for drm_crtc_wait_one_vblank(), since after mtk_dsi_stop() is called,
ovl irq will be disabled. If drm_crtc_wait_one_vblank() is called after last
irq, it will timeout with this message: "vblank wait timed out on crtc 0". This
happens sometimes when turning off the screen.

In drm_atomic_helper.c#disable_outputs(),
the calling sequence when turning off the screen is:

1. mtk_dsi_encoder_disable()
     --> mtk_output_dsi_disable()
       --> mtk_dsi_stop();  // sometimes make vblank timeout in atomic_disable
         --> mtk_dsi_poweroff();
2. mtk_drm_crtc_atomic_disable()
     --> drm_crtc_wait_one_vblank();
     ...
       --> mtk_dsi_ddp_stop()
         --> mtk_dsi_poweroff();

Change to make mtk_dsi_stop() called in mtk_dsi_ddp_stop() instead of
mtk_output_dsi_disable().

Fixes: 0707632b5bac ("drm/mediatek: update DSI sub driver flow for sending commands to panel")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index b00eb2d2e086..cdd9637dd517 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -696,7 +696,6 @@ static void mtk_output_dsi_disable(struct mtk_dsi *dsi)
 		}
 	}
 
-	mtk_dsi_stop(dsi);
 	mtk_dsi_poweroff(dsi);
 
 	dsi->enabled = false;
@@ -857,6 +856,7 @@ static void mtk_dsi_ddp_stop(struct mtk_ddp_comp *comp)
 {
 	struct mtk_dsi *dsi = container_of(comp, struct mtk_dsi, ddp_comp);
 
+	mtk_dsi_stop(dsi);
 	mtk_dsi_poweroff(dsi);
 }
 
@@ -1178,6 +1178,8 @@ static int mtk_dsi_remove(struct platform_device *pdev)
 	struct mtk_dsi *dsi = platform_get_drvdata(pdev);
 
 	mtk_output_dsi_disable(dsi);
+	mtk_dsi_stop(dsi);
+	mtk_dsi_poweroff(dsi);
 	component_del(&pdev->dev, &mtk_dsi_component_ops);
 
 	return 0;
-- 
2.20.1
