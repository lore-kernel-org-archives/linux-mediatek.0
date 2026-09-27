Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF94C9832F
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnjocpIIeGqdu9+YauQPign5rooTvBtAV96XTWEwWn8=; b=YI0DTnygJSF90c83tXrmfs357E
	sx3+CrCyg2OxHJTVkZnc0xv48tzWw5/FdLJgqZ4cAMnTVYC0y5/rx4HGelEUG6Pvmr1s7CJ/D7t84
	1QCfpCj+8F/8EksSnCCGNgaHZe0/VC53vBfgoLfFFuTTGmGsNf5s+fcXgX3GGTeYjI/E2b234l0DC
	niqfMGN7n9Ip8cRajLNBypO1P9dvJUB9w4ZzkSYxvRwSjJ3eRtjFrGvfpU8B653LyJDCD++IunqDs
	wlb4E/F7WMh3itadezAE5K1OZvtIVnzRo6mczc/0liOvmL0YR1AJd1soWBIMK68hoVH91fvsSJfUc
	tyPEBXvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw1w-0000000GrS9-1qB6;
	Sun, 27 Sep 2026 21:03:28 +0000
Received: from mail-yw1-f173.google.com ([209.85.128.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw1u-0000000GrRn-3OxZ
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:03:27 +0000
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-864cd11a932so18514657b3.0
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543005; x=1791147805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EnjocpIIeGqdu9+YauQPign5rooTvBtAV96XTWEwWn8=;
        b=MMxbkeby9oQrZCUryaOs5tUlX5KlktoyypbSl++RaUs3TclfAx7OBKXMrp+y0I+/KP
         C4XYWN31rsGrd8cFLDug01T612Ay5bioFwj3TYYel4R5sHCSorTlIH2Wo8FewiXWprEl
         w9MIqBw/JfU9bUfOxiKbb+/JyDvTWBHfLQ+oRqp0yhtT9J5m7cgbRnzOtEm+I81oR8UK
         lPVFz+f5Lc4xttUuSNJ2SB8FLYuS37NCaaGsSTWwrAHcn0VL7DpJlhzqcRYLaE7sisWo
         MqV7JWXBQMVWPFmej9yka9RKpfqOoRzrqlJu5agJ3+RTXkvEyTIByUBj3KIdRnW8uBtG
         8gjw==
X-Forwarded-Encrypted: i=1; AKwUvBwyT8Cav7vPBhnDmgPCQEZTU4OuXrVXFwtX0mKABaAIoMhpvzOO+xcJriSTnZ0oDMnnXmIt9XQnvLsjSed0pg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKsigupjbu+QuRtc0K01kXM3Symp0CzXGEOaCaXRBPfAjK8sjnl
	HNmpBpBqWo0CBLIrX36sbWuD3YA9A7t1qtz0m146YZmFFXNxqfGS8bPz
X-Gm-Gg: AYBFou10dlYisY947DgSDhK8lIM+hZFvnrEDq+j9PmzSM97/3+PZn8PptBbY8f/DBw/
	pMLNv5DZ5qBenhX2VFr1Y/ziUZCJr1A4zbxU4Koc+tP7qlba53R3CwLxfB5AvJ5Ofkc06Tg74yQ
	5loTs8phexRnsuk2/UvcHSq/0Z4N+Np2xKyYFALZlWSia50fiN0LSTA892Xx4EX1+hJ7HJolat5
	MkCbFYrFViv+CxokrkHNqk3Dj6AMNbreM/NZPARLEo3jjHSk9U/a/0PbwYdFuvnCGMddVPe6ol1
	XP2ajmJJJ+N5aD3euWY05G1Z3bMKIqsZBGfNqLcBPLCV2z/6d8YqJ0AI8UAxJ//2ER2hLkBAzSB
	DVfrnt1+6QSrTvPIymTT/gS72UAYoQjxBaciFAbUVV1H9Ok7BrJmnRiPN3w5dwgQu3uZfgABCTj
	4LpNAFDsV68eQgzsm0UGiboBVZjQ/LmWEimthvuvDyBcliTuMfNGnxlNI8KlVtyF/uJH2eQuArB
	BTeEffT6RQkHdnAmHzoeW4jMWSd0FCtYViQLfA0fyr5B5XnXyAkuoEyJp6WwG5qISCGuQ==
X-Received: by 2002:a05:690c:e242:20b0:8a5:9519:c62d with SMTP id 00721157ae682-8a64bb0346dmr38127527b3.12.1790543005496;
        Sun, 27 Sep 2026 14:03:25 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:03:24 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Chengwei Yu <chengwei.yu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 02/23] wifi: mt76: mt7925: add NMI/NDI MAC address setter helpers
Date: Sun, 27 Sep 2026 16:02:44 -0500
Message-ID: <20260927210306.737669-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_140326_857867_296BBC80 
X-CRM114-Status: GOOD (  11.63  )
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

Add mt7925_nan_set_nmi_address() and mt7925_nan_set_ndi_address() for
runtime MAC address changes: NMI goes through the MCU (firmware owns
the hardware address), NDI updates vif->addr directly.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Chengwei Yu <chengwei.yu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/nan.c   | 48 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/nan.h   |  8 ++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
index 8a59f7b1aee2..abbd3f7b081c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.c
@@ -697,6 +697,54 @@ void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb)
 	}
 }
 
+int mt7925_nan_set_nmi_address(struct ieee80211_vif *vif,
+			       struct mt792x_dev *dev,
+			       const u8 *mac_address)
+{
+	struct mt76_dev *mdev = &dev->mt76;
+	struct {
+		u8 rsv[4];
+		struct mt7925_nan_nmi_addr_tlv nmi_addr_tlv;
+	} nmi_cmd = {
+		.nmi_addr_tlv = {
+			.tag = cpu_to_le16(NAN_UNI_CMD_CHANGE_NMI_ADDRESS),
+			.len = cpu_to_le16(sizeof(struct mt7925_nan_nmi_addr_tlv)),
+		},
+	};
+
+	if (!dev || !vif || !mac_address)
+		return -EINVAL;
+
+	if (is_zero_ether_addr(mac_address) ||
+	    is_multicast_ether_addr(mac_address))
+		return -EINVAL;
+
+	memcpy(nmi_cmd.nmi_addr_tlv.nmi_addr, mac_address, ETH_ALEN);
+
+	return mt76_mcu_send_msg(mdev, MCU_UNI_CMD(NAN), &nmi_cmd,
+				 sizeof(nmi_cmd), true);
+}
+
+int mt7925_nan_set_ndi_address(struct ieee80211_vif *vif,
+			       struct mt792x_dev *dev,
+			       const u8 *mac_address)
+{
+	if (!dev || !vif || !mac_address)
+		return -EINVAL;
+
+	if (is_zero_ether_addr(mac_address) ||
+	    is_multicast_ether_addr(mac_address))
+		return -EINVAL;
+
+	/*
+	 * The NDI address is not managed by firmware; it is the vif's own
+	 * hardware address, so updating it locally is sufficient.
+	 */
+	memcpy(vif->addr, mac_address, ETH_ALEN);
+
+	return 0;
+}
+
 static int mt7925_nan_avail_ctrl_tlv(struct sk_buff *skb,
 				     struct ieee80211_vif *vif)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
index 297c2856578e..9fd349e1cdab 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/nan.h
@@ -495,6 +495,14 @@ int mt7925_nan_change_configure(struct ieee80211_vif *vif,
 
 void mt7925_nan_mcu_event(struct mt792x_dev *dev, struct sk_buff *skb);
 
+int mt7925_nan_set_nmi_address(struct ieee80211_vif *vif,
+			       struct mt792x_dev *dev,
+			       const u8 *mac_address);
+
+int mt7925_nan_set_ndi_address(struct ieee80211_vif *vif,
+			       struct mt792x_dev *dev,
+			       const u8 *mac_address);
+
 void mt7925_nan_local_sched_changed(struct mt792x_dev *dev,
 				    struct ieee80211_vif *vif);
 
-- 
2.43.0


