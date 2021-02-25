Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7A5C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 15:11:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80B7B64F1F
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 15:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80B7B64F1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6cWzIHkfCew5drFjbyL8G+ipfiqyaziEUMdBZHOglDU=; b=KZyXEXZ3EukWIllKq7fVRFgVDd
	cEzWceuHxl5gqyuVVWVBir3qft98uTzBffkAQ0RzVWn4h2wYOD0QzMhbUZtfo+cxn3pH/pScQdQp7
	ucyYFGtHYWxFInn8emPOA/TAELb4tW0ou856S0jioT7O04cSJor4N2I44cU2hBX0dUoAI17lryzMO
	TBwLESHJKnHPABjGyFK2RqaX7+CEUq3hb/L0F6LZx/FCJOt4npBWIuZEuVHswz93zOTgrjl5GfcY9
	kwOM/CdUf0+CPWWACrv+01HJHJx495+ueHs532Dd24Q7f/fzCrtq8TeXITgV+ejjgWR17BYUTX6Oc
	DS++BulQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFIIB-0004kP-Qt; Thu, 25 Feb 2021 15:11:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFII6-0004iX-Nc; Thu, 25 Feb 2021 15:10:59 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8508964F10;
 Thu, 25 Feb 2021 15:10:56 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lFII2-00Fscv-9C; Thu, 25 Feb 2021 15:10:54 +0000
From: Marc Zyngier <maz@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 00/13] PCI: MSI: Getting rid of msi_controller,
 and other cleanups
Date: Thu, 25 Feb 2021 15:10:10 +0000
Message-Id: <20210225151023.3642391-1-maz@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: lorenzo.pieralisi@arm.com, bhelgaas@google.com,
 frank-w@public-files.de, treding@nvidia.com, tglx@linutronix.de,
 robh@kernel.org, will@kernel.org, kys@microsoft.com, haiyangz@microsoft.com,
 sthemmin@microsoft.com, wei.liu@kernel.org, thierry.reding@gmail.com,
 jonathanh@nvidia.com, ryder.lee@mediatek.com, marek.vasut+renesas@gmail.com,
 yoshihiro.shimoda.uh@renesas.com, michal.simek@xilinx.com,
 paul.walmsley@sifive.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_101058_918512_683D9382 
X-CRM114-Status: GOOD (  15.33  )
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
Cc: linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Will Deacon <will@kernel.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <treding@nvidia.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Haiyang Zhang <haiyangz@microsoft.com>, linux-mediatek@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The msi_controller data structure was the first attempt at treating
MSIs like any other interrupt. We replaced it a few years ago with the
generic MSI framework, but as it turns out, some older drivers are
still using it.

This series aims at converting these stragglers, drop msi_controller,
and fix some other nits such as having ways for a host bridge to
advertise whether it supports MSIs or not.

A few notes:

- The Tegra patch is the result of back and forth work with Thierry: I
  wrote the initial patch, which didn't work (I didn't have any HW at
  the time). Thierry made it work, and I subsequently fixed a couple
  of bugs/cleanups. I'm responsible for the result, so don't blame
  Thierry for any of it! FWIW, I'm now running a Jetson TX2 with its
  root fs over NVME, and MSIs are OK.

- RCAR is totally untested, though Marek had a go at a previous
  version. More testing required.

- The xilinx stuff is *really* untested. Paul, if you have a RISC-V
  board that uses it, could you please give it a go? Michal, same
  thing for the stuff you have at hand...

- hyperv: I don't have access to such hypervisor, and no way to test
  it. Help welcomed.

- The patches dealing with the advertising of MSI handling are the
  result of a long discussion that took place here[1]. I took the
  liberty to rejig Thomas' initial patches, and add what I needed for
  the MSI domain stuff. Again, blame me if something is wrong, and not
  Thomas.

Feedback welcome.

	M.

[1] https://lore.kernel.org/r/20201031140330.83768-1-linux@fw-web.de

Marc Zyngier (11):
  PCI: tegra: Convert to MSI domains
  PCI: rcar: Convert to MSI domains
  PCI: xilinx: Convert to MSI domains
  PCI: hyperv: Drop msi_controller structure
  PCI: MSI: Drop use of msi_controller from core code
  PCI: MSI: Kill msi_controller structure
  PCI: MSI: Kill default_teardown_msi_irqs()
  PCI: MSI: Let PCI host bridges declare their reliance on MSI domains
  PCI: Make pci_host_common_probe() declare its reliance on MSI domains
  PCI: MSI: Document the various ways of ending up with NO_MSI
  PCI: quirks: Refactor advertising of the NO_MSI flag

Thomas Gleixner (2):
  PCI: MSI: Let PCI host bridges declare their lack of MSI handling
  PCI: mediatek: Advertise lack of MSI handling

 drivers/pci/controller/Kconfig           |   4 +-
 drivers/pci/controller/pci-host-common.c |   1 +
 drivers/pci/controller/pci-hyperv.c      |   4 -
 drivers/pci/controller/pci-tegra.c       | 343 ++++++++++++-----------
 drivers/pci/controller/pcie-mediatek.c   |   4 +
 drivers/pci/controller/pcie-rcar-host.c  | 342 +++++++++++-----------
 drivers/pci/controller/pcie-xilinx.c     | 238 +++++++---------
 drivers/pci/msi.c                        |  46 +--
 drivers/pci/probe.c                      |   4 +-
 drivers/pci/quirks.c                     |  15 +-
 include/linux/msi.h                      |  17 +-
 include/linux/pci.h                      |   4 +-
 12 files changed, 463 insertions(+), 559 deletions(-)

-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
