Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25548C54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 11:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZnYMiMoNgdEOpisQDyFxN4JhpH5dfSFwjD8tpJFcuw=; b=eyaPeSMhejrkGLQ9EUrbUSrUwZ
	3UpgG7Iw+e0uiaCV2pSNXnYX0nSMuT2nHjiAMjXvhZfX+javy60vUAgSWAhCwFfnGjSITNUbJ64dY
	u6ZIprVOSAxBf2R9DSLO80VP3Q7PP8YErm/Gr6gu/OqeFAfwWlfxSdl9vmjw/ayukV+uLjjgtT8yT
	aucLkLafJtfzx/da23qVBYmoNcEmnYuSrVnzLFcFHVCqAVff62HfUZuzgqh394cUX3PPWmJDIFsKH
	/oId9jDrguU8ovt5h+6nOdPSzHapjy8Hgj/uwSkmzg1m+80rDjOEEjkuFzhC5ahz4RLQZ3M0pgvNz
	jN4fOmxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtp9-0000000GtjJ-2rtx;
	Wed, 20 Mar 2024 11:09:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmtp6-0000000Gtg7-1cvM
	for linux-mediatek@lists.infradead.org;
	Wed, 20 Mar 2024 11:09:33 +0000
X-UUID: 50151fd6e6aa11eeacdb61a41848c7d2-20240320
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9ZnYMiMoNgdEOpisQDyFxN4JhpH5dfSFwjD8tpJFcuw=;
	b=SqsFOFfKDlu1qSBtZbT9FTyeYr2ayVW8iIQtrEZ9dO/KYCfMezPcO1WawCiXpbFA6a7/vPF/5sQjP9LigIwZ/DLr5XUlVbPUlmqHBRL99roeJdZ/59VSzw2PuFJWyqYKeYSm038HVX5YsTfMLVIlTH7Jm6VVn5Z4O5I1CV8rHm0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:b1305b01-3996-451c-ac02-14350136cfdf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:96d81d00-c26b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 50151fd6e6aa11eeacdb61a41848c7d2-20240320
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 312759475; Wed, 20 Mar 2024 04:09:25 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Mar 2024 19:09:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Mar 2024 19:09:23 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 02/10] wifi: mt76: mt7996: disable rx header translation for BMC entry
Date: Wed, 20 Mar 2024 19:09:10 +0800
Message-ID: <20240320110918.3488-2-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240320110918.3488-1-shayne.chen@mediatek.com>
References: <20240320110918.3488-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_040932_457725_3C5F2362 
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

When a BMC wtbl of station interface is correctly set with peer address,
HW will do rx header translation for broadcast data packets, which makes
mac80211 unable to find the corresponding ieee80211_sta and drop the
packets. To fix this, disable HW rx header translation for BMC entry.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index df6be2091615..fd0cc945b22a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1778,10 +1778,10 @@ mt7996_mcu_sta_hdr_trans_tlv(struct mt7996_dev *dev, struct sk_buff *skb,
 	else
 		hdr_trans->from_ds = true;
 
-	wcid = (struct mt76_wcid *)sta->drv_priv;
-	if (!wcid)
+	if (!sta)
 		return;
 
+	wcid = (struct mt76_wcid *)sta->drv_priv;
 	hdr_trans->dis_rx_hdr_tran = !test_bit(MT_WCID_FLAG_HDR_TRANS, &wcid->flags);
 	if (test_bit(MT_WCID_FLAG_4ADDR, &wcid->flags)) {
 		hdr_trans->to_ds = true;
@@ -2154,6 +2154,9 @@ int mt7996_mcu_add_sta(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 	if (!enable)
 		goto out;
 
+	/* starec hdr trans */
+	mt7996_mcu_sta_hdr_trans_tlv(dev, skb, vif, sta);
+
 	/* tag order is in accordance with firmware dependency. */
 	if (sta) {
 		/* starec hdrt mode */
@@ -2178,8 +2181,6 @@ int mt7996_mcu_add_sta(struct mt7996_dev *dev, struct ieee80211_vif *vif,
 		mt7996_mcu_sta_muru_tlv(dev, skb, vif, sta);
 		/* starec bfee */
 		mt7996_mcu_sta_bfee_tlv(dev, skb, vif, sta);
-		/* starec hdr trans */
-		mt7996_mcu_sta_hdr_trans_tlv(dev, skb, vif, sta);
 	}
 
 	ret = mt7996_mcu_add_group(dev, vif, sta);
-- 
2.39.2


