Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D70BC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 15:13:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F227619CD
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 15:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F227619CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GZ5dL3YxM/EA1AwaqdwqV4ZM6068MzZcAWGYxJOjRyg=; b=WUuVsdvy36fmd4+Y67XZRwl1ZU
	yNSopjNlNElPVJiV4dOw60OGi3haPNd97yvVBsUiYpa4zSbCmCxTp4Gfh7IjeoLnB8onatOdHEXk3
	YppMm234/cruk+DUO2LYQEnxcnL9AibTIs+M3Z5pgTQP77gZnX4hC/41gXHV6ImNvj/VWTd9Hit0q
	4irk98xe7R6sq7pwABAk3fyfTnBF878d+7NygJZSmwaG4bkub4dSFTw6tKN6MIo+ejn6U7l0Imy4J
	v91u5YEVGirVzuZJuoiIhQ1vUmSovRIBCPbG+KGI8S/wZikkxyMN3PM3hMbRU7ElX327u3CcJVLl0
	6eQz1wNQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRG3B-00470X-Vb; Tue, 30 Mar 2021 15:13:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRG27-0046iE-Tu; Tue, 30 Mar 2021 15:12:00 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 35B3B619CD;
 Tue, 30 Mar 2021 15:11:52 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lRG22-004i6i-4k; Tue, 30 Mar 2021 16:11:50 +0100
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
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bharat Kumar Gogada <bharatku@xilinx.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 kernel-team@android.com
Subject: [PATCH v3 00/14] PCI/MSI: Getting rid of msi_controller,
 and other cleanups
Date: Tue, 30 Mar 2021 16:11:31 +0100
Message-Id: <20210330151145.997953-1-maz@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: lorenzo.pieralisi@arm.com, bhelgaas@google.com,
 frank-w@public-files.de, treding@nvidia.com, tglx@linutronix.de,
 robh@kernel.org, will@kernel.org, kys@microsoft.com, haiyangz@microsoft.com,
 sthemmin@microsoft.com, mikelley@microsoft.com, wei.liu@kernel.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, ryder.lee@mediatek.com,
 marek.vasut+renesas@gmail.com, yoshihiro.shimoda.uh@renesas.com,
 michal.simek@xilinx.com, paul.walmsley@sifive.com, bharatku@xilinx.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_161156_532072_B80C1B44 
X-CRM114-Status: GOOD (  13.68  )
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

This is a respin of the series described at [1].

* From v2 [2]:
  - Fixed the Xilinx driver, thanks to Bharat for testing it
  - Dropped the no_msi attribute, and solely rely on msi_domain, which
    has the same effect for the only platform that was using it.
  - Fixed compilation on architectures that do not select the generic
    MSI support

* From v1:
  - Extracted the changes dealing with the MSI capture address
    for rcar and xilinx and moved them to separate patches
  - Changed the rcar code to cope with c4e0fec2f7ee ("PCI: rcar: Always
    allocate MSI addresses in 32bit space")
  - Fixed rcar resume code
  - Reworked commit messages
  - Rebased onto v5.12-rc4
  - Collected Acks, and TBs, with thanks.

[1] https://lore.kernel.org/r/20210225151023.3642391-1-maz@kernel.org
[2] https://lore.kernel.org/r/20210322184614.802565-1-maz@kernel.org

Marc Zyngier (13):
  PCI: tegra: Convert to MSI domains
  PCI: rcar: Don't allocate extra memory for the MSI capture address
  PCI: rcar: Convert to MSI domains
  PCI: xilinx: Don't allocate extra memory for the MSI capture address
  PCI: xilinx: Convert to MSI domains
  PCI: hv: Drop msi_controller structure
  PCI/MSI: Drop use of msi_controller from core code
  PCI/MSI: Kill msi_controller structure
  PCI/MSI: Kill default_teardown_msi_irqs()
  PCI/MSI: Let PCI host bridges declare their reliance on MSI domains
  PCI/MSI: Make pci_host_common_probe() declare its reliance on MSI
    domains
  PCI/MSI: Document the various ways of ending up with NO_MSI
  PCI: Refactor HT advertising of NO_MSI flag

Thomas Gleixner (1):
  PCI: mediatek: Advertise lack of built-in MSI handling

 drivers/pci/controller/Kconfig           |   4 +-
 drivers/pci/controller/pci-host-common.c |   1 +
 drivers/pci/controller/pci-hyperv.c      |   4 -
 drivers/pci/controller/pci-tegra.c       | 343 ++++++++++++----------
 drivers/pci/controller/pcie-mediatek.c   |   4 +
 drivers/pci/controller/pcie-rcar-host.c  | 356 +++++++++++------------
 drivers/pci/controller/pcie-xilinx.c     | 246 +++++++---------
 drivers/pci/msi.c                        |  45 +--
 drivers/pci/probe.c                      |   4 +-
 drivers/pci/quirks.c                     |  15 +-
 include/linux/msi.h                      |  17 +-
 include/linux/pci.h                      |   3 +-
 12 files changed, 484 insertions(+), 558 deletions(-)

-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
