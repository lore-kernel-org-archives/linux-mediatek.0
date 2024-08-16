Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FAB5C53211
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Aug 2024 09:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZbZskdAAPEfBiyTDM8Q3uhcblEGxlN0tOBCY1ZY5png=; b=m/4TBcWOoe8C50o9DQB/9cWmFU
	R0f61qyE/IQ9zLRfoI741GB3k3V/LEln4kPZQ2ZaYyrV5KB4fQvf4ObjOYCRjHaZ0R3D6xKicIxp5
	0grkLUg/vP055TCjoS61bnQ8D3GiDiHMlkYpSAf4Sb5nCP/l1ikEuZHY7b7pOLJCrIzmEe2eGfnU0
	Ozk5IrmquidIOvEktozSUgWT0M2k4Xu/QjpzLySepFepFWA/rgY0bgS37XuniHaGtqXci1Im8wjkV
	MHAe+jcb+GmHM+Noz+wIaZdqhgeHNzScLrTVSwKStPA0gmDCvmV5UJ/gR6NvVzrLefZorjc1EaIIc
	BBz7szWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1setdx-0000000CV8O-2CEO;
	Fri, 16 Aug 2024 09:53:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1setcG-0000000CUeE-0li7
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Aug 2024 09:51:29 +0000
X-UUID: 1939e7825bb511efb3adad29d29602c1-20240816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZbZskdAAPEfBiyTDM8Q3uhcblEGxlN0tOBCY1ZY5png=;
	b=UqKUxdPxhewhgPQEoQggvpEGhPs5r6HmSC1MaGjix45vz8u/34hBV4C2BSratLM6qminvlqV36dIL6cb9SWg0yZAQAih6j7IQD1FCOLefcql7Syhi9SiLmi+PbOI2ONFtBUKKbas/OQO/fEIDXLkdJvuP8UdaSVPBGSwhNWWVIM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:0885b602-70fa-46ea-987c-e2d3a54c9d7b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:13b1403f-6019-4002-9080-12f7f4711092,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1939e7825bb511efb3adad29d29602c1-20240816
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1492056315; Fri, 16 Aug 2024 02:51:24 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 16 Aug 2024 17:50:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 16 Aug 2024 17:50:16 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Benjamin Lin
	<benjamin-jw.lin@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 11/12] wifi: mt76: connac: add IEEE 802.11 fragmentation support for mt7996
Date: Fri, 16 Aug 2024 17:46:34 +0800
Message-ID: <20240816094635.2391-10-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240816094635.2391-1-shayne.chen@mediatek.com>
References: <20240816094635.2391-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.424500-8.000000
X-TMASE-MatchedRID: d+baqQ3qUqfRpd8KAFU/vQPZZctd3P4BX5TqQagR07c1LB46LFAAklEJ
	QTCrPCv47l/5JtDtWGBMP01kejT9opWEhYv0US43tG07VELUSnQ7r2Gtb9iBYVsJAgsSNy6Uo8W
	MkQWv6iXBcIE78YqRWvcUt5lc1lLgoGRyAacnhaYZupxFsZSItKPMaYOuAHv0eM44NSba8IscNQ
	MmxiKDCX7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.424500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: C375A4A6DEECFF71A1D168E8EE4F909F880E11583EA294EFB2AA2509C4034E8D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_025128_258231_43AFE5CF 
X-CRM114-Status: UNSURE (   9.95  )
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

From: Benjamin Lin <benjamin-jw.lin@mediatek.com>

Add fragment index into TXD.DW2 to support IEEE 802.11 fragmentation.

Signed-off-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt76_connac3_mac.h   |  7 +++++++
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c     | 13 +++++++++++--
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
index ef003d1620a5..db0c29e65185 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
@@ -197,6 +197,13 @@ enum tx_mgnt_type {
 	MT_TX_ADDBA,
 };
 
+enum tx_frag_idx {
+	MT_TX_FRAG_NONE,
+	MT_TX_FRAG_FIRST,
+	MT_TX_FRAG_MID,
+	MT_TX_FRAG_LAST
+};
+
 #define MT_CT_INFO_APPLY_TXD		BIT(0)
 #define MT_CT_INFO_COPY_HOST_TXD_ALL	BIT(1)
 #define MT_CT_INFO_MGMT_FRAME		BIT(2)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index fd5fe96c32e3..0d21414e2c88 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -746,7 +746,7 @@ mt7996_mac_write_txwi_80211(struct mt7996_dev *dev, __le32 *txwi,
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	bool multicast = is_multicast_ether_addr(hdr->addr1);
 	u8 tid = skb->priority & IEEE80211_QOS_CTL_TID_MASK;
-	__le16 fc = hdr->frame_control;
+	__le16 fc = hdr->frame_control, sc = hdr->seq_ctrl;
 	u8 fc_type, fc_stype;
 	u32 val;
 
@@ -780,6 +780,15 @@ mt7996_mac_write_txwi_80211(struct mt7996_dev *dev, __le32 *txwi,
 	val = FIELD_PREP(MT_TXD2_FRAME_TYPE, fc_type) |
 	      FIELD_PREP(MT_TXD2_SUB_TYPE, fc_stype);
 
+	if (ieee80211_has_morefrags(fc) && ieee80211_is_first_frag(sc))
+		val |= FIELD_PREP(MT_TXD2_FRAG, MT_TX_FRAG_FIRST);
+	else if (ieee80211_has_morefrags(fc) && !ieee80211_is_first_frag(sc))
+		val |= FIELD_PREP(MT_TXD2_FRAG, MT_TX_FRAG_MID);
+	else if (!ieee80211_has_morefrags(fc) && !ieee80211_is_first_frag(sc))
+		val |= FIELD_PREP(MT_TXD2_FRAG, MT_TX_FRAG_LAST);
+	else
+		val |= FIELD_PREP(MT_TXD2_FRAG, MT_TX_FRAG_NONE);
+
 	txwi[2] |= cpu_to_le32(val);
 
 	txwi[3] |= cpu_to_le32(FIELD_PREP(MT_TXD3_BCM, multicast));
@@ -789,7 +798,7 @@ mt7996_mac_write_txwi_80211(struct mt7996_dev *dev, __le32 *txwi,
 	}
 
 	if (info->flags & IEEE80211_TX_CTL_INJECTED) {
-		u16 seqno = le16_to_cpu(hdr->seq_ctrl);
+		u16 seqno = le16_to_cpu(sc);
 
 		if (ieee80211_is_back_req(hdr->frame_control)) {
 			struct ieee80211_bar *bar;
-- 
2.39.2


