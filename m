Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DB1C71141
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jun 2025 08:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddcn6csaeeV+h8a6qan45mbc5QA320UytwqG7KT7p5k=; b=jBCX+DLmYyNXjp1IH2uT2gOLO7
	GUIoD+TlZySSe5uzq+kyvliFFIYRMHs0JBRd38rOdWAGgJAPRPWMUk9mI+Mc/tGKb+QBt33X8+kLS
	E5qp1dOFBnARYX3InmGi0nn/mJ92a7Cbgv8UbykWgqyxq00rtVhEWNtOK7PmR6hyza2681x8ZnIUH
	DGp1pRcWA63yIu94qWPfaUMwFOMTQs92jf3zAsxP6lZfaAFgc+sQcbce4rt/VM+u75rImI3Vie2uk
	7U6biQtN5KcPG9+vGmnrNA1/m09TX4V8Q+f7BbkLnr7wIBZKXtjtfb8d4EV7/ssyO2qbvyAlWZUa+
	Wf74NroA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdPP-0000000Cdvo-2PgJ;
	Thu, 12 Jun 2025 08:35:39 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcgw-0000000CVYc-2b9g
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Jun 2025 07:49:44 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2363497cc4dso5941295ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Jun 2025 00:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714582; x=1750319382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddcn6csaeeV+h8a6qan45mbc5QA320UytwqG7KT7p5k=;
        b=dJYQcL12mbcyZkEPvs253FZqfu28bSF/FwCZssCY1kB/tnFNnJhmdocxH8egUE4pix
         k9dkp9IGiYwNDdFQklGTOuHUJNLTAMwa8yP79qc2FPF8xrUOsRKH2F/pOR7oqzGlx4P0
         wsoFLvheqpk7OqmTAbLKxX6W+ZOBcd+S8MeQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714582; x=1750319382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddcn6csaeeV+h8a6qan45mbc5QA320UytwqG7KT7p5k=;
        b=cv6eFgpIr3iIePSkK5OreEhcEH/Gw6UTr43EzF84Vp9nj/mIrij79jx3CFNkkJogHg
         ebPQQT12bsqUkpg7s5YQVbZ8pjgtNKcjeFQw1MnBOdFVQS+R+2ZrSxQqNKTkHo622Boz
         giHLCOVsDe0Z5WstCjuYcauHy+t6Efvb1J4pdUIidsWN0JMf09Cry317Z9T+ZPtzHGOQ
         ti/VecTzVCNpMyHU3JD5VZm9Pu1Mgxs4FYcZHCEOjd6PAFk/yfEbqdmT7Mcclny8Im1W
         cB3EMZBUP94+QZRFLRAzJl+OA2MveKVrhVvPr3lUNW4QbGLWUNDImBJDGAAkCmr99Buu
         04SA==
X-Forwarded-Encrypted: i=1; AJvYcCWuaPJZ67dUfPdeobvqNucx1g1Fw/oFdVjIh3C0Sb5WlxC+c61nz+3LrinE7dBY3iVkVDoaZiOE+OItfwhRLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YymjxISPUs0zrWLPiEZdVL72MSnobiWh0GuWI7ta4ZQKIf7kKHu
	sCePvh5ttwmriCSnC0JeCQuQw7yfvs4Uit7CCphC6z83xzPJRm28+rB+uaJp2RAZnA==
X-Gm-Gg: ASbGncuZUc/gB7Oo87Rf7IdnGqV67w/b0G0WMUouR/gv3R7XxGk6OiBt+hmzO1IrqDl
	K9O+JRkcIylVUbmq676E4U4zhbWJ/HNCwfRyUuDKhQs0geAoTHRLMh4sTms3oMRAzzEfeqlIa3R
	jjYUQ6MqhaIQEa7ByoXG3AbqE4u/40i2MHenCRFLx0GLjI63kPwzStBu+I42AN38gEEaR4znFya
	N4ylqCE1XkhIyQ3CqkIZPu1oZGeX/k8084sYAoFcJngEN7V8QJOehQ8oBzjaquDID5Jb4Ks9GkT
	OZRi7WfRWwcSzx69l6YiulSToz+4ALh0nfDrVHe9T1G5hvEC7P20g4EkkQLrJqBr6pxB72/mRxL
	7/iE=
X-Google-Smtp-Source: AGHT+IGBp6g9KafxxLhpwpCbKXrP6FojB0bp0d+xTc5kKarZApwn/2KeJhM/CNXIUtiGxu8HhD0Ecw==
X-Received: by 2002:a17:902:f684:b0:234:b41e:37a2 with SMTP id d9443c01a7336-23641aa223amr95318655ad.11.1749714581947;
        Thu, 12 Jun 2025 00:49:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:41 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 9/9] ASoC: mediatek: mt8183-afe-pcm: use local `dev` pointer in driver callbacks
Date: Thu, 12 Jun 2025 15:49:00 +0800
Message-ID: <20250612074901.4023253-10-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_004942_658823_013D7C8E 
X-CRM114-Status: GOOD (  17.67  )
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

The probe and remove functions in the mt8183-afe-pcm driver repeatedly uses
`&pdev->dev` for |struct device *|, but then assigns this value to
`afe->dev` and uses that in other places in the same function.

Store `&pdev->dev` in a local pointer and use that exclusively to avoid
the numerous dereferences and to make the code more consistent. Lines
are reflowed where it makes sense.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 37 ++++++++++------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 7383184097a4..a7fef772760a 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -770,27 +770,25 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	struct mtk_base_afe *afe;
 	struct mt8183_afe_private *afe_priv;
-	struct device *dev;
+	struct device *dev = &pdev->dev;
 	struct reset_control *rstc;
 	int i, irq_id, ret;
 
-	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34));
 	if (ret)
 		return ret;
 
-	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
+	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
 	if (!afe)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, afe);
 
-	afe->platform_priv = devm_kzalloc(&pdev->dev, sizeof(*afe_priv),
-					  GFP_KERNEL);
+	afe->platform_priv = devm_kzalloc(dev, sizeof(*afe_priv), GFP_KERNEL);
 	if (!afe->platform_priv)
 		return -ENOMEM;
 
 	afe_priv = afe->platform_priv;
-	afe->dev = &pdev->dev;
-	dev = afe->dev;
+	afe->dev = dev;
 
 	ret = of_reserved_mem_device_init(dev);
 	if (ret) {
@@ -835,7 +833,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
-	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_get_sync(dev);
 
 	ret = regmap_reinit_cache(afe->regmap, &mt8183_afe_regmap_config);
 	if (ret) {
@@ -843,7 +841,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_disable;
 	}
 
-	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_put_sync(dev);
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
 	regcache_cache_only(afe->regmap, true);
@@ -901,7 +899,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(dai_register_cbs); i++) {
 		ret = dai_register_cbs[i](afe);
 		if (ret) {
-			dev_warn(afe->dev, "dai register i %d fail, ret %d\n",
+			dev_warn(dev, "dai register i %d fail, ret %d\n",
 				 i, ret);
 			goto err_pm_disable;
 		}
@@ -910,8 +908,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* init dai_driver and component_driver */
 	ret = mtk_afe_combine_sub_dai(afe);
 	if (ret) {
-		dev_warn(afe->dev, "mtk_afe_combine_sub_dai fail, ret %d\n",
-			 ret);
+		dev_warn(dev, "mtk_afe_combine_sub_dai fail, ret %d\n", ret);
 		goto err_pm_disable;
 	}
 
@@ -923,16 +920,14 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->runtime_suspend = mt8183_afe_runtime_suspend;
 
 	/* register component */
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					      &mtk_afe_pcm_platform,
+	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
 		goto err_pm_disable;
 	}
 
-	ret = devm_snd_soc_register_component(afe->dev,
-					      &mt8183_afe_pcm_dai_component,
+	ret = devm_snd_soc_register_component(dev, &mt8183_afe_pcm_dai_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
 	if (ret) {
@@ -943,15 +938,17 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 
 err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 	return ret;
 }
 
 static void mt8183_afe_pcm_dev_remove(struct platform_device *pdev)
 {
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		mt8183_afe_runtime_suspend(&pdev->dev);
+	struct device *dev = &pdev->dev;
+
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		mt8183_afe_runtime_suspend(dev);
 }
 
 static const struct of_device_id mt8183_afe_pcm_dt_match[] = {
-- 
2.50.0.rc1.591.g9c95f17f64-goog


