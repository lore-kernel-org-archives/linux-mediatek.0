Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3606C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 10:37:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ACE560FE6
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 10:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7ACE560FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCECNINrfXFWgUnshEyWJBpQOIWHFCSn4Wrs3ra0c8Y=; b=tp0jhoSCYA2zJN
	6sXqEP/uI3tGK92Bwz9KoI3ob+S1PE0ZTl9IPr3qlH9rY0wVPkgzULdqiF2KR03OpeJPD0Z5ah+rc
	/bWZZ0VJ751JjRpYAvPa9XmxHKjEm35dsr28zpc4YbwwBasVrAxJk0vmpCHF2iNNJdnZefwhgIfXJ
	8ZFV9w0Z0YUsayoJ8XMtZTV7yP2oC76REUbognRPvNz56+a+NXIoVDZ09WR91Px92wDw32Q1nT9mO
	hXrikkSv6TT1sklTP/zQ8NQa7+vlj8yaBVd8fs9HQKiaBThL+d6vZgU+no+KvqFKPho4JBptje0Om
	n5jJfuBx+bV9lfSJrHjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGIwH-005AWy-60; Wed, 18 Aug 2021 10:36:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGIsD-00587O-4u; Wed, 18 Aug 2021 10:32:45 +0000
X-UUID: 79a8517a81334adebabc559efc09bd26-20210818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6f63r2snCy7Qa12UdqnrRoQq1RQldZhgz6Z/W0fZ4Xc=; 
 b=IO19cAaLDhV8CxWKnG+3//3243fC8jksnIXksmonb9xoS80WV2PlWSladzFJkVXn15Em7gTSA0dzSPyuSniE7uw1810BEfgR3sVXmSd5tidj0APap/qwjeZwkE1lM8fkAhet5DjLG2pqAesFsJah8whT2V4rKE8NR7lrrWYhzTQ=;
X-UUID: 79a8517a81334adebabc559efc09bd26-20210818
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1882718782; Wed, 18 Aug 2021 03:32:27 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 03:32:25 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 18:32:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 18 Aug 2021 18:32:22 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <bicycle.tsai@mediatek.com>, <jiaxin.yu@mediatek.com>, <cychiang@google.com>, 
 <aaronyu@google.com>, <wenst@chromium.org>
Subject: [PATCH v4 09/11] ASoC: mediatek: mt8195: add DPTX audio support
Date: Wed, 18 Aug 2021 18:32:13 +0800
Message-ID: <20210818103215.9186-10-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210818103215.9186-1-trevor.wu@mediatek.com>
References: <20210818103215.9186-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_033241_242513_379C9262 
X-CRM114-Status: GOOD (  19.85  )
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

This patch adds DPTX audio support on mt8195-mt6359-rt1019-rt5682 board.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/Kconfig                    |  1 +
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 88 +++++++++++++++++--
 2 files changed, 84 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index bfee954d0c7c..cf567a89f421 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -202,6 +202,7 @@ config SND_SOC_MT8195_MT6359_RT1019_RT5682
 	select SND_SOC_RT1015P
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_DMIC
+	select SND_SOC_HDMI_CODEC
 	help
 	  This adds ASoC driver for Mediatek MT8195 boards
 	  with the MT6359 RT1019 RT5682 audio codec.
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index 39b33aecc1e9..d853bc445753 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -27,6 +27,7 @@
 
 struct mt8195_mt6359_rt1019_rt5682_priv {
 	struct snd_soc_jack headset_jack;
+	struct snd_soc_jack dp_jack;
 };
 
 static const struct snd_soc_dapm_widget
@@ -327,6 +328,52 @@ static int mt8195_etdm_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+static int mt8195_hdmitx_dptx_startup(struct snd_pcm_substream *substream)
+{
+	static const unsigned int rates[] = {
+		48000
+	};
+	static const unsigned int channels[] = {
+		2, 4, 6, 8
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_rates = {
+		.count = ARRAY_SIZE(rates),
+		.list  = rates,
+		.mask = 0,
+	};
+	static const struct snd_pcm_hw_constraint_list constraints_channels = {
+		.count = ARRAY_SIZE(channels),
+		.list  = channels,
+		.mask = 0,
+	};
+
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	int ret;
+
+	ret = snd_pcm_hw_constraint_list(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_RATE,
+					 &constraints_rates);
+	if (ret < 0) {
+		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
+		return ret;
+	}
+
+	ret = snd_pcm_hw_constraint_list(runtime, 0,
+					 SNDRV_PCM_HW_PARAM_CHANNELS,
+					 &constraints_channels);
+	if (ret < 0) {
+		dev_err(rtd->dev, "hw_constraint_list channel failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops mt8195_hdmitx_dptx_playback_ops = {
+	.startup = mt8195_hdmitx_dptx_startup,
+};
+
 static int mt8195_dptx_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
@@ -344,8 +391,25 @@ static struct snd_soc_ops mt8195_dptx_ops = {
 	.hw_params = mt8195_dptx_hw_params,
 };
 
-static int mt8195_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
-				       struct snd_pcm_hw_params *params)
+static int mt8195_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct mt8195_mt6359_rt1019_rt5682_priv *priv =
+		snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_component *cmpnt_codec =
+		asoc_rtd_to_codec(rtd, 0)->component;
+	int ret = 0;
+
+	ret = snd_soc_card_jack_new(rtd->card, "DP Jack", SND_JACK_LINEOUT,
+				    &priv->dp_jack, NULL, 0);
+	if (ret)
+		return ret;
+
+	return snd_soc_component_set_jack(cmpnt_codec, &priv->dp_jack, NULL);
+}
+
+static int mt8195_hdmitx_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+					      struct snd_pcm_hw_params *params)
+
 {
 	/* fix BE i2s format to 32bit, clean param mask first */
 	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
@@ -687,6 +751,7 @@ static struct snd_soc_dai_link mt8195_mt6359_rt1019_rt5682_dai_links[] = {
 		},
 		.dynamic = 1,
 		.dpcm_playback = 1,
+		.ops = &mt8195_hdmitx_dptx_playback_ops,
 		SND_SOC_DAILINK_REG(DL10_FE),
 	},
 	[DAI_LINK_DL11_FE] = {
@@ -820,7 +885,7 @@ static struct snd_soc_dai_link mt8195_mt6359_rt1019_rt5682_dai_links[] = {
 		.no_pcm = 1,
 		.dpcm_playback = 1,
 		.ops = &mt8195_dptx_ops,
-		.be_hw_params_fixup = mt8195_dptx_hw_params_fixup,
+		.be_hw_params_fixup = mt8195_hdmitx_dptx_hw_params_fixup,
 		SND_SOC_DAILINK_REG(DPTX_BE),
 	},
 	[DAI_LINK_ETDM1_IN_BE] = {
@@ -915,7 +980,6 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 	struct device_node *platform_node;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8195_mt6359_rt1019_rt5682_priv *priv = NULL;
-
 	int ret, i;
 
 	card->dev = &pdev->dev;
@@ -930,6 +994,20 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 	for_each_card_prelinks(card, i, dai_link) {
 		if (!dai_link->platforms->name)
 			dai_link->platforms->of_node = platform_node;
+
+		if (strcmp(dai_link->name, "DPTX_BE") == 0) {
+			dai_link->codecs->of_node =
+				of_parse_phandle(pdev->dev.of_node,
+						 "mediatek,dptx-codec", 0);
+			if (!dai_link->codecs->of_node) {
+				dev_err(&pdev->dev, "Property 'dptx-codec' missing or invalid\n");
+				return -EINVAL;
+			}
+
+			dai_link->codecs->name = NULL;
+			dai_link->codecs->dai_name = "i2s-hifi";
+			dai_link->init = mt8195_dptx_codec_init;
+		}
 	}
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -940,7 +1018,7 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret)
-		dev_dbg(&pdev->dev, "%s snd_soc_register_card fail %d\n",
+		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
 			__func__, ret);
 	return ret;
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
