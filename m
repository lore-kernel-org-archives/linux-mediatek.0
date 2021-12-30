Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4962C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 08:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I8jyW+gDDiXFy9Rd7IL78GA0Sw09w//cUsqYuRgFdhQ=; b=0eD+KxjZcRyIBf
	half2kxxwF1b3vY96zdE/wtguxD7ZA2dd4j9i1dl8iSeK7pJ1xexLYt5++1aCE+gcf+bJ8DifcwVH
	lTsM+/EfiiwVOBMLnuyw1TfJs3w9svnJ1Gm5WyjcKCgDPX9uaFOlvlA25kZ//HtlhqH1aARyGVqdt
	Rnwqgp/IIyFxvQ1P0d2KEShBTo8s3v1tqqb1ZOUOSs+amN8B4SSb6w5XlB/SU+yr3TpZ9elTzpqAy
	hf8lHKTuJ3n205vXSa0RRgrNzZpCRRB83LlV3tLY6QDKCT6geMpxDyAbaqJobf6+aGGxNP7HyX6tF
	NmzguYJfZrkxfKAT7acA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2rFv-0045i5-JK; Thu, 30 Dec 2021 08:57:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2rFs-0045h4-NK; Thu, 30 Dec 2021 08:57:50 +0000
X-UUID: 07bf5cebf15243dd9f73935b2314fd50-20211230
X-UUID: 07bf5cebf15243dd9f73935b2314fd50-20211230
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1711479007; Thu, 30 Dec 2021 01:57:45 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Dec 2021 00:47:43 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 30 Dec 2021 16:47:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 30 Dec 2021 16:47:35 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: mediatek: mt8195: correct pcmif BE dai control flow
Date: Thu, 30 Dec 2021 16:47:30 +0800
Message-ID: <20211230084731.31372-2-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211230084731.31372-1-trevor.wu@mediatek.com>
References: <20211230084731.31372-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_005748_789878_5BF49C37 
X-CRM114-Status: GOOD (  16.54  )
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

Originally, the conditions for preventing reentry are not correct.
dai->component->active is not the state specifically for pcmif dai, so it
is not a correct condition to indicate the status of pcmif dai.
On the other hand, snd_soc_dai_stream_actvie() in prepare ops for both
playback and capture possibly return true at the first entry when these
two streams are opened at the same time.

In the patch, I refer to the implementation in mt8192-dai-pcm.c.
Clock and enabling bit for PCMIF are managed by DAPM, and the condition
for prepare ops is replaced by the status of dai widget.

Fixes: 1f95c019115c ("ASoC: mediatek: mt8195: support pcm in platform driver")
Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-pcm.c | 73 +++++++---------------
 sound/soc/mediatek/mt8195/mt8195-reg.h     |  1 +
 2 files changed, 22 insertions(+), 52 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
index 5d10d2c4c991..151914c873ac 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-pcm.c
@@ -80,8 +80,15 @@ static const struct snd_soc_dapm_widget mtk_dai_pcm_widgets[] = {
 			   mtk_dai_pcm_o001_mix,
 			   ARRAY_SIZE(mtk_dai_pcm_o001_mix)),
 
+	SND_SOC_DAPM_SUPPLY("PCM_EN", PCM_INTF_CON1,
+			    PCM_INTF_CON1_PCM_EN_SHIFT, 0, NULL, 0),
+
 	SND_SOC_DAPM_INPUT("PCM1_INPUT"),
 	SND_SOC_DAPM_OUTPUT("PCM1_OUTPUT"),
+
+	SND_SOC_DAPM_CLOCK_SUPPLY("aud_asrc11"),
+	SND_SOC_DAPM_CLOCK_SUPPLY("aud_asrc12"),
+	SND_SOC_DAPM_CLOCK_SUPPLY("aud_pcmif"),
 };
 
 static const struct snd_soc_dapm_route mtk_dai_pcm_routes[] = {
@@ -97,22 +104,18 @@ static const struct snd_soc_dapm_route mtk_dai_pcm_routes[] = {
 	{"PCM1 Playback", NULL, "O000"},
 	{"PCM1 Playback", NULL, "O001"},
 
+	{"PCM1 Playback", NULL, "PCM_EN"},
+	{"PCM1 Playback", NULL, "aud_asrc12"},
+	{"PCM1 Playback", NULL, "aud_pcmif"},
+
+	{"PCM1 Capture", NULL, "PCM_EN"},
+	{"PCM1 Capture", NULL, "aud_asrc11"},
+	{"PCM1 Capture", NULL, "aud_pcmif"},
+
 	{"PCM1_OUTPUT", NULL, "PCM1 Playback"},
 	{"PCM1 Capture", NULL, "PCM1_INPUT"},
 };
 
-static void mtk_dai_pcm_enable(struct mtk_base_afe *afe)
-{
-	regmap_update_bits(afe->regmap, PCM_INTF_CON1,
-			   PCM_INTF_CON1_PCM_EN, PCM_INTF_CON1_PCM_EN);
-}
-
-static void mtk_dai_pcm_disable(struct mtk_base_afe *afe)
-{
-	regmap_update_bits(afe->regmap, PCM_INTF_CON1,
-			   PCM_INTF_CON1_PCM_EN, 0x0);
-}
-
 static int mtk_dai_pcm_configure(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
@@ -207,54 +210,22 @@ static int mtk_dai_pcm_configure(struct snd_pcm_substream *substream,
 }
 
 /* dai ops */
-static int mtk_dai_pcm_startup(struct snd_pcm_substream *substream,
-			       struct snd_soc_dai *dai)
-{
-	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-
-	if (dai->component->active)
-		return 0;
-
-	mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_ASRC11]);
-	mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_ASRC12]);
-	mt8195_afe_enable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_PCMIF]);
-
-	return 0;
-}
-
-static void mtk_dai_pcm_shutdown(struct snd_pcm_substream *substream,
-				 struct snd_soc_dai *dai)
-{
-	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-
-	if (dai->component->active)
-		return;
-
-	mtk_dai_pcm_disable(afe);
-
-	mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_PCMIF]);
-	mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_ASRC12]);
-	mt8195_afe_disable_clk(afe, afe_priv->clk[MT8195_CLK_AUD_ASRC11]);
-}
-
 static int mtk_dai_pcm_prepare(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
-	int ret = 0;
+	int ret;
 
-	if (snd_soc_dai_stream_active(dai, SNDRV_PCM_STREAM_PLAYBACK) &&
-	    snd_soc_dai_stream_active(dai, SNDRV_PCM_STREAM_CAPTURE))
+	dev_dbg(dai->dev, "%s(), id %d, stream %d, widget active p %d, c %d\n",
+		__func__, dai->id, substream->stream,
+		dai->playback_widget->active, dai->capture_widget->active);
+
+	if (dai->playback_widget->active || dai->capture_widget->active)
 		return 0;
 
 	ret = mtk_dai_pcm_configure(substream, dai);
 	if (ret)
 		return ret;
 
-	mtk_dai_pcm_enable(afe);
-
 	return 0;
 }
 
@@ -316,8 +287,6 @@ static int mtk_dai_pcm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 }
 
 static const struct snd_soc_dai_ops mtk_dai_pcm_ops = {
-	.startup	= mtk_dai_pcm_startup,
-	.shutdown	= mtk_dai_pcm_shutdown,
 	.prepare	= mtk_dai_pcm_prepare,
 	.set_fmt	= mtk_dai_pcm_set_fmt,
 };
diff --git a/sound/soc/mediatek/mt8195/mt8195-reg.h b/sound/soc/mediatek/mt8195/mt8195-reg.h
index d06f9cf85a4e..d3871353db41 100644
--- a/sound/soc/mediatek/mt8195/mt8195-reg.h
+++ b/sound/soc/mediatek/mt8195/mt8195-reg.h
@@ -2550,6 +2550,7 @@
 #define PCM_INTF_CON1_PCM_FMT(x)       (((x) & 0x3) << 1)
 #define PCM_INTF_CON1_PCM_FMT_MASK     (0x3 << 1)
 #define PCM_INTF_CON1_PCM_EN           BIT(0)
+#define PCM_INTF_CON1_PCM_EN_SHIFT     0
 
 /* PCM_INTF_CON2 */
 #define PCM_INTF_CON2_CLK_DOMAIN_SEL(x)   (((x) & 0x3) << 23)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
