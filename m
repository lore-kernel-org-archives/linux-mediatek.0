Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D188C43381
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 07:49:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C268322DD3
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 07:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C268322DD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k1BMhgH2QtfuM0aHvEdgp8hzsETlaiNWd7jc0D5th7c=; b=XcLVFxEsc5gzaPA84Cw42UUmED
	fKP7T9P5Zu74VehJlTyqN5K6TEUc4sn4XcUdEtD/RJfWpBlvvaHQNluFlLrdzXr23FY296LbMpwg5
	rgIB6DOpdDKHXkBTio1eFaofHXTpRVu48Fv7I3QuERLSiavzQq/gqr9latypnAEM2qNggJIhl2kIm
	7lBBpZX4zq/BLym5TemFfomLQQsyUV6RFojBd6DBmY3d14EkKrADl7W0BQhm4q6yD8cK23Um6jpSb
	gBUVdD3uHvhDnBQqHvJLrjrfsEqOPJl3elBOfxkCKAGbZR8xX9dfOZJRYeveKcIqcKYO86grXkAmt
	8XN7n9mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzEQE-0006ws-7H; Tue, 12 Jan 2021 07:48:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzEQ7-0006to-OU; Tue, 12 Jan 2021 07:48:53 +0000
X-UUID: 5af3e97d40d6408a9ed7382d9c31ed19-20210111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=QbDUDErbElo9ALLdM2zsuGqQjEHnckJhZ/HcIVbACVo=; 
 b=YnEnpfKLUzlzFsCJU57SyXdYsE9u2kGaw4zQUU9hv5NepmInCSsBPM61BKKX8vgB0pkh70SVJHN3TWjDORay/xscQayvc2dRqgnlDKDNnmfUzi16AgOXyeJQSR1ugktU6VjlKgL0sDvGvJgXdUcoQLK0v5WSX+OZMt7FeaIyzXE=;
X-UUID: 5af3e97d40d6408a9ed7382d9c31ed19-20210111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mingchuang.qiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 671830361; Mon, 11 Jan 2021 23:36:07 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 23:35:33 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 12 Jan 2021 15:35:27 +0800
Received: from mcddlt001.mediatek.inc (10.19.240.15) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Jan 2021 15:35:26 +0800
From: <mingchuang.qiao@mediatek.com>
To: <bhelgaas@google.com>, <matthias.bgg@gmail.com>
Subject: [PATCH] pci: avoid unsync of LTR mechanism configuration
Date: Tue, 12 Jan 2021 15:27:39 +0800
Message-ID: <20210112072739.31624-1-mingchuang.qiao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 138AEC170CF7C40068F5BD0D97B5ACAE2C5FB55A940A1E8A4148BCCA5D1A30852000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_024851_960661_818EABB4 
X-CRM114-Status: GOOD (  13.93  )
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
Cc: kerun.zhu@mediatek.com, linux-pci@vger.kernel.org,
 lambert.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, haijun.liu@mediatek.com,
 mingchuang.qiao@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Mingchuang Qiao <mingchuang.qiao@mediatek.com>

In pci bus scan flow, the LTR mechanism enable bit of DEVCTL2 register
is configured in pci_configure_ltr(). If device and it's bridge both
support LTR mechanism, LTR mechanism of device and it's bridge will
be enabled in DEVCTL2 register. And the flag pci_dev->ltr_path will
be set as 1.

For some pcie products, pcie link becomes down when device reset. And then
the LTR mechanism enable bit of bridge will become 0 based on description
in PCIE r4.0, sec 7.8.16. However, the pci_dev->ltr_path value of bridge
is still 1. Remove and rescan flow could be triggered to recover after
device reset. In the bus rescan flow, the LTR mechanism of device will be
enabled in pci_configure_ltr() due to ltr_path of its bridge is still 1.

When device's LTR mechanism is enabled, device will send LTR message to
bridge. Bridge receives the device's LTR message and found bridge's LTR
mechanism is disabled. Then the bridge will generate unsupported request
and other error handling flow will be triggered such as AER Non-Fatal
error handling.

This patch is used to avoid this unsupported request and make the bridge's
ltr_path value is aligned with DEVCTL2 register value. Check bridge
register value if aligned with ltr_path in pci_configure_ltr(). If
register value is disable and the ltr_path is 1, we need configure
the register value as enable.

Signed-off-by: Mingchuang Qiao <mingchuang.qiao@mediatek.com>
---
 drivers/pci/probe.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 953f15abc850..49355cf4af54 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2132,9 +2132,21 @@ static void pci_configure_ltr(struct pci_dev *dev)
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
