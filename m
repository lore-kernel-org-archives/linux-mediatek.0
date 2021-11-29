Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EC9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 14:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=usKVMQ4GCRCspRQ5D3j1Pgh1JpnDRLxddjmvlWSG+AE=; b=SLpYXS0uCHWdzr
	1RJb5XqpXTH6gxyhxuOSOJOrT4ZqkxDd2Qon2oS8r0Bl2fOJUWGE7ai+7hLqkurCpWjwt0R4OvWLa
	EgvqVq713TGGoO86gcA01Y5EGCG+tCvLIrgURqLl3xyqcM3D5t34CBaWW22F9pLD1jRmti4n5S+P+
	hZ6fauWRNuTGv5tzcYhIst/DacqcoQkVuAqcYK1HgQOLl98IOF5cVuoGRNU86S/TfzISv2dzNmiYL
	ufXqltmgcbCqVatLjYYd2Dx10NgV0D6emnsFfJMF9O0AtqeBh8quCijLvpV9OamARsB+xnlrmWltK
	D6ii8c+FZ1MRddtea8VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrhXK-00101G-CG; Mon, 29 Nov 2021 14:21:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrhWq-000zr4-Rs; Mon, 29 Nov 2021 14:21:14 +0000
X-UUID: 67371c8f84e247918c1a11c13c6ee4fc-20211129
X-UUID: 67371c8f84e247918c1a11c13c6ee4fc-20211129
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1128126047; Mon, 29 Nov 2021 07:21:09 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Nov 2021 06:11:12 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Nov 2021 22:11:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 29 Nov 2021 22:11:05 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <yc.hung@mediatek.com>, <daniel.baluta@nxp.com>,
 <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 1/4] ASoC: mediatek: mt8195: add headset codec rt5682s
 support
Date: Mon, 29 Nov 2021 22:10:54 +0800
Message-ID: <20211129141057.12422-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211129141057.12422-1-trevor.wu@mediatek.com>
References: <20211129141057.12422-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_062112_916633_AC56CF53 
X-CRM114-Status: GOOD (  15.77  )
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

mt8195 machine driver adds rt5682s support in this patch.
Card name can be specified from dts by model property, and driver makes
use of the name to distinguish which headset codec is on the board.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/Kconfig                    |  2 ++
 .../mt8195/mt8195-mt6359-rt1011-rt5682.c      | 29 +++++++++++++-----
 .../mt8195/mt8195-mt6359-rt1019-rt5682.c      | 30 ++++++++++++++-----
 3 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 3b1ddea26a9e..9306b7ca2644 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -205,6 +205,7 @@ config SND_SOC_MT8195_MT6359_RT1019_RT5682
 	select SND_SOC_MT6359
 	select SND_SOC_RT1015P
 	select SND_SOC_RT5682_I2C
+	select SND_SOC_RT5682S
 	select SND_SOC_DMIC
 	select SND_SOC_HDMI_CODEC
 	help
@@ -220,6 +221,7 @@ config SND_SOC_MT8195_MT6359_RT1011_RT5682
 	select SND_SOC_MT6359
 	select SND_SOC_RT1011
 	select SND_SOC_RT5682_I2C
+	select SND_SOC_RT5682S
 	select SND_SOC_DMIC
 	select SND_SOC_HDMI_CODEC
 	help
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
index e103102d7ef6..797f155c882b 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1011-rt5682.c
@@ -27,6 +27,9 @@
 #define RT5682_CODEC_DAI	"rt5682-aif1"
 #define RT5682_DEV0_NAME	"rt5682.2-001a"
 
+#define RT5682S_CODEC_DAI	"rt5682s-aif1"
+#define RT5682S_DEV0_NAME	"rt5682s.2-001a"
+
 struct mt8195_mt6359_rt1011_rt5682_priv {
 	struct device_node *platform_node;
 	struct device_node *hdmi_node;
@@ -691,14 +694,12 @@ SND_SOC_DAILINK_DEFS(ETDM1_IN_BE,
 
 SND_SOC_DAILINK_DEFS(ETDM2_IN_BE,
 		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM2_IN")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
-						   RT5682_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(ETDM1_OUT_BE,
 		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM1_OUT")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
-						   RT5682_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(ETDM2_OUT_BE,
@@ -1046,9 +1047,19 @@ static int mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &mt8195_mt6359_rt1011_rt5682_soc_card;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8195_mt6359_rt1011_rt5682_priv *priv;
+	int is5682s = 0;
 	int ret, i;
 
 	card->dev = &pdev->dev;
+	ret = snd_soc_of_parse_card_name(card, "model");
+	if (ret) {
+		dev_err(&pdev->dev, "%s new card name parsing error %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	if (strstr(card->name, "_5682s"))
+		is5682s = 1;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -1078,9 +1089,7 @@ static int mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
 				dai_link->codecs->dai_name = "i2s-hifi";
 				dai_link->init = mt8195_dptx_codec_init;
 			}
-		}
-
-		if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
+		} else if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
 			priv->hdmi_node =
 				of_parse_phandle(pdev->dev.of_node,
 						 "mediatek,hdmi-codec", 0);
@@ -1092,6 +1101,12 @@ static int mt8195_mt6359_rt1011_rt5682_dev_probe(struct platform_device *pdev)
 				dai_link->codecs->dai_name = "i2s-hifi";
 				dai_link->init = mt8195_hdmi_codec_init;
 			}
+		} else if (strcmp(dai_link->name, "ETDM1_OUT_BE") == 0 ||
+			   strcmp(dai_link->name, "ETDM2_IN_BE") == 0) {
+			dai_link->codecs->name =
+				is5682s ? RT5682S_DEV0_NAME : RT5682_DEV0_NAME;
+			dai_link->codecs->dai_name =
+				is5682s ? RT5682S_CODEC_DAI : RT5682_CODEC_DAI;
 		}
 	}
 
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
index 95abaadcd842..7209c70acf6e 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359-rt1019-rt5682.c
@@ -25,6 +25,9 @@
 #define RT5682_CODEC_DAI	"rt5682-aif1"
 #define RT5682_DEV0_NAME	"rt5682.2-001a"
 
+#define RT5682S_CODEC_DAI	"rt5682s-aif1"
+#define RT5682S_DEV0_NAME	"rt5682s.2-001a"
+
 struct mt8195_mt6359_rt1019_rt5682_priv {
 	struct device_node *platform_node;
 	struct device_node *hdmi_node;
@@ -661,14 +664,12 @@ SND_SOC_DAILINK_DEFS(ETDM1_IN_BE,
 
 SND_SOC_DAILINK_DEFS(ETDM2_IN_BE,
 		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM2_IN")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
-						   RT5682_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(ETDM1_OUT_BE,
 		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM1_OUT")),
-		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
-						   RT5682_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(ETDM2_OUT_BE,
@@ -999,10 +1000,21 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &mt8195_mt6359_rt1019_rt5682_soc_card;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8195_mt6359_rt1019_rt5682_priv *priv;
+	int is5682s = 0;
 	int ret, i;
 
 	card->dev = &pdev->dev;
 
+	ret = snd_soc_of_parse_card_name(card, "model");
+	if (ret) {
+		dev_err(&pdev->dev, "%s new card name parsing error %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	if (strstr(card->name, "_5682s"))
+		is5682s = 1;
+
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -1031,9 +1043,7 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 				dai_link->codecs->dai_name = "i2s-hifi";
 				dai_link->init = mt8195_dptx_codec_init;
 			}
-		}
-
-		if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
+		} else if (strcmp(dai_link->name, "ETDM3_OUT_BE") == 0) {
 			priv->hdmi_node =
 				of_parse_phandle(pdev->dev.of_node,
 						 "mediatek,hdmi-codec", 0);
@@ -1045,6 +1055,12 @@ static int mt8195_mt6359_rt1019_rt5682_dev_probe(struct platform_device *pdev)
 				dai_link->codecs->dai_name = "i2s-hifi";
 				dai_link->init = mt8195_hdmi_codec_init;
 			}
+		} else if (strcmp(dai_link->name, "ETDM1_OUT_BE") == 0 ||
+			   strcmp(dai_link->name, "ETDM2_IN_BE") == 0) {
+			dai_link->codecs->name =
+				is5682s ? RT5682S_DEV0_NAME : RT5682_DEV0_NAME;
+			dai_link->codecs->dai_name =
+				is5682s ? RT5682S_CODEC_DAI : RT5682_CODEC_DAI;
 		}
 	}
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
