Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDCCC7EE22
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 11:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PK4+EPXcGtyHsPnNI1DUEoESxsYoNonqxfNie/0quto=; b=g1HQrVJ0g72/NgESr1iUeJdWeR
	cnks6tIpZi6mKpl4MpqXNTm8xQ+cM5CVwKQu7mWSz4Hfe88Tkd4mdNCKj9ezCywuI8AwGZTaH3mxE
	VbOQMC6YhI+azdA0Pnzp3UuBVX+ZYbRKZzz0naUtRWbPyDGbf6z7nq/3dPJWTMfQctVOoqrr2CKBK
	R49YmVC1C97YMT5teT0O43/Sb/rnzNCkFszivPHiipO5AOqrLyZYFnutemLhPzMqER54DwEWxwA54
	iecLKQDxj9Lq95guuveE8NIQ2VT6D4I96013KrSwoEvWjjViH5cw1T1t1NsDsMPZEPgn+P91jVT5I
	g1RPdqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puAkm-004OF0-06;
	Wed, 03 May 2023 11:34:36 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puAkc-004O91-2U;
	Wed, 03 May 2023 11:34:28 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2552766056D2;
	Wed,  3 May 2023 12:34:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683113665;
	bh=lJinXQ8uqP7CnqlUjGVARURr70ufEO+/YnYRE0JoVQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HSzFx8GbrJ8qs8mBrbeP+h7EcY1pogSEhyzSPpiZVHTaiFRSXaGbp5P86Vt16B/07
	 c7V+Xj5slpef3GSmiz/Pf9bnkDA025Mw3wy8GD8HVuedzDpHs1REkrHXWHXaQs8nYw
	 /J5brCacAgQ3HeDaNVMLMDpgZ4lkPe+LCU+SB0SksECniQJvf0vdahY0Yx7//fAURU
	 +GvoQmfEw4XOQawfFSXrCABO/+LpP1qxWI3y1jQiPDuCe0ey0iPu9Y/FJmCXAqzLTy
	 oh2aaralDRQaWp++iEIUJHa+6Lm4w+kgiByyia77GGEm8NnOE4N083/yLbzxO3FkNI
	 2+9iNKO5hHbrA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	pierre-louis.bossart@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com,
	nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de,
	chunxu.li@mediatek.com,
	tinghan.shen@mediatek.com,
	error27@gmail.com,
	ribalda@chromium.org,
	yc.hung@mediatek.com,
	Allen-KH.Cheng@mediatek.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	sound-open-firmware@alsa-project.org,
	kernel@collabora.com
Subject: [PATCH 3/5] ASoC: mediatek: mt8195-afe-pcm: Simplify runtime PM during probe
Date: Wed,  3 May 2023 13:34:11 +0200
Message-Id: <20230503113413.149235-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
References: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_043426_956717_D024BBC4 
X-CRM114-Status: GOOD (  10.98  )
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

Use devm_pm_runtime_enable() and pm_runtime_resume_and_get() to
to simplify the probe function.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 9e45efeada55..a54c16e0aa05 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3179,16 +3179,16 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	mt8195_afe_parse_of(afe, pdev->dev.of_node);
 
-	pm_runtime_enable(dev);
-	if (!pm_runtime_enabled(dev)) {
-		ret = mt8195_afe_runtime_resume(dev);
-		if (ret)
-			return ret;
-	}
-
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
-	pm_runtime_get_sync(dev);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to resume device\n");
 
 	afe->regmap = devm_regmap_init_mmio(&pdev->dev, afe->base_addr,
 					    &mt8195_afe_regmap_config);
@@ -3238,7 +3238,10 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	mt8195_afe_init_registers(afe);
 
-	pm_runtime_put_sync(dev);
+	ret = pm_runtime_put_sync(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to suspend device\n");
+
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
 	regcache_cache_only(afe->regmap, true);
@@ -3248,7 +3251,6 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 err_pm_put:
 	pm_runtime_put_sync(dev);
-	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.40.1


