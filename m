Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4AA9C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 18:47:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AE18619A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 18:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AE18619A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=928NATSSIgIQJ3jPL2+f/bCkX9YU5doUI8jGxqckYLw=; b=YUe3S9ouunuomtbhvy2LCa8s5
	qIOZiwS5YL+g6wB31jnReD+rscbxKZ2lUS5WVrYow2JdHhTR91ZiX0JyrW3WKZ65xzymXLf1l23ra
	dJqVww/dK6U8gfP1rKYxOOuj/gLsP8pIh7oqpvPQ8tNVUcV3PPurJ4E213HuDH2vGOLliKnoJCOeX
	5Hehnt3w0UVCbSqTpLTDuKHr6GMbfDsbofse6HlAFpEs/ViiuFSOwLfgR3y9HkkwBhZc5viDXQUwY
	c5+RrjGtMQuW3Agi50NqsN/WZhtNIV8aE34trHJxL7/zoeBrqFdMM5WIVn8MJZ2/fiMChtGWqmqRa
	JDt2F0RLA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOPab-00CIUF-1w; Mon, 22 Mar 2021 18:47:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOPZO-00CICR-CD; Mon, 22 Mar 2021 18:46:32 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FCAE61984;
 Mon, 22 Mar 2021 18:46:29 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lOPZL-0038p5-ED; Mon, 22 Mar 2021 18:46:27 +0000
From: Marc Zyngier <maz@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Thierry Reding <treding@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 kernel-team@android.com
Subject: [PATCH v2 04/15] PCI: xilinx: Don't allocate extra memory for the MSI
 capture address
Date: Mon, 22 Mar 2021 18:46:03 +0000
Message-Id: <20210322184614.802565-5-maz@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322184614.802565-1-maz@kernel.org>
References: <20210322184614.802565-1-maz@kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: lorenzo.pieralisi@arm.com, bhelgaas@google.com,
 frank-w@public-files.de, treding@nvidia.com, tglx@linutronix.de,
 robh@kernel.org, will@kernel.org, kys@microsoft.com, haiyangz@microsoft.com,
 sthemmin@microsoft.com, mikelley@microsoft.com, wei.liu@kernel.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, ryder.lee@mediatek.com,
 marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com,
 michal.simek@xilinx.com, paul.walmsley@sifive.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_184630_709229_19119719 
X-CRM114-Status: GOOD (  15.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

A long cargo-culted behaviour of PCI drivers is to allocate memory
to obtain an address that is fed to the controller as the MSI
capture address (i.e. the MSI doorbell).

But there is no actual requirement for this address to be RAM.
All it needs to be is a suitable aligned address that will
*not* be DMA'd to.

Use the physical address of the 'port' data structure as the MSI
capture address.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pcie-xilinx.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/pcie-xilinx.c b/drivers/pci/controller/pcie-xilinx.c
index fa5baeb82653..3a762ffb0cef 100644
--- a/drivers/pci/controller/pcie-xilinx.c
+++ b/drivers/pci/controller/pcie-xilinx.c
@@ -94,7 +94,6 @@
  * struct xilinx_pcie_port - PCIe port information
  * @reg_base: IO Mapped Register Base
  * @irq: Interrupt number
- * @msi_pages: MSI pages
  * @dev: Device pointer
  * @msi_domain: MSI IRQ domain pointer
  * @leg_domain: Legacy IRQ domain pointer
@@ -103,7 +102,6 @@
 struct xilinx_pcie_port {
 	void __iomem *reg_base;
 	u32 irq;
-	unsigned long msi_pages;
 	struct device *dev;
 	struct irq_domain *msi_domain;
 	struct irq_domain *leg_domain;
@@ -274,10 +272,10 @@ static int xilinx_pcie_msi_setup_irq(struct msi_controller *chip,
 
 	irq_set_msi_desc(irq, desc);
 
-	msg_addr = virt_to_phys((void *)port->msi_pages);
+	msg_addr = virt_to_phys(port);
 
-	msg.address_hi = 0;
-	msg.address_lo = msg_addr;
+	msg.address_hi = upper_32_bits(msg_addr);
+	msg.address_lo = lower_32_bits(msg_addr);
 	msg.data = irq;
 
 	pci_write_msi_msg(irq, &msg);
@@ -330,13 +328,9 @@ static int xilinx_pcie_enable_msi(struct xilinx_pcie_port *port)
 {
 	phys_addr_t msg_addr;
 
-	port->msi_pages = __get_free_pages(GFP_KERNEL, 0);
-	if (!port->msi_pages)
-		return -ENOMEM;
-
-	msg_addr = virt_to_phys((void *)port->msi_pages);
-	pcie_write(port, 0x0, XILINX_PCIE_REG_MSIBASE1);
-	pcie_write(port, msg_addr, XILINX_PCIE_REG_MSIBASE2);
+	msg_addr = virt_to_phys(port);
+	pcie_write(port, upper_32_bit(msg_addr), XILINX_PCIE_REG_MSIBASE1);
+	pcie_write(port, lower_32_bits(msg_addr), XILINX_PCIE_REG_MSIBASE2);
 
 	return 0;
 }
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
