Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4771C98338
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOW97T1gtPr4a3glS4lYt5Ynt0bJTscU/piIiSCSjUI=; b=qcQJPE8pg1jIkCXPByGC+mMKaM
	nD/B7Q1RZLmhDmvkPQZhbtQlPGJF4pN81n3BJhrAREohHnbfx25V9qUfQZjB3kgl72rFTmGLen6gY
	szrmuKZr8gSqEtFnWNA80Yo0k23eEtDu9Q27M0RO3djovwxMJc9pbbr2MmWx/I54f0izC8xSVJzWV
	jfSQIxsOdlvozz/xk4qcin/CqD0CqwXn2vdfCwNSeiX2Ll8HPQsArCvouFpIpuYtloAidwc8Rt+7k
	WgSFSmYZJ7mXERcLcukN4SDYrEko6ehdPNuyklx3vcyaOYlPEek3N56diC/QoxNZ+MwCbpAaV+SxA
	BCF0P9EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw8a-0000000Gs4k-3HUx;
	Sun, 27 Sep 2026 21:10:20 +0000
Received: from mail-qk2-f43.google.com ([74.125.230.235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw8Y-0000000Gs4O-2mA2
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:10:19 +0000
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-532db7db0c6so23097791cf.2
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543417; x=1791148217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dOW97T1gtPr4a3glS4lYt5Ynt0bJTscU/piIiSCSjUI=;
        b=21Gs29LgnBoMBoUsDRxcaOrjKvtxrOKI1Rk1TxFrf9XudGB1FIDBXOEehaEa0WhGs3
         L85eG58XkNqm75OubpWfAwcGRgXRZGH8RPQ/8GyHVIJ6QaMg/aKoxcukEHWYA7rxDFTV
         SxesVCk6cmLOA3LoPfRZOIXsCnBSSioeo9iyi8+t8i6L0vDpisG33yXCt4m+5DGiXP+W
         P6kezyKngJdmVKA9Mlv6Wh7VbdsnDHmdTC875JOnp9Rq6HgD4QAMevl4crSrp/ayC5Oq
         GCIhRLG0G9gD34MjRi5Ghss5QoPLoKGe1ka1o935xwwYchWQdi19GwIogJMC8y87eNvU
         +bGA==
X-Forwarded-Encrypted: i=1; AKwUvByCFjVDyM1fyE5PBs0LFjpJrDlkcVOHEX/PqnllIS2gS8tygDbPpgbju2MRNQdVtTwcUTr+im3WaODTlgim/A==@lists.infradead.org
X-Gm-Message-State: AFuF++nyVGpDkth0WI++EIikF8owLccr/KNom9Y4LC4VW1ok1u2cSHYc
	aw811TNJ0Rb7jV9freKiBXHvEWTHMvwRf6NzaizilQKZQ8b+PtugFlL6RJB9g4dG
X-Gm-Gg: AYBFou1DfIV1xw/bdIo5rsKxjTckpJAkGoXGzWRJ2A4ezrjUaAOM11o65zOdqxsrBI1
	aRMNcHl4dKbPPM95bhAR51b9tDPQXAfqF1i0hCle739LxmNts8ohMKZ8MxQEVDJLrklu8kCg/hT
	PyyYW3cyiUeJ2Jkw4cmGqJ3+T7h6KZ7+aDkDTUOe6GAu0Zz2ghZctWXeqe/GokqTv8Vi3nlbynW
	ByZOqkPz0hRoPWx2YNqKzeD+6fa/Pu0MoyS6DthtU7XwOBdx6BnA+52TYrq7PxwsYIVtzB6KLqV
	qrfS5Jn/dWWH7d992uTmFMyGjERQhLFeU+W/c++H0AuDjb2QXVyxkl46MoWLK9tVr6xLBXh1/BI
	KgebvZSPRhKDELnOqWWZ3ax5LKHx8YsV0k78N/n5OPI/3bUex2VCObVx4/tHnO+03tnUpGDib9i
	hWooB7BZpmcLWFqXhd1TjRq+KrtyO9PNzGMcsZFtdE07J/ZK2qHg3eYO92BS4RT45WsC042eThD
	S3rSpYogwbohWLGtbr4GHMEICEtSA7WoyrHTQx6MlBR44rIzcqJI+6SHDBThbRXwy098g==
X-Received: by 2002:a05:690e:124e:b0:674:e0d2:7e12 with SMTP id 956f58d0204a3-674e0d286c3mr1607558d50.109.1790543013745;
        Sun, 27 Sep 2026 14:03:33 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:03:33 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Chengwei Yu <chengwei.yu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 05/23] wifi: mt76: mt7925: add NAN low power event control on suspend/resume
Date: Sun, 27 Sep 2026 16:02:47 -0500
Message-ID: <20260927210306.737669-6-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_141018_725030_4EACA86E 
X-CRM114-Status: GOOD (  18.41  )
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

From: Chengwei Yu <chengwei.yu@mediatek.com>

Disable NAN low power event reporting when the interface suspends so
the firmware stops firing peer-schedule notifications into a quiesced
system, and re-enable it on resume.

Re-enabling is conditional: it only fires if firmware has previously
reported an active peer schedule (non-zero peer_sch_record_tx_map in
the LOWPOWER_CTRL event). This avoids sending the command on every
resume when no peer connection is in progress.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chengwei Yu <chengwei.yu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   |  9 ++
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 93 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/nan.h   | 18 ++++
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  7 ++
 4 files changed, 127 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 2afd3f5e3266..76dcbbffabfc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -296,6 +296,7 @@ void mt7925_mcu_set_suspend_iter(void *priv, u8 *mac,
 	bool suspend = !test_bit(MT76_STATE_RUNNING, &phy->state);
 	struct ieee80211_hw *hw = phy->hw;
 	struct cfg80211_wowlan *wowlan = hw->wiphy->wowlan_config;
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	int i;
 
 	mt76_connac_mcu_set_gtk_rekey(phy->dev, vif, suspend);
@@ -306,6 +307,14 @@ void mt7925_mcu_set_suspend_iter(void *priv, u8 *mac,
 		mt7925_mcu_set_wow_pattern(phy->dev, vif, i, suspend,
 					   &wowlan->patterns[i]);
 	mt7925_connac_mcu_set_wow_ctrl(phy, vif, suspend, wowlan);
+
+	/*
+	 * Disable NAN low power event reporting while suspended, and
+	 * re-enable it on resume so firmware resumes reporting peer
+	 * schedule activity.
+	 */
+	if (vif->type == NL80211_IFTYPE_NAN)
+		mt7925_nan_send_lowpower_ctrl_cmd(dev, !suspend);
 }
 
 #endif /* CONFIG_PM */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 0b94bd4005d4..73e45be8b40e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -654,6 +654,44 @@ mt7925_nan_handle_sched_update_done(struct mt792x_dev *dev, struct tlv *tlv)
 	ieee80211_queue_work(dev->mt76.hw, &dev->nan_deferred_work);
 }
 
+static void
+mt7925_nan_handle_lowpower_ctrl(struct mt792x_dev *dev, struct tlv *tlv)
+{
+	struct mt7925_nan_lowpower_ctrl_evt *evt;
+	struct mt792x_vif *mvif;
+	u16 len;
+
+	if (!dev || !tlv)
+		return;
+
+	len = le16_to_cpu(tlv->len);
+	if (len < sizeof(*tlv) + sizeof(*evt)) {
+		dev_warn(dev->mt76.dev,
+			 "nan: short lowpower_ctrl event tlv len=%u\n", len);
+		return;
+	}
+
+	if (!dev->nan_vif || !ieee80211_vif_nan_started(dev->nan_vif))
+		return;
+
+	evt = (struct mt7925_nan_lowpower_ctrl_evt *)tlv->data;
+
+	dev_dbg(dev->mt76.dev,
+		"nan: lowpower_ctrl event - peer_sch_record_tx_map=0x%x\n",
+		evt->peer_sch_record_tx_map);
+
+	if (!evt->peer_sch_record_tx_map)
+		return;
+
+	/*
+	 * Firmware reports an active peer schedule; remember it so the
+	 * next resume re-enables low power event reporting instead of
+	 * sending the command unconditionally every suspend/resume cycle.
+	 */
+	mvif = (struct mt792x_vif *)dev->nan_vif->drv_priv;
+	mvif->nan.lowpower_mode = true;
+}
+
 void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb)
 {
 	struct tlv *tlv;
@@ -688,6 +726,9 @@ void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb)
 		case NAN_UNI_EVENT_ID_SCHED_UPDATE_DONE:
 			mt7925_nan_handle_sched_update_done(dev, tlv);
 			break;
+		case NAN_UNI_EVENT_LOWPOWER_CTRL:
+			mt7925_nan_handle_lowpower_ctrl(dev, tlv);
+			break;
 		default:
 			break;
 		}
@@ -745,6 +786,58 @@ int mt7925_nan_set_ndi_address(struct ieee80211_vif *vif,
 	return 0;
 }
 
+int mt7925_nan_send_lowpower_ctrl_cmd(struct mt792x_dev *dev, bool enable)
+{
+	struct mt7925_nan_lowpower_ctrl_tlv *lp_tlv;
+	struct mt7925_nan_common_hdr *hdr;
+	struct mt792x_vif *mvif;
+	struct mt76_dev *mdev;
+	struct sk_buff *skb;
+	struct tlv *tlv;
+
+	if (!dev)
+		return -EINVAL;
+
+	/*
+	 * Only re-enabling (on resume) is gated on firmware having reported
+	 * an active peer schedule while suspended; disabling (on suspend)
+	 * always goes through so firmware stops reporting immediately.
+	 */
+	if (enable) {
+		if (!dev->nan_vif)
+			return 0;
+
+		mvif = (struct mt792x_vif *)dev->nan_vif->drv_priv;
+		if (!mvif->nan.lowpower_mode)
+			return 0;
+
+		mvif->nan.lowpower_mode = false;
+	}
+
+	mdev = &dev->mt76;
+
+	skb = mt76_mcu_msg_alloc(mdev, NULL,
+				 sizeof(struct mt7925_nan_common_hdr) +
+				 sizeof(struct mt7925_nan_lowpower_ctrl_tlv));
+	if (!skb)
+		return -ENOMEM;
+
+	hdr = (struct mt7925_nan_common_hdr *)skb_put(skb, sizeof(*hdr));
+	memset(hdr, 0, sizeof(*hdr));
+
+	tlv = mt76_connac_mcu_add_tlv(skb, NAN_UNI_CMD_LOWPOWER_CTRL,
+				      sizeof(struct mt7925_nan_lowpower_ctrl_tlv));
+	if (!tlv) {
+		dev_kfree_skb(skb);
+		return -ENOMEM;
+	}
+
+	lp_tlv = (struct mt7925_nan_lowpower_ctrl_tlv *)tlv;
+	lp_tlv->enabled = enable ? 1 : 0;
+
+	return mt76_mcu_skb_send_msg(mdev, skb, MCU_UNI_CMD(NAN), true);
+}
+
 void mt7925_nan_mac_rand_work(struct work_struct *work)
 {
 	struct mt792x_vif *mvif = container_of(work, struct mt792x_vif,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index 191134825c3b..3a14ec384e4f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -88,6 +88,7 @@ enum nan_uni_cmd_tag {
 	NAN_UNI_CMD_UPDATE_PEER_CAPABILITY	= 21,
 	NAN_UNI_CMD_CHANGE_NMI_ADDRESS		= 24,
 	NAN_UNI_CMD_SET_DW_INTERVAL		= 26,
+	NAN_UNI_CMD_LOWPOWER_CTRL		= 37,
 	NAN_UNI_CMD_SET_SYNC_RSSI		= 39,
 	NAN_UNI_CMD_SET_CLUSTER_ID		= 40,
 	NAN_UNI_CMD_KEY_MANAGEMENT		= 53,
@@ -95,6 +96,7 @@ enum nan_uni_cmd_tag {
 
 enum nan_uni_event_tag {
 	NAN_UNI_EVENT_ID_DE_EVENT_IND		= 19,
+	NAN_UNI_EVENT_LOWPOWER_CTRL		= 37,
 	NAN_UNI_EVENT_ID_ULW_UPDATE		= 39,
 	NAN_UNI_EVENT_ID_SCHED_UPDATE_DONE	= 43,
 	NAN_UNI_EVENT_REPORT_DW_START		= 59,
@@ -476,6 +478,20 @@ struct mt7925_nan_update_phy_setting_tlv {
 	struct mt7925_nan_phy_setting phy_5g;
 } __packed __aligned(4);
 
+/* NAN Low Power Control Command */
+struct mt7925_nan_lowpower_ctrl_tlv {
+	__le16 tag;
+	__le16 len;
+	u8 enabled;
+	u8 reserved[3];
+} __packed __aligned(4);
+
+/* NAN Low Power Control Event */
+struct mt7925_nan_lowpower_ctrl_evt {
+	u8 peer_sch_record_tx_map;
+	u8 reserved[7];
+} __packed __aligned(4);
+
 int mt7925_nan_update_phy_setting(struct mt792x_dev *dev);
 
 struct ieee80211_chanctx_conf *
@@ -510,6 +526,8 @@ void mt7925_nan_start_mac_randomization(struct ieee80211_vif *vif,
 
 void mt7925_nan_stop_mac_randomization(struct ieee80211_vif *vif);
 
+int mt7925_nan_send_lowpower_ctrl_cmd(struct mt792x_dev *dev, bool enable);
+
 void mt7925_nan_local_sched_changed(struct mt792x_dev *dev,
 				    struct ieee80211_vif *vif);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 64cca8852359..fa28a77d12bb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -182,6 +182,13 @@ struct mt792x_nan {
 	/* Connection index bitmap, up to NAN_MAX_CONN_CFG peers */
 	unsigned long conn_bitmap;
 
+	/*
+	 * Set when firmware reports an active peer schedule via
+	 * NAN_UNI_EVENT_LOWPOWER_CTRL; cleared once the re-enable command
+	 * has been sent on resume.
+	 */
+	bool lowpower_mode;
+
 	/*
 	 * NMI/NDI MAC address randomization. Kept per-vif (rather than a
 	 * single pointer on mt792x_dev) because up to two NAN_DATA vifs can
-- 
2.43.0


