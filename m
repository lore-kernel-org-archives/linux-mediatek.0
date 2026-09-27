Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B77C98338
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIz9ipdGqN0Ec+YYE5JVHummumioDMVEQAqS4Zma/O4=; b=443q9fEdb2OV3ercAPxI3bopeT
	YKXjcYoKccdS1Pk9WW4OsaeC8uAjVNR9bK6hMgS7kpukBj17yR0OMFOhBPGtjmP1p4uU5czOX0HuG
	eD5fIMoUlNwPc8o39vSzwYSP8HjMLi86Ty0kd2dtlkNLBRtvMLX5EXIcPguT2yhqv3Pq18gwoeizg
	AQGHRvJicCu3DMn5PcSKk6TfoRNoli7FuNFUNiTZXtRMdn1jfQ6vTw/zdBk0/ThDb0LCy8Cj7dE+G
	DtNil0x03kr2+LVqSFVwir2FA1/0XN+2GwYc76/a79lILYsFMA/+Jva2ysA8+ucNmxldh9Lddzy6O
	z6I6Gf4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAwA6-0000000GsWZ-2yWV;
	Sun, 27 Sep 2026 21:11:54 +0000
Received: from mail-dl2-f12.google.com ([74.125.229.140])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAwA5-0000000GsW9-0N1P
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:11:54 +0000
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04edb5so3971116c88.2
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543512; x=1791148312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xIz9ipdGqN0Ec+YYE5JVHummumioDMVEQAqS4Zma/O4=;
        b=0xSUjZGPPMcyeH3U6MV60E72f2l4mgorPq7DVwA8O95Mmj+9NP/DWUQcc+qb7lF6W9
         i4grBpDBen6oht5bxuS6ReZv8tnHdnjrVFZ6J/KwEYbI5Lj6vmosw0epERlUe+a2WPiN
         zIJKX38DPVjQ6AD1gKZ6KBrxeaSTmNbC4jTxeMXjNAT0QU2k5brxiCAXZVBYFCVPj3Rw
         L0pREX3AoutOXGj+IiUWcGnvQN56YefNMMcrs1dx+f4Hz4K3bwnqbpp2crWF8WnqxE8n
         unUrljM4/owK6vmbJi3wiBrt/Rl3wyzq5Gk/1PGJs36MForutDi+1/sxRRKZ3aUElSLa
         goPA==
X-Forwarded-Encrypted: i=1; AKwUvBydYz7vOqcJwUMR7pUE7ilKxQ/7iv0CVmnHMR5Bd8j21lROtfiBWkjZ1bQm4Guy1XZBplMvW1HHxRAgdgbw2g==@lists.infradead.org
X-Gm-Message-State: AFuF++lf9HGrJyyQs+6/L0hvdUzAkwkJqAovfBAezdJ1fbCrNX8OOjWi
	8HxuQv3EnOC0tAttNG+4tnTRy+6k8naT8qo3Pjy75wZV1GrPOwixdMqaH4YhtDpK
X-Gm-Gg: AYBFou1svMU+pszhYYidcajMJsc+2q/AmaLRs02LF/uaYLY4A4O/RJJE4J6/yzOE68U
	MO+OMefF/nMZW4jwE5y6FRH1X3aM/Ckkak7E6ArMAHXdM5lcoV/su2tiooO94VyGTNHT8Ar/EfJ
	/cFivwcJ6eQT9i07UBNDqtmeeVr8pHx+6Z7YK/o4ZQ9gFFcACRcPnyB2cIdEGRYkGDyVasfvcXe
	L3dKchGRdZT/2P9YLN80cIPu/bthtDVBS2Y/NpKNAcSL5/0QEhrZVVdRljsCIf0gforcON+Ij2G
	Hmt297/VLnWzKV0C+cJ+h2AxU0MyknTshbJ5BHKQz9SK+Ezq4KiWJj+nwBnpQHrPEH97xqRVsQn
	BSfcxyNh+OxLQjk2L5pmFxklwkq9hFFUSnp6TYiPVQk0KptFcLFEbczabQM+bg7y/62K034lqgM
	OQXo+dTa0f80Na0WO4aFIz5Sxw25GAO6tkH27ObC/t9R7RJbrStCJkC/jEPCXdk6Tltc/7n/SAQ
	4hI3/5+2LUUoAvoYncGW/nHDUZu6m7x1zhAcitHZNxhsdp/0iVeuOjgXOAUe1HOKiLGgw==
X-Received: by 2002:a05:690c:6e09:b0:8a8:5c3d:930 with SMTP id 00721157ae682-8a85c3d17fdmr34943737b3.0.1790543019500;
        Sun, 27 Sep 2026 14:03:39 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:03:38 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Chengwei Yu <chengwei.yu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 07/23] wifi: mt76: mt7925: add per-peer RX IGTK/BIGTK and RX GTK WTBLs
Date: Sun, 27 Sep 2026 16:02:49 -0500
Message-ID: <20260927210306.737669-8-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_141153_152008_E5E94E59 
X-CRM114-Status: GOOD (  16.11  )
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

NAN RX group keys are per-peer: each NAN peer can carry an independent
IGTK/BIGTK, and each NAN_DATA peer an independent GTK. Add
nan_rx_igtk_wcid and nan_rx_gtk_wcid to mt792x_sta to hold dedicated
WTBL entries for these keys.

WTBLs are allocated lazily: mt7925_nan_sta_wcids_init() marks both
fields MT792x_WCID_IDX_UNSET at peer-add time, and
mt7925_nan_peer_wcids_free() releases whichever slots were actually
allocated at peer-remove time. Peers that never install a NAN group
key carry zero overhead.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chengwei Yu <chengwei.yu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 47 +++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt792x.h   | 11 +++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 3e1c223e8da6..2d3bf7d806a7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -923,6 +923,8 @@ mt7925_get_rates_table(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	return mvif->basic_rates_idx;
 }
 
+static void mt7925_nan_sta_wcids_init(struct mt792x_sta *msta);
+
 static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_link_sta *link_sta,
@@ -1060,6 +1062,9 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 			goto out_pm;
 	}
 
+	if (vif->type == NL80211_IFTYPE_NAN || vif->type == NL80211_IFTYPE_NAN_DATA)
+		mt7925_nan_sta_wcids_init(msta);
+
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 
 	return 0;
@@ -1306,6 +1311,45 @@ int mt7925_mac_sta_event(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 }
 EXPORT_SYMBOL_GPL(mt7925_mac_sta_event);
 
+/* Mark per-peer NAN group key WTBLs as unallocated at station add time.
+ * Pairs with mt7925_nan_peer_wcids_free() at station remove time.
+ */
+static void mt7925_nan_sta_wcids_init(struct mt792x_sta *msta)
+{
+	msta->nan_rx_gtk_wcid.idx = MT792x_WCID_IDX_UNSET;
+	msta->nan_rx_igtk_wcid.idx = MT792x_WCID_IDX_UNSET;
+}
+
+/* Free a lazily-allocated per-peer NAN group key WTBL and reset its sentinel. */
+static void mt7925_nan_wcid_free(struct mt76_dev *mdev, struct mt76_wcid *wcid)
+{
+	u16 idx = wcid->idx;
+
+	rcu_assign_pointer(mdev->wcid[idx], NULL);
+	mt76_wcid_cleanup(mdev, wcid);
+	mt76_wcid_mask_clear(mdev->wcid_mask, idx);
+	wcid->idx = MT792x_WCID_IDX_UNSET;
+}
+
+/* Release any lazily-allocated per-peer NAN group key WTBLs for a departing
+ * station.  Called from mt7925_mac_link_sta_remove() after the primary WTBL
+ * is already freed, so the NAN-specific cleanup is clearly separated from the
+ * generic STA teardown path.
+ */
+static void mt7925_nan_peer_wcids_free(struct mt76_dev *mdev,
+				       struct ieee80211_vif *vif,
+				       struct ieee80211_sta *sta)
+{
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+
+	if (vif->type == NL80211_IFTYPE_NAN_DATA &&
+	    msta->nan_rx_gtk_wcid.idx != MT792x_WCID_IDX_UNSET)
+		mt7925_nan_wcid_free(mdev, &msta->nan_rx_gtk_wcid);
+
+	if (msta->nan_rx_igtk_wcid.idx != MT792x_WCID_IDX_UNSET)
+		mt7925_nan_wcid_free(mdev, &msta->nan_rx_igtk_wcid);
+}
+
 static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 				       struct ieee80211_vif *vif,
 				       struct ieee80211_link_sta *link_sta,
@@ -1350,6 +1394,9 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 	mt76_wcid_cleanup(mdev, wcid);
 	mt76_wcid_mask_clear(mdev->wcid_mask, idx);
 
+	if (vif->type == NL80211_IFTYPE_NAN || vif->type == NL80211_IFTYPE_NAN_DATA)
+		mt7925_nan_peer_wcids_free(mdev, vif, link_sta->sta);
+
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index fa28a77d12bb..707ca24193f9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x.h
@@ -18,6 +18,11 @@
 #define MT792x_WTBL_SIZE	20
 #define MT792x_WTBL_RESERVED	(MT792x_WTBL_SIZE - 1)
 #define MT792x_WTBL_STA		(MT792x_WTBL_RESERVED - MT792x_MAX_INTERFACES)
+/* Sentinel for a lazily-allocated wcid that has not yet been assigned a slot.
+ * U16_MAX is outside every valid alloc range and matches the 0xffff value
+ * used in mt76 DMA ring entries to mark an unused wcid field.
+ */
+#define MT792x_WCID_IDX_UNSET	U16_MAX
 
 #define MT792x_CFEND_RATE_DEFAULT	0x49	/* OFDM 24M */
 #define MT792x_CFEND_RATE_11B		0x03	/* 11B LP, 11M */
@@ -148,6 +153,12 @@ struct mt792x_sta {
 
 	/* NAN peer schedule */
 	struct mt792x_sta_nan_sched nan_sched;
+
+	/* NAN per-peer group key WTBLs (allocated lazily when keys are installed)
+	 * Note: TX GTK is interface-level, see mt792x_vif->nan_tx_gtk_table
+	 */
+	struct mt76_wcid nan_rx_gtk_wcid;    /* NAN_DATA peer: RX GTK WTBL (per-peer) */
+	struct mt76_wcid nan_rx_igtk_wcid;   /* NAN peer: RX IGTK/BIGTK WTBL (per-peer) */
 };
 
 DECLARE_EWMA(rssi, 10, 8);
-- 
2.43.0


