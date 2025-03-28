Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39727C3600C
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Mar 2025 02:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cj6WARRDUu81bD7FNguWIjaU7KS/9mR6wv5eamc6rus=; b=eauo+Zj+OXNPjIIj+CMgGeW/Ks
	vTju37Tw5VG15KLXgFu3wXRGQFsuWkmnccQaBGuuZ0gcfR7p52EYs/+RzxEal9xwQXk8ZxNf6S9hE
	antBQnnLy0W1VFgYL/tVkuX72bBs8QxpnpEJmhnHxVbcvaeMp/pNIvj7o0DqW8QoEVlNfFlCvPKh4
	QmBZBZ4hvQNaVnNy9QkXzMYe9Ag9Yd2/U2tWWQozDqCynAIsi2atWoqOQKw6yXwmw+qnV63HCkZE7
	Oht1a9bLhGEQxys0o6vu83IhUcKsPcND/BulBGEOH661Cj7vE/xFH9Rvwhxnd04wUTE65JsQaWjZ1
	mafgJlag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txzTp-0000000CPRk-1beQ;
	Fri, 28 Mar 2025 02:29:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txzSz-0000000CPPL-3Yel
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Mar 2025 02:29:07 +0000
X-UUID: 68bb0dfa0b7c11f0a1e849db4cc18d44-20250327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cj6WARRDUu81bD7FNguWIjaU7KS/9mR6wv5eamc6rus=;
	b=s2GIa2A+denD+6380Z6UxwwBMw0Oyo6Pb8gmBsvuG7iuDguR3dZdJw2UWRxXVIxQGOkxVRQCCKcRvKHogWEreRfmvQ07yowkPEsZ5OMqqiEGn54pj4SFPhyVufVOO9/pqyoUnuOr+lmyHcShiYB9xwZ3G5tCKdvyJ+hv6Uynk9o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:75f5202a-a48f-44ed-9848-a6cb6d450a8c,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:c037a94a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 68bb0dfa0b7c11f0a1e849db4cc18d44-20250327
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 635337910; Thu, 27 Mar 2025 19:29:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 28 Mar 2025 10:28:58 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 28 Mar 2025 10:28:58 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Ben Greear <greearb@candelatech.com>,
	Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH mt76] Revert "wifi: mt76: mt7996: fill txd by host driver"
Date: Fri, 28 Mar 2025 10:28:47 +0800
Message-ID: <20250328022847.1612082-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_192905_889394_79707845 
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

This reverts commit 3b522cadedfe6e9e0e8193d7d4ab5aa8d0c73209.

The MTK connac3 has introduced new hardware, SDO (Software Defined
Offload), to offload the process of filling the TX descriptor. Initially,
there were some issues, but after several fixes, it should now be stable,
allowing us to revert this commit.

Additionally, activating SDO is essential for the proper functioning of
features like TX checksum offload.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index a52b4e71b267..baa4aea109bc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1017,8 +1017,11 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 		return id;
 
 	pid = mt76_tx_status_skb_add(mdev, wcid, tx_info->skb);
-	mt7996_mac_write_txwi(dev, txwi_ptr, tx_info->skb, wcid, key,
-			      pid, qid, 0);
+	memset(txwi_ptr, 0, MT_TXD_SIZE);
+	/* Transmit non qos data by 802.11 header and need to fill txd by host*/
+	if (!is_8023 || pid >= MT_PACKET_ID_FIRST)
+		mt7996_mac_write_txwi(dev, txwi_ptr, tx_info->skb, wcid, key,
+				      pid, qid, 0);
 
 	txp = (struct mt76_connac_txp_common *)(txwi + MT_TXD_SIZE);
 	for (i = 0; i < nbuf; i++) {
@@ -1035,8 +1038,10 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	}
 	txp->fw.nbuf = nbuf;
 
-	txp->fw.flags =
-		cpu_to_le16(MT_CT_INFO_FROM_HOST | MT_CT_INFO_APPLY_TXD);
+	txp->fw.flags = cpu_to_le16(MT_CT_INFO_FROM_HOST);
+
+	if (!is_8023 || pid >= MT_PACKET_ID_FIRST)
+		txp->fw.flags |= cpu_to_le16(MT_CT_INFO_APPLY_TXD);
 
 	if (!key)
 		txp->fw.flags |= cpu_to_le16(MT_CT_INFO_NONE_CIPHER_FRAME);
-- 
2.39.2


