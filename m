Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDB6FC5907
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Feb 2026 07:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWmVa+/2NNj2zj7xs37qj/2MgusYqPpP837YIn11A8s=; b=MdGavex8F1og/2s6KCXBt+sR9p
	2JPnloVezOk0/VYYxdTlkFTYouCZ8s8XwIQYhGI8ASNHw6W0Q3CuzHCpwjr6UFb9U+3+unQslBevy
	j71f8vmz7Qx+ZBQiclX0Dq1vpAyTyfUDfRomHZIJtj1qMIQUZP2eEQ3kMXGlSfHye3naksIbviwyx
	0PTkZW1AJkn/YzCUUbDsdocM88wSSU2dGdyLA/5uNtA9ryEsX1wf5vvEadO4y4SrpV+PnKClYHU6G
	UVs+F+Km7r+x5cBH78ugvjzt2elp1IVL2JTYp0trZ/PApJmRoZnqXRapHS3hrRK3/ev7dqpFV295q
	5QMWozgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW5U-00000005b97-3W2W;
	Thu, 26 Feb 2026 07:47:08 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW5S-00000005b7U-0eRt
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Feb 2026 07:47:07 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2aaf9191da3so3185445ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 23:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772092025; x=1772696825; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWmVa+/2NNj2zj7xs37qj/2MgusYqPpP837YIn11A8s=;
        b=kFkmFjaDTQoCCQhIIZhexCq9P5O3uGkHm8JpPdwVqXOBdcj5EGXdNWpZmGPLzOPgyq
         lw26ZawWWbL+cRnulKajWOjSszkfXHAkAFqDeBSwM+kIueouzqOwa7klmBLicbKm5JSD
         m225YHvuI05LxKUoVg8TTLRTp3Ut9XZxgkw9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772092025; x=1772696825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hWmVa+/2NNj2zj7xs37qj/2MgusYqPpP837YIn11A8s=;
        b=RzmbsvZliaJTrSlalxHdYNDyy5yzGK3Zv2O0zNH4diF8hxYoQJq+cIzIkRlUcWe8Gf
         tcpxWzC8nuobpA0nMYq73YT2c2/eNTQTW9scgQVLlYsUXwzC9SLgDLBzw1eJ/1HbBcMu
         hnZQSwLcggohCmneoJ+kMR2iICK6ny4RbwUrYyCgXzKEzy3dUuVPL6/BT55zXgShvDmN
         hBj/9eeY5gwtHVmVK4n53OknTMYIRZeVJdCtTdlhXWlA1cL0dhqrH8iGFMxtOu8g1YUi
         LNHcvavKb/YemTkZQMHiAwqRFI4UCyXr+uvR65AXMGolfpFMJPaY/tiYpV3ZzI6SYQyP
         kVtg==
X-Forwarded-Encrypted: i=1; AJvYcCVW/izDoexRKwtl0ckI5UyGaN44MUn8f/y9QOqOIePYszvY5VQW52MsiI23kkDTt/gXXxqdeJfPr0FBZ89lUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzR+PGr7lkWkQ1Nw/xG+iV4dAnCRCFTL49xY0mXJe6UO2J4kvim
	i4tHBtio6vWIJiK2LPXNTSJ4/2ynXSwqOANWX9IvXPrFPWiDWTy2SCFvz6uteARWwQ==
X-Gm-Gg: ATEYQzwFlKLNxjw5qAUSCGGkeassi1EDzd5ttbkrO4I1RvX4SmZjE/FmGFZc5FnDj+O
	+RX06l5/vJIDShW5F8mtpyIM/nnx0s9BuC7lZaY8TpFPvb16+ZWS34HT9y0ZXWki2GjYfULoFHw
	BP+Uh6K6+yp3ctaQBNl11c46v2/hQFLVv3sp6upg5LmNUL0ur357v5o/poz1MgD8N0fAZBbPPYS
	dq4/Gkjcb3RBw10lczH1jkPApWxICcq1vw5qw9DWUHB8KODtP0n0Dsctn/6Ro+Mo7M9re3+U3QA
	zYhDiiHmkgA1DzrWusUCdsUMOUQ+Ojr7fm0dwGGc4SXggCn8KadHCNNs4WFC7L+n6TjYVSgEsXy
	zeGYKKDKfA57xdkyPqkbtBKrkXc+Z8+J16jwoYp+LffZpk5R+ZnbGAtCMFpl0b4t3PLSXzswgNk
	1cqcjK2+1r6hSk8VOyVbh8zbDm5rVipvFGI8Ap1MtamKRgemZcXxg0KIPiF5b4WqbOyIcNaeqwa
	FgIDaAW
X-Received: by 2002:a17:903:120e:b0:2a9:450b:104 with SMTP id d9443c01a7336-2ae0370b847mr14379195ad.55.1772092025309;
        Wed, 25 Feb 2026 23:47:05 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bf01:7f64:477a:2f97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b22f3sm15238245ad.12.2026.02.25.23.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:47:04 -0800 (PST)
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
Subject: [PATCH v2 5/7] PCI: mediatek-gen3: Integrate new pwrctrl API
Date: Thu, 26 Feb 2026 15:45:21 +0800
Message-ID: <20260226074524.3808081-6-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
In-Reply-To: <20260226074524.3808081-1-wenst@chromium.org>
References: <20260226074524.3808081-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_234706_195921_518871D3 
X-CRM114-Status: GOOD (  16.84  )
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
through a PCIe or M.2 slot, or exploded onto the mainboard itself.

Integrate the PCI pwrctrl API into the PCIe driver, so that power is
properly enabled before PCIe link training is done, allowing the
card to successfully be detected.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 38 ++++++++++++++++-----
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 7459e1c1899d..93e591f788f7 100644
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
@@ -421,15 +422,23 @@ static int mtk_pcie_device_power_up(struct mtk_gen3_pcie *pcie)
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
@@ -449,6 +458,8 @@ static void mtk_pcie_device_power_down(struct mtk_gen3_pcie *pcie)
 		val |= PCIE_PE_RSTB;
 		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
 	}
+
+	pci_pwrctrl_power_off_devices(pcie->dev);
 }
 
 static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
@@ -1211,9 +1222,13 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	pcie->soc = device_get_match_data(dev);
 	platform_set_drvdata(pdev, pcie);
 
+	err = pci_pwrctrl_create_devices(pcie->dev);
+	if (err)
+		return dev_err_probe(dev, err, "failed to create pwrctrl devices\n");
+
 	err = mtk_pcie_setup(pcie);
 	if (err)
-		return err;
+		goto err_destroy_pwrctrl;
 
 	host->ops = &mtk_pcie_ops;
 	host->sysdata = pcie;
@@ -1226,7 +1241,12 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 
 err_teardown_irq_and_power_down:
 	mtk_pcie_irq_teardown(pcie);
+	mtk_pcie_device_power_down(pcie);
 	mtk_pcie_power_down(pcie);
+err_destroy_pwrctrl:
+	if (err != -EPROBE_DEFER)
+		pci_pwrctrl_destroy_devices(pcie->dev);
+
 	return err;
 }
 
@@ -1241,7 +1261,9 @@ static void mtk_pcie_remove(struct platform_device *pdev)
 	pci_unlock_rescan_remove();
 
 	mtk_pcie_irq_teardown(pcie);
+	pci_pwrctrl_power_off_devices(pcie->dev);
 	mtk_pcie_power_down(pcie);
+	pci_pwrctrl_destroy_devices(pcie->dev);
 }
 
 static void mtk_pcie_irq_save(struct mtk_gen3_pcie *pcie)
-- 
2.53.0.414.gf7e9f6c205-goog


