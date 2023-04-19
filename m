Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F90DC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 06:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8If3OHblNkpEWCKRVPetaaHJ1wakSJYUSHI1OWQ7MlA=; b=FCd2fUjk0TCQEF/AW5NujkQPmO
	Oyr7lPgzH7vte4RIdfHdM30RZlrUUkimdkfSVT2UUAuY5wa3irmtebv+ysM0fWD4rGuKOGyhVpYqO
	TY6UVr2LbG6sAPZ0yQ4fuVeQ/+OHRBF2L8e3zVkdp6YbPPOw7OwYHMaT1RNXRku+IKYNvAUS3g+Xa
	6Q20aKpoBfF6KWSVeYep+CvqqRDEFlVfUXEeV1CC+1GAEN2vohqXZMuCYTGeRtGaWKfQAxF7k/kVr
	BVkqy+sseENiRktvEdtqaESf42RlbzJTSuI9UVrQXPQzDd0Gitqfwk1NZa6MMyKM922OP9zpSpnNx
	RryebnoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp19b-004Cc7-2C;
	Wed, 19 Apr 2023 06:18:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp19Y-004CZ7-1y
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Apr 2023 06:18:53 +0000
X-UUID: 09f6a6acde7a11ed8687db9d93187ff1-20230418
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=8If3OHblNkpEWCKRVPetaaHJ1wakSJYUSHI1OWQ7MlA=;
	b=ldiOOUiQsJxOwYEb2H/SmYy3bo3gWlewY19AmOenVbPoDb5emI3wB5g5LcFnCtSdZsme1QA7gkT40ZYCDaABbbDo7ronwUUdVE677GhE2YZpPKPGQAyEowjPMeniVMqArl2k/2j/1d9BkdNZak35iv+J227+9o+/tz9Mup1pQIs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:1505afda-0d18-495c-ae4d-bd70706d0e88,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:c2e9d1a1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 09f6a6acde7a11ed8687db9d93187ff1-20230418
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 683893202; Tue, 18 Apr 2023 23:18:45 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 19 Apr 2023 13:58:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 19 Apr 2023 13:58:42 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7996: fill txd by host driver
Date: Wed, 19 Apr 2023 13:58:40 +0800
Message-ID: <d292aca5cdf0f52bd4132b73214ebd4f8d271a65.1681864336.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_231852_663537_F35A5C87 
X-CRM114-Status: GOOD (  10.82  )
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

The hardware SDO has issue to fill txd for the moment, so fallback to
driver filling method.

Fixes: 98686cd21624 (wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices)
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 6ce75243e40d..ff8464fe0528 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1117,11 +1117,8 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 		return id;
 
 	pid = mt76_tx_status_skb_add(mdev, wcid, tx_info->skb);
-	memset(txwi_ptr, 0, MT_TXD_SIZE);
-	/* Transmit non qos data by 802.11 header and need to fill txd by host*/
-	if (!is_8023 || pid >= MT_PACKET_ID_FIRST)
-		mt7996_mac_write_txwi(dev, txwi_ptr, tx_info->skb, wcid, key,
-				      pid, qid, 0);
+	mt7996_mac_write_txwi(dev, txwi_ptr, tx_info->skb, wcid, key,
+			      pid, qid, 0);
 
 	txp = (struct mt76_connac_txp_common *)(txwi + MT_TXD_SIZE);
 	for (i = 0; i < nbuf; i++) {
@@ -1130,10 +1127,8 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	}
 	txp->fw.nbuf = nbuf;
 
-	txp->fw.flags = cpu_to_le16(MT_CT_INFO_FROM_HOST);
-
-	if (!is_8023 || pid >= MT_PACKET_ID_FIRST)
-		txp->fw.flags |= cpu_to_le16(MT_CT_INFO_APPLY_TXD);
+	txp->fw.flags =
+		cpu_to_le16(MT_CT_INFO_FROM_HOST | MT_CT_INFO_APPLY_TXD);
 
 	if (!key)
 		txp->fw.flags |= cpu_to_le16(MT_CT_INFO_NONE_CIPHER_FRAME);
-- 
2.18.0


