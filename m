Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF194C02188
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2025 10:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tg77eq1fiZg7egz4u9Fdjg0R4jZn4vLYhbSc+vDKxc8=; b=1vQ54NERdY+vM5b2fEaaBwssWe
	cxmJlcwymtikcrr5TATvkIKhMGy+w1jX4RmOI2qVWHjexAzypQ7Tojsr09DH4+XZvm/zSw4I4u1z4
	uetindzEoBVAGyOS/p42uMdvlR8syHLxDR3l+3zTDJ/a37BmB3PMu4LKxyUk++TmeqGz4454TAk5K
	qQfuvbahbSE9T2ED/MTGuVMqR8ELPNii/YLRLm0srXoX3b7leEMtHAkbw5auD7/TkWVyvonbW2ma6
	6u/f8762YS9qXbibyg8ZkEPSGzcB8PmRYxq0mKq2tZ0+AcbZHuYTEMoudKcjSA6IvC1MuW1dWC+W0
	Q9vJw+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdu3-0000000835Z-3c2z;
	Tue, 14 Jan 2025 10:12:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdtm-000000082xW-036d
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jan 2025 10:11:52 +0000
X-UUID: f3c6921cd25f11ef9048ed6ed365623b-20250114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Tg77eq1fiZg7egz4u9Fdjg0R4jZn4vLYhbSc+vDKxc8=;
	b=cWa3gBua1C9poNvFT3ntLZ/oSnbm5KDe1rKq2zC3MA3aiNASUSpDfeXHvWEGy2ZIxHQRYgwCLtmafhvkrgDe82Sq459z6c5F5RfIdefUxN4+bDGe3w4IUzGvSLoMpsGo+fLIUmOVK1vVJFMzJQ6BmQSYVIbwrd5FQ+uTpvUCUK4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:50d7161e-bded-40c2-b57f-c94134ddb04d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:41047b13-8831-4185-8e40-f83b1917e828,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f3c6921cd25f11ef9048ed6ed365623b-20250114
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 525351117; Tue, 14 Jan 2025 03:11:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 14 Jan 2025 18:11:40 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 14 Jan 2025 18:11:40 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Benjamin Lin
	<benjamin-jw.lin@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 6/9] wifi: mt76: mt7996: fix definition of tx descriptor
Date: Tue, 14 Jan 2025 18:10:23 +0800
Message-ID: <20250114101026.3587702-6-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250114101026.3587702-1-shayne.chen@mediatek.com>
References: <20250114101026.3587702-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_021150_088055_E193BC7D 
X-CRM114-Status: GOOD (  11.84  )
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

For mt7992 chipsets, the definition of TXD.DW6.BIT10~15 has different
interpretations on different frame types. Driver only needs to fill
MSDU_CNT for non-management frames.

Fixes: 408566db8cad ("wifi: mt76: connac: add new definition of tx descriptor")
Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index f5865d9688b7..bc8cba4dca47 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -826,6 +826,7 @@ void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
 			   struct ieee80211_key_conf *key, int pid,
 			   enum mt76_txq_id qid, u32 changed)
 {
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_vif *vif = info->control.vif;
 	u8 band_idx = (info->hw_queue & MT_TX_HW_QUEUE_PHY) >> 2;
@@ -893,8 +894,9 @@ void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
 	val = MT_TXD6_DIS_MAT | MT_TXD6_DAS;
 	if (is_mt7996(&dev->mt76))
 		val |= FIELD_PREP(MT_TXD6_MSDU_CNT, 1);
-	else
+	else if (is_8023 || !ieee80211_is_mgmt(hdr->frame_control))
 		val |= FIELD_PREP(MT_TXD6_MSDU_CNT_V2, 1);
+
 	txwi[6] = cpu_to_le32(val);
 	txwi[7] = 0;
 
@@ -904,7 +906,6 @@ void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
 		mt7996_mac_write_txwi_80211(dev, txwi, skb, key);
 
 	if (txwi[1] & cpu_to_le32(MT_TXD1_FIXED_RATE)) {
-		struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
 		bool mcast = ieee80211_is_data(hdr->frame_control) &&
 			     is_multicast_ether_addr(hdr->addr1);
 		u8 idx = MT7996_BASIC_RATES_TBL;
-- 
2.39.2


