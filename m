From: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v9 01/10] drm/mediatek: rename macros, add chip prefix
Date: Fri, 11 Nov 2016 19:55:37 +0800
Message-ID: <1478865346-19043-2-git-send-email-yt.shen@mediatek.com>
References: <1478865346-19043-1-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1478865346-19043-1-git-send-email-yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Chris Wilson <chris-Y6uKTt2uX1cEflXRtASbqLVCufUGDwFn@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jie Qiu <jie.qiu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Mao Huang <littlecvr-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bibby Hsieh <bibby.hsieh-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Jitao Shi <jitao.shi-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, shaoming chen <shaoming.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Add MT8173 prefix for hardware related macros.

Signed-off-by: YT Shen <yt.shen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 60 +++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index 17ba935..2fc4321 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -36,21 +36,21 @@
 #define DISP_REG_MUTEX_MOD(n)	(0x2c + 0x20 * (n))
 #define DISP_REG_MUTEX_SOF(n)	(0x30 + 0x20 * (n))
 
-#define MUTEX_MOD_DISP_OVL0		BIT(11)
-#define MUTEX_MOD_DISP_OVL1		BIT(12)
-#define MUTEX_MOD_DISP_RDMA0		BIT(13)
-#define MUTEX_MOD_DISP_RDMA1		BIT(14)
-#define MUTEX_MOD_DISP_RDMA2		BIT(15)
-#define MUTEX_MOD_DISP_WDMA0		BIT(16)
-#define MUTEX_MOD_DISP_WDMA1		BIT(17)
-#define MUTEX_MOD_DISP_COLOR0		BIT(18)
-#define MUTEX_MOD_DISP_COLOR1		BIT(19)
-#define MUTEX_MOD_DISP_AAL		BIT(20)
-#define MUTEX_MOD_DISP_GAMMA		BIT(21)
-#define MUTEX_MOD_DISP_UFOE		BIT(22)
-#define MUTEX_MOD_DISP_PWM0		BIT(23)
-#define MUTEX_MOD_DISP_PWM1		BIT(24)
-#define MUTEX_MOD_DISP_OD		BIT(25)
+#define MT8173_MUTEX_MOD_DISP_OVL0		BIT(11)
+#define MT8173_MUTEX_MOD_DISP_OVL1		BIT(12)
+#define MT8173_MUTEX_MOD_DISP_RDMA0		BIT(13)
+#define MT8173_MUTEX_MOD_DISP_RDMA1		BIT(14)
+#define MT8173_MUTEX_MOD_DISP_RDMA2		BIT(15)
+#define MT8173_MUTEX_MOD_DISP_WDMA0		BIT(16)
+#define MT8173_MUTEX_MOD_DISP_WDMA1		BIT(17)
+#define MT8173_MUTEX_MOD_DISP_COLOR0		BIT(18)
+#define MT8173_MUTEX_MOD_DISP_COLOR1		BIT(19)
+#define MT8173_MUTEX_MOD_DISP_AAL		BIT(20)
+#define MT8173_MUTEX_MOD_DISP_GAMMA		BIT(21)
+#define MT8173_MUTEX_MOD_DISP_UFOE		BIT(22)
+#define MT8173_MUTEX_MOD_DISP_PWM0		BIT(23)
+#define MT8173_MUTEX_MOD_DISP_PWM1		BIT(24)
+#define MT8173_MUTEX_MOD_DISP_OD		BIT(25)
 
 #define MUTEX_SOF_SINGLE_MODE		0
 #define MUTEX_SOF_DSI0			1
@@ -80,21 +80,21 @@ struct mtk_ddp {
 };
 
 static const unsigned int mutex_mod[DDP_COMPONENT_ID_MAX] = {
-	[DDP_COMPONENT_AAL] = MUTEX_MOD_DISP_AAL,
-	[DDP_COMPONENT_COLOR0] = MUTEX_MOD_DISP_COLOR0,
-	[DDP_COMPONENT_COLOR1] = MUTEX_MOD_DISP_COLOR1,
-	[DDP_COMPONENT_GAMMA] = MUTEX_MOD_DISP_GAMMA,
-	[DDP_COMPONENT_OD] = MUTEX_MOD_DISP_OD,
-	[DDP_COMPONENT_OVL0] = MUTEX_MOD_DISP_OVL0,
-	[DDP_COMPONENT_OVL1] = MUTEX_MOD_DISP_OVL1,
-	[DDP_COMPONENT_PWM0] = MUTEX_MOD_DISP_PWM0,
-	[DDP_COMPONENT_PWM1] = MUTEX_MOD_DISP_PWM1,
-	[DDP_COMPONENT_RDMA0] = MUTEX_MOD_DISP_RDMA0,
-	[DDP_COMPONENT_RDMA1] = MUTEX_MOD_DISP_RDMA1,
-	[DDP_COMPONENT_RDMA2] = MUTEX_MOD_DISP_RDMA2,
-	[DDP_COMPONENT_UFOE] = MUTEX_MOD_DISP_UFOE,
-	[DDP_COMPONENT_WDMA0] = MUTEX_MOD_DISP_WDMA0,
-	[DDP_COMPONENT_WDMA1] = MUTEX_MOD_DISP_WDMA1,
+	[DDP_COMPONENT_AAL] = MT8173_MUTEX_MOD_DISP_AAL,
+	[DDP_COMPONENT_COLOR0] = MT8173_MUTEX_MOD_DISP_COLOR0,
+	[DDP_COMPONENT_COLOR1] = MT8173_MUTEX_MOD_DISP_COLOR1,
+	[DDP_COMPONENT_GAMMA] = MT8173_MUTEX_MOD_DISP_GAMMA,
+	[DDP_COMPONENT_OD] = MT8173_MUTEX_MOD_DISP_OD,
+	[DDP_COMPONENT_OVL0] = MT8173_MUTEX_MOD_DISP_OVL0,
+	[DDP_COMPONENT_OVL1] = MT8173_MUTEX_MOD_DISP_OVL1,
+	[DDP_COMPONENT_PWM0] = MT8173_MUTEX_MOD_DISP_PWM0,
+	[DDP_COMPONENT_PWM1] = MT8173_MUTEX_MOD_DISP_PWM1,
+	[DDP_COMPONENT_RDMA0] = MT8173_MUTEX_MOD_DISP_RDMA0,
+	[DDP_COMPONENT_RDMA1] = MT8173_MUTEX_MOD_DISP_RDMA1,
+	[DDP_COMPONENT_RDMA2] = MT8173_MUTEX_MOD_DISP_RDMA2,
+	[DDP_COMPONENT_UFOE] = MT8173_MUTEX_MOD_DISP_UFOE,
+	[DDP_COMPONENT_WDMA0] = MT8173_MUTEX_MOD_DISP_WDMA0,
+	[DDP_COMPONENT_WDMA1] = MT8173_MUTEX_MOD_DISP_WDMA1,
 };
 
 static unsigned int mtk_ddp_mout_en(enum mtk_ddp_comp_id cur,
-- 
1.9.1
