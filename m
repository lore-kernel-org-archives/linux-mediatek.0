Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84734C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 04:39:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 310AF61CCA
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 04:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 310AF61CCA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xkUeOduMWzqVnRCUJ7tVFOVJvhjp3RW7fuxjTkUENyY=; b=4dGpN8jpBKBsiC
	z9hDplz8teiQNdkq0BvSUHY+h9KOsZOO82m2m3a7dzbMC4mWNOhcY61l4g+y9qbN8eT3fAyTbU/tW
	kFoG6Vx0GmtDHmVXoVJjBm2tbb/4YGJy7eLoSFuAlP+leZvtALRCpTrf5GaMkVvRpdBX9SYL0QS0y
	D7t2yFLe0Y2EiH6dkkAsaPdy9K3dLkKDlo09CJYMOpIuNiZyqgEKyVeIrROTNr+idX9UrYdCWLLTy
	ZFkLtZH8bPWnaFDaX33JqpRVry0F7eV+4KSDoNj8GiuyFXE2knCmwOTgr0toGQcnM1LaLkhXwWuzm
	CKxPfrLMX7gzXNOLPs8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1Lop-00G4Bc-6Y; Thu, 08 Jul 2021 04:39:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1Loj-00G4Ak-MW
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 04:39:20 +0000
X-UUID: c7275ed4e0184808ada7c5b197ebcbc3-20210707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=kxyz8hXgXS2jETOs69jcHbKCIjYZwuN9rSjWpxtbYTY=; 
 b=rnHovTrV8WS0qcIE0EJFirYL7T+SBtKYtVVaZSc+Uzl592ocTPurkb7Cv8NPAj37ZhieVaHuSaJPv67/tyqstTqs99+A9AoICNdaNFmOBhWXBCyAk64eQeFAaeu3yxrNsekhkjv5/gkvVAlE8mbneJwU5T68VDz+R416M3pPtfs=;
X-UUID: c7275ed4e0184808ada7c5b197ebcbc3-20210707
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 85702542; Wed, 07 Jul 2021 21:39:12 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 21:29:10 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Jul 2021 12:29:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 8 Jul 2021 12:29:08 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/2] mt76: mt7921: fix mgmt frame using unexpected bitrate
Date: Thu, 8 Jul 2021 12:29:05 +0800
Message-ID: <1625718546-14969-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_213919_078326_2C92EE9F 
X-CRM114-Status: GOOD (  15.90  )
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

From: Sean Wang <sean.wang@mediatek.com>

Fix the current driver mgmt frame is not respecting the basic rates field
provided by the AP and then unconditionally is using the lowest (1 or 6
Mbps) rate.

For example, if the AP only supported basic rate {24, 36, 48, 54} Mbps,
mt7921 cannot send mgmt frame with the rate not in the group. So,
instead, we pick up the lowest basic rate the AP can support to send.

The patch also fixed up the hw_value in ieee80211_rate for MT7921
hardware.

Fixes: 163f4d22c118 ("mt76: mt7921: add MAC support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/init.c  | 19 +++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7921/mac.c   | 21 +++++++++++++++----
 .../wireless/mediatek/mt76/mt7921/mt7921.h    | 14 +++++++++++++
 3 files changed, 48 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index a9ce10b98827..ee57f268c29c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -24,6 +24,21 @@ static const struct ieee80211_iface_combination if_comb[] = {
 	}
 };
 
+struct ieee80211_rate mt7921_rates[] = {
+	MT7921_CCK_RATE(0, 10),
+	MT7921_CCK_RATE(1, 20),
+	MT7921_CCK_RATE(2, 55),
+	MT7921_CCK_RATE(3, 110),
+	MT7921_OFDM_RATE(11, 60),
+	MT7921_OFDM_RATE(15, 90),
+	MT7921_OFDM_RATE(10, 120),
+	MT7921_OFDM_RATE(14, 180),
+	MT7921_OFDM_RATE(9,  240),
+	MT7921_OFDM_RATE(13, 360),
+	MT7921_OFDM_RATE(8,  480),
+	MT7921_OFDM_RATE(12, 540),
+};
+
 static void
 mt7921_regd_notifier(struct wiphy *wiphy,
 		     struct regulatory_request *request)
@@ -227,8 +242,8 @@ int mt7921_register_device(struct mt7921_dev *dev)
 	mt76_set_stream_caps(&dev->mphy, true);
 	mt7921_set_stream_he_caps(&dev->phy);
 
-	ret = mt76_register_device(&dev->mt76, true, mt76_rates,
-				   ARRAY_SIZE(mt76_rates));
+	ret = mt76_register_device(&dev->mt76, true, mt7921_rates,
+				   ARRAY_SIZE(mt7921_rates));
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 7fe2e3a50428..76985a6b3be5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -749,6 +749,22 @@ static void mt7921_update_txs(struct mt76_wcid *wcid, __le32 *txwi)
 			       FIELD_PREP(MT_TXD5_PID, pid));
 }
 
+static u16
+mt7921_default_basic_rates(struct mt7921_dev *dev, struct ieee80211_vif *vif)
+{
+	struct mt76_phy *mphy = &dev->mphy;
+	struct ieee80211_rate *rate;
+	int i, offset = 0;
+
+	if (mphy->chandef.chan->band == NL80211_BAND_5GHZ)
+		offset = 4;
+
+	i = ffs(vif->bss_conf.basic_rates) - 1;
+	rate = &mt7921_rates[offset + i];
+
+	return rate->hw_value;
+}
+
 void mt7921_mac_write_txwi(struct mt7921_dev *dev, __le32 *txwi,
 			   struct sk_buff *skb, struct mt76_wcid *wcid,
 			   struct ieee80211_key_conf *key, bool beacon)
@@ -815,10 +831,7 @@ void mt7921_mac_write_txwi(struct mt7921_dev *dev, __le32 *txwi,
 		/* hardware won't add HTC for mgmt/ctrl frame */
 		txwi[2] |= cpu_to_le32(MT_TXD2_HTC_VLD);
 
-		if (mphy->chandef.chan->band == NL80211_BAND_5GHZ)
-			rate = MT7921_5G_RATE_DEFAULT;
-		else
-			rate = MT7921_2G_RATE_DEFAULT;
+		rate = mt7921_default_basic_rates(dev, vif);
 
 		val = MT_TXD6_FIXED_BW |
 		      FIELD_PREP(MT_TXD6_TX_RATE, rate);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
index 2d8bd6bfc820..6ef69f5e8f42 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
@@ -45,6 +45,19 @@
 #define MT7921_SKU_MAX_DELTA_IDX	MT7921_SKU_RATE_NUM
 #define MT7921_SKU_TABLE_SIZE		(MT7921_SKU_RATE_NUM + 1)
 
+#define MT7921_CCK_RATE(_idx, _rate) {				\
+	.bitrate = _rate,					\
+	.flags = IEEE80211_RATE_SHORT_PREAMBLE,			\
+	.hw_value = (MT_PHY_TYPE_CCK << 6) | (_idx),		\
+	.hw_value_short = (MT_PHY_TYPE_CCK << 6) | (4 + _idx),	\
+}
+
+#define MT7921_OFDM_RATE(_idx, _rate) {				\
+	.bitrate = _rate,					\
+	.hw_value = (MT_PHY_TYPE_OFDM << 6) | (_idx),		\
+	.hw_value_short = (MT_PHY_TYPE_OFDM << 6) | (_idx),	\
+}
+
 #define to_rssi(field, rxv)		((FIELD_GET(field, rxv) - 220) / 2)
 #define to_rcpi(rssi)			(2 * (rssi) + 220)
 
@@ -241,6 +254,7 @@ static inline u8 mt7921_lmac_mapping(struct mt7921_dev *dev, u8 ac)
 
 extern const struct ieee80211_ops mt7921_ops;
 extern struct pci_driver mt7921_pci_driver;
+extern struct ieee80211_rate mt7921_rates[12];
 
 u32 mt7921_reg_map(struct mt7921_dev *dev, u32 addr);
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
