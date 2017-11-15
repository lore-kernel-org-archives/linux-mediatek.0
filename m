From: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [POC 01/16] drm/img-rogue: fix signatures of struct
 devfreq_cooling_power ops
Date: Wed, 15 Nov 2017 16:24:08 +0100
Message-ID: <1510759463-30201-2-git-send-email-ulrich.hecht+renesas@gmail.com>
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

Has a struct devfreq pointer now.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/img-rogue/1.6/mt8173/mt8173_sysconfig.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/img-rogue/1.6/mt8173/mt8173_sysconfig.c b/drivers/gpu/drm/img-rogue/1.6/mt8173/mt8173_sysconfig.c
index 14f7dcc..bbda6ff 100644
--- a/drivers/gpu/drm/img-rogue/1.6/mt8173/mt8173_sysconfig.c
+++ b/drivers/gpu/drm/img-rogue/1.6/mt8173/mt8173_sysconfig.c
@@ -245,7 +245,8 @@ static u32 interpolate(int value, const int *x, const unsigned int *y, int len)
 	return ret;
 }
 
-static unsigned long mtk_mfg_get_static_power(unsigned long voltage)
+static unsigned long mtk_mfg_get_static_power(struct devfreq *devfreq,
+					      unsigned long voltage)
 {
 	struct mtk_mfg *mfg = gsDevice.hSysData;
 	struct thermal_zone_device *tz = mfg->tz;
@@ -299,7 +300,8 @@ static unsigned long mtk_mfg_get_static_power(unsigned long voltage)
 	return power;
 }
 
-static unsigned long mtk_mfg_get_dynamic_power(unsigned long freq,
+static unsigned long mtk_mfg_get_dynamic_power(struct devfreq *devfreq,
+					       unsigned long freq,
 					       unsigned long voltage)
 {
 	#define NUM_RANGE  ARRAY_SIZE(f_range)
-- 
2.7.4
