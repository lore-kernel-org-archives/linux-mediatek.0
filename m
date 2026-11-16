Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84558606A31C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 23:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XUtW+0Ki
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=js+P2Gd0L3tMlYVIQF8CICa6lPhijwgYtfOX2eYH5ts=; b=XUtW+0KiuZ4ymK
	5qQ5VNaLjlpfraKqbMzs6GVD5paz/Za6n8lfpx6u+UgNNoaV1fl9bb7oGc8MTqtoXD//kJwNtDUJE
	y7h2oCUab4Pp8qe26hdHKE1aytut3I6Bd0jIL+YPK7oIH4MNhEO5rNp6hxZ3EZ8s02/VwSNEt1jt3
	2HKLtwWKeHQ2u0qSJ5UxtrzMBNAOXjmQ1svFu3ll3sxYYu5f49N/tA5iUFg7TnC+cvcvTqTGZOlLU
	7NjIGzfVZgsx0Sp81BNkvVVbRTMbYALmQEY3Gj+KQgCLxAz1f496Hf/ER/Df5O1d/rVCxYF5f8HG7
	yD0Sq1DeGOs+tTOP6Xqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5yI-000000049ND-0YXm;
	Mon, 16 Nov 2026 23:18:46 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5yF-000000049L7-1pOu
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Nov 2026 23:18:44 +0000
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b19e291cc6so4644177eaf.2
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2026 15:18:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871122; x=1795475922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=js+P2Gd0L3tMlYVIQF8CICa6lPhijwgYtfOX2eYH5ts=;
        b=A+3rPq2Ket4Lr1mSIjxwgSxOdj8MXHtPqupni29Muemtto9kIPr8HjEvrCHj/ISmKU
         Uo+m7l+Xra+YAsGvFFDZAK52g+1BeFG5XgtP6bKWBj/c4Nq7njm79uVZ/quof+VOhXbU
         3um4VP/QXkrnnVt21aspNiybgqdEFdkKdMZ88E48sU1qIAc4csg6CmYu7V2bLkuxAqYN
         ZCfb7QoWxVs91Gvtt1XsYgpf3CA9767f1p/xJPRaLYvCJvF/qNjtDAiG8XhFB+ZF2I4B
         DtKJwp+n4xEuOyYm6isQwvCm1XwLdoNiYOL8c/6XH/Mmn4sye3WIkSxTfrw/0blb71zJ
         bsyQ==
X-Forwarded-Encrypted: i=1; AL+hErGQOZXjoEmtnnZ3NwAWSc63Q3luV4iFvBIdM2S+VgJydF8jihnG7dvneBQaV+ejEfUWrfDduxLDLAuVdzPCXA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+9fspPT2ixVNWIMBkfV4HfRF7/xoE49Xo3bWBPUQbYKL9ubnhU
	eZhfjbY/flMaRo8SMFdALpeMPn60BLjcltlxUX1k9OUiirm/uZA5IoG3
X-Gm-Gg: AYBFou2sZ102OGMj1t7+Q+FdN+Hs/YwVJWapQI1/ffnWYUIU7XNRHE4J4ME6kw81rRU
	mCj74TfnM7OmuuTzWlmzDZssvl97qKg76x42aqxwxaJQ0qyu7oXspvjb/zTwKQRn/lgQIWLXwQ0
	pcMEJDNMm793hhoemjDPVB1qvFy/lhTn6ZnmgNvecuh800mvIq8k7942cXdwUybD1pluq/4F2B+
	3eXlu1+DtTETsLYpmJjorg/pau5Thc3WYXUyCvGSK4TUoZeg2u83JETgA6wq6SUEkOUkWgjSeT2
	saYp2NeXBkY9ZyqyWp+LuTMZjoLYS7lBil+N/eJu1xmHz8Xbb/r7YUfN6YHYxUnuOvDLRSUurQ0
	5Pi9dhSItUWaTVg34gPKKlZqZ8WWSGgnQ42xeKmRid3lOxls0RMFN8U3DqL/XDqwgE1ZV29hR8d
	hfTvOr0O09F7U+5Y4nsd2u83WzZVXqeKOcpVvBNFIf+zfiD06/OegFba9eD2qkDM1M82/a9iQmZ
	P90VrC/GWkrh0vHzTN2nz+HsxP36xkTshE9JboeRPRvYH4CmNngtEGyfbCGJsHumHMrJ/hAWF+v
	hCE4G0fkq+RHddoapyh6LOHKUMMgddowgVVMLHiWsvZTTOV2SR0iCHkQ33JOUedAZ2ar7rL1PXG
	PUbsDzlyg/Q==
X-Received: by 2002:a05:6808:1a1f:b0:551:2eeb:d53c with SMTP id 5614622812f47-56e65012cf8mr10446785b6e.44.1794871122272;
        Mon, 16 Nov 2026 15:18:42 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:18:41 -0800 (PST)
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
Subject: [PATCH v2 03/19] wifi: mt76: mt7925: add per-peer RX IGTK/BIGTK and RX GTK WTBLs
Date: Mon, 16 Nov 2026 17:16:14 -0600
Message-ID: <20261116231630.1733906-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_151843_508180_9E715EF8 
X-CRM114-Status: GOOD (  16.10  )
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
index 222836699d15..490507ce97cd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1001,6 +1001,8 @@ mt7925_get_rates_table(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	return mvif->basic_rates_idx;
 }
 
+static void mt7925_nan_sta_wcids_init(struct mt792x_sta *msta);
+
 static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_link_sta *link_sta,
@@ -1123,6 +1125,9 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 			goto out_pm;
 	}
 
+	if (vif->type == NL80211_IFTYPE_NAN || vif->type == NL80211_IFTYPE_NAN_DATA)
+		mt7925_nan_sta_wcids_init(msta);
+
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 
 	return 0;
@@ -1376,6 +1381,45 @@ int mt7925_mac_sta_event(struct mt76_dev *mdev, struct ieee80211_vif *vif,
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
@@ -1420,6 +1464,9 @@ static void mt7925_mac_link_sta_remove(struct mt76_dev *mdev,
 	mt76_wcid_cleanup(mdev, wcid);
 	mt76_wcid_mask_clear(mdev->wcid_mask, idx);
 
+	if (vif->type == NL80211_IFTYPE_NAN || vif->type == NL80211_IFTYPE_NAN_DATA)
+		mt7925_nan_peer_wcids_free(mdev, vif, link_sta->sta);
+
 	mt76_connac_power_save_sched(&dev->mphy, &dev->pm);
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x.h b/drivers/net/wireless/mediatek/mt76/mt792x.h
index cc6eb1562b5f..07004066e666 100644
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
@@ -149,6 +154,12 @@ struct mt792x_sta {
 
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


