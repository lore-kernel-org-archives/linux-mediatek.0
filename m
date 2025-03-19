Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04387C35FFF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Mar 2025 07:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wn9Y9We8zr+xcn2DywuhPD4tlkGGZjxM4p444Wcp2ok=; b=uPH6ODMZ5m+VcsiuKeI0tFbSLe
	uJyRloY6IBFI6fsf//LNJbLrxs3W0qLdRFaykGp2XDie3V+c6+Z6dCcnRRq+t0Qu9/k1jkdE7mefM
	rlfTVlDZPbitl79Nqb3iFmYamIEiA09HhVSv4abnDFGXA/fsOGMdHbku22JcNcBkjKCmg4w6SMRbz
	nvnTKc384lOkgkOKXJS2nAg91uhnMyfk+zzLtErevU2kF8iYuxac40VQ4Ex4BslzTyfTgg9CF2FdK
	oGhHCSdpWCIHwFjyeFyuNggXHiUoqy2X3+c1nWev57kPY2g5rpFyBtFvsojlx8mG+7irocoMPa6su
	If7/aAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuo8C-00000008GAz-0jK4;
	Wed, 19 Mar 2025 07:46:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuo6h-00000008FuW-43V1
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Mar 2025 07:44:57 +0000
X-UUID: 09d1228a049611f083f2a1c9db70dae0-20250319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=wn9Y9We8zr+xcn2DywuhPD4tlkGGZjxM4p444Wcp2ok=;
	b=khhGAp13wOftmjmpkTUNyPuRwQSEN7uR1SGx+xtHt9fQRYBFu9QLqYIzuxqH8bwGu3zAVJK8vQRzePPYxosmW5T5wVeLrMpoAmp9OJJCzRq5RIVM3vvOy4vlvaEoxZBQIqc9244Bve0xMuRS/sVgmTYanCcf5sGyao3xjfiLUWU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:68442573-b208-4bcb-8344-04e62c106a3f,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:172d88c6-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 09d1228a049611f083f2a1c9db70dae0-20250319
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 319711196; Wed, 19 Mar 2025 00:44:50 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 19 Mar 2025 15:44:48 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 19 Mar 2025 15:44:48 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH 2/2] wifi: mt76: mt7925: add RNR scan support for 6GHz
Date: Wed, 19 Mar 2025 15:44:26 +0800
Message-ID: <20250319074426.3782102-2-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250319074426.3782102-1-mingyen.hsieh@mediatek.com>
References: <20250319074426.3782102-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_004456_010133_5A0A1F7D 
X-CRM114-Status: GOOD (  13.75  )
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

Enhance the mt7925 to include RNR scan support. It adds
the necessary RNR information to the scan command.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 35 +++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   | 17 +++++----
 2 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 243adace8799..7e24c4aa1e61 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -3042,6 +3042,7 @@ int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	struct mt76_dev *mdev = phy->dev;
 	struct mt76_connac_mcu_scan_channel *chan;
 	struct sk_buff *skb;
+	u32 short_ssid[MT7925_RNR_SCAN_MAX_BSSIDS] = {0};
 
 	struct scan_hdr_tlv *hdr;
 	struct scan_req_tlv *req;
@@ -3054,8 +3055,8 @@ int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	int max_len;
 
 	max_len = sizeof(*hdr) + sizeof(*req) + sizeof(*ssid) +
-				sizeof(*bssid) + sizeof(*chan_info) +
-				sizeof(*misc) + sizeof(*ie);
+		  sizeof(*bssid) * MT7925_RNR_SCAN_MAX_BSSIDS +
+		  sizeof(*chan_info) + sizeof(*misc) + sizeof(*ie);
 
 	skb = mt76_mcu_msg_alloc(mdev, NULL, max_len);
 	if (!skb)
@@ -3078,7 +3079,11 @@ int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	for (i = 0; i < sreq->n_ssids; i++) {
 		if (!sreq->ssids[i].ssid_len)
 			continue;
+		if (i > MT7925_RNR_SCAN_MAX_BSSIDS)
+			break;
 
+		short_ssid[i] = ~crc32_le(~0, sreq->ssids[i].ssid,
+				sreq->ssids[i].ssid_len);
 		ssid->ssids[i].ssid_len = cpu_to_le32(sreq->ssids[i].ssid_len);
 		memcpy(ssid->ssids[i].ssid, sreq->ssids[i].ssid,
 		       sreq->ssids[i].ssid_len);
@@ -3087,6 +3092,32 @@ int mt7925_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 	ssid->ssid_type = n_ssids ? BIT(2) : BIT(0);
 	ssid->ssids_num = n_ssids;
 
+	if (sreq->n_6ghz_params) {
+		u8 j;
+
+		mt76_connac_mcu_build_rnr_scan_param(mdev, sreq);
+
+		for (j = 0; j < mdev->rnr.bssid_num; j++) {
+			if (j > MT7925_RNR_SCAN_MAX_BSSIDS)
+				break;
+
+			tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_BSSID,
+						      sizeof(*bssid));
+			bssid = (struct scan_bssid_tlv *)tlv;
+
+			memcpy(bssid->bssid, mdev->rnr.bssid[j], ETH_ALEN);
+			bssid->match_ch = mdev->rnr.channel[j];
+			bssid->match_ssid_ind = MT7925_RNR_SCAN_MAX_BSSIDS;
+			bssid->match_short_ssid_ind = MT7925_RNR_SCAN_MAX_BSSIDS;
+		}
+		req->scan_func |= SCAN_FUNC_RNR_SCAN;
+	} else {
+		tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_BSSID, sizeof(*bssid));
+		bssid = (struct scan_bssid_tlv *)tlv;
+
+		memcpy(bssid->bssid, sreq->bssid, ETH_ALEN);
+	}
+
 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_SCAN_BSSID, sizeof(*bssid));
 	bssid = (struct scan_bssid_tlv *)tlv;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 0419aa922e17..96809c2fdff9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -196,6 +196,7 @@ enum {
 	UNI_SNIFFER_CONFIG,
 };
 
+#define MT7925_RNR_SCAN_MAX_BSSIDS	10
 struct scan_hdr_tlv {
 	/* fixed field */
 	u8 seq_num;
@@ -223,7 +224,7 @@ struct scan_req_tlv {
 	__le16 timeout_value;
 	__le16 probe_delay_time;
 	__le32 func_mask_ext;
-};
+} __packed;
 
 struct scan_ssid_tlv {
 	__le16 tag;
@@ -235,9 +236,10 @@ struct scan_ssid_tlv {
 		       * BIT(2) + ssid_type_ext BIT(0) specified SSID only
 		       */
 	u8 ssids_num;
-	u8 pad[2];
-	struct mt76_connac_mcu_scan_ssid ssids[4];
-};
+	u8 is_short_ssid;
+	u8 pad;
+	struct mt76_connac_mcu_scan_ssid ssids[MT7925_RNR_SCAN_MAX_BSSIDS];
+} __packed;
 
 struct scan_bssid_tlv {
 	__le16 tag;
@@ -247,8 +249,9 @@ struct scan_bssid_tlv {
 	u8 match_ch;
 	u8 match_ssid_ind;
 	u8 rcpi;
-	u8 pad[3];
-};
+	u8 match_short_ssid_ind;
+	u8 pad[2];
+} __packed;
 
 struct scan_chan_info_tlv {
 	__le16 tag;
@@ -264,7 +267,7 @@ struct scan_chan_info_tlv {
 	u8 channels_num; /* valid when channel_type is 4 */
 	u8 pad[2];
 	struct mt76_connac_mcu_scan_channel channels[64];
-};
+} __packed;
 
 struct scan_ie_tlv {
 	__le16 tag;
-- 
2.34.1


