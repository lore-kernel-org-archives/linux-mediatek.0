Return-Path: <SRS0=Mjju=62=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91106C2D0F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 20:03:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6775B206D6
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 20:03:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GLuGByKm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sFfQ5iCy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6775B206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwDCU8ND3/dkewkGfxjR/uHgZupZtux3DDa3f77hRxw=; b=GLuGByKm2Gl9HT
	M73KNdtEj5xuv04rLFI5VtSg7pewNBAmb7w85UHs8MFcCpT3rwLtt2Fuj7/gcx3od09TCa2gLFDCq
	/oeweB35KDJ5KtqAxityLNAgn4c4iIj+jHMaGqaHn095KgZ7SPlRB5Rh0kA5G8wHWd2CdgRN5mv8Z
	vwmLblw/DSabnY08T3R2D3tPAngULjIVtX2c1iGaIgFjyp7WK+khrYE2/qVRKGedpY3vDrolL5bff
	gTLvmdHrxry5XDbODm3lj45dXCz8giHPgC1/gizPL/puucGLvMXvuifqJKnnOZ7brQhschZpmRAZf
	dfJLHEfkZWAV4jHhl4jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYb7O-0002Hs-Iv; Tue, 12 May 2020 20:03:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYb7K-0002DW-P5
 for linux-mediatek@lists.infradead.org; Tue, 12 May 2020 20:03:08 +0000
Received: from localhost.localdomain.com (unknown [151.48.155.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4BB5F20731;
 Tue, 12 May 2020 20:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589313786;
 bh=Fz7WTW9zSmBWQvn6SKCgJqKAnF3fPQ9gZ+wJurCnphQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sFfQ5iCyu7AsHb/CR3QZGcJh+JPmPZYyFWUJ4ZiTrlkOvoZTMLf5yfliOUTYAXx6f
 dtEHZVpgy1ZLDEhbjwdu168je1f7T3wcCH5GjLaWU782m6t5TpYXumwkR7LpaUPp/n
 p/7vAmrmiGJrrbHfgmBqCh2ZUtizh6Y0sA6UtODw=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 4/4] mt76: mt7615: configure bss info adding the interface
Date: Tue, 12 May 2020 22:02:50 +0200
Message-Id: <dba96d7584bc78bb436b2f9d7f81c7d3c44e0f46.1589313659.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1589313659.git.lorenzo@kernel.org>
References: <cover.1589313659.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_130306_852909_9F6C1CEF 
X-CRM114-Status: GOOD (  13.19  )
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
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Introduce essential bss information for multiple vifs hw_scan in
mt7615_mcu_uni_add_dev adding the interface

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/main.c  |  5 +-
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 97 ++++++++++++-------
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   | 26 +++++
 3 files changed, 89 insertions(+), 39 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index e87a5843c718..2e9e9d3519d7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -156,10 +156,6 @@ static int mt7615_add_interface(struct ieee80211_hw *hw,
 	else
 		mvif->wmm_idx = mvif->idx % MT7615_MAX_WMM_SETS;
 
-	ret = mt7615_mcu_add_dev_info(dev, vif, true);
-	if (ret)
-		goto out;
-
 	dev->vif_mask |= BIT(mvif->idx);
 	dev->omac_mask |= BIT(mvif->omac_idx);
 	phy->omac_mask |= BIT(mvif->omac_idx);
@@ -182,6 +178,7 @@ static int mt7615_add_interface(struct ieee80211_hw *hw,
 		mt76_txq_init(&dev->mt76, vif->txq);
 	}
 
+	ret = mt7615_mcu_add_dev_info(dev, vif, true);
 out:
 	mutex_unlock(&dev->mt76.mutex);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 92ea9dc3c1c6..b944f372738a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1294,7 +1294,7 @@ mt7615_mcu_uni_add_dev(struct mt7615_dev *dev,
 {
 	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
 	struct {
-		struct req_hdr {
+		struct {
 			u8 omac_idx;
 			u8 band_idx;
 			__le16 pad;
@@ -1306,7 +1306,7 @@ mt7615_mcu_uni_add_dev(struct mt7615_dev *dev,
 			u8 pad;
 			u8 omac_addr[ETH_ALEN];
 		} __packed tlv;
-	} data = {
+	} dev_req = {
 		.hdr = {
 			.omac_idx = mvif->omac_idx,
 			.band_idx = mvif->band_idx,
@@ -1317,11 +1317,65 @@ mt7615_mcu_uni_add_dev(struct mt7615_dev *dev,
 			.active = enable,
 		},
 	};
+	struct {
+		struct {
+			u8 bss_idx;
+			u8 pad[3];
+		} __packed hdr;
+		struct mt7615_bss_basic_tlv basic;
+	} basic_req = {
+		.hdr = {
+			.bss_idx = mvif->idx,
+		},
+		.basic = {
+			.tag = cpu_to_le16(UNI_BSS_INFO_BASIC),
+			.len = cpu_to_le16(sizeof(struct mt7615_bss_basic_tlv)),
+			.omac_idx = mvif->omac_idx,
+			.band_idx = mvif->band_idx,
+			.wmm_idx = mvif->wmm_idx,
+			.active = enable,
+			.bmc_tx_wlan_idx = cpu_to_le16(mvif->sta.wcid.idx),
+			.sta_idx = cpu_to_le16(mvif->sta.wcid.idx),
+			.conn_state = 1,
+		},
+	};
+	int err, idx, cmd, len;
+	void *data;
 
-	memcpy(data.tlv.omac_addr, vif->addr, ETH_ALEN);
+	switch (vif->type) {
+	case NL80211_IFTYPE_MESH_POINT:
+	case NL80211_IFTYPE_AP:
+		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_INFRA_AP);
+		break;
+	case NL80211_IFTYPE_STATION:
+		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_INFRA_STA);
+		break;
+	case NL80211_IFTYPE_ADHOC:
+		basic_req.basic.conn_type = cpu_to_le32(CONNECTION_IBSS_ADHOC);
+		break;
+	default:
+		WARN_ON(1);
+		break;
+	}
 
-	return __mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD_DEV_INFO_UPDATE,
-				   &data, sizeof(data), true);
+	idx = mvif->omac_idx > EXT_BSSID_START ? HW_BSSID_0 : mvif->omac_idx;
+	basic_req.basic.hw_bss_idx = idx;
+
+	memcpy(dev_req.tlv.omac_addr, vif->addr, ETH_ALEN);
+
+	cmd = enable ? MCU_UNI_CMD_DEV_INFO_UPDATE : MCU_UNI_CMD_BSS_INFO_UPDATE;
+	data = enable ? (void *)&dev_req : (void *)&basic_req;
+	len = enable ? sizeof(dev_req) : sizeof(basic_req);
+
+	err = __mt76_mcu_send_msg(&dev->mt76, cmd, data, len, true);
+	if (err < 0)
+		return err;
+
+	cmd = enable ? MCU_UNI_CMD_BSS_INFO_UPDATE : MCU_UNI_CMD_DEV_INFO_UPDATE;
+	data = enable ? (void *)&basic_req : (void *)&dev_req;
+	len = enable ? sizeof(basic_req) : sizeof(dev_req);
+
+	return __mt76_mcu_send_msg(&dev->mt76, cmd, data, len, true);
 }
 
 static int
@@ -1343,44 +1397,20 @@ mt7615_mcu_uni_add_bss(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 			u8 bss_idx;
 			u8 pad[3];
 		} __packed hdr;
-		struct basic_tlv {
-			__le16 tag;
-			__le16 len;
-			u8 active;
-			u8 omac_idx;
-			u8 hw_bss_idx;
-			u8 band_idx;
-			__le32 conn_type;
-			u8 conn_state;
-			u8 wmm_idx;
-			u8 bssid[ETH_ALEN];
-			__le16 bmc_tx_wlan_idx;
-			__le16 bcn_interval;
-			u8 dtim_period;
-			u8 phymode; /* bit(0): A
-				     * bit(1): B
-				     * bit(2): G
-				     * bit(3): GN
-				     * bit(4): AN
-				     * bit(5): AC
-				     */
-			__le16 sta_idx;
-			u8 nonht_basic_phy;
-			u8 pad[3];
-		} __packed basic;
+		struct mt7615_bss_basic_tlv basic;
 	} basic_req = {
 		.hdr = {
 			.bss_idx = mvif->idx,
 		},
 		.basic = {
 			.tag = cpu_to_le16(UNI_BSS_INFO_BASIC),
-			.len = cpu_to_le16(sizeof(struct basic_tlv)),
+			.len = cpu_to_le16(sizeof(struct mt7615_bss_basic_tlv)),
 			.bcn_interval = cpu_to_le16(vif->bss_conf.beacon_int),
 			.dtim_period = vif->bss_conf.dtim_period,
 			.omac_idx = mvif->omac_idx,
 			.band_idx = mvif->band_idx,
 			.wmm_idx = mvif->wmm_idx,
-			.active = enable,
+			.active = true, /* keep bss deactivated */
 			.phymode = 0x38,
 		},
 	};
@@ -1458,9 +1488,6 @@ mt7615_mcu_uni_add_bss(struct mt7615_phy *phy, struct ieee80211_vif *vif,
 	if (err < 0)
 		return err;
 
-	if (!mt7615_firmware_offload(dev))
-		return 0;
-
 	switch (chandef->width) {
 	case NL80211_CHAN_WIDTH_40:
 		rlm_req.rlm.bw = CMD_CBW_40MHZ;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index 338fd077f575..348521b0d44c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -425,6 +425,32 @@ struct mt7615_mcu_bss_event {
 	u8 pad;
 } __packed;
 
+struct mt7615_bss_basic_tlv {
+	__le16 tag;
+	__le16 len;
+	u8 active;
+	u8 omac_idx;
+	u8 hw_bss_idx;
+	u8 band_idx;
+	__le32 conn_type;
+	u8 conn_state;
+	u8 wmm_idx;
+	u8 bssid[ETH_ALEN];
+	__le16 bmc_tx_wlan_idx;
+	__le16 bcn_interval;
+	u8 dtim_period;
+	u8 phymode; /* bit(0): A
+		     * bit(1): B
+		     * bit(2): G
+		     * bit(3): GN
+		     * bit(4): AN
+		     * bit(5): AC
+		     */
+	__le16 sta_idx;
+	u8 nonht_basic_phy;
+	u8 pad[3];
+} __packed;
+
 struct mt7615_wow_ctrl_tlv {
 	__le16 tag;
 	__le16 len;
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
