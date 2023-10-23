Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91E0C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knB+uMvpmxTF3yJ9XiU/mohcSPtntRiZjuCKxsC5XOw=; b=niGTP9YPsix+KqP+sZM4r6HTMh
	PL7GpPNUnXvwSfhfnVoPuJZR2MkRxG5YKBBwk7Bvpo1S+fLF//O1czNNf1CI0XrW75ppo0HSzZ59f
	W8c60EvHPK6r6bwNAwp+FRqFSM94JkYfLrZImXISRgQDF9iA0hu79zmFrFN2iHjwdMIN/wjKPqsM1
	mj8m+hENChGBHWVHZtyUIxlOcoyl2VxIdGy1gR7tBtRy1JcW37ZjiaXtctOs4/411wWDYVpYt48Dp
	8Qm7tDckIkrBqCR7MY6bTbe21NAv1voxWTI0R780njrQpS855VybCmQocAK6WQfy4xcnX5EECkmxi
	rGSrwcPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qurfx-006xmM-2e;
	Mon, 23 Oct 2023 09:56:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quref-006wl0-2X;
	Mon, 23 Oct 2023 09:55:27 +0000
X-UUID: 4467ba44718a11ee86758d4a7c00f3a0-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=knB+uMvpmxTF3yJ9XiU/mohcSPtntRiZjuCKxsC5XOw=;
	b=YJkkxnr2xN/2G5wdsVd9zoOnumgwPnV/zAmhmOXlaxH0ulYqirZoCBZZPuVL0Na3mxAFwi9WLZ9BJzK8zbjSs52D8Iul7Yz4N/0SqpFAy9ZWVj7bOybXfBqSA6zvFuO2xVQnhfaJ3kINHvZcuuHLNNvhVEzszS2IVm+H8px2YtY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:2457c5b3-8684-4d2d-a531-5e05f51b8843,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:5f78ec9,CLOUDID:ce550b7d-ccd9-4df5-91ce-9df5fea3ae01,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:2,IP:nil,UR
	L:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,D
	KR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4467ba44718a11ee86758d4a7c00f3a0-20231023
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 938602320; Mon, 23 Oct 2023 02:55:16 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 17:55:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 17:55:13 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH 1/2] ASoC: mediatek: mt7986: remove redundant remove function
Date: Mon, 23 Oct 2023 17:54:52 +0800
Message-ID: <20231023095453.4860-2-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231023095453.4860-1-maso.huang@mediatek.com>
References: <20231023095453.4860-1-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025525_841250_392AAA5C 
X-CRM114-Status: GOOD (  14.96  )
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

Remove redundant remove function of mt7986-wm8960.

Signed-off-by: Maso Huang <maso.huang@mediatek.com>
---
 sound/soc/mediatek/mt7986/mt7986-wm8960.c | 43 +++++++----------------
 1 file changed, 12 insertions(+), 31 deletions(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-wm8960.c b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
index 364d13b1c426..c1390b373410 100644
--- a/sound/soc/mediatek/mt7986/mt7986-wm8960.c
+++ b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
@@ -12,11 +12,6 @@
 
 #include "mt7986-afe-common.h"
 
-struct mt7986_wm8960_priv {
-	struct device_node *platform_node;
-	struct device_node *codec_node;
-};
-
 static const struct snd_soc_dapm_widget mt7986_wm8960_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("AMIC", NULL),
@@ -92,20 +87,18 @@ static int mt7986_wm8960_machine_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &mt7986_wm8960_card;
 	struct snd_soc_dai_link *dai_link;
 	struct device_node *platform, *codec;
-	struct mt7986_wm8960_priv *priv;
+	struct device_node *platform_dai_node, *codec_dai_node;
 	int ret, i;
 
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	card->dev = &pdev->dev;
 
 	platform = of_get_child_by_name(pdev->dev.of_node, "platform");
 
 	if (platform) {
-		priv->platform_node = of_parse_phandle(platform, "sound-dai", 0);
+		platform_dai_node = of_parse_phandle(platform, "sound-dai", 0);
 		of_node_put(platform);
 
-		if (!priv->platform_node) {
+		if (!platform_dai_node) {
 			dev_err(&pdev->dev, "Failed to parse platform/sound-dai property\n");
 			return -EINVAL;
 		}
@@ -117,24 +110,22 @@ static int mt7986_wm8960_machine_probe(struct platform_device *pdev)
 	for_each_card_prelinks(card, i, dai_link) {
 		if (dai_link->platforms->name)
 			continue;
-		dai_link->platforms->of_node = priv->platform_node;
+		dai_link->platforms->of_node = platform_dai_node;
 	}
 
-	card->dev = &pdev->dev;
-
 	codec = of_get_child_by_name(pdev->dev.of_node, "codec");
 
 	if (codec) {
-		priv->codec_node = of_parse_phandle(codec, "sound-dai", 0);
+		codec_dai_node = of_parse_phandle(codec, "sound-dai", 0);
 		of_node_put(codec);
 
-		if (!priv->codec_node) {
-			of_node_put(priv->platform_node);
+		if (!codec_dai_node) {
+			of_node_put(platform_dai_node);
 			dev_err(&pdev->dev, "Failed to parse codec/sound-dai property\n");
 			return -EINVAL;
 		}
 	} else {
-		of_node_put(priv->platform_node);
+		of_node_put(platform_dai_node);
 		dev_err(&pdev->dev, "Property 'codec' missing or invalid\n");
 		return -EINVAL;
 	}
@@ -142,7 +133,7 @@ static int mt7986_wm8960_machine_probe(struct platform_device *pdev)
 	for_each_card_prelinks(card, i, dai_link) {
 		if (dai_link->codecs->name)
 			continue;
-		dai_link->codecs->of_node = priv->codec_node;
+		dai_link->codecs->of_node = codec_dai_node;
 	}
 
 	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
@@ -158,20 +149,11 @@ static int mt7986_wm8960_machine_probe(struct platform_device *pdev)
 	}
 
 err_of_node_put:
-	of_node_put(priv->codec_node);
-	of_node_put(priv->platform_node);
+	of_node_put(platform_dai_node);
+	of_node_put(codec_dai_node);
 	return ret;
 }
 
-static void mt7986_wm8960_machine_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct mt7986_wm8960_priv *priv = snd_soc_card_get_drvdata(card);
-
-	of_node_put(priv->codec_node);
-	of_node_put(priv->platform_node);
-}
-
 static const struct of_device_id mt7986_wm8960_machine_dt_match[] = {
 	{.compatible = "mediatek,mt7986-wm8960-sound"},
 	{ /* sentinel */ }
@@ -184,7 +166,6 @@ static struct platform_driver mt7986_wm8960_machine = {
 		.of_match_table = mt7986_wm8960_machine_dt_match,
 	},
 	.probe = mt7986_wm8960_machine_probe,
-	.remove_new = mt7986_wm8960_machine_remove,
 };
 
 module_platform_driver(mt7986_wm8960_machine);
-- 
2.18.0


