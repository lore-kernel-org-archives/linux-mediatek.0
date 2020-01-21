Return-Path: <SRS0=O6hk=3K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC98FC33CAA
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 14:14:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E41E217F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 14:14:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sNsI0441";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RbnoNbSC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E41E217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GL8rZ8AfSKihf69+3ALBh030rM26vH1442wIS6W+Df0=; b=sNsI0441FFXFhr
	YHYgm5TERskFR/Y9ty5AakgjzMvse39AmyJdVG8PfXHC+0gwb+VzqIjifowahsKZ9oIhqCnZqKem/
	qiXmOxEZmEYSpEJdIqGmGJWDU+zjRwKyoHGcjI+G5WSvQsm60Agfb0bdy6gxg3iY/dUIjIHuR2ZZ0
	7NtBKgNcfQ8f2eod7+vZlTYtFZxgrLMFYd2IeNlcPKn6aiew2hEj8CBHxd5hFIPlf29r2WJ9EGdWp
	iFDf8ORFhRzHE3oGViRQo8zY5MW64F1PNqtXaAwTsBfayvff0Un2D9wiFgLH8qTNzW93jhJxPdVfk
	QRRF8TayauNlebyD+L8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ituIE-0004rT-8Y; Tue, 21 Jan 2020 14:14:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ituI6-0004my-2U
 for linux-mediatek@lists.infradead.org; Tue, 21 Jan 2020 14:14:08 +0000
X-UUID: f6f7ab4d50f04e1abcbc8067058a8b06-20200121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=24BySXTwGTSGUY3r5/4BFwTSE6OPxFovC6DLkoRLAgM=; 
 b=RbnoNbSCpQ4BbmgOxDJggBEvgkhfWPzwbD2jsh84Lh8t17D07PY/aOjc0Hm5Zd2e86YbLqdvvbsqxuAXgjjE2LAqFUKc/Fn1CJYFLQgaZ+45fpiRkfwjQUXfx1KmU10dfNi9z2nRSz3stHj/G0Z3DYdVIMTGROVpu5uIOzAJF5M=;
X-UUID: f6f7ab4d50f04e1abcbc8067058a8b06-20200121
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1588809486; Tue, 21 Jan 2020 06:13:57 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 06:14:55 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 22:14:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 21 Jan 2020 22:13:27 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 1/7] mt76: mt7615: simplify mcu_set_bmc flow
Date: Tue, 21 Jan 2020 22:13:36 +0800
Message-ID: <ae72dd289f8a26a2c0f42de1f940bb8b6d1f2c29.1579237414.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_061402_123766_42BC83D0 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

Move mcu_wtbl_bmc into mcu_set_sta_rec_bmc to simplify flow.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/main.c  |  3 +-
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 97 ++++++++-----------
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  6 +-
 3 files changed, 45 insertions(+), 61 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 2a85859da754..dbf6200525c4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -425,8 +425,7 @@ static void mt7615_bss_info_changed(struct ieee80211_hw *hw,
 
 	if (changed & BSS_CHANGED_BEACON_ENABLED) {
 		mt7615_mcu_set_bss_info(dev, vif, info->enable_beacon);
-		mt7615_mcu_wtbl_bmc(dev, vif, info->enable_beacon);
-		mt7615_mcu_set_sta_rec_bmc(dev, vif, info->enable_beacon);
+		mt7615_mcu_set_bmc(dev, vif, info->enable_beacon);
 	}
 
 	if (changed & (BSS_CHANGED_BEACON |
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index c8d6a36f5d0a..73a5bf11e902 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -978,57 +978,6 @@ int mt7615_mcu_set_bss_info(struct mt7615_dev *dev,
 	return ret;
 }
 
-static int
-mt7615_mcu_add_wtbl_bmc(struct mt7615_dev *dev,
-			struct mt7615_vif *mvif)
-{
-	struct {
-		struct wtbl_req_hdr hdr;
-		struct wtbl_generic g_wtbl;
-		struct wtbl_rx rx_wtbl;
-	} req = {
-		.hdr = {
-			.wlan_idx = mvif->sta.wcid.idx,
-			.operation = WTBL_RESET_AND_SET,
-			.tlv_num = cpu_to_le16(2),
-		},
-		.g_wtbl = {
-			.tag = cpu_to_le16(WTBL_GENERIC),
-			.len = cpu_to_le16(sizeof(struct wtbl_generic)),
-			.muar_idx = 0xe,
-		},
-		.rx_wtbl = {
-			.tag = cpu_to_le16(WTBL_RX),
-			.len = cpu_to_le16(sizeof(struct wtbl_rx)),
-			.rca1 = 1,
-			.rca2 = 1,
-			.rv = 1,
-		},
-	};
-	eth_broadcast_addr(req.g_wtbl.peer_addr);
-
-	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
-				   &req, sizeof(req), true);
-}
-
-int mt7615_mcu_wtbl_bmc(struct mt7615_dev *dev,
-			struct ieee80211_vif *vif, bool enable)
-{
-	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
-
-	if (!enable) {
-		struct wtbl_req_hdr req = {
-			.wlan_idx = mvif->sta.wcid.idx,
-			.operation = WTBL_RESET_AND_SET,
-		};
-
-		return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
-					   &req, sizeof(req), true);
-	}
-
-	return mt7615_mcu_add_wtbl_bmc(dev, mvif);
-}
-
 int mt7615_mcu_add_wtbl(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 			struct ieee80211_sta *sta)
 {
@@ -1088,14 +1037,15 @@ int mt7615_mcu_del_wtbl_all(struct mt7615_dev *dev)
 				   &req, sizeof(req), true);
 }
 
-int mt7615_mcu_set_sta_rec_bmc(struct mt7615_dev *dev,
-			       struct ieee80211_vif *vif, bool en)
+int mt7615_mcu_set_bmc(struct mt7615_dev *dev,
+		       struct ieee80211_vif *vif, bool en)
 {
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 	struct {
 		struct sta_req_hdr hdr;
 		struct sta_rec_basic basic;
-	} req = {
+		u8 buf[MT7615_WTBL_UPDATE_MAX_SIZE];
+	} __packed req = {
 		.hdr = {
 			.bss_idx = mvif->idx,
 			.wlan_idx = mvif->sta.wcid.idx,
@@ -1109,8 +1059,18 @@ int mt7615_mcu_set_sta_rec_bmc(struct mt7615_dev *dev,
 			.conn_type = cpu_to_le32(CONNECTION_INFRA_BC),
 		},
 	};
+	struct wtbl_req_hdr *wtbl_hdr;
+	struct wtbl_generic *wtbl_g;
+	struct wtbl_rx *wtbl_rx;
+	u8 *buf = req.buf;
+
 	eth_broadcast_addr(req.basic.peer_addr);
 
+	wtbl_hdr = (struct wtbl_req_hdr *)buf;
+	buf += sizeof(*wtbl_hdr);
+	wtbl_hdr->wlan_idx = mvif->sta.wcid.idx;
+	wtbl_hdr->operation = WTBL_RESET_AND_SET;
+
 	if (en) {
 		req.basic.conn_state = CONN_STATE_PORT_SECURE;
 		req.basic.extra_info = cpu_to_le16(EXTRA_INFO_VER |
@@ -1118,10 +1078,37 @@ int mt7615_mcu_set_sta_rec_bmc(struct mt7615_dev *dev,
 	} else {
 		req.basic.conn_state = CONN_STATE_DISCONNECT;
 		req.basic.extra_info = cpu_to_le16(EXTRA_INFO_VER);
+
+		__mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_STA_REC_UPDATE,
+				    &req, (u8 *)wtbl_hdr - (u8 *)&req, true);
+
+		return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
+					   (u8 *)wtbl_hdr, buf - (u8 *)wtbl_hdr,
+					   true);
 	}
 
+	wtbl_g = (struct wtbl_generic *)buf;
+	buf += sizeof(*wtbl_g);
+	wtbl_g->tag = cpu_to_le16(WTBL_GENERIC);
+	wtbl_g->len = cpu_to_le16(sizeof(*wtbl_g));
+	wtbl_g->muar_idx = 0xe;
+	eth_broadcast_addr(wtbl_g->peer_addr);
+
+	wtbl_rx = (struct wtbl_rx *)buf;
+	buf += sizeof(*wtbl_rx);
+	wtbl_rx->tag = cpu_to_le16(WTBL_RX);
+	wtbl_rx->len = cpu_to_le16(sizeof(*wtbl_rx));
+	wtbl_rx->rv = 1;
+	wtbl_rx->rca1 = 1;
+	wtbl_rx->rca2 = 1;
+
+	wtbl_hdr->tlv_num = cpu_to_le16(2);
+
+	__mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_WTBL_UPDATE,
+			    (u8 *)wtbl_hdr, buf - (u8 *)wtbl_hdr, true);
+
 	return __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_STA_REC_UPDATE,
-				   &req, sizeof(req), true);
+				   &req, (u8 *)wtbl_hdr - (u8 *)&req, true);
 }
 
 int mt7615_mcu_set_sta_rec(struct mt7615_dev *dev, struct ieee80211_vif *vif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index eaafae9cc279..84949256601f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -241,14 +241,12 @@ int mt7615_mcu_set_bss_info(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 void mt7615_mac_set_rates(struct mt7615_phy *phy, struct mt7615_sta *sta,
 			  struct ieee80211_tx_rate *probe_rate,
 			  struct ieee80211_tx_rate *rates);
-int mt7615_mcu_wtbl_bmc(struct mt7615_dev *dev, struct ieee80211_vif *vif,
-			bool enable);
 int mt7615_mcu_add_wtbl(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 			struct ieee80211_sta *sta);
 int mt7615_mcu_del_wtbl(struct mt7615_dev *dev, struct ieee80211_sta *sta);
 int mt7615_mcu_del_wtbl_all(struct mt7615_dev *dev);
-int mt7615_mcu_set_sta_rec_bmc(struct mt7615_dev *dev,
-			       struct ieee80211_vif *vif, bool en);
+int mt7615_mcu_set_bmc(struct mt7615_dev *dev, struct ieee80211_vif *vif,
+		       bool en);
 int mt7615_mcu_set_sta_rec(struct mt7615_dev *dev, struct ieee80211_vif *vif,
 			   struct ieee80211_sta *sta, bool en);
 int mt7615_mcu_set_bcn(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
