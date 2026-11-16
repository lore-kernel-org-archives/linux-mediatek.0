Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C05606A32C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 23:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=egdy++In
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d565s4DphSSG/c4wOqcYcK8O2xYx/fApraOeU5LZFRQ=; b=egdy++InGzt5Ef
	fqIcz2yac7XtRNTgZn7b7bvXRWgGGMhhlUAnF9XHKIZlONk6O1k3YmR5zVLT3LKPenfmXqC5cfbGZ
	JxcN55whQX9tcYIsy+MoJNnXGqCT39GT+dM1rNwxkt+6sMLo+dqQCqsIqpsWK5a/Kh1o/59YzJldO
	nnPup2hYkO8OFZrCNF3YSNmdLaRe/dmJRl8IkEiVuhMNjIfDFJj2hobxgxFQu0+JWjdxN19FEHi2T
	HaPYOp+qO2qPeO/GP9Qtcz6Ep8eZ2jQWBch1CcmpN4ZhNkIuMeKTq/9nWBhqeh3841q418B3N/Vkd
	uRUOPG0GexUy4eDlJ0Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5xs-000000049Fm-3PPE;
	Mon, 16 Nov 2026 23:18:20 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5xq-000000049F0-38ss
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 23:18:19 +0000
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-86156cf8a7eso237826a34.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:18:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871097; x=1795475897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d565s4DphSSG/c4wOqcYcK8O2xYx/fApraOeU5LZFRQ=;
        b=s0joyjL3xzQfy+gZJ/9BJRDk/Y1ktPvrJxZbVsSFzRqx73QCM6R2mjajlb8QLxUMrO
         ocDn4/IhVo/obSGhhetotjS6YM6i81qsQBZy+/RTi5wFV6RsqEOPa+JZEF9NDsg/Q7ZH
         xqkzB5Q7d+daSjUMLlYcSpI8VhqRoNNHFltnHvkZRbcMcUngr03KfemNvITOu42HC3Ug
         es59hzkg4+/tUmLaZHtKs3GzkSLBxY6e5NGZf+ay7HtssmquD5MpraYHLLnvkP0mRV6S
         oJlWJdVjJcMBShZOYDCzr1ihsH+BHvxJleQfSMdAkUYaJK/XJj7VTIkNQyNpavxsQvlv
         FKiA==
X-Forwarded-Encrypted: i=1; AL+hErHp4BDs3bb6JeQTrExwKYZYFVQhEtAAKNn6pcEfVTcAaUW6iquzDTah1xny9yHq46tj1/6w3rMUM5f8r5yUoA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8g/zH4Vxu1T4gCarkfIr4S6vBkEGvYGhUANtNmydyPyAt9ch6q
	6ArbVE6CPPP1nFNvccjosjXDHOXqj5GQYw0v22Tb/Dh/XiY1neWNCSdM
X-Gm-Gg: AYBFou25HdwFmw2vTi3zBhhgX/n8jpSd+dTfbV6cgangfWmYGnaSuxaWp0XWTeR3Q3k
	UCQkQNOt4EVZhxZEQsTnfESeM2JoYApC+Bnavw4a1LuyUZJMWx0wqj00T4YImXjX0w+Q0DBwtKw
	p6ELWWPXhD0ut8aGFquV/KSuDRCh97BsRytFAbO0jV+CrZPObWb6ZrS5iAxGwu3HzztmMoAqna7
	7l+T+LCmAgn5neq9wTRMuaVD6G9CN8rA00hCatFkXigToM+tQl7EuOHLuv6/J/2dXAWsMcVERDJ
	dwjNv/Axyi2U11Z4Ox7xKPgUl27McjHH4rHxwhj/fvoJ1vkmAbUYSd9tloAjZcRHmb/Ajq6UjnE
	eCStlNKJSVySQaBX8EMGN8jLjrT7wI1ljmw+lBefZNvycKTdvZUq/uAL1ZKwyIGRopp8PlA3k6u
	BwBXis4TRd/7lgAw7SnsPrXLQQzm7tf5mzhBfLWNgimMmw2xKQaEo/lyXWpO2PAmzkhvZHi2YUE
	rLul4TX5tZt21KBcPGpN5rdFPraYMl5/Y2uIK+s/R5Rcu0fpH+WQqWybRTX0h4KI3s8PkpPtGDi
	GtWNlXFfIOOrL+0B1Bm73fp7AIGKfjMHVcaIWLpt2QjvNobUzcTW7YwBbq+zb7L9ex62clTvSFk
	NYO0YllTH
X-Received: by 2002:a05:6808:3013:b0:4f0:2d60:f0f4 with SMTP id 5614622812f47-575dd7262aemr835835b6e.17.1794871097429;
        Mon, 16 Nov 2026 15:18:17 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:18:15 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: yu-ching.liu@mediatek.com,
	chengwei.yu@mediatek.com,
	jacobs.wu@mediatek.com,
	posh.sun@mediatek.com,
	clifford.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 01/19] wifi: mt76: mt7925: add NAN low power event control on suspend/resume
Date: Mon, 16 Nov 2026 17:16:12 -0600
Message-ID: <20261116231630.1733906-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_151818_806402_0A3C0463 
X-CRM114-Status: GOOD (  18.29  )
X-Spam-Score: -0.4 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index d3806d8dfbbf..c800ec2f25dc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -324,6 +324,7 @@ void mt7925_mcu_set_suspend_iter(void *priv, u8 *mac,
 	bool suspend = !test_bit(MT76_STATE_RUNNING, &phy->state);
 	struct ieee80211_hw *hw = phy->hw;
 	struct cfg80211_wowlan *wowlan = hw->wiphy->wowlan_config;
+	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 	int i;
 
 	mt76_connac_mcu_set_gtk_rekey(phy->dev, vif, suspend);
@@ -343,6 +344,14 @@ void mt7925_mcu_set_suspend_iter(void *priv, u8 *mac,
 	    !vif->cfg.assoc && !wowlan->nd_config)
 		return;
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
index ce2571832c08..39d56519bce4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -651,6 +651,44 @@ mt7925_nan_handle_sched_update_done(struct mt792x_dev *dev, struct tlv *tlv)
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
@@ -685,6 +723,9 @@ void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb)
 		case NAN_UNI_EVENT_ID_SCHED_UPDATE_DONE:
 			mt7925_nan_handle_sched_update_done(dev, tlv);
 			break;
+		case NAN_UNI_EVENT_LOWPOWER_CTRL:
+			mt7925_nan_handle_lowpower_ctrl(dev, tlv);
+			break;
 		default:
 			break;
 		}
@@ -694,6 +735,58 @@ void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb)
 	}
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
 static int mt7925_nan_avail_ctrl_tlv(struct sk_buff *skb,
 				     struct ieee80211_vif *vif)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index 9a0cd1d06d45..6979f0347d77 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -89,6 +89,7 @@ enum nan_uni_cmd_tag {
 	NAN_UNI_CMD_UPDATE_PEER_CAPABILITY	= 21,
 	NAN_UNI_CMD_CHANGE_NMI_ADDRESS		= 24,
 	NAN_UNI_CMD_SET_DW_INTERVAL		= 26,
+	NAN_UNI_CMD_LOWPOWER_CTRL		= 37,
 	NAN_UNI_CMD_SET_SYNC_RSSI		= 39,
 	NAN_UNI_CMD_SET_CLUSTER_ID		= 40,
 	NAN_UNI_CMD_KEY_MANAGEMENT		= 53,
@@ -96,6 +97,7 @@ enum nan_uni_cmd_tag {
 
 enum nan_uni_event_tag {
 	NAN_UNI_EVENT_ID_DE_EVENT_IND		= 19,
+	NAN_UNI_EVENT_LOWPOWER_CTRL		= 37,
 	NAN_UNI_EVENT_ID_ULW_UPDATE		= 39,
 	NAN_UNI_EVENT_ID_SCHED_UPDATE_DONE	= 43,
 	NAN_UNI_EVENT_REPORT_DW_START		= 59,
@@ -477,6 +479,20 @@ struct mt7925_nan_update_phy_setting_tlv {
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
@@ -496,6 +512,8 @@ int mt7925_nan_change_configure(struct ieee80211_vif *vif,
 
 void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb);
 
+int mt7925_nan_send_lowpower_ctrl_cmd(struct mt792x_dev *dev, bool enable);
+
 void mt7925_nan_local_sched_changed(struct mt792x_dev *dev,
 				    struct ieee80211_vif *vif);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index 4753ec20fe0c..cc6eb1562b5f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -188,6 +188,13 @@ struct mt792x_nan {
 
 	/* Connection index bitmap, up to NAN_MAX_CONN_CFG peers */
 	unsigned long conn_bitmap;
+
+	/*
+	 * Set when firmware reports an active peer schedule via
+	 * NAN_UNI_EVENT_LOWPOWER_CTRL; cleared once the re-enable command
+	 * has been sent on resume.
+	 */
+	bool lowpower_mode;
 };
 
 struct mt792x_vif {
-- 
2.43.0


