Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0447C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 09:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MngREa3tzTztuZpub6LB7rywTQ1g699xg/PwMcMxFuM=; b=p6ARoydUf5Ix46H8Qm5Cfhs3oT
	1Ry+kTW8pmvSDSB+hQ4QaDaB/vus+CQijCSzPAskzeFBQnIKZG1ti4Dq+qslysH1DPeLY0A8Zn1t/
	kRlYZ1S+Y/jT/GZgmNqNAtM9n26IGZUX2XXBjJ1kGmTewv2g7umIXoL6BXK5yIPIIpdvY44sv3Jd6
	G7Nuy8LKG0s987lwzblaKWIdzSA9zmx4imqa4WAHkk0oUy7875fhlTpf8q483jVvNeaqZShVW9k9U
	nhWG3QKcD/tcSFsKYhQYS8N/1WPQRCjdDUeVZZxr4mvfKZDTSt5Z2R9sMpQgSDYpGRvonX4DCVkEZ
	roFtCqVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAbU-00ExAe-1o;
	Mon, 18 Sep 2023 09:31:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiAbN-00Ex7L-0V
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 09:31:34 +0000
X-UUID: 23bc949e560611ee86758d4a7c00f3a0-20230918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MngREa3tzTztuZpub6LB7rywTQ1g699xg/PwMcMxFuM=;
	b=hWpt9eOukeogWWXAzgf28oVUP5hksEYcoYQOd9yUAxuyj6yEdnWnsurrdxFqHq93CDJQ+XoPqiWYvIq7vyB8hZP7DAQ/0Ed67ym7XFtuK56+SxJURPMjGGsy3t5bHXvANs18NMX2P5pNYRuQ62XaRqXyTN1x+KjC2PLhD55n8wA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:fcc3d620-5b49-4dbe-8889-88c776265c6b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:0ad78a4,CLOUDID:80e927c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 23bc949e560611ee86758d4a7c00f3a0-20230918
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1556487397; Mon, 18 Sep 2023 02:31:26 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 18 Sep 2023 17:31:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 18 Sep 2023 17:31:22 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH v3 04/17] wifi: mt76: mt7925: add regs.h
Date: Mon, 18 Sep 2023 17:30:57 +0800
Message-ID: <ede0ac68424ad68f1c1a507a23bf6b839dd0f8cc.1695024367.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1695024367.git.deren.wu@mediatek.com>
References: <cover.1695024367.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.304100-8.000000
X-TMASE-MatchedRID: GeU+O38vgBfKRSR886eK0gPZZctd3P4BX5TqQagR07e7qpOHKudqcwaT
	alM8C773iXrI0wCok22YXHAnjMx3mbQDrl6zjfI2j5hLPCX3ZdNHpLRuWW8PzGGVufr+eY4v0O+
	nJS4tIxVITWyLnOMoqdbXmuHFRooXAWDNA+xV8d6eAiCmPx4NwGmRqNBHmBveovSVS26nOBcqtq
	5d3cxkNRqXnrxrKCOXw6o82VNWnmSaCKZ+eC1FWSi8LXVMDypk8t5wk9Dx9DgfxWwjEIjvHsxnk
	KiGDpz726KuBJeyZc5PcgUSEE6NWGlbholHGrPfF0aD5ljt43pMcHZD6gqu7wxMjfifIXfowkvV
	oA11Twp+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.304100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3EBE35F4B93E864E00114D96149BC358B7755DD730A21EC62AB5ACBC9F5916DF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_023133_197841_F018B9A4 
X-CRM114-Status: GOOD (  11.14  )
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

(Patches split into one patch per file for easier review, but the final
commit will be one big patch. See the cover letter for more info.)

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/regs.h  | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/regs.h

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regs.h b/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
new file mode 100644
index 000000000000..985794a40c1a
--- /dev/null
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regs.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: ISC */
+/* Copyright (C) 2023 MediaTek Inc. */
+
+#ifndef __MT7925_REGS_H
+#define __MT7925_REGS_H
+
+#include "../mt792x_regs.h"
+
+#define MT_MDP_BASE			0x820cc800
+#define MT_MDP(ofs)			(MT_MDP_BASE + (ofs))
+
+#define MT_MDP_DCR0			MT_MDP(0x000)
+#define MT_MDP_DCR0_DAMSDU_EN		BIT(15)
+#define MT_MDP_DCR0_RX_HDR_TRANS_EN	BIT(19)
+
+#define MT_MDP_DCR1			MT_MDP(0x004)
+#define MT_MDP_DCR1_MAX_RX_LEN		GENMASK(15, 3)
+
+#define MT_MDP_BNRCFR0(_band)		MT_MDP(0x090 + ((_band) << 8))
+#define MT_MDP_RCFR0_MCU_RX_MGMT	GENMASK(5, 4)
+#define MT_MDP_RCFR0_MCU_RX_CTL_NON_BAR	GENMASK(7, 6)
+#define MT_MDP_RCFR0_MCU_RX_CTL_BAR	GENMASK(9, 8)
+
+#define MT_MDP_BNRCFR1(_band)		MT_MDP(0x094 + ((_band) << 8))
+#define MT_MDP_RCFR1_MCU_RX_BYPASS	GENMASK(23, 22)
+#define MT_MDP_RCFR1_RX_DROPPED_UCAST	GENMASK(28, 27)
+#define MT_MDP_RCFR1_RX_DROPPED_MCAST	GENMASK(30, 29)
+#define MT_MDP_TO_HIF			0
+#define MT_MDP_TO_WM			1
+
+#define MT_WFDMA0_HOST_INT_ENA		MT_WFDMA0(0x228)
+#define MT_WFDMA0_HOST_INT_DIS		MT_WFDMA0(0x22c)
+#define HOST_RX_DONE_INT_ENA4		BIT(12)
+#define HOST_RX_DONE_INT_ENA5		BIT(13)
+#define HOST_RX_DONE_INT_ENA6		BIT(14)
+#define HOST_RX_DONE_INT_ENA7		BIT(15)
+#define HOST_RX_DONE_INT_ENA8		BIT(16)
+#define HOST_RX_DONE_INT_ENA9		BIT(17)
+#define HOST_RX_DONE_INT_ENA10		BIT(18)
+#define HOST_RX_DONE_INT_ENA11		BIT(19)
+#define HOST_TX_DONE_INT_ENA15		BIT(25)
+#define HOST_TX_DONE_INT_ENA16		BIT(26)
+#define HOST_TX_DONE_INT_ENA17		BIT(27)
+
+/* WFDMA interrupt */
+#define MT_INT_RX_DONE_DATA		HOST_RX_DONE_INT_ENA2
+#define MT_INT_RX_DONE_WM		HOST_RX_DONE_INT_ENA0
+#define MT_INT_RX_DONE_WM2		HOST_RX_DONE_INT_ENA1
+#define MT_INT_RX_DONE_ALL		(MT_INT_RX_DONE_DATA | \
+					 MT_INT_RX_DONE_WM | \
+					 MT_INT_RX_DONE_WM2)
+
+#define MT_INT_TX_DONE_MCU_WM		(HOST_TX_DONE_INT_ENA15 | \
+					 HOST_TX_DONE_INT_ENA17)
+
+#define MT_INT_TX_DONE_FWDL		HOST_TX_DONE_INT_ENA16
+#define MT_INT_TX_DONE_BAND0		HOST_TX_DONE_INT_ENA0
+
+#define MT_INT_TX_DONE_MCU		(MT_INT_TX_DONE_MCU_WM |	\
+					 MT_INT_TX_DONE_FWDL)
+#define MT_INT_TX_DONE_ALL		(MT_INT_TX_DONE_MCU_WM |	\
+					 MT_INT_TX_DONE_BAND0 |	\
+					GENMASK(18, 4))
+
+#define MT_RX_DATA_RING_BASE		MT_WFDMA0(0x500)
+
+#define MT_INFRA_CFG_BASE		0xd1000
+#define MT_INFRA(ofs)			(MT_INFRA_CFG_BASE + (ofs))
+
+#define MT_HIF_REMAP_L1			0x155024
+#define MT_HIF_REMAP_L1_MASK		GENMASK(31, 16)
+#define MT_HIF_REMAP_L1_OFFSET		GENMASK(15, 0)
+#define MT_HIF_REMAP_L1_BASE		GENMASK(31, 16)
+#define MT_HIF_REMAP_BASE_L1		0x130000
+
+#define MT_HIF_REMAP_L2			0x0120
+#if IS_ENABLED(CONFIG_MT76_DEV)
+#define MT_HIF_REMAP_BASE_L2		(0x7c500000 - (0x7c000000 - 0x18000000))
+#else
+#define MT_HIF_REMAP_BASE_L2		0x18500000
+#endif
+
+#define MT_WFSYS_SW_RST_B		0x7c000140
+
+#define MT_WTBLON_TOP_WDUCR		MT_WTBLON_TOP(0x370)
+#define MT_WTBLON_TOP_WDUCR_GROUP	GENMASK(4, 0)
+
+#define MT_WTBL_UPDATE			MT_WTBLON_TOP(0x380)
+#define MT_WTBL_UPDATE_WLAN_IDX		GENMASK(11, 0)
+#define MT_WTBL_UPDATE_ADM_COUNT_CLEAR	BIT(14)
+
+#endif
-- 
2.18.0


