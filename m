Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93737ECAAD5
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 08:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fWzLf+2o2chpqxMuyBDD5OnTzdJietvytSqErA07EVU=; b=D8VJNu365ncdXa6SKJcqG8bZYE
	9S2k/VDFB8VhMtTngY8Q/6Oz8hiqDEIV5Jq44g6dAWJXaKBQha7J/cUVq0YATErJ4JRIUsDuPNGtr
	0Aq9VLMrtObxF97t0wV1/CcDCRQv5Zl2zWL3A+zj8jqYLT3r9fWmtsizvaCB8k7PQxLXSv5MEOttE
	xbgX71hGkB71pStukwbkBq1xnF+7KeFi4lECEtNhoFDziTpw+UgFrUih+3xFWiYjZwo2ZL7HcmylB
	ij+hAUyPCSx6jeOePhdwpgtRYfnaiCIsQbEfsMovAr8eBFKdYIFw9GybwxzBlximk+4QurdUsl4mW
	WkOJaueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXfFP-0081iK-Me; Mon, 12 Sep 2022 08:56:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXfFM-0081gQ-59
	for linux-mediatek@lists.infradead.org; Mon, 12 Sep 2022 08:56:53 +0000
X-UUID: 3412e3bdc2c54d1ebf9d7aee7a56fca6-20220912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=fWzLf+2o2chpqxMuyBDD5OnTzdJietvytSqErA07EVU=;
	b=dCGUSemk+QScKyPANM+fp/VPpTJH/2vbY+yD5GJo3M6tRWXYMhzSWPxj35rsOb4ADU1G+l8+f3R057iDqpCnqm+M+ASmeUK4ufro5ohsY0WagsxVi5QNUJ2tyLaCvH9U368MPLQKBdJZMAy99m8At1I107DyNquSOswZCLwk6wM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:c5228870-1f8c-49d2-ab86-ce2dfe7c19b9,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18,CLOUDID:c39e1dec-2856-4fce-b125-09d4c7ebe045,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3412e3bdc2c54d1ebf9d7aee7a56fca6-20220912
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 274027481; Mon, 12 Sep 2022 01:56:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 12 Sep 2022 16:46:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 12 Sep 2022 16:46:08 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, "Ryder
 Lee" <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>,
	<stable@vger.kernel.org>
Subject: [PATCH v2] wifi: mt76: mt7921e: fix random fw download fail
Date: Mon, 12 Sep 2022 16:45:52 +0800
Message-ID: <1190a401463547e555912ef9417138df4ab2c363.1662972106.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_015652_304316_7F092F2C 
X-CRM114-Status: UNSURE (   9.99  )
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

From: Deren Wu <deren.wu@mediatek.com>

In case of PCIe interoperability problem shows up, the firmware
payload may be corrupted in download stage. Turn off L0s to keep
fw download process accurately.

[ 1093.528363] mt7921e 0000:3b:00.0: Message 00000007 (seq 7) timeout
[ 1093.528414] mt7921e 0000:3b:00.0: Failed to start patch
[ 1096.600156] mt7921e 0000:3b:00.0: Message 00000010 (seq 8) timeout
[ 1096.600207] mt7921e 0000:3b:00.0: Failed to release patch semaphore
[ 1097.699031] mt7921e 0000:3b:00.0: Timeout for driver own
[ 1098.758427] mt7921e 0000:3b:00.0: Timeout for driver own
[ 1099.834408] mt7921e 0000:3b:00.0: Timeout for driver own
[ 1100.915264] mt7921e 0000:3b:00.0: Timeout for driver own
[ 1101.990625] mt7921e 0000:3b:00.0: Timeout for driver own
[ 1103.077587] mt7921e 0000:3b:00.0: Timeout for driver own
[ 1104.173258] mt7921e 0000:3b:00.0: Timeout for driver own
[ 1105.248466] mt7921e 0000:3b:00.0: Timeout for driver own
[ 1106.336969] mt7921e 0000:3b:00.0: Timeout for driver own
[ 1106.397542] mt7921e 0000:3b:00.0: hardware init failed

Cc: stable@vger.kernel.org
Fixes: bf3747ae2e25 ("mt76: mt7921: enable aspm by default")
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
v2: fix typo in commit message
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c     | 1 +
 drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7921/regs.h    | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 9d1ba838e54f..43a8deeb17df 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -148,6 +148,7 @@ static u32 __mt7921_reg_addr(struct mt7921_dev *dev, u32 addr)
 		{ 0x820c8000, 0x0c000, 0x02000 }, /* WF_UMAC_TOP (PSE) */
 		{ 0x820cc000, 0x0e000, 0x01000 }, /* WF_UMAC_TOP (PP) */
 		{ 0x820cd000, 0x0f000, 0x01000 }, /* WF_MDP_TOP */
+		{ 0x74030000, 0x10000, 0x10000 }, /* PCIE_MAC_IREG */
 		{ 0x820ce000, 0x21c00, 0x00200 }, /* WF_LMAC_TOP (WF_SEC) */
 		{ 0x820cf000, 0x22000, 0x01000 }, /* WF_LMAC_TOP (WF_PF) */
 		{ 0x820e0000, 0x20000, 0x00400 }, /* WF_LMAC_TOP BN0 (WF_CFG) */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
index 5efda694fb9d..19facf31e4e1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
@@ -59,6 +59,8 @@ int mt7921e_mcu_init(struct mt7921_dev *dev)
 	if (err)
 		return err;
 
+	mt76_rmw_field(dev, MT_PCIE_MAC_PM, MT_PCIE_MAC_PM_L0S_DIS, 1);
+
 	err = mt7921_run_firmware(dev);
 
 	mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_FWDL], false);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regs.h b/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
index ea643260ceb6..c65582acfa55 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
@@ -440,6 +440,8 @@
 #define MT_PCIE_MAC_BASE		0x10000
 #define MT_PCIE_MAC(ofs)		(MT_PCIE_MAC_BASE + (ofs))
 #define MT_PCIE_MAC_INT_ENABLE		MT_PCIE_MAC(0x188)
+#define MT_PCIE_MAC_PM			MT_PCIE_MAC(0x194)
+#define MT_PCIE_MAC_PM_L0S_DIS		BIT(8)
 
 #define MT_DMA_SHDL(ofs)		(0x7c026000 + (ofs))
 #define MT_DMASHDL_SW_CONTROL		MT_DMA_SHDL(0x004)
-- 
2.18.0


