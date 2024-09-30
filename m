Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F67CEB2CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 22:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skvYEbeiJmt7JWU7QhjcNmw9hjLxF9pjRq94Mk/8yjI=; b=r5kNplYCrhlIyc2A4ZQ/KNSiMb
	wakajYgFk3t/3ZZkchWdLWV4KOcRyGCdESwwjYZNUgWnGe3cSqYrgcgWyhNqRbS0ipULVnTS6T5xE
	gyUj6ImAe/At/VG2K4mwBV+hPZz/BGjfDr+kvmzVFn2eYMmN5TzP9L8bttyBcoAZ7mW15FyZo1YhE
	iijUoD2X6iDoC2BqD3+OzOJZEgu79J7PQoXyXspX8U44eCyB1ZGFRRIxSv3nHdQd8jcTRZMLncwjv
	JoiiIrMxV1R9ZNgQ6DIVRrmPrFDcqy/zb0UR0vJMNxcGjT/VQ432mx7Yjyn1H0ezMVMoufW/NaiPw
	vCtIPhsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svPJA-000000014Wu-3vNl;
	Mon, 30 Sep 2024 22:56:00 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svPCm-000000013jm-1LT9;
	Mon, 30 Sep 2024 22:49:25 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7e6cbf6cd1dso3311020a12.3;
        Mon, 30 Sep 2024 15:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727736563; x=1728341363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skvYEbeiJmt7JWU7QhjcNmw9hjLxF9pjRq94Mk/8yjI=;
        b=nmpmXvDMAbJBCvtXbNtCd9pHwZYZFJIhH68T0yCzaJS4rth9DubCL+JPU6vzbQpa+4
         axpcLfV92gFzGPoO/JstWdTfVT2l/BXeoQU55XACS5iTrGtgePz9qo++84j9+b+FOL4T
         XYV2MEEnHHVA7JaSQgyU9EaoDfxCy2ImIRTQfjVZ8BLdWpCfMY97EZ2T8ZOuSDqk7jNe
         dloQD2qZ2EPMcq5e4kS47O7hxdNen+rFaJ79/b8SPk3fj6j34al6U5kBFq4WCAG5Y7MZ
         x7ZwJV99fxI3JuzEf9Dh/1SrM8sUORa7HHYvUscZS+T4Hd4gQBwAF+bTg6DA2ENccmGc
         7+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727736563; x=1728341363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skvYEbeiJmt7JWU7QhjcNmw9hjLxF9pjRq94Mk/8yjI=;
        b=wsuREOTrzGBhq0GTyR2OuOgOYe21AI9S8dWeroX3XY00mDI17IEYOBTGuNgS0hEbE+
         jsgDA2Fuf8m/3MEWAuZDwuMRYWYVgzU12Zn/LBvTGMuuoOT3GDg0YwYvhtBjBf9kPX2l
         oEKd+7EHhWudnMcsplnkLs9GUNNebRCm9tRk8vQ4ITO1NMz6oF6siOakzxFE2FwOf8ni
         t/Z2oxClukBgaj5sfL13DxCdnri7NZTM2yOsmwta0x8XppHTkSI7RtiOZlNOGxyY+sXT
         +AFVxP4BCQ4qyAYpE9Ro9dsG3Zbrj8+U0vLr5gokaXZiAVM/nYncy3IWhJbkJanEt0wE
         njZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNzgG4C//Fb3qA6tUBixAyeWNeIV/FPpRpM8ywT0wGT85vbEpMLtYldFIopeiViApMcqEy+Zh5jUDnlGGqa5Yj@lists.infradead.org, AJvYcCUZp1lXFwGXyWUHjbmo9s8Tf+rBGNMk9gNRgQkVcXzjga19Qwy8h36SKg5zKnvbWMi9iD4PZQ7N5HqibtmqKnU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6ds/0SlkzIrjKtymJT7Yr6m7idTQXg/GZPPH0d1vNBrCfuGjl
	urZisgcDnVAmO5Z7zROJajyUMUzxvncaXJxQLbMepwVF6ZpZFgmD
X-Google-Smtp-Source: AGHT+IF/baAIksfObpO4d/Xeo/VELBA77lvmXKRc0oDEsxehbkabpfd0djPIxu6XGEybAlbj2bEx1Q==
X-Received: by 2002:a05:6a20:e188:b0:1d2:e78d:214a with SMTP id adf61e73a8af0-1d4fa7d0f19mr19113109637.44.1727736563173;
        Mon, 30 Sep 2024 15:49:23 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6db2b391bsm7029528a12.22.2024.09.30.15.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 15:49:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mmc@vger.kernel.org
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 1/3] mmc: mtk-sd: use devm_mmc_alloc_host
Date: Mon, 30 Sep 2024 15:49:17 -0700
Message-ID: <20240930224919.355359-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930224919.355359-1-rosenp@gmail.com>
References: <20240930224919.355359-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_154924_388340_2E22BCAB 
X-CRM114-Status: GOOD (  14.97  )
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

Allows removing several gotos.

Also fixed some wrong ones.

Added dev_err_probe where EPROBE_DEFER is possible.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mmc/host/mtk-sd.c | 55 ++++++++++++++-------------------------
 1 file changed, 20 insertions(+), 35 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 89018b6c97b9..c607312dfe07 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -2736,20 +2736,18 @@ static int msdc_drv_probe(struct platform_device *pdev)
 	}
 
 	/* Allocate MMC host for this device */
-	mmc = mmc_alloc_host(sizeof(struct msdc_host), &pdev->dev);
+	mmc = devm_mmc_alloc_host(&pdev->dev, sizeof(struct msdc_host));
 	if (!mmc)
 		return -ENOMEM;
 
 	host = mmc_priv(mmc);
 	ret = mmc_of_parse(mmc);
 	if (ret)
-		goto host_free;
+		return ret;
 
 	host->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(host->base)) {
-		ret = PTR_ERR(host->base);
-		goto host_free;
-	}
+	if (IS_ERR(host->base))
+		return PTR_ERR(host->base);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 	if (res) {
@@ -2760,18 +2758,16 @@ static int msdc_drv_probe(struct platform_device *pdev)
 
 	ret = mmc_regulator_get_supply(mmc);
 	if (ret)
-		goto host_free;
+		return ret;
 
 	ret = msdc_of_clock_parse(pdev, host);
 	if (ret)
-		goto host_free;
+		return ret;
 
 	host->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
 								"hrst");
-	if (IS_ERR(host->reset)) {
-		ret = PTR_ERR(host->reset);
-		goto host_free;
-	}
+	if (IS_ERR(host->reset))
+		return PTR_ERR(host->reset);
 
 	/* only eMMC has crypto property */
 	if (!(mmc->caps2 & MMC_CAP2_NO_MMC)) {
@@ -2783,30 +2779,24 @@ static int msdc_drv_probe(struct platform_device *pdev)
 	}
 
 	host->irq = platform_get_irq(pdev, 0);
-	if (host->irq < 0) {
-		ret = host->irq;
-		goto host_free;
-	}
+	if (host->irq < 0)
+		return host->irq;
 
 	host->pinctrl = devm_pinctrl_get(&pdev->dev);
-	if (IS_ERR(host->pinctrl)) {
-		ret = PTR_ERR(host->pinctrl);
-		dev_err(&pdev->dev, "Cannot find pinctrl!\n");
-		goto host_free;
-	}
+	if (IS_ERR(host->pinctrl))
+		return dev_err_probe(&pdev->dev, PTR_ERR(host->pinctrl),
+				     "Cannot find pinctrl");
 
 	host->pins_default = pinctrl_lookup_state(host->pinctrl, "default");
 	if (IS_ERR(host->pins_default)) {
-		ret = PTR_ERR(host->pins_default);
 		dev_err(&pdev->dev, "Cannot find pinctrl default!\n");
-		goto host_free;
+		return PTR_ERR(host->pins_default);
 	}
 
 	host->pins_uhs = pinctrl_lookup_state(host->pinctrl, "state_uhs");
 	if (IS_ERR(host->pins_uhs)) {
-		ret = PTR_ERR(host->pins_uhs);
 		dev_err(&pdev->dev, "Cannot find pinctrl uhs!\n");
-		goto host_free;
+		return PTR_ERR(host->pins_uhs);
 	}
 
 	/* Support for SDIO eint irq ? */
@@ -2895,14 +2885,14 @@ static int msdc_drv_probe(struct platform_device *pdev)
 					     GFP_KERNEL);
 		if (!host->cq_host) {
 			ret = -ENOMEM;
-			goto host_free;
+			goto release_mem;
 		}
 		host->cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
 		host->cq_host->mmio = host->base + 0x800;
 		host->cq_host->ops = &msdc_cmdq_ops;
 		ret = cqhci_init(host->cq_host, mmc, true);
 		if (ret)
-			goto host_free;
+			goto release_mem;
 		mmc->max_segs = 128;
 		/* cqhci 16bit length */
 		/* 0 size, means 65536 so we don't have to -1 here */
@@ -2939,11 +2929,8 @@ static int msdc_drv_probe(struct platform_device *pdev)
 			host->dma.gpd, host->dma.gpd_addr);
 	if (host->dma.bd)
 		dma_free_coherent(&pdev->dev,
-			MAX_BD_NUM * sizeof(struct mt_bdma_desc),
-			host->dma.bd, host->dma.bd_addr);
-host_free:
-	mmc_free_host(mmc);
-
+				  MAX_BD_NUM * sizeof(struct mt_bdma_desc),
+				  host->dma.bd, host->dma.bd_addr);
 	return ret;
 }
 
@@ -2968,9 +2955,7 @@ static void msdc_drv_remove(struct platform_device *pdev)
 			2 * sizeof(struct mt_gpdma_desc),
 			host->dma.gpd, host->dma.gpd_addr);
 	dma_free_coherent(&pdev->dev, MAX_BD_NUM * sizeof(struct mt_bdma_desc),
-			host->dma.bd, host->dma.bd_addr);
-
-	mmc_free_host(mmc);
+			  host->dma.bd, host->dma.bd_addr);
 }
 
 static void msdc_save_reg(struct msdc_host *host)
-- 
2.46.2


