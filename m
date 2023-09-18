Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C18CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 13:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qSGf2m7y21UFfyUOcYbqaO6jpD76DQ6RV61twHJZQNA=; b=DqbNHgjgY5UK+5h/ZM4lVHekRV
	mfkBICtRyh05tnBBOuYHXmEYq9dcANCO+osq/fKcDUd6fmrtXq/gMZiznrmSl4NaLXWVwgvAfYNR/
	7yGD1Aj2vsSzKByIMYpWOajR2I6PEb+T8YJLoCqETlm/g6BMrmpeHAkdKfY1QCf1OGo7lLQley/dE
	w9cBaDD0PDoEEIBFgw6ubeLl1zoUwz+e4R2rNDMiTHQBwteHNutb8xUEivZQRWG/4uA+DXN6zAIfM
	cJNFWLU7m5e2n9EXenkrbw7AQJNqFOCRn9Rev9P1yFkESWFf4pMpKM7cWfgE0geherYpWe2M4kUax
	T/1tD85Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEBn-00FYGQ-32;
	Mon, 18 Sep 2023 13:21:24 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEBT-00FXxG-2E;
	Mon, 18 Sep 2023 13:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043263; x=1726579263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kDT+yWJAUHrBQ8ex5Uxk7tCrxharMirq80UQzoJeAvk=;
  b=GYyPIWdowD/ob5GCOQymj+xHB7XGKHUzXBeDVgG+9r2BR4qrKG+ksQux
   PqudH3mL+mT1BCr+OcUZux3wIrGxWX0YU56zjrvB8xjn3dWpiBzsRPWQU
   KB62nX4z+v+UDjzLmteA2zyHcBo8EYEUxAxXUfy/FPWvLlIv1j8DaX2y0
   o6KsNt8eIr21oZ19+BPxzh+E7VnhPOuhbiOpV1VbpM6fwdfxcJ+p/yrxh
   zfr/5COvFuf2fMe3TqRL/KJgLCbogAG3Q5N5wEHM6IDwRP9quTsmy2b2e
   eAozQYmkQ88f53339Cqrezy0Nyr7eNY4BBdCqhVWNt1B4vqVUoeyNQqgF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446113626"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446113626"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:13:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811343130"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811343130"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:13:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	linux-kernel@vger.kernel.org,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org
Cc: ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dean Luick <dean.luick@cornelisnetworks.com>
Subject: [PATCH v2 12/13] RDMA/hfi1: Use pci_disable/enable_link_state()
Date: Mon, 18 Sep 2023 16:11:02 +0300
Message-Id: <20230918131103.24119-13-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_062103_892302_E036FF40 
X-CRM114-Status: GOOD (  12.84  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

IB/hfi1 driver adjusts ASPM state itself which leaves ASPM service
driver in PCI core unaware of the link state changes the driver
implemented.

Call pci_disable_link_state() and pci_enable_link_state() instead of
adjusting ASPMC field in LNKCTL directly in the driver and let PCI core
handle the ASPM state management. Remove the functions that handled the
ASPM changes that are now unnecessary.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Dean Luick <dean.luick@cornelisnetworks.com>
---
 drivers/infiniband/hw/hfi1/aspm.c | 38 +++----------------------------
 drivers/infiniband/hw/hfi1/pcie.c |  2 +-
 2 files changed, 4 insertions(+), 36 deletions(-)

diff --git a/drivers/infiniband/hw/hfi1/aspm.c b/drivers/infiniband/hw/hfi1/aspm.c
index a3c53be4072c..8e3fc1d4c9c6 100644
--- a/drivers/infiniband/hw/hfi1/aspm.c
+++ b/drivers/infiniband/hw/hfi1/aspm.c
@@ -54,45 +54,13 @@ static void aspm_hw_set_l1_ent_latency(struct hfi1_devdata *dd)
 	pci_write_config_dword(dd->pcidev, PCIE_CFG_REG_PL3, reg32);
 }
 
-static void aspm_hw_enable_l1(struct hfi1_devdata *dd)
-{
-	struct pci_dev *parent = dd->pcidev->bus->self;
-
-	/*
-	 * If the driver does not have access to the upstream component,
-	 * it cannot support ASPM L1 at all.
-	 */
-	if (!parent)
-		return;
-
-	/* Enable ASPM L1 first in upstream component and then downstream */
-	pcie_capability_clear_and_set_word(parent, PCI_EXP_LNKCTL,
-					   PCI_EXP_LNKCTL_ASPMC,
-					   PCI_EXP_LNKCTL_ASPM_L1);
-	pcie_capability_clear_and_set_word(dd->pcidev, PCI_EXP_LNKCTL,
-					   PCI_EXP_LNKCTL_ASPMC,
-					   PCI_EXP_LNKCTL_ASPM_L1);
-}
-
-void aspm_hw_disable_l1(struct hfi1_devdata *dd)
-{
-	struct pci_dev *parent = dd->pcidev->bus->self;
-
-	/* Disable ASPM L1 first in downstream component and then upstream */
-	pcie_capability_clear_and_set_word(dd->pcidev, PCI_EXP_LNKCTL,
-					   PCI_EXP_LNKCTL_ASPMC, 0x0);
-	if (parent)
-		pcie_capability_clear_and_set_word(parent, PCI_EXP_LNKCTL,
-						   PCI_EXP_LNKCTL_ASPMC, 0x0);
-}
-
 static  void aspm_enable(struct hfi1_devdata *dd)
 {
 	if (dd->aspm_enabled || aspm_mode == ASPM_MODE_DISABLED ||
 	    !dd->aspm_supported)
 		return;
 
-	aspm_hw_enable_l1(dd);
+	pci_enable_link_state(dd->pcidev, PCI_EXP_LNKCTL_ASPM_L1);
 	dd->aspm_enabled = true;
 }
 
@@ -101,7 +69,7 @@ static  void aspm_disable(struct hfi1_devdata *dd)
 	if (!dd->aspm_enabled || aspm_mode == ASPM_MODE_ENABLED)
 		return;
 
-	aspm_hw_disable_l1(dd);
+	pci_disable_link_state(dd->pcidev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
 	dd->aspm_enabled = false;
 }
 
@@ -254,7 +222,7 @@ void aspm_init(struct hfi1_devdata *dd)
 	/* Start with ASPM disabled */
 	aspm_hw_set_l1_ent_latency(dd);
 	dd->aspm_enabled = false;
-	aspm_hw_disable_l1(dd);
+	pci_disable_link_state(dd->pcidev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
 
 	/* Now turn on ASPM if configured */
 	aspm_enable_all(dd);
diff --git a/drivers/infiniband/hw/hfi1/pcie.c b/drivers/infiniband/hw/hfi1/pcie.c
index 08732e1ac966..767f6cb770b6 100644
--- a/drivers/infiniband/hw/hfi1/pcie.c
+++ b/drivers/infiniband/hw/hfi1/pcie.c
@@ -1182,7 +1182,7 @@ int do_pcie_gen3_transition(struct hfi1_devdata *dd)
 	 * will be enabled if required later
 	 */
 	dd_dev_info(dd, "%s: clearing ASPM\n", __func__);
-	aspm_hw_disable_l1(dd);
+	pci_disable_link_state(dd->pcidev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
 
 	/*
 	 * step 5f: clear DirectSpeedChange
-- 
2.30.2


