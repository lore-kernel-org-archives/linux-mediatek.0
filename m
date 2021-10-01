Return-Path: <SRS0=cfj9=OV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0335DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 03:26:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1B8C61A02
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Oct 2021 03:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1B8C61A02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KgDYIWOXuasFc86NkS2AU8+2HjRJBM0npvRas+oC4pY=; b=MzOQ86nTg9Gq+v
	eKyqVWSw7pEo9GwfPGQLe+Y1LjP6I1wgHcxZ5rueoBaOZLD9eRTsxNkvRhW4+PTEbBsAE++HE8neY
	vkvr3oi5cehX+Lh/vHtSdIjITBko+/XODvDBwsjzaFKo/JDByFbtbtGiudVh855AOEtpNIH7qfQJ4
	QJ0u6JEgY+ltnbZyMieN4gjJj1wZVZcBwPw5OWL3OwTuODjDLKsA6pULL40PUIT6Ti5JDH3jpjx7U
	B7DZ1RDySJyvVNGiFNbxLPrWkhWGOjf0qln1HZ6qTlZnVtO1zhYGFIZdtVLZQHXD3TKC3zcBp3zfP
	MJPdR5ocE86kf5s7dt6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mW9Bh-00GWvQ-Gv; Fri, 01 Oct 2021 03:26:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mW9BV-00GWtz-PZ; Fri, 01 Oct 2021 03:26:07 +0000
X-UUID: 1900b8564d6d4168a0492a47ab4787d7-20210930
X-UUID: 1900b8564d6d4168a0492a47ab4787d7-20210930
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2026459994; Thu, 30 Sep 2021 20:26:01 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Sep 2021 20:16:08 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 1 Oct 2021 11:16:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 1 Oct 2021 11:16:06 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <bicycle.tsai@mediatek.com>
Subject: [PATCH] ASoC: mediatek: mt8195: move of_node_put to remove function
Date: Fri, 1 Oct 2021 11:16:01 +0800
Message-ID: <20211001031601.3953-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_202605_842499_10D1660E 
X-CRM114-Status: GOOD (  18.18  )
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

platforms->of_node and codes->of_node are assigned in probe function,
and of_node_put is called at the end of probe function, because of_node
seems to be not used after probe functon

In this patch, of_node_put is moved to platform remove function in case
of_node is used at any occasions after probe function in the future.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 69 +++++++++++--------
 1 file changed, 42 insertions(+), 27 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index cb15467e5fc5..95abaadcd842 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -26,6 +26,9 @@
 #define RT5682_DEV0_NAME	"rt5682.2-001a"
 
 struct mt8195_mt6359_rt1019_rt5682_priv {
+	struct device_node *platform_node;
+	struct device_node *hdmi_node;
+	struct device_node *dp_node;
 	struct snd_soc_jack headset_jack;
 	struct snd_soc_jack dp_jack;
 	struct snd_soc_jack hdmi_jack;
@@ -994,33 +997,36 @@ static struct snd_soc_card mt8195_mt6359_rt1019_rt5682_soc_card = {
 static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &mt8195_mt6359_rt1019_rt5682_soc_card;
-	struct device_node *platform_node;
-	struct device_node *dp_node;
-	struct device_node *hdmi_node;
 	struct snd_soc_dai_link *dai_link;
-	struct mt8195_mt6359_rt1019_rt5682_priv *priv = NULL;
+	struct mt8195_mt6359_rt1019_rt5682_priv *priv;
 	int ret, i;
 
 	card->dev = &pdev->dev;
 
-	platform_node = of_parse_phandle(pdev->dev.of_node,
-					 "mediatek,platform", 0);
-	if (!platform_node) {
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->platform_node = of_parse_phandle(pdev->dev.of_node,
+					       "mediatek,platform", 0);
+	if (!priv->platform_node) {
 		dev_dbg(&pdev->dev, "Property 'platform' missing or invalid\n");
 		return -EINVAL;
 	}
 
 	for_each_card_prelinks(card, i, dai_link) {
 		if (!dai_link->platforms->name)
-			dai_link->platforms->of_node = platform_node;
+			dai_link->platforms->of_node = priv->platform_node;
 
 		if (strcmp(dai_link->name, "DPTX_BE") == 0) {
-			dp_node = of_parse_phandle(pdev->dev.of_node,
-						   "mediatek,dptx-codec", 0);
-			if (!dp_node) {
+			priv->dp_node =
+				of_parse_phandle(pdev->dev.of_node,
+						 "mediatek,dptx-codec", 0);
+
+			if (!priv->dp_node) {
 				dev_dbg(&pdev->dev, "No property 'dptx-codec'\n");
 			} else {
-				dai_link->codecs->of_node = dp_node;
+				dai_link->codecs->of_node = priv->dp_node;
 				dai_link->codecs->name = NULL;
 				dai_link->codecs->dai_name = "i2s-hifi";
 				dai_link->init = mt8195_dptx_codec_init;
@@ -1028,12 +1034,13 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 		}
 
 		if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
-			hdmi_node = of_parse_phandle(pdev->dev.of_node,
-						     "mediatek,hdmi-codec", 0);
-			if (!hdmi_node) {
+			priv->hdmi_node =
+				of_parse_phandle(pdev->dev.of_node,
+						 "mediatek,hdmi-codec", 0);
+			if (!priv->hdmi_node) {
 				dev_dbg(&pdev->dev, "No property 'hdmi-codec'\n");
 			} else {
-				dai_link->codecs->of_node = hdmi_node;
+				dai_link->codecs->of_node = priv->hdmi_node;
 				dai_link->codecs->name = NULL;
 				dai_link->codecs->dai_name = "i2s-hifi";
 				dai_link->init = mt8195_hdmi_codec_init;
@@ -1041,26 +1048,33 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 		}
 	}
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		ret = -ENOMEM;
-		goto out;
-	}
-
 	snd_soc_card_set_drvdata(card, priv);
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret)
+	if (ret) {
 		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
+		of_node_put(priv->hdmi_node);
+		of_node_put(priv->dp_node);
+		of_node_put(priv->platform_node);
+	}
 
-out:
-	of_node_put(hdmi_node);
-	of_node_put(dp_node);
-	of_node_put(platform_node);
 	return ret;
 }
 
+static int mt8195_mt6359_rt1019_rt5682_dev_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct mt8195_mt6359_rt1019_rt5682_priv *priv =
+		snd_soc_card_get_drvdata(card);
+
+	of_node_put(priv->hdmi_node);
+	of_node_put(priv->dp_node);
+	of_node_put(priv->platform_node);
+
+	return 0;
+}
+
 #ifdef CONFIG_OF
 static const struct of_device_id mt8195_mt6359_rt1019_rt5682_dt_match[] = {
 	{.compatible = "mediatek,mt8195_mt6359_rt1019_rt5682",},
@@ -1082,6 +1096,7 @@ static struct platform_driver mt8195_mt6359_rt1019_rt5682_driver = {
 		.pm = &mt8195_mt6359_rt1019_rt5682_pm_ops,
 	},
 	.probe = mt8195_mt6359_rt1019_rt5682_dev_probe,
+	.remove = mt8195_mt6359_rt1019_rt5682_dev_remove,
 };
 
 module_platform_driver(mt8195_mt6359_rt1019_rt5682_driver);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
