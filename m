Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A06C001E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 09:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkARJXQYgTeXGkYcE/uxXUXg6xOjAWmzzNs8TbyUKdM=; b=Dy/gfZ3SD7/6WFInWLpKy1qtLm
	Mmz92OBiPrvCbTPPLZ8V9K9NmFXjunWA143ZNI14YEXq2DpVtlqPlMP2kTGqbRI1XckztELZG4lKw
	MKiZISJOJ/TGeljj5RGkH4FdClmKWOSi1P9smo0INMc5JchR+9y2q/eLLRywqqjgVFraMDUcROxkg
	ltbK7YFvlFkdEN+cRXx+QWuHlXl2i6dkWzjhlIyNVDwWhcWDDlVVIjbbaB9P7aIiAbFZIoMRLACzi
	Fr7bTYg2YSVXrIChQtF7+yZM60XhyjZ93RKfR1cNH3Zf4hvBspGaVrrzA3O+OW0HpHwg+kD3YtmGG
	+sB1zALg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJTs-002aso-0I;
	Fri, 28 Jul 2023 09:09:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJTX-002al6-1h;
	Fri, 28 Jul 2023 09:09:34 +0000
X-UUID: 7438b0c82d2611ee912e1518a6540028-20230728
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IkARJXQYgTeXGkYcE/uxXUXg6xOjAWmzzNs8TbyUKdM=;
	b=h7GHSKiMFSKUH6E5xZjZyg35lgPhX9dsOh9okBTC1ix1ngLxW9lJ9xyJ/JedQoOBwF1ES3qaZhKap5xfA0y5FzUWpmxxZMj1zUpfP5YfchNBAr8zfddSb8vNU6zEV8O+0Kqqa69n5qY6HR07CWM8aWt900VIbSUZBxLOi5VpBNU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.30,REQID:180292b1-b29a-47c4-8ce1-cd8a4a3e0286,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.30,REQID:180292b1-b29a-47c4-8ce1-cd8a4a3e0286,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:1fcc6f8,CLOUDID:383ba2a0-0933-4333-8d4f-6c3c53ebd55b,B
	ulkID:230728170929XJ1WU9BQ,BulkQuantity:0,Recheck:0,SF:28|17|19|48|38|29,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: 7438b0c82d2611ee912e1518a6540028-20230728
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 382692725; Fri, 28 Jul 2023 02:09:27 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 28 Jul 2023 17:08:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 28 Jul 2023 17:08:50 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>, Arnd
 Bergmann <arnd@arndb.de>, Mars Chen
	<chenxiangrui@huaqin.corp-partner.google.com>, Allen-KH Cheng
	<allen-kh.cheng@mediatek.com>, <alsa-devel@alsa-project.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH v3 4/6] ASoC: mediatek: mt7986: add machine driver with wm8960
Date: Fri, 28 Jul 2023 17:08:17 +0800
Message-ID: <20230728090819.18038-5-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230728090819.18038-1-maso.huang@mediatek.com>
References: <20230728090819.18038-1-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_020931_592357_FE5AA6C8 
X-CRM114-Status: GOOD (  22.92  )
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

Add support for mt7986 board with wm8960.

Signed-off-by: Maso Huang <maso.huang@mediatek.com>
---
 sound/soc/mediatek/Kconfig                |  10 ++
 sound/soc/mediatek/mt7986/Makefile        |   1 +
 sound/soc/mediatek/mt7986/mt7986-wm8960.c | 184 ++++++++++++++++++++++
 3 files changed, 195 insertions(+)
 create mode 100644 sound/soc/mediatek/mt7986/mt7986-wm8960.c

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 558827755a8d..8d1bc8814486 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -64,6 +64,16 @@ config SND_SOC_MT7986
 	  Select Y if you have such device.
 	  If unsure select "N".
 
+config SND_SOC_MT7986_WM8960
+	tristate "ASoc Audio driver for MT7986 with WM8960 codec"
+	depends on SND_SOC_MT7986 && I2C
+	select SND_SOC_WM8960
+	help
+	  This adds support for ASoC machine driver for MediaTek MT7986
+	  boards with the WM8960 codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
+
 config SND_SOC_MT8173
 	tristate "ASoC support for Mediatek MT8173 chip"
 	depends on ARCH_MEDIATEK
diff --git a/sound/soc/mediatek/mt7986/Makefile b/sound/soc/mediatek/mt7986/Makefile
index de0742a67cae..fc4c82559b29 100644
--- a/sound/soc/mediatek/mt7986/Makefile
+++ b/sound/soc/mediatek/mt7986/Makefile
@@ -6,3 +6,4 @@ snd-soc-mt7986-afe-objs := \
 	mt7986-dai-etdm.o
 
 obj-$(CONFIG_SND_SOC_MT7986) += snd-soc-mt7986-afe.o
+obj-$(CONFIG_SND_SOC_MT7986_WM8960) += mt7986-wm8960.o
diff --git a/sound/soc/mediatek/mt7986/mt7986-wm8960.c b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
new file mode 100644
index 000000000000..a880fcb8662e
--- /dev/null
+++ b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
@@ -0,0 +1,184 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mt7986-wm8960.c  --  MT7986-WM8960 ALSA SoC machine driver
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Vic Wu <vic.wu@mediatek.com>
+ *         Maso Huang <maso.huang@mediatek.com>
+ */
+
+#include <linux/module.h>
+#include <sound/soc.h>
+
+#include "mt7986-afe-common.h"
+
+struct mt7986_wm8960_priv {
+	struct device_node *platform_node;
+	struct device_node *codec_node;
+};
+
+static const struct snd_soc_dapm_widget mt7986_wm8960_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("AMIC", NULL),
+};
+
+static const struct snd_kcontrol_new mt7986_wm8960_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("AMIC"),
+};
+
+SND_SOC_DAILINK_DEFS(playback,
+	DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture,
+	DAILINK_COMP_ARRAY(COMP_CPU("UL1")),
+	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(codec,
+	DAILINK_COMP_ARRAY(COMP_CPU("ETDM")),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8960-hifi")),
+	DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link mt7986_wm8960_dai_links[] = {
+	/* FE */
+	{
+		.name = "wm8960-playback",
+		.stream_name = "wm8960-playback",
+		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
+			    SND_SOC_DPCM_TRIGGER_POST},
+		.dynamic = 1,
+		.dpcm_playback = 1,
+		SND_SOC_DAILINK_REG(playback),
+	},
+	{
+		.name = "wm8960-capture",
+		.stream_name = "wm8960-capture",
+		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
+			    SND_SOC_DPCM_TRIGGER_POST},
+		.dynamic = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(capture),
+	},
+	/* BE */
+	{
+		.name = "wm8960-codec",
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBS_CFS |
+			SND_SOC_DAIFMT_GATED,
+		.dpcm_playback = 1,
+		.dpcm_capture = 1,
+		SND_SOC_DAILINK_REG(codec),
+	},
+};
+
+static struct snd_soc_card mt7986_wm8960_card = {
+	.name = "mt7986-wm8960",
+	.owner = THIS_MODULE,
+	.dai_link = mt7986_wm8960_dai_links,
+	.num_links = ARRAY_SIZE(mt7986_wm8960_dai_links),
+	.controls = mt7986_wm8960_controls,
+	.num_controls = ARRAY_SIZE(mt7986_wm8960_controls),
+	.dapm_widgets = mt7986_wm8960_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt7986_wm8960_widgets),
+};
+
+static int mt7986_wm8960_machine_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = &mt7986_wm8960_card;
+	struct snd_soc_dai_link *dai_link;
+	struct mt7986_wm8960_priv *priv;
+	int ret, i;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->platform_node = of_parse_phandle(pdev->dev.of_node,
+					       "mediatek,platform", 0);
+	if (!priv->platform_node) {
+		dev_err(&pdev->dev, "Property 'platform' missing or invalid\n");
+		return -EINVAL;
+	}
+
+	for_each_card_prelinks(card, i, dai_link) {
+		if (dai_link->platforms->name)
+			continue;
+		dai_link->platforms->of_node = priv->platform_node;
+	}
+
+	card->dev = &pdev->dev;
+
+	priv->codec_node = of_parse_phandle(pdev->dev.of_node,
+					    "mediatek,audio-codec", 0);
+	if (!priv->codec_node) {
+		dev_err(&pdev->dev,
+			"Property 'audio-codec' missing or invalid\n");
+		of_node_put(priv->platform_node);
+		return -EINVAL;
+	}
+
+	for_each_card_prelinks(card, i, dai_link) {
+		if (dai_link->codecs->name)
+			continue;
+		dai_link->codecs->of_node = priv->codec_node;
+	}
+
+	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
+	if (ret) {
+		dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
+		goto err_of_node_put;
+	}
+
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	if (ret) {
+		dev_err(&pdev->dev, "%s snd_soc_register_card fail %d\n",
+			__func__, ret);
+		goto err_of_node_put;
+	}
+
+err_of_node_put:
+	of_node_put(priv->codec_node);
+	of_node_put(priv->platform_node);
+	return ret;
+}
+
+static void mt7986_wm8960_machine_remove(struct platform_device *pdev)
+{
+	struct snd_soc_card *card = platform_get_drvdata(pdev);
+	struct mt7986_wm8960_priv *priv = snd_soc_card_get_drvdata(card);
+
+	of_node_put(priv->codec_node);
+	of_node_put(priv->platform_node);
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id mt7986_wm8960_machine_dt_match[] = {
+	{.compatible = "mediatek,mt7986-wm8960-machine",},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mt7986_wm8960_machine_dt_match);
+#endif
+
+static struct platform_driver mt7986_wm8960_machine = {
+	.driver = {
+		.name = "mt7986-wm8960",
+#ifdef CONFIG_OF
+		.of_match_table = mt7986_wm8960_machine_dt_match,
+#endif
+	},
+	.probe = mt7986_wm8960_machine_probe,
+	.remove_new = mt7986_wm8960_machine_remove,
+};
+
+module_platform_driver(mt7986_wm8960_machine);
+
+/* Module information */
+MODULE_DESCRIPTION("MT7986 WM8960 ALSA SoC machine driver");
+MODULE_AUTHOR("Vic Wu <vic.wu@mediatek.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("mt7986 wm8960 soc card");
-- 
2.18.0


