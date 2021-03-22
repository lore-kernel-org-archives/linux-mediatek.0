Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D35AC433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 18:54:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4123461990
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 18:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4123461990
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7NhFcycs9TTTY/ZcOgCUQfD2FRUlgcxQLYG1o3oCZQA=; b=DCSADFMWzQRT5dWbAj6m3L7BW
	3ccAdmhmHao2G12OCIC8k+9fO3SiTHXw54ezbaE22NFAt2TMNuu63YfiM2EPuysgPDtvnQokpsBeK
	qcOmusWlCLf6N7mwCxu1YrSISVirm/pKy8+qIgGr1bW+mEjYzNMaUel1oYQt1gGUAOgKvExPamPzA
	mq30W7F/wxmWGnB4KUTJNDFNOgycDNcdCtz3Xic4EEmVyJXl47bNV/lim6v3rGFoYe3YGiVTuZXkM
	8I75hwXpPonckGO/HOAf1KgUArO8bPucxsjRz1BYvQBSi1fUWLmTOfxP4MRq6mv6KjZmhz3q8xOiS
	jY4FkfGpg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOPgv-00CL48-AQ; Mon, 22 Mar 2021 18:54:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOPgL-00CKs1-Co; Mon, 22 Mar 2021 18:53:45 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EDCCF619A0;
 Mon, 22 Mar 2021 18:53:39 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lOPZT-0038p5-4e; Mon, 22 Mar 2021 18:46:35 +0000
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
Subject: [PATCH v2 12/15] PCI/MSI: Let PCI host bridges declare their reliance
 on MSI domains
Date: Mon, 22 Mar 2021 18:46:11 +0000
Message-Id: <20210322184614.802565-13-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20210322_185342_078713_E83D7F72 
X-CRM114-Status: GOOD (  17.48  )
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

The new 'no_msi' attribute solves the problem of advertising the lack
of MSI capability for host bridges that know for sure that there will
be no MSI for their end-points.

However, there is a whole class of host bridges that cannot know
whether MSIs will be provided or not, as they rely on other blocks
to provide the MSI functionnality, using MSI domains.  This is
the case for example on systems that use the ARM GIC architecture.

Introduce a new attribute ('msi_domain') indicating that implicit
dependency, and use this property to set the NO_MSI flag when
no MSI domain is found at probe time.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/probe.c | 2 +-
 include/linux/pci.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 146bd85c037e..bac9f69a06a8 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -925,7 +925,7 @@ static int pci_register_host_bridge(struct pci_host_bridge *bridge)
 	device_enable_async_suspend(bus->bridge);
 	pci_set_bus_of_node(bus);
 	pci_set_bus_msi_domain(bus);
-	if (bridge->no_msi)
+	if (bridge->no_msi || (bridge->msi_domain && !bus->dev.msi_domain))
 		bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
 
 	if (!parent)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 48605cca82ae..d322d00db432 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -551,6 +551,7 @@ struct pci_host_bridge {
 	unsigned int	preserve_config:1;	/* Preserve FW resource setup */
 	unsigned int	size_windows:1;		/* Enable root bus sizing */
 	unsigned int	no_msi:1;		/* Bridge has no MSI support */
+	unsigned int	msi_domain:1;		/* Bridge wants MSI domain */
 
 	/* Resource alignment requirements */
 	resource_size_t (*align_resource)(struct pci_dev *dev,
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
