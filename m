Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C71C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Feb 2022 14:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OEiZikQVDHHLzrPpxFpVHe33QfjyrASHjdOS9QQy6/4=; b=SzWiRsahq2IcIM
	kKEIAWkYKEAJmAVDSx6bg+cLiW3fE0A1FbjIfQg5Kh+DvoGDGjvkxxsBZuIr6bDtKHPWCXmW2Ii2l
	n4bE5KiXTbBk6yLb6tApMc/VDpFzmk8NNY4/FAmb7C/3mR+T62/ZaxPdDrg1n75a5FHu0dnOxEHde
	siepTUkCJsIiA2KjZ9b7Ki34jAvhVOaAAZEASeufNRFbmTYJtwDb9Bf4XATRHzNnvDTeaW6w9RMyD
	jLGyzo7cIMv8zbgxNDUzs5l1O4wDYrksVfiwnFWb6TYoC4YXfn08yIJBY0ATU/ay3GH3VGVXnXBk2
	TzZglNzbSwTVTg1cqMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIAIj-0041tt-Nl; Thu, 10 Feb 2022 14:20:01 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIAIL-0041kI-SL; Thu, 10 Feb 2022 14:19:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 242C31F46564
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644502776;
 bh=zG0bldBWB2nx02kMBfqhQzYNwC5linFfUnYedSv8FaA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bxqmqOSsefZzZGq90wPl9wLr3zJokFwvL2I/V0TceAKt8PC/ES67xF49aiJkz601R
 KdsdTFSIgvy6ufY85glDTHDa6F25wtIlx5oqJOFDzcWur7TKVx+woUmNINkdPxXu+X
 /xiBehiki0o7MELMOcdMpuwToodQDsedC5PrAPvBcXSuXNyXr9kGkKO07yg0Rxn3cb
 ccCPwYADesGDSgYFrxMjMw8d0uEiJdWrdklIYWznosOM57JLI72QMuRizay9vOlFbc
 l7oUrMY/syUO0RHkuAFEDShzuwSNW4sVBmLdhZ2QcqwxndKcWN+WCZL3nrqcKU696x
 7ZQG2Xx3pGbow==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@kernel.org
Cc: linus.walleij@linaro.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/5] pinctrl: mediatek: paris: Unify probe function by using
 OF match data
Date: Thu, 10 Feb 2022 15:19:27 +0100
Message-Id: <20220210141931.291712-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
References: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_061938_203493_2CCCE4D0 
X-CRM114-Status: GOOD (  16.40  )
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

All of the SoCs using Paris pinctrl are defining a custom probe
function that is simply calling mtk_paris_pinctrl_probe() passing
a pointer to the SoC specific mtk_pin_soc structure and nothing else.

Simplify the probe mechanism across all pinctrl drivers that are
using pinctrl-paris by passing the specific mtk_pin_soc as match
data and using function mtk_paris_pinctrl_probe as a common probe
function for all of them.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt6765.c | 9 ++-------
 drivers/pinctrl/mediatek/pinctrl-mt6779.c | 9 ++-------
 drivers/pinctrl/mediatek/pinctrl-mt6797.c | 9 ++-------
 drivers/pinctrl/mediatek/pinctrl-mt8183.c | 9 ++-------
 drivers/pinctrl/mediatek/pinctrl-mt8192.c | 9 ++-------
 drivers/pinctrl/mediatek/pinctrl-mt8195.c | 9 ++-------
 drivers/pinctrl/mediatek/pinctrl-paris.c  | 9 ++++++---
 drivers/pinctrl/mediatek/pinctrl-paris.h  | 3 +--
 8 files changed, 19 insertions(+), 47 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
index 2c59d3936256..c57b19fcda03 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
@@ -1082,21 +1082,16 @@ static const struct mtk_pin_soc mt6765_data = {
 };
 
 static const struct of_device_id mt6765_pinctrl_of_match[] = {
-	{ .compatible = "mediatek,mt6765-pinctrl", },
+	{ .compatible = "mediatek,mt6765-pinctrl", .data = &mt6765_data },
 	{ }
 };
 
-static int mt6765_pinctrl_probe(struct platform_device *pdev)
-{
-	return mtk_paris_pinctrl_probe(pdev, &mt6765_data);
-}
-
 static struct platform_driver mt6765_pinctrl_driver = {
 	.driver = {
 		.name = "mt6765-pinctrl",
 		.of_match_table = mt6765_pinctrl_of_match,
 	},
-	.probe = mt6765_pinctrl_probe,
+	.probe = mtk_paris_pinctrl_probe,
 };
 
 static int __init mt6765_pinctrl_init(void)
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6779.c b/drivers/pinctrl/mediatek/pinctrl-mt6779.c
index bb0851c73304..4ddf8bda6827 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6779.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6779.c
@@ -758,21 +758,16 @@ static const struct mtk_pin_soc mt6779_data = {
 };
 
 static const struct of_device_id mt6779_pinctrl_of_match[] = {
-	{ .compatible = "mediatek,mt6779-pinctrl", },
+	{ .compatible = "mediatek,mt6779-pinctrl", .data = &mt6779_data },
 	{ }
 };
 
-static int mt6779_pinctrl_probe(struct platform_device *pdev)
-{
-	return mtk_paris_pinctrl_probe(pdev, &mt6779_data);
-}
-
 static struct platform_driver mt6779_pinctrl_driver = {
 	.driver = {
 		.name = "mt6779-pinctrl",
 		.of_match_table = mt6779_pinctrl_of_match,
 	},
-	.probe = mt6779_pinctrl_probe,
+	.probe = mtk_paris_pinctrl_probe,
 };
 
 static int __init mt6779_pinctrl_init(void)
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6797.c b/drivers/pinctrl/mediatek/pinctrl-mt6797.c
index adebe4333ed9..53f240491259 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6797.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6797.c
@@ -58,21 +58,16 @@ static const struct mtk_pin_soc mt6797_data = {
 };
 
 static const struct of_device_id mt6797_pinctrl_of_match[] = {
-	{ .compatible = "mediatek,mt6797-pinctrl", },
+	{ .compatible = "mediatek,mt6797-pinctrl", .data = &mt6797_data },
 	{ }
 };
 
-static int mt6797_pinctrl_probe(struct platform_device *pdev)
-{
-	return mtk_paris_pinctrl_probe(pdev, &mt6797_data);
-}
-
 static struct platform_driver mt6797_pinctrl_driver = {
 	.driver = {
 		.name = "mt6797-pinctrl",
 		.of_match_table = mt6797_pinctrl_of_match,
 	},
-	.probe = mt6797_pinctrl_probe,
+	.probe = mtk_paris_pinctrl_probe,
 };
 
 static int __init mt6797_pinctrl_init(void)
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8183.c b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
index 60318339b618..fecb1e64fff4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8183.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8183.c
@@ -567,22 +567,17 @@ static const struct mtk_pin_soc mt8183_data = {
 };
 
 static const struct of_device_id mt8183_pinctrl_of_match[] = {
-	{ .compatible = "mediatek,mt8183-pinctrl", },
+	{ .compatible = "mediatek,mt8183-pinctrl", .data = &mt8183_data },
 	{ }
 };
 
-static int mt8183_pinctrl_probe(struct platform_device *pdev)
-{
-	return mtk_paris_pinctrl_probe(pdev, &mt8183_data);
-}
-
 static struct platform_driver mt8183_pinctrl_driver = {
 	.driver = {
 		.name = "mt8183-pinctrl",
 		.of_match_table = mt8183_pinctrl_of_match,
 		.pm = &mtk_paris_pinctrl_pm_ops,
 	},
-	.probe = mt8183_pinctrl_probe,
+	.probe = mtk_paris_pinctrl_probe,
 };
 
 static int __init mt8183_pinctrl_init(void)
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8192.c b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
index 0c16b2c756bf..acccde9262ba 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8192.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8192.c
@@ -1381,22 +1381,17 @@ static const struct mtk_pin_soc mt8192_data = {
 };
 
 static const struct of_device_id mt8192_pinctrl_of_match[] = {
-	{ .compatible = "mediatek,mt8192-pinctrl", },
+	{ .compatible = "mediatek,mt8192-pinctrl", .data = &mt8192_data },
 	{ }
 };
 
-static int mt8192_pinctrl_probe(struct platform_device *pdev)
-{
-	return mtk_paris_pinctrl_probe(pdev, &mt8192_data);
-}
-
 static struct platform_driver mt8192_pinctrl_driver = {
 	.driver = {
 		.name = "mt8192-pinctrl",
 		.of_match_table = mt8192_pinctrl_of_match,
 		.pm = &mtk_paris_pinctrl_pm_ops,
 	},
-	.probe = mt8192_pinctrl_probe,
+	.probe = mtk_paris_pinctrl_probe,
 };
 
 static int __init mt8192_pinctrl_init(void)
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
index 275b7ba4386d..563693d3d4c2 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
@@ -959,22 +959,17 @@ static const struct mtk_pin_soc mt8195_data = {
 };
 
 static const struct of_device_id mt8195_pinctrl_of_match[] = {
-	{ .compatible = "mediatek,mt8195-pinctrl", },
+	{ .compatible = "mediatek,mt8195-pinctrl", .data = &mt8195_data },
 	{ }
 };
 
-static int mt8195_pinctrl_probe(struct platform_device *pdev)
-{
-	return mtk_paris_pinctrl_probe(pdev, &mt8195_data);
-}
-
 static struct platform_driver mt8195_pinctrl_driver = {
 	.driver = {
 		.name = "mt8195-pinctrl",
 		.of_match_table = mt8195_pinctrl_of_match,
 		.pm = &mtk_paris_pinctrl_pm_ops,
 	},
-	.probe = mt8195_pinctrl_probe,
+	.probe = mtk_paris_pinctrl_probe,
 };
 
 static int __init mt8195_pinctrl_init(void)
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 784eb152b637..6d9e4d625517 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -1036,8 +1036,7 @@ static int mtk_pctrl_build_state(struct platform_device *pdev)
 	return 0;
 }
 
-int mtk_paris_pinctrl_probe(struct platform_device *pdev,
-			    const struct mtk_pin_soc *soc)
+int mtk_paris_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct pinctrl_pin_desc *pins;
@@ -1049,7 +1048,11 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, hw);
-	hw->soc = soc;
+
+	hw->soc = device_get_match_data(dev);
+	if (!hw->soc)
+		return -ENOENT;
+
 	hw->dev = &pdev->dev;
 
 	if (!hw->soc->nbase_names)
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.h b/drivers/pinctrl/mediatek/pinctrl-paris.h
index afb7650fd25b..8762ac599329 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.h
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.h
@@ -57,8 +57,7 @@
 		id##_funcs,				\
 	}
 
-int mtk_paris_pinctrl_probe(struct platform_device *pdev,
-			    const struct mtk_pin_soc *soc);
+int mtk_paris_pinctrl_probe(struct platform_device *pdev);
 
 ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 	unsigned int gpio, char *buf, unsigned int bufLen);
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
