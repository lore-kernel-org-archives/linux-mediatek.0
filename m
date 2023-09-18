Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F23C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 13:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BYHy1LUFdYeTis7ShrLXYt9O3TdX1pbCaBbPDy/udHE=; b=0ScFJxD6UkpTmINDGwc1OeiNb1
	5D9NBBRMvi3/c8A4B52AqHwkVioun1dznBaZpD2gQyeWe7H3Aa2+WOJ7PVntbF/bwWddPfdgj7p3I
	ZD37hWs3Zagu8DvghhezOJBa0DZMrCYJMhM5RPbV74qbZPeCTEd09MlN4/0cif7STRG/ILxgypgJQ
	DAi8Mu4sr5520YDNZTACvA5A3MWFP4kjUD8rC3hEpe8FVTZt3He4cjKSq4yVxCgMPCp9fkE8vWoo3
	XmFsYkECRYtwRmbShzHkijkQe9K8SLX3NcNzrVmX3HRIl5F7+dBaM7d/uTDfivJGuFJeP265e+eLe
	XLt9nARQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE91-00FWQE-2T;
	Mon, 18 Sep 2023 13:18:31 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE8x-00FWOo-0n;
	Mon, 18 Sep 2023 13:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043107; x=1726579107;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Um9SQvE/5HeieZqdelS3qtLTo5NsX9iapqTm1J+iScg=;
  b=JBsD6tllrTA8PfoIFVAI4bGnUqFKbAqKdgijCo3BJAXKGh0UXELkX8d5
   vaf/YxOXtPPQGGOF66uGP1xWcl267j+Ld4s2x5sukJmeTPhFgsCDrRd7K
   bPpiRUtahjMCy7041cAAfsOpOKszVCP40ilLCDqROvHuBj++5QgtsRCmS
   IbisjDedS8NRComhPSzHTVjNtZ8lDZ/y9gmwlR/PcG7JJz8ksu4o+xYft
   CG6QN5oJIDd95BOG48byrOVdTkZhiv2Usrt6Xmz1abKLoGDabwsFKJgpW
   mt7aP9SajstbvkzMkQW12lWPGILp73tKcoeMWQ0E7xVUVdda5y/qRuT0T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446112587"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446112587"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811341354"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811341354"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:11:23 -0700
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
	linux-kernel@vger.kernel.org
Cc: ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 00/13] PCI/ASPM: Make ASPM in core robust and remove driver workarounds
Date: Mon, 18 Sep 2023 16:10:50 +0300
Message-Id: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_061827_392880_54258AEB 
X-CRM114-Status: GOOD (  14.72  )
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

Previously, ASPM service driver has ignored link state management
requests when OS is not authorized to touch LNKCTL (or ASPM is not
configured at all). Because the core interface has not been reliable,
drivers have create workarounds to force ASPM state by directly
writing into LNKCTL themselves.

A second problem is lack of symmetric pair for
pci_disable_link_state(). Any link state disable is permanent (NOTE:
pci_enable_link_state() despite its name is not a symmetric pair for
pci_disable_link_state()). The lack of way to re-enable ASPM prevents
drivers from using pci_disable_link_state() to disabling ASPM for
certain phases of driver operation and re-enabling it later.

Both cases are problematic because when ASPM is working normally
through the service driver, it is not aware of the extra link state
changes drivers perform directly causing the service driver to have
incorrect view about the ASPM state.

Address these problems by making pci_disable_link_state() reliable and
by providing proper pci_enable_link_state() pair for it (the function
currently on the way is renamed first to a more descriptive name).
After core improvements, convert drivers to use the new interface and
drop the workarounds.

v2:
- Rebased the series
- Reorder patches (rename patch first)

Ilpo Järvinen (13):
  PCI/ASPM: Rename pci_enable_link_state() to
    pci_set_default_link_state()
  PCI/ASPM: Improve pci_set_default_link_state() kerneldoc
  PCI/ASPM: Disable ASPM when driver requests it
  PCI/ASPM: Move L0S/L1/sub states mask calculation into a helper
  PCI/ASPM: Add pci_enable_link_state()
  Bluetooth: hci_bcm4377: Convert aspm disable to quirk
  mt76: Remove unreliable pci_disable_link_state() workaround
  e1000e: Remove unreliable pci_disable_link_state{,_locked}()
    workaround
  wifi: ath10k: Use pci_disable/enable_link_state()
  wifi: ath11k: Use pci_disable/enable_link_state()
  wifi: ath12k: Use pci_disable/enable_link_state()
  RDMA/hfi1: Use pci_disable/enable_link_state()
  misc: rtsx: Use pci_disable/enable_link_state()

 drivers/bluetooth/hci_bcm4377.c               |  20 ---
 drivers/infiniband/hw/hfi1/aspm.c             |  38 +-----
 drivers/infiniband/hw/hfi1/pcie.c             |   2 +-
 drivers/misc/cardreader/rts5228.c             |   6 +-
 drivers/misc/cardreader/rts5261.c             |   6 +-
 drivers/misc/cardreader/rtsx_pcr.c            |   8 +-
 drivers/net/ethernet/intel/e1000e/netdev.c    |  77 +----------
 drivers/net/wireless/ath/ath10k/pci.c         |   8 +-
 drivers/net/wireless/ath/ath11k/pci.c         |  10 +-
 drivers/net/wireless/ath/ath12k/pci.c         |  10 +-
 drivers/net/wireless/mediatek/mt76/Makefile   |   1 -
 drivers/net/wireless/mediatek/mt76/mt76.h     |   1 -
 .../net/wireless/mediatek/mt76/mt7615/pci.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt76x0/pci.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt76x2/pci.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7915/pci.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7996/pci.c   |   2 +-
 drivers/net/wireless/mediatek/mt76/pci.c      |  47 -------
 drivers/pci/controller/vmd.c                  |   2 +-
 drivers/pci/pcie/Makefile                     |   1 +
 drivers/pci/pcie/aspm.c                       | 126 +++++++++++++-----
 drivers/pci/pcie/aspm_minimal.c               |  66 +++++++++
 drivers/pci/quirks.c                          |   3 +
 include/linux/pci.h                           |  10 +-
 25 files changed, 199 insertions(+), 255 deletions(-)
 delete mode 100644 drivers/net/wireless/mediatek/mt76/pci.c
 create mode 100644 drivers/pci/pcie/aspm_minimal.c

-- 
2.30.2


