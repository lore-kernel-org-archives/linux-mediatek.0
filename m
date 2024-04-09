Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D343CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 11:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAo8/1oxu6s9wH4/etuK70Xx17uNN5ftCLQdXl8l3Fw=; b=E+EUv2Rwfte0PGpz1RcT1x84b4
	FBrtUswCDu0zhcoxR3UrcEgdDlfLYk4h2mf7db3K7DaAQJfKJHu0PQiUdSgQkiuzG2H3Akh4s99OG
	I2ONb9Ph55VvWmPE5do+10t7VMA6I0e4KCdVC1S5nvu3aIeNCZyRmV0vf7dekci74S5rIOEHcO1Xi
	fFydPa7ICZki6VJNv0tL/Tv7m379eLkwm1DCh9h9i4+HbkBjSimQdo3iZtOO5rcC+uwZstxf9NB7w
	5ihwbIcaaiQHqToxBXrL2q2EQmQzLDeF3gnxpMQZaGXwQYBB47flfXcgHfXye9rfMjm3WroFg+O6C
	MP17uHzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9lQ-00000001hcO-13S8;
	Tue, 09 Apr 2024 11:35:44 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9jk-00000001gQP-0rrY;
	Tue, 09 Apr 2024 11:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712662438;
	bh=0HO5qRG7yEUzOGGRdhqoIYa/lL7AlbvV2yD89QdBpT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=2LxECNbStsShBe9BxdU7ykmyjzb6y4Dubr6mxyzyi696LuIFVRZ/bDA6heNJ8UcaN
	 43QKkLN9ze/sW/XnNnwqkLYNgk9uF30JlU/X/QkzKDNjDi4OXyDh4aNWht5faLo34E
	 HhCAJmBAaS8oF4S4OgXAl9IZlwjmFrxcgXzayVKeq92FR/sgQ8zQ5IePSSUhqdyRv9
	 16xHQtv6Nb0I+u5JS9slYWgbjiqFXWVelC1R/nodBszN41ZEzs3JdBvR4boBF0RmmD
	 26I04dw6GJLGBovSo72yWjRjcIzjpV9e849v6OPG41Vn1yb+pBTTKEmL3p5A6HMrbq
	 D8HxYVSjRF5DQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 98F7A3782111;
	Tue,  9 Apr 2024 11:33:56 +0000 (UTC)
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
Subject: [PATCH v4 12/18] ASoC: mediatek: Use common mtk_afe_pcm_platform with common probe cb
Date: Tue,  9 Apr 2024 13:33:04 +0200
Message-ID: <20240409113310.303261-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
References: <20240409113310.303261-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_043401_947609_DCC599BD 
X-CRM114-Status: GOOD (  13.42  )
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

Since the mtk-afe-platform-driver generic mtk_afe_pcm_platform now has
a common .probe() callback, there is no reason to keep duplicating this
function over and over in the SoC specific AFE-PCM drivers: switch over
to register with the common bits instead.

Note that MT8186 was left out of this because it is registering some
extra sinegen controls in the AFE-PCM probe callback and needs extra
cleanups to be able to use the common bits.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 14 +-----------
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c | 14 +-----------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 14 +-----------
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 21 +-----------------
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c | 25 ++--------------------
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 21 +-----------------
 6 files changed, 7 insertions(+), 102 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index da7267c684b1..c1dee119e93a 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -704,18 +704,6 @@ static int mt6797_afe_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int mt6797_afe_component_probe(struct snd_soc_component *component)
-{
-	return mtk_afe_add_sub_dai_control(component);
-}
-
-static const struct snd_soc_component_driver mt6797_afe_component = {
-	.name		= AFE_PCM_NAME,
-	.probe		= mt6797_afe_component_probe,
-	.pointer	= mtk_afe_pcm_pointer,
-	.pcm_construct	= mtk_afe_pcm_new,
-};
-
 static int mt6797_dai_memif_register(struct mtk_base_afe *afe)
 {
 	struct mtk_base_afe_dai *dai;
@@ -852,7 +840,7 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 	pm_runtime_get_sync(&pdev->dev);
 
 	/* register component */
-	ret = devm_snd_soc_register_component(dev, &mt6797_afe_component,
+	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
diff --git a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
index d497e1129889..c1c486e275b9 100644
--- a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
@@ -429,18 +429,6 @@ static int mt7986_afe_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int mt7986_afe_component_probe(struct snd_soc_component *component)
-{
-	return mtk_afe_add_sub_dai_control(component);
-}
-
-static const struct snd_soc_component_driver mt7986_afe_component = {
-	.name = AFE_PCM_NAME,
-	.probe = mt7986_afe_component_probe,
-	.pointer	= mtk_afe_pcm_pointer,
-	.pcm_construct	= mtk_afe_pcm_new,
-};
-
 static int mt7986_dai_memif_register(struct mtk_base_afe *afe)
 {
 	struct mtk_base_afe_dai *dai;
@@ -573,7 +561,7 @@ static int mt7986_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* register component */
 	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &mt7986_afe_component,
+					      &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret)
 		return dev_err_probe(dev, ret, "Cannot register AFE component\n");
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 9e432ed9124b..25348fdf75fa 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1042,18 +1042,6 @@ static int mt8183_afe_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int mt8183_afe_component_probe(struct snd_soc_component *component)
-{
-	return mtk_afe_add_sub_dai_control(component);
-}
-
-static const struct snd_soc_component_driver mt8183_afe_component = {
-	.name		= AFE_PCM_NAME,
-	.probe		= mt8183_afe_component_probe,
-	.pointer	= mtk_afe_pcm_pointer,
-	.pcm_construct	= mtk_afe_pcm_new,
-};
-
 static int mt8183_dai_memif_register(struct mtk_base_afe *afe)
 {
 	struct mtk_base_afe_dai *dai;
@@ -1232,7 +1220,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* register component */
 	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &mt8183_afe_component,
+					      &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 46d6a5540403..9647fe133dc8 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3030,25 +3030,6 @@ static int mt8188_afe_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int mt8188_afe_component_probe(struct snd_soc_component *component)
-{
-	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	int ret;
-
-	snd_soc_component_init_regmap(component, afe->regmap);
-
-	ret = mtk_afe_add_sub_dai_control(component);
-
-	return ret;
-}
-
-static const struct snd_soc_component_driver mt8188_afe_component = {
-	.name = AFE_PCM_NAME,
-	.pointer       = mtk_afe_pcm_pointer,
-	.pcm_construct = mtk_afe_pcm_new,
-	.probe         = mt8188_afe_component_probe,
-};
-
 static int init_memif_priv_data(struct mtk_base_afe *afe)
 {
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
@@ -3350,7 +3331,7 @@ static int mt8188_afe_pcm_dev_probe(struct platform_device *pdev)
 	}
 
 	/* register component */
-	ret = devm_snd_soc_register_component(dev, &mt8188_afe_component,
+	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index aed22baef9fb..424c5c68f78a 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2125,22 +2125,6 @@ static int mt8192_afe_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int mt8192_afe_component_probe(struct snd_soc_component *component)
-{
-	return mtk_afe_add_sub_dai_control(component);
-}
-
-static const struct snd_soc_component_driver mt8192_afe_component = {
-	.name = AFE_PCM_NAME,
-	.probe = mt8192_afe_component_probe,
-	.pointer = mtk_afe_pcm_pointer,
-	.pcm_construct = mtk_afe_pcm_new,
-};
-
-static const struct snd_soc_component_driver mt8192_afe_pcm_component = {
-	.name = "mt8192-afe-pcm-dai",
-};
-
 static int mt8192_dai_memif_register(struct mtk_base_afe *afe)
 {
 	struct mtk_base_afe_dai *dai;
@@ -2302,16 +2286,11 @@ static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* register platform */
 	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &mt8192_afe_component, NULL, 0);
-	if (ret)
-		return dev_err_probe(dev, ret, "Couldn't register AFE component\n");
-
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &mt8192_afe_pcm_component,
+					      &mtk_afe_pcm_platform,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
 	if (ret)
-		return dev_err_probe(dev, ret, "Couldn't register AFE-PCM component\n");
+		return dev_err_probe(dev, ret, "Couldn't register AFE component\n");
 
 	return 0;
 }
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 620d7ade1992..64af9bf363fd 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -2944,25 +2944,6 @@ static int mt8195_afe_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int mt8195_afe_component_probe(struct snd_soc_component *component)
-{
-	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
-	int ret = 0;
-
-	snd_soc_component_init_regmap(component, afe->regmap);
-
-	ret = mtk_afe_add_sub_dai_control(component);
-
-	return ret;
-}
-
-static const struct snd_soc_component_driver mt8195_afe_component = {
-	.name = AFE_PCM_NAME,
-	.pointer = mtk_afe_pcm_pointer,
-	.pcm_construct = mtk_afe_pcm_new,
-	.probe = mt8195_afe_component_probe,
-};
-
 static int init_memif_priv_data(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
@@ -3164,7 +3145,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	}
 
 	/* register component */
-	ret = devm_snd_soc_register_component(dev, &mt8195_afe_component,
+	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
-- 
2.44.0


