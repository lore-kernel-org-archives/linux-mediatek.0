Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025FDC61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 14:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0AlmbAUQJD98f6NQbnQ+j0xdJEEjicbn6EmCbDRiHI=; b=ud3tNTFjn5A2ggpvHbsb27sEM2
	5vf+Yq1YSfu9PjEjidh1/eXSyyO2qttfFsOdmbx5oT8jvsseJn8B7t0/7HruwU1o8fv9CpiEAEO3M
	Bl/nN6UHB4DRV53cQ1D+mUf8Ue13s89VbseIkHgcQHR5VTrSH2IEtG0k7aQEuxFJhKrphAfwnk4i+
	btTtDi8ov71IPhnOo5ibq18FqS2NGgFsyuVkvC8rwrDbFHnradkKzqhkgAtuAey3Wamvtw1GxpLf0
	zn0B0CSYo32NduLa2QrXgeQsP+7Ub4PBgMBSM9ytSPY+J6JrXdxk6pWMDwMn10sm8yyr+C3ZFJ98D
	V8Na9TVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYjr-002hRm-RW; Fri, 24 Feb 2023 14:07:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYja-002hN9-Ag; Fri, 24 Feb 2023 14:07:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D41DB618EA;
	Fri, 24 Feb 2023 14:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304BDC433D2;
	Fri, 24 Feb 2023 14:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677247657;
	bh=1KhcJKnYBuXVB3sSo3IhCFYBjgAmMojaWkGnR3yIJN0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BCG5euaPHPwa5bU6SIZwPSyv+JGLosuVrAXoh0T1j/2kSzF9nwfPE3+zNbOgR4ssl
	 FslqXUUv9FNLAIjljixbWGUkb94Hf44RgVCzuQTjk2wdXkmyBNZoKUH4CGZEZu4ree
	 2Ii8rJUH6h6TiyJwLZCcP6YliTZqrB7rQnNdHQVx4ME1NYAbWT37PSfWwnDXzPyhdV
	 QKGaUuESYAlepZcRkaNp+fk7bPcNy2aGTw+MY+P2DrH5QhZxdV7ZVm1RqGvafAg7JW
	 aSITRMmazaCe11oPNvutQ3Tihd6kvn96cPT8MXqPp94bd1SgDNist44/+5QPiaWUbZ
	 NqhAseQPBpU2g==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 24 Feb 2023 14:03:55 +0000
Subject: [PATCH 1/4] ASoC: mt8192: Remove spammy log messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-asoc-mt8192-quick-fixes-v1-1-9a85f90368e1@kernel.org>
References: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
In-Reply-To: <20230223-asoc-mt8192-quick-fixes-v1-0-9a85f90368e1@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4465; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1KhcJKnYBuXVB3sSo3IhCFYBjgAmMojaWkGnR3yIJN0=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhuQfRxYuTfByVTXWm1M3+WWct/Ysd5ZUbt+yjYp7NlTP40lw
 7TDtZDRmYWDkYpAVU2RZ+yxjVXq4xNb5j+a/ghnEygQyhYGLUwAm0sLL/lc44lTFmnsna6OOPz7DOP
 O+kWyd6aftfsaVezT+7fnOm2X4a3X15bVPuk+ucp7x9nIZH+O7fdNDDosl5GTqn85/0zPxgS5bSKtt
 yvzc419FSiYomde2LKq4lsufWcC31TCh6IxwpJiux6WFhVKupdd17yU32qjK3Htgc6F2T84G2Z0rAj
 PXdBrqvo5UdQn59OhOafNz2ae/r5VMyX+meXdf+fm8N1Z/WsNDdAV3mOjJCS9LlWrJ8ErtEz6gy8Tz
 bUHKullmzl3HDG78COsL6r5VLfbapfbU4+PcKV3ZL8x2ixvYlnTXvOkN0y1d17eYqTvX8fXJdHm/f9
 M3XDAwE2bXDzh7vyR4dtYes9/xAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_060738_478130_A71274C9 
X-CRM114-Status: GOOD (  12.29  )
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

There are a lot of info level log messages in the mt8192 ADDA driver which
are trivially triggerable from userspace, many in normal operation. Remove
these to avoid spamming the console.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c | 33 -----------------------------
 1 file changed, 33 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
index f8c73e8624df..bc8753f1001c 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
@@ -303,9 +303,6 @@ static int mtk_adda_ul_event(struct snd_soc_dapm_widget *w,
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int mtkaif_dmic = afe_priv->mtkaif_dmic;
 
-	dev_info(afe->dev, "%s(), name %s, event 0x%x, mtkaif_dmic %d\n",
-		 __func__, w->name, event, mtkaif_dmic);
-
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 1);
@@ -345,10 +342,6 @@ static int mtk_adda_ch34_ul_event(struct snd_soc_dapm_widget *w,
 	int mtkaif_dmic = afe_priv->mtkaif_dmic_ch34;
 	int mtkaif_adda6_only = afe_priv->mtkaif_adda6_only;
 
-	dev_info(afe->dev,
-		 "%s(), name %s, event 0x%x, mtkaif_dmic %d, mtkaif_adda6_only %d\n",
-		 __func__, w->name, event, mtkaif_dmic, mtkaif_adda6_only);
-
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34,
@@ -538,9 +531,6 @@ static int mtk_adda_dl_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 
-	dev_info(afe->dev, "%s(), name %s, event 0x%x\n",
-		 __func__, w->name, event);
-
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 0);
@@ -564,9 +554,6 @@ static int mtk_adda_ch34_dl_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 
-	dev_info(afe->dev, "%s(), name %s, event 0x%x\n",
-		 __func__, w->name, event);
-
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA_CH34,
@@ -612,9 +599,6 @@ static int stf_positive_gain_set(struct snd_kcontrol *kcontrol,
 				   AFE_SIDETONE_GAIN,
 				   POSITIVE_GAIN_MASK_SFT,
 				   (gain_db / 6) << POSITIVE_GAIN_SFT);
-	} else {
-		dev_warn(afe->dev, "%s(), gain_db %d invalid\n",
-			 __func__, gain_db);
 	}
 	return 0;
 }
@@ -640,9 +624,6 @@ static int mt8192_adda_dmic_set(struct snd_kcontrol *kcontrol,
 
 	dmic_on = ucontrol->value.integer.value[0];
 
-	dev_info(afe->dev, "%s(), kcontrol name %s, dmic_on %d\n",
-		 __func__, kcontrol->id.name, dmic_on);
-
 	afe_priv->mtkaif_dmic = dmic_on;
 	afe_priv->mtkaif_dmic_ch34 = dmic_on;
 	return 0;
@@ -669,9 +650,6 @@ static int mt8192_adda6_only_set(struct snd_kcontrol *kcontrol,
 
 	mtkaif_adda6_only = ucontrol->value.integer.value[0];
 
-	dev_info(afe->dev, "%s(), kcontrol name %s, mtkaif_adda6_only %d\n",
-		 __func__, kcontrol->id.name, mtkaif_adda6_only);
-
 	afe_priv->mtkaif_adda6_only = mtkaif_adda6_only;
 	return 0;
 }
@@ -750,9 +728,6 @@ static int mtk_stf_event(struct snd_soc_dapm_widget *w,
 
 	regmap_read(afe->regmap, AFE_SIDETONE_CON1, &reg_value);
 
-	dev_info(afe->dev, "%s(), name %s, event 0x%x, ul_rate 0x%x, AFE_SIDETONE_CON1 0x%x\n",
-		 __func__, w->name, event, ul_rate, reg_value);
-
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		/* set side tone gain = 0 */
@@ -1163,12 +1138,6 @@ static int mtk_dai_adda_hw_params(struct snd_pcm_substream *substream,
 	unsigned int rate = params_rate(params);
 	int id = dai->id;
 
-	dev_info(afe->dev, "%s(), id %d, stream %d, rate %d\n",
-		 __func__,
-		 id,
-		 substream->stream,
-		 rate);
-
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		unsigned int dl_src2_con0 = 0;
 		unsigned int dl_src2_con1 = 0;
@@ -1441,8 +1410,6 @@ int mt8192_dai_adda_register(struct mtk_base_afe *afe)
 	struct mtk_base_afe_dai *dai;
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 
-	dev_info(afe->dev, "%s()\n", __func__);
-
 	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
 	if (!dai)
 		return -ENOMEM;

-- 
2.30.2


