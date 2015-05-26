From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 1/2] soc: mediatek: PMIC wrap: Fix clock rate handling
Date: Tue, 26 May 2015 11:37:43 +0200
Message-ID: <1432633064-16839-2-git-send-email-s.hauer@pengutronix.de>
References: <1432633064-16839-1-git-send-email-s.hauer@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1432633064-16839-1-git-send-email-s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?q?HenryC=20Chen=20=28=E9=99=B3=E5=BB=BA=E8=B1=AA=29?= <HenryC.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

replace chipselect extension values based on SPI clock with hardcoded SoC
specific values.

The PMIC wrapper has the ability of extending the chipselects by configurable
amounts of time. We configured the values based on the rate of SPI clock, but
this is wrong. The delays should be configured based on the internal PMIC clock
that latches the values from the SPI bus to the internal PMIC registers. By
default this clock is 24MHz. Other clock frequencies are for debugging only
and can be removed from the driver.

Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 42 ++++++------------------------------
 1 file changed, 7 insertions(+), 35 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index db5be1e..642d6a1 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -563,45 +563,17 @@ static int pwrap_init_sidly(struct pmic_wrapper *wrp)
 
 static int pwrap_init_reg_clock(struct pmic_wrapper *wrp)
 {
-	unsigned long rate_spi;
-	int ck_mhz;
-
-	rate_spi = clk_get_rate(wrp->clk_spi);
-
-	if (rate_spi > 26000000)
-		ck_mhz = 26;
-	else if (rate_spi > 18000000)
-		ck_mhz = 18;
-	else
-		ck_mhz = 0;
-
-	switch (ck_mhz) {
-	case 18:
-		if (pwrap_is_mt8135(wrp))
-			pwrap_writel(wrp, 0xc, PWRAP_CSHEXT);
-		pwrap_writel(wrp, 0x4, PWRAP_CSHEXT_WRITE);
-		pwrap_writel(wrp, 0xc, PWRAP_CSHEXT_READ);
-		pwrap_writel(wrp, 0x0, PWRAP_CSLEXT_START);
-		pwrap_writel(wrp, 0x0, PWRAP_CSLEXT_END);
-		break;
-	case 26:
-		if (pwrap_is_mt8135(wrp))
-			pwrap_writel(wrp, 0x4, PWRAP_CSHEXT);
+	if (pwrap_is_mt8135(wrp)) {
+		pwrap_writel(wrp, 0x4, PWRAP_CSHEXT);
 		pwrap_writel(wrp, 0x0, PWRAP_CSHEXT_WRITE);
 		pwrap_writel(wrp, 0x4, PWRAP_CSHEXT_READ);
 		pwrap_writel(wrp, 0x0, PWRAP_CSLEXT_START);
 		pwrap_writel(wrp, 0x0, PWRAP_CSLEXT_END);
-		break;
-	case 0:
-		if (pwrap_is_mt8135(wrp))
-			pwrap_writel(wrp, 0xf, PWRAP_CSHEXT);
-		pwrap_writel(wrp, 0xf, PWRAP_CSHEXT_WRITE);
-		pwrap_writel(wrp, 0xf, PWRAP_CSHEXT_READ);
-		pwrap_writel(wrp, 0xf, PWRAP_CSLEXT_START);
-		pwrap_writel(wrp, 0xf, PWRAP_CSLEXT_END);
-		break;
-	default:
-		return -EINVAL;
+	} else {
+		pwrap_writel(wrp, 0x0, PWRAP_CSHEXT_WRITE);
+		pwrap_writel(wrp, 0x4, PWRAP_CSHEXT_READ);
+		pwrap_writel(wrp, 0x2, PWRAP_CSLEXT_START);
+		pwrap_writel(wrp, 0x2, PWRAP_CSLEXT_END);
 	}
 
 	return 0;
-- 
2.1.4
