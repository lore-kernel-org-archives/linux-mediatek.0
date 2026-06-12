Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E10ECD98D6
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQUMpd3xd8ZrJpr/6Z9xwel6PH81ekgZqisB+svUWR8=; b=fUOGdIaMCHnD3Zq1mR3iv9vUoq
	MfCutGI0a2P5oPcXRYmLAWa/fM7/2i65eXOknMDbhGc+5hYY0sb5H945mzBluWjjmexdhO4+MWIAj
	l0NIOeMtwckWSrz91N9rJ1n+EfH3PeTq0Oq0jwA/YL0kS7PN3xzevGgon/X9NOotXHtyQMTUQTpBr
	+CpNtmSdKZSjT2ddfm6S7WFrTSTASxa2xPKSWTcb7pHKbcr6LDOeBjaagOZtIzcIj/MPa7mT1pRT5
	NY/h3VjQTGnAInW4tJhfoLHBmHby8L4bq23gZyYtfg/DQDNwfIoRerMSYiDEQNLR9op6SfdBSknui
	HjFuqbWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwfG-0000000AUxR-07p1;
	Fri, 12 Jun 2026 07:50:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwfD-0000000AUvT-3CsT
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 07:50:52 +0000
X-UUID: 6d42186a663311f1acbe4559397dec65-20260612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=hQUMpd3xd8ZrJpr/6Z9xwel6PH81ekgZqisB+svUWR8=;
	b=rpbP0VF3v51SydVmg7a+vHDP8L7TcVnUL/xY0vHlS3ObKSPGwRCSsbHSkp0ORN65SwUsPeCl2RngYeACI5Jf596DEhWvpz4X9N94cX1P258DtQLjHfUBXefOPGd2zXdlIP2hUagPgX8xRDFzN4PllKa3LGy37jbRf6Sizrvh4J0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:549200c6-79c9-42ac-bc53-2cb2b29084a3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:5546fda4-9ef7-4489-861a-e83b251ece46,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6d42186a663311f1acbe4559397dec65-20260612
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 938672689; Fri, 12 Jun 2026 00:50:48 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Jun 2026 15:50:46 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 12 Jun 2026 15:50:46 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Deren.Wu@mediatek.com>, <Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>,
	<Ryder.Lee@mediatek.com>, <Leon.Yen@mediatek.com>,
	<litien.chang@mediatek.com>, <emery.hsin@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH 04/20] wifi: mt76: mt7925: add MT7927 per-chip rx irq definitions
Date: Fri, 12 Jun 2026 15:50:41 +0800
Message-ID: <20260612075042.2577193-4-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260612075042.2577193-1-jb.tsai@mediatek.com>
References: <20260612075042.2577193-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_005051_818994_F417C971 
X-CRM114-Status: UNSURE (   9.90  )
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

Add MT7927_INT_RX_DONE_{DATA,WM,WM2,ALL} macros and populate
all_complete_mask in mt7927_irq_map. MT7927 maps RX_DONE_DATA to
ENA4 and RX_DONE_WM to ENA6, differing from MT7925.

This is a preparation patch before enabling MT7928 PCIe support.

Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c  | 8 +++++---
 drivers/net/wireless/mediatek/mt76/mt7925/regs.h | 7 +++++++
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 95a0bd615167..8a4fb53c718f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -319,11 +319,13 @@ static const struct mt792x_irq_map mt7927_irq_map = {
 		.mcu_complete_mask = MT_INT_TX_DONE_MCU,
 	},
 	.rx = {
-		.data_complete_mask = MT7927_RX_DONE_INT_ENA4,
-		.wm_complete_mask = MT7927_RX_DONE_INT_ENA6,
-		.wm2_complete_mask = MT7927_RX_DONE_INT_ENA7,
+		.all_complete_mask = MT7927_INT_RX_DONE_ALL,
+		.data_complete_mask = MT7927_INT_RX_DONE_DATA,
+		.wm_complete_mask = MT7927_INT_RX_DONE_WM,
+		.wm2_complete_mask = MT7927_INT_RX_DONE_WM2,
 	},
 };
+
 static int mt7925_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *id)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regs.h b/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
index aed90cc82858..bb5969689337 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
@@ -51,6 +51,13 @@
 					 MT7925_INT_RX_DONE_WM | \
 					 MT_INT_RX_DONE_WM2)
 
+#define MT7927_INT_RX_DONE_DATA		MT7927_RX_DONE_INT_ENA4
+#define MT7927_INT_RX_DONE_WM		MT7927_RX_DONE_INT_ENA6
+#define MT7927_INT_RX_DONE_WM2		MT7927_RX_DONE_INT_ENA7
+#define MT7927_INT_RX_DONE_ALL		(MT7927_INT_RX_DONE_DATA | \
+					 MT7927_INT_RX_DONE_WM | \
+					 MT7927_INT_RX_DONE_WM2)
+
 #define MT_INT_TX_DONE_MCU_WM		(HOST_TX_DONE_INT_ENA15 | \
 					 HOST_TX_DONE_INT_ENA17)
 
-- 
2.45.2


