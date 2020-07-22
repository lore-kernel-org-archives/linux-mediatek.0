Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40727C433EC
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:26:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C867207BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:26:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="puUHxalJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C867207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HPMPJ458B3gPr4hcWjpTuyh0uZElYmAdIBYYGuUFZgU=; b=puUHxalJBIp9XAYec76ooIBkb
	iBi9vJBVkkU6TGvhTQM4rf0PN+pS5eD8JBfxgrZ6g8L0DK72ueBSJpTGv+RooZDXjHIqDVMq6bRS7
	rJmEFkBnifvRu8aTfIxGna8TTiyiOsnAwMyXmPYXtg6r4PfAC8UfCktp0BsfDR6ps6+JurShQTvby
	mDCU4f8l19gR+hP3LhBEy3THjEGOP9HTtHeFm1+0MSzFINhybN6MSEju9vfpbKrCasFm2O7tbRaE3
	BK/CExHC13BYHVZ9El0fLrOZLfh3LFiyHSbNtTDdaRSIkOD+qGm8I8rx7X2uBwrrf7+PGmkndtoIU
	50uSjJumw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4Sc-00043m-2t; Wed, 22 Jul 2020 02:26:22 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4Ro-0003fi-15; Wed, 22 Jul 2020 02:25:33 +0000
Received: by mail-io1-f68.google.com with SMTP id d18so894921ion.0;
 Tue, 21 Jul 2020 19:25:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dM76I8T2hvU/uGGdUwBCUr17ZUHx72+ziEfU2vyCYNg=;
 b=cqwBJrrnf3XEgigMI8VnbHE4O4gRbfJ3etL2V4rQEctUktIPU4Hec9LVNibkucny7/
 7XaBJFlac9woThxt8ox0lI7FGDHTGj3Y6k4pZr2heKQvoj6Z6RtfP6J7dSfOKjkdUtCa
 /hpTKTPwinEiGDWkeOSouL1i+jiBjwYsh1jVFahHy8FVZNFoNMOrTMNj4XgssPlvEcqs
 PKg19+aaOZEJorR6tnMcbwLU3JlTiqRttiRBm2bYiwjh4GLcXq6/vVskAmdfNdZzwIn0
 +8uoBVHfYqJvJaILeLNJJ87+9WFC1YXS0J+KUlNke/QKp0hJwptcg6QdjG/2pwwce7Lg
 yAsg==
X-Gm-Message-State: AOAM531Kq4eCDDvemh9LIDKzE3HOfmNne22D8OJad0htXOhWaajiHFqr
 7pL8SfAPRtYJvMaVnD4C/Q==
X-Google-Smtp-Source: ABdhPJwcM6hSvOl1VwpNPgxDhDu2K5qss0HSHlvrXTBU5Uq0xUO+ETk79Jm1CUbZAU/HX2ngncgWkQ==
X-Received: by 2002:a92:9a4f:: with SMTP id t76mr30984574ili.174.1595384731436; 
 Tue, 21 Jul 2020 19:25:31 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id y2sm11687981iox.22.2020.07.21.19.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:25:30 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 04/19] PCI: aardvark: Use pci_is_root_bus() to check if bus is
 root bus
Date: Tue, 21 Jul 2020 20:24:59 -0600
Message-Id: <20200722022514.1283916-5-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722022514.1283916-1-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_222532_162500_6E5FE5C3 
X-CRM114-Status: GOOD (  14.12  )
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, linux-pci@vger.kernel.org,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Will Deacon <will@kernel.org>, Michal Simek <michal.simek@xilinx.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Murali Karicheri <m-karicheri2@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-renesas-soc@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jingoo Han <jingoohan1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use pci_is_root_bus() rather than tracking the root bus number to
determine if the bus is the root bus or not. This removes storing
duplicated data as well as the need for the host bridge driver to have
to care about the bus numbers in most cases.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/pci-aardvark.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/pci-aardvark.c b/drivers/pci/controller/pci-aardvark.c
index f38663af795c..07d4a75b5c8f 100644
--- a/drivers/pci/controller/pci-aardvark.c
+++ b/drivers/pci/controller/pci-aardvark.c
@@ -195,7 +195,6 @@ struct advk_pcie {
 	DECLARE_BITMAP(msi_used, MSI_IRQ_NUM);
 	struct mutex msi_used_lock;
 	u16 msi_msg;
-	int root_bus_nr;
 	int link_gen;
 	struct pci_bridge_emul bridge;
 	struct gpio_desc *reset_gpio;
@@ -641,7 +640,7 @@ static void advk_sw_pci_bridge_init(struct advk_pcie *pcie)
 static bool advk_pcie_valid_device(struct advk_pcie *pcie, struct pci_bus *bus,
 				  int devfn)
 {
-	if ((bus->number == pcie->root_bus_nr) && PCI_SLOT(devfn) != 0)
+	if (pci_is_root_bus(bus) && PCI_SLOT(devfn) != 0)
 		return false;
 
 	return true;
@@ -659,7 +658,7 @@ static int advk_pcie_rd_conf(struct pci_bus *bus, u32 devfn,
 		return PCIBIOS_DEVICE_NOT_FOUND;
 	}
 
-	if (bus->number == pcie->root_bus_nr)
+	if (pci_is_root_bus(bus))
 		return pci_bridge_emul_conf_read(&pcie->bridge, where,
 						 size, val);
 
@@ -670,7 +669,7 @@ static int advk_pcie_rd_conf(struct pci_bus *bus, u32 devfn,
 	/* Program the control register */
 	reg = advk_readl(pcie, PIO_CTRL);
 	reg &= ~PIO_CTRL_TYPE_MASK;
-	if (bus->primary ==  pcie->root_bus_nr)
+	if (pci_is_root_bus(bus->parent))
 		reg |= PCIE_CONFIG_RD_TYPE0;
 	else
 		reg |= PCIE_CONFIG_RD_TYPE1;
@@ -715,7 +714,7 @@ static int advk_pcie_wr_conf(struct pci_bus *bus, u32 devfn,
 	if (!advk_pcie_valid_device(pcie, bus, devfn))
 		return PCIBIOS_DEVICE_NOT_FOUND;
 
-	if (bus->number == pcie->root_bus_nr)
+	if (pci_is_root_bus(bus))
 		return pci_bridge_emul_conf_write(&pcie->bridge, where,
 						  size, val);
 
@@ -729,7 +728,7 @@ static int advk_pcie_wr_conf(struct pci_bus *bus, u32 devfn,
 	/* Program the control register */
 	reg = advk_readl(pcie, PIO_CTRL);
 	reg &= ~PIO_CTRL_TYPE_MASK;
-	if (bus->primary == pcie->root_bus_nr)
+	if (pci_is_root_bus(bus->parent))
 		reg |= PCIE_CONFIG_WR_TYPE0;
 	else
 		reg |= PCIE_CONFIG_WR_TYPE1;
@@ -1139,7 +1138,7 @@ static int advk_pcie_probe(struct platform_device *pdev)
 		dev_err(dev, "Failed to parse resources\n");
 		return ret;
 	}
-	pcie->root_bus_nr = bus->start;
+	bridge->busnr = bus->start;
 
 	pcie->reset_gpio = devm_gpiod_get_from_of_node(dev, dev->of_node,
 						       "reset-gpios", 0,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
