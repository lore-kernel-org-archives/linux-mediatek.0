Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A515CD98DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 07:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYrXi9fpXa7s0Qu+ogV+Te6KaCISoc2b1Yw1WPWp/4w=; b=Z7wdn8HBKlGliwB/UUFTcHeO+9
	6v2NCxCq0dMfgmc0u4SCMLX+h2HVlB/87gSnT5MStntdFfQ0q7e4Kc3cjZOfLimy81Y9g4ohOWS3W
	GmBDE9VH47FXyHEWJ1nxUYr7LeVKKqvVfU1K8tm4/GxjRE45Gk1tsFFcXd5XlkvnF2a4gkRHnuckg
	K9CVx7+gxa7mZ1seIC7JsKWLhRoHIrH1mjSQWixnY2KvbiCg0ECGkZFpTiwe7CSw+ygz78h8qZ5k9
	L+SvWBpOPe8qaLETW65aV7XOiPB2VBCq+lCPVPmooEaHlAP5NUknMsEXiJFyQg3c4HUDBJ2f1eSRd
	LPz3x5pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwi8-0000000AVsu-23uJ;
	Fri, 12 Jun 2026 07:53:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwi5-0000000AVqM-3q3f
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 07:53:51 +0000
X-UUID: d632efa2663311f1acbe4559397dec65-20260612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mYrXi9fpXa7s0Qu+ogV+Te6KaCISoc2b1Yw1WPWp/4w=;
	b=JckucV9keq26lG7qgP8v7kLdvzdcPQtT/YZG8t1Kn/rVUmQFqk4DeYgz4gF9zdlvyBomWs+5eFWj8U3QSEmlZ+GdLh0jA36aGbVW6tZDAvOziSa0jVd8gegK9d8VnMNI0haFxsB97dMvLjguWISX9qSi+BFIBBcKQAJH987Z9XI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:0638b017-2b49-474e-93a4-05d63546d398,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e276073,CLOUDID:35da7654-902f-47df-afe3-f34f8d753c22,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d632efa2663311f1acbe4559397dec65-20260612
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1515664303; Fri, 12 Jun 2026 00:53:44 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Jun 2026 15:53:42 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 12 Jun 2026 15:53:42 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <emery.hsin@mediatek.com>,
	<jb.tsai@mediatek.com>, Xiong <xiong.huang@mediatek.com>
Subject: [PATCH 19/20] wifi: mt76: mt7925: add MT7928 per-chip PCIe register definitions
Date: Fri, 12 Jun 2026 15:53:38 +0800
Message-ID: <20260612075339.2578327-4-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260612075339.2578327-1-jb.tsai@mediatek.com>
References: <20260612075339.2578327-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_005349_955608_CB0A3B27 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

From: Emery Hsin <emery.hsin@mediatek.com>

MT7928 maps PCIe MAC registers through base 0x74040000. Add
MT7928_PCIE_MAC_{INT_ENABLE,PM} macros and override dev->pcie_reg
at probe time for MT7928 hardware.

Signed-off-by: Xiong <xiong.huang@mediatek.com>
Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c  | 6 ++++++
 drivers/net/wireless/mediatek/mt76/mt7925/regs.h | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 719f53ddf1eb..1ad5847d4a8c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -473,6 +473,11 @@ static const struct mt792x_pcie_reg mt7925_pcie_reg = {
 	.pm = MT7925_PCIE_MAC_PM,
 };
 
+static const struct mt792x_pcie_reg mt7928_pcie_reg = {
+	.imask = MT7928_PCIE_MAC_INT_ENABLE,
+	.pm = MT7928_PCIE_MAC_PM,
+};
+
 static const struct mt792x_irq_map mt7925_irq_map = {
 	.host_irq_enable = MT_WFDMA0_HOST_INT_ENA,
 	.tx = {
@@ -609,6 +614,7 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	dev->pcie_reg = &mt7925_pcie_reg;
 
 	if (is_mt7928_hw) {
+		dev->pcie_reg = &mt7928_pcie_reg;
 		dev->irq_map = &mt7928_irq_map;
 		mdev->rev = 0x7928 << 16;
 	} else if (is_mt7927_hw) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regs.h b/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
index af6291fc53cd..cb937d565a80 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
@@ -114,6 +114,11 @@
 #define MT7925_PCIE_MAC_INT_ENABLE	MT7925_PCIE_MAC(0x188)
 #define MT7925_PCIE_MAC_PM		MT7925_PCIE_MAC(0x194)
 
+#define MT7928_PCIE_MAC_BASE		0x74040000
+#define MT7928_PCIE_MAC(ofs)		(MT7928_PCIE_MAC_BASE + (ofs))
+#define MT7928_PCIE_MAC_INT_ENABLE	MT7928_PCIE_MAC(0x188)
+#define MT7928_PCIE_MAC_PM		MT7928_PCIE_MAC(0x194)
+
 #define MT_DMASHDL_LITE_BASE			0x20026200
 #define MT_DMASHDL_LITE(ofs)			(MT_DMASHDL_LITE_BASE + (ofs))
 #define MT_DMASHDL_LITE_MAIN_CONTROL		MT_DMASHDL_LITE(0x004)
-- 
2.45.2


