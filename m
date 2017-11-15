From: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [POC 11/16] drm/img-rogue: replace call to obsolete
 drm_platform_init()
Date: Wed, 15 Nov 2017 16:24:18 +0100
Message-ID: <1510759463-30201-12-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1510759463-30201-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1510759463-30201-1-git-send-email-ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mbrugger-IBi9RG/b67k@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Use drm_dev_alloc(), drm_dev_register() and remove the .load and .unload
methods from drm_driver.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/img-rogue/1.6/mt8173/mtk_module.c | 14 +++++++++++--
 drivers/gpu/drm/img-rogue/1.6/pvr_drm.c           | 24 +----------------------
 2 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/img-rogue/1.6/mt8173/mtk_module.c b/drivers/gpu/drm/img-rogue/1.6/mt8173/mtk_module.c
index 5df3a15..1ef75bb 100644
--- a/drivers/gpu/drm/img-rogue/1.6/mt8173/mtk_module.c
+++ b/drivers/gpu/drm/img-rogue/1.6/mt8173/mtk_module.c
@@ -109,7 +109,7 @@ static struct platform_driver powervr_driver = {
 *****************************************************************************/
 int PVRSRVSystemInit(struct drm_device *pDrmDevice)
 {
-	struct platform_device *pDevice = pDrmDevice->platformdev;
+	struct platform_device *pDevice = to_platform_device(pDrmDevice->dev);
 	PVRSRV_ERROR err;
 
 	PVR_TRACE(("%s (pDevice=%p)", __func__, pDevice));
@@ -160,8 +160,10 @@ void PVRSRVSystemDeInit(struct platform_device *pDevice)
  @Return 0 for success or <0 for an error.
 
 *****************************************************************************/
+int PVRSRVDRMLoad(struct drm_device *dev, unsigned long flags);
 static int PVRSRVDriverProbe(struct platform_device *pDevice)
 {
+	struct drm_device *drm;
 	int result;
 
 	PVR_TRACE(("%s (pDevice=%p)", __func__, pDevice));
@@ -172,13 +174,21 @@ static int PVRSRVDriverProbe(struct platform_device *pDevice)
 			return result;
 	}
 
-	result = drm_platform_init(&sPVRDRMDriver, pDevice);
+	drm = drm_dev_alloc(&sPVRDRMDriver, &pDevice->dev);
+        if (IS_ERR(drm))
+		return PTR_ERR(drm);
+
+	platform_set_drvdata(pDevice, drm);
+
+	result = PVRSRVDRMLoad(drm, 0);
 
 	dma_set_mask(&pDevice->dev, DMA_BIT_MASK(33));
 
 	if (result == 0)
 		PVRSRVDeviceInit();
 
+	result = drm_dev_register(drm, 0);
+
 	return result;
 }
 
diff --git a/drivers/gpu/drm/img-rogue/1.6/pvr_drm.c b/drivers/gpu/drm/img-rogue/1.6/pvr_drm.c
index 7439a6f..36c5a76 100644
--- a/drivers/gpu/drm/img-rogue/1.6/pvr_drm.c
+++ b/drivers/gpu/drm/img-rogue/1.6/pvr_drm.c
@@ -107,17 +107,12 @@ DECLARE_WAIT_QUEUE_HEAD(sWaitForInit);
 IMG_BOOL bInitComplete;
 IMG_BOOL bInitFailed;
 
-static int PVRSRVDRMLoad(struct drm_device *dev, unsigned long flags)
+int PVRSRVDRMLoad(struct drm_device *dev, unsigned long flags)
 {
 	int iRes;
 
 	PVR_TRACE(("PVRSRVDRMLoad"));
 
-#if defined(LDM_PLATFORM)
-	/* The equivalent is done for PCI modesetting drivers by drm_get_pci_dev() */
-	platform_set_drvdata(dev->platformdev, dev);
-#endif
-
 	/* Module initialisation */
 	iRes = PVRSRVSystemInit(dev);
 	if (iRes != 0)
@@ -141,21 +136,6 @@ static int PVRSRVDRMLoad(struct drm_device *dev, unsigned long flags)
 	return iRes;
 }
 
-static int PVRSRVDRMUnload(struct drm_device *dev)
-{
-#if defined(LDM_PLATFORM)
-	LDM_DEV *pDevice = dev->platformdev;
-#elif defined(LDM_PCI)
-	LDM_DEV *pDevice = dev->pdev;
-#endif
-
-	PVR_TRACE(("PVRSRVDRMUnload"));
-
-	PVRSRVSystemDeInit(pDevice);
-
-	return 0;
-}
-
 static int PVRSRVDRMOpen(struct drm_device *dev, struct drm_file *file)
 {
 	while (!bInitComplete)
@@ -306,8 +286,6 @@ struct drm_driver sPVRDRMDriver =
 	.driver_features	= DRIVER_MODESET | DRIVER_RENDER,
 
 	.dev_priv_size		= 0,
-	.load			= PVRSRVDRMLoad,
-	.unload			= PVRSRVDRMUnload,
 	.open			= PVRSRVDRMOpen,
 	.postclose		= PVRSRVRelease,
 
-- 
2.7.4
