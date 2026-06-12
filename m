Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D41FCD98D9
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2026 07:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAuAgBwtFEMeA84wPFhPHC34qWIAJbjo492VfCBox9U=; b=O7/1fm+31juF5Xo1zuPrIkTZhz
	NbBrR/dLfEVDHXKc5NhIXe3Xvju7R43976F1FoCcCKymHxHYSYBgLwUd036eTwjqoDM8f8rAyfYeo
	sIEhXAPQVHyBYB2SLJF9MhYriZQL1Hq3H2/i7oXY19iPSE4Uj7t9Bpd8Xgxpgdn3tFwHqaUXcDjqM
	Aln7JKPf6Srn336px9LwwNGEyqVfze5RCQjlDkr9zgNIj/8wTz7SVitXbRn8ImnARHdF4CZSck34I
	Ak5xtGbKGNUAAedpYUAY6HqlhttyS1CUAdjWgQ6bb78oEbuJ6RehK+G9bXnALLGcP1YTnKwMgKntU
	yHzCvrpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwi8-0000000AVsO-0aTA;
	Fri, 12 Jun 2026 07:53:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwi4-0000000AVpj-40pP
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jun 2026 07:53:50 +0000
X-UUID: d5e2f704663311f1acbe4559397dec65-20260612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WAuAgBwtFEMeA84wPFhPHC34qWIAJbjo492VfCBox9U=;
	b=mbwkgB/CdDbUhlrS/rGyAQFIo3fkpzTgi6npPuDnHCFWmp9vsmPqHYPUYsc/HM5fda9jWxkTUsUcymtWvVr4D3JKNERe2aRIfZTyc3paqgnst+X+8nXPbgadTUHBliMypQyDO68/ITXyjxh7O91/rcowa8yFeTXptuC0wowA6NY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:1b7cb297-d3df-40c3-8f14-c38a1d9d801b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e276073,CLOUDID:1d7ab230-7784-4a77-a538-47ed6151d81b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d5e2f704663311f1acbe4559397dec65-20260612
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 333073234; Fri, 12 Jun 2026 00:53:44 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
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
	<jb.tsai@mediatek.com>, Xiong <xiong.huang@mediatek.com>
Subject: [PATCH 18/20] wifi: mt76: mt7925: align scan IE and EFUSE TLV lengths to 4 bytes for MT7928
Date: Fri, 12 Jun 2026 15:53:37 +0800
Message-ID: <20260612075339.2578327-3-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260612075339.2578327-1-jb.tsai@mediatek.com>
References: <20260612075339.2578327-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_005349_245156_049ADD24 
X-CRM114-Status: GOOD (  11.33  )
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

MT7928 firmware requires 4-byte aligned TLV payloads. Round up
UNI_SCAN_IE allocation with ALIGN(..., 4) and track padded length.

Signed-off-by: Xiong <xiong.huang@mediatek.com>
Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index ffe687afcf6e..e8edc8c1acca 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1582,7 +1582,8 @@ int mt7925_mcu_set_eeprom(struct mt792x_dev *dev)
 		.tag = cpu_to_le16(UNI_EFUSE_BUFFER_MODE),
 		.len = cpu_to_le16(sizeof(req) - 4),
 		.buffer_mode = EE_MODE_EFUSE,
-		.format = EE_FORMAT_WHOLE
+		.format = EE_FORMAT_WHOLE,
+		.buf_len = 0
 	};
 
 	return mt76_mcu_send_and_get_msg(&dev->mt76, MCU_UNI_CMD(EFUSE_CTRL),
@@ -3036,11 +3037,11 @@ mt7925_mcu_build_scan_ie_tlv(struct mt76_dev *mdev,
 			     struct ieee80211_scan_ies *scan_ies)
 {
 	u32 max_len = sizeof(struct scan_ie_tlv) + MT76_CONNAC_SCAN_IE_LEN;
+	u32 ies_len, alloc_len;
 	struct scan_ie_tlv *ie;
 	enum nl80211_band i;
 	struct tlv *tlv;
 	const u8 *ies;
-	u16 ies_len;
 
 	for (i = 0; i <= NL80211_BAND_6GHZ; i++) {
 		if (i == NL80211_BAND_60GHZ)
@@ -3052,11 +3053,16 @@ mt7925_mcu_build_scan_ie_tlv(struct mt76_dev *mdev,
 		if (!ies || !ies_len)
 			continue;
 
-		if (ies_len > max_len)
+		if (is_mt7928(mdev))
+			alloc_len = ALIGN(sizeof(*ie) + ies_len, 4);
+		else
+			alloc_len = sizeof(*ie) + ies_len;
+
+		if (alloc_len > max_len)
 			return;
 
 		tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_IE,
-					      sizeof(*ie) + ies_len);
+					      alloc_len);
 		ie = (struct scan_ie_tlv *)tlv;
 
 		memcpy(ie->ies, ies, ies_len);
@@ -3074,7 +3080,7 @@ mt7925_mcu_build_scan_ie_tlv(struct mt76_dev *mdev,
 			break;
 		}
 
-		max_len -= (sizeof(*ie) + ies_len);
+		max_len -= alloc_len;
 	}
 }
 
-- 
2.45.2


