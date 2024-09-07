Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7A1E6FE49
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Sep 2024 01:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YM3vFrh3wrkNBXmeEnlV8XNdSyOxetn6YRE3i416RVQ=; b=N919X82HysIjiMgeb5u1edN17N
	WdbIIQNbymu96wZj8KX8oylZbkVL474p8ZV031F6gEhH9lrWukz9AIymhGn5NqY2KxdP7Ynizsla4
	Uq1NW6r92gMQtH2XqcfRNuaVMpoaO1+ewOyU43Dy0rPxmPx8+hOyWjJQJXrvj8VZVHjvRv1rhtZoK
	UrXsDIts196m0wCabk3HNCbYeBc68jKvMDQx5R6yxy2LD+nFsWLpLb7NLDmVfvkhTJv5AM/et5SIk
	8Tdb5BUZkkPjTYl0t6RsW63N+sB8gu2ac8Uk5A4+N+5rMSvQnTL6nhoHue9rp3oT1zADtCM6+hroE
	C8Fgni4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smjoj-0000000DzCs-0FJU;
	Sat, 07 Sep 2024 01:00:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smjjv-0000000DyJh-3TEi;
	Sat, 07 Sep 2024 00:55:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7D82DA43B42;
	Sat,  7 Sep 2024 00:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21759C4CEC6;
	Sat,  7 Sep 2024 00:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725670546;
	bh=BRGjOgFnTrmZqTMBAf7IoRHZkNEMl+9ApZDZZ8fAqw0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Na3WJvgp574EalKMFfJvWAydc15T9xbm9tOunwzyhZWvha5zLyrJ3sm/6xaffaTwu
	 aHO4rPerbTkYRJcxi3f30EKdNC/sCx60r0935GoDhj9nchMh+dzVhB5JsHkiQT0OiA
	 dOOcj9Wp3sKbA4QGmnZEL13bsx1EF9Zb7jHo8UDY4keUJYHvLq+m9Om8gmeBhW/HfU
	 aUVYAPyXZ1vm00kvREHHnU69Vmv9w5xFo+GpwBdGeoSvmyKV6bMlkyLvF3pbCCG3WT
	 POAPZDzYcj6yX9cOqSQffWp4AbtFuw/pSR2m9fUVlUE/hFgQm0DoHINRn1OUn6JKh9
	 2L4fn75LHvoVw==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 07 Sep 2024 01:53:29 +0100
Subject: [PATCH 4/7] ASoC: mt8365: Make non-exported functions static
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-asoc-fix-mt8365-build-v1-4-7ad0bac20161@kernel.org>
References: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
In-Reply-To: <20240907-asoc-fix-mt8365-build-v1-0-7ad0bac20161@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Alexandre Mergnat <amergnat@baylibre.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=3001; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BRGjOgFnTrmZqTMBAf7IoRHZkNEMl+9ApZDZZ8fAqw0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm26R/DCjR8omgTVIF6yFLtT+coGO18yH9dw040
 FDUGLMhP7CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZtukfwAKCRAk1otyXVSH
 0CoTB/4xpjJxFz84COXQNXL6pfwfhvyOgKYcVgjRa4smg63udhEstOCLD/q8C0trO206byrMWGx
 W+0Z8BdbmD1iZigLFQOBlhw7r2pSnCeYYKjz/p67QZwHVPkSXnTJfe01GOFeJ00x4kbYvbMAJzf
 d3d0AC6MsdNlPfg6wbWQ8MA93Yaq1+a9SxWPL+7v+pkEhRfWwBKi0+kBC8+OPWNcP4mbAqFFjBk
 1EM8gkTPlko0trGpLKBHf4GxAens19YcyGWFJN+XCAVmUPTyDEeMKdFeu36VSDWdVC+kdG2Z0sG
 kCNfsh82aCjR0frpShwvdC4Ki6Atw2BrSxM1h7lyV1mx0tk2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_175548_032916_5C9CF26F 
X-CRM114-Status: GOOD (  10.13  )
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

The compilers warn if functions without a prototype are not static so add
appropriate static declarations.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/mt8365/mt8365-afe-clk.c |  4 ++--
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-clk.c b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
index 300d1f0ae660..8a0af2ea8546 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-clk.c
@@ -295,7 +295,7 @@ int mt8365_afe_disable_afe_on(struct mtk_base_afe *afe)
 	return 0;
 }
 
-int mt8365_afe_hd_engen_enable(struct mtk_base_afe *afe, bool apll1)
+static int mt8365_afe_hd_engen_enable(struct mtk_base_afe *afe, bool apll1)
 {
 	if (apll1)
 		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
@@ -307,7 +307,7 @@ int mt8365_afe_hd_engen_enable(struct mtk_base_afe *afe, bool apll1)
 	return 0;
 }
 
-int mt8365_afe_hd_engen_disable(struct mtk_base_afe *afe, bool apll1)
+static int mt8365_afe_hd_engen_disable(struct mtk_base_afe *afe, bool apll1)
 {
 	if (apll1)
 		regmap_update_bits(afe->regmap, AFE_HD_ENGEN_ENABLE,
diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index df6dd8c5bbe5..54d2112d2e92 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -170,7 +170,7 @@ bool mt8365_afe_channel_supported(unsigned int channel, unsigned int id)
 	return false;
 }
 
-bool mt8365_afe_clk_group_44k(int sample_rate)
+static bool mt8365_afe_clk_group_44k(int sample_rate)
 {
 	if (sample_rate == 11025 ||
 	    sample_rate == 22050 ||
@@ -182,7 +182,7 @@ bool mt8365_afe_clk_group_44k(int sample_rate)
 		return false;
 }
 
-bool mt8365_afe_clk_group_48k(int sample_rate)
+static bool mt8365_afe_clk_group_48k(int sample_rate)
 {
 	return (!mt8365_afe_clk_group_44k(sample_rate));
 }
@@ -496,8 +496,8 @@ static int mt8365_afe_configure_cm(struct mtk_base_afe *afe,
 	return 0;
 }
 
-int mt8365_afe_fe_startup(struct snd_pcm_substream *substream,
-			  struct snd_soc_dai *dai)
+static int mt8365_afe_fe_startup(struct snd_pcm_substream *substream,
+				 struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
@@ -714,8 +714,8 @@ static int mt8365_afe_fe_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-int mt8365_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
-			  struct snd_soc_dai *dai)
+static int mt8365_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
+				 struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);

-- 
2.39.2


