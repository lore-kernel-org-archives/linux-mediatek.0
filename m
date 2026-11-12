Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE402606A31C
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 06:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Czu4y/pM;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uyk3makO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5qj1NEIyOjI8wxju1CxSSKB0R6wnAt9ym79/l5uuVfw=; b=Czu4y/pM7UHZIh
	AJvon8h2QRHkzV/nfPXaLZqWVbfMN+krMGx2LOt5Z2sMp3SLx+SoT0sTF/xG2YWG++QtFlpQF32SL
	v/xm7pWsy9OiTigFHCaEIv1e4c612Cl6OUb+eVLflsUvjDMTyD3iw39haR2IXrMxrQScBDWuwy4wR
	u637hS5q7IID072Ms+ynnns8neLZJUPQADqcMc0ukbZOI6JtiQ8NRKiocI9RtmpoIh+XYRncJQ9g1
	e2U+wm5pe3CH7Xx/7/vjgJNQMYkxglkSdZkjXG6JO1ug8Y1SPv3RGevpvDBenHcexV3u2yi6ZON+3
	0Lbh4MkUHUgstjIS35sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRO94-00000008nYp-2HLm;
	Thu, 12 Nov 2026 06:18:51 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRO8D-00000008nKN-3Pyr
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 06:18:07 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-5495d549924so39891991cf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Nov 2026 22:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464276; x=1795069076; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5qj1NEIyOjI8wxju1CxSSKB0R6wnAt9ym79/l5uuVfw=;
        b=uyk3makOgRly/OZ8ncKkW/eT3v8bnSM/F/mUthWX+26uuur1ABLhFdTKtgGzUNquYY
         hnOrXSe7ptCKcYhQN+ndCdWIkMPAuoYXq4f+eP3/pooA1x5VRqjKnQMLuik1Z/KC5uBH
         4wmsq4vso/P3Pr/RUCt7EVhoqtT8Fe8mVNcnB7PapRizW/blV9XzjefBjZajBwCo1FKr
         uYs4sKPHv6pOhw9SVlazFaI0SOwJn+GXZuJVkf08k9vDHG87SfMvyyaIeqvi+NZmGXZz
         O9jYggafjfL/AvxqZio1dvvhM6cKS45t1LnSNQEY0fKtsOs+IzgsaUQhp92qhAr4jvXi
         ysuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464276; x=1795069076;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5qj1NEIyOjI8wxju1CxSSKB0R6wnAt9ym79/l5uuVfw=;
        b=DHMyZW4nhYgMc+W2Fnwar0zZdlhr4jdXVkKHw+7X5/iEusaRWMe+cTrjSle19YEmxZ
         v/AoGDjzf+13c6jb2KCcKORmW7bwpryPskQ1EvwdeZZUr/tQSTxWn0Zjtu4+qYk7aBfs
         DOfTjcpSahTk2fPFpSdh1vXnayAT2jgy651BiR9a5iLudNXtMcYA9wr+IXyoyqzOde/+
         d5JSLBAfo2QZIZwmQwdIgMrRjP/5z1xsgIQ4is3RZhyJRWiLwZp2RvgSi/Xae/Bfp0vx
         67OwCmW8wfC9Lc2FOUYoFRQMBd5pdMylN4/CoyVTOzzczd86RKuzRJ6Dse7aVx4IRZ1a
         QVwQ==
X-Forwarded-Encrypted: i=1; AL+hErEHPgJH4/9ado9MrufiNOBH9qu9byKt0j0Y17XHeKPuE+S65a0Xr1bnEJF3HkFQ17viAt18PAwkfU+aZGyjOA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/lSIALjzeqOBkZrdcVBrOpbetx9peogFedhoak0E/1eHyJWCsL
	55f0vP+zG+maSrtGy5sp+vkvEPGo35IAC2xG3ZgtX7pq61/7p6qphJ0=
X-Gm-Gg: AYBFou1X59MYtSI36V+CBb07VrmkL8uypVSsB+v3izru5Vh1g7tUGx6O3Rj1lH0ZWtw
	cuh2+Jm0iyj2ea4/bLZpQco1DL0ZJCg2xaoYQx39F4/BJLtPyJqeR0zFf+yxUEnFvaoDOCH2izV
	miHSHEM/RhKaF8fci8WVBtfHrNtpJAFv2BbwrV+J8DbmwoeNfi8PUbhh6hJ5BjX+0VX/BIzmNuD
	hAWkkkMCD0xkKYE9d0WCz8gLWGsF7jfXpS19O4tpcFU0+VY0h+RnNuVtSxOlDT8ACP3EezJg4R4
	wmGafAxcjJUfiR5F+Tz9sxRKoi7LtMAmrgTJ4scNXqLLeonRSoDJzqpOP31Mi6E41NE5pJ0J3CZ
	xbXlTUQouDNun5Vog2GIFA8Hd1Wg1+LNlxIFff/PpsQc2Z8yni4cb5RAJE+05dohuVjWS6gzYa2
	pqWvAQxa/x4A7An/SYfAFcPl8JJxnCEZ14ZDF1YMBHHrhlRzAvmAf3ctgc903R3uDAmzsy28eMo
	kcLPpwQoO1F/WjRmaysst1iYSwmRcdO2L7dVnxnPbSbltvwcFNKp2fNIKvGW2pqFY9AMVb87vMA
	ooJ/OR6rCe4OGRKP9dqNtxS7iPoNS6xRCqAYBD6t4kVP8cFxLBpLGciUk7SsvFrfUsgZoDYNqcv
	mGeMjU7NIVOjC2glQJiW3eeTv9vHMZjMKBf8L9PNVJZSx99OTo0/63W4QempDW/VQG9Jj0LRUYm
	0id3UuY1NKQqjF16u0ptH7tHp4oToUbyBE
X-Received: by 2002:a05:620a:440d:b0:93f:5f83:2ca7 with SMTP id af79cd13be357-947affbcac7mr807733085a.52.1794464275757;
        Wed, 11 Nov 2026 22:17:55 -0800 (PST)
Received: from localhost.localdomain (h16.44.55.139.dynamic.ip.windstream.net. [139.55.44.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-947a5ac3f27sm513931985a.22.2026.11.11.22.17.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:17:54 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [PATCH v2 1/5] ASoC: mediatek: mt8186: Keep the AFE IRQ within its resource lifetime
Date: Thu, 12 Nov 2026 01:17:45 -0500
Message-ID: <20261112011708-afe-v2-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20261112011708-afe-v2-0-mhun512@gmail.com>
References: <20261112011708-afe-v2-0-mhun512@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_221757_893979_E54FD63F 
X-CRM114-Status: GOOD (  20.82  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The AFE IRQ handler uses afe->regmap, but its managed IRQ is requested
before the audiosys reset and before the regmap is initialized. Apart
from allowing an interrupt left pending by the firmware or a previous
kernel to dereference a NULL regmap, the reverse devres order releases
the regmap before the IRQ on probe failure and removal. The IRQ wake
setting enabled at probe is also never undone.

Request the IRQ after the reset, the regmap and the handler's other
inputs have been initialized, and keep the existing runtime PM error
cleanup for a failed request. Balance the IRQ wake setting on the
remaining probe error paths and in a new remove callback, which also
releases the IRQ before devres tears down the component and the regmap.
Save the IRQ number in the private state for that.

Found by a static analysis tool under development.

Fixes: 097e874ad3fc ("ASoC: mediatek: mt8186: add platform driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---

 sound/soc/mediatek/mt8186/mt8186-afe-common.h |  1 +
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 42 +++++++++++++------
 2 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-common.h b/sound/soc/mediatek/mt8186/mt8186-afe-common.h
index d59258520995..d03e59ca7d65 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-common.h
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-common.h
@@ -139,6 +139,7 @@ struct mtk_base_irq_data;
 struct clk;
 
 struct mt8186_afe_private {
+	int irq_id;
 	struct clk **clk;
 	struct clk_lookup **lookup;
 	struct regmap *topckgen;
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 2f50f78a6f8c..134ff3947bff 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2885,16 +2885,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq(pdev, 0);
 	if (irq_id < 0)
 		return irq_id;
-
-	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
-			       IRQF_TRIGGER_NONE,
-			       "Afe_ISR_Handle", (void *)afe);
-	if (ret)
-		return ret;
-
-	ret = enable_irq_wake(irq_id);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "enable_irq_wake %d\n", irq_id);
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2947,6 +2938,18 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->runtime_resume = mt8186_afe_runtime_resume;
 	afe->runtime_suspend = mt8186_afe_runtime_suspend;
 
+	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", afe);
+	if (ret)
+		goto err_pm_disable;
+
+	ret = enable_irq_wake(irq_id);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "enable_irq_wake %d\n", irq_id);
+		goto err_free_irq;
+	}
+
 	/* register platform */
 	dev_dbg(dev, "%s(), devm_snd_soc_register_component\n", __func__);
 
@@ -2955,13 +2958,13 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
 	if (ret)
-		goto err_pm_disable;
+		goto err_disable_irq_wake;
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret) {
 		pm_runtime_get_noresume(dev);
 		dev_err(dev, "failed to suspend device: %d\n", ret);
-		goto err_pm_disable;
+		goto err_disable_irq_wake;
 	}
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
@@ -2970,6 +2973,10 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_disable_irq_wake:
+	disable_irq_wake(irq_id);
+err_free_irq:
+	devm_free_irq(dev, irq_id, afe);
 err_pm_disable:
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
@@ -2977,6 +2984,16 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void mt8186_afe_pcm_dev_remove(struct platform_device *pdev)
+{
+	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct mt8186_afe_private *afe_priv = afe->platform_priv;
+	int irq_id = afe_priv->irq_id;
+
+	disable_irq_wake(irq_id);
+	devm_free_irq(&pdev->dev, irq_id, afe);
+}
+
 static const struct of_device_id mt8186_afe_pcm_dt_match[] = {
 	{ .compatible = "mediatek,mt8186-sound", },
 	{},
@@ -2995,6 +3012,7 @@ static struct platform_driver mt8186_afe_pcm_driver = {
 		   .pm = pm_ptr(&mt8186_afe_pm_ops),
 	},
 	.probe = mt8186_afe_pcm_dev_probe,
+	.remove = mt8186_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8186_afe_pcm_driver);
-- 
2.43.0


