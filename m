From: Jasper Mattsson <jasu-tmnvWD0sGVAk+I/owrrOrA@public.gmane.org>
Subject: [PATCH 1/3] soc: mediatek: Bind missing clocks to scpsys on the MT6797
Date: Mon, 3 Sep 2018 23:07:59 +0300
Message-ID: <20180903200759.GA6703@xn--njmtys-xxab.info>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
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
Cc: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Add missing clocks to MJC, AUDIO, VENC, VDEC domains. Also add MM clock
to VENC and VDEC domains, since the power domains are initially turned
on in the order of the scp_domain_data array, not in dependency order.
VENC and VDEC are subdomains of MM, but MM is defined after them, so
they are turned on before their parent. If the MM domain is not
initially on, boot will fail. This is the case e.g. with kexec boot.

Signed-off-by: Jasper Mattsson <jasu-tmnvWD0sGVAk+I/owrrOrA@public.gmane.org>

addclk
---
 drivers/soc/mediatek/mtk-scpsys.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 5b24bb4bf..4808d71c5 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -97,6 +97,7 @@ enum clk_id {
 	CLK_HIFSEL,
 	CLK_JPGDEC,
 	CLK_AUDIO,
+	CLK_MJC,
 	CLK_MAX,
 };
 
@@ -111,6 +112,7 @@ static const char * const clk_names[] = {
 	"hif_sel",
 	"jpgdec",
 	"audio",
+	"mjc",
 	NULL,
 };
 
@@ -690,7 +692,7 @@ static const struct scp_domain_data scp_domain_data_mt6797[] = {
 		.ctl_offs = 0x300,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
-		.clk_id = {CLK_VDEC},
+		.clk_id = {CLK_MM, CLK_VDEC},
 	},
 	[MT6797_POWER_DOMAIN_VENC] = {
 		.name = "venc",
@@ -698,7 +700,7 @@ static const struct scp_domain_data scp_domain_data_mt6797[] = {
 		.ctl_offs = 0x304,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
-		.clk_id = {CLK_NONE},
+		.clk_id = {CLK_MM, CLK_VENC},
 	},
 	[MT6797_POWER_DOMAIN_ISP] = {
 		.name = "isp",
@@ -706,7 +708,7 @@ static const struct scp_domain_data scp_domain_data_mt6797[] = {
 		.ctl_offs = 0x308,
 		.sram_pdn_bits = GENMASK(9, 8),
 		.sram_pdn_ack_bits = GENMASK(13, 12),
-		.clk_id = {CLK_NONE},
+		.clk_id = {CLK_MM},
 	},
 	[MT6797_POWER_DOMAIN_MM] = {
 		.name = "mm",
@@ -723,7 +725,7 @@ static const struct scp_domain_data scp_domain_data_mt6797[] = {
 		.ctl_offs = 0x314,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
-		.clk_id = {CLK_NONE},
+		.clk_id = {CLK_AUDIO},
 	},
 	[MT6797_POWER_DOMAIN_MFG_ASYNC] = {
 		.name = "mfg_async",
@@ -739,7 +741,7 @@ static const struct scp_domain_data scp_domain_data_mt6797[] = {
 		.ctl_offs = 0x310,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
-		.clk_id = {CLK_NONE},
+		.clk_id = {CLK_MJC},
 	},
 };
 
-- 
2.18.0
