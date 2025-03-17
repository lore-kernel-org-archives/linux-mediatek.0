Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C06FC28B2F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Mar 2025 01:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8f3O8+Vo5Qr0rRuYESppba9QH9iD9l4PD8gsXyGmArc=; b=VZwNjxUCKuIF7iPzdhvt7Iq+nr
	G0t0lvoFEaYsvRqu/vHdENI6UPqv4CDL/QJMjK479AoHxnl8w18TK4soy16yIhq6gHzEN7ng2mITz
	FJe4fYjB9VjpQFuG1JSQYztD4uZvbxvhN1hZupHSTes8xQp4flJqmLam6umuIiM71ZP3LLi4Y5bjY
	Q+HsxSrWBl3berFQ7m4HPTbYrWQvCz+6+vQ9L96/yMgDPM3+SbdlB0krbHoA0rcnKeRC2m7z06RK8
	B7OHaYhwnYyLntlyn1xU2u2r/cnwMLFW7kjQ59H3U04M4yrx9IRKxqVcYPS+sLBf3091xsdDIQzk5
	W7SgOSdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttz6o-00000000pSh-1IwX;
	Mon, 17 Mar 2025 01:17:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttz6l-00000000pRm-0SXH
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Mar 2025 01:17:36 +0000
X-UUID: 97737b3a02cd11f0a1e849db4cc18d44-20250316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=8f3O8+Vo5Qr0rRuYESppba9QH9iD9l4PD8gsXyGmArc=;
	b=l3SlpSEZlbo41hrVem6rlpYpEOhV6GmtUfwqoKTDvjkIRacY8APWyPdOnKdJlWAY3SsV0VqxdIJXo9drYgrpRACMcLqbUerZWFtbdmwkf/fkX9qyi9rz97dKzyaVbYbrx2bbC73Igr7hicQISHiXqNU9JWjWL68M4DQNf/FXU7Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:bf0bb8cc-eac9-42df-9c2a-e782c4824620,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:f34c3be1-3561-4519-9a12-e2c881788b70,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 97737b3a02cd11f0a1e849db4cc18d44-20250316
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 110200769; Sun, 16 Mar 2025 18:17:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 17 Mar 2025 09:17:25 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 17 Mar 2025 09:17:25 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>, <stable@vger.kernel.org>
Subject: [PATCH v3] wifi: mt76: mt7925: fix the incomplete revert of [tx,rx]_ba for MLO
Date: Mon, 17 Mar 2025 09:17:24 +0800
Message-ID: <20250317011724.3326979-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_181735_176234_092B875C 
X-CRM114-Status: UNSURE (   8.57  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Since the `Revert wifi: mt76: mt7925: Update mt7925_mcu_uni_[tx,rx]_ba for MLO`
was not completely clean, submit this patch to fully clean it up.

Cc: stable@vger.kernel.org
Fixes: 73915469c55a ("Revert "wifi: mt76: mt7925: Update mt7925_mcu_uni_[tx,rx]_ba for MLO"")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
v2: rewrite the subject
v3: remove the change-Id
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 1ecba46d770d..1bdc313844c4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -572,10 +572,10 @@ void mt7925_mcu_rx_event(struct mt792x_dev *dev, struct sk_buff *skb)
 
 static int
 mt7925_mcu_sta_ba(struct mt76_dev *dev, struct mt76_vif_link *mvif,
-		  struct mt76_wcid *wcid,
 		  struct ieee80211_ampdu_params *params,
 		  bool enable, bool tx)
 {
+	struct mt76_wcid *wcid = (struct mt76_wcid *)params->sta->drv_priv;
 	struct sta_rec_ba_uni *ba;
 	struct sk_buff *skb;
 	struct tlv *tlv;
@@ -608,13 +608,12 @@ int mt7925_mcu_uni_tx_ba(struct mt792x_dev *dev,
 {
 	struct mt792x_sta *msta = (struct mt792x_sta *)params->sta->drv_priv;
 	struct mt792x_vif *mvif = msta->vif;
-	struct mt76_wcid *wcid = &mvif->sta.deflink.wcid;
 
 	if (enable && !params->amsdu)
 		msta->deflink.wcid.amsdu = false;
 
-	return mt7925_mcu_sta_ba(&dev->mt76, &mvif->bss_conf.mt76, wcid,
-				 params, enable, true);
+	return mt7925_mcu_sta_ba(&dev->mt76, &mvif->bss_conf.mt76, params,
+				 enable, true);
 }
 
 int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
@@ -623,10 +622,9 @@ int mt7925_mcu_uni_rx_ba(struct mt792x_dev *dev,
 {
 	struct mt792x_sta *msta = (struct mt792x_sta *)params->sta->drv_priv;
 	struct mt792x_vif *mvif = msta->vif;
-	struct mt76_wcid *wcid = &mvif->sta.deflink.wcid;
 
-	return mt7925_mcu_sta_ba(&dev->mt76, &mvif->bss_conf.mt76, wcid,
-				 params, enable, false);
+	return mt7925_mcu_sta_ba(&dev->mt76, &mvif->bss_conf.mt76, params,
+				 enable, false);
 }
 
 static int mt7925_mcu_read_eeprom(struct mt792x_dev *dev, u32 offset, u8 *val)
-- 
2.45.2


