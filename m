Return-Path: <SRS0=NTS1=G2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DCDC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 08:45:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCE63239D4
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 08:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCE63239D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H2AjTujjdwrQYk6dLfduCw2Q1jX/3CELXgO4GlsV0a8=; b=1en2FTge3InbUutKGwiAGHy7a
	njWs63M5YF28px87lXJIe8/YqXG1WOr/lFp/IBCUCTc+GrjXG3mn+lO+BfnWu66sLt89m1z764gF1
	nddaByXXDlY/j3B1C9uv029ZFr9ZBkDuVuCgrsAbkSs2Uqi14bRn0xmM+XrpEmT1nQ9DTNVatZV9X
	rhlW7160avhn1vQz69dCFVri3goic/HhgujaMvEALtLFBNGbL2fH93eVcqvOC2U+YTmd5fZfDpZdc
	N/0Nl/vWCUR3fpSqWnAqWFxD/cNh3SRbj5DpQgIrjf96S8/4O9GQ7uEavFzRWDHI96cBppaL2gNtz
	QvG8FZo9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3EY5-0005bt-Jh; Sat, 23 Jan 2021 08:45:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3EXx-0005UO-IP
 for linux-mediatek@lists.infradead.org; Sat, 23 Jan 2021 08:45:32 +0000
X-UUID: 2e64144094234cf483424a4877e97816-20210123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8kDb85M/qrj1fYPcqCOLkV1WIXKBL1g0mbZSgBS8EeY=; 
 b=jTaE0+1L6M7vE70JYjGbdcyNuvUededqGlAwGTOcEl2XRurH0o1djBTOJjGprl0HOm9lU3I3qEjex3axn6d+4WzvaVSUvQ0ryTWuIdFl/BSwm8j4bPHED8rqpjUJBuC4VODVXC2BDCDqFrdl+/gVEkVHxeJ0ENo6ctao5rO+OlI=;
X-UUID: 2e64144094234cf483424a4877e97816-20210123
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 668766112; Sat, 23 Jan 2021 00:45:18 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Jan 2021 00:35:18 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Jan 2021 16:35:16 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Jan 2021 16:35:17 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v7 16/22] mt76: mt7921: rely on mt76_connac_mcu module
 for suspend and WoW support
Date: Sat, 23 Jan 2021 16:35:07 +0800
Message-ID: <28bd9914b3085d5055bf7cdb3b1dcc6be6f0bfda.1611389300.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1611389300.git.objelf@gmail.com>
References: <cover.1611389300.git.objelf@gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B2E96F3EA1100965179D0E2E1982F8C1176EA9192477B3039C09AFB5449D9C882000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_034529_906227_2828F6EB 
X-CRM114-Status: GOOD (  14.66  )
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
Cc: ryder.lee@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 Eric.Liang@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, posh.sun@mediatek.com, YN.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, Soul.Huang@mediatek.com,
 Lorenzo Bianconi <lorenzo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lorenzo Bianconi <lorenzo@kernel.org>

Rely on mt76_connac_mcu module for suspend and WoW support and remove
duplicated code

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7921/main.c  |  12 +-
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 306 +-----------------
 .../net/wireless/mediatek/mt76/mt7921/mcu.h   |  93 ------
 .../wireless/mediatek/mt76/mt7921/mt7921.h    |   6 -
 .../net/wireless/mediatek/mt76/mt7921/pci.c   |   6 +-
 5 files changed, 11 insertions(+), 412 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 800fc320dfb2..cd3a1c691e48 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -969,9 +969,10 @@ static int mt7921_suspend(struct ieee80211_hw *hw,
 	set_bit(MT76_STATE_SUSPEND, &phy->mt76->state);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
-					    mt7921_mcu_set_suspend_iter, phy);
+					    mt76_connac_mcu_set_suspend_iter,
+					    &dev->mphy);
 
-	err = mt7921_mcu_set_hif_suspend(dev, true);
+	err = mt76_connac_mcu_set_hif_suspend(&dev->mt76, true);
 
 	mutex_unlock(&dev->mt76.mutex);
 
@@ -986,7 +987,7 @@ static int mt7921_resume(struct ieee80211_hw *hw)
 
 	mutex_lock(&dev->mt76.mutex);
 
-	err = mt7921_mcu_set_hif_suspend(dev, false);
+	err = mt76_connac_mcu_set_hif_suspend(&dev->mt76, false);
 	if (err < 0)
 		goto out;
 
@@ -994,7 +995,8 @@ static int mt7921_resume(struct ieee80211_hw *hw)
 	clear_bit(MT76_STATE_SUSPEND, &phy->mt76->state);
 	ieee80211_iterate_active_interfaces(hw,
 					    IEEE80211_IFACE_ITER_RESUME_ALL,
-					    mt7921_mcu_set_suspend_iter, phy);
+					    mt76_connac_mcu_set_suspend_iter,
+					    &dev->mphy);
 
 	ieee80211_queue_delayed_work(hw, &phy->mt76->mac_work,
 				     MT7921_WATCHDOG_TIME);
@@ -1019,7 +1021,7 @@ static void mt7921_set_rekey_data(struct ieee80211_hw *hw,
 	struct mt7921_dev *dev = mt7921_hw_dev(hw);
 
 	mutex_lock(&dev->mt76.mutex);
-	mt7921_mcu_update_gtk_rekey(hw, vif, data);
+	mt76_connac_mcu_update_gtk_rekey(hw, vif, data);
 	mutex_unlock(&dev->mt76.mutex);
 }
 #endif /* CONFIG_PM */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index e36cae5711aa..eed65df2ed8b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -865,15 +865,6 @@ static int mt7921_load_ram(struct mt7921_dev *dev)
 	return ret;
 }
 
-static const struct wiphy_wowlan_support mt7921_wowlan_support = {
-	.flags = WIPHY_WOWLAN_MAGIC_PKT | WIPHY_WOWLAN_DISCONNECT |
-		 WIPHY_WOWLAN_SUPPORTS_GTK_REKEY | WIPHY_WOWLAN_NET_DETECT,
-	.n_patterns = 1,
-	.pattern_min_len = 1,
-	.pattern_max_len = MT7921_WOW_PATTEN_MAX_LEN,
-	.max_nd_match_sets = 10,
-};
-
 static int mt7921_load_firmware(struct mt7921_dev *dev)
 {
 	int ret;
@@ -902,7 +893,7 @@ static int mt7921_load_firmware(struct mt7921_dev *dev)
 	mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_FWDL], false);
 
 #ifdef CONFIG_PM
-	dev->mt76.hw->wiphy->wowlan = &mt7921_wowlan_support;
+	dev->mt76.hw->wiphy->wowlan = &mt76_connac_wowlan_support;
 #endif /* CONFIG_PM */
 
 	dev_err(dev->mt76.dev, "Firmware init done\n");
@@ -1241,298 +1232,3 @@ int mt7921_mcu_set_bss_pm(struct mt7921_dev *dev, struct ieee80211_vif *vif,
 	return mt76_mcu_send_msg(&dev->mt76, MCU_CMD_SET_BSS_CONNECTED, &req,
 				 sizeof(req), false);
 }
-
-#ifdef CONFIG_PM
-int mt7921_mcu_set_hif_suspend(struct mt7921_dev *dev, bool suspend)
-{
-	struct {
-		struct {
-			u8 hif_type; /* 0x0: HIF_SDIO
-				      * 0x1: HIF_USB
-				      * 0x2: HIF_PCIE
-				      */
-			u8 pad[3];
-		} __packed hdr;
-		struct hif_suspend_tlv {
-			__le16 tag;
-			__le16 len;
-			u8 suspend;
-		} __packed hif_suspend;
-	} req = {
-		.hif_suspend = {
-			.tag = cpu_to_le16(0), /* 0: UNI_HIF_CTRL_BASIC */
-			.len = cpu_to_le16(sizeof(struct hif_suspend_tlv)),
-			.suspend = suspend,
-		},
-	};
-
-	if (mt76_is_mmio(&dev->mt76))
-		req.hdr.hif_type = 2;
-	else if (mt76_is_usb(&dev->mt76))
-		req.hdr.hif_type = 1;
-	else if (mt76_is_sdio(&dev->mt76))
-		req.hdr.hif_type = 0;
-
-	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD_HIF_CTRL, &req,
-				 sizeof(req), true);
-}
-EXPORT_SYMBOL_GPL(mt7921_mcu_set_hif_suspend);
-
-static int
-mt7921_mcu_set_wow_ctrl(struct mt7921_phy *phy, struct ieee80211_vif *vif,
-			bool suspend, struct cfg80211_wowlan *wowlan)
-{
-	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
-	struct mt7921_dev *dev = phy->dev;
-	struct {
-		struct {
-			u8 bss_idx;
-			u8 pad[3];
-		} __packed hdr;
-		struct mt7921_wow_ctrl_tlv wow_ctrl_tlv;
-		struct mt7921_wow_gpio_param_tlv gpio_tlv;
-	} req = {
-		.hdr = {
-			.bss_idx = mvif->mt76.idx,
-		},
-		.wow_ctrl_tlv = {
-			.tag = cpu_to_le16(UNI_SUSPEND_WOW_CTRL),
-			.len = cpu_to_le16(sizeof(struct mt7921_wow_ctrl_tlv)),
-			.cmd = suspend ? 1 : 2,
-		},
-		.gpio_tlv = {
-			.tag = cpu_to_le16(UNI_SUSPEND_WOW_GPIO_PARAM),
-			.len = cpu_to_le16(sizeof(struct mt7921_wow_gpio_param_tlv)),
-			.gpio_pin = 0xff, /* follow fw about GPIO pin */
-		},
-	};
-
-	if (wowlan->magic_pkt)
-		req.wow_ctrl_tlv.trigger |= BIT(0);
-	if (wowlan->disconnect)
-		req.wow_ctrl_tlv.trigger |= BIT(2);
-	if (wowlan->nd_config) {
-		mt76_connac_mcu_sched_scan_req(&dev->mphy, vif,
-					       wowlan->nd_config);
-		req.wow_ctrl_tlv.trigger |= BIT(5);
-		mt76_connac_mcu_sched_scan_enable(&dev->mphy, vif, suspend);
-	}
-
-	if (mt76_is_mmio(&dev->mt76))
-		req.wow_ctrl_tlv.wakeup_hif = WOW_PCIE;
-	else if (mt76_is_usb(&dev->mt76))
-		req.wow_ctrl_tlv.wakeup_hif = WOW_USB;
-	else if (mt76_is_sdio(&dev->mt76))
-		req.wow_ctrl_tlv.wakeup_hif = WOW_GPIO;
-
-	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD_SUSPEND, &req,
-				 sizeof(req), true);
-}
-
-static int
-mt7921_mcu_set_wow_pattern(struct mt7921_dev *dev,
-			   struct ieee80211_vif *vif,
-			   u8 index, bool enable,
-			   struct cfg80211_pkt_pattern *pattern)
-{
-	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
-	struct mt7921_wow_pattern_tlv *ptlv;
-	struct sk_buff *skb;
-	struct req_hdr {
-		u8 bss_idx;
-		u8 pad[3];
-	} __packed hdr = {
-		.bss_idx = mvif->mt76.idx,
-	};
-
-	skb = mt76_mcu_msg_alloc(&dev->mt76, NULL,
-				 sizeof(hdr) + sizeof(*ptlv));
-	if (!skb)
-		return -ENOMEM;
-
-	skb_put_data(skb, &hdr, sizeof(hdr));
-	ptlv = (struct mt7921_wow_pattern_tlv *)skb_put(skb, sizeof(*ptlv));
-	ptlv->tag = cpu_to_le16(UNI_SUSPEND_WOW_PATTERN);
-	ptlv->len = cpu_to_le16(sizeof(*ptlv));
-	ptlv->data_len = pattern->pattern_len;
-	ptlv->enable = enable;
-	ptlv->index = index;
-
-	memcpy(ptlv->pattern, pattern->pattern, pattern->pattern_len);
-	memcpy(ptlv->mask, pattern->mask, pattern->pattern_len / 8);
-
-	return mt76_mcu_skb_send_msg(&dev->mt76, skb, MCU_UNI_CMD_SUSPEND,
-				     true);
-}
-
-static int
-mt7921_mcu_set_suspend_mode(struct mt7921_dev *dev,
-			    struct ieee80211_vif *vif,
-			    bool enable, u8 mdtim, bool wow_suspend)
-{
-	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
-	struct {
-		struct {
-			u8 bss_idx;
-			u8 pad[3];
-		} __packed hdr;
-		struct mt7921_suspend_tlv suspend_tlv;
-	} req = {
-		.hdr = {
-			.bss_idx = mvif->mt76.idx,
-		},
-		.suspend_tlv = {
-			.tag = cpu_to_le16(UNI_SUSPEND_MODE_SETTING),
-			.len = cpu_to_le16(sizeof(struct mt7921_suspend_tlv)),
-			.enable = enable,
-			.mdtim = mdtim,
-			.wow_suspend = wow_suspend,
-		},
-	};
-
-	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD_SUSPEND, &req,
-				 sizeof(req), true);
-}
-
-static int
-mt7921_mcu_set_gtk_rekey(struct mt7921_dev *dev,
-			 struct ieee80211_vif *vif,
-			 bool suspend)
-{
-	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
-	struct {
-		struct {
-			u8 bss_idx;
-			u8 pad[3];
-		} __packed hdr;
-		struct mt7921_gtk_rekey_tlv gtk_tlv;
-	} __packed req = {
-		.hdr = {
-			.bss_idx = mvif->mt76.idx,
-		},
-		.gtk_tlv = {
-			.tag = cpu_to_le16(UNI_OFFLOAD_OFFLOAD_GTK_REKEY),
-			.len = cpu_to_le16(sizeof(struct mt7921_gtk_rekey_tlv)),
-			.rekey_mode = !suspend,
-		},
-	};
-
-	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD_OFFLOAD, &req,
-				 sizeof(req), true);
-}
-
-static int
-mt7921_mcu_set_arp_filter(struct mt7921_dev *dev, struct ieee80211_vif *vif,
-			  bool suspend)
-{
-	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
-	struct {
-		struct {
-			u8 bss_idx;
-			u8 pad[3];
-		} __packed hdr;
-		struct mt7921_arpns_tlv arpns;
-	} req = {
-		.hdr = {
-			.bss_idx = mvif->mt76.idx,
-		},
-		.arpns = {
-			.tag = cpu_to_le16(UNI_OFFLOAD_OFFLOAD_ARP),
-			.len = cpu_to_le16(sizeof(struct mt7921_arpns_tlv)),
-			.mode = suspend,
-		},
-	};
-
-	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD_OFFLOAD, &req,
-				 sizeof(req), true);
-}
-
-void mt7921_mcu_set_suspend_iter(void *priv, u8 *mac,
-				 struct ieee80211_vif *vif)
-{
-	struct mt7921_phy *phy = priv;
-	bool suspend = test_bit(MT76_STATE_SUSPEND, &phy->mt76->state);
-	struct ieee80211_hw *hw = phy->mt76->hw;
-	struct cfg80211_wowlan *wowlan = hw->wiphy->wowlan_config;
-	int i;
-
-	mt7921_mcu_set_gtk_rekey(phy->dev, vif, suspend);
-	mt7921_mcu_set_arp_filter(phy->dev, vif, suspend);
-
-	mt7921_mcu_set_suspend_mode(phy->dev, vif, suspend, 1, true);
-
-	for (i = 0; i < wowlan->n_patterns; i++)
-		mt7921_mcu_set_wow_pattern(phy->dev, vif, i, suspend,
-					   &wowlan->patterns[i]);
-	mt7921_mcu_set_wow_ctrl(phy, vif, suspend, wowlan);
-}
-
-static void
-mt7921_mcu_key_iter(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
-		    struct ieee80211_sta *sta, struct ieee80211_key_conf *key,
-		    void *data)
-{
-	struct mt7921_gtk_rekey_tlv *gtk_tlv = data;
-	u32 cipher;
-
-	if (key->cipher != WLAN_CIPHER_SUITE_AES_CMAC &&
-	    key->cipher != WLAN_CIPHER_SUITE_CCMP &&
-	    key->cipher != WLAN_CIPHER_SUITE_TKIP)
-		return;
-
-	if (key->cipher == WLAN_CIPHER_SUITE_TKIP) {
-		gtk_tlv->proto = cpu_to_le32(NL80211_WPA_VERSION_1);
-		cipher = BIT(3);
-	} else {
-		gtk_tlv->proto = cpu_to_le32(NL80211_WPA_VERSION_2);
-		cipher = BIT(4);
-	}
-
-	/* we are assuming here to have a single pairwise key */
-	if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE) {
-		gtk_tlv->pairwise_cipher = cpu_to_le32(cipher);
-		gtk_tlv->group_cipher = cpu_to_le32(cipher);
-		gtk_tlv->keyid = key->keyidx;
-	}
-}
-
-int mt7921_mcu_update_gtk_rekey(struct ieee80211_hw *hw,
-				struct ieee80211_vif *vif,
-				struct cfg80211_gtk_rekey_data *key)
-{
-	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
-	struct mt7921_dev *dev = mt7921_hw_dev(hw);
-	struct mt7921_gtk_rekey_tlv *gtk_tlv;
-	struct sk_buff *skb;
-	struct {
-		u8 bss_idx;
-		u8 pad[3];
-	} __packed hdr = {
-		.bss_idx = mvif->mt76.idx,
-	};
-
-	skb = mt76_mcu_msg_alloc(&dev->mt76, NULL,
-				 sizeof(hdr) + sizeof(*gtk_tlv));
-	if (!skb)
-		return -ENOMEM;
-
-	skb_put_data(skb, &hdr, sizeof(hdr));
-	gtk_tlv = (struct mt7921_gtk_rekey_tlv *)skb_put(skb,
-							 sizeof(*gtk_tlv));
-	gtk_tlv->tag = cpu_to_le16(UNI_OFFLOAD_OFFLOAD_GTK_REKEY);
-	gtk_tlv->len = cpu_to_le16(sizeof(*gtk_tlv));
-	gtk_tlv->rekey_mode = 2;
-	gtk_tlv->option = 1;
-
-	rcu_read_lock();
-	ieee80211_iter_keys_rcu(hw, vif, mt7921_mcu_key_iter, gtk_tlv);
-	rcu_read_unlock();
-
-	memcpy(gtk_tlv->kek, key->kek, NL80211_KEK_LEN);
-	memcpy(gtk_tlv->kck, key->kck, NL80211_KCK_LEN);
-	memcpy(gtk_tlv->replay_ctr, key->replay_ctr, NL80211_REPLAY_CTR_LEN);
-
-	return mt76_mcu_skb_send_msg(&dev->mt76, skb, MCU_UNI_CMD_OFFLOAD,
-				     true);
-}
-#endif /* CONFIG_PM */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
index 4682cc7c583b..52f9e5102727 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
@@ -142,99 +142,6 @@ struct mt7921_mcu_uni_event {
 	__le32 status; /* 0: success, others: fail */
 } __packed;
 
-struct mt7921_wow_ctrl_tlv {
-	__le16 tag;
-	__le16 len;
-	u8 cmd; /* 0x1: PM_WOWLAN_REQ_START
-		 * 0x2: PM_WOWLAN_REQ_STOP
-		 * 0x3: PM_WOWLAN_PARAM_CLEAR
-		 */
-	u8 trigger; /* 0: NONE
-		     * BIT(0): NL80211_WOWLAN_TRIG_MAGIC_PKT
-		     * BIT(1): NL80211_WOWLAN_TRIG_ANY
-		     * BIT(2): NL80211_WOWLAN_TRIG_DISCONNECT
-		     * BIT(3): NL80211_WOWLAN_TRIG_GTK_REKEY_FAILURE
-		     * BIT(4): BEACON_LOST
-		     * BIT(5): NL80211_WOWLAN_TRIG_NET_DETECT
-		     */
-	u8 wakeup_hif; /* 0x0: HIF_SDIO
-			* 0x1: HIF_USB
-			* 0x2: HIF_PCIE
-			* 0x3: HIF_GPIO
-			*/
-	u8 pad;
-	u8 rsv[4];
-} __packed;
-
-struct mt7921_wow_gpio_param_tlv {
-	__le16 tag;
-	__le16 len;
-	u8 gpio_pin;
-	u8 trigger_lvl;
-	u8 pad[2];
-	__le32 gpio_interval;
-	u8 rsv[4];
-} __packed;
-
-#define MT7921_WOW_MASK_MAX_LEN		16
-#define MT7921_WOW_PATTEN_MAX_LEN	128
-struct mt7921_wow_pattern_tlv {
-	__le16 tag;
-	__le16 len;
-	u8 index; /* pattern index */
-	u8 enable; /* 0: disable
-		    * 1: enable
-		    */
-	u8 data_len; /* pattern length */
-	u8 pad;
-	u8 mask[MT7921_WOW_MASK_MAX_LEN];
-	u8 pattern[MT7921_WOW_PATTEN_MAX_LEN];
-	u8 rsv[4];
-} __packed;
-
-struct mt7921_suspend_tlv {
-	__le16 tag;
-	__le16 len;
-	u8 enable; /* 0: suspend mode disabled
-		    * 1: suspend mode enabled
-		    */
-	u8 mdtim; /* LP parameter */
-	u8 wow_suspend; /* 0: update by origin policy
-			 * 1: update by wow dtim
-			 */
-	u8 pad[5];
-} __packed;
-
-struct mt7921_gtk_rekey_tlv {
-	__le16 tag;
-	__le16 len;
-	u8 kek[NL80211_KEK_LEN];
-	u8 kck[NL80211_KCK_LEN];
-	u8 replay_ctr[NL80211_REPLAY_CTR_LEN];
-	u8 rekey_mode; /* 0: rekey offload enable
-			* 1: rekey offload disable
-			* 2: rekey update
-			*/
-	u8 keyid;
-	u8 pad[2];
-	__le32 proto; /* WPA-RSN-WAPI-OPSN */
-	__le32 pairwise_cipher;
-	__le32 group_cipher;
-	__le32 key_mgmt; /* NONE-PSK-IEEE802.1X */
-	__le32 mgmt_group_cipher;
-	u8 option; /* 1: rekey data update without enabling offload */
-	u8 reserverd[3];
-} __packed;
-
-struct mt7921_arpns_tlv {
-	__le16 tag;
-	__le16 len;
-	u8 mode;
-	u8 ips_num;
-	u8 option;
-	u8 pad[1];
-} __packed;
-
 enum {
 	PATCH_NOT_DL_SEM_FAIL,
 	PATCH_IS_DL,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 6085531cfd06..33de0be341bf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -315,12 +315,6 @@ int mt7921_mcu_uni_bss_bcnft(struct mt7921_dev *dev, struct ieee80211_vif *vif,
 			     bool enable);
 int mt7921_mcu_set_bss_pm(struct mt7921_dev *dev, struct ieee80211_vif *vif,
 			  bool enable);
-int mt7921_mcu_set_hif_suspend(struct mt7921_dev *dev, bool suspend);
-void mt7921_mcu_set_suspend_iter(void *priv, u8 *mac,
-				 struct ieee80211_vif *vif);
-int mt7921_mcu_update_gtk_rekey(struct ieee80211_hw *hw,
-				struct ieee80211_vif *vif,
-				struct cfg80211_gtk_rekey_data *key);
 int mt7921_mcu_update_arp_filter(struct ieee80211_hw *hw,
 				 struct ieee80211_vif *vif,
 				 struct ieee80211_bss_conf *info);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 613648a391a2..ff5fbc1e23aa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -178,7 +178,7 @@ static int mt7921_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 
 	hif_suspend = !test_bit(MT76_STATE_SUSPEND, &dev->mphy.state);
 	if (hif_suspend) {
-		err = mt7921_mcu_set_hif_suspend(dev, true);
+		err = mt76_connac_mcu_set_hif_suspend(mdev, true);
 		if (err)
 			return err;
 	}
@@ -218,7 +218,7 @@ static int mt7921_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	}
 	napi_enable(&mdev->tx_napi);
 	if (hif_suspend)
-		mt7921_mcu_set_hif_suspend(dev, false);
+		mt76_connac_mcu_set_hif_suspend(mdev, false);
 
 	return err;
 }
@@ -253,7 +253,7 @@ static int mt7921_pci_resume(struct pci_dev *pdev)
 	napi_schedule(&mdev->tx_napi);
 
 	if (!test_bit(MT76_STATE_SUSPEND, &dev->mphy.state))
-		err = mt7921_mcu_set_hif_suspend(dev, false);
+		err = mt76_connac_mcu_set_hif_suspend(mdev, false);
 
 	return err;
 }
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
