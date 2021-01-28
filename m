Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60939C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 10:10:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6B8364DBD
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 10:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6B8364DBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=833IVITdA/PZ41s+eJVuCOhy0sn942N7gqtZYywEoO0=; b=U/43qmxJzH/0YFFDI6i3t31usn
	264EU05gpY+/318Hpbnwi+ymdDtciDCvuka6QeMSaml3iz/QrBqn9YRFvrm4RbTNrC3V9yxEOX7iY
	BbihOjPoAl1NWpt7lRM7Y2h/E3se8my93m7DXExXiWggsXVnegwti+ErcO4+7APfkLkBu3tKOKR8M
	k7BquMpyIuTZSIztHIfylWoRtK81ETFxQkT0gr6HaK1Oo32GteHUhgJdWsG+y1YSwUOGUWFB4Gw6g
	qe/Oez2qALxlb9t+6QIUF0EtpIYeKlZnqyN0s8joviaOeuknJMRKGminLybylLciiAoSZHKRjFVXl
	/90WORUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l54Ft-0000EZ-HV; Thu, 28 Jan 2021 10:10:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l54Fr-0000DX-Nz; Thu, 28 Jan 2021 10:10:24 +0000
X-UUID: 5fcd537c32124c51a51b1e50c1803f77-20210128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=4IK9jdUP/+9o12Q2Z2gnHGjv+cdCrjUnCtGVYV+uXkI=; 
 b=LRz9ZM4eyki9WUACnrozgwOfzqkb5E6qeQ+gmDRn6gOSDw62FGMncd7Vq3ZxsCRpTCN8kJzvdJcl57L7drNjJuW1Wrg31zWn2PcsLTu2Gc1oWqW0Vm3fkLrM2bB7CipCiSbiKhGioB/xz09wLGJsC9z4DYUp0OtKsJmo/2TaET8=;
X-UUID: 5fcd537c32124c51a51b1e50c1803f77-20210128
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mingchuang.qiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 18467090; Thu, 28 Jan 2021 02:06:09 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Jan 2021 02:05:46 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 28 Jan 2021 18:05:34 +0800
Received: from mcddlt001.mediatek.inc (10.19.240.15) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 Jan 2021 18:05:34 +0800
From: <mingchuang.qiao@mediatek.com>
To: <bhelgaas@google.com>, <matthias.bgg@gmail.com>
Subject: [v2] PCI: Avoid unsync of LTR mechanism configuration
Date: Thu, 28 Jan 2021 18:05:31 +0800
Message-ID: <20210128100531.2694-1-mingchuang.qiao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: F6A356DF7791F0854E1DE6CABFFA9C33DDDF10543AF8572B337683DD4611E8382000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_051023_952972_FD8F530F 
X-CRM114-Status: GOOD (  12.78  )
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
---
 drivers/pci/pci.c   | 25 +++++++++++++++++++++++++
 drivers/pci/probe.c | 19 ++++++++++++++++---
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b9fecc25d213..88b4eb70c252 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1437,6 +1437,24 @@ static int pci_save_pcie_state(struct pci_dev *dev)
 	return 0;
 }
 
+static void pci_reconfigure_bridge_ltr(struct pci_dev *dev)
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
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 953f15abc850..4ad172517fd2 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2132,9 +2132,22 @@ static void pci_configure_ltr(struct pci_dev *dev)
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
+		pcie_capability_read_dword(bridge, PCI_EXP_DEVCTL2, &ctl);
+		if (!(ctl & PCI_EXP_DEVCTL2_LTR_EN)) {
+			pci_dbg(bridge, "re-enabling LTR\n");
+			pcie_capability_set_word(bridge, PCI_EXP_DEVCTL2,
+						 PCI_EXP_DEVCTL2_LTR_EN);
+		}
+
 		pcie_capability_set_word(dev, PCI_EXP_DEVCTL2,
 					 PCI_EXP_DEVCTL2_LTR_EN);
 		dev->ltr_path = 1;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
