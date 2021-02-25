Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41450C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 15:11:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9C5964ECE
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 15:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9C5964ECE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xk+tS+7FqlLPmW6yu0M4RSQi2rpZrK9nAQmv80+n+As=; b=CWfSrPs9eEd+5RQ8ZqIvsjgeh
	6uCfBWBU9ApI+OBsPj1w6rvxkfCRABFjQd7kCaarsmLRQ6x6z5zTh6QGzqiZ6cVlEGitFIcM62q26
	i/Qko/U/B47wqpbr8q5hqlkYhWhMOSdJNz40lkqwSVF9kKg7oaaXSG+92n+JVMQGNi3bh0WfRVziv
	aFZUlwUT67HtA0g3RcBtcM/OJzTT1WabUlUlc/+Vh3SyMBquzADsorfUGzmkmuL1ivPG/jBMO3KTq
	AASfkJ9/plUliCOBQnjIX8+C1Ua4Czi+nXMJqijNitvuwv3eBflEK8CIsTLe5lDqEhBsiFGTc5blh
	jgbiMy3ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFIIb-0004tv-7O; Thu, 25 Feb 2021 15:11:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFIIA-0004jz-Um; Thu, 25 Feb 2021 15:11:04 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 16B8764F18;
 Thu, 25 Feb 2021 15:11:02 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lFII8-00Fscv-9B; Thu, 25 Feb 2021 15:11:00 +0000
From: Marc Zyngier <maz@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 04/13] PCI: hyperv: Drop msi_controller structure
Date: Thu, 25 Feb 2021 15:10:14 +0000
Message-Id: <20210225151023.3642391-5-maz@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210225151023.3642391-1-maz@kernel.org>
References: <20210225151023.3642391-1-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20210225_101103_123961_A999BCE0 
X-CRM114-Status: GOOD (  12.19  )
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

The Hyper-V PCI driver still makes use of a msi_controller structure,
but it looks more like a distant leftover than anything actually
useful, since it is initialised to 0 and never used for anything.

Just remove it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/controller/pci-hyperv.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
index 6db8d96a78eb..93dc0fd004a3 100644
--- a/drivers/pci/controller/pci-hyperv.c
+++ b/drivers/pci/controller/pci-hyperv.c
@@ -473,7 +473,6 @@ struct hv_pcibus_device {
 	struct list_head dr_list;
 
 	struct msi_domain_info msi_info;
-	struct msi_controller msi_chip;
 	struct irq_domain *irq_domain;
 
 	spinlock_t retarget_msi_interrupt_lock;
@@ -1866,9 +1865,6 @@ static int create_root_hv_pci_bus(struct hv_pcibus_device *hbus)
 	if (!hbus->pci_bus)
 		return -ENODEV;
 
-	hbus->pci_bus->msi = &hbus->msi_chip;
-	hbus->pci_bus->msi->dev = &hbus->hdev->device;
-
 	pci_lock_rescan_remove();
 	pci_scan_child_bus(hbus->pci_bus);
 	hv_pci_assign_numa_node(hbus);
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
