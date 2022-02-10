Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E31C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 14:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nbOmmxvXpeCPu9m2tHiDV+VOBYyFTA6i7/r55P68EKw=; b=3mSbi0V098iJOb
	703KgR4ZLeXo692WpYUrB0DQL4OBMxCsFBhsp2VbRQXZAMU9tXCDLOlEF2VSXAe6MNkd3rX7r7sIl
	N7A3Z0oe3Sloyb1rDJ/pWPOKUn5qDYo5X/i0y0MiMNcrtlrk0coJNlJ++1qLW6lJOef6DhW19l6MA
	wXwig1XD5SmsqTAHLyz2awf2Zfbn1OSv2wR+tVnoAxZtPR8ZIGbYuNmFOvQW3XW3QiPaVHCQg1sqV
	bGvT7ldv/Tjaq6iY1BddU17DHhhrExinn0Ziu5U/vIhyBjsTz5GAgeXBk+j1CGq+WzKqbkoAgaWGt
	oGAytcAj+dGxK0lMcXhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIAJ6-00424b-5l; Thu, 10 Feb 2022 14:20:24 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIAIN-0041ki-7O; Thu, 10 Feb 2022 14:19:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7D17A1F4656E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644502778;
 bh=n8CGqf0yuDMBl0AcIjnWSW/xsE0lZFScDerKAcE+A7I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Gad6W7Ew1fVLAM3hq6/Ky7hnUp7hlPAFKvhC25rQNx3rOZUAY3j9pTP4bAq8vkihc
 fd3QS/eFV7iN2TSBXUPZVpXE7A3tcre6pC+zJdpLufIfz+yYpGJWOY41gKo1kBZUj2
 3vIejAXc8ezkRiHuBUGgB6tGPHyGhCndqy/o65ytldcjeOh0zfu6qV0XRDJnjvv2wz
 TvQdzpT77/r9eKGhscKxM056jpFEyxdhcpdSOiD/WRYMRCmHUm+m7ixCRlrO5N34Aa
 u7SprP+fRMPfXafBTYAFfz/07XPSP44kkWMOw4fLEPlglzHg1T36M1rX6Hap0UboOw
 eAzCIWuN8MXRw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@kernel.org
Cc: linus.walleij@linaro.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/5] pinctrl: mediatek: common-v1: Use common probe function
Date: Thu, 10 Feb 2022 15:19:29 +0100
Message-Id: <20220210141931.291712-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
References: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_061939_549793_EB0129ED 
X-CRM114-Status: GOOD (  12.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Most of the mediatek pinctrl drivers are calling mtk_pctrl_init() and
passing only a pointer to struct mtk_pinctrl_devdata, as the regmap
handle it passed from device-tree, with the exception of mt6397.

For all of the drivers that don't require passing a struct regmap
pointer from a parent device, simplify the probe mechanism by assigning
the required structure as match data and use mtk_pctrl_common_probe()
as their probe function.

While at it, also collapse the of_device_id entries to a single line,
as they all fit in max 83 columns, which is acceptable.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt2701.c | 11 +++--------
 drivers/pinctrl/mediatek/pinctrl-mt2712.c | 11 ++---------
 drivers/pinctrl/mediatek/pinctrl-mt8127.c |  9 ++-------
 drivers/pinctrl/mediatek/pinctrl-mt8135.c | 11 ++---------
 drivers/pinctrl/mediatek/pinctrl-mt8167.c | 11 ++---------
 drivers/pinctrl/mediatek/pinctrl-mt8365.c | 11 ++---------
 drivers/pinctrl/mediatek/pinctrl-mt8516.c | 11 ++---------
 7 files changed, 15 insertions(+), 60 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt2701.c b/drivers/pinctrl/mediatek/pinctrl-mt2701.c
index 37228dd5103e..2f8821207395 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt2701.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt2701.c
@@ -534,20 +534,15 @@ static const struct mtk_pinctrl_devdata mt2701_pinctrl_data = {
 	},
 };
 
-static int mt2701_pinctrl_probe(struct platform_device *pdev)
-{
-	return mtk_pctrl_init(pdev, &mt2701_pinctrl_data, NULL);
-}
-
 static const struct of_device_id mt2701_pctrl_match[] = {
-	{ .compatible = "mediatek,mt2701-pinctrl", },
-	{ .compatible = "mediatek,mt7623-pinctrl", },
+	{ .compatible = "mediatek,mt2701-pinctrl", .data = &mt2701_pinctrl_data },
+	{ .compatible = "mediatek,mt7623-pinctrl", .data = &mt2701_pinctrl_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mt2701_pctrl_match);
 
 static struct platform_driver mtk_pinctrl_driver = {
-	.probe = mt2701_pinctrl_probe,
+	.probe = mtk_pctrl_common_probe,
 	.driver = {
 		.name = "mediatek-mt2701-pinctrl",
 		.of_match_table = mt2701_pctrl_match,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt2712.c b/drivers/pinctrl/mediatek/pinctrl-mt2712.c
index ba35fc6cc138..03aa14445034 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt2712.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt2712.c
@@ -587,21 +587,14 @@ static const struct mtk_pinctrl_devdata mt2712_pinctrl_data = {
 	},
 };
 
-static int mt2712_pinctrl_probe(struct platform_device *pdev)
-{
-	return mtk_pctrl_init(pdev, &mt2712_pinctrl_data, NULL);
-}
-
 static const struct of_device_id mt2712_pctrl_match[] = {
-	{
-		.compatible = "mediatek,mt2712-pinctrl",
-	},
+	{ .compatible = "mediatek,mt2712-pinctrl", .data = &mt2712_pinctrl_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mt2712_pctrl_match);
 
 static struct platform_driver mtk_pinctrl_driver = {
-	.probe = mt2712_pinctrl_probe,
+	.probe = mtk_pctrl_common_probe,
 	.driver = {
 		.name = "mediatek-mt2712-pinctrl",
 		.of_match_table = mt2712_pctrl_match,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8127.c b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
index eaf5c76b14c7..76cb525374f2 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8127.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
@@ -303,18 +303,13 @@ static const struct mtk_pinctrl_devdata mt8127_pinctrl_data = {
 	},
 };
 
-static int mt8127_pinctrl_probe(struct platform_device *pdev)
-{
-	return mtk_pctrl_init(pdev, &mt8127_pinctrl_data, NULL);
-}
-
 static const struct of_device_id mt8127_pctrl_match[] = {
-	{ .compatible = "mediatek,mt8127-pinctrl", },
+	{ .compatible = "mediatek,mt8127-pinctrl", .data = &mt8127_pinctrl_data },
 	{ }
 };
 
 static struct platform_driver mtk_pinctrl_driver = {
-	.probe = mt8127_pinctrl_probe,
+	.probe = mtk_pctrl_common_probe,
 	.driver = {
 		.name = "mediatek-mt8127-pinctrl",
 		.of_match_table = mt8127_pctrl_match,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8135.c b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
index b8f4080aab45..4c20b79dec67 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8135.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
@@ -316,20 +316,13 @@ static const struct mtk_pinctrl_devdata mt8135_pinctrl_data = {
 	},
 };
 
-static int mt8135_pinctrl_probe(struct platform_device *pdev)
-{
-	return mtk_pctrl_init(pdev, &mt8135_pinctrl_data, NULL);
-}
-
 static const struct of_device_id mt8135_pctrl_match[] = {
-	{
-		.compatible = "mediatek,mt8135-pinctrl",
-	},
+	{ .compatible = "mediatek,mt8135-pinctrl", .data = &mt8135_pinctrl_data },
 	{ }
 };
 
 static struct platform_driver mtk_pinctrl_driver = {
-	.probe = mt8135_pinctrl_probe,
+	.probe = mtk_pctrl_common_probe,
 	.driver = {
 		.name = "mediatek-mt8135-pinctrl",
 		.of_match_table = mt8135_pctrl_match,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8167.c b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
index ba12ef795e52..08aabf408c9c 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8167.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
@@ -335,22 +335,15 @@ static const struct mtk_pinctrl_devdata mt8167_pinctrl_data = {
 	},
 };
 
-static int mt8167_pinctrl_probe(struct platform_device *pdev)
-{
-	return mtk_pctrl_init(pdev, &mt8167_pinctrl_data, NULL);
-}
-
 static const struct of_device_id mt8167_pctrl_match[] = {
-	{
-		.compatible = "mediatek,mt8167-pinctrl",
-	},
+	{ .compatible = "mediatek,mt8167-pinctrl", .data = &mt8167_pinctrl_data },
 	{}
 };
 
 MODULE_DEVICE_TABLE(of, mt8167_pctrl_match);
 
 static struct platform_driver mtk_pinctrl_driver = {
-	.probe = mt8167_pinctrl_probe,
+	.probe = mtk_pctrl_common_probe,
 	.driver = {
 		.name = "mediatek-mt8167-pinctrl",
 		.of_match_table = mt8167_pctrl_match,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8365.c b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
index 79b1fee5a1eb..6863a8150a2b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8365.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
@@ -469,20 +469,13 @@ static const struct mtk_pinctrl_devdata mt8365_pinctrl_data = {
 	},
 };
 
-static int mtk_pinctrl_probe(struct platform_device *pdev)
-{
-	return mtk_pctrl_init(pdev, &mt8365_pinctrl_data, NULL);
-}
-
 static const struct of_device_id mt8365_pctrl_match[] = {
-	{
-		.compatible = "mediatek,mt8365-pinctrl",
-	},
+	{ .compatible = "mediatek,mt8365-pinctrl", .data = &mt8365_pinctrl_data },
 	{}
 };
 
 static struct platform_driver mtk_pinctrl_driver = {
-	.probe = mtk_pinctrl_probe,
+	.probe = mtk_pctrl_common_probe,
 	.driver = {
 		.name = "mediatek-mt8365-pinctrl",
 		.of_match_table = mt8365_pctrl_match,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8516.c b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
index 219fb4bc341f..99c1a04c7fd8 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8516.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
@@ -335,22 +335,15 @@ static const struct mtk_pinctrl_devdata mt8516_pinctrl_data = {
 	},
 };
 
-static int mt8516_pinctrl_probe(struct platform_device *pdev)
-{
-	return mtk_pctrl_init(pdev, &mt8516_pinctrl_data, NULL);
-}
-
 static const struct of_device_id mt8516_pctrl_match[] = {
-	{
-		.compatible = "mediatek,mt8516-pinctrl",
-	},
+	{ .compatible = "mediatek,mt8516-pinctrl", .data = &mt8516_pinctrl_data },
 	{}
 };
 
 MODULE_DEVICE_TABLE(of, mt8516_pctrl_match);
 
 static struct platform_driver mtk_pinctrl_driver = {
-	.probe = mt8516_pinctrl_probe,
+	.probe = mtk_pctrl_common_probe,
 	.driver = {
 		.name = "mediatek-mt8516-pinctrl",
 		.of_match_table = mt8516_pctrl_match,
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
