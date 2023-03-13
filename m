Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5466C6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 21:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ql/l8LHqnhLeCWTiYRgnwtY5NPVJFNMtsnE5CwAJvkA=; b=rbENXg27h1E3Kwgdpn1vISeVZa
	+TQWr73uyELGO5FjmXaZNU+HMBKpPMJ4uNo8NWGP9trvaxshnBYZSSwx/IcoOPAcmsN3W43EYIwb3
	4uqlBPq3NqBMcnvCiavUv9GSyszdaMLvWpEioAT+1S3FUhtpuzh/hpJePRPE/B6xWHdMddEtR/5iC
	3q8xob5+MALeEeOWTAJ2fpwTfXMstgSVk7Zz34dK9lTWx7g2STsggmE3fCYETZ04Vhq7J2T2F/IW8
	NFrhfKCu9f+uHzbId2cC33MTzsSbfS8HFclEjwqCSq3E/T3NQKhJLVGYYAVT/yMQ44v1zUHcsvRNz
	+PzqBcOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpjw-007vLk-8t; Mon, 13 Mar 2023 21:29:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbpjb-007vDu-CR; Mon, 13 Mar 2023 21:29:37 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id ACC116603093;
	Mon, 13 Mar 2023 21:29:25 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678742968;
	bh=dUxa3OCQgUXblMw21199yTPLdr60La5FQyGmHy5l/KA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eCwra3Szp3JYaASFVbgHL9W502iflnuU4Oalhlg2HIkPFSG+b8dkfjvKFTKh+o6Ck
	 6V4jpS0GVDz7O75CKS5tp3AKsgebirZpXRXs+kkZ7mUdlfkzFtGBSHOq1lpdsdKg/A
	 +DuIGKMSbOqsRrmnj0b0MqpyuteDt8gHdRJhzFuPESXnpW8S4t7ris7n2F/QgHhXI/
	 eKrdGMWlC2aTCNtfx+OSnV6HyluBkEZEhEWY1OG9MLyaCdh3yuhuhAbK8xTI7NRWZY
	 jH7IU5S3qaIXROCy8HudJskfw0hku2E7701cR+lrG3pRd0AcNfnQaH8ejL6WS6EHqD
	 qgopxwB+gckwA==
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
Subject: [PATCH 1/2] ASoC: mt8192: Remove function name log messages
Date: Mon, 13 Mar 2023 17:29:06 -0400
Message-Id: <20230313212908.2282961-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313212908.2282961-1-nfraprado@collabora.com>
References: <20230313212908.2282961-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_142935_577670_5D44C939 
X-CRM114-Status: GOOD (  12.76  )
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

There are some log messages in the mt8192 sound code that print the
function name, presumably to aid in tracing. However this can also be
achieved by ftrace and without spamming the console, so remove these
messages.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 sound/soc/mediatek/mt8192/mt8192-afe-clk.c              | 4 ----
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c              | 4 ----
 sound/soc/mediatek/mt8192/mt8192-dai-tdm.c              | 2 --
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 2 --
 4 files changed, 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index bba5f3056e8f..416aff726253 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -206,8 +206,6 @@ int mt8192_afe_enable_clock(struct mtk_base_afe *afe)
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int ret;
 
-	dev_info(afe->dev, "%s()\n", __func__);
-
 	ret = clk_prepare_enable(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
@@ -276,8 +274,6 @@ void mt8192_afe_disable_clock(struct mtk_base_afe *afe)
 {
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 
-	dev_info(afe->dev, "%s()\n", __func__);
-
 	clk_disable_unprepare(afe_priv->clk[CLK_AFE]);
 	mt8192_set_audio_int_bus_parent(afe, CLK_CLK26M);
 	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index e1e4ca931551..a420b78dde89 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2055,8 +2055,6 @@ static int mt8192_afe_runtime_suspend(struct device *dev)
 	unsigned int value;
 	int ret;
 
-	dev_info(afe->dev, "%s()\n", __func__);
-
 	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
 		goto skip_regmap;
 
@@ -2097,8 +2095,6 @@ static int mt8192_afe_runtime_resume(struct device *dev)
 	struct mt8192_afe_private *afe_priv = afe->platform_priv;
 	int ret;
 
-	dev_info(afe->dev, "%s()\n", __func__);
-
 	ret = mt8192_afe_enable_clock(afe);
 	if (ret)
 		return ret;
diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
index f3bebed2428a..bcd2150c2816 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-tdm.c
@@ -754,8 +754,6 @@ int mt8192_dai_tdm_register(struct mtk_base_afe *afe)
 	struct mtk_afe_tdm_priv *tdm_priv;
 	struct mtk_base_afe_dai *dai;
 
-	dev_info(afe->dev, "%s()\n", __func__);
-
 	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
 	if (!dai)
 		return -ENOMEM;
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 16660eda577e..87737d054682 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -161,8 +161,6 @@ static int mt8192_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	int counter;
 	int mtkaif_calib_ok;
 
-	dev_info(afe->dev, "%s(), start\n", __func__);
-
 	pm_runtime_get_sync(afe->dev);
 	mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 1);
 	mt8192_afe_gpio_request(afe->dev, true, MT8192_DAI_ADDA, 0);
-- 
2.39.2


