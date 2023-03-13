Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D04B4C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 21:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZMcQh4LM/3Zg8d0wkQ7qx7Cng8LcUP3yn8unE5ajdY=; b=vHcFALwXJU8vYeAS57AXZ10+GB
	h1kP+6Zh+TlWRgiOORqUk+vE2kcm1P6UPKvrvY3kZBmJPtldX7rqNQ8AB29da7phacxgM2iC5Lnm4
	dJ5eeMZga9AkrGd9NafUKVrl4GCQV2+YoomQJaQJcFqaSJ3DmjCRpyvi0lQwuKVCLnCE0gBCs/kQa
	/seEiT+0MgVUOZePMq4II9jhxU3qGr2Qcd7lJWI9FFAco7mUnwzjyHfFxbQIIMYrwSepG0mZqM8VV
	vDrbxFBpr6wju09R9ShKICZLh514EDfhFjTDPLkuFOUDqqVNymZdaXHR2jG7HNRKBFVYd9yqOrHj4
	t/fy/K0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpjx-007vMO-02; Mon, 13 Mar 2023 21:29:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpjb-007vEL-CS; Mon, 13 Mar 2023 21:29:37 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A86B4660308F;
	Mon, 13 Mar 2023 21:29:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678742971;
	bh=mWFcFs6EaqxA+zO4mnrYdfWBJNLnPvbamIJ4mjHcCOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mmOtB8Dm37lrB6dpX7uwY8hJ4Rd3Lj3BLfyDMa85FoEWZf9r/NVcsUQeY641Sb7bD
	 FSe8vOQuzj1u6pfhd07PpCKZBNuzD4BvaGW2Jko1gEZfKjhu47A73xmFyFUFkoZnaK
	 3aP5jrM0DYtJiDNYpgVG+qxXS1d+bFLxV+LywpXCnWs1/FD3gGO7+WNHSpb2KqExkD
	 Zw7WI/pyNAF8965JoMRyRdNv1sGb2BT/A1ADCmINjSy3Nfs8Xn2DMrBoKKs7q1RD3f
	 av9HyBfR6hm2JRW4dz7EL0U8geAaCczuwwTnnWj97faX2ZkNFxsqO5GmCJAiyHuOnx
	 S0WmmPwELnggw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] ASoC: mt8192: Move spammy messages to debug level
Date: Mon, 13 Mar 2023 17:29:07 -0400
Message-Id: <20230313212908.2282961-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313212908.2282961-1-nfraprado@collabora.com>
References: <20230313212908.2282961-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_142935_744203_92498C1E 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

There are many log messages throughout the mt8192 sound drivers that
print to the info level and are triggered very frequently. Move these
messages to the debug level to avoid spamming the console.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    |  2 +-
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c    | 26 +++++++++----------
 .../mt8192/mt8192-mt6359-rt1015-rt5682.c      | 10 +++----
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index a420b78dde89..333e0ee98c5a 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -369,7 +369,7 @@ static int ul_tinyconn_event(struct snd_soc_dapm_widget *w,
 	unsigned int reg_shift;
 	unsigned int reg_mask_shift;
 
-	dev_info(afe->dev, "%s(), event 0x%x\n", __func__, event);
+	dev_dbg(afe->dev, "%s(), event 0x%x\n", __func__, event);
 
 	if (strstr(w->name, "UL1")) {
 		reg_shift = VUL1_USE_TINY_SFT;
diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
index bcd2150c2816..9ce06821c7d0 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
@@ -256,8 +256,8 @@ static int mtk_tdm_en_event(struct snd_soc_dapm_widget *w,
 		return -EINVAL;
 	}
 
-	dev_info(cmpnt->dev, "%s(), name %s, event 0x%x\n",
-		 __func__, w->name, event);
+	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
+		__func__, w->name, event);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -288,8 +288,8 @@ static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
 		return -EINVAL;
 	}
 
-	dev_info(cmpnt->dev, "%s(), name %s, event 0x%x, dai_id %d\n",
-		 __func__, w->name, event, dai_id);
+	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x, dai_id %d\n",
+		__func__, w->name, event, dai_id);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -320,8 +320,8 @@ static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
 		return -EINVAL;
 	}
 
-	dev_info(cmpnt->dev, "%s(), name %s, event 0x%x, dai_id %d\n",
-		 __func__, w->name, event, dai_id);
+	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x, dai_id %d\n",
+		__func__, w->name, event, dai_id);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -545,13 +545,13 @@ static int mtk_dai_tdm_hw_params(struct snd_pcm_substream *substream,
 	if (tdm_priv->mclk_rate % tdm_priv->bck_rate != 0)
 		dev_warn(afe->dev, "%s(), bck cannot generate", __func__);
 
-	dev_info(afe->dev, "%s(), id %d, rate %d, channels %d, format %d, mclk_rate %d, bck_rate %d\n",
-		 __func__,
-		 tdm_id, rate, channels, format,
-		 tdm_priv->mclk_rate, tdm_priv->bck_rate);
+	dev_dbg(afe->dev, "%s(), id %d, rate %d, channels %d, format %d, mclk_rate %d, bck_rate %d\n",
+		__func__,
+		tdm_id, rate, channels, format,
+		tdm_priv->mclk_rate, tdm_priv->bck_rate);
 
-	dev_info(afe->dev, "%s(), out_channels_per_sdata = %d\n",
-		 __func__, out_channels_per_sdata);
+	dev_dbg(afe->dev, "%s(), out_channels_per_sdata = %d\n",
+		__func__, out_channels_per_sdata);
 
 	/* set tdm */
 	if (tdm_priv->bck_invert)
@@ -644,7 +644,7 @@ static int mtk_dai_tdm_set_sysclk(struct snd_soc_dai *dai,
 		return -EINVAL;
 	}
 
-	dev_info(afe->dev, "%s(), freq %d\n", __func__, freq);
+	dev_dbg(afe->dev, "%s(), freq %d\n", __func__, freq);
 
 	return mtk_dai_tdm_cal_mclk(afe, tdm_priv, freq);
 }
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 87737d054682..5e163e23a207 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -292,11 +292,11 @@ static int mt8192_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	mt8192_afe_gpio_request(afe->dev, false, MT8192_DAI_ADDA_CH34, 0);
 	pm_runtime_put(afe->dev);
 
-	dev_info(afe->dev, "%s(), mtkaif_chosen_phase[0/1/2]:%d/%d/%d\n",
-		 __func__,
-		 afe_priv->mtkaif_chosen_phase[0],
-		 afe_priv->mtkaif_chosen_phase[1],
-		 afe_priv->mtkaif_chosen_phase[2]);
+	dev_dbg(afe->dev, "%s(), mtkaif_chosen_phase[0/1/2]:%d/%d/%d\n",
+		__func__,
+		afe_priv->mtkaif_chosen_phase[0],
+		afe_priv->mtkaif_chosen_phase[1],
+		afe_priv->mtkaif_chosen_phase[2]);
 
 	return 0;
 }
-- 
2.39.2


