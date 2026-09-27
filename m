Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF63C98338
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqDpf6qzt1wZmK380MU1FK+A/S9BmuqJMXY6+W4+KOw=; b=EkKdaPwMaeNX0nuGGpN132U4pq
	ECXpckjo+GWirIajzdLxpYQqOBtue1p8aaZ5snKI/e6AYBMKSz4LuqdMcUhP9PrioPIClUlLp/yH1
	qcc1rRC2mDOLh/kcgRWLz04m1lYUa2Ah5/XyZjwqhSksQ7HkYS0MF4FwqLgDA87tHStLey5SwTlTe
	yTg/eJ/RKME9qlMnVq5FA6V2NxrDmZqZSw6SHbkXEmj/96sW1qhOzdIg+leWV/fPFFmIIlyXZTujg
	wDKot1zcNBw8PJorE/OZ1/rJv1V43BvLkbgy6KEAI/c6IBBfFB0SiQb0y5+kuOk+x3UKK7LdKoudD
	wyibcxew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw9A-0000000GsGH-1Jgh;
	Sun, 27 Sep 2026 21:10:56 +0000
Received: from mail-qk2-f13.google.com ([74.125.230.205])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw98-0000000GsFQ-0ULR
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:10:55 +0000
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76ec395so23356721cf.2
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543453; x=1791148253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rqDpf6qzt1wZmK380MU1FK+A/S9BmuqJMXY6+W4+KOw=;
        b=Try9EOY0+n3nsZ884SSu2j6+8XiDS9xTvB9ffqo4LPYvFozmi+jr10EbVIBQml4Y0k
         GrF/s195DXAVHtZiRT7XD9FZ+CwQdtuwGJluAAOYlkebz7ih4JY4Uc928xZZZGfUtGek
         WnvAWEQYeT8Z4xL5Rph7MbcxPEJXQkk7DCaUq+8RLotNl1Je3BQ58oqBxyCNaybLcx1d
         0kwuq/om0srtKOPksduKppEpbFc0FtmUCAe5El1sKX0CVU8Sjkc7wUwKh1WovjrmYU4+
         TssPClEjjHpvFhiupuUDpYUZXVk/xBqvTF8juoEA6BIPdC0wXGSXkYbOUoo/E+YlFNeX
         fRsA==
X-Forwarded-Encrypted: i=1; AKwUvBxsFiUyEKzPO7lrkjVOz7eWEEY7nEcB7Uhqbh4lsFtkk3pgF4XgC0x9ctyP0Yv4FThkwnbtLj4TUCUeGWldCQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lXWROoWvxyRwGjqS7VO2sXKNZOXacOlWPPbEPUxhR60Vj62Bfl
	v4sCjAY1klG4IHfW+R6etMZ57mTr5xeFiAwlQb+2eEn+Yzws3xWHg97TE/gwojRe
X-Gm-Gg: AYBFou1pY2lXezqqn/OmO6kn2oNY8V8Zpm/gszh/TWuwS9rR4VACAe+iNQHkTTGHMgd
	xBMrKJqRrT7CvDmHxAU7TME01YVOflT1+s/d2QuHGXX6uzpaa0b0K5q1TNhn3Dgz61pnQ4h38SD
	2tM8Ex39dyBOFheKfcs0nPx7MS9C7Qv58kxR5jGsZ759EiQwtaflBG8IZ77iImFimHwazvAzUy4
	1ZuQtl5qMGbT1dRWBe02A2PDRXSCi9GXPsAMtsQ52SFUYFfCG86tNiHawS/k07Fpu+Er0ECU6WC
	sJsXaPgbljAEIwwp69OBLiowXszjj1NqtS8VpXjlIBcfPcGv3wEe6AL1vOQAqFlL55YGtz1nJ2p
	tC5KCNHiFtxpy85iPlpKwGu+2EOPG8BexeYFlG8+wtnPoA1OXY8+izGCV7c4hh2daic/cfUqKJ/
	Mt9Nb8oH3A6PGbWMc3YK+UsoFij7/xF5m1FJ/ZJJ5tCJEjav/K3GDhOaLNronvxQudM8LP8SZeX
	WyOsQY3dKE1kUO1Q0rjIVj6cSje/eWQa1KRLlXru7OMJnZAhi2AlzbEIvLQpDyTs7I4vw==
X-Received: by 2002:a05:690e:134c:b0:673:a6e4:cb7f with SMTP id 956f58d0204a3-673a6e4ceddmr3584561d50.29.1790543063362;
        Sun, 27 Sep 2026 14:04:23 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:04:22 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Jacobs Wu <jacobs.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 19/23] wifi: mt76: mt7925: steer NAN handshake frames by committed-bitmap state
Date: Sun, 27 Sep 2026 16:03:01 -0500
Message-ID: <20260927210306.737669-20-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_141054_170111_FFF32482 
X-CRM114-Status: GOOD (  25.81  )
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
index 7aacfd6527e4..77a91a9ee4d4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -1446,14 +1446,14 @@ static int mt7925_nan_peer_cap_tlv(struct sk_buff *skb,
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
@@ -1479,10 +1479,14 @@ mt7925_nan_fill_crb_committed(struct mt7925_nan_sched_update_crb_tlv *crb_tlv,
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
@@ -1507,9 +1511,10 @@ static int mt7925_nan_update_crb_tlv(struct sk_buff *skb,
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
@@ -1552,6 +1557,7 @@ int mt792x_nan_set_peer_schedule(struct mt792x_dev *dev,
 	struct mt792x_nan *nan;
 	struct mt76_dev *mdev;
 	struct sk_buff *skb;
+	int committed;
 	int ret;
 
 	if (!dev || !sta)
@@ -1590,7 +1596,8 @@ int mt792x_nan_set_peer_schedule(struct mt792x_dev *dev,
 		}
 	}
 
-	if (mt7925_nan_update_crb_tlv(skb, sta, msta)) {
+	committed = mt7925_nan_update_crb_tlv(skb, sta, msta);
+	if (committed < 0) {
 		ret = -ENOMEM;
 		goto free_skb;
 	}
@@ -1603,6 +1610,13 @@ int mt792x_nan_set_peer_schedule(struct mt792x_dev *dev,
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
@@ -1613,6 +1627,7 @@ int mt792x_nan_set_peer_schedule(struct mt792x_dev *dev,
 clear_idx:
 	clear_bit(msta->nan_sched.sch_idx, &nan->conn_bitmap);
 	msta->nan_sched.idx_assigned = false;
+	msta->nan_sched.has_commit = false;
 
 	return ret;
 }
@@ -1676,6 +1691,7 @@ int mt792x_nan_set_peer_rec(struct mt76_dev *mdev,
 
 	clear_bit(msta->nan_sched.sch_idx, &nan->conn_bitmap);
 	msta->nan_sched.idx_assigned = false;
+	msta->nan_sched.has_commit = false;
 
 	return 0;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci_mac.c
index 5bdf3ebe6aef..6e9daf96da88 100644
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
index 8e1588970ac1..6ed0282775ba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -133,6 +133,7 @@ struct mt792x_sta_nan_sched {
 	u16 committed_dw;
 	u32 sch_idx;
 	bool idx_assigned;
+	bool has_commit;	/* last CRB carried a non-empty committed map */
 	unsigned long ndp_ctx_bitmap;
 	bool ndp_ctx_assigned;
 	u8 ndp_ctx_id;		/* assigned NDP context ID (for NDI sta) */
-- 
2.43.0


