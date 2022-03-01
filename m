Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71E6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 07:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vn8T3mcg92B3hOn521McnH5a5Sz0d/SRM+6EaKm1fMc=; b=DhjcGE0sIydVFv
	AM/SsbZOFdtnoL06RXxAyxIZ6qowhjM5kgfOwGRGLVlaMJ4Zy8rt/VbvFRmastq8oh3Dw7amx/mYU
	dU/t3WmghKdsgqq+oER9z6lZT7rVodj3DftcqdQb9cImsBJ6XD64lKbOf7FFbQOB78sZwzWfGUkq5
	mbiMiYLUNJKoJvSPokq7T8U75SZUV7sPiSrorfipMxLr/b7N8LauYWOE2dtq61sD+/lkisriE0bzC
	lUsQEtweCpT3QY+Spv+WyNvdGo7A8ReB0XKT5Egh3nVJgPe1uiYaXlVB5SAtGrr+/KZ3ZKMpEByrK
	VN8yc83StxvezixmLbCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOwx8-00FKFQ-D2; Tue, 01 Mar 2022 07:29:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOwx4-00FKBx-0J; Tue, 01 Mar 2022 07:29:44 +0000
X-UUID: 401d73947c584469948c49a14d88c16b-20220301
X-UUID: 401d73947c584469948c49a14d88c16b-20220301
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 825696553; Tue, 01 Mar 2022 00:29:33 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Feb 2022 23:29:31 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Mar 2022 15:29:30 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Mar 2022 15:29:29 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
CC: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, 
 <tzungbi@google.com>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.corp-partner.google.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.com>
Subject: [PATCH 2/2] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Date: Tue, 1 Mar 2022 15:29:24 +0800
Message-ID: <20220301072924.24814-3-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301072924.24814-1-jiaxin.yu@mediatek.com>
References: <20220301072924.24814-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_232942_061970_814DC630 
X-CRM114-Status: GOOD (  14.78  )
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

From: Jiaxin Yu <jiaxin.yu@mediatek.corp-partner.google.com>

Supports machines with rt1015p and rt5682s.  Uses new proposed compatible
string "mt8192_mt6359_rt1015p_rt5682s".

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/mediatek/Kconfig                    |  1 +
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 87 +++++++++++++++++--
 2 files changed, 83 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index d515613a79da..cacfbab4262d 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -176,6 +176,7 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
 	select SND_SOC_RT1015
 	select SND_SOC_RT1015P
 	select SND_SOC_RT5682_I2C
+	select SND_SOC_RT5682S
 	select SND_SOC_DMIC
 	help
 	  This adds ASoC driver for Mediatek MT8192 boards
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index a606133951b7..17ca6db5cd64 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -31,6 +31,9 @@
 #define RT5682_CODEC_DAI	"rt5682-aif1"
 #define RT5682_DEV0_NAME	"rt5682.1-001a"
 
+#define RT5682S_CODEC_DAI	"rt5682s-aif1"
+#define RT5682S_DEV0_NAME	"rt5682s.1-001a"
+
 struct mt8192_mt6359_priv {
 	struct snd_soc_jack headset_jack;
 	struct snd_soc_jack hdmi_jack;
@@ -632,18 +635,30 @@ SND_SOC_DAILINK_DEFS(i2s7,
 		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-SND_SOC_DAILINK_DEFS(i2s8,
+SND_SOC_DAILINK_DEFS(i2s8_rt5682,
 		     DAILINK_COMP_ARRAY(COMP_CPU("I2S8")),
 		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
 						   RT5682_CODEC_DAI)),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
-SND_SOC_DAILINK_DEFS(i2s9,
+SND_SOC_DAILINK_DEFS(i2s8_rt5682s,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2S8")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682S_DEV0_NAME,
+						   RT5682S_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(i2s9_rt5682,
 		     DAILINK_COMP_ARRAY(COMP_CPU("I2S9")),
 		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682_DEV0_NAME,
 						   RT5682_CODEC_DAI)),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
+SND_SOC_DAILINK_DEFS(i2s9_rt5682s,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2S9")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC(RT5682S_DEV0_NAME,
+						   RT5682S_CODEC_DAI)),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
 SND_SOC_DAILINK_DEFS(connsys_i2s,
 		     DAILINK_COMP_ARRAY(COMP_CPU("CONNSYS_I2S")),
 		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
@@ -961,7 +976,6 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.ignore_suspend = 1,
 		.init = mt8192_rt5682_init,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
-		SND_SOC_DAILINK_REG(i2s8),
 		.ops = &mt8192_rt5682_i2s_ops,
 	},
 	{
@@ -970,7 +984,6 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.dpcm_playback = 1,
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
-		SND_SOC_DAILINK_REG(i2s9),
 		.ops = &mt8192_rt5682_i2s_ops,
 	},
 	{
@@ -1100,6 +1113,19 @@ static struct snd_soc_card mt8192_mt6359_rt1015p_rt5682_card = {
 	.num_dapm_routes = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_routes),
 };
 
+static struct snd_soc_card mt8192_mt6359_rt1015p_rt5682s_card = {
+	.name = "mt8192_mt6359_rt1015p_rt5682s",
+	.owner = THIS_MODULE,
+	.dai_link = mt8192_mt6359_dai_links,
+	.num_links = ARRAY_SIZE(mt8192_mt6359_dai_links),
+	.controls = mt8192_mt6359_rt1015p_rt5682_controls,
+	.num_controls = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_controls),
+	.dapm_widgets = mt8192_mt6359_rt1015p_rt5682_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_widgets),
+	.dapm_routes = mt8192_mt6359_rt1015p_rt5682_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_routes),
+};
+
 static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
@@ -1139,7 +1165,8 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 				dai_link->platforms = i2s3_rt1015_platforms;
 				dai_link->num_platforms =
 					ARRAY_SIZE(i2s3_rt1015_platforms);
-			} else if (card == &mt8192_mt6359_rt1015p_rt5682_card) {
+			} else if (card == &mt8192_mt6359_rt1015p_rt5682_card ||
+				   card == &mt8192_mt6359_rt1015p_rt5682s_card) {
 				dai_link->cpus = i2s3_rt1015p_cpus;
 				dai_link->num_cpus =
 					ARRAY_SIZE(i2s3_rt1015p_cpus);
@@ -1150,6 +1177,52 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 				dai_link->num_platforms =
 					ARRAY_SIZE(i2s3_rt1015p_platforms);
 			}
+		} else if (strcmp(dai_link->name, "I2S8") == 0) {
+			if (card == &mt8192_mt6359_rt1015_rt5682_card ||
+			    card == &mt8192_mt6359_rt1015p_rt5682_card) {
+				dai_link->cpus = i2s8_rt5682_cpus;
+				dai_link->num_cpus =
+					ARRAY_SIZE(i2s8_rt5682_cpus);
+				dai_link->codecs = i2s8_rt5682_codecs;
+				dai_link->num_codecs =
+					ARRAY_SIZE(i2s8_rt5682_codecs);
+				dai_link->platforms = i2s8_rt5682_platforms;
+				dai_link->num_platforms =
+					ARRAY_SIZE(i2s8_rt5682_platforms);
+			} else if (card == &mt8192_mt6359_rt1015p_rt5682s_card) {
+				dai_link->cpus = i2s8_rt5682s_cpus;
+				dai_link->num_cpus =
+					ARRAY_SIZE(i2s8_rt5682s_cpus);
+				dai_link->codecs = i2s8_rt5682s_codecs;
+				dai_link->num_codecs =
+					ARRAY_SIZE(i2s8_rt5682s_codecs);
+				dai_link->platforms = i2s8_rt5682s_platforms;
+				dai_link->num_platforms =
+					ARRAY_SIZE(i2s8_rt5682s_platforms);
+			}
+		} else if (strcmp(dai_link->name, "I2S9") == 0) {
+			if (card == &mt8192_mt6359_rt1015_rt5682_card ||
+			    card == &mt8192_mt6359_rt1015p_rt5682_card) {
+				dai_link->cpus = i2s9_rt5682_cpus;
+				dai_link->num_cpus =
+					ARRAY_SIZE(i2s9_rt5682_cpus);
+				dai_link->codecs = i2s9_rt5682_codecs;
+				dai_link->num_codecs =
+					ARRAY_SIZE(i2s9_rt5682_codecs);
+				dai_link->platforms = i2s9_rt5682_platforms;
+				dai_link->num_platforms =
+					ARRAY_SIZE(i2s9_rt5682_platforms);
+			} else if (card == &mt8192_mt6359_rt1015p_rt5682s_card) {
+				dai_link->cpus = i2s9_rt5682s_cpus;
+				dai_link->num_cpus =
+					ARRAY_SIZE(i2s9_rt5682s_cpus);
+				dai_link->codecs = i2s9_rt5682s_codecs;
+				dai_link->num_codecs =
+					ARRAY_SIZE(i2s9_rt5682s_codecs);
+				dai_link->platforms = i2s9_rt5682s_platforms;
+				dai_link->num_platforms =
+					ARRAY_SIZE(i2s9_rt5682s_platforms);
+			}
 		}
 
 		if (hdmi_codec && strcmp(dai_link->name, "TDM") == 0) {
@@ -1185,6 +1258,10 @@ static const struct of_device_id mt8192_mt6359_dt_match[] = {
 		.compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682",
 		.data = &mt8192_mt6359_rt1015p_rt5682_card,
 	},
+	{
+		.compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682s",
+		.data = &mt8192_mt6359_rt1015p_rt5682s_card,
+	},
 	{}
 };
 #endif
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
