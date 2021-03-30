Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68B8C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 15:14:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CDBC619CF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 15:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CDBC619CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Db71nXTKaWxto8kB6XtQwKs3jcTcIuEPviXMncD8/sg=; b=V5n46gzD76ITGG9bCzqFFSN26
	sx54aebFgGsRVWxUzi5i8Z8VnESlrSVTSkWfiTelyt7OeZKon4Mdx2FV6g1Yz0PP5vPcsTaVP+88B
	XG2I2p1pn0o7KazIagfBVmxQl6/UQ/rw7fM4UzozUVos4OnuCChFy/oGUhmBF97kF4YBzRXw5c8p/
	9Q7qqlkAtWlK2A1vG+ugDyTT4DfMycRI9/ZEokKlJMr+rwhCLHzfTlbF7eSnAOkoRRTpm0VJzyRN8
	3JvMwcqHnJmxFKkgs4o85Bw9H7Iz0fKPsjujBI9lUbCn0O4s2qV1vRrZ/kXH/HR3hGwEsg8Q/YAF8
	nxkIkMwMw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRG4a-0047f3-VN; Tue, 30 Mar 2021 15:14:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRG2D-0046lI-W9; Tue, 30 Mar 2021 15:12:06 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B5767619D1;
 Tue, 30 Mar 2021 15:12:00 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lRG2B-004i6i-2y; Tue, 30 Mar 2021 16:11:59 +0100
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
Subject: [PATCH v3 09/14] PCI/MSI: Kill default_teardown_msi_irqs()
Date: Tue, 30 Mar 2021 16:11:40 +0100
Message-Id: <20210330151145.997953-10-maz@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330151145.997953-1-maz@kernel.org>
References: <20210330151145.997953-1-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20210330_161204_770484_8AB124D7 
X-CRM114-Status: GOOD (  14.46  )
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

It doesn't have any caller left.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/msi.c   | 11 +----------
 include/linux/msi.h |  1 -
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
index 79b5a995bd02..d9c73c173c14 100644
--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -94,11 +94,7 @@ int __weak arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
 	return 0;
 }
 
-/*
- * We have a default implementation available as a separate non-weak
- * function, as it is used by the Xen x86 PCI code
- */
-void default_teardown_msi_irqs(struct pci_dev *dev)
+void __weak arch_teardown_msi_irqs(struct pci_dev *dev)
 {
 	int i;
 	struct msi_desc *entry;
@@ -108,11 +104,6 @@ void default_teardown_msi_irqs(struct pci_dev *dev)
 			for (i = 0; i < entry->nvec_used; i++)
 				arch_teardown_msi_irq(entry->irq + i);
 }
-
-void __weak arch_teardown_msi_irqs(struct pci_dev *dev)
-{
-	return default_teardown_msi_irqs(dev);
-}
 #endif /* CONFIG_PCI_MSI_ARCH_FALLBACKS */
 
 static void default_restore_msi_irq(struct pci_dev *dev, int irq)
diff --git a/include/linux/msi.h b/include/linux/msi.h
index 3f21e77b57b7..6aff469e511d 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -250,7 +250,6 @@ int arch_setup_msi_irq(struct pci_dev *dev, struct msi_desc *desc);
 void arch_teardown_msi_irq(unsigned int irq);
 int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type);
 void arch_teardown_msi_irqs(struct pci_dev *dev);
-void default_teardown_msi_irqs(struct pci_dev *dev);
 #else
 static inline int arch_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
 {
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
