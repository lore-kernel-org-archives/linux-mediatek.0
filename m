Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E38C5478C
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Feb 2024 12:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P90T8msM0dbODByQdEj03PcAYsjq7ciKHVblE8vGmc4=; b=11AgCtHaYJxIyZd+r8yooBeOgu
	cP40OJd7KQTFdmJKo6Kyl+/3r/B9Rl3M4u9ykuPfi+jkNxRUbP9L3qpe0bucfT8BEKsotRBa9pmkq
	3ccc3I/H/a7FcsbnA8mY573k372BFCe+2jgQADPOXPGkhzJVDESswCQSUw1A3uOYQUxkKTAc5Ju/1
	dmwuixChh9rmS97wwTgnw5Y+kGpFO39Y7At+DRLkAz+3iL5jh2hGXome62wXTx3vBbZTaq2+DWr9o
	BBhW9qBf8mwwktNLONJBMKfFc3XMhWpkzhVieSVtiiHnqtBl4KPLcbn1gyM+hDKyS6Fipw3caFjoG
	0PPpAPIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewJm-000000055cw-1pGC;
	Tue, 27 Feb 2024 12:12:18 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rewIA-000000054bW-14ln;
	Tue, 27 Feb 2024 12:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709035837;
	bh=8dO/knddMZmgChwWbJp/fcjiVO5qSxhidYiSZvCNm60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fB1o9/vlNYeCW5EjGvT2llDUm1d+Aa4R3DgJ70upOrUb9q93mMSM39sdhMsaR5oS5
	 VBC0dFZCPFztUsDOyY0rxFZXtJIt23vs4Zf+gQV7cmQ/PQM7nWgx6YZVXynoQdznnf
	 skaYMARv7pLc5bvhPslb1xiHJuISqjpdjdEKyUJBTXX7J7/+XVf2C1fvrwwmlJm7SF
	 koAxnpN6mM8d3b3LrfDRniogRWImOZBHOX/GiLZoVaJpVOMbw3PYUzyKHYTw8hyEnl
	 QVtiXoqKmQcgd1HLYX5YUkK9hZSBcBibM9ul1wBcxiLhquAMBhWc5X7LHSnjRBhVO4
	 Z/pGnJ4lS8ltg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A158637820E4;
	Tue, 27 Feb 2024 12:10:34 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: wenst@chromium.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com,
	arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com,
	shraash@google.com,
	amergnat@baylibre.com,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	dianders@chromium.org,
	frank.li@vivo.com,
	allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com,
	claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com,
	jiaxin.yu@mediatek.com,
	alpernebiyasak@gmail.com,
	ckeepax@opensource.cirrus.com,
	zhourui@huaqin.corp-partner.google.com,
	nfraprado@collabora.com,
	alsa-devel@alsa-project.org,
	shane.chien@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 11/22] ASoC: mediatek: Add common snd_soc_ops .startup() callback
Date: Tue, 27 Feb 2024 13:09:28 +0100
Message-ID: <20240227120939.290143-12-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_041038_514809_B7F16482 
X-CRM114-Status: GOOD (  13.26  )
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

MediaTek platforms are typically setting PCM rate and channels
constraints for playback, capture and HDMI/DisplayPort playback:
commonize the startup callback by adding the PCM constraints data
to the mtk_platform_card_data structure and by reusing the common
mtk_soundcard_startup() function for all of them by getting back
the parameters from the aforementioned struct.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../mediatek/common/mtk-soundcard-driver.c    | 51 +++++++++++++++++++
 .../mediatek/common/mtk-soundcard-driver.h    | 24 +++++++++
 2 files changed, 75 insertions(+)

diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.c b/sound/soc/mediatek/common/mtk-soundcard-driver.c
index b1db17e392d5..d344630f7851 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.c
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.c
@@ -139,6 +139,57 @@ void clean_card_reference(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_GPL(clean_card_reference);
 
+int mtk_soundcard_startup(struct snd_pcm_substream *substream,
+			  enum mtk_pcm_constraint_type ctype)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct mtk_soc_card_data *soc_card = snd_soc_card_get_drvdata(rtd->card);
+	const struct mtk_pcm_constraints_data *mpc = &soc_card->card_data->pcm_constraints[ctype];
+	int ret;
+
+	if (unlikely(!mpc))
+		return -EINVAL;
+
+	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
+					 SNDRV_PCM_HW_PARAM_RATE,
+					 &mpc->rates);
+	if (ret < 0) {
+		dev_err(rtd->dev, "hw_constraint_list rate failed\n");
+		return ret;
+	}
+
+	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
+					 SNDRV_PCM_HW_PARAM_CHANNELS,
+					 &mpc->channels);
+	if (ret < 0) {
+		dev_err(rtd->dev, "hw_constraint_list channel failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_soundcard_startup);
+
+static int mtk_soundcard_playback_startup(struct snd_pcm_substream *substream)
+{
+	return mtk_soundcard_startup(substream, MTK_CONSTRAINT_PLAYBACK);
+}
+
+const struct snd_soc_ops mtk_soundcard_common_playback_ops = {
+	.startup = mtk_soundcard_playback_startup,
+};
+EXPORT_SYMBOL_GPL(mtk_soundcard_common_playback_ops);
+
+static int mtk_soundcard_capture_startup(struct snd_pcm_substream *substream)
+{
+	return mtk_soundcard_startup(substream, MTK_CONSTRAINT_CAPTURE);
+}
+
+const struct snd_soc_ops mtk_soundcard_common_capture_ops = {
+	.startup = mtk_soundcard_capture_startup,
+};
+EXPORT_SYMBOL_GPL(mtk_soundcard_common_capture_ops);
+
 int mtk_soundcard_common_probe(struct platform_device *pdev)
 {
 	struct device_node *platform_node, *adsp_node;
diff --git a/sound/soc/mediatek/common/mtk-soundcard-driver.h b/sound/soc/mediatek/common/mtk-soundcard-driver.h
index 4fd2ffb7e486..c38e2ac09ad3 100644
--- a/sound/soc/mediatek/common/mtk-soundcard-driver.h
+++ b/sound/soc/mediatek/common/mtk-soundcard-driver.h
@@ -11,11 +11,26 @@
 
 struct mtk_sof_priv;
 struct mtk_soc_card_data;
+struct snd_pcm_hw_constraint_list;
+
+enum mtk_pcm_constraint_type {
+	MTK_CONSTRAINT_PLAYBACK,
+	MTK_CONSTRAINT_CAPTURE,
+	MTK_CONSTRAINT_HDMIDP,
+	MTK_CONSTRAINT_MAX
+};
+
+struct mtk_pcm_constraints_data {
+	const struct snd_pcm_hw_constraint_list channels;
+	const struct snd_pcm_hw_constraint_list rates;
+};
 
 struct mtk_platform_card_data {
 	struct snd_soc_card *card;
 	struct snd_soc_jack *jacks;
+	const struct mtk_pcm_constraints_data *pcm_constraints;
 	u8 num_jacks;
+	u8 num_pcm_constraints;
 	u8 flags;
 };
 
@@ -23,9 +38,18 @@ struct mtk_soundcard_pdata {
 	const char *card_name;
 	struct mtk_platform_card_data *card_data;
 	const struct mtk_sof_priv *sof_priv;
+
 	int (*soc_probe)(struct mtk_soc_card_data *card_data, bool legacy);
 };
 
+/* Common playback/capture card startup ops */
+extern const struct snd_soc_ops mtk_soundcard_common_playback_ops;
+extern const struct snd_soc_ops mtk_soundcard_common_capture_ops;
+
+/* Exported for custom/extended soundcard startup ops */
+int mtk_soundcard_startup(struct snd_pcm_substream *substream,
+			  enum mtk_pcm_constraint_type ctype);
+
 int parse_dai_link_info(struct snd_soc_card *card);
 void clean_card_reference(struct snd_soc_card *card);
 int mtk_soundcard_common_probe(struct platform_device *pdev);
-- 
2.44.0


