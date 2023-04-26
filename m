Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9CAC7618E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 23:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tryf26oI7NZspdhQrPCelEOu5SNun7TuTLvbo5UwH9k=; b=TeHDBE4/2bylPZBX7jJ3eEehBt
	XTE95iqA8tQF/JWDUOMB/LcQwO4KmJD0KN7UFUuCInuccUGpMgs8sa8siTP/9pdjyFPN95kkqlzgU
	V236WbJxSqyKviwug9z+N+KXtS9qRX2ZIPjozsTk8lBuBR0p8YHABfa3Uperw0FReFrrfLCYX3txu
	1F92BwtZZmcueg9DtyiY782cA53Fb8tiJjXq4RWUxml4NeYLJ2Z+ikOtCMBLxpCgFVeDB3id12v5N
	gC9h0xbWJPmyazKbGRwxPgiQyMNModHyU3S9flsmYYUtxrlmGnzHNxr+ElYfBbv83HZeNwWEBW4nU
	LhNCQzFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1proCp-0050Ek-09;
	Wed, 26 Apr 2023 23:05:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1proCl-0050Dp-1Q
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Apr 2023 23:05:44 +0000
X-UUID: dc3d838ae48611edb7d8d11f642b8e78-20230426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Tryf26oI7NZspdhQrPCelEOu5SNun7TuTLvbo5UwH9k=;
	b=R8d/oKOWoMyjgRsz7JQiAyPz4DEfD65Wd1PoQTl5Z3bsLRFEcjIgvCWkr4A4487Yh2aXzEelb01tjYw34JrZIxkkSd0Rxn31sHB4Xv5PtwSd1cRUPXfjsGA4bnzwGYW3vL7ay1hjCiZPNO7GF7QbJAevM3NdOnWlvAsGXGS0Dpg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:e65bce53-8e57-4405-ad22-1d6eebdad5c7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:08845b85-cd9c-45f5-8134-710979e3df0e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: dc3d838ae48611edb7d8d11f642b8e78-20230426
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 786504283; Wed, 26 Apr 2023 16:05:39 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 27 Apr 2023 07:05:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 27 Apr 2023 07:05:36 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7996: fix header translation logic
Date: Thu, 27 Apr 2023 07:05:15 +0800
Message-ID: <1ba50091a50574ff9700723a4485bccb3d93322f.1682549983.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_160543_488471_C9FCB6E4 
X-CRM114-Status: GOOD (  11.36  )
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

When header translation failure is indicated, the hardware will insert
an extra 2-byte field containing the data length after the protocol
type field. This happens either when the LLC-SNAP pattern did not match,
or if a VLAN header was detected.

The previous commit accidentally breaks the logic, so reverts back.

Fixes: 27db47ab1f47 (wifi: mt76: mt7996: enable mesh HW amsdu/de-amsdu support)
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 39a4a73ef8e6..4c03d5a3bcea 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -836,14 +836,19 @@ mt7996_mac_fill_rx(struct mt7996_dev *dev, struct sk_buff *skb)
 		skb_pull(skb, hdr_gap);
 		if (!hdr_trans && status->amsdu && !(ieee80211_has_a4(fc) && is_mesh)) {
 			pad_start = ieee80211_get_hdrlen_from_skb(skb);
-		} else if (hdr_trans && (rxd2 & MT_RXD2_NORMAL_HDR_TRANS_ERROR) &&
-			   get_unaligned_be16(skb->data + pad_start) == ETH_P_8021Q) {
+		} else if (hdr_trans && (rxd2 & MT_RXD2_NORMAL_HDR_TRANS_ERROR)) {
 			/* When header translation failure is indicated,
 			 * the hardware will insert an extra 2-byte field
 			 * containing the data length after the protocol
-			 * type field.
+			 * type field. This happens either when the LLC-SNAP
+			 * pattern did not match, or if a VLAN header was
+			 * detected.
 			 */
-			pad_start = 16;
+			pad_start = 12;
+			if (get_unaligned_be16(skb->data + pad_start) == ETH_P_8021Q)
+				pad_start += 4;
+			else
+				pad_start = 0;
 		}
 
 		if (pad_start) {
-- 
2.18.0


