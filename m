Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB47AD3EE67
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jan 2026 13:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovFMZ6FxWpPMzo04gfrZEIx0tosM4gl2xvUyP7KxUwI=; b=LscZhLIOV/oQOMmQ9nqxCb/xg/
	Q50+gpE0OLL3u/vCJF7/cvBJtOJa46NsyACfoYQmQ5fqBunxknorsc/j3j66hVA9TWPtmxi0d+5tA
	owylRaF5cQ5HFmemGZSWrPWeyXr4dOaRcaO0nDgMQsy7vpisfiCcm/+Zvga5P2M+wjGKZdWXUutt4
	zqNGfOvLkpQ4g/C3x/epl6JKB3TFus0LTqvnCdFhewYRka4+fAp2kvP/jXseresGP1zoL1pd/lrSX
	faB4Ob9Dme2nYgc2sgJFQ+qzVGOMyRntYfJV6IKGvtSlqNHeIxBJDUghl5g3a2YwaSGvnFlfSdue3
	MDZKFCtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viv6O-00000007BGl-3QlV;
	Thu, 22 Jan 2026 13:52:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viv6L-00000007BF3-3v8I
	for linux-mediatek@lists.infradead.org;
	Thu, 22 Jan 2026 13:51:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A1E01400EC;
	Thu, 22 Jan 2026 13:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D171C116C6;
	Thu, 22 Jan 2026 13:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769089917;
	bh=yCWEKOTHUdqxQ+46aWuYxCX4M3hhc3zYUc8tigX9Uzw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iMiy49vYVcc4ohcM7RYxaJPelOLCrhAHZDK+edBFQXt2ROcACsSvMeUqo0ZEdOI1j
	 9fI/yUUK/Rm7da4xHcC7ETrR1dLdLcSK4EpfxGC7JS7MHGJktH+Z9QEPxSjsKODp5n
	 waCJVSJ6V5oKRKLB613TAr57T/4KoJ28/onNyrYoF4uT1T/rSondpsh9WRdYUCXCKe
	 dN9meY13CUmTFh9gFCh2e5CVjbG/lbDsMdQfNsLeTUPxZ2hQIva+9YDOERA5BdIrmB
	 cdWIZZZ2dI3xOkYF/kutbqrSOfg4qF6kD+CIhMi6qzrjQ9aqhtNf+OzZvydXaA+uK8
	 nL2HKCUJsLBjw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 22 Jan 2026 14:51:34 +0100
Subject: [PATCH wireless-next 2/2] wifi: mac80211: Add drv_set_eml_op_mode
 driver callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-mac80211-emlsr-v1-2-f0e43bb6d95a@kernel.org>
References: <20260122-mac80211-emlsr-v1-0-f0e43bb6d95a@kernel.org>
In-Reply-To: <20260122-mac80211-emlsr-v1-0-f0e43bb6d95a@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
 Shayne Chen <shayne.chen@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_055158_037233_E0A6B33A 
X-CRM114-Status: GOOD (  14.61  )
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

Introduce drv_set_eml_op_mode mac80211 callback in order to configure
underlay driver with eMLSR info (control and bitmap). eMLMR is currently
not supported.

Tested-by: Christian Marangi <ansuelsmth@gmail.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 include/net/mac80211.h    |  7 +++++++
 net/mac80211/driver-ops.h | 21 +++++++++++++++++++++
 net/mac80211/eht.c        | 26 ++++++++++++++++++++++++--
 net/mac80211/trace.h      | 31 +++++++++++++++++++++++++++++++
 4 files changed, 83 insertions(+), 2 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 36ae7fe9ddf35190921f4fee0fe3294418007a56..3920135595c545a4255bf513c2c8b0525a383c71 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -4513,6 +4513,9 @@ struct ieee80211_prep_tx_info {
  *      interface with the specified type would be added, and thus drivers that
  *      implement this callback need to handle such cases. The type is the full
  *      &enum nl80211_iftype.
+ * @set_eml_op_mode: Configure eMLSR/eMLMR operation mode in the underlay
+ *	driver according to the parameter received in the EML Operating mode
+ *	notification frame.
  */
 struct ieee80211_ops {
 	void (*tx)(struct ieee80211_hw *hw,
@@ -4908,6 +4911,10 @@ struct ieee80211_ops {
 			struct ieee80211_neg_ttlm *ttlm);
 	void (*prep_add_interface)(struct ieee80211_hw *hw,
 				   enum nl80211_iftype type);
+	int (*set_eml_op_mode)(struct ieee80211_hw *hw,
+			       struct ieee80211_vif *vif,
+			       struct ieee80211_link_sta *link_sta,
+			       u8 control, __le16 link_bitmap);
 };
 
 /**
diff --git a/net/mac80211/driver-ops.h b/net/mac80211/driver-ops.h
index 55105d238d6bc5963eb2863575805bee72c42399..a3f2a38241edbea62698cb1104a11a80681983a0 100644
--- a/net/mac80211/driver-ops.h
+++ b/net/mac80211/driver-ops.h
@@ -1772,4 +1772,25 @@ drv_prep_add_interface(struct ieee80211_local *local,
 	trace_drv_return_void(local);
 }
 
+static inline int drv_set_eml_op_mode(struct ieee80211_sub_if_data *sdata,
+				      struct ieee80211_link_sta *link_sta,
+				      u8 control, __le16 link_bitmap)
+{
+	struct ieee80211_local *local = sdata->local;
+	int ret = 0;
+
+	might_sleep();
+	lockdep_assert_wiphy(local->hw.wiphy);
+
+	trace_drv_set_eml_op_mode(local, sdata, link_sta, control,
+				  link_bitmap);
+	if (local->ops->set_eml_op_mode)
+		ret = local->ops->set_eml_op_mode(&local->hw, &sdata->vif,
+						  link_sta, control,
+						  link_bitmap);
+	trace_drv_return_int(local, ret);
+
+	return ret;
+}
+
 #endif /* __MAC80211_DRIVER_OPS */
diff --git a/net/mac80211/eht.c b/net/mac80211/eht.c
index f1f60d41fccfc2da4ecd2961f6a524e94a6bfa6c..cb5d0ca08ac3aa81f928ab4e05107515dc111858 100644
--- a/net/mac80211/eht.c
+++ b/net/mac80211/eht.c
@@ -5,6 +5,7 @@
  * Copyright(c) 2021-2025 Intel Corporation
  */
 
+#include "driver-ops.h"
 #include "ieee80211_i.h"
 
 void
@@ -136,17 +137,22 @@ void ieee80211_rx_eml_op_mode_notif(struct ieee80211_sub_if_data *sdata,
 {
 	int hdr_len = offsetof(struct ieee80211_mgmt, u.action.u.eml_omn);
 	enum nl80211_iftype type = ieee80211_vif_type_p2p(&sdata->vif);
+	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
 	const struct wiphy_iftype_ext_capab *ift_ext_capa;
 	struct ieee80211_mgmt *mgmt = (void *)skb->data;
 	struct ieee80211_local *local = sdata->local;
 	u8 control = mgmt->u.action.u.eml_omn.control;
 	u8 *ptr = mgmt->u.action.u.eml_omn.variable;
+	struct wiphy *wiphy = local->hw.wiphy;
+	struct link_sta_info *link_sta;
+	__le16 link_bitmap = 0;
+	struct sta_info *sta;
 	u8 act_len = 3; /* action_code + dialog_token + control */
 
 	if (!ieee80211_vif_is_mld(&sdata->vif))
 		return;
 
-	ift_ext_capa = cfg80211_get_iftype_ext_capa(local->hw.wiphy, type);
+	ift_ext_capa = cfg80211_get_iftype_ext_capa(wiphy, type);
 	if (!ift_ext_capa)
 		return;
 
@@ -160,8 +166,10 @@ void ieee80211_rx_eml_op_mode_notif(struct ieee80211_sub_if_data *sdata,
 		return;
 
 	if ((control & IEEE80211_EML_CTRL_EMLSR_MODE) ||
-	    (control & IEEE80211_EML_CTRL_EMLMR_MODE))
+	    (control & IEEE80211_EML_CTRL_EMLMR_MODE)) {
+		link_bitmap = get_unaligned((__le16 *)ptr);
 		act_len += sizeof(__le16); /* eMLSR/eMLMR link_bitmap */
+	}
 
 	if (control & IEEE80211_EML_CTRL_EMLMR_MODE) {
 		u8 mcs_map_count = ptr[3];
@@ -176,5 +184,19 @@ void ieee80211_rx_eml_op_mode_notif(struct ieee80211_sub_if_data *sdata,
 	if (skb->len < hdr_len + act_len)
 		return;
 
+	if (!status->link_valid)
+		return;
+
+	sta = sta_info_get_bss(sdata, mgmt->sa);
+	if (!sta)
+		return;
+
+	link_sta = wiphy_dereference(wiphy, sta->link[status->link_id]);
+	if (!link_sta)
+		return;
+
+	if (drv_set_eml_op_mode(sdata, link_sta->pub, control, link_bitmap))
+		return;
+
 	ieee80211_send_eml_op_mode_notif(sdata, mgmt, act_len);
 }
diff --git a/net/mac80211/trace.h b/net/mac80211/trace.h
index 0bfbce1574862b5a6a2ca39794abea7fe9a3f34a..584658bd4640c72aef3199cd9341699924fd5fea 100644
--- a/net/mac80211/trace.h
+++ b/net/mac80211/trace.h
@@ -3353,6 +3353,37 @@ TRACE_EVENT(drv_prep_add_interface,
 	)
 );
 
+TRACE_EVENT(drv_set_eml_op_mode,
+	    TP_PROTO(struct ieee80211_local *local,
+		     struct ieee80211_sub_if_data *sdata,
+		     struct ieee80211_link_sta *link_sta,
+		     u8 control, __le16 link_bitmap),
+
+	TP_ARGS(local, sdata, link_sta, control, link_bitmap),
+
+	TP_STRUCT__entry(LOCAL_ENTRY
+			 VIF_ENTRY
+			 STA_ENTRY
+			 __field(u32, link_id)
+			 __field(u8, control)
+			 __field(__le16, link_bitmap)),
+
+	TP_fast_assign(LOCAL_ASSIGN;
+		       VIF_ASSIGN;
+		       STA_NAMED_ASSIGN(link_sta->sta);
+		       __entry->link_id = link_sta->link_id;
+		       __entry->control = control;
+		       __entry->link_bitmap = link_bitmap;
+	),
+
+	TP_printk(
+		LOCAL_PR_FMT  VIF_PR_FMT  STA_PR_FMT
+		" (link:%d control:%02x link_bitmap:%04x)",
+		LOCAL_PR_ARG, VIF_PR_ARG, STA_PR_ARG, __entry->link_id,
+		__entry->control, __entry->link_bitmap
+	)
+);
+
 #endif /* !__MAC80211_DRIVER_TRACE || TRACE_HEADER_MULTI_READ */
 
 #undef TRACE_INCLUDE_PATH

-- 
2.52.0


