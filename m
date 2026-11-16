Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98B7606A332
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 23:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FdyfmxNL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ovD5H6S5jQwSZumZQjn/7Elyf6SaJFCwpBEMaO/7ZD0=; b=FdyfmxNLiV1l5C
	CApUavrJr3+G7ITPAngjsyMvBLoPG9d6bX5p5ynxJZ9ixuplYUFkDMcHqT2q5hkweKBQ6wwKShE5X
	UE21+W6Rlc4Ydke82todA0ufUZTx8PPKJlQWxVsISLiJXbre7cfvJS1OBlOjJL1WImqyxNuYDQl24
	7LoHvPwKBSHz7veZ9LexwFcObdM06UTESsV/FOQWVtC1ZJblJmYZPXN0qqLhiJAgQAvHcOKk9acs4
	pakqs381F6K2cf1NQOXZRIVuF9XnP1yavtSGXDSZFtVB8u8xNQlazeFtnfqqLb8EJeyvlsW7lbCgZ
	jYT13yPCydTYD53SdVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5zL-000000049m0-1lrj;
	Mon, 16 Nov 2026 23:19:51 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5zJ-000000049l6-3jBQ
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 23:19:51 +0000
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-862b9c2e78aso1076930a34.2
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:19:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871189; x=1795475989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ovD5H6S5jQwSZumZQjn/7Elyf6SaJFCwpBEMaO/7ZD0=;
        b=Wk2lbxRG+dVg32h34FsgE0vjHDtnqpJXXpEdU/jDI9VMCbKwNNj96xBqWycbNHETaA
         NXJfGmtA9zNKwzlIG9TGlkpd7wdbRRwUPYKT45978E1DzD6IlMv4X5nvq38q2Vs1Mbir
         xxgDqmi0CDbeYaVdcRJ6Cxvm0R/j2GHZNZiuU4cJamgUqK0/MZJ+kUbgfJaRUBLGqDST
         3pOH8XhIjrFPDAU7jUJ1umaeWTIU7h8Gc4oHtA/dcuUksC31wr7lFMGJ2MBJYU0Q+Qo2
         K4rL+AR/9xQAbtVdMb7OEDYh4rokpUxql/dvvWWsAITYmPV3rz825w+Yx3tDaXMFlSs7
         fkOA==
X-Forwarded-Encrypted: i=1; AL+hErHuiInEVB75LxRPsUpdTxeyPpVliTgHC3QCIKRDGtjmOzr4FK9aUWNrD5NOnbVJdt8lPdZbZms1tnLdLyt7IQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9O0UZmreHPTwirPx5ZzwnRCjIeO6Gvk8Y4yNr/CTYrNW8WszVW
	uXnKi/6RjTRb2qgpZS6QR71Cn3LxU7I5ipB5eWRXEpO2MVahdlUH1CeQ
X-Gm-Gg: AYBFou1OgzivAMiRN1JH4/woUwZomc7chEClFMn1B3nB6NRa5WEfsY3holpUMtj+keB
	/TkaTfBpmtcWlXIxnUomy4nWxL5VVCLcVIl8Ias0jWA/t2HIwNfobp53bphoNRYErLX2wDY8SPa
	AB0NsxOwWW6zaQSnOa3DWPZJiusdW9NkfrfXVxeqL3968Exl72+dY2c4a78g7QBot2MV6VZBd2J
	X2RG25E5wSrl7r2PBcl0Dra7wI4/wgl9+fSd5l3MMHAES0AY3+XhwdlubXlMZj5L83TckqdWblY
	8qf3s7fsmy3CYfRwU0whrHhCIo/Rn05fZO5Zwd5IymFOIalq7AVv8uvTGa3VINxf+tX21KLpU8y
	GFEebfYibEPs5zJBcyw4D1jA0bb7CC76jva3npCx2r8C27VC450VgwAndm1oo18KF/XAcPwMx4t
	6v8b2towxWS8nb4CU8eBkEvTJxl2vmE4hw7tkr0vpVVADghtVbx+v0S+14mSKL4lmsOETYhjU8R
	TAIZBy5bLBWzXhiiajb4QdtOyl4rc/dvO/uFGV+3NDNkVWFfHqsbXtpyR1qIxJtZ6iim08WLZcn
	8H+oRM6bPYcZhufp9xBqmnI+lwKwm0a1x5auUJqUh7Z49CacE1na4bwJOyt24H7r5+M7Ck3Sd2Z
	PkR6A0iWE
X-Received: by 2002:a05:6808:6d82:b0:573:1dfa:f0c2 with SMTP id 5614622812f47-5731dfaf630mr5362400b6e.29.1794871188866;
        Mon, 16 Nov 2026 15:19:48 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:47 -0800 (PST)
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
Subject: [PATCH v2 14/19] wifi: mt76: mt7925: steer NAN handshake frames by committed-bitmap state
Date: Mon, 16 Nov 2026 17:16:25 -0600
Message-ID: <20261116231630.1733906-15-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_151949_947105_85DD3942 
X-CRM114-Status: GOOD (  25.92  )
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

From: Jacobs Wu <jacobs.wu@mediatek.com>

Unencrypted unicast NAN management is held to the discovery window on the
DW-WTBL, because a peer whose NDL is not yet confirmed is only reliably
awake there. That is the right call while nothing is known about the
peer, but it stays in force for the whole session, and the DW is a narrow
place to live: it opens for 16 ms every 512 ms and is shared with the
discovery queue, so roughly four transmit opportunities exist inside the
two seconds a Data Path Response has to complete. Under load the
handshake loses that race. Routing the same frames through the peer STA
WTBL was what made NDP setup reliable with a partial availability bitmap
in the first place, since the firmware then paces them by the committed
window instead of bursting blindly.

Neither placement is right on its own: the peer WTBL is only usable once
the firmware actually holds that peer's committed bitmap. A peer station
existing in mac80211 does not imply that - until the CRB download lands,
the peer's availability gate has no slots to open and a frame steered
there parks behind the pause until the session is torn down.

Track the committed state per peer. mt7925_nan_fill_crb_committed()
returns the number of committed slots it programmed, and
mt7925_nan_update_crb_tlv() latches whether that count was non-zero into
nan_sched.has_commit; the allocation rollback in
mt792x_nan_set_peer_schedule() and the peer record removal in
mt792x_nan_set_peer_rec() clear it again. Frames to a peer holding a
committed bitmap keep that peer's WTBL and are served in the slots it
has promised to be awake for; frames to a peer without one, and frames
with no station resolved, keep riding the DW-WTBL. Secured frames are
untouched and keep their own WTBL and key.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 30 +++++++++++----
 .../wireless/mediatek/mt76/mt7925/pci_mac.c   | 37 +++++++------------
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  1 +
 3 files changed, 38 insertions(+), 30 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 0fe8ae6c0d26..aa030dca7e01 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -1336,14 +1336,14 @@ static int mt7925_nan_peer_cap_tlv(struct sk_buff *skb,
 	return 0;
 }
 
-static void
+static u32
 mt7925_nan_fill_crb_committed(struct mt7925_nan_sched_update_crb_tlv *crb_tlv,
 			      struct ieee80211_nan_peer_sched *sched)
 {
-	u32 m, slot;
+	u32 m, slot, total = 0;
 
 	if (!sched)
-		return;
+		return 0;
 
 	for (m = 0; m < CFG80211_NAN_MAX_PEER_MAPS &&
 	     m < NAN_TIMELINE_MGMT_SIZE; m++) {
@@ -1369,10 +1369,14 @@ mt7925_nan_fill_crb_committed(struct mt7925_nan_sched_update_crb_tlv *crb_tlv,
 			if (!ch || !ch->chanctx_conf)
 				continue;
 
+			total++;
+
 			for (dw = 0; dw < NAN_TOTAL_DW; dw++)
 				tl->avail_map[dw] |= cpu_to_le32(BIT(slot));
 		}
 	}
+
+	return total;
 }
 
 static int mt7925_nan_update_crb_tlv(struct sk_buff *skb,
@@ -1397,9 +1401,10 @@ static int mt7925_nan_update_crb_tlv(struct sk_buff *skb,
 	crb_tlv->is_use_ranging = false;
 	crb_tlv->comm_ndc_ctrl.is_valid = false;
 
-	mt7925_nan_fill_crb_committed(crb_tlv, sta->nan_sched);
-
-	return 0;
+	/* Returns the number of committed slots programmed; the caller latches
+	 * has_commit only once the command has actually reached firmware.
+	 */
+	return mt7925_nan_fill_crb_committed(crb_tlv, sta->nan_sched);
 }
 
 static int
@@ -1442,6 +1447,7 @@ int mt792x_nan_set_peer_schedule(struct mt792x_dev *dev,
 	struct mt792x_nan *nan;
 	struct mt76_dev *mdev;
 	struct sk_buff *skb;
+	int committed;
 	int ret;
 
 	if (!dev || !sta)
@@ -1480,7 +1486,8 @@ int mt792x_nan_set_peer_schedule(struct mt792x_dev *dev,
 		}
 	}
 
-	if (mt7925_nan_update_crb_tlv(skb, sta, msta)) {
+	committed = mt7925_nan_update_crb_tlv(skb, sta, msta);
+	if (committed < 0) {
 		ret = -ENOMEM;
 		goto free_skb;
 	}
@@ -1493,6 +1500,13 @@ int mt792x_nan_set_peer_schedule(struct mt792x_dev *dev,
 	if (ret && idx_allocated)
 		goto clear_idx;
 
+	/* Latch only now: firmware holds this peer's committed bitmap, so its
+	 * availability gate has slots to open and unencrypted NAF may be
+	 * steered at the peer WTBL. Cleared when the CRB is torn down.
+	 */
+	if (!ret)
+		msta->nan_sched.has_commit = committed > 0;
+
 	return ret;
 
 free_skb:
@@ -1503,6 +1517,7 @@ int mt792x_nan_set_peer_schedule(struct mt792x_dev *dev,
 clear_idx:
 	clear_bit(msta->nan_sched.sch_idx, &nan->conn_bitmap);
 	msta->nan_sched.idx_assigned = false;
+	msta->nan_sched.has_commit = false;
 
 	return ret;
 }
@@ -1566,6 +1581,7 @@ int mt792x_nan_set_peer_rec(struct mt76_dev *mdev,
 
 	clear_bit(msta->nan_sched.sch_idx, &nan->conn_bitmap);
 	msta->nan_sched.idx_assigned = false;
+	msta->nan_sched.has_commit = false;
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index eb07abfef209..7f6da681b4a4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
@@ -33,16 +33,15 @@ int mt7925e_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	 * full retry budget on an unACKable multicast RA, so one frame eats a
 	 * whole DW window and the publish SDF queue backlogs.
 	 *
-	 * Unencrypted unicast to a peer we have no station for is first
-	 * contact (SDF, NDP request): the DW is the only rendezvous, so it
-	 * goes on the DW-WTBL and waits for it.
-	 *
-	 * Once its schedule is known - the peer station exists, which is also
-	 * when firmware holds its committed bitmap - the frame belongs on that
-	 * station instead. Firmware then airs it inside the peer's own
-	 * committed slots, where the peer is awake and the medium is not the
-	 * DW pile-up, and follows the FAW onto whatever channel the window
-	 * actually uses rather than being pinned to the DW channel.
+	 * Unencrypted unicast is handshake traffic (SDF follow-up, NDP
+	 * request/response, pairing bootstrap). Until firmware holds the
+	 * peer's committed bitmap its availability gate has nothing to open,
+	 * so a frame steered at the peer WTBL would park behind the BY_NAN
+	 * pause; such frames ride the DW-WTBL, which firmware unpauses every
+	 * DW - the one rendezvous both peers must be awake for. Once the CRB
+	 * download latches has_commit, the frame keeps the peer's own WTBL
+	 * and firmware serves it in the committed slots, which a 2-second
+	 * handshake deadline needs (the DW alone offers only ~4 shots).
 	 *
 	 * Secured frames belong to an established peer and keep its own WTBL
 	 * and key.
@@ -52,24 +51,16 @@ int mt7925e_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 		struct mt792x_vif *mvif = (void *)vif->drv_priv;
 		bool mcast = is_multicast_ether_addr(hdr->addr1);
 
+		struct mt792x_sta *peer = (!mcast && sta) ?
+			(struct mt792x_sta *)sta->drv_priv : NULL;
+
 		if (mcast && wcid == &mvif->nan_dw_wcid) {
 			wcid = &mvif->sta.deflink.wcid;
 		} else if (!mcast && !key &&
+			   !(peer && peer->nan_sched.has_commit) &&
 			   mvif->nan_dw_wcid.idx &&
 			   mvif->nan_dw_wcid.idx < MT792x_WTBL_STA) {
-			struct ieee80211_sta *psta;
-			struct mt792x_sta *pmsta;
-
-			rcu_read_lock();
-			psta = ieee80211_find_sta(vif, hdr->addr1);
-			pmsta = psta ? (struct mt792x_sta *)psta->drv_priv :
-				       NULL;
-
-			if (pmsta && pmsta->deflink.wcid.idx)
-				wcid = &pmsta->deflink.wcid;
-			else
-				wcid = &mvif->nan_dw_wcid;
-			rcu_read_unlock();
+			wcid = &mvif->nan_dw_wcid;
 		}
 	}
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index c46b88467193..586352f4b1d0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -134,6 +134,7 @@ struct mt792x_sta_nan_sched {
 	u16 committed_dw;
 	u32 sch_idx;
 	bool idx_assigned;
+	bool has_commit;	/* last CRB carried a non-empty committed map */
 	unsigned long ndp_ctx_bitmap;
 	bool ndp_ctx_assigned;
 	u8 ndp_ctx_id;		/* assigned NDP context ID (for NDI sta) */
-- 
2.43.0


