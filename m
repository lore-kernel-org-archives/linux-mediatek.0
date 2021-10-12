Return-Path: <SRS0=GRN7=PA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BB9AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 08:05:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3023260E05
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 08:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3023260E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KrA47TiBoDlUVjJNTO1w98ykCYblXgeAazNzAz8tdlA=; b=4O0uuHpu7AX8Me
	h3GpA0bJK2+Z2pihWAjBxt++UMKwScy6KK11i1uYj7ir1vXRxNb4MNr5oFKiADCchWXrNXfRJTswp
	iE8MY6xvIQwvNwXgW160SFtgW4/rReqZKgkxyWmrpC4iQBCXVotCyiDUd+0EMkkxW3F7f11HEy/Is
	K/+2wI0NW/X2d4mXGT+8gFr9vX1frUAfj21fuVLeZyx0PaHXnWBtX5AtEzmHc31KrBeCqVKvVDd6o
	oliBNGw2AVvxWe5kvqK1PLTKnBo3BuDKWvlMYU4AUxeh7UxwhAckgGbGOy6NMq37wWtRh1/zltLAs
	365Qfab7YnQ5vjYy4N/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maCms-00BuyB-Os; Tue, 12 Oct 2021 08:05:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maCjk-00BtWa-C3; Tue, 12 Oct 2021 08:02:16 +0000
X-UUID: f2eac9adf0f54bed91d990a66aa41eb1-20211012
X-UUID: f2eac9adf0f54bed91d990a66aa41eb1-20211012
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mingchuang.qiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1104488678; Tue, 12 Oct 2021 01:02:07 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Oct 2021 00:56:53 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 12 Oct 2021 15:56:49 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 12 Oct 2021 15:56:48 +0800
From: <mingchuang.qiao@mediatek.com>
To: <bhelgaas@google.com>, <matthias.bgg@gmail.com>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <mingchuang.qiao@mediatek.com>, <haijun.liu@mediatek.com>,
 <lambert.wang@mediatek.com>, <kerun.zhu@mediatek.com>, <rjw@rjwysocki.net>,
 <alex.williamson@redhat.com>, <utkarsh.h.patel@intel.com>,
 <mika.westerberg@linux.intel.com>, <rajatja@google.com>
Subject: [v5] PCI: Avoid unsync of LTR mechanism configuration
Date: Tue, 12 Oct 2021 15:56:14 +0800
Message-ID: <20211012075614.54576-1-mingchuang.qiao@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 641A7F88397021256AFDB3C2C859A85B7615E10DB2369B6D7FA859C9FBF72CAB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_010212_488433_E39EFF5D 
X-CRM114-Status: GOOD (  16.59  )
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

From: Mingchuang Qiao <mingchuang.qiao@mediatek.com>

In bus scan flow, the "LTR Mechanism Enable" bit of DEVCTL2 register is
configured in pci_configure_ltr(). If device and bridge both support LTR
mechanism, the "LTR Mechanism Enable" bit of device and bridge will be
enabled in DEVCTL2 register. And pci_dev->ltr_path will be set as 1.

If PCIe link goes down, the "LTR Mechanism Enable" bit of bridge will 
change to 0 according to PCIe r5.0, sec 7.5.3.16. However, the ->ltr_path 
of bridge is still set.

Following shows two scenarios of this LTR issue:

-scenario of device restore
 -- bridge LTR enabled
 -- device LTR enabled
 -- reset device
 -- link goes down, bridge disables LTR
 -- link comes back up, LTR disabled in both bridge and device
 -- restore device state, including LTR enable
 -- device sends LTR message
 -- bridge reports Unsupported Request

-scenario of device hot-remove/hot-add
 -- bridge LTR enabled
 -- device LTR enabled
 -- hot-remove device
 -- link goes down, bridge disables LTR
 -- hot-add device and link comes back up
 -- scan device, set LTR enable bit of device
 -- device sends LTR message
 -- bridge reports Unsupported Request

This issue was noticed by AER log as following shows:
pcieport 0000:00:1d.0: AER: Uncorrected (Non-Fatal) error received: id=00e8
pcieport 0000:00:1d.0: PCIe Bus Error: severity=Uncorrected (Non-Fatal), 
type=Transaction Layer, id=00e8(Requester ID)
pcieport 0000:00:1d.0:   device [8086:9d18] error 
status/mask=00100000/00010000
pcieport 0000:00:1d.0:    [20] Unsupported Request    (First)

It was also noticed when PCIe devices (thunderbolt docks) were hot removed 
from chromebooks, and then hot-plugged back again. Once hotplugged back, 
the newer Intel chromebooks fail to go into S0ix low power state because 
of this LTR issue.(https://patchwork.kernel.org/project/linux-pci/patch/
20210204095125.9212-1-mingchuang.qiao@mediatek.com/)

To resolve this issue, check and re-configure "LTR Mechanism Enable" bit
of bridge to make "LTR Mechanism Enable" bit match ltr_path value in
following conditions.
   -before configuring device's LTR for hot-remove/hot-add
   -before restoring device's DEVCTL2 register when restore device state

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Signed-off-by: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
---
changes of v5
 -add more details in commit message
changes of v4
 -fix typo of commit message
 -rename: pci_reconfigure_bridge_ltr()->pci_bridge_reconfigure_ltr()
changes of v3
 -call pci_reconfigure_bridge_ltr() in probe.c
changes of v2
 -modify patch description
 -reconfigure bridge's LTR before restoring device DEVCTL2 register
---
 drivers/pci/pci.c   | 25 +++++++++++++++++++++++++
 drivers/pci/pci.h   |  1 +
 drivers/pci/probe.c | 13 ++++++++++---
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b9fecc25d213..6bf65d295331 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1437,6 +1437,24 @@ static int pci_save_pcie_state(struct pci_dev *dev)
 	return 0;
 }
 
+void pci_bridge_reconfigure_ltr(struct pci_dev *dev)
+{
+#ifdef CONFIG_PCIEASPM
+	struct pci_dev *bridge;
+	u32 ctl;
+
+	bridge = pci_upstream_bridge(dev);
+	if (bridge && bridge->ltr_path) {
+		pcie_capability_read_dword(bridge, PCI_EXP_DEVCTL2, &ctl);
+		if (!(ctl & PCI_EXP_DEVCTL2_LTR_EN)) {
+			pci_dbg(bridge, "re-enabling LTR\n");
+			pcie_capability_set_word(bridge, PCI_EXP_DEVCTL2,
+						 PCI_EXP_DEVCTL2_LTR_EN);
+		}
+	}
+#endif
+}
+
 static void pci_restore_pcie_state(struct pci_dev *dev)
 {
 	int i = 0;
@@ -1447,6 +1465,13 @@ static void pci_restore_pcie_state(struct pci_dev *dev)
 	if (!save_state)
 		return;
 
+	/*
+	 * Downstream ports reset the LTR enable bit when link goes down.
+	 * Check and re-configure the bit here before restoring device.
+	 * PCIe r5.0, sec 7.5.3.16.
+	 */
+	pci_bridge_reconfigure_ltr(dev);
+
 	cap = (u16 *)&save_state->cap.data[0];
 	pcie_capability_write_word(dev, PCI_EXP_DEVCTL, cap[i++]);
 	pcie_capability_write_word(dev, PCI_EXP_LNKCTL, cap[i++]);
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 5c59365092fa..b3a5e5287cb7 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -111,6 +111,7 @@ void pci_free_cap_save_buffers(struct pci_dev *dev);
 bool pci_bridge_d3_possible(struct pci_dev *dev);
 void pci_bridge_d3_update(struct pci_dev *dev);
 void pci_bridge_wait_for_secondary_bus(struct pci_dev *dev);
+void pci_bridge_reconfigure_ltr(struct pci_dev *dev);
 
 static inline void pci_wakeup_event(struct pci_dev *dev)
 {
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 953f15abc850..ade055e9fb58 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2132,9 +2132,16 @@ static void pci_configure_ltr(struct pci_dev *dev)
 	 * Complex and all intermediate Switches indicate support for LTR.
 	 * PCIe r4.0, sec 6.18.
 	 */
-	if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT ||
-	    ((bridge = pci_upstream_bridge(dev)) &&
-	      bridge->ltr_path)) {
+	if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT) {
+		pcie_capability_set_word(dev, PCI_EXP_DEVCTL2,
+					 PCI_EXP_DEVCTL2_LTR_EN);
+		dev->ltr_path = 1;
+		return;
+	}
+
+	bridge = pci_upstream_bridge(dev);
+	if (bridge && bridge->ltr_path) {
+		pci_bridge_reconfigure_ltr(dev);
 		pcie_capability_set_word(dev, PCI_EXP_DEVCTL2,
 					 PCI_EXP_DEVCTL2_LTR_EN);
 		dev->ltr_path = 1;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
