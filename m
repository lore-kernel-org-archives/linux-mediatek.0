Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04652C2BB1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8A7220663
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 16:42:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BoQ41chT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CX5VmzsS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8A7220663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ttZzqjNIwOvL7/gY88O77rL6WARWl5d0Cf+T3wq/UnE=; b=BoQ41chTjsYdpW
	kPJ/sWkbmus4fWgT2ocMAWIfDk2cojJ75lodCKHilV7jGe84kuJHFE/tPShYPiw4k6zP5XfghStkZ
	teE3G2JWhTJ7kf9fmerDxj+TOdOBy7LO7fdCZAHbL4t9MRSn1pE2fD6CbRIrEjz4OhmrQj7O8xsPp
	o++xwnL+oYH7uPDaIH9miW6UURPjLGNND8m9ooRwndN9vKlfTx/BVtqVXCWvPasNSy0ots6bCchJZ
	VLHJanCdAEBDgbuV1JR4fmlOMfURCuYa6w1oEuCKUuSu0ZjpySlhfNoI44RWU7w14OlpOAIiD3Af7
	fVpnkXaxATAo//AMbXXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEFIJ-0006ts-NU; Tue, 17 Mar 2020 16:42:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEFID-0006ep-HP
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 16:42:15 +0000
Received: from lore-desk-wlan.redhat.com (unknown [151.48.128.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF4AC20757;
 Tue, 17 Mar 2020 16:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584463333;
 bh=72kthdFaU9uA3Y2Zun9swaPGJveUk/1h57rGYcLuVX4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CX5VmzsStlGE76D+v0RM5YwnxpegZOpjdXWmG0j2CHounmOyY2R2upWbM/JO8EuUB
 jihVaxI6d7duETOy0g4MX1kJXfZbipX7tJbILpyGcbExJsDZbyk+GDL45VkynKfU4T
 y+iSXV82xNw3mlOsW43+9G1q6aHhYVKYtGUSnGGo=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v4 11/25] mt76: mt7615: rework mt7615_mcu_set_bss_info using
 skb APIs
Date: Tue, 17 Mar 2020 17:41:18 +0100
Message-Id: <27d44769758fdfc95f9de311f188b8ae024368c0.1584463004.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1584463004.git.lorenzo@kernel.org>
References: <cover.1584463004.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_094213_649543_352E4C94 
X-CRM114-Status: GOOD (  13.73  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Simplify mt7615_mcu_set_bss_info relying on mcu tlv helpers

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 274 ++++++++----------
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |   2 +-
 2 files changed, 125 insertions(+), 151 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 73ec31b20d21..e5df46d7648a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -317,8 +317,8 @@ mt7615_mcu_alloc_sta_req(struct mt7615_vif *mvif, struct mt7615_sta *msta)
 {
 	struct sta_req_hdr hdr = {
 		.bss_idx = mvif->idx,
-		.wlan_idx = msta->wcid.idx,
-		.muar_idx = mvif->omac_idx,
+		.wlan_idx = msta ? msta->wcid.idx : 0,
+		.muar_idx = msta ? mvif->omac_idx : 0,
 		.is_tlv_append = 1,
 	};
 	struct sk_buff *skb;
@@ -390,6 +390,115 @@ mt7615_mcu_add_tlv(struct sk_buff *skb, int tag, int len)
 	return mt7615_mcu_add_nested_tlv(skb, tag, len, skb->data, NULL);
 }
 
+static int
+mt7615_mcu_bss_basic_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
+			 bool enable)
+{
+	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
+	struct bss_info_basic *bss;
+	u8 wlan_idx = mvif->sta.wcid.idx;
+	u32 type = NETWORK_INFRA;
+	struct tlv *tlv;
+
+	tlv = mt7615_mcu_add_tlv(skb, BSS_INFO_BASIC, sizeof(*bss));
+
+	switch (vif->type) {
+	case NL80211_IFTYPE_MESH_POINT:
+	case NL80211_IFTYPE_AP:
+		break;
+	case NL80211_IFTYPE_STATION:
+		/* TODO: enable BSS_INFO_UAPSD & BSS_INFO_PM */
+		if (enable) {
+			struct ieee80211_sta *sta;
+			struct mt7615_sta *msta;
+
+			rcu_read_lock();
+			sta = ieee80211_find_sta(vif, vif->bss_conf.bssid);
+			if (!sta) {
+				rcu_read_unlock();
+				return -EINVAL;
+			}
+
+			msta = (struct mt7615_sta *)sta->drv_priv;
+			wlan_idx = msta->wcid.idx;
+			rcu_read_unlock();
+		}
+		break;
+	case NL80211_IFTYPE_ADHOC:
+		type = NETWORK_IBSS;
+		break;
+	default:
+		WARN_ON(1);
+		break;
+	}
+
+	bss = (struct bss_info_basic *)tlv;
+	memcpy(bss->bssid, vif->bss_conf.bssid, ETH_ALEN);
+	bss->bcn_interval = cpu_to_le16(vif->bss_conf.beacon_int);
+	bss->network_type = cpu_to_le32(type);
+	bss->dtim_period = vif->bss_conf.dtim_period;
+	bss->bmc_tx_wlan_idx = wlan_idx;
+	bss->wmm_idx = mvif->wmm_idx;
+	bss->active = enable;
+
+	return 0;
+}
+
+static void
+mt7615_mcu_bss_omac_tlv(struct sk_buff *skb, struct ieee80211_vif *vif)
+{
+	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
+	struct bss_info_omac *omac;
+	struct tlv *tlv;
+	u32 type = 0;
+	u8 idx;
+
+	tlv = mt7615_mcu_add_tlv(skb, BSS_INFO_OMAC, sizeof(*omac));
+
+	switch (vif->type) {
+	case NL80211_IFTYPE_MESH_POINT:
+	case NL80211_IFTYPE_AP:
+		type = CONNECTION_INFRA_AP;
+		break;
+	case NL80211_IFTYPE_STATION:
+		type = CONNECTION_INFRA_STA;
+		break;
+	case NL80211_IFTYPE_ADHOC:
+		type = CONNECTION_IBSS_ADHOC;
+		break;
+	default:
+		WARN_ON(1);
+		break;
+	}
+
+	omac = (struct bss_info_omac *)tlv;
+	idx = mvif->omac_idx > EXT_BSSID_START ? HW_BSSID_0 : mvif->omac_idx;
+	omac->conn_type = cpu_to_le32(type);
+	omac->omac_idx = mvif->omac_idx;
+	omac->band_idx = mvif->band_idx;
+	omac->hw_bss_idx = idx;
+}
+
+/* SIFS 20us + 512 byte beacon tranmitted by 1Mbps (3906us) */
+#define BCN_TX_ESTIMATE_TIME (4096 + 20)
+static void
+mt7615_mcu_bss_ext_tlv(struct sk_buff *skb, struct mt7615_vif *mvif)
+{
+	struct bss_info_ext_bss *ext;
+	int ext_bss_idx, tsf_offset;
+	struct tlv *tlv;
+
+	ext_bss_idx = mvif->omac_idx - EXT_BSSID_START;
+	if (ext_bss_idx < 0)
+		return;
+
+	tlv = mt7615_mcu_add_tlv(skb, BSS_INFO_EXT_BSS, sizeof(*ext));
+
+	ext = (struct bss_info_ext_bss *)tlv;
+	tsf_offset = ext_bss_idx * BCN_TX_ESTIMATE_TIME;
+	ext->mbss_tsf_offset = cpu_to_le32(tsf_offset);
+}
+
 static void
 mt7615_mcu_sta_ba_tlv(struct sk_buff *skb,
 		      struct ieee80211_ampdu_params *params,
@@ -1484,161 +1593,26 @@ int mt7615_mcu_set_dev_info(struct mt7615_dev *dev,
 				   &data, sizeof(data), true);
 }
 
-static void
-mt7615_mcu_bss_info_omac_header(struct mt7615_vif *mvif, u8 *data,
-				u32 conn_type)
-{
-	struct bss_info_omac *hdr = (struct bss_info_omac *)data;
-	u8 idx;
-
-	idx = mvif->omac_idx > EXT_BSSID_START ? HW_BSSID_0 : mvif->omac_idx;
-	hdr->tag = cpu_to_le16(BSS_INFO_OMAC);
-	hdr->len = cpu_to_le16(sizeof(struct bss_info_omac));
-	hdr->hw_bss_idx = idx;
-	hdr->omac_idx = mvif->omac_idx;
-	hdr->band_idx = mvif->band_idx;
-	hdr->conn_type = cpu_to_le32(conn_type);
-}
-
-static void
-mt7615_mcu_bss_info_basic_header(struct ieee80211_vif *vif, u8 *data,
-				 u32 net_type, u8 tx_wlan_idx,
-				 bool enable)
+int mt7615_mcu_set_bss_info(struct mt7615_dev *dev, struct ieee80211_vif *vif,
+			    bool enable)
 {
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
-	struct bss_info_basic *hdr = (struct bss_info_basic *)data;
-
-	hdr->tag = cpu_to_le16(BSS_INFO_BASIC);
-	hdr->len = cpu_to_le16(sizeof(struct bss_info_basic));
-	hdr->network_type = cpu_to_le32(net_type);
-	hdr->active = enable;
-	hdr->bcn_interval = cpu_to_le16(vif->bss_conf.beacon_int);
-	memcpy(hdr->bssid, vif->bss_conf.bssid, ETH_ALEN);
-	hdr->wmm_idx = mvif->wmm_idx;
-	hdr->dtim_period = vif->bss_conf.dtim_period;
-	hdr->bmc_tx_wlan_idx = tx_wlan_idx;
-}
-
-static void
-mt7615_mcu_bss_info_ext_header(struct mt7615_vif *mvif, u8 *data)
-{
-/* SIFS 20us + 512 byte beacon tranmitted by 1Mbps (3906us) */
-#define BCN_TX_ESTIMATE_TIME (4096 + 20)
-	struct bss_info_ext_bss *hdr = (struct bss_info_ext_bss *)data;
-	int ext_bss_idx, tsf_offset;
-
-	ext_bss_idx = mvif->omac_idx - EXT_BSSID_START;
-	if (ext_bss_idx < 0)
-		return;
-
-	hdr->tag = cpu_to_le16(BSS_INFO_EXT_BSS);
-	hdr->len = cpu_to_le16(sizeof(struct bss_info_ext_bss));
-	tsf_offset = ext_bss_idx * BCN_TX_ESTIMATE_TIME;
-	hdr->mbss_tsf_offset = cpu_to_le32(tsf_offset);
-}
-
-int mt7615_mcu_set_bss_info(struct mt7615_dev *dev,
-			    struct ieee80211_vif *vif, int en)
-{
-	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
-	struct req_hdr {
-		u8 bss_idx;
-		u8 rsv0;
-		__le16 tlv_num;
-		u8 is_tlv_append;
-		u8 rsv1[3];
-	} __packed;
-	int len = sizeof(struct req_hdr) + sizeof(struct bss_info_basic);
-	int ret, i, features = BIT(BSS_INFO_BASIC), ntlv = 1;
-	u32 conn_type = 0, net_type = NETWORK_INFRA;
-	u8 *buf, *data, tx_wlan_idx = 0;
-	struct req_hdr *hdr;
-
-	if (en) {
-		len += sizeof(struct bss_info_omac);
-		features |= BIT(BSS_INFO_OMAC);
-		if (mvif->omac_idx > EXT_BSSID_START) {
-			len += sizeof(struct bss_info_ext_bss);
-			features |= BIT(BSS_INFO_EXT_BSS);
-			ntlv++;
-		}
-		ntlv++;
-	}
-
-	switch (vif->type) {
-	case NL80211_IFTYPE_AP:
-	case NL80211_IFTYPE_MESH_POINT:
-		tx_wlan_idx = mvif->sta.wcid.idx;
-		conn_type = CONNECTION_INFRA_AP;
-		break;
-	case NL80211_IFTYPE_STATION: {
-		/* TODO: enable BSS_INFO_UAPSD & BSS_INFO_PM */
-		if (en) {
-			struct ieee80211_sta *sta;
-			struct mt7615_sta *msta;
-
-			rcu_read_lock();
-			sta = ieee80211_find_sta(vif, vif->bss_conf.bssid);
-			if (!sta) {
-				rcu_read_unlock();
-				return -EINVAL;
-			}
-
-			msta = (struct mt7615_sta *)sta->drv_priv;
-			tx_wlan_idx = msta->wcid.idx;
-			rcu_read_unlock();
-		}
-		conn_type = CONNECTION_INFRA_STA;
-		break;
-	}
-	case NL80211_IFTYPE_ADHOC:
-		conn_type = CONNECTION_IBSS_ADHOC;
-		tx_wlan_idx = mvif->sta.wcid.idx;
-		net_type = NETWORK_IBSS;
-		break;
-	default:
-		WARN_ON(1);
-		break;
-	}
-
-	buf = kzalloc(len, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
+	struct sk_buff *skb;
 
-	hdr = (struct req_hdr *)buf;
-	hdr->bss_idx = mvif->idx;
-	hdr->tlv_num = cpu_to_le16(ntlv);
-	hdr->is_tlv_append = 1;
+	skb = mt7615_mcu_alloc_sta_req(mvif, NULL);
+	if (IS_ERR(skb))
+		return PTR_ERR(skb);
 
-	data = buf + sizeof(*hdr);
-	for (i = 0; i < BSS_INFO_MAX_NUM; i++) {
-		int tag = ffs(features & BIT(i)) - 1;
+	if (enable)
+		mt7615_mcu_bss_omac_tlv(skb, vif);
 
-		switch (tag) {
-		case BSS_INFO_OMAC:
-			mt7615_mcu_bss_info_omac_header(mvif, data,
-							conn_type);
-			data += sizeof(struct bss_info_omac);
-			break;
-		case BSS_INFO_BASIC:
-			mt7615_mcu_bss_info_basic_header(vif, data, net_type,
-							 tx_wlan_idx, en);
-			data += sizeof(struct bss_info_basic);
-			break;
-		case BSS_INFO_EXT_BSS:
-			mt7615_mcu_bss_info_ext_header(mvif, data);
-			data += sizeof(struct bss_info_ext_bss);
-			break;
-		default:
-			break;
-		}
-	}
+	mt7615_mcu_bss_basic_tlv(skb, vif, enable);
 
-	ret = __mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_BSS_INFO_UPDATE,
-				  buf, len, true);
-	kfree(buf);
+	if (enable && mvif->omac_idx > EXT_BSSID_START)
+		mt7615_mcu_bss_ext_tlv(skb, mvif);
 
-	return ret;
+	return __mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				       MCU_EXT_CMD_BSS_INFO_UPDATE, true);
 }
 
 int mt7615_mcu_del_wtbl_all(struct mt7615_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index ea98c652711f..66fb77e9c311 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -304,7 +304,7 @@ bool mt7615_wait_for_mcu_init(struct mt7615_dev *dev);
 int mt7615_mcu_set_dev_info(struct mt7615_dev *dev,
 			    struct ieee80211_vif *vif, bool enable);
 int mt7615_mcu_set_bss_info(struct mt7615_dev *dev, struct ieee80211_vif *vif,
-			    int en);
+			    bool enable);
 void mt7615_mac_set_rates(struct mt7615_phy *phy, struct mt7615_sta *sta,
 			  struct ieee80211_tx_rate *probe_rate,
 			  struct ieee80211_tx_rate *rates);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
