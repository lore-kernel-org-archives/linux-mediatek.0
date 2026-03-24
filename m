Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71A6F532D8
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 05:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTFvdYaRAXH5T4w3zStr4Kcf5DL2tAxoUUkF1NtmwTQ=; b=LAd5oHuY1bBV1iiM3xDqhLPmgh
	PxlnXgW8n/SVg42T20JR2EovdWsL0YswuNK7GOXAxvARO8VsOPgVO3kv6j4pV4TEZTEpSKQqagDkL
	JYFuT+TUV6cwNtw8CBHwRKNzlrBpkc9ZjB1uOv+nR3IR5VKldzBknidkuupgJGMCBEIwqVQfDFFU8
	jniXmuiUWye3isSsQwVpuCbu2zHapUWvL0qkJeMhpgXY7o5lGBzUTqRuhAmGLd7FZzVYYFiotFLat
	ZDhXgrsv5BGGo9qW2FIvbsxgva1SMSewKj9ujKUUSkc4vSEpxDuJsPy2rUdAkqUSApRky4YWp5YbP
	qr5WNqzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uBx-00000000a1b-3lxA;
	Tue, 24 Mar 2026 05:20:37 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uBw-00000000a0m-0KLV
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 05:20:37 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-35a1d4a095bso2932726a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 22:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774329635; x=1774934435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTFvdYaRAXH5T4w3zStr4Kcf5DL2tAxoUUkF1NtmwTQ=;
        b=EKUWCBFDJ/57h/x1rNHkIRCqWXTxK7NDfeqyildB86McykApSf4+qNTJ/Q3y5JRKkM
         AWVtMQI/h2XYMgTzTtRuur+uDLPeCvaQitK8xdulHPTOtU/ch4dl6Hra3JcZvWeh14Cc
         P+v9QMk/5TClB8kSKj3DwMq5YKarI5xxO8CDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774329635; x=1774934435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dTFvdYaRAXH5T4w3zStr4Kcf5DL2tAxoUUkF1NtmwTQ=;
        b=YGlItNMl66DLrKN8oE8hevLIXaWkgfoxZvb7449WmKPAnx4934WmXavQTQOua1atb2
         PbtPqqy+bw2SulcWBFOmYa1Q8GsAmoPjawhE+oaSO58LWR34C3vmizGZ/RIKDKe29Q9G
         HuVTnnfgeT19wQsaSyY3uf2NLK7PTdwRGW3UROlEWXFKB4/1IrzqqkvYmH+D78shYHMO
         hOO96gyVy+RRGvL7qKzD1qIP+tk9AIGIsP/MOgzvEBP55vs4XNiIeZt6/KloeJ0Tia25
         bLHeNodsqkeYEDgQ+qLmrS4FIMpYUA4m9oiH5opFyhHpCyQFSlFOEOPq1tVtJSavWiJL
         cc5g==
X-Forwarded-Encrypted: i=1; AJvYcCVrwF5os9mS7o5IeRG2v9Hahwb9sqdaXjLutuEkVzaafVxK5o2dxrvxoiJn240W9Wqp2UNtc0fKFJFVcXD72A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0CTvHL2sLyI3IgjKGOpkV1mm7PB/1e8VrCw8jBZsYpye08dwr
	p3LrAFpsKS9tClWBVHSt5ME8q/rYFJD33XcM47IIFKTRRiBCrqNiW+BRXFnz22HF+w==
X-Gm-Gg: ATEYQzwbkBNKoi23o2eimuTAiu1BYyDk08oF7Pt4eKdXMF+J+ovghY4e7nfUlMNWPEj
	CHJLurEii6hXxZXmDvhbLKxb74RR28/4pHKA24G+JuVcXLkVfSzISsKCDMZiywsS7KuS8FPZOHX
	XMWpcIZkjKtgt8EoWP6TsSMZ/m9yPGNp27UMhpWGL4+hYuuViuuRmoqAPt2T2pekRKE/saCUxu6
	AKGcAW3ZVUXPnIDgPAcP8PL4kvHkQ0JpHKIj6a0lO+nyhfGuXpF7BuwEr3zxf8Lh6R6jUOx5c7l
	SwkPir+Td9GYYke+oJHZRUh4RKcXA9QykVQ5IvZtZfGHqAZVp/M+Q2lHO/K2PuQ892aOOuXgNay
	jxNhF9juovOKMKawlvYr6tu+ufLcoeTAcRUYoi1Zm5dEOzsF0Q8m7IgVfbhM5fVj1w17X4iUYug
	fFX6DDJeaDJeevg41y+4eEym7Z4ojJDQkgHjOwTBD7R79Phv4KXlrC5mBiJ9o6MKMalnmydJMs5
	YgQEgAA
X-Received: by 2002:a17:90b:3fc4:b0:35b:9f51:a755 with SMTP id 98e67ed59e1d1-35c0092752bmr1620066a91.18.1774329635438;
        Mon, 23 Mar 2026 22:20:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:19a5:8f2f:d584:8078])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03124a87sm1068647a91.3.2026.03.23.22.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:20:35 -0700 (PDT)
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 7/7] PCI: mediatek-gen3: Integrate new pwrctrl API
Date: Tue, 24 Mar 2026 13:19:59 +0800
Message-ID: <20260324052002.4072430-8-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
In-Reply-To: <20260324052002.4072430-1-wenst@chromium.org>
References: <20260324052002.4072430-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_222036_124546_C203C9C8 
X-CRM114-Status: GOOD (  18.67  )
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

With the new PCI pwrctrl API and PCI slot binding and power drivers, we
now have a way to describe and power up WiFi/BT adapters connected
through a PCIe or M.2 slot, or populated onto the mainboard itself.
The latter case has the adapter layout or design copied verbatim,
replacing the slot with direct connections.

Integrate the PCI pwrctrl API into the PCIe driver, so that power is
properly enabled before PCIe link training is done, allowing the
card to successfully be detected.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Adapt to PCI_PWRCTRL_SLOT -> PCI_PWRCTRL_GENERIC Kconfig symbol namechange
---
 drivers/pci/controller/Kconfig              |  1 +
 drivers/pci/controller/pcie-mediatek-gen3.c | 38 ++++++++++++++++-----
 2 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 5aaed8ac6e44..686349e09cd3 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -222,6 +222,7 @@ config PCIE_MEDIATEK_GEN3
 	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
 	depends on PCI_MSI
 	select IRQ_MSI_LIB
+	select PCI_PWRCTRL_GENERIC
 	help
 	  Adds support for PCIe Gen3 MAC controller for MediaTek SoCs.
 	  This PCIe controller is compatible with Gen3, Gen2 and Gen1 speed,
diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 208866d33c77..a94fdbaf47fe 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -22,6 +22,7 @@
 #include <linux/of_device.h>
 #include <linux/of_pci.h>
 #include <linux/pci.h>
+#include <linux/pci-pwrctrl.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -421,15 +422,23 @@ static int mtk_pcie_devices_power_up(struct mtk_gen3_pcie *pcie)
 		val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
 		       PCIE_PE_RSTB;
 		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	}
+
+	err = pci_pwrctrl_power_on_devices(pcie->dev);
+	if (err) {
+		dev_err(pcie->dev, "Failed to power on devices: %pe\n", ERR_PTR(err));
+		return err;
+	}
 
-		/*
-		 * Described in PCIe CEM specification revision 6.0.
-		 *
-		 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
-		 * for the power and clock to become stable.
-		 */
-		msleep(PCIE_T_PVPERL_MS);
+	/*
+	 * Described in PCIe CEM specification revision 6.0.
+	 *
+	 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
+	 * for the power and clock to become stable.
+	 */
+	msleep(PCIE_T_PVPERL_MS);
 
+	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
 		/* De-assert reset signals */
 		val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
 			 PCIE_PE_RSTB);
@@ -449,6 +458,8 @@ static void mtk_pcie_devices_power_down(struct mtk_gen3_pcie *pcie)
 		val |= PCIE_PE_RSTB;
 		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
 	}
+
+	pci_pwrctrl_power_off_devices(pcie->dev);
 }
 
 static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
@@ -1209,9 +1220,15 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	if (err)
 		return dev_err_probe(dev, err, "Failed to setup IRQ domains\n");
 
+	err = pci_pwrctrl_create_devices(pcie->dev);
+	if (err) {
+		goto err_tear_down_irq;
+		dev_err_probe(dev, err, "failed to create pwrctrl devices\n");
+	}
+
 	err = mtk_pcie_setup(pcie);
 	if (err)
-		goto err_tear_down_irq;
+		goto err_destroy_pwrctrl;
 
 	host->ops = &mtk_pcie_ops;
 	host->sysdata = pcie;
@@ -1225,6 +1242,9 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 err_power_down_pcie:
 	mtk_pcie_devices_power_down(pcie);
 	mtk_pcie_power_down(pcie);
+err_destroy_pwrctrl:
+	if (err != -EPROBE_DEFER)
+		pci_pwrctrl_destroy_devices(pcie->dev);
 err_tear_down_irq:
 	mtk_pcie_irq_teardown(pcie);
 	return err;
@@ -1240,7 +1260,9 @@ static void mtk_pcie_remove(struct platform_device *pdev)
 	pci_remove_root_bus(host->bus);
 	pci_unlock_rescan_remove();
 
+	pci_pwrctrl_power_off_devices(pcie->dev);
 	mtk_pcie_power_down(pcie);
+	pci_pwrctrl_destroy_devices(pcie->dev);
 	mtk_pcie_irq_teardown(pcie);
 }
 
-- 
2.53.0.983.g0bb29b3bc5-goog


