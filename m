Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5459EC6FA86
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyAUo+fgyD4XCfDDcd5WlW0+QXMCi4giaA1T1CIQk0c=; b=uJozAmiKJ0lMiNWBrz+w4N/91P
	AfvWwBjAKmjiuxDzJ57+VFL5S+CH8J/5NX3NrUG+V1qLSbKO2UVySqbRDxQUbJHTd9BxaAsGdiLgk
	ti278X7HmXkirOVFY3/Emppsk36itf0dtXfC2Ifw9Iy8avM3s8/QdkTvEaAsf74o5Efc++QyjjWce
	b3QuZPwupkiV4eOQanbq6TwBucErv7J6Q7RSWiea39r9SkxX9yVoyLypxuORGnQ6ZngO35B/A0IJs
	rKoCEOAsmgNtuIthjAJiWXPQyyCnJBcGkRyLnwFkE/PG7x65WAZttLDK9Xdap6xNsyKkZbYN96nfs
	wCKyPmqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWKBs-005dYF-VC; Thu, 08 Sep 2022 16:15:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWK8W-005b9v-DI; Thu, 08 Sep 2022 16:12:18 +0000
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E13C26601FAA;
	Thu,  8 Sep 2022 17:12:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662653535;
	bh=uhx5omwpic5bk4/kTplSRf0+UKyLNhVsKRgsymwMjJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eGtmnm70gO430MvZvviUFurvGCYkSFhzJuJqJbxlkBO1PPiHAXHW+o5xGqHNcSZaB
	 uNKM3FgiI93HiqUAkgJVQOQesThAMQ+lGpZsfyanVVFtPFBDH9tvHNOdJyGmIY/M5l
	 NANeS7bTJz6h4qCj/CSAe5fiO2+r/AVpYOR32qeb76RmcgD3EwnLiGSA7kchvddR5T
	 qKBTWFglh3T2/0qJioVIXsXqrhusD9+Zt7LnSitdcBgw805FdpC/+BavsYDiQDX4Hj
	 w4GPoVfB4b/EQT9TKEkGkSO2fVOuWEESLAXUFt4nuPeEbbkYZ0aKAz796XMZA2KyAR
	 F6w2SVcV/JLTA==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	"chunxu.li" <chunxu.li@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 09/10] ASoC: mediatek: mt8186: Configure shared clocks
Date: Thu,  8 Sep 2022 12:11:53 -0400
Message-Id: <20220908161154.648557-10-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908161154.648557-1-nfraprado@collabora.com>
References: <20220908161154.648557-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_091216_782287_2C286EB8 
X-CRM114-Status: GOOD (  12.66  )
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

i2s0 and i2s1 are paired input/output connected to the same codec and
should share the same clock. Likewise for i2s2 and i2s3. Set the clock
sharing for each pair during the codec's initialization.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 .../mt8186/mt8186-mt6366-da7219-max98357.c     | 18 ++++++++++++++++++
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c      | 18 ++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index 17a15bec41da..6f93f9dd4623 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -54,6 +54,9 @@ static struct snd_soc_codec_conf mt8186_mt6366_da7219_max98357_codec_conf[] = {
 
 static int mt8186_da7219_init(struct snd_soc_pcm_runtime *rtd)
 {
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct mtk_soc_card_data *soc_card_data =
 		snd_soc_card_get_drvdata(rtd->card);
 	struct mt8186_mt6366_da7219_max98357_priv *priv = soc_card_data->mach_priv;
@@ -62,6 +65,12 @@ static int mt8186_da7219_init(struct snd_soc_pcm_runtime *rtd)
 		asoc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
+	ret = mt8186_dai_i2s_set_share(afe, "I2S1", "I2S0");
+	if (ret) {
+		dev_err(rtd->dev, "Failed to set up shared clocks\n");
+		return ret;
+	}
+
 	/* Enable Headset and 4 Buttons Jack detection */
 	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
 				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
@@ -160,6 +169,9 @@ static const struct snd_soc_ops mt8186_da7219_i2s_ops = {
 
 static int mt8186_mt6366_da7219_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct snd_soc_component *cmpnt_codec =
 		asoc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_soc_card_data *soc_card_data =
@@ -167,6 +179,12 @@ static int mt8186_mt6366_da7219_max98357_hdmi_init(struct snd_soc_pcm_runtime *r
 	struct mt8186_mt6366_da7219_max98357_priv *priv = soc_card_data->mach_priv;
 	int ret;
 
+	ret = mt8186_dai_i2s_set_share(afe, "I2S3", "I2S2");
+	if (ret) {
+		dev_err(rtd->dev, "Failed to set up shared clocks\n");
+		return ret;
+	}
+
 	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT, &priv->hdmi_jack);
 	if (ret) {
 		dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 393d179d61de..247f20f594d9 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -58,6 +58,9 @@ static struct snd_soc_codec_conf mt8186_mt6366_rt1019_rt5682s_codec_conf[] = {
 
 static int mt8186_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 {
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct mtk_soc_card_data *soc_card_data =
 		snd_soc_card_get_drvdata(rtd->card);
 	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
@@ -66,6 +69,12 @@ static int mt8186_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 		asoc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
+	ret = mt8186_dai_i2s_set_share(afe, "I2S1", "I2S0");
+	if (ret) {
+		dev_err(rtd->dev, "Failed to set up shared clocks\n");
+		return ret;
+	}
+
 	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
 				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
 				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
@@ -136,6 +145,9 @@ static const struct snd_soc_ops mt8186_rt5682s_i2s_ops = {
 
 static int mt8186_mt6366_rt1019_rt5682s_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
+	struct snd_soc_component *cmpnt_afe =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
 	struct snd_soc_component *cmpnt_codec =
 		asoc_rtd_to_codec(rtd, 0)->component;
 	struct mtk_soc_card_data *soc_card_data =
@@ -143,6 +155,12 @@ static int mt8186_mt6366_rt1019_rt5682s_hdmi_init(struct snd_soc_pcm_runtime *rt
 	struct mt8186_mt6366_rt1019_rt5682s_priv *priv = soc_card_data->mach_priv;
 	int ret;
 
+	ret = mt8186_dai_i2s_set_share(afe, "I2S3", "I2S2");
+	if (ret) {
+		dev_err(rtd->dev, "Failed to set up shared clocks\n");
+		return ret;
+	}
+
 	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT, &priv->hdmi_jack);
 	if (ret) {
 		dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
-- 
2.37.3


