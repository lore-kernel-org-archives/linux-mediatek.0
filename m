Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE14ECA9EC7
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2026 22:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKkUPTCtltFdZ9C+7fT/K+z9vZg2YGtaLvZ8HrFAoZs=; b=MJjBtYiMTX2frzkHWN2Q0s5ltw
	xS7SMp2sI9bKk8zqpROnc1DO6oDNFJ7SOr4CfKZazKFmekiuPoHpXtnMQgsav3cZsxDioYLUuxdho
	gvhyQQM6A3ESyZ6AQeNvG1n0WJpPaXvWf1CV2PzEtz6g/m2Y5NDcVqt3QYjelC0QqDlpp0FKOmpbZ
	t7j4gM4eHjCBGbs804NIDw6zodGbzvReY0EkKihGrOi8KWYgkc2d85pYWNUK6yNTCROkVYpYDw/0x
	fsAtQkS0I5/Cg3DjHELisuFkCHddEggOd58Ax5DPsAptajA9Q4PEWeFtKv7fOO1fN99HqPIQTPU7x
	adQ+3LVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG1wP-00000009SE9-46jm;
	Sun, 11 Oct 2026 22:22:49 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG1wK-00000009SAN-3Jed
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Oct 2026 22:22:47 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-918f75a68f0so26536296d6.1
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Oct 2026 15:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791757363; x=1792362163; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UKkUPTCtltFdZ9C+7fT/K+z9vZg2YGtaLvZ8HrFAoZs=;
        b=ANCelbEc4cyIsufr6+Xq3kft9/Rewa0u/76NDyvkseKPuMaI++5ktSLRB2sew2TUr/
         AOh+K810F3GYtnEoXXiOACHG3gPFd/l/TASFcWx0611nUrUNNuNS3hGy3oTYNiWs3oYp
         r+bRZz3k4X/Yr46WUSQuUv2KdvDUo4KBrTXeapFaYfb0d1qCxdIer2+sdUwA1NE9ke1Z
         ANMsIa4vSxXdHQt0qf3nFD9+2uDz1xNpLMfv9zOvLHAIs930WesfByEDOQZgn5kItdvb
         o8xbKyPg5gIpi9A2ErWtAyKFsDm4oFztjDWWzbzK0pFL3i5JInTxX/M/3BKg/I4SFT4T
         dPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791757363; x=1792362163;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKkUPTCtltFdZ9C+7fT/K+z9vZg2YGtaLvZ8HrFAoZs=;
        b=jk4dxlsrDDcc/QYfTeJX6jlqNPVmcAUw5lK71gGlwGKxyRStu9yqFw221CASdVkVBl
         c+YUYl1WNhyWrBsdUM0QSGd3md3Y+QPgg6INr9JO9UIxJT4lNo9ghkftI++W+fr2EPlb
         yNLraZ1Oxc1ktp0ReAp08UNPzeQc48K0JI/1sbP33oFWU/1q3fx9vNH90YGZ/DvK43eh
         2MZVYaoGu7wTtZ2pav9nASU839IoNH7Vq8eIMkyHuHFfNLf3bwOWaWSUjMuKrnXWv6kh
         lM1dSz04Ib3aXOqlH+4IMxOjlju/HpQb/dys0YBBM9j28PVnbNIF6Q0HjnkSCRpkcGJi
         NZ0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzjThTN0LZprYiSUWPwlvaUyzRZClXlQfNJhR1V6FdeV9UroJ3zAV0CgfcCKixpyr/rWY6x1rOQmZLg2kgwlg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJGDh4Q3Chrjp/0D2d/Mh5EaIdMdEvmunJ4t3Xs4L/U5dgGGDKv
	MmTkbnlIVOCVxlE6BZsT4I/qIRjcCqnMRukpVig3lwZi9RJ92zy8T44=
X-Gm-Gg: AYBFou3RiJPMoY3QGO+QgfkDqH42bDNWdu/d6XCLPaO0jNjKXd4VdPYICHR8Un419T0
	bsdrz/3qIs10d438BXPWUA7Vqj8JHG4fUXDJPcAlT0g1rRZQrqNBM19IaYZph88ceV27bRSE3ya
	od4X3W3aB2ijI6LV3Nsu4Vj44vc89LX/noAuW4M9ZNTODOWbRLqS9aD+O7ZAlLGexTGvFTIpA23
	MLIAf8zskf8+XIOQpF4t2m32ufqCT5DrzDQf1SKu66rA59VJExKYIH8qoKVafF9HBVinLXKeQjG
	Q42WJRPu4waYekF0nw3Xhvqoyzy+KEzS7eFjGyUY5iNfYGw5KA2NE9IJgXErPqaT9pK4rCjrO0f
	NiePuh/ruguTub496uzSnG4TAHRIi3fMCOqSzrzFo91m8/E08RkewU9EteXrkem5Qywc6Ixll9n
	delyi14Sf4mSJkcRz4DhFt9tzrXOSdwcZszLaQo1ZSWGAjaZWCy2QnG2Xlc0wJkrPnDBSNRNmGS
	RYwWCsKjexnuzwxr1NY7ccwVYy3AU8XMMV9HdDiRg4MR7S//nJ8iEIVERUMOgqZiGKYbGT/NIJ8
	VFtjdVdmTRHeWtdz+Ndr2vPztUG7
X-Received: by 2002:a05:622a:4d07:b0:535:8518:a4ae with SMTP id d75a77b69052e-5359fdfce6amr134688601cf.61.1791757363408;
        Sun, 11 Oct 2026 15:22:43 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7ecccdsm66288831cf.30.2026.10.11.15.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 15:22:41 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH 1/3] ASoC: mediatek: mt8186: Keep the AFE IRQ within its resource lifetime
Date: Sun, 11 Oct 2026 18:22:32 -0400
Message-ID: <20261011222234.2098904-2-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011222234.2098904-1-mhun512@gmail.com>
References: <20261011222234.2098904-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_152245_286404_43711E9F 
X-CRM114-Status: GOOD (  19.08  )
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

The AFE IRQ handler uses afe->regmap, but its managed IRQ is requested
before the regmap is initialized. Apart from allowing an early interrupt
to use an uninitialized regmap, the reverse devres order releases the
regmap before the IRQ on probe failure and removal.

Request the IRQ after the regmap and the handler's other inputs have been
initialized. Release and synchronize it explicitly on removal before the
managed ASoC components start tearing down their state. Balance the IRQ
wake setting on removal and on the remaining probe error paths, and keep
the existing runtime PM error cleanup for a failed IRQ request. Save the
IRQ number in the private state for final cleanup.

This issue was found by static analysis.

Fixes: 097e874ad3fc ("ASoC: mediatek: mt8186: add platform driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with Clang 22.1.2, W=1 (arm64).

 sound/soc/mediatek/mt8186/mt8186-afe-common.h |  1 +
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 44 ++++++++++++++-----
 2 files changed, 33 insertions(+), 12 deletions(-)

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
index 44a521c3a610..ea61fa5fe372 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2884,16 +2884,7 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	if (irq_id <= 0)
 		return dev_err_probe(dev, irq_id < 0 ? irq_id : -ENXIO,
 				     "no irq found");
-
-	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
-			       IRQF_TRIGGER_NONE,
-			       "Afe_ISR_Handle", (void *)afe);
-	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
-
-	ret = enable_irq_wake(irq_id);
-	if (ret < 0)
-		return dev_err_probe(dev, ret, "enable_irq_wake %d\n", irq_id);
+	afe_priv->irq_id = irq_id;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -2946,6 +2937,20 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 	afe->runtime_resume = mt8186_afe_runtime_resume;
 	afe->runtime_suspend = mt8186_afe_runtime_suspend;
 
+	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", afe);
+	if (ret) {
+		dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		goto err_pm_disable;
+	}
+
+	ret = enable_irq_wake(irq_id);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "enable_irq_wake %d\n", irq_id);
+		goto err_free_irq;
+	}
+
 	/* register platform */
 	dev_dbg(dev, "%s(), devm_snd_soc_register_component\n", __func__);
 
@@ -2955,14 +2960,14 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 					      afe->num_dai_drivers);
 	if (ret) {
 		dev_err(dev, "err_dai_component\n");
-		goto err_pm_disable;
+		goto err_disable_irq_wake;
 	}
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret) {
 		pm_runtime_get_noresume(dev);
 		dev_err(dev, "failed to suspend device: %d\n", ret);
-		goto err_pm_disable;
+		goto err_disable_irq_wake;
 	}
 	afe_priv->pm_runtime_bypass_reg_ctl = false;
 
@@ -2971,6 +2976,10 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	return 0;
 
+err_disable_irq_wake:
+	disable_irq_wake(irq_id);
+err_free_irq:
+	devm_free_irq(dev, irq_id, afe);
 err_pm_disable:
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
@@ -2978,6 +2987,16 @@ err_pm_disable:
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
@@ -2996,6 +3015,7 @@ static struct platform_driver mt8186_afe_pcm_driver = {
 		   .pm = pm_ptr(&mt8186_afe_pm_ops),
 	},
 	.probe = mt8186_afe_pcm_dev_probe,
+	.remove = mt8186_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8186_afe_pcm_driver);

