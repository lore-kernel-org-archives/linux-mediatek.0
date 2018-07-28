From: Souptick Joarder <jrdr.linux@gmail.com>
Subject: [PATCH] drm/mediatek: Convert drm_atomic_helper_suspend/resume()
Date: Sat, 28 Jul 2018 19:08:45 +0530
Message-ID: <20180728133845.GA15261@jordon-HP-15-Notebook-PC>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: ck.hu@mediatek.com, p.zabel@pengutronix.de, airlied@linux.ie, matthias.bgg@gmail.com, ajitn.linux@gmail.com
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

convert drm_atomic_helper_suspend/resume() to use
drm_mode_config_helper_suspend/resume().

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Signed-off-by: Ajit Negi <ajitn.linux@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a2ca90f..1fcda2de 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -520,29 +520,24 @@ static int mtk_drm_sys_suspend(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
 	struct drm_device *drm = private->drm;
+	int ret;
 
-	drm_kms_helper_poll_disable(drm);
-
-	private->suspend_state = drm_atomic_helper_suspend(drm);
-	if (IS_ERR(private->suspend_state)) {
-		drm_kms_helper_poll_enable(drm);
-		return PTR_ERR(private->suspend_state);
-	}
-
+	ret = drm_mode_config_helper_suspend(drm);
 	DRM_DEBUG_DRIVER("mtk_drm_sys_suspend\n");
-	return 0;
+
+	return ret;
 }
 
 static int mtk_drm_sys_resume(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
 	struct drm_device *drm = private->drm;
+	int ret;
 
-	drm_atomic_helper_resume(drm, private->suspend_state);
-	drm_kms_helper_poll_enable(drm);
-
+	ret = drm_mode_config_helper_resume(drm);
 	DRM_DEBUG_DRIVER("mtk_drm_sys_resume\n");
-	return 0;
+
+	return ret;
 }
 #endif
 
-- 
1.9.1
