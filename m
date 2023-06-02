Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A921C7EE29
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 11:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jP5MooC9MNMY04QopXEpG/NF2SZZb+XFkbfdLyZFXJc=; b=op06M2WUKALGWpnlo5BKPGdTYi
	FLyGLK9xja6uXxr3Nn9B8QPzgsIwk3RELhl/ykci2V0wmJ0KM0GBL113pNxzYQmHPRtoZcWIK2sEt
	FQbX3LPud5dY7xuJvHPWHx/QaMNpHE2juXYpMLQmQpgpL3sF/FGVl06Nvb56/niFVcyRHbzGsH4AX
	TeLy7ckpSk10ayiesk+RbkbDx3pnqdsLIkgCpjU3g/VV8lJL7qevVSvYAnpeUWWFb/l/9pqM25s/M
	GFxlJP9wEnd8+54J5X5MHk804empw485w0OngXG4RptyFQjHoiYaZrK6n9jIonfraDLeGokRbnHnC
	bGW29BwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q53GU-006nVJ-0X;
	Fri, 02 Jun 2023 11:48:18 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q53GQ-006nTN-2W;
	Fri, 02 Jun 2023 11:48:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685706494; x=1717242494;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XsRTg2IPZD0lC7HOFGddKJ8iZPHCHHWK5jmT4ycr6tM=;
  b=H7kN/TkO9GuyHn8yZh1Meb5I7kwU9JkpfL3KevldfHpMVueNI08eV32Z
   6snf/j/A9sTYsSrjFgplQGZokglVWuVWQmWFkHuuWYwBDWwkFCSwSEvdz
   Py+0uGy727ZvOvDZeRgv1L0WBnbEdqNyxl8lpTT0UtGYzvs4eJbUbvOar
   sCjONlWFYE6esRESjUqbJC9lElDYEahuH4dL5/J2s50QIM770Lgb1Wtf/
   YethAvptHGnEJgVojG/1yrqWSx9atx1f7sgIYHIBZiOGuzLdXDumsvEzx
   UiKZuelDJ7ooj3cgORRclTURa3HTeHM1BvLt8lLZWWnuyuD5A/xf3CR0N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358279590"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="358279590"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 04:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707819397"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="707819397"
Received: from rspatil-mobl3.gar.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.251.208.112])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 04:47:59 -0700
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [RFC PATCH v1 00/13] PCI/ASPM: Make ASPM in core robust and remove driver workarounds
Date: Fri,  2 Jun 2023 14:47:37 +0300
Message-Id: <20230602114751.19671-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_044814_887446_46E5C7C8 
X-CRM114-Status: GOOD (  17.01  )
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

This series is based on top of the RMW improvements series:
  https://lore.kernel.org/linux-pci/20230517105235.29176-1-ilpo.jarvinen@linux.intel.com/T/#t

Ilpo Järvinen (13):
  PCI/ASPM: Disable ASPM when driver requests it
  PCI/ASPM: Rename pci_enable_link_state() to
    pci_set_default_link_state()
  PCI/ASPM: Improve pci_set_default_link_state() kerneldoc
  PCI/ASPM: Move L0S/L1/sub states mask calculation into a helper
  PCI/ASPM: Add pci_enable_link_state()
  Bluetooth: hci_bcm4377: Convert aspm disable to quirk
  mt76: Remove unreliable pci_disable_link_state() workaround
  e1000e: Remove unreliable pci_disable_link_state{,_locked}()
    workaround
  wifi: ath10k: Use pci_disable/enable_link_state()
  wifi: ath11k: Use pci_disable/enable_link_state()
  wifi: ath12k: Use pci_disable/enable_link_state()
  IB/hfi1: Use pci_disable/enable_link_state()
  misc: rtsx: Use pci_disable/enable_link_state()

 drivers/bluetooth/hci_bcm4377.c               |  20 ---
 drivers/infiniband/hw/hfi1/aspm.c             |  38 +----
 drivers/infiniband/hw/hfi1/pcie.c             |   2 +-
 drivers/misc/cardreader/rts5228.c             |   6 +-
 drivers/misc/cardreader/rts5261.c             |   6 +-
 drivers/misc/cardreader/rtsx_pcr.c            |   8 +-
 drivers/net/ethernet/intel/e1000e/netdev.c    |  77 +---------
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
 drivers/net/wireless/mediatek/mt76/pci.c      |  47 ------
 drivers/pci/controller/vmd.c                  |   2 +-
 drivers/pci/pcie/Makefile                     |   1 +
 drivers/pci/pcie/aspm.c                       | 145 ++++++++++++------
 drivers/pci/pcie/aspm_minimal.c               |  66 ++++++++
 drivers/pci/quirks.c                          |   3 +
 include/linux/pci.h                           |  10 +-
 25 files changed, 203 insertions(+), 270 deletions(-)
 delete mode 100644 drivers/net/wireless/mediatek/mt76/pci.c
 create mode 100644 drivers/pci/pcie/aspm_minimal.c

-- 
2.30.2


