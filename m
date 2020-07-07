Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E12C433E1
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 20:36:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4020206F6
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 20:36:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HQRbd49d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WIgQxkVr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4020206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x26+YyefFPSaVG3c5S7VKGOL5bGUIdu1Yh4+bq9ZuFU=; b=HQRbd49dsuOfqcj9uU+dk/qxZd
	1VmqxNz5bVZ4BGVEjQ6C7GCmMTTgB4CnhDJyLdao0N2O2Is2QpaF9Zv42YmDZPvZODKERdX1rJEsn
	fwk174nuGQU5Hq4jhaNH4tFGItwdHToGUrwvMWXQIB7fc/TC4Vkt5UHZJeifwy3Lz3QMoKTtowDoy
	SWG2Y2BefDL/FHA4/sh41DtVQFg6MdzZLlsPT0W6pMiASw/70K77kjrkKLqMjpOKtT9iL6vj2AJsh
	oXAXtMlqDw7+mtgSELVSte9q3BPcj+pd53/zVJKjwSq8WMsfyLw28gHA38Kj+6FZyl0uaUf5Ii3b9
	eTD/Pe4g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsuKa-0002JM-FG; Tue, 07 Jul 2020 20:36:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsuKV-0002IH-Nj; Tue, 07 Jul 2020 20:36:40 +0000
Received: from embeddedor (unknown [200.39.26.250])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DDF31206BE;
 Tue,  7 Jul 2020 20:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594154198;
 bh=5H4ltLodQ0WkuEGu1+NXwO1PtPZgpH8HLPOjUyb6+aE=;
 h=Date:From:To:Cc:Subject:From;
 b=WIgQxkVraNpu1LcTQO1M0jASYbLsIfb4p2O62tj3aTen8hXuZspf/GVUrOGkKElng
 JCyaRNEC8HiX9PMuahWwx8oBcR7oYpwBZqHUQvMM4O38PE9/V9r81FW09bfgCOjza+
 cptc6dZRutkrOae8Y4akEnhenHcJMYlm9rCMJCAk=
Date: Tue, 7 Jul 2020 15:42:03 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] mt76: Use fallthrough pseudo-keyword
Message-ID: <20200707204203.GA9149@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_163639_912596_538C4E57 
X-CRM114-Status: GOOD (  11.33  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
fall-through markings when it is the case.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7603/dma.c  |    2 +-
 drivers/net/wireless/mediatek/mt76/mt7603/mac.c  |    4 ++--
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c  |    6 +++---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c  |    2 +-
 drivers/net/wireless/mediatek/mt76/mt76x0/phy.c  |    2 +-
 drivers/net/wireless/mediatek/mt76/mt76x02_mac.c |    6 +++---
 drivers/net/wireless/mediatek/mt76/mt7915/dma.c  |    2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c  |    4 ++--
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c  |    2 +-
 drivers/net/wireless/mediatek/mt76/usb.c         |    2 +-
 10 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/dma.c b/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
index a08b85281170..1dfcd7407535 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
@@ -123,7 +123,7 @@ void mt7603_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 			mt76_rx(&dev->mt76, q, skb);
 			return;
 		}
-		/* fall through */
+		fallthrough;
 	default:
 		dev_kfree_skb(skb);
 		break;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index 8060c1514396..95602cbef3c3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
@@ -592,7 +592,7 @@ mt7603_mac_fill_rx(struct mt7603_dev *dev, struct sk_buff *skb)
 		switch (FIELD_GET(MT_RXV1_TX_MODE, rxdg0)) {
 		case MT_PHY_TYPE_CCK:
 			cck = true;
-			/* fall through */
+			fallthrough;
 		case MT_PHY_TYPE_OFDM:
 			i = mt76_get_rate(&dev->mt76, sband, i, cck);
 			break;
@@ -1161,7 +1161,7 @@ mt7603_fill_txs(struct mt7603_dev *dev, struct mt7603_sta *sta,
 	switch (FIELD_GET(MT_TX_RATE_MODE, final_rate)) {
 	case MT_PHY_TYPE_CCK:
 		cck = true;
-		/* fall through */
+		fallthrough;
 	case MT_PHY_TYPE_OFDM:
 		if (dev->mphy.chandef.chan->band == NL80211_BAND_5GHZ)
 			sband = &dev->mphy.sband_5g.sband;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 9f1c6ca7a665..d3e4cfabca99 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -344,7 +344,7 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 		switch (FIELD_GET(MT_RXV1_TX_MODE, rxdg0)) {
 		case MT_PHY_TYPE_CCK:
 			cck = true;
-			/* fall through */
+			fallthrough;
 		case MT_PHY_TYPE_OFDM:
 			i = mt76_get_rate(&dev->mt76, sband, i, cck);
 			break;
@@ -1212,7 +1212,7 @@ static bool mt7615_fill_txs(struct mt7615_dev *dev, struct mt7615_sta *sta,
 	switch (FIELD_GET(MT_TX_RATE_MODE, final_rate)) {
 	case MT_PHY_TYPE_CCK:
 		cck = true;
-		/* fall through */
+		fallthrough;
 	case MT_PHY_TYPE_OFDM:
 		mphy = &dev->mphy;
 		if (sta->wcid.ext_phy && dev->mt76.phy2)
@@ -1413,7 +1413,7 @@ void mt7615_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 			mt76_rx(&dev->mt76, q, skb);
 			return;
 		}
-		/* fall through */
+		fallthrough;
 	default:
 		dev_kfree_skb(skb);
 		break;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 6e869b8c5e26..469ba150fea1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -3125,7 +3125,7 @@ static int mt7615_dcoc_freq_idx(u16 freq, u8 bw)
 			freq = freq_bw40[idx];
 			break;
 		}
-		/* fall through */
+		fallthrough;
 	case NL80211_CHAN_WIDTH_40:
 		idx = mt7615_find_freq_idx(freq_bw40, ARRAY_SIZE(freq_bw40),
 					   freq);
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c b/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
index 09f34deb6ba1..3de33aadf794 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x0/phy.c
@@ -734,7 +734,7 @@ mt76x0_phy_get_delta_power(struct mt76x02_dev *dev, u8 tx_mode,
 	case 1:
 		if (chan->band == NL80211_BAND_2GHZ)
 			tssi_target += 29491; /* 3.6 * 8192 */
-		/* fall through */
+		fallthrough;
 	case 0:
 		break;
 	default:
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_mac.c b/drivers/net/wireless/mediatek/mt76/mt76x02_mac.c
index e4e03beabe43..11900bcc1be0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_mac.c
@@ -300,7 +300,7 @@ mt76x02_mac_process_tx_rate(struct ieee80211_tx_rate *txrate, u16 rate,
 		return 0;
 	case MT_PHY_TYPE_HT_GF:
 		txrate->flags |= IEEE80211_TX_RC_GREEN_FIELD;
-		/* fall through */
+		fallthrough;
 	case MT_PHY_TYPE_HT:
 		txrate->flags |= IEEE80211_TX_RC_MCS;
 		txrate->idx = idx;
@@ -462,7 +462,7 @@ mt76x02_tx_rate_fallback(struct ieee80211_tx_rate *rates, int idx, int phy)
 			rates[1].idx = 0;
 			break;
 		}
-		/* fall through */
+		fallthrough;
 	default:
 		rates[1].idx = max_t(int, rates[0].idx - 1, 0);
 		break;
@@ -677,7 +677,7 @@ mt76x02_mac_process_rate(struct mt76x02_dev *dev,
 		return 0;
 	case MT_PHY_TYPE_HT_GF:
 		status->enc_flags |= RX_ENC_FLAG_HT_GF;
-		/* fall through */
+		fallthrough;
 	case MT_PHY_TYPE_HT:
 		status->encoding = RX_ENC_HT;
 		status->rate_idx = idx;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
index 766185d1aa21..6f7fcd12aff5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/dma.c
@@ -72,7 +72,7 @@ void mt7915_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
 			mt76_rx(&dev->mt76, q, skb);
 			return;
 		}
-		/* fall through */
+		fallthrough;
 	default:
 		dev_kfree_skb(skb);
 		break;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index a264e304a3df..91a7b8870795 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -471,7 +471,7 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 			switch (rxv.phy) {
 			case MT_PHY_TYPE_CCK:
 				cck = true;
-				/* fall through */
+				fallthrough;
 			case MT_PHY_TYPE_OFDM:
 				i = mt76_get_rate(&dev->mt76, sband, i, cck);
 				break;
@@ -490,7 +490,7 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 				break;
 			case MT_PHY_TYPE_HE_MU:
 				status->flag |= RX_FLAG_RADIOTAP_HE_MU;
-				/* fall through */
+				fallthrough;
 			case MT_PHY_TYPE_HE_SU:
 			case MT_PHY_TYPE_HE_EXT_SU:
 			case MT_PHY_TYPE_HE_TB:
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index c8c12c740c1a..3fb6c33de88e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -1385,7 +1385,7 @@ mt7915_mcu_sta_he_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 
 		he->max_nss_mcs[CMD_HE_MCS_BW160] =
 				he_cap->he_mcs_nss_supp.rx_mcs_160;
-		/* fall through */
+		fallthrough;
 	default:
 		he->max_nss_mcs[CMD_HE_MCS_BW80] =
 				he_cap->he_mcs_nss_supp.rx_mcs_80;
diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index fb97ea25b4d4..bd893fa0ce32 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -616,7 +616,7 @@ static void mt76u_complete_rx(struct urb *urb)
 	default:
 		dev_err_ratelimited(dev->dev, "rx urb failed: %d\n",
 				    urb->status);
-		/* fall through */
+		fallthrough;
 	case 0:
 		break;
 	}


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
