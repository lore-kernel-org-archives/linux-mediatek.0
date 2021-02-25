Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF54DC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 15:24:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C95B64F16
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 15:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C95B64F16
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WdMpTA8aC9E7O6Ab7o3/ssxMIOC4rqWNlWBSyqwpuvQ=; b=tT1qoUxyAsUU7s3h2R58W2jyJ
	7wSkX8UmXVKziRSjEP+zNUhCnvovVIXt//C8Jhgt+LELv67PUmBGLlvNDO+KoO8QxcKCukIQ0baQP
	ixODbTYAYVOdIDR5aorP6+Tq9wOpGexDuLZPfdX2HoATTIi8I1hNTMO4n3aSZ85CVzoO8ry86mms+
	ubgVwgRBYJyzogVyOLALDAEnDvnvKqcdt8UOE3RBc3rUkVpqYXbW+adVD20MCz2JyMcRRZPvC4L8m
	uZp8ULmXSQVK3SuUDzm/y+QdXNLUjC0CkNSI/eBcqBRRGUzC5q/Qx0RAAjFK0hVj6UTkAcZE20216
	kdYAcSEHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFIUd-0007WE-K7; Thu, 25 Feb 2021 15:23:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFIUO-0007SH-Eo; Thu, 25 Feb 2021 15:23:42 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AEE1064ECE;
 Thu, 25 Feb 2021 15:23:37 +0000 (UTC)
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why.lan) by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1lFIIK-00Fscv-9e; Thu, 25 Feb 2021 15:11:12 +0000
From: Marc Zyngier <maz@kernel.org>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 13/13] PCI: quirks: Refactor advertising of the NO_MSI flag
Date: Thu, 25 Feb 2021 15:10:23 +0000
Message-Id: <20210225151023.3642391-14-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20210225_102340_702550_71FFAC50 
X-CRM114-Status: GOOD (  14.62  )
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

The few quirks that deal with NO_MSI tend to be copy-paste heavy.
Refactor them so that the hierarchy of conditions is slightly
cleaner.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/pci/quirks.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 653660e3ba9e..972bb0f9f994 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -2585,10 +2585,8 @@ static int msi_ht_cap_enabled(struct pci_dev *dev)
 /* Check the HyperTransport MSI mapping to know whether MSI is enabled or not */
 static void quirk_msi_ht_cap(struct pci_dev *dev)
 {
-	if (dev->subordinate && !msi_ht_cap_enabled(dev)) {
-		pci_warn(dev, "MSI quirk detected; subordinate MSI disabled\n");
-		dev->subordinate->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
-	}
+	if (!msi_ht_cap_enabled(dev))
+		quirk_disable_msi(dev);
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_SERVERWORKS, PCI_DEVICE_ID_SERVERWORKS_HT2000_PCIE,
 			quirk_msi_ht_cap);
@@ -2601,9 +2599,6 @@ static void quirk_nvidia_ck804_msi_ht_cap(struct pci_dev *dev)
 {
 	struct pci_dev *pdev;
 
-	if (!dev->subordinate)
-		return;
-
 	/*
 	 * Check HT MSI cap on this chipset and the root one.  A single one
 	 * having MSI is enough to be sure that MSI is supported.
@@ -2611,10 +2606,8 @@ static void quirk_nvidia_ck804_msi_ht_cap(struct pci_dev *dev)
 	pdev = pci_get_slot(dev->bus, 0);
 	if (!pdev)
 		return;
-	if (!msi_ht_cap_enabled(dev) && !msi_ht_cap_enabled(pdev)) {
-		pci_warn(dev, "MSI quirk detected; subordinate MSI disabled\n");
-		dev->subordinate->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
-	}
+	if (!msi_ht_cap_enabled(pdev))
+		quirk_msi_ht_cap(dev);
 	pci_dev_put(pdev);
 }
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_NVIDIA, PCI_DEVICE_ID_NVIDIA_CK804_PCIE,
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
