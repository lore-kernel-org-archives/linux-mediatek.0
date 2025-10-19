Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E4BCCD184
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Oct 2025 16:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x6WS4gSSC3cojCRavBWi/OUmPz/su/Y/sBe19ZDjBWE=; b=NVNWTlgyGesPUwDin8zUv3m8kP
	KbVY6o160zgMspxr4NUtuFgvCk7PNj2KrbJxhS1sLD+z950dexha67MTHp/3AHhh2/cTkygvI2x2d
	sNMd+PYUd+uHpUI9eiisuoSSmBXdrTdUQ5PXQJRn6hjUvzFn5eLiMAoLnH6sQM7XnC1BnsQ92Pez2
	A1QVyIP9lQnWGXQK/n6Zly0bz0cI5K2ee42JwUoOjO/lvrf/xAilQqBV0qq+mON0A/L5YocqG8jaj
	LBdy0nzC4jfT6wbO14wr6zOEHRmSoMZLb5m404J33I+YuLm7ynLuQ/0enEextGWZplGTbaR1Hzqtw
	T/V6tAMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAW8j-0000000BBzE-3Vob;
	Sun, 19 Oct 2025 16:20:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAW8j-0000000BBz0-0zs6
	for linux-mediatek@bombadil.infradead.org;
	Sun, 19 Oct 2025 16:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=x6WS4gSSC3cojCRavBWi/OUmPz/su/Y/sBe19ZDjBWE=; b=A6lnhI2qat4pKWrFuGPeZSYgLE
	5prBQ3FROr5v5Ee3uW51/lysTxWmqfbXSXoBgU0LC5dqyU8JqOLjebRlUbbSa8ArifHmKdnFPRvyJ
	u6niQn+QBK/hUzZU4dMqfIjuEsy7JHDQzcy3Lap8NfveD8Wnr7PbUnFlLtgSNCI8Bq3KPYs7oQ9lz
	pobhhqTiIa/4TaDPyUaXv1M8LVl6N9XqyaYC3dqpkJRWosMLLOdtVPGQLXEjVS797sevRG5Fdr5x6
	t76o3Z/uNNPzCYKwXivdFuvIeOXuITcz6j39o1ZNLT2LOo7WcOPvEqQbKdaMhr2EIemF3pLB0AQl8
	lNS9zKmQ==;
Received: from mx4.wp.pl ([212.77.101.11])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAW8f-000000099fJ-08Es
	for linux-mediatek@lists.infradead.org;
	Sun, 19 Oct 2025 16:20:11 +0000
Received: (wp-smtpd smtp.wp.pl 3996 invoked from network); 19 Oct 2025 17:53:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1760889200; bh=x6WS4gSSC3cojCRavBWi/OUmPz/su/Y/sBe19ZDjBWE=;
          h=From:To:Subject;
          b=yupk4sHBX13usKKR0MDf4qQStF4MPIXIO+VA7RorDCUj06lUA/TBVTYQJGIJZuuCo
           e0Vb1SYDh7LjFfbS+bndEFkJnY29BlqgkZB7IdEd81B4VGeuOrBq/yehGpmIETXAu5
           QQ+LKnfdgeG4SFZzS9oZH9qgrX3Deia3rbjOq3I9qXom4/yhNsCmfave45ojIJhZ3+
           gg9DonnA4F/7XBoYqKMuGP8hZ30NswO4LhZDSm5xeeZeD7xr8Qu4lAOxKh/R9iAJmd
           xl8vGZA6jui6tZQrf9pk0p0DXUkvjxB7QW4iyyZtjXDingwE11gM75dq+ntA+W63KN
           28h6eOIJGhzEg==
Received: from 83.24.149.147.ipv4.supernova.orange.pl (HELO laptop-olek.home) (olek2@wp.pl@[83.24.149.147])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <nbd@nbd.name>; 19 Oct 2025 17:53:20 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	howard-yh.hsu@mediatek.com,
	StanleyYP.Wang@mediatek.com,
	rosenp@gmail.com,
	luoxueqin@kylinos.cn,
	chad@monroe.io,
	olek2@wp.pl,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: add tx checksum offload for mt7915, mt7921, mt7981 and mt7986
Date: Sun, 19 Oct 2025 17:51:55 +0200
Message-ID: <20251019155316.3537185-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: 20b9a344b7368db3f41473995158abfd
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [UcNU]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_172009_383139_1E07E00B 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

Supports IPv4 and IPv6 TCP + UDP

In various tests between MT7986 and Intel BE200, I observed a performance
boost ranging from 2 to 12%, with an average of 5.5%.

I did the tests on the MT7915, MT7981, MT7986, and MT7921 variants. The
MT7922, MT7925, and MT799x are untouched for now and still have
checksumming disabled.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
[rebased and resolved conflicts]
Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt7915/init.c     | 3 ++-
 drivers/net/wireless/mediatek/mt76/mt792x_core.c     | 3 +++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
index 0db00efe88b0..e31b3e7e2038 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c
@@ -372,6 +372,9 @@ mt76_connac2_mac_write_txwi_8023(__le32 *txwi, struct sk_buff *skb,
 		wmm = sta->wme;
 	}
 
+	val = FIELD_PREP(MT_TXD0_ETH_TYPE_OFFSET, 10);
+	txwi[0] |= cpu_to_le32(val);
+
 	val = FIELD_PREP(MT_TXD1_HDR_FORMAT, MT_HDR_FORMAT_802_3) |
 	      FIELD_PREP(MT_TXD1_TID, tid);
 
@@ -391,6 +394,8 @@ mt76_connac2_mac_write_txwi_8023(__le32 *txwi, struct sk_buff *skb,
 
 	val = FIELD_PREP(MT_TXD7_TYPE, fc_type) |
 	      FIELD_PREP(MT_TXD7_SUB_TYPE, fc_stype);
+	if (skb->ip_summed == CHECKSUM_PARTIAL)
+		val |= MT_TXD7_IP_SUM | MT_TXD7_UDP_TCP_SUM;
 
 	txwi[7] |= cpu_to_le32(val);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 5ea8b46e092e..a3bab240afb7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -359,7 +359,8 @@ mt7915_init_wiphy(struct mt7915_phy *phy)
 	hw->queues = 4;
 	hw->max_rx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF_HE;
 	hw->max_tx_aggregation_subframes = IEEE80211_MAX_AMPDU_BUF_HE;
-	hw->netdev_features = NETIF_F_RXCSUM;
+	hw->netdev_features = NETIF_F_RXCSUM |
+			      NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;
 
 	if (mtk_wed_device_active(&mdev->mmio.wed))
 		hw->netdev_features |= NETIF_F_HW_TC;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index c0e56541a954..fe138d2e8e62 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -632,6 +632,9 @@ int mt792x_init_wiphy(struct ieee80211_hw *hw)
 	}
 	hw->netdev_features = NETIF_F_RXCSUM;
 
+	if (is_mt7921(&dev->mt76))
+		NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;
+
 	hw->radiotap_timestamp.units_pos =
 		IEEE80211_RADIOTAP_TIMESTAMP_UNIT_US;
 
-- 
2.47.3


