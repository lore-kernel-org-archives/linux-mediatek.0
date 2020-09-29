Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 840D9C4346E
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 07:39:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C3EE2083B
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 07:39:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F34OICZY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JtxfRfZC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C3EE2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GMC+xkrz0WUoziztYjZ1s2SbID9UTnn5Fcwa8u6yo48=; b=F34OICZYA/4JOWcZj0LtrJ4Mp
	ECv1ihz5huzHL8cABLz8f/kH7/SB42OpAwyyPnoiHC5p4cpxdOL0D9Zo7B8focbmdGZiEFRz3mipb
	YPfRzJ6DzNGOef2UnuDeGfw1Kak5Dpgolaokgm0FQ82oAqmVBV75H7+jyYLm/Fw1mzLu7YkA8HoI4
	AHBJH/Y8+ePMw/DnDiLkudO7e321F+8jNo4e9zfuw7slHiiypY7neqzlGAIY+aQspzzEmmoNZz/Zt
	D9Hec57unJVboy8N9zfHLsLWaphaBSear2nY9X6PW/fuWGEIKBUliJ0sYoVF2R+A/NHhhX3N76SXq
	/IUS/3jOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNAEk-00037t-KI; Tue, 29 Sep 2020 07:39:46 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNADr-0002j3-FV
 for linux-mediatek@lists.infradead.org; Tue, 29 Sep 2020 07:38:58 +0000
Received: by mail-pf1-x442.google.com with SMTP id b124so3652112pfg.13
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Sep 2020 00:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+r3GF4m4YugxKvqRkeEORPE8tzc/vmAmjb3ldF1z+f4=;
 b=JtxfRfZCoc631J3QzxUjx4tE5DyJzN21HObAkaJYd4wrzRIqBXFDtvuODhfBDwkwZ0
 p5topaqX9fGfxHY+UgHltGgyZ53cXwrSvY7+pi1vMor1i1veQRdlPnSIz9tMgLAbdfyl
 Wks3teP5eZ2k0RkFBrzxXXh/TazUdXKvCRvHQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+r3GF4m4YugxKvqRkeEORPE8tzc/vmAmjb3ldF1z+f4=;
 b=iEpParuc48rFAgjYI28yOxR4nHL7yPJEChz4kIlXSsycrxqs2qkM1+tgMRmz3VyH6i
 9jcEWuT9QRwAEWDLw9Wjs4XCyBBFMHO77FOl0PB0C4plvhKPF48uqI+sI2G7WXHH4CXa
 KP3XQi+hpbsQTEI5C4MtVnfFpFwWOGnvaicvGmU8qlKn9lBbQ9hzjg9Tc6O8EY31YRfV
 U0c1J+pUS4U8ANRz0HF27LpisR1IHPR2zs2dRUvS78N+O6wR+Wfq2eXvJ7L5NC5Vr66B
 aDuK957jN+RVDaQTXI5CGvgqJHqDRQqgjQX9xO1ANxVU6nQjRrFFIjrxyPeUXlUT7WnA
 2LtQ==
X-Gm-Message-State: AOAM5325V5ilwYIV6doIKiZvMagnWAuza/0sPZYhznEcBVf0q6TavYe8
 NMQSl+wZEI+E+fSprXII0ngeYw==
X-Google-Smtp-Source: ABdhPJyloqcHPGpb8wGIRonsrVvNDR1Fti9p84W6aNSgDQau78lYJz5cH0Ahbvu0HvDaz77e72y6mw==
X-Received: by 2002:aa7:97a8:0:b029:13e:d13d:a105 with SMTP id
 d8-20020aa797a80000b029013ed13da105mr2970507pfq.33.1601365129442; 
 Tue, 29 Sep 2020 00:38:49 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id e13sm3737317pjy.38.2020.09.29.00.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 00:38:49 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v4 4/4] spi: spi-mtk-nor: Add power management support
Date: Tue, 29 Sep 2020 15:37:55 +0800
Message-Id: <20200929153320.v4.4.I68983b582d949a91866163bab588ff3c2a0d0275@changeid>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
In-Reply-To: <20200929073755.3741416-1-ikjn@chromium.org>
References: <20200929073755.3741416-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_033851_834835_F37FDD05 
X-CRM114-Status: GOOD (  20.12  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds dev_pm_ops to mtk-nor to support suspend/resume,
auto suspend delay is set to -1 by default.

Accessing registers are only permitted after its clock is enabled
to deal with unknown state of operating clk at probe time,

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---
Changes in v4:
- No changes

Changes in v3:
- Remove unrelated changes of dma_set_mask_coherent()

 drivers/spi/spi-mtk-nor.c | 98 ++++++++++++++++++++++++++++++---------
 1 file changed, 76 insertions(+), 22 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index eac613b3930d..6179eb163cd6 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
 #include <linux/string.h>
@@ -548,22 +549,15 @@ static int mtk_nor_enable_clk(struct mtk_nor *sp)
 	return 0;
 }
 
-static int mtk_nor_init(struct mtk_nor *sp)
+static void mtk_nor_init(struct mtk_nor *sp)
 {
-	int ret;
-
-	ret = mtk_nor_enable_clk(sp);
-	if (ret)
-		return ret;
-
-	sp->spi_freq = clk_get_rate(sp->spi_clk);
+	writel(0, sp->base + MTK_NOR_REG_IRQ_EN);
+	writel(MTK_NOR_IRQ_MASK, sp->base + MTK_NOR_REG_IRQ_STAT);
 
 	writel(MTK_NOR_ENABLE_SF_CMD, sp->base + MTK_NOR_REG_WP);
 	mtk_nor_rmw(sp, MTK_NOR_REG_CFG2, MTK_NOR_WR_CUSTOM_OP_EN, 0);
 	mtk_nor_rmw(sp, MTK_NOR_REG_CFG3,
 		    MTK_NOR_DISABLE_WREN | MTK_NOR_DISABLE_SR_POLL, 0);
-
-	return ret;
 }
 
 static irqreturn_t mtk_nor_irq_handler(int irq, void *data)
@@ -646,6 +640,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	ctlr->num_chipselect = 1;
 	ctlr->setup = mtk_nor_setup;
 	ctlr->transfer_one_message = mtk_nor_transfer_one_message;
+	ctlr->auto_runtime_pm = true;
 
 	dev_set_drvdata(&pdev->dev, ctlr);
 
@@ -669,12 +664,19 @@ static int mtk_nor_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	ret = mtk_nor_enable_clk(sp);
+	if (ret < 0)
+		return ret;
+
+	sp->spi_freq = clk_get_rate(sp->spi_clk);
+
+	mtk_nor_init(sp);
+
 	irq = platform_get_irq_optional(pdev, 0);
+
 	if (irq < 0) {
 		dev_warn(sp->dev, "IRQ not available.");
 	} else {
-		writel(MTK_NOR_IRQ_MASK, base + MTK_NOR_REG_IRQ_STAT);
-		writel(0, base + MTK_NOR_REG_IRQ_EN);
 		ret = devm_request_irq(sp->dev, irq, mtk_nor_irq_handler, 0,
 				       pdev->name, sp);
 		if (ret < 0) {
@@ -685,34 +687,86 @@ static int mtk_nor_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = mtk_nor_init(sp);
-	if (ret < 0) {
-		kfree(ctlr);
-		return ret;
-	}
+	pm_runtime_set_autosuspend_delay(&pdev->dev, -1);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_get_noresume(&pdev->dev);
+
+	ret = devm_spi_register_controller(&pdev->dev, ctlr);
+	if (ret < 0)
+		goto err_probe;
+
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
 
 	dev_info(&pdev->dev, "spi frequency: %d Hz\n", sp->spi_freq);
 
-	return devm_spi_register_controller(&pdev->dev, ctlr);
+	return 0;
+
+err_probe:
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+
+	mtk_nor_disable_clk(sp);
+
+	return ret;
 }
 
 static int mtk_nor_remove(struct platform_device *pdev)
 {
-	struct spi_controller *ctlr;
-	struct mtk_nor *sp;
+	struct spi_controller *ctlr = dev_get_drvdata(&pdev->dev);
+	struct mtk_nor *sp = spi_controller_get_devdata(ctlr);
 
-	ctlr = dev_get_drvdata(&pdev->dev);
-	sp = spi_controller_get_devdata(ctlr);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
+
+	mtk_nor_disable_clk(sp);
+
+	return 0;
+}
+
+static int __maybe_unused mtk_nor_runtime_suspend(struct device *dev)
+{
+	struct spi_controller *ctlr = dev_get_drvdata(dev);
+	struct mtk_nor *sp = spi_controller_get_devdata(ctlr);
 
 	mtk_nor_disable_clk(sp);
 
 	return 0;
 }
 
+static int __maybe_unused mtk_nor_runtime_resume(struct device *dev)
+{
+	struct spi_controller *ctlr = dev_get_drvdata(dev);
+	struct mtk_nor *sp = spi_controller_get_devdata(ctlr);
+
+	return mtk_nor_enable_clk(sp);
+}
+
+static int __maybe_unused mtk_nor_suspend(struct device *dev)
+{
+	return pm_runtime_force_suspend(dev);
+}
+
+static int __maybe_unused mtk_nor_resume(struct device *dev)
+{
+	return pm_runtime_force_resume(dev);
+}
+
+static const struct dev_pm_ops mtk_nor_pm_ops = {
+	SET_RUNTIME_PM_OPS(mtk_nor_runtime_suspend,
+			   mtk_nor_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(mtk_nor_suspend, mtk_nor_resume)
+};
+
 static struct platform_driver mtk_nor_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = mtk_nor_match,
+		.pm = &mtk_nor_pm_ops,
 	},
 	.probe = mtk_nor_probe,
 	.remove = mtk_nor_remove,
-- 
2.28.0.709.gb0816b6eb0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
