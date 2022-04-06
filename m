Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D61C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L2yGpinYJjJJNtQVxySyp4sGgxMODrb8F2usGtGFCSg=; b=mfVr2/WbkqYDsu
	81mWlU1LZns0vf2BtpGcAitGABHYwC2t2XMXD77NNOXdzYW5bbiO/TkGxczOrd0pweb9CU7Z8Nb6V
	7eOTc99+R/yEfvPpWndvLZ+0py2n6GctdI5JQdthntEPLRfbE3/QCarJmjF4UQoRgs4MD/QWMheux
	31U/hLy7hCckHAQ1k3oXqYceeirF/u2ZmWaAe/qCTyO3htbcOlrNCxFQNOK6PtJmmQmXD/iuEPZZO
	/EblxRohmQxkLXKesAhWYHbeZmUj34akRCpL01tJBuJpEWt8v5B158W1IpU/mrhuWnt3mjQqO+P8Q
	MWJ2b3VMmSDNwFBAPQPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc2xa-005P7R-Mj; Wed, 06 Apr 2022 10:32:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc2Xa-005EMe-1U; Wed, 06 Apr 2022 10:05:31 +0000
X-UUID: eafdc47293eb43de816478309a630fa1-20220406
X-UUID: eafdc47293eb43de816478309a630fa1-20220406
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 159918166; Wed, 06 Apr 2022 03:05:24 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 03:05:22 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 18:05:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Apr 2022 18:05:20 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <nfraprado@collabora.com>,
 <tzungbi@google.com>
CC: <angelogioacchino.delregno@collabora.com>, <aaronyu@google.com>,
 <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, <linmq006@gmail.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.com>, Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [v9 4/4] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Date: Wed, 6 Apr 2022 18:05:14 +0800
Message-ID: <20220406100514.11269-5-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406100514.11269-1-jiaxin.yu@mediatek.com>
References: <20220406100514.11269-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_030530_150444_AA9C3B72 
X-CRM114-Status: GOOD (  14.66  )
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

To support machine that only choose one of the rt5682s and rt5682 as
headset codec, adds new compatible string "mt8192_mt6359_rt1015p_rt5682s".
Meanwhile, using macros to simplifies card name and compatible name.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 sound/soc/mediatek/Kconfig                    |  1 +
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 61 ++++++++++++-------
 2 files changed, 40 insertions(+), 22 deletions(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index ae838bbc7933..9e5ce1a82639 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -179,6 +179,7 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
 	select SND_SOC_RT1015
 	select SND_SOC_RT1015P
 	select SND_SOC_RT5682_I2C
+	select SND_SOC_RT5682S
 	select SND_SOC_DMIC
 	help
 	  This adds ASoC driver for Mediatek MT8192 boards
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 4a11f687d416..2c71bd8a2db8 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -28,6 +28,14 @@
 #define RT1015_DEV0_NAME	"rt1015.1-0028"
 #define RT1015_DEV1_NAME	"rt1015.1-0029"
 
+#define RT1015_RT5682_CARD_NAME "mt8192_mt6359_rt1015_rt5682"
+#define RT1015P_RT5682_CARD_NAME "mt8192_mt6359_rt1015p_rt5682"
+#define RT1015P_RT5682S_CARD_NAME "mt8192_mt6359_rt1015p_rt5682s"
+
+#define RT1015_RT5682_OF_NAME "mediatek,mt8192_mt6359_rt1015_rt5682"
+#define RT1015P_RT5682_OF_NAME "mediatek,mt8192_mt6359_rt1015p_rt5682"
+#define RT1015P_RT5682S_OF_NAME "mediatek,mt8192_mt6359_rt1015p_rt5682s"
+
 struct mt8192_mt6359_priv {
 	struct snd_soc_jack headset_jack;
 	struct snd_soc_jack hdmi_jack;
@@ -68,8 +76,8 @@ static int mt8192_rt1015_i2s_hw_params(struct snd_pcm_substream *substream,
 	return snd_soc_dai_set_sysclk(cpu_dai, 0, mclk_fs, SND_SOC_CLOCK_OUT);
 }
 
-static int mt8192_rt5682_i2s_hw_params(struct snd_pcm_substream *substream,
-				       struct snd_pcm_hw_params *params)
+static int mt8192_rt5682x_i2s_hw_params(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
@@ -118,8 +126,8 @@ static const struct snd_soc_ops mt8192_rt1015_i2s_ops = {
 	.hw_params = mt8192_rt1015_i2s_hw_params,
 };
 
-static const struct snd_soc_ops mt8192_rt5682_i2s_ops = {
-	.hw_params = mt8192_rt5682_i2s_hw_params,
+static const struct snd_soc_ops mt8192_rt5682x_i2s_ops = {
+	.hw_params = mt8192_rt5682x_i2s_hw_params,
 };
 
 static int mt8192_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
@@ -950,7 +958,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.init = mt8192_rt5682_init,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s8),
-		.ops = &mt8192_rt5682_i2s_ops,
+		.ops = &mt8192_rt5682x_i2s_ops,
 	},
 	{
 		.name = "I2S9",
@@ -959,7 +967,7 @@ static struct snd_soc_dai_link mt8192_mt6359_dai_links[] = {
 		.ignore_suspend = 1,
 		.be_hw_params_fixup = mt8192_i2s_hw_params_fixup,
 		SND_SOC_DAILINK_REG(i2s9),
-		.ops = &mt8192_rt5682_i2s_ops,
+		.ops = &mt8192_rt5682x_i2s_ops,
 	},
 	{
 		.name = "CONNSYS_I2S",
@@ -1039,7 +1047,7 @@ static struct snd_soc_codec_conf rt1015_amp_conf[] = {
 };
 
 static struct snd_soc_card mt8192_mt6359_rt1015_rt5682_card = {
-	.name = "mt8192_mt6359_rt1015_rt5682",
+	.name = RT1015_RT5682_CARD_NAME,
 	.owner = THIS_MODULE,
 	.dai_link = mt8192_mt6359_dai_links,
 	.num_links = ARRAY_SIZE(mt8192_mt6359_dai_links),
@@ -1053,14 +1061,13 @@ static struct snd_soc_card mt8192_mt6359_rt1015_rt5682_card = {
 	.num_configs = ARRAY_SIZE(rt1015_amp_conf),
 };
 
-static const struct snd_soc_dapm_widget
-mt8192_mt6359_rt1015p_rt5682_widgets[] = {
+static const struct snd_soc_dapm_widget mt8192_mt6359_rt1015p_rt5682x_widgets[] = {
 	SND_SOC_DAPM_SPK("Speakers", NULL),
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
 
-static const struct snd_soc_dapm_route mt8192_mt6359_rt1015p_rt5682_routes[] = {
+static const struct snd_soc_dapm_route mt8192_mt6359_rt1015p_rt5682x_routes[] = {
 	/* speaker */
 	{ "Speakers", NULL, "Speaker" },
 	/* headset */
@@ -1069,23 +1076,22 @@ static const struct snd_soc_dapm_route mt8192_mt6359_rt1015p_rt5682_routes[] = {
 	{ "IN1P", NULL, "Headset Mic" },
 };
 
-static const struct snd_kcontrol_new mt8192_mt6359_rt1015p_rt5682_controls[] = {
+static const struct snd_kcontrol_new mt8192_mt6359_rt1015p_rt5682x_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speakers"),
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
 };
 
-static struct snd_soc_card mt8192_mt6359_rt1015p_rt5682_card = {
-	.name = "mt8192_mt6359_rt1015p_rt5682",
+static struct snd_soc_card mt8192_mt6359_rt1015p_rt5682x_card = {
 	.owner = THIS_MODULE,
 	.dai_link = mt8192_mt6359_dai_links,
 	.num_links = ARRAY_SIZE(mt8192_mt6359_dai_links),
-	.controls = mt8192_mt6359_rt1015p_rt5682_controls,
-	.num_controls = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_controls),
-	.dapm_widgets = mt8192_mt6359_rt1015p_rt5682_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_widgets),
-	.dapm_routes = mt8192_mt6359_rt1015p_rt5682_routes,
-	.num_dapm_routes = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682_routes),
+	.controls = mt8192_mt6359_rt1015p_rt5682x_controls,
+	.num_controls = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682x_controls),
+	.dapm_widgets = mt8192_mt6359_rt1015p_rt5682x_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682x_widgets),
+	.dapm_routes = mt8192_mt6359_rt1015p_rt5682x_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8192_mt6359_rt1015p_rt5682x_routes),
 };
 
 static int mt8192_mt6359_card_set_be_link(struct snd_soc_card *card,
@@ -1119,6 +1125,13 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	card->dev = &pdev->dev;
 
+	if (of_device_is_compatible(pdev->dev.of_node, RT1015P_RT5682_OF_NAME))
+		card->name = RT1015P_RT5682_CARD_NAME;
+	else if (of_device_is_compatible(pdev->dev.of_node, RT1015P_RT5682S_OF_NAME))
+		card->name = RT1015P_RT5682S_CARD_NAME;
+	else
+		dev_dbg(&pdev->dev, "No need to set card name\n");
+
 	hdmi_codec = of_parse_phandle(pdev->dev.of_node, "mediatek,hdmi-codec", 0);
 	if (!hdmi_codec)
 		dev_dbg(&pdev->dev, "The machine has no hdmi-codec\n");
@@ -1209,12 +1222,16 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
 #ifdef CONFIG_OF
 static const struct of_device_id mt8192_mt6359_dt_match[] = {
 	{
-		.compatible = "mediatek,mt8192_mt6359_rt1015_rt5682",
+		.compatible = RT1015_RT5682_OF_NAME,
 		.data = &mt8192_mt6359_rt1015_rt5682_card,
 	},
 	{
-		.compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682",
-		.data = &mt8192_mt6359_rt1015p_rt5682_card,
+		.compatible = RT1015P_RT5682_OF_NAME,
+		.data = &mt8192_mt6359_rt1015p_rt5682x_card,
+	},
+	{
+		.compatible = RT1015P_RT5682S_OF_NAME,
+		.data = &mt8192_mt6359_rt1015p_rt5682x_card,
 	},
 	{}
 };
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
