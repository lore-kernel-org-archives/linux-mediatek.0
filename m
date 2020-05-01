Return-Path: <SRS0=tJCI=6P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0983C47253
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 10:37:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 761B1206B8
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 10:37:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EEB5CoPo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwU2NGOP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 761B1206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhCv2jr003eamli1MFPQmQ96RvUX/ugkzEQTW/Vjfew=; b=EEB5CoPoD8lRew
	1i9RHG/tJrel3nbFx6aYbbQcgLGsav+fKImCc5Ken+Z6ILBPD364//BdPRGCxdhPkV8wXoGEoTZqM
	YvhidEQoe03HyplSiRI3T/N/LzxIJOutVORgO3PCaBA7xy2ms4RLEvQqXo5MrTvvgN+5482XFoZti
	+XZWZlydfuc0zFoklhEmwMCEMxVyvXoRb5MJiEj7uQFheT9znE2Gt8Ia/LbmsNoBvn18H09xyDOjW
	nCcZ5G3fYMFtrwsqDDCRA9zw3a6bQE+6jWVlMH/sLEaFypVlyEYp49R9P01gW5UylHNsYa7JtDlXB
	XSBL4gdn1Fbw0cGTSt9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUT2J-0004Yw-Og; Fri, 01 May 2020 10:36:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUT2F-0004TW-1Y
 for linux-mediatek@lists.infradead.org; Fri, 01 May 2020 10:36:49 +0000
Received: from lore-desk.lan (unknown [151.48.155.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E4B37206B8;
 Fri,  1 May 2020 10:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588329406;
 bh=i+8+/mBWqs8bnmiabW9odTI3AUBw9IsXGitE8FI/EGo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QwU2NGOPLJdDLhubUWcun2SFC9s492B7SHIs6jYcPrxAIKGit70sAYywWp1Aaw1kz
 7TuCMc6leLn1KsdwuKnEcmI4emN8jI6N8SuI+y3zt7R2oXiUHq3WG422vIqnh5eUAP
 EkfchuWFii3RVz6RgxnKx0MJQFbCwp5FsVhtbZcQ=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 6/7] mt76: mt7615: add gtk rekey offload support
Date: Fri,  1 May 2020 12:36:16 +0200
Message-Id: <f524edd6f8b13c986931a03de76ae330a93d3c80.1588329170.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588329170.git.lorenzo@kernel.org>
References: <cover.1588329170.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_033647_123315_F77296C3 
X-CRM114-Status: GOOD (  15.69  )
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
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org,
 soul.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add KCK and KEK offload support to mt7615 driver in order to
support GTK rekeying during PM suspend

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Co-developed-by: Wan-Feng Jiang <Wan-Feng.Jiang@mediatek.com>
Signed-off-by: Wan-Feng Jiang <Wan-Feng.Jiang@mediatek.com>
Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/init.c  |   1 +
 .../net/wireless/mediatek/mt76/mt7615/main.c  |   9 ++
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 102 +++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |  29 +++++
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |   3 +
 5 files changed, 143 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 7da0bf425061..0ec93ddab074 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -145,6 +145,7 @@ void mt7615_check_offload_capability(struct mt7615_dev *dev)
 		dev->ops->cancel_hw_scan = NULL;
 		dev->ops->sched_scan_start = NULL;
 		dev->ops->sched_scan_stop = NULL;
+		dev->ops->set_rekey_data = NULL;
 
 		wiphy->max_sched_scan_plan_interval = 0;
 		wiphy->max_sched_scan_ie_len = 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 1346d5124a2a..61b2afb3fdb8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -937,6 +937,14 @@ mt7615_set_wakeup(struct ieee80211_hw *hw, bool enabled)
 	device_set_wakeup_enable(mdev->dev, enabled);
 }
 
+static void __maybe_unused
+mt7615_set_rekey_data(struct ieee80211_hw *hw,
+		      struct ieee80211_vif *vif,
+		      struct cfg80211_gtk_rekey_data *data)
+{
+	mt7615_mcu_update_gtk_rekey(hw, vif, data);
+}
+
 const struct ieee80211_ops mt7615_ops = {
 	.tx = mt7615_tx,
 	.start = mt7615_start,
@@ -974,6 +982,7 @@ const struct ieee80211_ops mt7615_ops = {
 	.suspend = mt7615_suspend,
 	.resume = mt7615_resume,
 	.set_wakeup = mt7615_set_wakeup,
+	.set_rekey_data = mt7615_set_rekey_data,
 #endif /* CONFIG_PM */
 };
 EXPORT_SYMBOL_GPL(mt7615_ops);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 22e532aeb3cf..84d4b96028f2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -196,6 +196,7 @@ mt7615_mcu_parse_response(struct mt7615_dev *dev, int cmd,
 	case MCU_UNI_CMD_BSS_INFO_UPDATE:
 	case MCU_UNI_CMD_STA_REC_UPDATE:
 	case MCU_UNI_CMD_HIF_CTRL:
+	case MCU_UNI_CMD_OFFLOAD:
 	case MCU_UNI_CMD_SUSPEND: {
 		struct mt7615_mcu_uni_event *event;
 
@@ -1833,7 +1834,8 @@ mt7615_mcu_send_ram_firmware(struct mt7615_dev *dev,
 }
 
 static const struct wiphy_wowlan_support mt7615_wowlan_support = {
-	.flags = WIPHY_WOWLAN_MAGIC_PKT | WIPHY_WOWLAN_DISCONNECT,
+	.flags = WIPHY_WOWLAN_MAGIC_PKT | WIPHY_WOWLAN_DISCONNECT |
+		 WIPHY_WOWLAN_SUPPORTS_GTK_REKEY,
 	.n_patterns = 1,
 	.pattern_min_len = 1,
 	.pattern_max_len = MT7615_WOW_PATTEN_MAX_LEN,
@@ -3362,6 +3364,33 @@ mt7615_mcu_set_suspend_mode(struct mt7615_dev *dev,
 				   &req, sizeof(req), true);
 }
 
+static int
+mt7615_mcu_set_gtk_rekey(struct mt7615_dev *dev,
+			 struct ieee80211_vif *vif,
+			 bool suspend)
+{
+	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
+	struct {
+		struct {
+			u8 bss_idx;
+			u8 pad[3];
+		} __packed hdr;
+		struct mt7615_gtk_rekey_tlv gtk_tlv;
+	} __packed req = {
+		.hdr = {
+			.bss_idx = mvif->idx,
+		},
+		.gtk_tlv = {
+			.tag = cpu_to_le16(UNI_OFFLOAD_OFFLOAD_GTK_REKEY),
+			.len = cpu_to_le16(sizeof(struct mt7615_gtk_rekey_tlv)),
+			.rekey_mode = !suspend,
+		},
+	};
+
+	return __mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD_OFFLOAD,
+				   &req, sizeof(req), true);
+}
+
 void mt7615_mcu_set_suspend_iter(void *priv, u8 *mac,
 				 struct ieee80211_vif *vif)
 {
@@ -3373,6 +3402,8 @@ void mt7615_mcu_set_suspend_iter(void *priv, u8 *mac,
 
 	mt7615_mcu_set_bss_pm(phy->dev, vif, suspend);
 
+	mt7615_mcu_set_gtk_rekey(phy->dev, vif, suspend);
+
 	mt7615_mcu_set_suspend_mode(phy->dev, vif, suspend, 1, true);
 
 	for (i = 0; i < wowlan->n_patterns; i++)
@@ -3380,3 +3411,72 @@ void mt7615_mcu_set_suspend_iter(void *priv, u8 *mac,
 					   &wowlan->patterns[i]);
 	mt7615_mcu_set_wow_ctrl(phy->dev, vif, suspend, wowlan);
 }
+
+static void
+mt7615_mcu_key_iter(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+		    struct ieee80211_sta *sta, struct ieee80211_key_conf *key,
+		    void *data)
+{
+	struct mt7615_gtk_rekey_tlv *gtk_tlv = data;
+	u32 cipher;
+
+	if (key->cipher != WLAN_CIPHER_SUITE_AES_CMAC &&
+	    key->cipher != WLAN_CIPHER_SUITE_CCMP &&
+	    key->cipher != WLAN_CIPHER_SUITE_TKIP)
+		return;
+
+	if (key->cipher == WLAN_CIPHER_SUITE_TKIP) {
+		gtk_tlv->proto = cpu_to_le32(NL80211_WPA_VERSION_1);
+		cipher = BIT(3);
+	} else {
+		gtk_tlv->proto = cpu_to_le32(NL80211_WPA_VERSION_2);
+		cipher = BIT(4);
+	}
+
+	/* we are assuming here to have a single pairwise key */
+	if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE) {
+		gtk_tlv->pairwise_cipher = cpu_to_le32(cipher);
+		gtk_tlv->group_cipher = cpu_to_le32(cipher);
+		gtk_tlv->keyid = key->keyidx;
+	}
+}
+
+int mt7615_mcu_update_gtk_rekey(struct ieee80211_hw *hw,
+				struct ieee80211_vif *vif,
+				struct cfg80211_gtk_rekey_data *key)
+{
+	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
+	struct mt7615_dev *dev = mt7615_hw_dev(hw);
+	struct mt7615_gtk_rekey_tlv *gtk_tlv;
+	struct sk_buff *skb;
+	struct {
+		u8 bss_idx;
+		u8 pad[3];
+	} __packed hdr = {
+		.bss_idx = mvif->idx,
+	};
+
+	skb = mt76_mcu_msg_alloc(&dev->mt76, NULL,
+				 sizeof(hdr) + sizeof(*gtk_tlv));
+	if (!skb)
+		return -ENOMEM;
+
+	skb_put_data(skb, &hdr, sizeof(hdr));
+	gtk_tlv = (struct mt7615_gtk_rekey_tlv *)skb_put(skb,
+							 sizeof(*gtk_tlv));
+	gtk_tlv->tag = cpu_to_le16(UNI_OFFLOAD_OFFLOAD_GTK_REKEY);
+	gtk_tlv->len = cpu_to_le16(sizeof(*gtk_tlv));
+	gtk_tlv->rekey_mode = 2;
+	gtk_tlv->option = 1;
+
+	rcu_read_lock();
+	ieee80211_iter_keys_rcu(hw, vif, mt7615_mcu_key_iter, gtk_tlv);
+	rcu_read_unlock();
+
+	memcpy(gtk_tlv->kek, key->kek, NL80211_KEK_LEN);
+	memcpy(gtk_tlv->kck, key->kck, NL80211_KCK_LEN);
+	memcpy(gtk_tlv->replay_ctr, key->replay_ctr, NL80211_REPLAY_CTR_LEN);
+
+	return __mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				       MCU_UNI_CMD_OFFLOAD, true);
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index 960ff234c72d..890a202acfc9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -281,6 +281,7 @@ enum {
 	MCU_UNI_CMD_BSS_INFO_UPDATE = MCU_UNI_PREFIX | 0x02,
 	MCU_UNI_CMD_STA_REC_UPDATE = MCU_UNI_PREFIX | 0x03,
 	MCU_UNI_CMD_SUSPEND = MCU_UNI_PREFIX | 0x05,
+	MCU_UNI_CMD_OFFLOAD = MCU_UNI_PREFIX | 0x06,
 	MCU_UNI_CMD_HIF_CTRL = MCU_UNI_PREFIX | 0x07,
 };
 
@@ -469,6 +470,27 @@ struct mt7615_suspend_tlv {
 	u8 pad[5];
 } __packed;
 
+struct mt7615_gtk_rekey_tlv {
+	__le16 tag;
+	__le16 len;
+	u8 kek[NL80211_KEK_LEN];
+	u8 kck[NL80211_KCK_LEN];
+	u8 replay_ctr[NL80211_REPLAY_CTR_LEN];
+	u8 rekey_mode; /* 0: rekey offload enable
+			* 1: rekey offload disable
+			* 2: rekey update
+			*/
+	u8 keyid;
+	u8 pad[2];
+	__le32 proto; /* WPA-RSN-WAPI-OPSN */
+	__le32 pairwise_cipher;
+	__le32 group_cipher;
+	__le32 key_mgmt; /* NONE-PSK-IEEE802.1X */
+	__le32 mgmt_group_cipher;
+	u8 option; /* 1: rekey data update without enabling offload */
+	u8 reserverd[3];
+} __packed;
+
 /* offload mcu commands */
 enum {
 	MCU_CMD_START_HW_SCAN = MCU_CE_PREFIX | 0x03,
@@ -501,6 +523,13 @@ enum {
 	UNI_SUSPEND_WOW_PATTERN,
 };
 
+enum {
+	UNI_OFFLOAD_OFFLOAD_ARPNS_IPV4,
+	UNI_OFFLOAD_OFFLOAD_ARPNS_IPV6,
+	UNI_OFFLOAD_OFFLOAD_GTK_REKEY,
+	UNI_OFFLOAD_OFFLOAD_BMC_RPY_DETECT,
+};
+
 enum {
 	PATCH_SEM_RELEASE = 0x0,
 	PATCH_SEM_GET	  = 0x1
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index be9188e40259..d3a83f3ed54e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -537,6 +537,9 @@ int mt7615_mcu_wait_response(struct mt7615_dev *dev, int cmd, int seq);
 int mt7615_mcu_set_hif_suspend(struct mt7615_dev *dev, bool suspend);
 void mt7615_mcu_set_suspend_iter(void *priv, u8 *mac,
 				 struct ieee80211_vif *vif);
+int mt7615_mcu_update_gtk_rekey(struct ieee80211_hw *hw,
+				struct ieee80211_vif *vif,
+				struct cfg80211_gtk_rekey_data *key);
 
 int __mt7663_load_firmware(struct mt7615_dev *dev);
 
-- 
2.25.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
