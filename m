Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1063C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 13:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2YrxzdblVoPuj3DWN5pSWbg6jEvr2tQ06PIRnyBZAE=; b=RNOqb7gfDBoA80bA4/s8SX/9E8
	WgCso2DK4uz3VwenM7tyqxyOH8uVrp/mrsQ9Qy2cIc1DdHD+k/N1B5OxN9UEzBhMTOhzU0c4zmjbx
	yC/9BI2CbbYytlLaeZkAI0GvrfRtcSGM8ifw5ODRQo/kYqqscM96BcYTWvU+HmsoNBxGNRX/8Uv5Q
	OCGnvfhjP5+VB/VDN4FEhkeY6hCYMC4ctoxocXwkhgGBdLQ3OufjNj7i7R+QcO8RbT0L3TRWk3xQO
	8iTM/Uhm/tH3eWZg7/yj+Y3Smu/CIpW/hfj3yWxANFCXYotxkw3Lon5kWgdV6Z+bTS/p9fM0VnrUW
	immNnb0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEAx-00FXS0-2Z;
	Mon, 18 Sep 2023 13:20:31 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEAp-00FXGW-0f;
	Mon, 18 Sep 2023 13:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043223; x=1726579223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cukenIapxUiEiCycbwYwBac+amF+ty4IZL1khZo/lv0=;
  b=Xl3JMKhNcqA1LC9A6ceZ1jMnEGP6CqskfM34dCCSSnmTTSiZlP15iHhx
   4ScJGJTMdKBrOPT5NRwPkEGz/KNMYuygp2PteJb1XRCAul2mqrDDY3pv6
   q6Y2r9F8Kpz0mohu5l+DYtd+xdPLp1aNRnUsSHLSwvY5+9A6bQ/lKhbiM
   ArrwblGmBAR0TTs7iVuUOa6/yURoztBDqUEYg2shf2ibHx6+cSy2aP4s8
   +SUv3L3Ii8HQC1lO6NY2ZMWvR6rMOk/wqozif/BARHTobb9cxvrCmg/FQ
   JFukR2GL3xZl6rKhjJdTXxyyW3o7XyoUCwx1QPJ8xOEFPpfogFUeqzill
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446113464"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446113464"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:12:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811342373"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811342373"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:12:46 -0700
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
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org,
	linux-bluetooth@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 07/13] mt76: Remove unreliable pci_disable_link_state() workaround
Date: Mon, 18 Sep 2023 16:10:57 +0300
Message-Id: <20230918131103.24119-8-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_062023_354300_6196F984 
X-CRM114-Status: GOOD (  18.24  )
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

pci_disable_link_state() was made reliable regardless of ASPM CONFIG
and OS being disallowed to change ASPM states to allow drivers to rely
on pci_disable_link_state() working.

Remove driver working around unreliable pci_disable_link_state() from
mt76 driver and just call pci_disable_link_state() directly.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---

It's a bit unclear which of these devices really need ASPM disabled.
Probably all 76xx given the commit messages that added their disabling
but 79xx seems a lot more uncertain and handwavy.

mt7915 was done without observing any issue in commit 03b3dedc5de1
("mt76: mt7915: disable ASPM").

mt7921 re-enabled aspm in bf3747ae2e25 ("mt76: mt7921: enable aspm by
default").

mt7996 was added with aspm disabled.

I didn't convert these to quirk due to how unclear the situation
currently is (but for 76xx quirk would seem justified as there is
actually some evidence to back aspm being harmful).
---
 drivers/net/wireless/mediatek/mt76/Makefile   |  1 -
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 -
 .../net/wireless/mediatek/mt76/mt7615/pci.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt76x0/pci.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt76x2/pci.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7915/pci.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7996/pci.c   |  2 +-
 drivers/net/wireless/mediatek/mt76/pci.c      | 47 -------------------
 9 files changed, 6 insertions(+), 55 deletions(-)
 delete mode 100644 drivers/net/wireless/mediatek/mt76/pci.c

diff --git a/drivers/net/wireless/mediatek/mt76/Makefile b/drivers/net/wireless/mediatek/mt76/Makefile
index 85c4799be954..cb28cef780a5 100644
--- a/drivers/net/wireless/mediatek/mt76/Makefile
+++ b/drivers/net/wireless/mediatek/mt76/Makefile
@@ -12,7 +12,6 @@ mt76-y := \
 	mmio.o util.o trace.o dma.o mac80211.o debugfs.o eeprom.o \
 	tx.o agg-rx.o mcu.o
 
-mt76-$(CONFIG_PCI) += pci.o
 mt76-$(CONFIG_NL80211_TESTMODE) += testmode.o
 
 mt76-usb-y := usb.o usb_trace.o
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index e8757865a3d0..0869fe03e3d2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1038,7 +1038,6 @@ bool ____mt76_poll_msec(struct mt76_dev *dev, u32 offset, u32 mask, u32 val,
 #define mt76_poll_msec_tick(dev, ...) ____mt76_poll_msec(&((dev)->mt76), __VA_ARGS__)
 
 void mt76_mmio_init(struct mt76_dev *dev, void __iomem *regs);
-void mt76_pci_disable_aspm(struct pci_dev *pdev);
 
 static inline u16 mt76_chip(struct mt76_dev *dev)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
index 9f43e673518b..d43efe4bf9e3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
@@ -43,7 +43,7 @@ static int mt7615_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto error;
 
-	mt76_pci_disable_aspm(pdev);
+	pci_disable_link_state(pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
 
 	map = id->device == 0x7663 ? mt7663e_reg_map : mt7615e_reg_map;
 	ret = mt7615_mmio_probe(&pdev->dev, pcim_iomap_table(pdev)[0],
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c b/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
index 9277ff38b7a2..49c7a63cb1f6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
@@ -181,7 +181,7 @@ mt76x0e_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (ret)
 		return ret;
 
-	mt76_pci_disable_aspm(pdev);
+	pci_disable_link_state(pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
 
 	mdev = mt76_alloc_device(&pdev->dev, sizeof(*dev), &mt76x0e_ops,
 				 &drv_ops);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c b/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
index df85ebc6e1df..de6eb593ab59 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
@@ -85,7 +85,7 @@ mt76x2e_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* RG_SSUSB_CDR_BR_PE1D = 0x3 */
 	mt76_rmw_field(dev, 0x15c58, 0x3 << 6, 0x3);
 
-	mt76_pci_disable_aspm(pdev);
+	pci_disable_link_state(pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
 
 	return 0;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
index 39132894e8ea..8cf9a1a6d851 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
@@ -122,7 +122,7 @@ static int mt7915_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	mt76_pci_disable_aspm(pdev);
+	pci_disable_link_state(pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
 
 	if (id->device == 0x7916 || id->device == 0x790a)
 		return mt7915_pci_hif2_probe(pdev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 3dda84a93717..45a861122926 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -294,7 +294,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 		goto err_free_pci_vec;
 
 	if (mt7921_disable_aspm)
-		mt76_pci_disable_aspm(pdev);
+		pci_disable_link_state(pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
 
 	ops = mt792x_get_mac80211_ops(&pdev->dev, &mt7921_ops,
 				      (void *)id->driver_data, &features);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
index c5301050ff8b..1e84c1f37c37 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/pci.c
@@ -111,7 +111,7 @@ static int mt7996_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	mt76_pci_disable_aspm(pdev);
+	pci_disable_link_state(pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
 
 	if (id->device == 0x7991)
 		return mt7996_pci_hif2_probe(pdev);
diff --git a/drivers/net/wireless/mediatek/mt76/pci.c b/drivers/net/wireless/mediatek/mt76/pci.c
deleted file mode 100644
index 4c1c159fbb62..000000000000
--- a/drivers/net/wireless/mediatek/mt76/pci.c
+++ /dev/null
@@ -1,47 +0,0 @@
-// SPDX-License-Identifier: ISC
-/*
- * Copyright (C) 2019 Lorenzo Bianconi <lorenzo@kernel.org>
- */
-
-#include "mt76.h"
-#include <linux/pci.h>
-
-void mt76_pci_disable_aspm(struct pci_dev *pdev)
-{
-	struct pci_dev *parent = pdev->bus->self;
-	u16 aspm_conf, parent_aspm_conf = 0;
-
-	pcie_capability_read_word(pdev, PCI_EXP_LNKCTL, &aspm_conf);
-	aspm_conf &= PCI_EXP_LNKCTL_ASPMC;
-	if (parent) {
-		pcie_capability_read_word(parent, PCI_EXP_LNKCTL,
-					  &parent_aspm_conf);
-		parent_aspm_conf &= PCI_EXP_LNKCTL_ASPMC;
-	}
-
-	if (!aspm_conf && (!parent || !parent_aspm_conf)) {
-		/* aspm already disabled */
-		return;
-	}
-
-	dev_info(&pdev->dev, "disabling ASPM %s %s\n",
-		 (aspm_conf & PCI_EXP_LNKCTL_ASPM_L0S) ? "L0s" : "",
-		 (aspm_conf & PCI_EXP_LNKCTL_ASPM_L1) ? "L1" : "");
-
-	if (IS_ENABLED(CONFIG_PCIEASPM)) {
-		int err;
-
-		err = pci_disable_link_state(pdev, aspm_conf);
-		if (!err)
-			return;
-	}
-
-	/* both device and parent should have the same ASPM setting.
-	 * disable ASPM in downstream component first and then upstream.
-	 */
-	pcie_capability_clear_word(pdev, PCI_EXP_LNKCTL, aspm_conf);
-	if (parent)
-		pcie_capability_clear_word(parent, PCI_EXP_LNKCTL,
-					   aspm_conf);
-}
-EXPORT_SYMBOL_GPL(mt76_pci_disable_aspm);
-- 
2.30.2


