Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B9CC433E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:27:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A1EE207BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 02:27:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DN9AKxVq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A1EE207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U1kdeM1eMMVfJreyROQj92Wz4qPXoqYpp6oQOi88sK0=; b=DN9AKxVq2/ApjGOTmSkfUJXus
	SrpW8siCETOTLtlpAGZOYy1i684W7RkirPmGrSXJaEjY6bd90oscT++67/+3vg+Q175T8BEoXpG4t
	/PB7NiajWK2k4VdGuZMm2OLXuE3GdO2sMnF8SDfTuZwCtQT/USOmo3vVR7qt6gUwbTQVEktojjEAS
	lV8b8NS1ba11WbjWPBG0Y+bOlzcI3D/Or9FeA0t3tkyPNCK4/ldFhd1byhlKP+H67T0McO/4Hk8c6
	xfGCrZvRMFmbnPZ1tgBW0dR2CfFHOvjxYL0/7JQOHttS2FbbhifdyJtjCUyd2ZqI7ONv5BT62BPNt
	7+5jLSkJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4TV-0004SP-P8; Wed, 22 Jul 2020 02:27:17 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4Rw-0003it-Hk; Wed, 22 Jul 2020 02:25:42 +0000
Received: by mail-io1-f68.google.com with SMTP id l17so861085iok.7;
 Tue, 21 Jul 2020 19:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yZX8GtxzIvI0BLawXOSy34dS8zpbVsqdHlUxTpQVpL8=;
 b=O54KOBAdpoZaD6Deu+UYyN5K3avn5e8L6gX3xFs1sWzIX4xuo/OZRoHo4vfp4KQw6s
 iqy6sdPeGtdaBBPItOie7TBmNNhl1WJ0ktllsnIoHdKAyiXzscjWE7gCa5XFkRDVK0GR
 ImbQkSkrf2ZcE09orxJhTJFkS1+35VRQEgnWrydQgc2C+1dOWmoBBk0FZJPParchOaoc
 nPq37fIoS2yIe3upp+I1hfhYudaLQZxHgEh758b+WKgtIIbUsbnUCV93T5ZWFVjLJo9T
 OPEccE8uhGSoLpB4OPSnMlJ22PjaxdZr7EpBianPP9Y9TdXwkhBOZWp1qjqDlVe6kcrj
 pXiQ==
X-Gm-Message-State: AOAM533TEj6xSKTMRlHWJIVeWTV9vi8wbeUZQmQJ69tePXlrNJUZRe9V
 z+WjuNB3ZyJwJGy54ddz7w==
X-Google-Smtp-Source: ABdhPJz4sGi9luyOXYk58mq4r4siCaMJWINiGTp2AvzN9kAFUT92PuxemaSvg8HDlZCOqn4NVsZ7Ww==
X-Received: by 2002:a6b:5502:: with SMTP id j2mr492985iob.204.1595384739849;
 Tue, 21 Jul 2020 19:25:39 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
 by smtp.googlemail.com with ESMTPSA id y2sm11687981iox.22.2020.07.21.19.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:25:39 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH 06/19] PCI: mobiveil: Use pci_is_root_bus() to check if bus is
 root bus
Date: Tue, 21 Jul 2020 20:25:01 -0600
Message-Id: <20200722022514.1283916-7-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200722022514.1283916-1-robh@kernel.org>
References: <20200722022514.1283916-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_222540_969725_9602C87C 
X-CRM114-Status: GOOD (  15.98  )
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

Cc: Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>
Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/mobiveil/pcie-mobiveil-host.c | 10 +++-------
 drivers/pci/controller/mobiveil/pcie-mobiveil.h      |  1 -
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
index 705542b4bd21..7250b84a7efe 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
@@ -29,18 +29,15 @@
 
 static bool mobiveil_pcie_valid_device(struct pci_bus *bus, unsigned int devfn)
 {
-	struct mobiveil_pcie *pcie = bus->sysdata;
-	struct mobiveil_root_port *rp = &pcie->rp;
-
 	/* Only one device down on each root port */
-	if ((bus->number == rp->root_bus_nr) && (devfn > 0))
+	if (pci_is_root_bus(bus) && (devfn > 0))
 		return false;
 
 	/*
 	 * Do not read more than one device on the bus directly
 	 * attached to RC
 	 */
-	if ((bus->primary == rp->root_bus_nr) && (PCI_SLOT(devfn) > 0))
+	if ((bus->primary == to_pci_host_bridge(bus->bridge)->busnr) && (PCI_SLOT(devfn) > 0))
 		return false;
 
 	return true;
@@ -61,7 +58,7 @@ static void __iomem *mobiveil_pcie_map_bus(struct pci_bus *bus,
 		return NULL;
 
 	/* RC config access */
-	if (bus->number == rp->root_bus_nr)
+	if (pci_is_root_bus(bus))
 		return pcie->csr_axi_slave_base + where;
 
 	/*
@@ -606,7 +603,6 @@ int mobiveil_pcie_host_probe(struct mobiveil_pcie *pcie)
 
 	/* Initialize bridge */
 	bridge->sysdata = pcie;
-	bridge->busnr = rp->root_bus_nr;
 	bridge->ops = &mobiveil_pcie_ops;
 	bridge->map_irq = of_irq_parse_and_map_pci;
 	bridge->swizzle_irq = pci_common_swizzle;
diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil.h b/drivers/pci/controller/mobiveil/pcie-mobiveil.h
index 767e36a8522d..6082b8afbc31 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil.h
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil.h
@@ -149,7 +149,6 @@ struct mobiveil_rp_ops {
 };
 
 struct mobiveil_root_port {
-	char root_bus_nr;
 	void __iomem *config_axi_slave_base;	/* endpoint config base */
 	struct resource *ob_io_res;
 	struct mobiveil_rp_ops *ops;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
