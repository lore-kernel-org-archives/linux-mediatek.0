Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1222EC77B78
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 11:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4vZNRJbRSvAHuMgBj8rZFvL4Lt1CBAzXdTVl14UkhM=; b=PSiBbvFH/DqAo79loPpMmGurxY
	lQ/8xmHnVJnSL1EZd3iR+NebD44SAj7n1o6XVRen5aD0Y0hDp2eRJutwVgVe3WhWqoBjTtdYOWpsm
	6e5qfylKKmNfSow4umBchIUyyCOWcs4LHLSTV4/qJoH3ENkEv5zHtRLfbJXJWJYhi+1q1TnklYSo+
	AbmePNs8pGPnWGVDpTkRFQW9+k0RjRicXjMhKUi+s0/n2NhJFAL5zG+5jCLuaFlqtVop0fjTxE3Ow
	VFEqZroemXHoWWyq8vC1xuvw8P7cvoKaNkSxlQ1rnx/4HltFbgTVZq1Mj/zOpmf2jVDVEzD66y57P
	ml9OASww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puAkq-004OIu-00;
	Wed, 03 May 2023 11:34:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puAkg-004OB4-08;
	Wed, 03 May 2023 11:34:31 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 743AE66056D4;
	Wed,  3 May 2023 12:34:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1683113668;
	bh=oygimjOCk8FTKzESWYFnGtWGKI3xuJTfmDm18J1tugE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nnSLnjd9bpSYeCY/2/NZVqduUmxCHwexohgvPshz2JTllUkmyRo/njwEw9d4MwMJT
	 7WEzj0+RlugeL+084Qu1byhLz321QBuV8Sp92WcW9OzgyfZhtdh9RnF9AP4e5g/EHW
	 wZvTDMxTRy+WptLhVtHFLPGx8Ifv3Vg6GQiytY7PaF4r5l1Qti/S0P4uF6QHP4VZ0S
	 uYa3FmhoPtjBPdT4YwwzCHzPe8XQAyhTpqzOo4CW4+mImzfQm5qUEWB1WEordvvWqk
	 Onn4CAvpadjEBcP9u3b3WgmRzKWsJ3zxVdgaTHuF3A+t+/U+XHxKLbGXCt2O6Cov0N
	 i+M3I5tgi8W/A==
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
Subject: [PATCH 5/5] ASoC: mediatek: mt8195-afe-pcm: Clean up unnecessary functions
Date: Wed,  3 May 2023 13:34:13 +0200
Message-Id: <20230503113413.149235-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
References: <20230503113413.149235-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_043430_229447_28103903 
X-CRM114-Status: GOOD (  13.21  )
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

Function mt8195_afe_init_registers() performs just a single call to
regmap_multi_reg_write(), it returns int and it's not error checked;
move that call to the probe function and also add some error check.

While at it, also move the contents of mt8195_afe_parse_of() to the
probe function as well: since this is getting a handle to topckgen
and since that's optional, the ifdef for CONFIG_SND_SOC_MT6359 can
also be removed.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 32 ++++++----------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 105db11eecec..d22cf1664d8a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3030,28 +3030,6 @@ static const struct reg_sequence mt8195_cg_patch[] = {
 	{ AUDIO_TOP_CON1, 0xfffffff8 },
 };
 
-static int mt8195_afe_init_registers(struct mtk_base_afe *afe)
-{
-	return regmap_multi_reg_write(afe->regmap,
-			mt8195_afe_reg_defaults,
-			ARRAY_SIZE(mt8195_afe_reg_defaults));
-}
-
-static void mt8195_afe_parse_of(struct mtk_base_afe *afe,
-				struct device_node *np)
-{
-#if IS_ENABLED(CONFIG_SND_SOC_MT6359)
-	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-
-	afe_priv->topckgen = syscon_regmap_lookup_by_phandle(afe->dev->of_node,
-							     "mediatek,topckgen");
-	if (IS_ERR(afe_priv->topckgen)) {
-		dev_info(afe->dev, "%s() Cannot find topckgen controller: %ld\n",
-			 __func__, PTR_ERR(afe_priv->topckgen));
-	}
-#endif
-}
-
 static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
@@ -3160,7 +3138,10 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, afe);
 
-	mt8195_afe_parse_of(afe, pdev->dev.of_node);
+	afe_priv->topckgen = syscon_regmap_lookup_by_phandle(dev->of_node, "mediatek,topckgen");
+	if (IS_ERR(afe_priv->topckgen))
+		dev_dbg(afe->dev, "Cannot find topckgen controller: %ld\n",
+			PTR_ERR(afe_priv->topckgen));
 
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
@@ -3219,7 +3200,10 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_put;
 	}
 
-	mt8195_afe_init_registers(afe);
+	ret = regmap_multi_reg_write(afe->regmap, mt8195_afe_reg_defaults,
+				     ARRAY_SIZE(mt8195_afe_reg_defaults));
+	if (ret)
+		goto err_pm_put;
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret)
-- 
2.40.1


