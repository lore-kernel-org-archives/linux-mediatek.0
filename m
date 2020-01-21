Return-Path: <SRS0=O6hk=3K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B8CC2D0DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 14:24:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C90E52253D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 14:24:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WRk/uNTw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SOR/BUjU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C90E52253D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HG/22yOFpMDYeKt1QoTmTQxM4KWHIviD8/qNS/7CLqE=; b=WRk/uNTw9LLRTB
	7Brm6BHOQ+T24LFaJOmoP5nuyc0qh3xT0HLLqqg6MzqGf8aG3tXb+DwjPf+XE8JyWR/LE4XbCvFrQ
	jTYGqmzj50bxJjWl0FX3AWZXmTsTuVZJNPsFCz2+VQe9nkEuWPLibemHIfBcpOMOZkEQ+dGpMK5b+
	R4LLlgIqJLmEhQfsCZRWTyfqQHPagGdNVN+GkN4RJr0oR6yEO2mT0rbxF2J1bBmjxEg2BcMy9n0mZ
	+OaskUZEM55ECxY9fxrJRxJYtmfumdQYYUIAu/AqFa1IzzF9Aw/omLyjYW5Udn4U02/VGz4xG/Eh3
	jpqZ0Zi/tv7Ft9JMEtkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ituRh-0000M8-W7; Tue, 21 Jan 2020 14:23:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ituRe-0000LN-V6
 for linux-mediatek@lists.infradead.org; Tue, 21 Jan 2020 14:23:57 +0000
X-UUID: 9a3d7125093640ca99b00662a87c70f6-20200121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KtlNlbWIO3TE4VqPVhX1nuT/0fx5nAtjYuJTFyrYtfE=; 
 b=SOR/BUjUfqu3uck6vKXffpM7hf5s63E7OOjFNgzHySodi4t6O6403wYypAH1IE1+2RslM2wg2zl4RrDhlUGBxmWCTOVhyZJDd5V7uyOScA7tF23pvoVzLFjueJEZU4AkZmPOlGn5xoYZ+5+o3LrZEVcAcDd7XCKmlrFYsHSIt4w=;
X-UUID: 9a3d7125093640ca99b00662a87c70f6-20200121
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 180712777; Tue, 21 Jan 2020 06:23:52 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 06:13:51 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 22:13:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 21 Jan 2020 22:13:29 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 3/7] mt76: mt7615: add a helper to encapsulate sta_rec
 operation
Date: Tue, 21 Jan 2020 22:13:38 +0800
Message-ID: <21aa7ee4f30895a177e624de61d431a382664667.1579237414.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <ae72dd289f8a26a2c0f42de1f940bb8b6d1f2c29.1579237414.git.ryder.lee@mediatek.com>
References: <ae72dd289f8a26a2c0f42de1f940bb8b6d1f2c29.1579237414.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 63F8B728CD1220762B672EA248788219B02C7EB59FEEF0A69A95EBA16847355D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_062355_018164_63D90563 
X-CRM114-Status: GOOD (  10.01  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Sean
 Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Roy Luo <royluo@google.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Operating command is simpler and just as clear

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Tested-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 116 +++++++++---------
 1 file changed, 59 insertions(+), 57 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 30ff08bc9afc..6bef0dcb83b7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -988,6 +988,27 @@ int mt7615_mcu_del_wtbl_all(struct mt7615_dev *dev)
 				   &req, sizeof(req), true);
 }
 
+static int
+mt7615_mcu_send_sta_rec(struct mt7615_dev *dev, u8 *req, u8 *wreq,
+			u8 wlen, bool enable)
+{
+	u32 slen = wreq - req;
+
+	if (!enable) {
+		__mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_STA_REC_UPDATE,
+				    req, slen, true);
+
+		return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
+					   wreq, wlen, true);
+	}
+
+	__mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE, wreq,
+			    wlen, true);
+
+	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_STA_REC_UPDATE,
+				   req, slen, true);
+}
+
 int mt7615_mcu_set_bmc(struct mt7615_dev *dev,
 		       struct ieee80211_vif *vif, bool en)
 {
@@ -1029,13 +1050,7 @@ int mt7615_mcu_set_bmc(struct mt7615_dev *dev,
 	} else {
 		req.basic.conn_state = CONN_STATE_DISCONNECT;
 		req.basic.extra_info = cpu_to_le16(EXTRA_INFO_VER);
-
-		__mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_STA_REC_UPDATE,
-				    &req, (u8 *)wtbl_hdr - (u8 *)&req, true);
-
-		return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
-					   (u8 *)wtbl_hdr, buf - (u8 *)wtbl_hdr,
-					   true);
+		goto out;
 	}
 
 	wtbl_g = (struct wtbl_generic *)buf;
@@ -1055,11 +1070,9 @@ int mt7615_mcu_set_bmc(struct mt7615_dev *dev,
 
 	wtbl_hdr->tlv_num = cpu_to_le16(2);
 
-	__mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
-			    (u8 *)wtbl_hdr, buf - (u8 *)wtbl_hdr, true);
-
-	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_STA_REC_UPDATE,
-				   &req, (u8 *)wtbl_hdr - (u8 *)&req, true);
+out:
+	return mt7615_mcu_send_sta_rec(dev, (u8 *)&req, (u8 *)wtbl_hdr,
+				       buf - (u8 *)wtbl_hdr, en);
 }
 
 int mt7615_mcu_set_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
@@ -1076,7 +1089,6 @@ int mt7615_mcu_set_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 		.hdr = {
 			.bss_idx = mvif->idx,
 			.wlan_idx = msta->wcid.idx,
-			.tlv_num = cpu_to_le16(1),
 			.is_tlv_append = 1,
 			.muar_idx = mvif->omac_idx,
 		},
@@ -1115,49 +1127,38 @@ int mt7615_mcu_set_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 		req.basic.conn_state = CONN_STATE_PORT_SECURE;
 		req.basic.extra_info = cpu_to_le16(EXTRA_INFO_VER |
 						   EXTRA_INFO_NEW);
-	} else {
-		req.basic.conn_state = CONN_STATE_DISCONNECT;
-		req.basic.extra_info = cpu_to_le16(EXTRA_INFO_VER);
-
-		/* wtbl reset */
-		wtbl_hdr = (struct wtbl_req_hdr *)buf;
-		buf += sizeof(*wtbl_hdr);
-		wtbl_hdr->wlan_idx = msta->wcid.idx;
-		wtbl_hdr->operation = WTBL_RESET_AND_SET;
 
-		__mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_STA_REC_UPDATE,
-				    &req, req.buf - (u8 *)&req, true);
+		/* sta_rec ht */
+		if (sta->ht_cap.ht_supported) {
+			struct sta_rec_ht *sta_ht;
 
-		return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
-					   req.buf, buf - req.buf, true);
-	}
-
-	/* sta_rec ht */
-	if (sta->ht_cap.ht_supported) {
-		struct sta_rec_ht *sta_ht;
-
-		sta_ht = (struct sta_rec_ht *)buf;
-		buf += sizeof(*sta_ht);
-		sta_ht->tag = cpu_to_le16(STA_REC_HT);
-		sta_ht->len = cpu_to_le16(sizeof(*sta_ht));
-		sta_ht->ht_cap = cpu_to_le16(sta->ht_cap.cap);
-		stlv++;
-
-		/* sta_rec vht */
-		if (sta->vht_cap.vht_supported) {
-			struct sta_rec_vht *sta_vht;
-
-			sta_vht = (struct sta_rec_vht *)buf;
-			buf += sizeof(*sta_vht);
-			sta_vht->tag = cpu_to_le16(STA_REC_VHT);
-			sta_vht->len = cpu_to_le16(sizeof(*sta_vht));
-			sta_vht->vht_cap = cpu_to_le32(sta->vht_cap.cap);
-			sta_vht->vht_rx_mcs_map =
-				sta->vht_cap.vht_mcs.rx_mcs_map;
-			sta_vht->vht_tx_mcs_map =
-				sta->vht_cap.vht_mcs.tx_mcs_map;
+			sta_ht = (struct sta_rec_ht *)buf;
+			buf += sizeof(*sta_ht);
+			sta_ht->tag = cpu_to_le16(STA_REC_HT);
+			sta_ht->len = cpu_to_le16(sizeof(*sta_ht));
+			sta_ht->ht_cap = cpu_to_le16(sta->ht_cap.cap);
 			stlv++;
+
+			/* sta_rec vht */
+			if (sta->vht_cap.vht_supported) {
+				struct sta_rec_vht *sta_vht;
+
+				sta_vht = (struct sta_rec_vht *)buf;
+				buf += sizeof(*sta_vht);
+				sta_vht->tag = cpu_to_le16(STA_REC_VHT);
+				sta_vht->len = cpu_to_le16(sizeof(*sta_vht));
+				sta_vht->vht_cap =
+					cpu_to_le32(sta->vht_cap.cap);
+				sta_vht->vht_rx_mcs_map =
+					sta->vht_cap.vht_mcs.rx_mcs_map;
+				sta_vht->vht_tx_mcs_map =
+					sta->vht_cap.vht_mcs.tx_mcs_map;
+				stlv++;
+			}
 		}
+	} else {
+		req.basic.conn_state = CONN_STATE_DISCONNECT;
+		req.basic.extra_info = cpu_to_le16(EXTRA_INFO_VER);
 	}
 
 	/* wtbl */
@@ -1166,6 +1167,9 @@ int mt7615_mcu_set_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 	wtbl_hdr->wlan_idx = msta->wcid.idx;
 	wtbl_hdr->operation = WTBL_RESET_AND_SET;
 
+	if (!en)
+		goto out;
+
 	wtbl_g = (struct wtbl_generic *)buf;
 	buf += sizeof(*wtbl_g);
 	wtbl_g->tag = cpu_to_le16(WTBL_GENERIC);
@@ -1252,14 +1256,12 @@ int mt7615_mcu_set_sta(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 		wtlv++;
 	}
 
+out:
 	wtbl_hdr->tlv_num = cpu_to_le16(wtlv);
 	req.hdr.tlv_num = cpu_to_le16(stlv);
 
-	__mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE, (u8 *)wtbl_hdr,
-			    buf - (u8 *)wtbl_hdr, true);
-
-	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_STA_REC_UPDATE,
-				   &req, (u8 *)wtbl_hdr - (u8 *)&req, true);
+	return mt7615_mcu_send_sta_rec(dev, (u8 *)&req, (u8 *)wtbl_hdr,
+				       buf - (u8 *)wtbl_hdr, en);
 }
 
 int mt7615_mcu_set_bcn(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
