Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFE15C433E5
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 18:49:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C54A6195D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 18:49:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C54A6195D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mvYz98Y6rkh4HGJgN4pOSVF6R+yv47ehoMfWr+gKQao=; b=cZuAaG4zYGRMvwjLqYOU6UsP5
	sSUa8Jzi/PCx9aNwS8Mx2epITGM3vENo4R5JV1KiIyFk3B1YpM9r0vlW8t3gPkvH2hASijvveMEGF
	4JzvCzRhBDR4Ayh2cOih7H8m0ud09LhnYB3QTxYYXrXET2Cmg6Z+U2Komi+6ZgVMMnG/pnKbmpCzT
	pKpDMmRoZR7gDxAUk2WVJkakwunpLebDGTLW1I0jljsrQoe2EOWk6e5j7Z66Oh/hVnKwt8fPqZP6o
	JLDLaznu/6BBwUDERdQFiiT/Zk36Ubje6eW+ZT0pazACLyAoFZt0CtoBAL4d2fNSwyfFXHafpl8VF
	aAJLrmziQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOPbs-00CJ5Z-Oj; Mon, 22 Mar 2021 18:49:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOPZS-00CIE1-B6; Mon, 22 Mar 2021 18:46:36 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DAEAD619A7;
 Mon, 22 Mar 2021 18:46:32 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lOPZP-0038p5-6k; Mon, 22 Mar 2021 18:46:31 +0000
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
Subject: [PATCH v2 08/15] PCI/MSI: Kill msi_controller structure
Date: Mon, 22 Mar 2021 18:46:07 +0000
Message-Id: <20210322184614.802565-9-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20210322_184634_816430_A1462671 
X-CRM114-Status: GOOD (  15.25  )
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

msi_controller had a good, long life as the abstraction for
a driver providing MSIs to PCI devices. But it has been replaced
in all drivers by the more expressive generic MSI framework.

Farewell, struct msi_controller.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 include/linux/msi.h | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/include/linux/msi.h b/include/linux/msi.h
index aef35fd1cf11..3f21e77b57b7 100644
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -240,8 +240,7 @@ void pci_msi_unmask_irq(struct irq_data *data);
 /*
  * The arch hooks to setup up msi irqs. Default functions are implemented
  * as weak symbols so that they /can/ be overriden by architecture specific
- * code if needed. These hooks must be enabled by the architecture or by
- * drivers which depend on them via msi_controller based MSI handling.
+ * code if needed. These hooks can only be enabled by the architecture.
  *
  * If CONFIG_PCI_MSI_ARCH_FALLBACKS is not selected they are replaced by
  * stubs with warnings.
@@ -272,19 +271,6 @@ static inline void arch_teardown_msi_irqs(struct pci_dev *dev)
 void arch_restore_msi_irqs(struct pci_dev *dev);
 void default_restore_msi_irqs(struct pci_dev *dev);
 
-struct msi_controller {
-	struct module *owner;
-	struct device *dev;
-	struct device_node *of_node;
-	struct list_head list;
-
-	int (*setup_irq)(struct msi_controller *chip, struct pci_dev *dev,
-			 struct msi_desc *desc);
-	int (*setup_irqs)(struct msi_controller *chip, struct pci_dev *dev,
-			  int nvec, int type);
-	void (*teardown_irq)(struct msi_controller *chip, unsigned int irq);
-};
-
 #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
 
 #include <linux/irqhandler.h>
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
