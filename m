Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFDEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 06:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0MGEO/nDx2m4/Vvryv9AEr5YXsvGIsq546gDqi5Z2w=; b=g30e5Bac92fihd
	plDLSJTFMQe/moLdiUfGiePCQsEL+B2121A0Br6m+INpvFN6YUikMVPJT4P+1r/39qbEw232cxi/Q
	AUwet/1ugwfh0hOt5R8HPpQTIgD+fN7Piyoye5JNo5/YJYj7UDLT/p+YN+4FnhniIY6Nf8l0msQAB
	omuq5E97mrtCn5sCkQtTk4179uy8cA10iPtHfRsEBzXZvSig1Y1f0NIpeRE8/CUz4roVBjdOByoXe
	9T0FLHQM8ojcek/E3XuXSdQdIbOliiNTBsrDYwKgb4H2Sl743HGAyEU3xMkI1oYRtUnTIpd+zbRBT
	fjAUeLAhWTUj8+V0Z3YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXHNr-00Fszv-3m; Thu, 24 Mar 2022 06:55:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXHNU-00Fsqr-Ua; Thu, 24 Mar 2022 06:55:26 +0000
X-UUID: 47196b4b33ae4b71a7cd6f18c9a76c1a-20220323
X-UUID: 47196b4b33ae4b71a7cd6f18c9a76c1a-20220323
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1899128337; Wed, 23 Mar 2022 23:55:19 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 23:45:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 24 Mar 2022 14:45:15 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Mar 2022 14:45:14 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <tzungbi@google.com>
CC: <angelogioacchino.delregno@collabora.com>, <aaronyu@google.com>,
 <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, <linmq006@gmail.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.com>, Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [v7 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of speaker
Date: Thu, 24 Mar 2022 14:45:09 +0800
Message-ID: <20220324064511.10665-3-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324064511.10665-1-jiaxin.yu@mediatek.com>
References: <20220324064511.10665-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_235525_002977_F6CBA93F 
X-CRM114-Status: GOOD (  17.17  )
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

MT8192 platform will use rt1015 or rt105p codec, so through the
snd_soc_of_get_dai_link_codecs() to complete the configuration
of dai_link's codecs.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 108 ++++++++++--------
 1 file changed, 59 insertions(+), 49 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index ee91569c0911..837c2ccd5b3d 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -604,17 +604,9 @@ SND_SOC_DAILINK_DEFS(i2s2,
 		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-SND_SOC_DAILINK_DEFS(i2s3_rt1015,
+SND_SOC_DAILINK_DEFS(i2s3,
 		     DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC(RT1015_DEV0_NAME,
-						   RT1015_CODEC_DAI),
-					COMP_CODEC(RT1015_DEV1_NAME,
-						   RT1015_CODEC_DAI)),
-		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
-
-SND_SOC_DAILINK_DEFS(i2s3_rt1015p,
-		     DAILINK_COMP_ARRAY(COMP_CPU("I2S3")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC("rt1015p", "HiFi")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(i2s5,
@@ -929,6 +921,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
+		SND_SOC_DAILINK_REG(i2s3),
 	},
 	{
 		.name = "I2S5",
@@ -1100,55 +1093,64 @@ static struct snd_soc_card mt8192_mt6359_rt1015p_rt5682_card = {
 	.num_dapm_routes = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_routes),
 };
 
+static int mt8192_mt6359_card_set_be_link(struct snd_soc_card *card,
+					  struct snd_soc_dai_link *link,
+					  struct device_node *node,
+					  char *link_name)
+{
+	int ret;
+
+	if (node && strcmp(link->name, link_name) == 0) {
+		ret = snd_soc_of_get_dai_link_codecs(card->dev, node, link);
+		if (ret < 0) {
+			dev_err_probe(card->dev, ret, "get dai link codecs fail\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
-	struct device_node *platform_node, *hdmi_codec;
+	struct device_node *platform_node, *hdmi_codec, *speaker_codec;
 	int ret, i;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8192_mt6359_priv *priv;
 
-	platform_node = of_parse_phandle(pdev->dev.of_node,
-					 "mediatek,platform", 0);
-	if (!platform_node) {
-		dev_err(&pdev->dev, "Property 'platform' missing or invalid\n");
+	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
+	if (!card)
 		return -EINVAL;
+	card->dev = &pdev->dev;
+
+	platform_node = of_parse_phandle(pdev->dev.of_node, "mediatek,platform", 0);
+	if (!platform_node) {
+		ret = -EINVAL;
+		dev_err_probe(&pdev->dev, ret, "Property 'platform' missing or invalid\n");
+		goto err_platform_node;
 	}
 
-	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
-	if (!card) {
+	hdmi_codec = of_parse_phandle(pdev->dev.of_node, "mediatek,hdmi-codec", 0);
+	if (!hdmi_codec) {
 		ret = -EINVAL;
-		goto put_platform_node;
+		dev_err_probe(&pdev->dev, ret, "Property 'hdmi-codec' missing or invalid\n");
+		goto err_hdmi_codec;
 	}
-	card->dev = &pdev->dev;
 
-	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
-				      "mediatek,hdmi-codec", 0);
+	speaker_codec = of_get_child_by_name(pdev->dev.of_node, "speaker-codecs");
+	if (!speaker_codec) {
+		ret = -EINVAL;
+		dev_err_probe(&pdev->dev, ret, "Property 'speaker-codecs' missing or invalid\n");
+		goto err_speaker_codec;
+	}
 
 	for_each_card_prelinks(card, i, dai_link) {
-		if (strcmp(dai_link->name, "I2S3") == 0) {
-			if (card == &mt8192_mt6359_rt1015_rt5682_card) {
-				dai_link->ops = &mt8192_rt1015_i2s_ops;
-				dai_link->cpus = i2s3_rt1015_cpus;
-				dai_link->num_cpus =
-					ARRAY_SIZE(i2s3_rt1015_cpus);
-				dai_link->codecs = i2s3_rt1015_codecs;
-				dai_link->num_codecs =
-					ARRAY_SIZE(i2s3_rt1015_codecs);
-				dai_link->platforms = i2s3_rt1015_platforms;
-				dai_link->num_platforms =
-					ARRAY_SIZE(i2s3_rt1015_platforms);
-			} else if (card == &mt8192_mt6359_rt1015p_rt5682_card) {
-				dai_link->cpus = i2s3_rt1015p_cpus;
-				dai_link->num_cpus =
-					ARRAY_SIZE(i2s3_rt1015p_cpus);
-				dai_link->codecs = i2s3_rt1015p_codecs;
-				dai_link->num_codecs =
-					ARRAY_SIZE(i2s3_rt1015p_codecs);
-				dai_link->platforms = i2s3_rt1015p_platforms;
-				dai_link->num_platforms =
-					ARRAY_SIZE(i2s3_rt1015p_platforms);
-			}
+		ret = mt8192_mt6359_card_set_be_link(card, dai_link, speaker_codec, "I2S3");
+		if (ret) {
+			dev_err_probe(&pdev->dev, ret, "%s set speaker_codec fail\n",
+				      dai_link->name);
+			goto err_probe;
 		}
 
 		if (hdmi_codec && strcmp(dai_link->name, "TDM") == 0) {
@@ -1156,6 +1158,9 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 			dai_link->ignore = 0;
 		}
 
+		if (strcmp(dai_link->codecs[0].dai_name, RT1015_CODEC_DAI) == 0)
+			dai_link->ops = &mt8192_rt1015_i2s_ops;
+
 		if (!dai_link->platforms->name)
 			dai_link->platforms->of_node = platform_node;
 	}
@@ -1163,22 +1168,27 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv) {
 		ret = -ENOMEM;
-		goto put_hdmi_codec;
+		goto err_probe;
 	}
 	snd_soc_card_set_drvdata(card, priv);
 
 	ret = mt8192_afe_gpio_init(&pdev->dev);
 	if (ret) {
-		dev_err(&pdev->dev, "init gpio error %d\n", ret);
-		goto put_hdmi_codec;
+		dev_err_probe(&pdev->dev, ret, "%s init gpio error\n", __func__);
+		goto err_probe;
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	if (ret)
+		dev_err_probe(&pdev->dev, ret, "%s snd_soc_register_card fail\n", __func__);
 
-put_hdmi_codec:
+err_probe:
+	of_node_put(speaker_codec);
+err_speaker_codec:
 	of_node_put(hdmi_codec);
-put_platform_node:
+err_hdmi_codec:
 	of_node_put(platform_node);
+err_platform_node:
 	return ret;
 }
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
