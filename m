Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F112AC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Dec 2023 02:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9gdR+a5LdIUu8TmfSBK1x9oXDqMPX0qjRHU75+Bsew=; b=PhIt/c+48gVKLauUnIImyqxtNU
	v/WYZOJ5rEDRnefQyLvLVXA2vxlSxcHL0ERLlX157fSIKPKY1Td7QC4a6+mXp5JBxKZaOqvpjwPZB
	nFg8BkZ2+04jFqtYwxEmMR4+lbVoP6jtFaX5TFTD+9sYN6eysuwoI2QXPAEqBfbH1xLUZSQqsdaQm
	87y37Chgaly7XmMAdIAcqVuqboWjUT2w5zq3R/dJFLPFnF99d7MYlM0CyBPoIRTrAbdIdGYsvoZjX
	eVBQKqlvXDw1gpFiW8EG7KgyfKQ0MaJpeBfzfl/FMp03dQag0PAd5nahNN4wgixyjEhUpGNDzFjqo
	XQJb8LbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ2U5-0005bI-2n;
	Fri, 29 Dec 2023 02:20:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ2U3-0005ax-0c
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Dec 2023 02:20:24 +0000
X-UUID: cff16246a5f011ee9a662f17bb45267e-20231228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=S9gdR+a5LdIUu8TmfSBK1x9oXDqMPX0qjRHU75+Bsew=;
	b=FDRNn50vMwjCwtaIFFMSLmzluyjRCaFEOlDLCe7LHBdDHWlQGUXibyTS/KkF62Tybfum8Tql4V7PwKkoZG1nopQc7E6RxKwbOSBo7cV40Y46WH/KjGDJ15V67drcrXx7479kxxX97fUnUG/4nRUibzJG07Vb4wTki8GOSJnz/gg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:9be9a4c6-8881-4ab5-8fbb-105bda4eaf0f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5d391d7,CLOUDID:477ac87e-4f93-4875-95e7-8c66ea833d57,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cff16246a5f011ee9a662f17bb45267e-20231228
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1373315723; Thu, 28 Dec 2023 19:20:19 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 29 Dec 2023 10:00:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 29 Dec 2023 10:00:15 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Hao Zhang <hao.zhang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Subject: [PATCH v1 03/10] wifi: mt76: mt7925: fix mcu query command fail
Date: Fri, 29 Dec 2023 10:00:02 +0800
Message-ID: <20231229020009.12385-4-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231229020009.12385-1-mingyen.hsieh@mediatek.com>
References: <20231229020009.12385-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_182023_260949_EF21B111 
X-CRM114-Status: UNSURE (   9.28  )
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

From: Hao Zhang <hao.zhang@mediatek.com>

Apply query command type properly to make the chip send the response back.
Otherwise, we may see the command timeout in driver side.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Hao Zhang <hao.zhang@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 9a8db9b1a4f2..4811fccbe30e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2850,12 +2850,16 @@ int mt7925_mcu_fill_message(struct mt76_dev *mdev, struct sk_buff *skb,
 	if (cmd & __MCU_CMD_FIELD_UNI) {
 		uni_txd = (struct mt76_connac2_mcu_uni_txd *)txd;
 		uni_txd->len = cpu_to_le16(skb->len - sizeof(uni_txd->txd));
-		uni_txd->option = MCU_CMD_UNI_EXT_ACK;
 		uni_txd->cid = cpu_to_le16(mcu_cmd);
 		uni_txd->s2d_index = MCU_S2D_H2N;
 		uni_txd->pkt_type = MCU_PKT_ID;
 		uni_txd->seq = seq;
 
+		if (cmd & __MCU_CMD_FIELD_QUERY)
+			uni_txd->option = MCU_CMD_UNI_QUERY_ACK;
+		else
+			uni_txd->option = MCU_CMD_UNI_EXT_ACK;
+
 		goto exit;
 	}
 
-- 
2.18.0


