Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7B6CC6B38
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2026 03:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FiSWddY//7cIxkgjPTVJ04fT7tu3WDIsuOMUv0HXBC4=; b=sE97hpIU7F30IwNxxJ/7ZV36Wu
	t/RiFS8Y6mI/Mgj4gi9FntEjA9DosyCURuJDSAeTc/z1/MSv884PlhdKzXCr7eZh+m4D2mZijFdfQ
	TOaxm/Zjuug/ph/QPLMxSMY3iPG25NNi+wiXTW6pMWf+YeCbYSsINyP2GJm863+Zocx8Bq4MZg7iV
	6climsxeqjFsjAmoTVuMEWWj7ay4Zeepu7NOhKiX5Gjmyzu9XaqfMTmFX5qjSv7hs5pi8Tx3Np5Qy
	7qQ+sDpkG0kqDpDJBCytY3BYjSGkccH9sf8lUiYm/JEjpjMNhXOZoOWLuIy8mLJaq7H5KNBbWhfLp
	0B6aeNFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYoP-00000001rwh-10a2;
	Fri, 16 Oct 2026 03:40:53 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYoM-00000001rvz-2mOm
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Oct 2026 03:40:51 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-9178510f3bdso76240026d6.2
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Oct 2026 20:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122049; x=1792726849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiSWddY//7cIxkgjPTVJ04fT7tu3WDIsuOMUv0HXBC4=;
        b=oFc2FbsPE4638AnYx5IfOozy/lsOpXrW5q39plFj+ooMNHp9sIP7MlICyFv7LnSdC3
         cNOIUd/aEU/vDOhYPK8FH0oHdkS1Lf5Hr/rZ+Q63AYxwiHFitsyebeKrBLNAzkXrPRBV
         Jn/6Esixb22Zuv9KF+L4iK7Uf+pQ53Y1uGpK22kExzDyaLsShNiakX4tEYL0nImqbfhO
         1wy515KWU80+0uCe8Va8pKGWXicAjzNJdL6w/uLV4tI9Uz7OrVq7e9T2/mXtVMTzP4ii
         XTyIiro78sYSSC0js0JBnu5QcPxHNAj/XZ1sZo0rHnuHZ1SzNgmrjOaqBVWMr5w+KQ47
         1aTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122049; x=1792726849;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FiSWddY//7cIxkgjPTVJ04fT7tu3WDIsuOMUv0HXBC4=;
        b=dryoEH9UcW+2rMYmEalixhebJ0FqD2CrSjrgWN1BYu3Gf1EnI5US9H5PJtRcJ52+qS
         eRHgIehG04LdU3b2k5bJrtYs2qE1cq3Y5yL2CYOngrcCtVYqb9sNpuuARBsLC3V/i6FN
         vzcN4gWxtwupeTEuSjfMKgFw0qa6opv1Dx2wTyZg2Q5eGv6C1LJqLtBIMc+rgj5k+r2s
         U0OnHnaEnwhK0aaWB1Mnj/An8qn+SxNK4GgK3WBvPbkriVWLzYZ6hKrr87duxww35p0s
         UXAeCoscQHxhLE0UtZ226EQOla+u0xtUJLILwUYYXxV8+GhTN9X8i+uISntDGSWcT0+P
         NvpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwS8G/t7206sFJbpyUkZQnSlnit3qpbRf6PaLgVqURBOYC7Li09gNZdwtnfcFBzV8BVy6IZD6cHYO2Sa3V0kw==@lists.infradead.org
X-Gm-Message-State: AFq9FYL8My0EPEGO9crTcbMyPDpiWsc7UpD7m3FjNua70/EGyJH8981f
	iWerGsM+8i8YM+vSukEJUHmqGj06aDLUW7+XmwH4sCY85JS5+vvYHUc=
X-Gm-Gg: AYBFou2y9FT1PSKpAdeT0EVuo3c3w2/Wolr9CbfPH5smxAic+mZJIOQOzBN5K8FPD0g
	/Soc1KiwWPl8XnsRnsFEFCV9ZPN5CHcXwQNcNGT7HbHzY43oEKORSy72KMt6SW8mv8vIMkizcZm
	UBor5Qqj6V4iK2Y5vvO/hU0ujho1/QztoJ0EYARx4+Bt5FfFf2/Oh20RI5KiKkJIyJCQJEw249b
	g6oVLVJhlMTa67tIBtZhKVZotw7nx2e6QQlAts/jktTGEBCcg1W1q1eIK88Od2BTSg6CXkmo7Fr
	65RvfzELw7FMwWR45Rn/QOUP4O5icw0WdWmdmQiR/4YEIaoCAZI0aQNahg4Q+Vedhu0WKaBFiKg
	xJ3jApbUp1bq69qNonZnESFC0AdJsZ+osuQ4Cc+mM4gJI+HBNFvYiSKcLj2VEP8buML89f7Oskz
	2gJyp3JnyzsUJteGxBFxaRb8AL9XIz+zBrIwR7vzyJwjU0DCcSaDhTmMB9bWYSURTCMMG4cdVQe
	s7/wcpHagOXOY0xeq48XeRKuB5YkHgFwklMPhLcMJH/C7bucKskXnzBYfYTWeO9GPlV0X+itQe6
	vJAQEMWDNLphGLY0/Pic5UA8/aGs
X-Received: by 2002:a05:622a:558c:b0:535:232f:ca21 with SMTP id d75a77b69052e-5359f486ebemr346542441cf.11.1792122048786;
        Thu, 15 Oct 2026 20:40:48 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a9dbdb5sm11198881cf.22.2026.10.15.20.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:40:47 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] ASoC: mediatek: mt2701: join the IRQ before managed cleanup
Date: Thu, 15 Oct 2026 23:40:45 -0400
Message-ID: <gm-top10-20261015191529-g154-c729db287fde@mhun512.gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_204050_727939_46BFC56A 
X-CRM114-Status: GOOD (  19.90  )
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

The IRQ is published before the handler's arrays, regmap and clock state
are ready. Remove drops the PM reference before managed IRQ release, so
a handler may also overlap clock shutdown or subsequent resource
cleanup.

Initialize the dependencies and acquire the PM reference before
requesting the IRQ. Register a PM cleanup action before the IRQ
resource, and a final IRQ-disable action after component registration.
Reverse release then joins the IRQ, removes the components, frees the
IRQ and drops PM before releasing the backing arrays.

Disable and join the IRQ explicitly when component registration fails.
Use pm_runtime_resume_and_get() so a failed resume does not retain a new
usage reference. If manual clock resume succeeded while runtime PM
stayed disabled, unwind those clocks if the later PM get fails.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 43a6a7e71063 ("ASoC: mediatek: add mt2701 platform driver implementation.")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
The final devres action disables the IRQ rather than looking up and
freeing another managed resource during devres release. Independent
PCM/card lifetime and system-suspend clock ordering are outside this
change.

Compiled with Clang 22.1.2 and W=1 in the accompanying validation
bundle. The prior G154 diff received independent source review. The
revised manual-resume failure cleanup received coordinator
counterexample review. No runtime reproducer, hardware test or
full-kernel link was performed.

Base: 0fcb05b72344f40806cbe810de8872f1698bf053

 sound/soc/mediatek/mt2701/mt2701-afe-common.h |  1 +
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c    | 65 ++++++++++++-------
 2 files changed, 44 insertions(+), 22 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-common.h b/sound/soc/mediatek/mt2701/mt2701-afe-common.h
index c9477bc24ee9..c7ffae5b6fb0 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-common.h
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-common.h
@@ -89,6 +89,7 @@ struct mt2701_soc_variants {
 };
 
 struct mt2701_afe_private {
+	int irq_id;
 	struct clk *base_ck[MT2701_BASE_CLK_NUM];
 	struct clk *mrgif_ck;
 	struct clk *hadds2pll_ck;
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index d56b498e8c0c..ef051157a0c7 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -1591,12 +1591,31 @@ static int mt2701_afe_runtime_resume(struct device *dev)
 	return mt2701_afe_enable_clock(afe);
 }
 
+static void mt2701_afe_pm_disable(void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		mt2701_afe_runtime_suspend(dev);
+}
+
+static void mt2701_afe_irq_disable(void *data)
+{
+	struct mtk_base_afe *afe = data;
+	struct mt2701_afe_private *afe_priv = afe->platform_priv;
+
+	disable_irq(afe_priv->irq_id);
+}
+
 static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 {
 	const struct mt2701_soc_variants *soc;
 	struct mtk_base_afe *afe;
 	struct mt2701_afe_private *afe_priv;
 	struct device *dev;
+	bool manual_resume = false;
 	int i, irq_id, ret;
 
 	afe = devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
@@ -1619,13 +1638,7 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 	irq_id = platform_get_irq_byname(pdev, "asys");
 	if (irq_id < 0)
 		return irq_id;
-
-	ret = devm_request_irq(dev, irq_id, mt2701_asys_isr,
-			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
-		return ret;
-	}
+	afe_priv->irq_id = irq_id;
 
 	afe->regmap = syscon_node_to_regmap(dev->parent->of_node);
 	if (IS_ERR(afe->regmap)) {
@@ -1687,14 +1700,27 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 		ret = mt2701_afe_runtime_resume(dev);
 		if (ret)
 			goto err_pm_disable;
+		manual_resume = true;
 	}
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		goto err_pm_disable;
+
+	/* Keep the AFE powered until the components and IRQ are released. */
+	ret = devm_add_action_or_reset(dev, mt2701_afe_pm_disable, dev);
+	if (ret)
+		return ret;
+
+	ret = devm_request_irq(dev, irq_id, mt2701_asys_isr,
+			       IRQF_TRIGGER_NONE, "asys-isr", afe);
+	if (ret)
+		return ret;
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &mtk_afe_pcm_platform,
 					      NULL, 0);
 	if (ret) {
 		dev_warn(dev, "err_platform\n");
-		goto err_platform;
+		goto err_irq_disable;
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
@@ -1703,27 +1729,23 @@ static int mt2701_afe_pcm_dev_probe(struct platform_device *pdev)
 					 ARRAY_SIZE(mt2701_afe_pcm_dais));
 	if (ret) {
 		dev_warn(dev, "err_dai_component\n");
-		goto err_platform;
+		goto err_irq_disable;
 	}
 
-	return 0;
+	/* Drain the IRQ before releasing the managed components. */
+	return devm_add_action_or_reset(dev, mt2701_afe_irq_disable, afe);
 
-err_platform:
-	pm_runtime_put_sync(dev);
+err_irq_disable:
+	disable_irq(irq_id);
+	return ret;
 err_pm_disable:
 	pm_runtime_disable(dev);
+	if (manual_resume)
+		mt2701_afe_runtime_suspend(dev);
 
 	return ret;
 }
 
-static void mt2701_afe_pcm_dev_remove(struct platform_device *pdev)
-{
-	pm_runtime_put_sync(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		mt2701_afe_runtime_suspend(&pdev->dev);
-}
-
 static const struct mt2701_soc_variants mt2701_soc_v1 = {
 	.i2s_num = 4,
 };
@@ -1752,7 +1774,6 @@ static struct platform_driver mt2701_afe_pcm_driver = {
 		   .pm = pm_ptr(&mt2701_afe_pm_ops),
 	},
 	.probe = mt2701_afe_pcm_dev_probe,
-	.remove = mt2701_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt2701_afe_pcm_driver);

