Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9982C369D1
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 11:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AyQBxT8N1LOd0tBT65hxZtJpAp/ZMeB2TPzFU7H3X0U=; b=JNMDkLCShDYtvTgL6sXDdqhFX0
	HmbqfEnd2YV7qQahAqaqm6jo6ZqrWtLfq8XJmIDjJTyv17qFhqR0yWYivU1SGpUNOpw2uVlouLYfC
	BBpEkcQO5wgepJMO75Zl1gicTmXehzS8kBfUWA5SqQ46Xiu4RV/UIYyG5Uz4eXlaHCysFk/pxZhsy
	w8RuK7fyzBDhlsxyBnXQVosv1tLE3si6jcBCSjhLJlmzYWaLY4Q0u9POVV4+rnYT+TJMXY3gAPpEQ
	gHeADuCeDAAdxYO1iqUyAZLR6FucBCQGZpAibQ74tbESzb+zH/slh+J9HnCBrBsyq5S9XGYqfjuiC
	IScd4LyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7v0S-0000000DuHq-3c5D;
	Thu, 24 Apr 2025 11:44:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tmE-0000000DfbJ-3AUW
	for linux-mediatek@bombadil.infradead.org;
	Thu, 24 Apr 2025 10:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AyQBxT8N1LOd0tBT65hxZtJpAp/ZMeB2TPzFU7H3X0U=; b=YFj0APOTcaQIBXDOl9awuS4Uka
	1V37me1Q5gUxSSnFtb4l2HAVyWAsvmPcGGeTpt/pM5OAnjruQGS3AxdtgPvJc1RvRBPDxchQpiTJH
	Cm37hvRJL0cBbekrmpS7rf97xkj2KcnIdiqk8+VCw6btiobfP+qX2V1Go9LZ16QxDv5P7d00sdd12
	VMtI8tgPmuj7WQoMbHUn7rW3E7jnpdnlbobtUZBE1ZP/ftzli+uWyHczcxia+MEdaJFfpS+/if3d5
	m8Qtrz+oc9IQsexE5Xs1AYN8TJxebmXAXLkO4wt+yUAQ/MIvrYx3yxTOiqPbnTuMnQoOdeyfd6+4C
	VaAcwcPw==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7tmC-0000000BjXa-0JPs
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:53 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-22409077c06so12423965ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Apr 2025 03:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490349; x=1746095149; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyQBxT8N1LOd0tBT65hxZtJpAp/ZMeB2TPzFU7H3X0U=;
        b=ajZRLtwhQ3cZOxg88HOa59iHyhyli2o2ge3jSi5egScKBAasattan+rTD7G6QENoC4
         uAipZipzROmgWjZbNs9leV8uJiJWd3TXxqDYd6zO0aoYmx+yf1mMwk4s/0BudZz+9bDQ
         CtoUf/XpGOgehj6Xe0UGCSFcOl2cWLDLf5e7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490349; x=1746095149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AyQBxT8N1LOd0tBT65hxZtJpAp/ZMeB2TPzFU7H3X0U=;
        b=t1sf6CDnghGXW373FxNxrlrERuMDk18OKiCZeQuwdpX3tA/OLzrG60wFBt5Yf81EIS
         uecTZU8cv/HzEREiIpAy0xkucg1U2YYkCEBnNb3Z1ETmLcseSLEbUe96nWLV8H0Un4q+
         J341nxiCQvR/dXHt6KQW7bulymTKAkmJ2w/EeJoqcJ2ELaFuGjvOHta8GnNldRSwsdZX
         o7/E7aYpSWT0EtZA1slq8nD+uNsHlzMwvyWSkK3b1PuYLJ13Ns7E9h74sMyWSvyCJuzP
         6IXQUeVE6O1jqfREZco86SKhReFqkYIuD6mlDSSblzUuYxx8ylwVTW1dSv3MV7kaGbjR
         SSmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZKzBkRzBKYrkHSoJudDEmiaG4NJq/0QoZQ51cruTVx4+61t6A/vqmqsEaACInhpXtjiFSIQKuNIQURODlQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+KNVWNaEdLYTod1eS144oIFgkqAoQ4P+ddQrTzJzIwEOdWlLb
	tc/fuUE00QnNno9B9S6QcrprJ3AkIDMSA1imxd543aWucs/qA72uJGbCH5oV5g==
X-Gm-Gg: ASbGncuFMlvr0MVso5tcDGnItczQvMcwhskgmHQzdep2P5ceNXeRIteuEHZFTb7nKYp
	fIdyGvMKCF6qvxSqMxn42cHPlqiiD4WtJGEeHvsOJ+K6sSG1Rh+7l1PXcz6OgC8PyFb+T6GPE6V
	oNyqImnJTGSHo9srFJ//7Qfbo0F3mmrC8rwVgp1JWOleItEnmJhBaioYQWeZe16+e+Glca40ahA
	F8leik08DrULTaBth/jIJWzsHqAqgcOZZiDSvaxzaqO92K9IYhuiDK3HqhrOua7f/TKMtVwroK6
	dQPY8tLE0zOAOskXmGjwmVzjgOiIQFy8dndqxyJfLfvy8ZLZlyziETqFig==
X-Google-Smtp-Source: AGHT+IFt0XUOGJk3Ud4+wtbFjwGwTHDAiFvZxN/Xk3zgndqYjVRMpy5Cx4zWYWH17RjjMOdqNLFarQ==
X-Received: by 2002:a17:903:183:b0:223:8256:533d with SMTP id d9443c01a7336-22db3dd0a8cmr28683815ad.46.1745490348905;
        Thu, 24 Apr 2025 03:25:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:48 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/13] ASoC: mediatek: mt8183-afe-pcm: use local `dev` pointer in driver callbacks
Date: Thu, 24 Apr 2025 18:25:03 +0800
Message-ID: <20250424102509.1083185-10-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_112552_204233_915F069F 
X-CRM114-Status: GOOD (  17.52  )
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 37 ++++++++++------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index a3c8054a434f..d63b7fe19fbf 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1114,27 +1114,25 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
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
@@ -1179,7 +1177,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* enable clock for regcache get default value from hw */
 	afe_priv->pm_runtime_bypass_reg_ctl = true;
-	pm_runtime_get_sync(&pdev->dev);
+	pm_runtime_get_sync(dev);
 
 	ret = regmap_reinit_cache(afe->regmap, &mt8183_afe_regmap_config);
 	if (ret) {
@@ -1187,7 +1185,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 		goto err_pm_disable;
 	}
 
-	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_put_sync(dev);
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
 	regcache_cache_only(afe->regmap, true);
@@ -1245,7 +1243,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(dai_register_cbs); i++) {
 		ret = dai_register_cbs[i](afe);
 		if (ret) {
-			dev_warn(afe->dev, "dai register i %d fail, ret %d\n",
+			dev_warn(dev, "dai register i %d fail, ret %d\n",
 				 i, ret);
 			goto err_pm_disable;
 		}
@@ -1254,8 +1252,7 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* init dai_driver and component_driver */
 	ret = mtk_afe_combine_sub_dai(afe);
 	if (ret) {
-		dev_warn(afe->dev, "mtk_afe_combine_sub_dai fail, ret %d\n",
-			 ret);
+		dev_warn(dev, "mtk_afe_combine_sub_dai fail, ret %d\n", ret);
 		goto err_pm_disable;
 	}
 
@@ -1267,16 +1264,14 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
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
@@ -1287,15 +1282,17 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
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
2.49.0.805.g082f7c87e0-goog


