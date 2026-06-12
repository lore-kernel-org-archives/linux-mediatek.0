Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B54ECD4F2C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 07:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sWph3N1IPVPF1IPl5m4HgnnTTXcv789OBP34n5CObbU=; b=padMYdTnX7c1KPSkAzW9cFtgdl
	OfiJG7grZY1DBmj0uO5iYid3QD29FRdOJPiyypcYoIlCZo8FlGZ6fOJSx3EmlpoJGahpMk7+s6zm5
	wRlro5tO1kQcgePE20C9xqc7+s9lSyQiHXBBFpHkRH0QCXKtjOwoaJXS0uKA/wr69PgaLwPQh2P6Y
	OFdgSiCCefsZ7GqbAB7pet9FDQRVhr/3vl4eLWkhaI4C4m427tFfCleWUXZO34NWSYxRdgyAwJA3v
	fiHZP8lvKjMmsKNqoN7jOslDlpXYo4orUe4jKqFRBxdObsI4dHk8HEqAeeltByRzjpdOV0BzLR3QW
	xuteG65w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwg6-0000000AVGW-2948;
	Fri, 12 Jun 2026 07:51:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwg3-0000000AVEm-39m1
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 07:51:44 +0000
X-UUID: 8be4c2f4663311f1afed4741b24580c9-20260612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=sWph3N1IPVPF1IPl5m4HgnnTTXcv789OBP34n5CObbU=;
	b=izTLA0HbMzFC9egcnKUKyuR7KlZo5mA+apl18yxW7tKaJeggzIARRvbY1wurVCnyxx2YJLAwMnMI0KN5VPBLKNZjdcNdf4qylObJzuLyqotvgcGhLtLMVFshzlRlut1YwZrKWgFiqKxsyA3BOTtuKwySuEaWyNXRDupVv0MpbuA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:373309bb-4ac2-4a42-80cb-fba27b203e85,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e276073,CLOUDID:d6d47654-902f-47df-afe3-f34f8d753c22,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|865|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 8be4c2f4663311f1afed4741b24580c9-20260612
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1970938360; Fri, 12 Jun 2026 00:51:40 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Jun 2026 15:51:37 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 12 Jun 2026 15:51:37 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <emery.hsin@mediatek.com>,
	<jb.tsai@mediatek.com>, Xiong <xiong.huang@mediatek.com>
Subject: [PATCH 06/20] wifi: mt76: connac2: add per-chip PCIe register definitions
Date: Fri, 12 Jun 2026 15:51:32 +0800
Message-ID: <20260612075136.2577553-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_005143_799477_1BE085A1 
X-CRM114-Status: UNSURE (   8.26  )
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

Add MT_PCIE_MAC_{INT_ENABLE,PM} definitions to mt7921/regs.h and
wire up mt7921_pcie_reg in mt7921_pci_probe() to provide connac2
series chips with their own PCIe register definitions.

This is a preparation patch before enabling MT7928 PCIe support.

Signed-off-by: Xiong <xiong.huang@mediatek.com>
Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c  | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt7921/regs.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 067f6b4142b6..a93cdc1f1c93 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -285,6 +285,10 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 		.drv_own = mt792xe_mcu_drv_pmctrl,
 		.fw_own = mt792xe_mcu_fw_pmctrl,
 	};
+	static const struct mt792x_pcie_reg mt7921_pcie_reg = {
+		.imask = MT_PCIE_MAC_INT_ENABLE,
+		.pm = MT_PCIE_MAC_PM,
+	};
 	static const struct mt792x_irq_map irq_map = {
 		.host_irq_enable = MT_WFDMA0_HOST_INT_ENA,
 		.tx = {
@@ -354,6 +358,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 
 	dev->fw_features = features;
 	dev->hif_ops = &mt7921_pcie_ops;
+	dev->pcie_reg = &mt7921_pcie_reg;
 	dev->irq_map = &irq_map;
 	mt76_mmio_init(&dev->mt76, regs);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regs.h b/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
index 4d9eaf1e0692..75b4e81c7224 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
@@ -78,4 +78,9 @@
 #define MT_WTBL_UPDATE_WLAN_IDX		GENMASK(9, 0)
 #define MT_WTBL_UPDATE_ADM_COUNT_CLEAR	BIT(12)
 
+#define MT_PCIE_MAC_BASE		0x10000
+#define MT_PCIE_MAC(ofs)		(MT_PCIE_MAC_BASE + (ofs))
+#define MT_PCIE_MAC_INT_ENABLE		MT_PCIE_MAC(0x188)
+#define MT_PCIE_MAC_PM			MT_PCIE_MAC(0x194)
+
 #endif
-- 
2.45.2


