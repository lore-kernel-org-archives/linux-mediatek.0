Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA2DFD0648
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 07:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcmZE5JSmd9EMTwa5Tp+cNSGVu0husq/Jm3YTdKn7oI=; b=MPNddxZ+iG7hquIeE3MIFVTQPS
	ubaUpJ6nXTTkUowI0Cs+0fX4R4Tz48JwwjNs7rIykCDiamadNxhbhnOJuwYnAPNklAKhGOyfBNuNG
	Lfvf97WdtqKV5PYVoKaa97Chay1TZFLB5iGVUeY2EqTnHtdr6k0eASopWTBOSGfqOmrzbup16GyEf
	cS87Sq6W8vry4JHxo/zxSdaEW1AZRsp+eKoiWfsGFRfbS5V1F5OhxLZ/9GN8hbXoPWpSK7IFkOzcN
	mBz5MO+pPCjvraVJkXbcH5jN9WZfIkd5BS2jVnidojgPDO1yr0OUcKx5wyOV+UPd75SU5ks1Rn2XU
	VxH9BJaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ENL-0000000B5Sl-2JRd;
	Wed, 11 Mar 2026 07:53:03 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ENK-0000000B5Rx-0KL7
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 07:53:03 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ae4d48dc2fso46613375ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 00:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773215581; x=1773820381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xcmZE5JSmd9EMTwa5Tp+cNSGVu0husq/Jm3YTdKn7oI=;
        b=BRQqEfii8ntFsuU7WGi6V5zj7msGnWUvCrYO+BXPTu0aMeGjgT7xMYq21ho9bVO2fU
         BfWJJ3oS+H9G+03EgFH7uagPQtDJHSmmUQ8kvDTF6/D3KY3snT7s7mG2ACMUymlXGQOn
         gPlJAXxR1IyRyPsLAuvyDk3/s+psgtecr+WSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773215581; x=1773820381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xcmZE5JSmd9EMTwa5Tp+cNSGVu0husq/Jm3YTdKn7oI=;
        b=Yb9C/eHb01NfAP2U0c3NfgWp28zHjRrxEC08vShC1mhDhs/n/85aeZaEDVTRfCXgXM
         2vtt9FbgCppdArPGtolnLCZWm0t5elWpfL+b3AcuqMxs8Gbb1SijqlLakT0pv7gzp9t3
         lt9YSbNNN7MFIbI2lUHq0ujsVALUv72N7n8X2SJwIX6ngIVmimLfi5uAniOkYHHUlTkA
         Ogx801C3emYKQDjX6HpY30+2Xg5jfNft9R+Ibbfv0rK/UJ8V0LPBUvFDxGFJu3iXwICs
         2ViMdbwXdGbLtCt6TygoPEoswyLdPuEO77AKLuE6sLn2jiW7ImyPGbxmOGjGU66Okf+6
         opUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL+jaK2GVnPyyl440xNIF+TZsRNSMuVTfCDWmnYGDbdASDiu8BAUvPpZKeea3Acb7RtygIQ97Vnc4pJVV5dg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSidmJf8rqSab7rrg0ZV13PqJrzybXOZr6RKiPFi2RnrmVSLFz
	bpUFTPDrSk+Wfiba0jR9JWl/VQgJgw3UeOIiLYdFo/WQ3SN4SnuubMIXHona4Iz6dA==
X-Gm-Gg: ATEYQzzta5b2MfqArji9A+JcZPygFBVMWAFHDN7R5NUlW0GLWCGNAM4kXXd500fH+2G
	FSofdEkIDjArSXQLkMLGyre/uz3Uywu1CPTDPZBpgmhMLnYpJUDq2pMtKt85LKUCDKBz8QltE92
	XcaMtUM7H1CbEmf4NudiRqopZd3kSNgZnafhs+bCCqy1iLerMdjBh92QME4BSsRYumb6qYhN6HR
	bnbEQLjBFQaXDMkEDf5rGhcE7lKlUWsE6kYIoCGZjiHRL/UQcW4AczcFINrdiI3yHh3WaZ/nn2r
	LZHbA2PEbHQ40sm+0qpjzulv2poX8U/IOqwX3MyATkk2J0Jl+t7928P6aTwt1EpDwtceXL1r9zw
	9Jy3AHww3hHXO/NA0TN9+tNrCYLikJtv/mkjFun2Mve83chre6SoPh1qFfWmuT2oMBuinj01nqw
	UFjLo1FjRlrqP5RWI3aGjYkW2DFwKHslBFI+s3dX04b3VclD/NhxXMx5LdlXMmxruV9//NscPgV
	m0M5vzKW4ExScY+f88=
X-Received: by 2002:a17:90b:39cf:b0:359:fcba:6517 with SMTP id 98e67ed59e1d1-35a012df4e8mr1613649a91.19.1773215581116;
        Wed, 11 Mar 2026 00:53:01 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:805b:14e9:f783:bcae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a0236f79asm727816a91.6.2026.03.11.00.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:53:00 -0700 (PDT)
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
Subject: [PATCH v5 7/7] PCI: mediatek-gen3: Integrate new pwrctrl API
Date: Wed, 11 Mar 2026 15:52:22 +0800
Message-ID: <20260311075223.3303497-8-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260311075223.3303497-1-wenst@chromium.org>
References: <20260311075223.3303497-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_005302_130200_4FB2A000 
X-CRM114-Status: GOOD (  20.69  )
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
Changes since v4:
- Replaced "exploded" with "populated" and added explanation that the
  layout or design is copied verbatim (Bjorn)
- Fix build break from label typo; fix was not squashed in correctly in
  my local tree

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
2.53.0.473.g4a7958ca14-goog


