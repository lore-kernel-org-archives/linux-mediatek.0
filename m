Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95E1FCC9DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 09:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=af02IVkQlyjh7MHZRvKNkK4tswtXHtMfEowyRfn4+2I=; b=PmaoCtOXBElZ0KO5WrKCHB/NkO
	MN0o7Wlc8jURnMy6oNuqKoUNVi7BVrasgFQaI21f7Y8dMDhzu+3SZ0fkyDC2t5EW56bNGRVHxHdPS
	Liw4CCHYRUcxOaZGN9nsFzXffqcR3bKbebSqJSVA+2rH1sxI6pepNvKfw8YQtrkfi3GxkPdIRWvK7
	sF1g6fNCqF9n3aMEASJu2t1OuctViQMWiSLpV7AdTBTAxG0ZGiluH0MaNuhoucFsYMWkBapApZMBm
	9hSClDyC3juSGlj5R+rE8IXiyH7TbrwEezXvY+wqvk6ZuJ5OUB/NmehyxGrOU351dxf/Dr+SchnTY
	oT3rSP2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztGF-000000094ZD-3vIj;
	Tue, 10 Mar 2026 09:20:19 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztGD-000000094XF-0bPs
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 09:20:18 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-829a568f3ccso2008947b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 02:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773134416; x=1773739216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=af02IVkQlyjh7MHZRvKNkK4tswtXHtMfEowyRfn4+2I=;
        b=gGkbg225eENXa5j/Gd29olES4oHEHZlgBnaFU1fxiub/LSnJKgRk3ry98Qa6pQg++v
         dBM0H6aSLGEtckJmlrX2eaG3LU3la81n2WQsUYxD6vA/sgYp4gq2si+9JqJCE4mwvaxs
         iDWVY4q/APgnoyHgQd4qS2pkJ0kY3rnXBO5p0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134416; x=1773739216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=af02IVkQlyjh7MHZRvKNkK4tswtXHtMfEowyRfn4+2I=;
        b=tU86LpwJ0FaaIK4Qo2THmYDQazi9EWkrM+tLW/ICsm/QvaSyrOKsi8t20R6/UNeasz
         TE/wEEgfybbE5u3mvdf/ieGUTh4ru9GJyqLzD78sQ2zBWJD7W9v+5zSeWPLHmnFFKj7C
         CbdYWCBjDKJSaLxsAgBuWHuawHj7tiZ/7NUc1h3063lju/Bit7PFRU3YqQgc9uM7XsV5
         kuraBFGtIqeYp8auzdrjyKxJZZTsjsTRUn4lrnlCF9lTSauB9DC5JxHPCX8GNhwiZcPE
         X+vMl3p+B5ZNVZAywS54RLBc312/Wz8dX3d3t2k7l/vm0Us7jl2BdRYl6FUaoGtM/zPv
         fR4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVRq5SwmMP3oK4CanKU49diQ76eB4OpV/AYIy7w4UeiDO19327niRbbf/hCICNlJ5kH+0krkuNpe8/Tam7nTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwupUkeUuhpSBPJ5KQA2s4sPejwYK4KTqy/ogt4fGyZzJ47I3IQ
	DSWCubTFq2B4pFqVBYcrddm7UpKt7wIp2Ee50j3VLyQOJGkCjZ9Lr2evQxGFsNRe0g==
X-Gm-Gg: ATEYQzwlaW++O25Yi7zB2FhNmhmJI2urfexcSOoLtR1dBl6cH5g8WtjJj14woTgufiW
	dvmSkCF8E7LZ78gqr7LpUMR4y4HMpEP2K5XHk8qAYEybkOfmkPwgAZUGq4zcZoPypbGdSqEEkK4
	RdDIqfNRtziDr1bifb12wSnLFzsrytQMpzkshjxCUhkJZMAbr1DxGfaN8GawqLJW82sdcF8ZJxq
	LzYqRwhHKwgD3XIShP3A5cQIO23HyJqUnQocxDPu0fYnb8vNDQ0wlKSrZjYBjLkb1pmu5IVlE/4
	ihtl2XzFnwaF6EKqEAjLJ5y/LKF/2kRbRdxqH1UHxbMnvotnXUlS74s2odvyAk67XnRIDPGAxUk
	WZo9jt9TwAq0B8bHT1PhFG9V+mHOY/5HLA3G42uM6tym9prq91Y+Oy6gw7msYU2mdQHHjFlTYGB
	hfmycO97BL8hCR42oQeR7dadvWpjuxs3KIKErHQ+bcTdFWmCOltGT4vAiwve/M1sD/TGzlHn6XQ
	qHQ6AZJ
X-Received: by 2002:a05:6a00:2d1e:b0:819:5db9:6ac0 with SMTP id d2e1a72fcca58-829a2f397femr11923975b3a.37.1773134416561;
        Tue, 10 Mar 2026 02:20:16 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48a3b74sm16965190b3a.45.2026.03.10.02.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:20:16 -0700 (PDT)
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
Subject: [PATCH v4 7/7] PCI: mediatek-gen3: Integrate new pwrctrl API
Date: Tue, 10 Mar 2026 17:19:46 +0800
Message-ID: <20260310091947.2742004-8-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260310091947.2742004-1-wenst@chromium.org>
References: <20260310091947.2742004-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_022017_188884_6D86E812 
X-CRM114-Status: GOOD (  19.91  )
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
Changes since v3:
- Adapted changes to movement of existing setup code

Changes since v2:
- Added "select PCI_PWRCTRL_SLOT" to Kconfig to fix kernel test robot
  compilation error

I'm wondering why the two existing uses select PCI_PWRCTRL_SLOT and not
PCI_PWRCTRL though.
---
 drivers/pci/controller/Kconfig              |  1 +
 drivers/pci/controller/pcie-mediatek-gen3.c | 38 ++++++++++++++++-----
 2 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 5aaed8ac6e44..e72ac6934379 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -222,6 +222,7 @@ config PCIE_MEDIATEK_GEN3
 	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
 	depends on PCI_MSI
 	select IRQ_MSI_LIB
+	select PCI_PWRCTRL_SLOT
 	help
 	  Adds support for PCIe Gen3 MAC controller for MediaTek SoCs.
 	  This PCIe controller is compatible with Gen3, Gen2 and Gen1 speed,
diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index f1a70b92cc9f..3800d0d730f2 100644
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
 
-		/*
-		 * Described in PCIe CEM specification revision 6.0.
-		 *
-		 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
-		 * for the power and clock to become stable.
-		 */
-		msleep(PCIE_T_PVPERL_MS);
+	err = pci_pwrctrl_power_on_devices(pcie->dev);
+	if (err) {
+		dev_err(pcie->dev, "Failed to power on devices: %pe\n", ERR_PTR(err));
+		return err;
+	}
 
+	/*
+	 * Described in PCIe CEM specification revision 6.0.
+	 *
+	 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
+	 * for the power and clock to become stable.
+	 */
+	msleep(PCIE_T_PVPERL_MS);
+
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
@@ -1209,9 +1220,15 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	if (err)
 		return dev_err_probe(dev, err, "Failed to setup IRQ domains\n");
 
+	err = pci_pwrctrl_create_devices(pcie->dev);
+	if (err) {
+		goto err_teardown_irq;
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
 	mtk_pcie_device_power_down(pcie);
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
2.53.0.473.g4a7958ca14-goog


