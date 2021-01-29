Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2971EC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 07:12:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6A2961477
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 07:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6A2961477
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ju6N3enZoK8WAO6Y8AIQApsgU3e8BmY5pcP+Ql1wvvE=; b=Ly7itWvQWuHcw2zOgyOtuO+2Ub
	/KRITI7mJCLAayD2yZNjky3YlrtR1i/lg40kU4AWVBYtBhNwBr31E0Fu+jhRrPdyszdMkxMNI/tYm
	TZ6dDW4Z1/AlYevbKla3CIOdsGOOZxYX4Ujqty/W/5ybN8KUMGmDugDhjqrdAZCvxfchhvUb37K5/
	FQSarMZRd0kY/6JVM91CiEqCWboxWRTx0azMbpUxT50B9c909oeOBldGDDh6+nEb9HPC59A1jWeZp
	bAENxygG7sXVQduHlb8B/5aM+WoOC2FparJ+a1omxbChiL6E13Jbb8Gc9edf08xjDE+LZ7T3mep/r
	4dz137Vg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Nwn-0000PL-GE; Fri, 29 Jan 2021 07:12:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Nwk-0000Oe-V1; Fri, 29 Jan 2021 07:12:00 +0000
X-UUID: 3d19c62ac7ee4b90a14087cb90a2ac96-20210128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Dotr11xV0I8A+Mm2Qxg7vmqoGowQzsRFthVfYwd5JAo=; 
 b=QW4I0yGsvDJ5T4//G06x+FXkmJBtcv+2artZbMLgAgZMszHGGlpXdU9NBuaKEXPjVuogALecHitM897LGjevq5PbtiRIU3aDHskAdjdMWn1X+sDRnA0huSWgsj/4skGJIbQjy70R6iP054PDx8PJeY8Z5RY3ESOdQqSfzn/DigM=;
X-UUID: 3d19c62ac7ee4b90a14087cb90a2ac96-20210128
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <mingchuang.qiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2015893812; Thu, 28 Jan 2021 23:11:54 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 23:11:53 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 29 Jan 2021 15:11:46 +0800
Received: from mcddlt001.mediatek.inc (10.19.240.15) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Jan 2021 15:11:45 +0800
From: <mingchuang.qiao@mediatek.com>
To: <bhelgaas@google.com>, <matthias.bgg@gmail.com>
Subject: [v3] PCI: Avoid unsync of LTR mechanism configuration
Date: Fri, 29 Jan 2021 15:11:37 +0800
Message-ID: <20210129071137.8743-1-mingchuang.qiao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: D09C1C281E76E7598B4674A7DB4AB076AF2D879ACA6C536492D37C5A40A3E4C32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_021159_233253_819BCEBE 
X-CRM114-Status: GOOD (  13.76  )
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
Cc: mika.westerberg@linux.intel.com, kerun.zhu@mediatek.com,
 linux-pci@vger.kernel.org, lambert.wang@mediatek.com, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, alex.williamson@redhat.com,
 linux-mediatek@lists.infradead.org, utkarsh.h.patel@intel.com,
 haijun.liu@mediatek.com, mingchuang.qiao@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Mingchuang Qiao <mingchuang.qiao@mediatek.com>

In bus scan flow, the "LTR Mechanism Enable" bit of DEVCTL2 register is
configured in pci_configure_ltr(). If device and bridge both support LTR
mechanism, the "LTR Mechanism Enable" bit of device and bridge will be
enabled in DEVCTL2 register. And pci_dev->ltr_path will be set as 1.

If PCIe link goes down when device resets, the "LTR Mechanism Enable" bit
of bridge will change to 0 according to PCIe r5.0, sec 7.5.3.16. However,
the pci_dev->ltr_path value of bridge is still 1.

For following conditions, check and re-configure "LTR Mechanism Enable" bit
of bridge to make "LTR Mechanism Enable" bit mtach ltr_path value.
   -before configuring device's LTR for hot-remove/hot-add
   -before restoring device's DEVCTL2 register when restore device state

Signed-off-by: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
---
changes of v2
 -modify patch description
 -reconfigure bridge's LTR before restoring device DEVCTL2 register
changes of v3
 -call pci_reconfigure_bridge_ltr() in probe.c
---
 drivers/pci/pci.c   | 25 +++++++++++++++++++++++++
 drivers/pci/pci.h   |  1 +
 drivers/pci/probe.c | 13 ++++++++++---
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b9fecc25d213..12b557c8f062 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1437,6 +1437,24 @@ static int pci_save_pcie_state(struct pci_dev *dev)
 	return 0;
 }
 
+void pci_reconfigure_bridge_ltr(struct pci_dev *dev)
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
+	pci_reconfigure_bridge_ltr(dev);
+
 	cap = (u16 *)&save_state->cap.data[0];
 	pcie_capability_write_word(dev, PCI_EXP_DEVCTL, cap[i++]);
 	pcie_capability_write_word(dev, PCI_EXP_LNKCTL, cap[i++]);
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 5c59365092fa..a660a01358c5 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -111,6 +111,7 @@ void pci_free_cap_save_buffers(struct pci_dev *dev);
 bool pci_bridge_d3_possible(struct pci_dev *dev);
 void pci_bridge_d3_update(struct pci_dev *dev);
 void pci_bridge_wait_for_secondary_bus(struct pci_dev *dev);
+void pci_reconfigure_bridge_ltr(struct pci_dev *dev);
 
 static inline void pci_wakeup_event(struct pci_dev *dev)
 {
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 953f15abc850..fa6075093f3b 100644
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
+		pci_reconfigure_bridge_ltr(dev);
 		pcie_capability_set_word(dev, PCI_EXP_DEVCTL2,
 					 PCI_EXP_DEVCTL2_LTR_EN);
 		dev->ltr_path = 1;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
