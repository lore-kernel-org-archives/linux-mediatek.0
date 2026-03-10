Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F70EA8550
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0m2X60AbRiPH6OZp8R6Aq2XdXF8mhqQvbj4ZWhmMt60=; b=xcTGq13V6ervZ4mGhxe6xcLcKT
	tKT7OeC9lXezKj9IGzI7Bd5VILs4LGx0vvuPzg7txNiDizwarxepe1eY6VHKV3W8UcxGG1vwQwGkc
	ZByWh0lPLAh/F/uMEsCVC6eEUCkDVm6M+bSw1Yv5cw1QWrKf21XDdJnpT4R2Yn0JrrRhqxGVP9Kz/
	54BFqJlE9devOlL0FwAQv5pICWQYK2e3GhxAAThqqo2/F/6G94mTHXs/+xRtTzYwaexlNpRS7zs9p
	3hfEbiWFprU7E3Q9VtO7zke3TucUVdW+5ar1qd+xKfYw0fQdenop9lqwnrg1KTap6NvFeS8rgk42l
	dCTkhyxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztG1-000000094PS-0gn4;
	Tue, 10 Mar 2026 09:20:05 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztFy-000000094NK-42Bj
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 09:20:04 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-823c56765fdso6285702b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 02:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773134402; x=1773739202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0m2X60AbRiPH6OZp8R6Aq2XdXF8mhqQvbj4ZWhmMt60=;
        b=GHEBWb5a9GPpxtIYQzRpCZQVoXj5gFOqTzYEyzSACfoXAD7pix5pPHHgatLcKfhPwh
         2oSwz8oOPDbgyLVJrkjizEnYH3LevyzR4ZEsT8XoXaBtQGdpqOO7VLmvb878Rslu8hWP
         ImKaqUEHHTeen8LHIGqTPI0iWkxyBE1/mWOxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134402; x=1773739202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0m2X60AbRiPH6OZp8R6Aq2XdXF8mhqQvbj4ZWhmMt60=;
        b=RG/O+XOGw5PUy69+u4TDA1mFMmYfUP3J7yeoJ3uFvzEwkgAwHcHSIGLMsdXyFqvges
         CLz91VBdW6+jRiof2eJWQSC2xOxZBnudJfyfJFiUY4xobRTWmZFj7zWx8CdkPKp4YRhn
         RbD59gFxbYHT9PgY9/g2XZP+q5sdImPjCI7vxNFW6N062bgUorrtsTLoZXo2ytYWCzle
         PK+86tvay8AszykjjlCCjHBkzOJuIy79TY2/FoaBPfr0j1FdeFJF0WB+oxoOc2JjWZNu
         qM5/Mh0QgjyB39Z2IeeI5MwZTLva8sOnzCR9bynmaEcFBzcv4pOMjuKF4p3OSkahXtYz
         gb/w==
X-Forwarded-Encrypted: i=1; AJvYcCWAtxKRrBgbTr/2LcD1PodVWrFg7gwxgceDK26NzBwwtc5qTwyS8HbZkmvMUDXoPjGTAJqr/zF7irz8jdPnpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxezegbsMhrhxlw1lyzjmFXO0HfUo+TBCSO/7kotXOxmC1ZVRE8
	5JFgToP1a0aKr2ZvvFfQMUP2ze/BVTHrcnumvvcCKrjz6DIbL+ZaI5L2CqNahA8oLA==
X-Gm-Gg: ATEYQzwmoCB4dnVRZnfSwGF9GZFLirmqIl8AGfu6+Iwu1We3Upr7CjDNODP6I2QO1tm
	q9zZ1f5sBRk7oD4UaUPwYmRc2DUPJCjhK95j53tUcGfYoElxBuPA2W+csjc0ZyrmD7dTbQZhbce
	khoKkKpOcpgl27+XhPvdPcCHXVnNiha4g0rBv1F7m8vlzlJ3rOerV+iFSh+9cPKgK3iObvoWvMY
	kewcX8i8sW79hX116ginO7x6Cp/jgdqVK/eHsgljjsOxobCo+rATl5KvBKbjoEi7VQtO1LeQgL8
	fOA/cGVME/6Cwbf2T+eDajK7P6irZ8UirMGiiIzE++x1QLgUDI56gkPjZOV5MNDpCfaQdZxL/dD
	hr8fbXW5dHOeENKoUYzVGJ+dhxxCCHnkBNG5wk7hF4UZej8e9DI1R0Vn5MIwRk3xzS4umzSPe1F
	nix/LZVDkuiLYXLYfMqz5eelNU9hCnG3VThXLpSBbPR2VNrt2Jr6OMR7jSFfJAfp5XynyMRkNug
	7l974Kf
X-Received: by 2002:a05:6a00:9510:b0:829:7ee0:1a44 with SMTP id d2e1a72fcca58-829a2d86b38mr12332941b3a.4.1773134402170;
        Tue, 10 Mar 2026 02:20:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48a3b74sm16965190b3a.45.2026.03.10.02.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:20:01 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH v4 2/7] PCI: mediatek-gen3: Move mtk_pcie_setup_irq() out of mtk_pcie_setup()
Date: Tue, 10 Mar 2026 17:19:41 +0800
Message-ID: <20260310091947.2742004-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260310091947.2742004-1-wenst@chromium.org>
References: <20260310091947.2742004-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_022003_018715_878DF941 
X-CRM114-Status: GOOD (  14.98  )
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

mtk_pcie_setup_irq() just sets up the IRQ domains for PCI INTx and MSI,
and chains them to the controller's interrupt. It's not really related
to the setup of the actual PCIe controller.

Move the mtk_pcie_setup_irq() call out of and before mtk_pcie_setup(),
and add a proper error message for when it fails. Reorder
mtk_pcie_irq_teardown() in the remove callback to follow. Also create
an error path in the probe function.

Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Link: https://lore.kernel.org/all/20260309215056.GA603013@bhelgaas/
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- New patch
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 25 ++++++++++++---------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 1939cac995b5..04ae195d36c2 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1152,10 +1152,6 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
 	if (err)
 		goto err_setup;
 
-	err = mtk_pcie_setup_irq(pcie);
-	if (err)
-		goto err_setup;
-
 	return 0;
 
 err_setup:
@@ -1181,21 +1177,28 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	pcie->soc = device_get_match_data(dev);
 	platform_set_drvdata(pdev, pcie);
 
+	err = mtk_pcie_setup_irq(pcie);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to setup IRQ domains\n");
+
 	err = mtk_pcie_setup(pcie);
 	if (err)
-		return err;
+		goto err_tear_down_irq;
 
 	host->ops = &mtk_pcie_ops;
 	host->sysdata = pcie;
 
 	err = pci_host_probe(host);
-	if (err) {
-		mtk_pcie_irq_teardown(pcie);
-		mtk_pcie_power_down(pcie);
-		return err;
-	}
+	if (err)
+		goto err_power_down_pcie;
 
 	return 0;
+
+err_power_down_pcie:
+	mtk_pcie_power_down(pcie);
+err_tear_down_irq:
+	mtk_pcie_irq_teardown(pcie);
+	return err;
 }
 
 static void mtk_pcie_remove(struct platform_device *pdev)
@@ -1208,8 +1211,8 @@ static void mtk_pcie_remove(struct platform_device *pdev)
 	pci_remove_root_bus(host->bus);
 	pci_unlock_rescan_remove();
 
-	mtk_pcie_irq_teardown(pcie);
 	mtk_pcie_power_down(pcie);
+	mtk_pcie_irq_teardown(pcie);
 }
 
 static void mtk_pcie_irq_save(struct mtk_gen3_pcie *pcie)
-- 
2.53.0.473.g4a7958ca14-goog


