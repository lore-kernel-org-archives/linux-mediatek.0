Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0F9CA5FCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2026 08:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l8ieC+rilEmgPn2tpFeyk5Ca9rP0sqcwbMniIbRuVfc=; b=voC74gBdk8XC/zLDaEskaz20KU
	RX/WVbI9XuiC/48PzwOAwiY3Eqkyr3EACt0gawAJtD5triHL336AQ4t3OEp+9MJbMxG8mr3I8PX0r
	eVy+uvN+RCHIQPfdjAczziICnfD56UVBeHo6H7ZiMCTQazINiXNxN2cvskObt7jKtS8oAVcYlcbdP
	KUvap37woJ2HMlfCP2QoVFVC3UVRMPwsz8AqVUeF2j0rVJeKS+n5gTDCy+XmuWF8eBgHDzU04Blwp
	hXV61vMe7KqraBoaYh4EU5vQcezIgn3WOgKSaz2GK8hnJ0roCQ6RxjIZX4RLk+jNqm6zltixPbuS5
	HA+4re0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeE7-0000000FuEQ-0vw4;
	Mon, 05 Oct 2026 08:39:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeE4-0000000FuDu-3Dzx
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Oct 2026 08:39:13 +0000
X-UUID: 3ae6c388c09811f1acbe4559397dec65-20261005
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=l8ieC+rilEmgPn2tpFeyk5Ca9rP0sqcwbMniIbRuVfc=;
	b=rPY5myzAhIUtqi6lQTf+T8uCifBBBEehkLfQEuBELYBOwxJhEPubpmPqa15c/C21LVQ0EI8o7aAEvjypvrq/Rtyk+G6ZeySBjmPhXAt6XjyIkcb7K4p4G9sC3priqE0CUXtEKXGq2XFjB9CARlNK0sBGyhrqkkHgE0wkJ74MQu4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:055ec5b2-bed2-4abb-82d0-bc8f7b901698,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:291e20b,CLOUDID:bf995c56-66df-4ed9-ba9a-e32623d07625,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3ae6c388c09811f1acbe4559397dec65-20261005
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <anthony.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 587155534; Mon, 05 Oct 2026 01:39:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Oct 2026 16:39:05 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 5 Oct 2026 16:39:05 +0800
From: Anthony Liu <anthony.liu@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.lee@mediatek.com>,
	<litien.chang@mediatek.com>, <kun.wu@mediatek.com>, <jb.tsai@mediatek.com>,
	<emery.hsin@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Anthony Liu <anthony.liu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7928: makes struct beacon_tlv 4-byte aligned.
Date: Mon, 5 Oct 2026 16:39:04 +0800
Message-ID: <20261005083904.107527-1-anthony.liu@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_013912_812547_552A882D 
X-CRM114-Status: UNSURE (   8.49  )
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

mt76 fails when offloading beacon to MT7928 FW.

This is caused by newly added 4-byte alignment check in MT7928 FW
and works when beacon_tlv is 4-byte aligned. MT7925 is not affected
because it accepts same struct with or without extra padding bytes.

Signed-off-by: Anthony Liu <anthony.liu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 376cc4833242..ff51d8189b46 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2392,10 +2392,13 @@ mt7925_mcu_uni_add_beacon_offload(struct mt792x_dev *dev,
 			u8 pad[3];
 		} __packed hdr;
 		struct bcn_content_tlv {
+			/* DW 0 */
 			__le16 tag;
 			__le16 len;
+			/* DW 1 */
 			__le16 tim_ie_pos;
 			__le16 csa_ie_pos;
+			/* DW 2 */
 			__le16 bcc_ie_pos;
 			/* 0: disable beacon offload
 			 * 1: enable beacon offload
@@ -2406,8 +2409,9 @@ mt7925_mcu_uni_add_beacon_offload(struct mt792x_dev *dev,
 			 * 1: only cap field IE
 			 */
 			u8 type;
+			/* DW 3~130 */
 			__le16 pkt_len;
-			u8 pkt[512];
+			u8 pkt[510];
 		} __packed beacon_tlv;
 	} req = {
 		.hdr = {
-- 
2.45.2


