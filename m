Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40232C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 18:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lR1gr+cWrrrppcUby3wCW0PlcLcciSLa2iy/NeGRhWw=; b=g9WsqUkWSFxDJyWWxfVSVkCF82
	SH5o0YLjEaqC/6hXXuA/6Ucj33XyMiCVZfdLnI5Mk/7mck16EpcKnI49MPW0RdYwoveH9DrdPnea+
	Q7f6xnl5Zmde/xcnl7I/6qV3EIVaXWjxYkUrUyEtESUFA6vlYsDWE6Uf5jyIuTFuFNlOshVJFqTbG
	eqL/Ietd2qCC6oZ40TjzIt47JSA+TsKrcmBcOEVT3SCAKxswjjsbLiHYr6Bann8+bfGL/L9iyrU5G
	RJkp0hGvVPbRo9ub2NvX9koofTkF64IJSQgiZXkQ1INdIisLkrNwUKM3irp2pITY0xM/aMdiCSz3e
	UnxgYg5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r58v3-00EOeS-37;
	Mon, 20 Nov 2023 18:22:50 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r58v0-00EOaC-0K;
	Mon, 20 Nov 2023 18:22:47 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1r58un-0000D2-11;
	Mon, 20 Nov 2023 18:22:34 +0000
Date: Mon, 20 Nov 2023 18:22:31 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 2/2] watchdog: mediatek: mt7988: add wdt support
Message-ID: <c0cf5f701801cce60470853fa15f1d9dced78c4f.1700504385.git.daniel@makrotopia.org>
References: <6478f8d2af59736d23a96b52891bb541de33870d.1700504385.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6478f8d2af59736d23a96b52891bb541de33870d.1700504385.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_102246_139632_F0E839D6 
X-CRM114-Status: GOOD (  16.47  )
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
v4: define MT7988_TOPRGU_SW_RST_NUM on top of mtk_wdt.c
v3: fix wrong function parameter name in kernel-doc comment
v2: call new toprgu_reset_sw_en_unlocked from toprgu_reset_update while
    holding lock.

 drivers/watchdog/mtk_wdt.c | 42 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index b2330b16b497a..c35f85ce8d69c 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -58,9 +58,13 @@
 #define WDT_SWSYSRST		0x18U
 #define WDT_SWSYS_RST_KEY	0x88000000
 
+#define WDT_SWSYSRST_EN		0xfc
+
 #define DRV_NAME		"mtk-wdt"
 #define DRV_VERSION		"1.0"
 
+#define MT7988_TOPRGU_SW_RST_NUM	24
+
 static bool nowayout = WATCHDOG_NOWAYOUT;
 static unsigned int timeout;
 
@@ -71,10 +75,12 @@ struct mtk_wdt_dev {
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
@@ -89,6 +95,11 @@ static const struct mtk_wdt_data mt7986_data = {
 	.toprgu_sw_rst_num = MT7986_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt7988_data = {
+	.toprgu_sw_rst_num = MT7988_TOPRGU_SW_RST_NUM,
+	.has_swsysrst_en = true,
+};
+
 static const struct mtk_wdt_data mt8183_data = {
 	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
 };
@@ -109,6 +120,28 @@ static const struct mtk_wdt_data mt8195_data = {
 	.toprgu_sw_rst_num = MT8195_TOPRGU_SW_RST_NUM,
 };
 
+/**
+ * toprgu_reset_sw_en_unlocked() - enable/disable software control for reset bit
+ * @data: Pointer to instance of driver data.
+ * @id: Bit number identifying the reset to be enabled or disabled.
+ * @enable: If true, enable software control for that bit, disable otherwise.
+ *
+ * Context: The caller must hold lock of struct mtk_wdt_dev.
+ */
+static void toprgu_reset_sw_en_unlocked(struct mtk_wdt_dev *data,
+					unsigned long id, bool enable)
+{
+	u32 tmp;
+
+	tmp = readl(data->wdt_base + WDT_SWSYSRST_EN);
+	if (enable)
+		tmp |= BIT(id);
+	else
+		tmp &= ~BIT(id);
+
+	writel(tmp, data->wdt_base + WDT_SWSYSRST_EN);
+}
+
 static int toprgu_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
@@ -119,6 +152,9 @@ static int toprgu_reset_update(struct reset_controller_dev *rcdev,
 
 	spin_lock_irqsave(&data->lock, flags);
 
+	if (assert && data->has_swsysrst_en)
+		toprgu_reset_sw_en_unlocked(data, id, true);
+
 	tmp = readl(data->wdt_base + WDT_SWSYSRST);
 	if (assert)
 		tmp |= BIT(id);
@@ -127,6 +163,9 @@ static int toprgu_reset_update(struct reset_controller_dev *rcdev,
 	tmp |= WDT_SWSYS_RST_KEY;
 	writel(tmp, data->wdt_base + WDT_SWSYSRST);
 
+	if (!assert && data->has_swsysrst_en)
+		toprgu_reset_sw_en_unlocked(data, id, false);
+
 	spin_unlock_irqrestore(&data->lock, flags);
 
 	return 0;
@@ -406,6 +445,8 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 						       wdt_data->toprgu_sw_rst_num);
 		if (err)
 			return err;
+
+		mtk_wdt->has_swsysrst_en = wdt_data->has_swsysrst_en;
 	}
 
 	mtk_wdt->disable_wdt_extrst =
@@ -444,6 +485,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6589-wdt" },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
+	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
 	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },
-- 
2.42.1

