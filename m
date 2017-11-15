From: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [POC 13/16] drm/img-rogue: enable img-rogue driver in Kconfig/Makefile
Date: Wed, 15 Nov 2017 16:24:20 +0100
Message-ID: <1510759463-30201-14-git-send-email-ulrich.hecht+renesas@gmail.com>
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

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/Kconfig           | 2 ++
 drivers/gpu/drm/Makefile          | 2 ++
 drivers/gpu/drm/img-rogue/Kconfig | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 83cb2a8..492188f 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -268,6 +268,8 @@ source "drivers/gpu/drm/hisilicon/Kconfig"
 
 source "drivers/gpu/drm/mediatek/Kconfig"
 
+source "drivers/gpu/drm/img-rogue/Kconfig"
+
 source "drivers/gpu/drm/zte/Kconfig"
 
 source "drivers/gpu/drm/mxsfb/Kconfig"
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 8ce0703..076fa7d 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -89,6 +89,8 @@ obj-$(CONFIG_DRM_STM) += stm/
 obj-$(CONFIG_DRM_STI) += sti/
 obj-$(CONFIG_DRM_IMX) += imx/
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek/
+obj-$(CONFIG_DRM_POWERVR_ROGUE_1_6) += img-rogue/1.6/
+obj-$(CONFIG_DRM_POWERVR_ROGUE) += img-rogue/
 obj-$(CONFIG_DRM_MESON)	+= meson/
 obj-y			+= i2c/
 obj-y			+= panel/
diff --git a/drivers/gpu/drm/img-rogue/Kconfig b/drivers/gpu/drm/img-rogue/Kconfig
index 700d89c..78c5110 100644
--- a/drivers/gpu/drm/img-rogue/Kconfig
+++ b/drivers/gpu/drm/img-rogue/Kconfig
@@ -24,6 +24,7 @@ config DRM_POWERVR_ROGUE_1_6
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select PM_OPP
 	select DEVFREQ_THERMAL
+	select THERMAL
 	help
 	  Driver for PowerVR Rogue graphics hardware, 1.6.
 
-- 
2.7.4
