Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0E0C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 00:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTbpKvQmZvQRTB0xOPyvktBEEiwJFAjRng6FoiikXPQ=; b=TCuwBRuxPF69166caCo3loWmOG
	39Q44+M7NOkDSA2GxH/F9Y4U5Vf/StT4lDTiZhG3B4hmGExKjj3SDUeccwcIFxsr4jpR6ht7gdduw
	qDDW7iL4d/k8yDvb2CqNj/xTR44B2kZxud0+8alKfuzZZNaUMiJTJHD1Lqbf/ATWm4YVS6blm1Hw0
	LndAaitqLzSmfy9+8IzvLsz503fmHeoHF0zRT5fp6Thirw8Ybi+hmDVnraPGlHeWwb+pNuDsgq+15
	S//Ta/yJDWNxNrXjsW3qn9lO9+f+AGR+CfuBZMaEr9UcZTtHDtQ9F7Mrcti3j3NBPvFNrzToQ1S8r
	M9aUCIbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1FQC-007WY4-1q;
	Fri, 10 Nov 2023 00:30:52 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1FQ9-007WWy-2C;
	Fri, 10 Nov 2023 00:30:51 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1r1FPz-00041m-2U;
	Fri, 10 Nov 2023 00:30:39 +0000
Date: Fri, 10 Nov 2023 00:30:36 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] watchdog: mediatek: mt7988: add wdt support
Message-ID: <ddb5b6ca88165aa69f73fe2804eedd0231d8d9e7.1699576174.git.daniel@makrotopia.org>
References: <6912f6f406bc45674020681184f3eeca2f2cb63f.1699576174.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6912f6f406bc45674020681184f3eeca2f2cb63f.1699576174.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_163049_722515_67B742FB 
X-CRM114-Status: GOOD (  17.93  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add support for watchdog and reset generator unit of the MediaTek
MT7988 SoC.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/watchdog/mtk_wdt.c | 56 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index b2330b16b497a..b98b8c29735aa 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -12,6 +12,7 @@
 #include <dt-bindings/reset/mt2712-resets.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
+#include <dt-bindings/reset/mediatek,mt7988-resets.h>
 #include <dt-bindings/reset/mt8183-resets.h>
 #include <dt-bindings/reset/mt8186-resets.h>
 #include <dt-bindings/reset/mt8188-resets.h>
@@ -58,6 +59,8 @@
 #define WDT_SWSYSRST		0x18U
 #define WDT_SWSYS_RST_KEY	0x88000000
 
+#define WDT_SWSYSRST_EN		0xfc
+
 #define DRV_NAME		"mtk-wdt"
 #define DRV_VERSION		"1.0"
 
@@ -71,44 +74,85 @@ struct mtk_wdt_dev {
 	struct reset_controller_dev rcdev;
 	bool disable_wdt_extrst;
 	bool reset_by_toprgu;
+	bool has_swsysrst_en;
 };
 
 struct mtk_wdt_data {
 	int toprgu_sw_rst_num;
+	bool has_swsysrst_en;
 };
 
 static const struct mtk_wdt_data mt2712_data = {
 	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
+	.has_swsysrst_en = false,
 };
 
 static const struct mtk_wdt_data mt6795_data = {
 	.toprgu_sw_rst_num = MT6795_TOPRGU_SW_RST_NUM,
+	.has_swsysrst_en = false,
 };
 
 static const struct mtk_wdt_data mt7986_data = {
 	.toprgu_sw_rst_num = MT7986_TOPRGU_SW_RST_NUM,
+	.has_swsysrst_en = false,
+};
+
+static const struct mtk_wdt_data mt7988_data = {
+	.toprgu_sw_rst_num = MT7988_TOPRGU_SW_RST_NUM,
+	.has_swsysrst_en = true,
 };
 
 static const struct mtk_wdt_data mt8183_data = {
 	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
+	.has_swsysrst_en = false,
 };
 
 static const struct mtk_wdt_data mt8186_data = {
 	.toprgu_sw_rst_num = MT8186_TOPRGU_SW_RST_NUM,
+	.has_swsysrst_en = false,
 };
 
 static const struct mtk_wdt_data mt8188_data = {
 	.toprgu_sw_rst_num = MT8188_TOPRGU_SW_RST_NUM,
+	.has_swsysrst_en = false,
 };
 
 static const struct mtk_wdt_data mt8192_data = {
 	.toprgu_sw_rst_num = MT8192_TOPRGU_SW_RST_NUM,
+	.has_swsysrst_en = false,
 };
 
 static const struct mtk_wdt_data mt8195_data = {
 	.toprgu_sw_rst_num = MT8195_TOPRGU_SW_RST_NUM,
+	.has_swsysrst_en = false,
 };
 
+static int toprgu_reset_sw_enable(struct reset_controller_dev *rcdev,
+				  unsigned long id, bool enable)
+{
+	unsigned int tmp;
+	unsigned long flags;
+	struct mtk_wdt_dev *data =
+		 container_of(rcdev, struct mtk_wdt_dev, rcdev);
+
+	if (!data->has_swsysrst_en)
+		return 0;
+
+	spin_lock_irqsave(&data->lock, flags);
+
+	tmp = readl(data->wdt_base + WDT_SWSYSRST_EN);
+	if (enable)
+		tmp |= BIT(id);
+	else
+		tmp &= ~BIT(id);
+
+	writel(tmp, data->wdt_base + WDT_SWSYSRST_EN);
+
+	spin_unlock_irqrestore(&data->lock, flags);
+
+	return 0;
+}
+
 static int toprgu_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
@@ -135,13 +179,20 @@ static int toprgu_reset_update(struct reset_controller_dev *rcdev,
 static int toprgu_reset_assert(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
+	int ret;
+
+	ret = toprgu_reset_sw_enable(rcdev, id, true);
+	if (ret)
+		return ret;
+
 	return toprgu_reset_update(rcdev, id, true);
 }
 
 static int toprgu_reset_deassert(struct reset_controller_dev *rcdev,
 				 unsigned long id)
 {
-	return toprgu_reset_update(rcdev, id, false);
+	toprgu_reset_update(rcdev, id, false);
+	return toprgu_reset_sw_enable(rcdev, id, false);
 }
 
 static int toprgu_reset(struct reset_controller_dev *rcdev,
@@ -406,6 +457,8 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 						       wdt_data->toprgu_sw_rst_num);
 		if (err)
 			return err;
+
+		mtk_wdt->has_swsysrst_en = wdt_data->has_swsysrst_en;
 	}
 
 	mtk_wdt->disable_wdt_extrst =
@@ -444,6 +497,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6589-wdt" },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
+	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
 	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },
-- 
2.42.1

