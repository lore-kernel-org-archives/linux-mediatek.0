Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5948C7EE45
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 08:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SP71WQvqdIVRQiZKYJGaccR3LIlMhb9at3kgqTL8Ia8=; b=TgMquxvaTQGVmEvriEOSyhuzP9
	TQkkYKUQL3yYYwlvsG0DrnQQuSCxfLqMObDtmgRpusMu+VnW8Tq86cdwEKsKAqg3TuPBoKVAwV2nG
	Go1/IKH/6lSss7Lfc8FZEWcG6LRPLcKWF2530S8Wy62EdBMhlHa7zqpgZu3ILqopnSIzbAsx0Grc/
	1I+ph03ifbQUcFS86Xm7dal/cHNxGnF3ReC4ro4sFbDV7ljPcIX6+xmsFukYYq8kU/cfpPkzn/yYl
	OSS5gWI1SRlIks7b6x+TWKxqYAarfilvvQLYi42NYd3S2TVmedtJVZOnKkmkl6VZ48oVe8IJwtUv0
	CMRzUrdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7BJA-008a6u-2f;
	Thu, 08 Jun 2023 08:47:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7BIz-008Zxx-28;
	Thu, 08 Jun 2023 08:47:43 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9D7766606F19;
	Thu,  8 Jun 2023 09:47:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686214060;
	bh=GnnvLVruG/Y33qFCquYPrGvofADRKh+faHOxi3VmkPI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K3FR3YDRoNDC3LYRTZPIk5Rn0nu9jgsm8EPFVdYkLRCBkIRuQVlLT9BdgMshZzk9D
	 2S8qEh6Y/Wl0WGnCL51l/+Vl0bg1d64uivRaGNfXfpmFY+OqFtYV9hfUg+XJiZ7xVV
	 LQt1KyKn/DLUA9gRc5j+Rv5OXwIfmUftXMLZxkRYnBzWvZXFxB5Ek1BwzJhHhtJK66
	 OwOpZYksqB7grpu1ZNzENrQNmTDGNrgs7Q9mbyVQFalxRnPhlhYuGGUpGmAI9xn10J
	 gYb9Q42zm03N+gmDaJyOJjPOkFBF/BDgUdnD77G1mc/3nPXa5pv4guep0tu3gjgzfg
	 ZGZ/uzDnU0zcA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	trevor.wu@mediatek.com,
	amergnat@baylibre.com,
	dan.carpenter@linaro.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 4/5] ASoC: mediatek: mt8188-mt6359: Clean up log levels
Date: Thu,  8 Jun 2023 10:47:26 +0200
Message-Id: <20230608084727.74403-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
References: <20230608084727.74403-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_014741_828044_F34C288B 
X-CRM114-Status: GOOD (  10.87  )
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

Change some dev_info prints to dev_err() and some to dev_dbg(),
depending on the actual severity of them.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/mediatek/mt8188/mt8188-mt6359.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 260cace408b9..5b2660139421 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -337,9 +337,8 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 
 			/* handle if never test done */
 			if (++counter > 10000) {
-				dev_info(afe->dev, "%s(), test fail, cycle_1 %d, cycle_2 %d, monitor 0x%x\n",
-					 __func__,
-					 cycle_1, cycle_2, monitor);
+				dev_err(afe->dev, "%s(), test fail, cycle_1 %d, cycle_2 %d, monitor 0x%x\n",
+					__func__, cycle_1, cycle_2, monitor);
 				mtkaif_calibration_ok = false;
 				break;
 			}
@@ -398,8 +397,8 @@ static int mt8188_mt6359_mtkaif_calibration(struct snd_soc_pcm_runtime *rtd)
 	for (i = 0; i < MT8188_MTKAIF_MISO_NUM; i++)
 		param->mtkaif_phase_cycle[i] = mtkaif_phase_cycle[i];
 
-	dev_info(afe->dev, "%s(), end, calibration ok %d\n",
-		 __func__, param->mtkaif_calibration_ok);
+	dev_dbg(afe->dev, "%s(), end, calibration ok %d\n",
+		__func__, param->mtkaif_calibration_ok);
 
 	return 0;
 }
@@ -486,14 +485,14 @@ static int mt8188_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 					 mt8188_hdmi_jack_pins,
 					 ARRAY_SIZE(mt8188_hdmi_jack_pins));
 	if (ret) {
-		dev_info(rtd->dev, "%s, new jack failed: %d\n", __func__, ret);
+		dev_err(rtd->dev, "%s, new jack failed: %d\n", __func__, ret);
 		return ret;
 	}
 
 	ret = snd_soc_component_set_jack(component, &priv->hdmi_jack, NULL);
 	if (ret) {
-		dev_info(rtd->dev, "%s, set jack failed on %s (ret=%d)\n",
-			 __func__, component->name, ret);
+		dev_err(rtd->dev, "%s, set jack failed on %s (ret=%d)\n",
+			__func__, component->name, ret);
 		return ret;
 	}
 
@@ -510,14 +509,14 @@ static int mt8188_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 					 &priv->dp_jack, mt8188_dp_jack_pins,
 					 ARRAY_SIZE(mt8188_dp_jack_pins));
 	if (ret) {
-		dev_info(rtd->dev, "%s, new jack failed: %d\n", __func__, ret);
+		dev_err(rtd->dev, "%s, new jack failed: %d\n", __func__, ret);
 		return ret;
 	}
 
 	ret = snd_soc_component_set_jack(component, &priv->dp_jack, NULL);
 	if (ret) {
-		dev_info(rtd->dev, "%s, set jack failed on %s (ret=%d)\n",
-			 __func__, component->name, ret);
+		dev_err(rtd->dev, "%s, set jack failed on %s (ret=%d)\n",
+			__func__, component->name, ret);
 		return ret;
 	}
 
-- 
2.40.1


