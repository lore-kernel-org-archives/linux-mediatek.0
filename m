Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23531C27C40
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Aug 2023 10:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7ehnQUGg3AKORpAuWZQKuhgBidrmQAa7Q4v6MvPOrg=; b=pRYneBGZ/p1dsc
	vYuSm7dHsq0S8Wvvk9fDJyIDqpw5z9qkOJrsM5lnXzsFywpFoCkcPG4DVUx6J+bDxZadpxgec3TzL
	pviUT7froYv88DsAoJX2GQ2nfOYcad4lsV2sD0Nt8fHe04ksel5F3Y/LKyZbfNd29oO1zehdnafkJ
	DBx0vaa8ELNYZBxJ+2g2bEjtcypfqJNaa8dEcwfWvi+WOLQi1U0BSdymNNZbcx548UIGSgnGKn5Fg
	4GSyT7ipKdiiCHhwm9AjyhiMhfInaIiFKmhcXoaD0v1X+2gWzWVheVUyfJEE00uuFQhYZ4nd47SAB
	dgmJatTzQiPQPx1giUtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ7n1-002tpw-0T;
	Thu, 24 Aug 2023 10:42:11 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ7mp-002tj4-3A
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Aug 2023 10:42:03 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1bf7a6509deso28890405ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Aug 2023 03:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692873717; x=1693478517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a7ehnQUGg3AKORpAuWZQKuhgBidrmQAa7Q4v6MvPOrg=;
        b=GGkazUlFNAPtpUy021BsGhwjV4kl0TZaOHnxO5hTMMZ7jN4oxl/ZGX63JCXaCN3kRI
         wqujm3hGuqh7Pv17N2fF7meF3cBy8afMW/3OTTCiSQ1LCkwQ9Xgwd5vqoK2MbZNC9ipN
         3zymGy8wrhUon01M1eAueKxCbnxFh+xguSlWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692873717; x=1693478517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7ehnQUGg3AKORpAuWZQKuhgBidrmQAa7Q4v6MvPOrg=;
        b=W1uilVI2i3qZEMdlkbmcTqzWSZvNEZBTGiT1miNgiR7AY9g50LJ3vmy3zcvRkEskA/
         21i/x2/IXxCFVqxmgjIJKumgOS4MDKX9dLsKHQuAEmjw9oygLoRUVHiNxq6wkbAXEkOA
         +udUlGX5Ftk8kGFgWDqR0CSw/k28Szus7CBvJzCvFsdNgkTAI0HroqR53J4FJrdW5Cwj
         s7DIbNNoM3X313vz/lRBew9x/dZOwr+P7f3eywnYVsq7DDrl8Yu/J3jthLfK+EVkFQ55
         CtLOtwAkywtdCKm1CChjzRANbAuRgmTv5dxoP1czBK9sacSDI8JC89KA2KVhXYRjyQIq
         UhZQ==
X-Gm-Message-State: AOJu0Ywn8G157WhlK9LNjgnHFZJGA6GigqrLg3mYC2NBOcIDddt3+S9J
	yNy0N9vaCio9SJYc0tfswu45Lg==
X-Google-Smtp-Source: AGHT+IHVMrdwEtZBx83tpEboYUtEK7EO5abihTGfCj+KqNS/3F8eD0JIrOXuuysFoORhdmvs9PS0PA==
X-Received: by 2002:a17:902:d511:b0:1bc:5e50:9345 with SMTP id b17-20020a170902d51100b001bc5e509345mr14923808plg.50.1692873717041;
        Thu, 24 Aug 2023 03:41:57 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ed6d:42e3:a23:8316])
        by smtp.gmail.com with ESMTPSA id q2-20020a170902dac200b001b5247cac3dsm12524645plx.110.2023.08.24.03.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Aug 2023 03:41:56 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH 2/5] spmi: Use devm_spmi_controller_alloc()
Date: Thu, 24 Aug 2023 18:40:09 +0800
Message-ID: <20230824104101.4083400-3-fshao@chromium.org>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
In-Reply-To: <20230824104101.4083400-1-fshao@chromium.org>
References: <20230824104101.4083400-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_034200_033538_630970A4 
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
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Convert to the device-managed version of spmi_controller_alloc() and
simplify the excess error handling code.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/spmi/hisi-spmi-controller.c | 22 +++-----
 drivers/spmi/spmi-mtk-pmif.c        | 26 +++------
 drivers/spmi/spmi-pmic-arb.c        | 87 ++++++++++-------------------
 3 files changed, 46 insertions(+), 89 deletions(-)

diff --git a/drivers/spmi/hisi-spmi-controller.c b/drivers/spmi/hisi-spmi-controller.c
index 9cbd473487cb..a5525902656a 100644
--- a/drivers/spmi/hisi-spmi-controller.c
+++ b/drivers/spmi/hisi-spmi-controller.c
@@ -267,10 +267,10 @@ static int spmi_controller_probe(struct platform_device *pdev)
 	struct resource *iores;
 	int ret;
 
-	ctrl = spmi_controller_alloc(&pdev->dev, sizeof(*spmi_controller));
-	if (!ctrl) {
+	ctrl = devm_spmi_controller_alloc(&pdev->dev, sizeof(*spmi_controller));
+	if (IS_ERR(ctrl)) {
 		dev_err(&pdev->dev, "can not allocate spmi_controller data\n");
-		return -ENOMEM;
+		return PTR_ERR(ctrl);
 	}
 	spmi_controller = spmi_controller_get_drvdata(ctrl);
 	spmi_controller->controller = ctrl;
@@ -278,24 +278,21 @@ static int spmi_controller_probe(struct platform_device *pdev)
 	iores = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!iores) {
 		dev_err(&pdev->dev, "can not get resource!\n");
-		ret = -EINVAL;
-		goto err_put_controller;
+		return -EINVAL;
 	}
 
 	spmi_controller->base = devm_ioremap(&pdev->dev, iores->start,
 					     resource_size(iores));
 	if (!spmi_controller->base) {
 		dev_err(&pdev->dev, "can not remap base addr!\n");
-		ret = -EADDRNOTAVAIL;
-		goto err_put_controller;
+		return -EADDRNOTAVAIL;
 	}
 
 	ret = of_property_read_u32(pdev->dev.of_node, "hisilicon,spmi-channel",
 				   &spmi_controller->channel);
 	if (ret) {
 		dev_err(&pdev->dev, "can not get channel\n");
-		ret = -ENODEV;
-		goto err_put_controller;
+		return -ENODEV;
 	}
 
 	platform_set_drvdata(pdev, spmi_controller);
@@ -314,14 +311,10 @@ static int spmi_controller_probe(struct platform_device *pdev)
 	ret = spmi_controller_add(ctrl);
 	if (ret) {
 		dev_err(&pdev->dev, "spmi_controller_add failed with error %d!\n", ret);
-		goto err_put_controller;
+		return ret;
 	}
 
 	return 0;
-
-err_put_controller:
-	spmi_controller_put(ctrl);
-	return ret;
 }
 
 static void spmi_del_controller(struct platform_device *pdev)
@@ -329,7 +322,6 @@ static void spmi_del_controller(struct platform_device *pdev)
 	struct spmi_controller *ctrl = platform_get_drvdata(pdev);
 
 	spmi_controller_remove(ctrl);
-	spmi_controller_put(ctrl);
 }
 
 static const struct of_device_id spmi_controller_match_table[] = {
diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index 74b73f9bc222..eb909a6e3b9e 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -437,29 +437,24 @@ static int mtk_spmi_probe(struct platform_device *pdev)
 	int err, i;
 	u32 chan_offset;
 
-	ctrl = spmi_controller_alloc(&pdev->dev, sizeof(*arb));
-	if (!ctrl)
-		return -ENOMEM;
+	ctrl = devm_spmi_controller_alloc(&pdev->dev, sizeof(*arb));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
 
 	arb = spmi_controller_get_drvdata(ctrl);
 	arb->data = device_get_match_data(&pdev->dev);
 	if (!arb->data) {
-		err = -EINVAL;
 		dev_err(&pdev->dev, "Cannot get drv_data\n");
-		goto err_put_ctrl;
+		return -EINVAL;
 	}
 
 	arb->base = devm_platform_ioremap_resource_byname(pdev, "pmif");
-	if (IS_ERR(arb->base)) {
-		err = PTR_ERR(arb->base);
-		goto err_put_ctrl;
-	}
+	if (IS_ERR(arb->base))
+		return PTR_ERR(arb->base);
 
 	arb->spmimst_base = devm_platform_ioremap_resource_byname(pdev, "spmimst");
-	if (IS_ERR(arb->spmimst_base)) {
-		err = PTR_ERR(arb->spmimst_base);
-		goto err_put_ctrl;
-	}
+	if (IS_ERR(arb->spmimst_base))
+		return PTR_ERR(arb->spmimst_base);
 
 	arb->nclks = ARRAY_SIZE(pmif_clock_names);
 	for (i = 0; i < arb->nclks; i++)
@@ -468,7 +463,7 @@ static int mtk_spmi_probe(struct platform_device *pdev)
 	err = clk_bulk_get(&pdev->dev, arb->nclks, arb->clks);
 	if (err) {
 		dev_err(&pdev->dev, "Failed to get clocks: %d\n", err);
-		goto err_put_ctrl;
+		return err;
 	}
 
 	err = clk_bulk_prepare_enable(arb->nclks, arb->clks);
@@ -500,8 +495,6 @@ static int mtk_spmi_probe(struct platform_device *pdev)
 	clk_bulk_disable_unprepare(arb->nclks, arb->clks);
 err_put_clks:
 	clk_bulk_put(arb->nclks, arb->clks);
-err_put_ctrl:
-	spmi_controller_put(ctrl);
 	return err;
 }
 
@@ -513,7 +506,6 @@ static void mtk_spmi_remove(struct platform_device *pdev)
 	clk_bulk_disable_unprepare(arb->nclks, arb->clks);
 	clk_bulk_put(arb->nclks, arb->clks);
 	spmi_controller_remove(ctrl);
-	spmi_controller_put(ctrl);
 }
 
 static const struct of_device_id mtk_spmi_match_table[] = {
diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index dcb675d980d4..9ed1180fe31f 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -1443,9 +1443,9 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 	u32 channel, ee, hw_ver;
 	int err;
 
-	ctrl = spmi_controller_alloc(&pdev->dev, sizeof(*pmic_arb));
-	if (!ctrl)
-		return -ENOMEM;
+	ctrl = devm_spmi_controller_alloc(&pdev->dev, sizeof(*pmic_arb));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
 
 	pmic_arb = spmi_controller_get_drvdata(ctrl);
 	pmic_arb->spmic = ctrl;
@@ -1462,20 +1462,16 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 	 */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
 	core = devm_ioremap(&ctrl->dev, res->start, resource_size(res));
-	if (IS_ERR(core)) {
-		err = PTR_ERR(core);
-		goto err_put_ctrl;
-	}
+	if (IS_ERR(core))
+		return PTR_ERR(core);
 
 	pmic_arb->core_size = resource_size(res);
 
 	pmic_arb->ppid_to_apid = devm_kcalloc(&ctrl->dev, PMIC_ARB_MAX_PPID,
 					      sizeof(*pmic_arb->ppid_to_apid),
 					      GFP_KERNEL);
-	if (!pmic_arb->ppid_to_apid) {
-		err = -ENOMEM;
-		goto err_put_ctrl;
-	}
+	if (!pmic_arb->ppid_to_apid)
+		return -ENOMEM;
 
 	hw_ver = readl_relaxed(core + PMIC_ARB_VERSION);
 
@@ -1499,19 +1495,15 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 						   "obsrvr");
 		pmic_arb->rd_base = devm_ioremap(&ctrl->dev, res->start,
 						 resource_size(res));
-		if (IS_ERR(pmic_arb->rd_base)) {
-			err = PTR_ERR(pmic_arb->rd_base);
-			goto err_put_ctrl;
-		}
+		if (IS_ERR(pmic_arb->rd_base))
+			return PTR_ERR(pmic_arb->rd_base);
 
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 						   "chnls");
 		pmic_arb->wr_base = devm_ioremap(&ctrl->dev, res->start,
 						 resource_size(res));
-		if (IS_ERR(pmic_arb->wr_base)) {
-			err = PTR_ERR(pmic_arb->wr_base);
-			goto err_put_ctrl;
-		}
+		if (IS_ERR(pmic_arb->wr_base))
+			return PTR_ERR(pmic_arb->wr_base);
 	}
 
 	pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
@@ -1522,10 +1514,9 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 		of_property_read_u32(pdev->dev.of_node, "qcom,bus-id",
 					&pmic_arb->bus_instance);
 		if (pmic_arb->bus_instance > 1) {
-			err = -EINVAL;
 			dev_err(&pdev->dev, "invalid bus instance (%u) specified\n",
 				pmic_arb->bus_instance);
-			goto err_put_ctrl;
+			return -EINVAL;
 		}
 
 		if (pmic_arb->bus_instance == 0) {
@@ -1543,10 +1534,9 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 		}
 
 		if (pmic_arb->base_apid + pmic_arb->apid_count > pmic_arb->max_periphs) {
-			err = -EINVAL;
 			dev_err(&pdev->dev, "Unsupported APID count %d detected\n",
 				pmic_arb->base_apid + pmic_arb->apid_count);
-			goto err_put_ctrl;
+			return -EINVAL;
 		}
 	} else if (hw_ver >= PMIC_ARB_VERSION_V5_MIN) {
 		pmic_arb->base_apid = 0;
@@ -1554,55 +1544,45 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 					PMIC_ARB_FEATURES_PERIPH_MASK;
 
 		if (pmic_arb->apid_count > pmic_arb->max_periphs) {
-			err = -EINVAL;
 			dev_err(&pdev->dev, "Unsupported APID count %d detected\n",
 				pmic_arb->apid_count);
-			goto err_put_ctrl;
+			return -EINVAL;
 		}
 	}
 
 	pmic_arb->apid_data = devm_kcalloc(&ctrl->dev, pmic_arb->max_periphs,
 					   sizeof(*pmic_arb->apid_data),
 					   GFP_KERNEL);
-	if (!pmic_arb->apid_data) {
-		err = -ENOMEM;
-		goto err_put_ctrl;
-	}
+	if (!pmic_arb->apid_data)
+		return -ENOMEM;
 
 	dev_info(&ctrl->dev, "PMIC arbiter version %s (0x%x)\n",
 		 pmic_arb->ver_ops->ver_str, hw_ver);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "intr");
 	pmic_arb->intr = devm_ioremap_resource(&ctrl->dev, res);
-	if (IS_ERR(pmic_arb->intr)) {
-		err = PTR_ERR(pmic_arb->intr);
-		goto err_put_ctrl;
-	}
+	if (IS_ERR(pmic_arb->intr))
+		return PTR_ERR(pmic_arb->intr);
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cnfg");
 	pmic_arb->cnfg = devm_ioremap_resource(&ctrl->dev, res);
-	if (IS_ERR(pmic_arb->cnfg)) {
-		err = PTR_ERR(pmic_arb->cnfg);
-		goto err_put_ctrl;
-	}
+	if (IS_ERR(pmic_arb->cnfg))
+		return PTR_ERR(pmic_arb->cnfg);
 
 	pmic_arb->irq = platform_get_irq_byname(pdev, "periph_irq");
-	if (pmic_arb->irq < 0) {
-		err = pmic_arb->irq;
-		goto err_put_ctrl;
-	}
+	if (pmic_arb->irq < 0)
+		return pmic_arb->irq;
 
 	err = of_property_read_u32(pdev->dev.of_node, "qcom,channel", &channel);
 	if (err) {
 		dev_err(&pdev->dev, "channel unspecified.\n");
-		goto err_put_ctrl;
+		return err;
 	}
 
 	if (channel > 5) {
 		dev_err(&pdev->dev, "invalid channel (%u) specified.\n",
 			channel);
-		err = -EINVAL;
-		goto err_put_ctrl;
+		return -EINVAL;
 	}
 
 	pmic_arb->channel = channel;
@@ -1610,22 +1590,19 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 	err = of_property_read_u32(pdev->dev.of_node, "qcom,ee", &ee);
 	if (err) {
 		dev_err(&pdev->dev, "EE unspecified.\n");
-		goto err_put_ctrl;
+		return err;
 	}
 
 	if (ee > 5) {
 		dev_err(&pdev->dev, "invalid EE (%u) specified\n", ee);
-		err = -EINVAL;
-		goto err_put_ctrl;
+		return -EINVAL;
 	}
 
 	pmic_arb->ee = ee;
 	mapping_table = devm_kcalloc(&ctrl->dev, pmic_arb->max_periphs,
 					sizeof(*mapping_table), GFP_KERNEL);
-	if (!mapping_table) {
-		err = -ENOMEM;
-		goto err_put_ctrl;
-	}
+	if (!mapping_table)
+		return -ENOMEM;
 
 	pmic_arb->mapping_table = mapping_table;
 	/* Initialize max_apid/min_apid to the opposite bounds, during
@@ -1645,7 +1622,7 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 		if (err) {
 			dev_err(&pdev->dev, "could not read APID->PPID mapping table, rc= %d\n",
 				err);
-			goto err_put_ctrl;
+			return err;
 		}
 	}
 
@@ -1654,8 +1631,7 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 					 &pmic_arb_irq_domain_ops, pmic_arb);
 	if (!pmic_arb->domain) {
 		dev_err(&pdev->dev, "unable to create irq_domain\n");
-		err = -ENOMEM;
-		goto err_put_ctrl;
+		return -ENOMEM;
 	}
 
 	irq_set_chained_handler_and_data(pmic_arb->irq, pmic_arb_chained_irq,
@@ -1669,8 +1645,6 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 err_domain_remove:
 	irq_set_chained_handler_and_data(pmic_arb->irq, NULL, NULL);
 	irq_domain_remove(pmic_arb->domain);
-err_put_ctrl:
-	spmi_controller_put(ctrl);
 	return err;
 }
 
@@ -1681,7 +1655,6 @@ static void spmi_pmic_arb_remove(struct platform_device *pdev)
 	spmi_controller_remove(ctrl);
 	irq_set_chained_handler_and_data(pmic_arb->irq, NULL, NULL);
 	irq_domain_remove(pmic_arb->domain);
-	spmi_controller_put(ctrl);
 }
 
 static const struct of_device_id spmi_pmic_arb_match_table[] = {
-- 
2.42.0.rc1.204.g551eb34607-goog


