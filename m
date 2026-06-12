Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E86FCD98CE
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 07:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5c1okcwTDGPAqW+/iuTSuD+9fWInU8e+gELJ2WSVLJU=; b=S4QgbPGuQ4yqWDrbRA0IFDmVcu
	PrsUaYCmhuhSjRFX7FSVmQ+mWAW3FkgF4v5uMC9bBwYqj8QMWkGv8D6+o9PMEAGLNuqXsJS/66yWM
	ciEdbAkGnxMDzFQyx1kHe6oDSWVHb4NDbmbjwD8L6OkPQ401D1oOcZaeME6xHV1WpgNq7G7a5fbda
	EDEDl4ByYi7NJpEJg6/72X8FFOsEJtVhdVAgwXrF971Im3C74QpoRKR3PiPaW/kX3HqyLtgJaRCr4
	NuQSt0Ysld7i3Vq4pJ6u7yBGH7ht+YtCxMUVhVrNK/MwfUqd9Q6twwqkjq1Bebfvq+/y1/8Neaail
	1OXwzHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwi6-0000000AVqa-0Kyr;
	Fri, 12 Jun 2026 07:53:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwi3-0000000AVpN-3BlL
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 07:53:49 +0000
X-UUID: d55839c0663311f1afed4741b24580c9-20260612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5c1okcwTDGPAqW+/iuTSuD+9fWInU8e+gELJ2WSVLJU=;
	b=rshBXOXj1scMdPuUlY/ffMfISmZDm66vflYiRTztDA3djUm2+mbmP7+Ttb5ZrGbgy40tn9g6IkAuQL9A5XCbEbUhXeXga7d60arQC3J3IAAL4P7IlJQZMDvGNiKhlwzrUfhteTZVJJhl7TTUnLgdMlL/ksK2wf54IzZW/MOr1Jc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:69941ae7-6ddd-47d8-abe0-78015ac1a4fb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:05536397-22d1-4176-b420-d0d82ac3f01a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d55839c0663311f1afed4741b24580c9-20260612
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2143404524; Fri, 12 Jun 2026 00:53:43 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Jun 2026 15:53:41 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 12 Jun 2026 15:53:41 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <emery.hsin@mediatek.com>,
	<jb.tsai@mediatek.com>, Leon Yen <leon.yen@mediatek.com>
Subject: [PATCH 17/20] wifi: mt76: mt7925: add MMIO register remapping table for MT7928
Date: Fri, 12 Jun 2026 15:53:36 +0800
Message-ID: <20260612075339.2578327-2-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260612075339.2578327-1-jb.tsai@mediatek.com>
References: <20260612075339.2578327-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_005347_805353_D9F9ADC7 
X-CRM114-Status: GOOD (  14.73  )
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

MT7928 has a different physical address layout. Add a dedicated
mt7928_fixed_map[] remapping table and select it at runtime. Set
mdev->rev early in probe for correct chip revision detection.

Signed-off-by: Leon Yen <leon.yen@mediatek.com>
Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/pci.c   | 109 +++++++++++++++++-
 1 file changed, 103 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index f79d4143e38b..719f53ddf1eb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -110,7 +110,7 @@ static u32 mt7925_reg_map_l2(struct mt792x_dev *dev, u32 addr)
 
 static u32 __mt7925_reg_addr(struct mt792x_dev *dev, u32 addr)
 {
-	static const struct mt76_connac_reg_map fixed_map[] = {
+	static const struct mt76_connac_reg_map default_fixed_map[] = {
 		{ 0x830c0000, 0x000000, 0x0001000 }, /* WF_MCU_BUS_CR_REMAP */
 		{ 0x54000000, 0x002000, 0x0001000 }, /* WFDMA PCIE0 MCU DMA0 */
 		{ 0x55000000, 0x003000, 0x0001000 }, /* WFDMA PCIE0 MCU DMA1 */
@@ -164,14 +164,109 @@ static u32 __mt7925_reg_addr(struct mt792x_dev *dev, u32 addr)
 		{ 0x7c500000, 0x060000, 0x200000 },  /* remap */
 		{ 0x0, 0x0, 0x0 } /* End */
 	};
-	int i;
+	/* The remap table was ordered from highest to lowest frequency
+	 * to improve lookup efficiency.
+	 */
+	static const struct mt76_connac_reg_map mt7928_fixed_map[] = {
+		{0x54000000, 0x002000, 0x01000}, /* WFDMA_0 (PCIE0 MCU DMA0) */
+		{0x55000000, 0x003000, 0x01000}, /* WFDMA_1 (PCIE0 MCU DMA1) */
+		{0x57000000, 0x005000, 0x01000}, /* WFDMA_3 (MCU wrap CR) */
+		{0x58000000, 0x006000, 0x01000}, /* WFDMA_4 (PCIE1 MCU DMA0) */
+		{0x59000000, 0x007000, 0x01000}, /* WFDMA_5 (PCIE1 MCU DMA1) */
+		{0x56000000, 0x004000, 0x01000}, /* WFDMA_2 (Reserved) */
+		{0x820D0000, 0x030000, 0x10000}, /* WF_LMAC_TOP (WF_WTBLON) */
+		{0x820C4000, 0x0A8000, 0x04000}, /* WF_LMAC_TOP (WF_UWTBL) */
+		{0x820C0000, 0x008000, 0x04000}, /* WF_UMAC_TOP (PLE) */
+		{0x820C8000, 0x00C000, 0x02000}, /* WF_UMAC_TOP (PSE) */
+		{0x820CC000, 0x00E000, 0x02000}, /* WF_UMAC_TOP (PP) */
+		{0x820F0000, 0x0A0000, 0x00400}, /* WF_LMAC_TOP (WF_CFG) */
+		{0x820F1000, 0x0A0600, 0x00200}, /* WF_LMAC_TOP (WF_TRB) */
+		{0x820F2000, 0x0A0800, 0x00400}, /* WF_LMAC_TOP (WF_AGG) */
+		{0x820F3000, 0x0A0C00, 0x00400}, /* WF_LMAC_TOP (WF_ARB) */
+		{0x820F4000, 0x0A1000, 0x00400}, /* WF_LMAC_TOP (WF_TMAC) */
+		{0x820F5000, 0x0A1400, 0x00800}, /* WF_LMAC_TOP (WF_RMAC) */
+		{0x820F7000, 0x0A1E00, 0x00200}, /* WF_LMAC_TOP (WF_DMA) */
+		{0x820F9000, 0x0A3400, 0x00200}, /* WF_LMAC_TOP (WF_WTBLOFF) */
+		{0x820FA000, 0x0A4000, 0x00200}, /* WF_LMAC_TOP (WF_ETBF) */
+		{0x820FB000, 0x0A4200, 0x00400}, /* WF_LMAC_TOP (WF_LPON) */
+		{0x820FC000, 0x0A4600, 0x00200}, /* WF_LMAC_TOP (WF_INT) */
+		{0x820FD000, 0x0A4800, 0x00800}, /* WF_LMAC_TOP (WF_MIB) */
+		{0x820E0000, 0x020000, 0x00400}, /* WF_LMAC_TOP (WF_CFG) */
+		{0x820E1000, 0x020400, 0x00200}, /* WF_LMAC_TOP (WF_TRB) */
+		{0x820E2000, 0x020800, 0x00400}, /* WF_LMAC_TOP (WF_AGG) */
+		{0x820E3000, 0x020C00, 0x00400}, /* WF_LMAC_TOP (WF_ARB) */
+		{0x820E4000, 0x021000, 0x00400}, /* WF_LMAC_TOP (WF_TMAC) */
+		{0x820E5000, 0x021400, 0x00800}, /* WF_LMAC_TOP (WF_RMAC) */
+		{0x820CE000, 0x021C00, 0x00200}, /* WF_LMAC_TOP (WF_SEC) */
+		{0x820E7000, 0x021E00, 0x00200}, /* WF_LMAC_TOP (WF_DMA) */
+		{0x820CF000, 0x022000, 0x01000}, /* WF_LMAC_TOP (WF_PF) */
+		{0x820E9000, 0x023400, 0x00200}, /* WF_LMAC_TOP (WF_WTBLOFF) */
+		{0x820EA000, 0x024000, 0x00200}, /* WF_LMAC_TOP (WF_ETBF) */
+		{0x820EB000, 0x024200, 0x00400}, /* WF_LMAC_TOP (WF_LPON) */
+		{0x820EC000, 0x024600, 0x00200}, /* WF_LMAC_TOP (WF_INT) */
+		{0x820ED000, 0x024800, 0x00800}, /* WF_LMAC_TOP (WF_MIB) */
+		{0x820CA000, 0x026000, 0x02000}, /* WF_LMAC_TOP (WF_MUCOP) */
+		{0x7C500000, 0x060000, 0x200000}, /* remap */
+		{0x7C000000, 0x0F0000, 0x10000}, /* CONN_INFRA (off2on) */
+		{0x7C060000, 0x0E0000, 0x10000}, /* remap MT_CONN_ON_LPCTL and MT_CONN_ON_MISC */
+		{0x20060000, 0x0E0000, 0x10000}, /* CONN_INFRA conn_host_csr_top */
+		{0x7C010000, 0x100000, 0x10000}, /* CONN_INFRA (gpio clkgen cfg) */
+		{0x7C050000, 0x1A0000, 0x10000}, /* CONN_INFRA SYSRAM */
+		{0x7C080000, 0x190000, 0x10000}, /* CONN_INFRA (coex, pta) */
+		{0x7C070000, 0x180000, 0x10000}, /* CONN_INFRA Semaphore */
+		{0x7C040000, 0x170000, 0x10000}, /* CONN_INFRA (bus, afe) */
+		{0x7C026000, 0x0D6000, 0x0019C}, /* remap DMASHL TOP */
+		{0x20020000, 0x0D0000, 0x0C000}, /* CONN_INFRA wf_dma_host_side_cr */
+		{0x200B0000, 0x050000, 0x10000}, /* CONN_INFRA conn_von_sysram */
+		{0x20090000, 0x150000, 0x08000}, /* CONN_INFRA von_connsys_s0-s7 */
+		{0x7C098000, 0x158000, 0x08000}, /* CONN_INFRA von_connsys_hclk_s0-s7 */
+		{0x20030000, 0x160000, 0x10000}, /* CONN_INFRA CCIF */
+		{0x70000000, 0x1E0000, 0x10000}, /* CONN_INFRA CONN2AP */
+		{0x830C0000, 0x000000, 0x01000}, /* WF_MCU_BUS_CR_REMAP */
+		{0x81020000, 0x0C0000, 0x10000}, /* WF_TOP_MISC_ON */
+		{0x80020000, 0x0B0000, 0x10000}, /* WF_TOP_MISC_OFF */
+		{0x81040000, 0x120000, 0x01000}, /* WF_MCU_CFG_ON */
+		{0x00400000, 0x080000, 0x10000}, /* WF_MCU_SYSRAM */
+		{0x00410000, 0x090000, 0x10000}, /* WF_MCU_SYSRAM (Common driver) */
+		{0x88000000, 0x140000, 0x10000}, /* WF_MCU_CFG_LS */
+		{0x80010000, 0x124000, 0x01000}, /* WF_AXIDMA */
+		{0x81050000, 0x121000, 0x01000}, /* WF_MCU_EINT */
+		{0x81060000, 0x122000, 0x01000}, /* WF_MCU_GPT */
+		{0x81070000, 0x123000, 0x01000}, /* WF_MCU_WDT */
+		{0x830A0000, 0x040000, 0x10000}, /* WF_PHY_MAP0 */
+		{0x83090000, 0x060000, 0x10000}, /* WF_PHY_MAP2 */
+		{0x83000000, 0x110000, 0x10000}, /* WF_PHY_MAP3 */
+		{0x83010000, 0x130000, 0x10000}, /* WF_PHY_MAP4 */
+		{0x81030000, 0x0AE000, 0x00100}, /* WFSYS_AON */
+		{0x81031000, 0x0AE100, 0x00100}, /* WFSYS_AON */
+		{0x81032000, 0x0AE200, 0x00100}, /* WFSYS_AON */
+		{0x81033000, 0x0AE300, 0x00100}, /* WFSYS_AON */
+		{0x81034000, 0x0AE400, 0x00100}, /* WFSYS_AON */
+		{0xE0400000, 0x070000, 0x10000}, /* WF_UMCA_SYSRAM */
+		{0x70010000, 0x1C0000, 0x10000}, /* CB Infra1 */
+		{0x70020000, 0x1F0000, 0x10000}, /* Reserved for CBTOP, can't switch */
+		{0x74040000, 0x1D0000, 0x10000}, /* CB PCIe (cbtop remap) */
+		{0x18010000, 0x100000, 0x10000}, /* remap MT_HW_EMI_CTRL */
+		{0x00000000, 0x000000, 0x00000}, /* END */
+	};
+	const struct mt76_connac_reg_map *fixed_map;
+	size_t array_size;
+	u32 i;
 
 	if (addr < 0x200000)
 		return addr;
 
 	mt7925_reg_remap_restore(dev);
 
-	for (i = 0; i < ARRAY_SIZE(fixed_map); i++) {
+	if (is_mt7928(&dev->mt76)) {
+		fixed_map = mt7928_fixed_map;
+		array_size = ARRAY_SIZE(mt7928_fixed_map);
+	} else {
+		fixed_map = default_fixed_map;
+		array_size = ARRAY_SIZE(default_fixed_map);
+	}
+
+	for (i = 0; i < array_size; i++) {
 		u32 ofs;
 
 		if (addr < fixed_map[i].phys)
@@ -513,12 +608,14 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 	dev->hif_ops = &mt7925_pcie_ops;
 	dev->pcie_reg = &mt7925_pcie_reg;
 
-	if (is_mt7928_hw)
+	if (is_mt7928_hw) {
 		dev->irq_map = &mt7928_irq_map;
-	else if (is_mt7927_hw)
+		mdev->rev = 0x7928 << 16;
+	} else if (is_mt7927_hw) {
 		dev->irq_map = &mt7927_irq_map;
-	else
+	} else {
 		dev->irq_map = &mt7925_irq_map;
+	}
 
 	mt76_mmio_init(&dev->mt76, pcim_iomap_table(pdev)[0]);
 	tasklet_init(&mdev->irq_tasklet, mt792x_irq_tasklet, (unsigned long)dev);
-- 
2.45.2


