Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B605BC07545
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 03:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BreaDgCH7mRp5CSo98g29nYk3nW8Yu1AIFy53p6Y/I=; b=pEAR0Syg2f38rCdpVScOWj4JHG
	bmevoTEmSlN3hfEDEX3E6hGLpLehJ2DBXrFexBM+hkpBcRAbnE6kQiNVRacCymn9O917oDqTCCIG4
	96VKGYKXbsfsyfk3UtAGub1XYMlpzRELucKm5lLhKd3kRWIGOOlVnhdBYj/IwRNo/nWQKRr5N0aUu
	u7jprQ3yQViEvsssRgWlv69VpmVjd/+UTOnyDlk3z6sx+C7oTrSni2ig8XSm5m1tMugJYSDapyqNO
	Rxiu81h68KQmw/h/foNpZG0uqUzZ0WfHf7MLsFD1oLuusAS3n2ScQpknjNvef9q95t0tGZFlkl4Ss
	T5zYqqsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv8S7-008kIp-28;
	Tue, 24 Oct 2023 03:51:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv8S4-008kGs-2W;
	Tue, 24 Oct 2023 03:51:34 +0000
X-UUID: 994fe68a722011ee86758d4a7c00f3a0-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7BreaDgCH7mRp5CSo98g29nYk3nW8Yu1AIFy53p6Y/I=;
	b=CJXfn8d/wyUDfFeGKn9UG1PQazyiexpxAbXW8E17y95LARaiPHHM6GuDZRb9sIfXKfG3PuFOZpV+ijayl1GzZiOpnxyhGHOoiCiMCO7JVYJhVce2m7y5fsqeiIAuQr3jX/Rg31/nSDp0oVNemIlh16z9A3MGlnaqazGlPHOwEio=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:46efcb02-6fcf-4d56-a577-e6322c24a557,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:89173dd7-04a0-4e50-8742-3543eab8cb8e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 994fe68a722011ee86758d4a7c00f3a0-20231023
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1245389855; Mon, 23 Oct 2023 20:51:23 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 24 Oct 2023 11:50:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 24 Oct 2023 11:50:48 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH v2 2/3] ASoC: mediatek: mt7986: remove the mt7986_wm8960_priv structure
Date: Tue, 24 Oct 2023 11:50:18 +0800
Message-ID: <20231024035019.11732-3-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231024035019.11732-1-maso.huang@mediatek.com>
References: <20231024035019.11732-1-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.396400-8.000000
X-TMASE-MatchedRID: fmS20tPE9ksZ9uxgtDtJQgPZZctd3P4BCt59Uh3p/NUKogmGusPLb7uA
	YZFvH/IiJ7vDzKaAUziGwpg7pPpeGdEdmUPXI8FxRnmgWPGIUuN9LQinZ4QefPcjNeVeWlqY+gt
	Hj7OwNO34ZhR52Rc1agOckpztc5q9DTKwjifCv/JaBY1H+rGnJmceWHNlxh0NYxCRwJSgalga8k
	2hFPMqR5nyvuWwh3WTLDv877bId1VPpulV5YAHJ0ma3zYT97IFAYfQIAUhBayZvmCbKVb49sZL6
	x5U/HridGByp+zdaDg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.396400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F482FDE8C42D897BE79991F8C5C7B1E56E94812EDF60B7011729E2E99BD7179F2000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_205132_833743_965019BD 
X-CRM114-Status: GOOD (  13.87  )
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

Remove the mt7986_wm8960_priv structure.

Signed-off-by: Maso Huang <maso.huang@mediatek.com>
---
 sound/soc/mediatek/mt7986/mt7986-wm8960.c | 33 +++++++++--------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-wm8960.c b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
index f6b9794b7229..c1390b373410 100644
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
@@ -158,8 +149,8 @@ static int mt7986_wm8960_machine_probe(struct platform_device *pdev)
 	}
 
 err_of_node_put:
-	of_node_put(priv->codec_node);
-	of_node_put(priv->platform_node);
+	of_node_put(platform_dai_node);
+	of_node_put(codec_dai_node);
 	return ret;
 }
 
-- 
2.18.0


