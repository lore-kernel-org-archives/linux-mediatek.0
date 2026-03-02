Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF930D58E5D
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2026 05:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFFvNBaU3ukfXIRtGlvARwBwSZQA57YUx4AEefexLes=; b=FB5IfAcN5tt+Ey8RWU40HetKZI
	j1YbQt+FhBEp0oehwuw2QboHcriKju0C58bnlkgYzBmZ2aSWRprjz7LYHwCJWTxgOwSwoyyEEOe81
	6xq9aVs5RLzwspfQm2PN76xmBSIm2UPOe/qmc0fsZxnHnEuZTmmvsIW0NKjQGK+hR9vXfdyXZHhms
	tuQ4u/RqtZpeGPSuxYwsYQWn8QOVCbnqN6J1hOrf0lfscfZgWewO9BwPmtDLZS6nqHgq3m7arz8H2
	mUssxnG/v9iVByxVGyRJyYNt6sOWXbPtG1AM7sxrwx4qVp1I+snhpmGL/HR2eKU8Cj+6XVeRAOSyE
	RdfoO21Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwvsU-0000000CIlR-3wFa;
	Mon, 02 Mar 2026 05:31:34 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwvsS-0000000CIjt-1mPR
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Mar 2026 05:31:33 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ae4e538abdso6038395ad.3
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Mar 2026 21:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772429492; x=1773034292; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uFFvNBaU3ukfXIRtGlvARwBwSZQA57YUx4AEefexLes=;
        b=c4YCCbmb9pxT28cuZswgPsmq2J9CzevRA+thJCtPwKn/2jqZiWqV8pD1J+EdcEG9EW
         Se7jxu5d2ZqBTMd8ei2J1mrtYFAl4h9VrklU2ze15bBQw7yNw7nEYbbFOnn/G/hhdCwh
         SDlnesKlLXcF2cTa9EFPztJoWZaFcGkjHTzyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772429492; x=1773034292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uFFvNBaU3ukfXIRtGlvARwBwSZQA57YUx4AEefexLes=;
        b=k2N/ZGr+pBeEiLl/StYadiTDT3Q+45eHutoZrUD6GDHy4vfC+vvTnNFhbAi1/gQH4z
         wLInVLgmj4sJDHIzXcvhWgIGqsbgCWsQK8ry2AKaOb12+2Rj77YoOQiDlYAjyJVKVcQ7
         EfLe1uiIwEBBZJ6m5BohlP7iI8ujqHIrbiJhFxnZRnVD/7Gz6X3ZXvw9/TPGSYQN9t3/
         i1DN1ezZC5LmSeFT4HTSd0NoiyvxUpnQeMI2Qai3DgDUosEpCgUNArZ0p2rP6NAK6N+T
         YwGYhP6YMTCP3oIqNuXTCZO8bvhdPnxhVDMfMv1FnCBUsXIBeQkd/ceLi/6CZivCTQ/7
         uuvg==
X-Forwarded-Encrypted: i=1; AJvYcCW6172TiYjwDURqexV24l7JxNky1XhtqYU9iVX2tsMaJ6jAXn9ACKpRzmHUlJV+Sod9yEAOBQJ5YvUUKke7sA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJTfmJ6KMHxXD0Qv59YUggDv4/AUwG+EWAVdMK0L8A6jAOw8wW
	0hndGuLZaA2WqT+1ytT9D7kz1feMWNhApFVDxexv+XbiGH6ucFKC/MiFh/V8sxBanA==
X-Gm-Gg: ATEYQzypv3xKXRnj0M8EtAj4UeOhqRvucNVW0QjUwIVjSjJLHUTGq1pJynmLoeFur7B
	T9gCOoxTpSH8fpjaLU8mQuMowTFjnUZCExIjvA6ItXOdeMisx1iz2SYq+8S6Hiio2EhCxUF0JaY
	zmsnT3fHD3WRsiMum/hXhWCtU0y3zuFbYCfWNPoTLbJOzhIjnuR8OplAg+1gxLf4H3zk2H9H8Nh
	p9Ll2GKlGqqIdtqJgKPNPTbJSO+fLNR6nKlCTEFxwJ60WxtuYgrvA3MrqZrwOpc0C/f9vJ/w7SA
	w8p3n1tpaZCJr0IgplZOIGk3ROEnYEdza8xCz+vrCQgkI1JO22MzOm00s86w6bVp8rhQQb2I41e
	fwLbWeKYaMdwekG0lthDDf0MMOQVQF/+0CCuE0D0laFvZUrHrGu93UU72r/kcASncosCyOiIrG8
	2yNoajZIphKCV8qSG6KCamVwsauwEU0mN5VRPxv+LxBzWvRW2xq/deoY08c6D7CqvwbdOK+uriZ
	X8XHD/x
X-Received: by 2002:a17:903:2ece:b0:2ae:3a77:a1eb with SMTP id d9443c01a7336-2ae3a77a535mr70848245ad.39.1772429491782;
        Sun, 01 Mar 2026 21:31:31 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b9b7:93f7:8c3c:59d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5229cda1sm15196435ad.23.2026.03.01.21.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 21:31:31 -0800 (PST)
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
Subject: [PATCH v3 5/7] PCI: mediatek-gen3: Integrate new pwrctrl API
Date: Mon,  2 Mar 2026 13:31:05 +0800
Message-ID: <20260302053109.1117091-6-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260302053109.1117091-1-wenst@chromium.org>
References: <20260302053109.1117091-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_213132_524413_53118103 
X-CRM114-Status: GOOD (  19.56  )
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
Changes since v2
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
2.53.0.473.g4a7958ca14-goog


