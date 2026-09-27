Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977BCC9832F
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Sep 2026 21:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44C50Q4Ln0VEE6bQOHS+qkeZ/WSlCaRUIPf2SffjR1M=; b=h5roBZv1aulk1e9Vg2fXUUH2MM
	fVXyH6lv0v75J2YmTTCxSsHfpXnbmMoG/HO038ee0XNbjBdYe3MhCpmZ1g9M8gtdhXQkPZflWdQhk
	n4aq1jdQFPDDB17kAZDNHX7xfUg3q+4KnQdDldtJGyq8eHDmA6M82/gudgvdj/aZTRHx3zc6/nv/G
	FfJk1rwdWOcZkZ+gkHJTG1DOOo5y8mj6ri55ga+wolFcRUdTM3Vrwql7t2q2f3FBcIDPgNuTAenqW
	0t95wm+i1D3V0Bcj1+GlhqTat6+EY59KBPv9tMIkfXslEUMhTWY4TgkGGBy5wSv5JEuBTWrmhv7hQ
	Uaavg0tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw9j-0000000GsRN-2VJT;
	Sun, 27 Sep 2026 21:11:31 +0000
Received: from mail-qv2-f42.google.com ([74.125.230.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAw9g-0000000GsOt-1o3d
	for linux-mediatek@lists.infradead.org;
	Sun, 27 Sep 2026 21:11:29 +0000
Received: by mail-qv2-f42.google.com with SMTP id 6a1803df08f44-915ec8f411aso766476d6.0
        for <linux-mediatek@lists.infradead.org>; Sun, 27 Sep 2026 14:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790543487; x=1791148287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=44C50Q4Ln0VEE6bQOHS+qkeZ/WSlCaRUIPf2SffjR1M=;
        b=Y6jc4ftTj4ilzCNxsbHgKkIFw1LUpuIb+XC0QnJ0+zxkqeK+EFiPmTUbqs9w6v1Ka0
         uUmVJFIvNYrd4sMgDvBhJrxVRlQkD9tnNE8LJOJNZuP9fE0yKd0u8OYjlDXyoYbbv1In
         By/ylxeskAqci/MWPvc4Ji01QElu30la0LVw2tU10N3/HBPEtzuOb9V32VofzlrzTfp0
         fTeLQ1cxSxsfCHATy9EBuZaR5xBlgo8ahs76aYPRxvLh4JSV4xwse5J7TXQusKRQTCbw
         XfwvVftDgJyxZvnjGRwPjUta3La1ZQj53wBLiZLAXgwJMLrqp2BgRDXQVqzAd0P/I73/
         Ny2w==
X-Forwarded-Encrypted: i=1; AKwUvByWZfo9VQx8mq62ncPnVDwbAzWqOW51eimASkU6MzbtRX7bdZ+TiQku3VmLmsQm0UB4r+PBgPkEOLgy0wg+9g==@lists.infradead.org
X-Gm-Message-State: AFq9FYLEKKsu6ggI/bowFeNkFIE4IR0dnGU/T64NIVyhk1oC4Mn6mEJG
	AQ4HOORJ3ECgwJV2bt+kG0yXgG5Wj3Si4OM6ZceHCEuqBmy9/704paKxcoO05Zpn
X-Gm-Gg: AYBFou3eJgqFybZXxzBESoYDcYns8o0mw/gOV9g8BHvAIcPyaVbmMD4E25kMbqTwDxO
	wAuuWsKxUG6NHoi/+z1fcNAiYuTFW84Ej4kVzrl6N/+BlMZ5ICTitCqkJ73OYrviVHbKW9vGkmF
	mkfZkUGl1rWWG4KC3dsD9FTkPTcjf026H18R+ipmw2du/+qC00O3DWApZGMr2FMUvF4K3wrkLNh
	WFC7TMadKqX1joQf0H316B/lo/vP5+YLFYf7W0BAwubsJCO2sVMyVtZ4O8FlAhZ/M1oBS/RH9hq
	KXiPn+qDw12tVUotPPW7NtmgY1fNmS0SJ7YbQjOvskJN52ugi1zmOP6qnGomyySkl9lyB1iXevH
	ujNFPCa9ovWHfLzKSpMCaduTCwkh7lMXISRpCtbHthQWjmyBesBvE9F1CyCjAc9Dqt/QIReNZsN
	cRPkjspcFndzHM0Tr2MPcM0hAo4P03NObicPd2JdALaHyMmRxAglzcI9JO8a3z38S2jf/RxW4pK
	7c7U4od0g93Fm624zTbgoLiPgUWsfgC/u5P1kXrkXD8AO1S5C/yTHoGcYKTD0Q/eWNfsPc=
X-Received: by 2002:a05:690c:16:b0:8a2:496:1985 with SMTP id 00721157ae682-8a6486081f9mr47069207b3.54.1790543053313;
        Sun, 27 Sep 2026 14:04:13 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:5dd7:b9c7:1078:5394])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a86103149dsm35389017b3.40.2026.09.27.14.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:04:12 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Jacobs Wu <jacobs.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 16/23] wifi: mt76: mt7925: double the retry budget for NAN unicast management
Date: Sun, 27 Sep 2026 16:02:58 -0500
Message-ID: <20260927210306.737669-17-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927210306.737669-1-sean.wang@kernel.org>
References: <20260927210306.737669-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_141128_851270_5640A292 
X-CRM114-Status: GOOD (  11.07  )
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

The NAN setup handshakes are one-shot at the host: wpa_supplicant aborts
PASN on the first unacknowledged authentication frame and completes the
NDP state machine without retransmitting an unacknowledged key-install.
Right after the data path confirm both peers transmit at each other
nearly simultaneously, and with half-duplex radios one 15-retry burst
regularly dies inside the peer's own TX window (measured ~50% loss of
the key-install on an MT7925 pair, killing the NDP setup).

Double the TXD retry budget to the field maximum for NAN unicast
management so the burst outlives the cross-fire window.

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 101f571b027f..f19d0451f373 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -806,6 +806,19 @@ mt7925_mac_write_txwi(struct mt76_dev *dev, __le32 *txwi,
 
 	val = FIELD_PREP(MT_TXD3_REM_TX_COUNT, 15);
 
+	/* NAN setup handshakes are one-shot at the host: a single lost burst
+	 * kills the NDP (peers transmit at each other nearly simultaneously
+	 * after M3 and half-duplex radios miss the reply). Double the retry
+	 * budget so the burst outlives the cross-fire window.
+	 */
+	if (vif && vif->type == NL80211_IFTYPE_NAN) {
+		struct ieee80211_hdr *nan_hdr = (struct ieee80211_hdr *)skb->data;
+
+		if (ieee80211_is_mgmt(nan_hdr->frame_control) &&
+		    !is_multicast_ether_addr(nan_hdr->addr1))
+			val = FIELD_PREP(MT_TXD3_REM_TX_COUNT, 31);
+	}
+
 	if (key)
 		val |= MT_TXD3_PROTECT_FRAME;
 	if (info->flags & IEEE80211_TX_CTL_NO_ACK)
-- 
2.43.0


