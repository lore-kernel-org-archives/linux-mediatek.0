From: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [POC 10/16] drm/img-rogue: remove .set_busid methods from drm_driver
Date: Wed, 15 Nov 2017 16:24:17 +0100
Message-ID: <1510759463-30201-11-git-send-email-ulrich.hecht+renesas@gmail.com>
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

No longer required.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/img-rogue/1.6/pvr_drm.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/img-rogue/1.6/pvr_drm.c b/drivers/gpu/drm/img-rogue/1.6/pvr_drm.c
index f72d382..7439a6f 100644
--- a/drivers/gpu/drm/img-rogue/1.6/pvr_drm.c
+++ b/drivers/gpu/drm/img-rogue/1.6/pvr_drm.c
@@ -332,16 +332,6 @@ struct drm_driver sPVRDRMDriver =
 	},
 #endif /* (LINUX_VERSION_CODE >= KERNEL_VERSION(3,3,0)) */
 
-#if (LINUX_VERSION_CODE >= KERNEL_VERSION(3,18,0))
-#if defined(LDM_PCI)
-	.set_busid      	= drm_pci_set_busid,
-#elif defined(LDM_PLATFORM)
-	.set_busid      	= drm_platform_set_busid,
-#else
-#error "LDM_PLATFORM or LDM_PCI must be defined"
-#endif
-#endif /* (LINUX_VERSION_CODE >= KERNEL_VERSION(3,18,0)) */
-
 	.name			= PVR_DRM_NAME,
 	.desc			= PVR_DRM_DESC,
 	.date			= PVR_DRM_DATE,
-- 
2.7.4
