Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FB2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 03:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d7f47vnRaIddSHeaG+dDIAwI2n7uIv8xohAC4GNQ+Sw=; b=JM+YqtngfjLlnj
	UwlXBPq0SuDjiQPtijKDO4AQpNCoB/RqkWZaFeD4Dm++6DuC4EyvF0MtFClqvPIhGO2pSMZcWGxIZ
	ZUBN7oxD2yQMgqI4RocZe6J0mj6hN/Z1McfrZX0I6TZWt0Fnzc3LsTVH6GYHO6VhxwzxX8WaJfhYp
	8mTiA/k880/VZ4CJ49LPAr7IQ16bFMbuHmFbvYEb5FfFxaXxIiFhXT6pRid373wKJGYnaI81ApYDk
	Ed6/pgIgdtH//SGZeFljIHBpsiPTM791BxrjIBHum5TD2ya+gwrPo5WrazRSqT0wd58wNth1aZ4ja
	DQi1KgL5hAT0sdRgqKqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9emg-00HGzr-5A; Tue, 18 Jan 2022 03:03:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9eNr-00H1rc-FV; Tue, 18 Jan 2022 02:38:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2F264B81229;
 Tue, 18 Jan 2022 02:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3F0C36AE3;
 Tue, 18 Jan 2022 02:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642473484;
 bh=RrUyY9uG7ZVfU+KF3Jfwg3xQPcg+XRDfLecSIqdmf5w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MyY1Zca72zC+61swKTu+RyJM7pdzJva2os8UKkJKhW5dJIS9OeuhuiuCbHkBItDcq
 mXr5GzmlnO7b1wo2NsK23pDDkOg1SgdJPygWtOti4ERNTBBcV1nvBxC6U0j3FpN70a
 yEnhA3q3yrYVhYWdgpy0mzABb2fjaQMrzaxxOPJ8WSDBOWFKWWb/1CeZPHFXMtiUZ6
 4olls587tvEYIQdTXA0MCjNjuUPLbOZ+It7RFBFa86Yc+buB7taTshafv4TRbanIFI
 b6tnYeUo5/zpiF9/7CDqDWp+Sl2kKZKVsfpVfpGy80e2TvQdhR0bLRReOxQz2MOFwJ
 vrpDuDd0W38kA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xing Song <xing.song@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Sasha Levin <sashal@kernel.org>, lorenzo.bianconi83@gmail.com,
 ryder.lee@mediatek.com, kvalo@kernel.org, davem@davemloft.net,
 kuba@kernel.org, matthias.bgg@gmail.com, sean.wang@mediatek.com,
 shayne.chen@mediatek.com, greearb@candelatech.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 131/188] mt76: do not pass the received frame
 with decryption error
Date: Mon, 17 Jan 2022 21:30:55 -0500
Message-Id: <20220118023152.1948105-131-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118023152.1948105-1-sashal@kernel.org>
References: <20220118023152.1948105-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_183807_855892_B13E3E61 
X-CRM114-Status: GOOD (  15.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Xing Song <xing.song@mediatek.com>

[ Upstream commit dd28dea52ad9376d2b243a8981726646e1f60b1a ]

MAC80211 doesn't care any decryption error in 802.3 path, so received
frame will be dropped if HW tell us that the cipher configuration is not
matched as well as the header has been translated to 802.3. This case only
appears when IEEE80211_FCTL_PROTECTED is 0 and cipher suit is not none in
the corresponding HW entry.

The received frame is only reported to monitor interface if HW decryption
block tell us there is ICV error or CCMP/BIP/WPI MIC error. Note in this
case the reported frame is decrypted 802.11 frame and the payload may be
malformed due to mismatched key.

Signed-off-by: Xing Song <xing.song@mediatek.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7603/mac.c | 4 ++++
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 9 ++++++++-
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 9 ++++++++-
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 9 ++++++++-
 4 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index 3972c56136a20..65f1f2bb80835 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
@@ -525,6 +525,10 @@ mt7603_mac_fill_rx(struct mt7603_dev *dev, struct sk_buff *skb)
 	if (rxd2 & MT_RXD2_NORMAL_TKIP_MIC_ERR)
 		status->flag |= RX_FLAG_MMIC_ERROR;
 
+	/* ICV error or CCMP/BIP/WPI MIC error */
+	if (rxd2 & MT_RXD2_NORMAL_ICV_ERR)
+		status->flag |= RX_FLAG_ONLY_MONITOR;
+
 	if (FIELD_GET(MT_RXD2_NORMAL_SEC_MODE, rxd2) != 0 &&
 	    !(rxd2 & (MT_RXD2_NORMAL_CLM | MT_RXD2_NORMAL_CM))) {
 		status->flag |= RX_FLAG_DECRYPTED;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 5455231f51881..f2704149834a0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -286,9 +286,16 @@ static int mt7615_mac_fill_rx(struct mt7615_dev *dev, struct sk_buff *skb)
 	if (rxd2 & MT_RXD2_NORMAL_AMSDU_ERR)
 		return -EINVAL;
 
+	hdr_trans = rxd1 & MT_RXD1_NORMAL_HDR_TRANS;
+	if (hdr_trans && (rxd2 & MT_RXD2_NORMAL_CM))
+		return -EINVAL;
+
+	/* ICV error or CCMP/BIP/WPI MIC error */
+	if (rxd2 & MT_RXD2_NORMAL_ICV_ERR)
+		status->flag |= RX_FLAG_ONLY_MONITOR;
+
 	unicast = (rxd1 & MT_RXD1_NORMAL_ADDR_TYPE) == MT_RXD1_NORMAL_U2M;
 	idx = FIELD_GET(MT_RXD2_NORMAL_WLAN_IDX, rxd2);
-	hdr_trans = rxd1 & MT_RXD1_NORMAL_HDR_TRANS;
 	status->wcid = mt7615_rx_get_wcid(dev, idx, unicast);
 
 	if (status->wcid) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index bbc996f86b5c3..ff613d7056119 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -349,9 +349,16 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 	if (rxd2 & MT_RXD2_NORMAL_AMSDU_ERR)
 		return -EINVAL;
 
+	hdr_trans = rxd2 & MT_RXD2_NORMAL_HDR_TRANS;
+	if (hdr_trans && (rxd1 & MT_RXD1_NORMAL_CM))
+		return -EINVAL;
+
+	/* ICV error or CCMP/BIP/WPI MIC error */
+	if (rxd1 & MT_RXD1_NORMAL_ICV_ERR)
+		status->flag |= RX_FLAG_ONLY_MONITOR;
+
 	unicast = FIELD_GET(MT_RXD3_NORMAL_ADDR_TYPE, rxd3) == MT_RXD3_NORMAL_U2M;
 	idx = FIELD_GET(MT_RXD1_NORMAL_WLAN_IDX, rxd1);
-	hdr_trans = rxd2 & MT_RXD2_NORMAL_HDR_TRANS;
 	status->wcid = mt7915_rx_get_wcid(dev, idx, unicast);
 
 	if (status->wcid) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 8a16f3f4d5253..04a288029c98e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -383,10 +383,17 @@ int mt7921_mac_fill_rx(struct mt7921_dev *dev, struct sk_buff *skb)
 	if (rxd2 & MT_RXD2_NORMAL_AMSDU_ERR)
 		return -EINVAL;
 
+	hdr_trans = rxd2 & MT_RXD2_NORMAL_HDR_TRANS;
+	if (hdr_trans && (rxd1 & MT_RXD1_NORMAL_CM))
+		return -EINVAL;
+
+	/* ICV error or CCMP/BIP/WPI MIC error */
+	if (rxd1 & MT_RXD1_NORMAL_ICV_ERR)
+		status->flag |= RX_FLAG_ONLY_MONITOR;
+
 	chfreq = FIELD_GET(MT_RXD3_NORMAL_CH_FREQ, rxd3);
 	unicast = FIELD_GET(MT_RXD3_NORMAL_ADDR_TYPE, rxd3) == MT_RXD3_NORMAL_U2M;
 	idx = FIELD_GET(MT_RXD1_NORMAL_WLAN_IDX, rxd1);
-	hdr_trans = rxd2 & MT_RXD2_NORMAL_HDR_TRANS;
 	status->wcid = mt7921_rx_get_wcid(dev, idx, unicast);
 
 	if (status->wcid) {
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
