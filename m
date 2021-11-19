Return-Path: <SRS0=YoiY=QG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CE5C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 06:37:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5438261A79
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 06:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5438261A79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z3PG/fPE1bLjxhuvSMtLh8sBZZctZDNW7koTmzkL3ic=; b=DjU0kSu8ofrgkB
	Mn0xJ05wHmN2BKnAthLl0EQ4M76RyDivGHgbSl38PxCnmeGU+JK1fyAqQKqvYP+P4MelVT5VPLdJQ
	DSc1ocRx2LC8OdUBRyHT7/hZSXb07ldBsWTM1ZHgqxtThnRWtUbTxQF8817hYSiRE8CwmgrHdGm0+
	x0S4xID/b+uMKfsQFOgmk/wKpzSTF7lRnh6HMd3Bjzvm92toHUtApMe1KBZV4/fnMy3DqBHJKNRq4
	5AJ7ajTiT+Wt3SI0GxtIfCbV9w0H8H7732YcO+C2v4MMtrOD0ykAwyBqtlbuqBNpbjUjdc9dozUgU
	orduV+gxl3/7hUiyKolw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnxWW-009YNX-4J; Fri, 19 Nov 2021 06:37:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnxWR-009YNA-76
 for linux-mediatek@lists.infradead.org; Fri, 19 Nov 2021 06:37:20 +0000
X-UUID: 6390876865c4486fa3d8b9512b62f00c-20211118
X-UUID: 6390876865c4486fa3d8b9512b62f00c-20211118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xing.song@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2097958362; Thu, 18 Nov 2021 23:37:12 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Nov 2021 22:37:10 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 19 Nov 2021 14:37:08 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 19 Nov 2021 14:37:08 +0800
From: Xing Song <xing.song@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
 <evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Xing Song <xing.song@mediatek.com>
Subject: [PATCH v4] mt76: do not pass the received frame with decryption error
Date: Fri, 19 Nov 2021 14:37:06 +0800
Message-ID: <20211119063706.17643-1-xing.song@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_223719_293909_E1DFA7BB 
X-CRM114-Status: GOOD (  14.19  )
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
---
v2: check for cipher mismatch or frame format error
v3: remove the always false case (hdr_trans && MT_RXD*_NORMAL_CLM)
    report the 802.11 frame with decryption error to monitor interface
v4: fix the commit as below, sorry about that
    "IEEE80211_FCTL_PROTECTED is (0) and cipher suit is (not) none"
---
 drivers/net/wireless/mediatek/mt76/mt7603/mac.c | 4 ++++
 drivers/net/wireless/mediatek/mt76/mt7615/mac.c | 9 ++++++++-
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 9 ++++++++-
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 9 ++++++++-
 4 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mac.c b/drivers/net/wireless/mediatek/mt76/mt7603/mac.c
index fe03e31989bb..a9ac61b9f854 100644
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
index 423f69015e3e..c79abce543f3 100644
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
index 5fcf35f2d9fb..78a3cd3938b2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -426,9 +426,16 @@ mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
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
index db3302b1576a..27550385c35f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -428,10 +428,17 @@ mt7921_mac_fill_rx(struct mt7921_dev *dev, struct sk_buff *skb)
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
2.17.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
