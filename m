Return-Path: <SRS0=Y4ok=73=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE17C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2020 18:33:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38D3020739
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Jun 2020 18:33:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mYUQ3Zdh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WBeVHsAh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38D3020739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wz34+PKldW77/f2OWMf8j4YJcx1im2pqJCylYs07TeI=; b=mYUQ3ZdhwQF3d6
	4REVlI7Ff79Us6DukadCscVRNyxjfxmsN1YDqZtQJdNxKUYJg5VTvhR95oGKRVJ/t3J2yXls8kShS
	opukq395ys0XxWmXJ4aLxuPQPJDxMxGeFtK820dRzwulNiOSAkCzdlhoaYD7wSLHvo/AL9GcAECdy
	YkdIO2J7BnPtOSqZrBNprI6knx/W66ph1aqi6SPtYHQ24PecioIKz7o94/5aT4KuS/SUDFk0Eyl1D
	jqjNOxkwJgam96lYmGeuT6q7Id7qYoB17HbPWNFW7rINpluOxoRX+SW/1vQjIOnGzEAqIc9EEje49
	ZDDyfMy1ixfjM8cWPaXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkXRy-0002JZ-Fs; Sun, 14 Jun 2020 18:33:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkXRu-0002H3-U7
 for linux-mediatek@lists.infradead.org; Sun, 14 Jun 2020 18:33:44 +0000
X-UUID: cc0bd5379ef44dcbaa56f0628fe521aa-20200614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=yiDwoODRApKiS8BqfOswBdXGWjMSyDFQ2o559D7NaM0=; 
 b=WBeVHsAhOTvopMkadQDB87BFcWMRqTZlH2Skpd9KFHNDkUuktUwT9WoN2XUuvzKm79F0CBNtlsZr8O/RLQYdCVBJB2s0QjVdhn9rug1Tt64dxd+Y03i168KK8eS90b16XsvZc4n+0IGhmXrA7ml7jp7O42NWdUQWV+fdRmcY51g=;
X-UUID: cc0bd5379ef44dcbaa56f0628fe521aa-20200614
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1634401073; Sun, 14 Jun 2020 10:33:23 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 14 Jun 2020 11:23:50 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 02:23:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 15 Jun 2020 02:23:35 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v3 2/4] mt76: mt7915: add a fixed AC queue mapping
Date: Mon, 15 Jun 2020 02:23:34 +0800
Message-ID: <1739c8bf33c5e36d3fd08d37e16a7107302e092a.1592158312.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1592158312.git.ryder.lee@mediatek.com>
References: <cover.1592158312.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D9C8C47F77C2515087A0B61BA0FAE53B0150ED464838AA2A86598C3F3BCB6C982000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200614_113342_977911_A60FE8FA 
X-CRM114-Status: GOOD (  10.17  )
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
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In MT7915, hardware queue map is flexible. However, certain firmware modules
like MU and U-APSD presume a fixed queue order to adapt some devices that have
DMA scheduler with a strict order, so this patch can help in the long run.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7915/mac.h   | 10 --------
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  3 +++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    | 25 +++++++++++++++++++
 4 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index a264e304a3df..660e1820cccf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -593,7 +593,7 @@ void mt7915_mac_write_txwi(struct mt7915_dev *dev, __le32 *txwi,
 
 	if (ieee80211_is_data(fc) || ieee80211_is_bufferable_mmpdu(fc)) {
 		q_idx = wmm_idx * MT7915_MAX_WMM_SETS +
-			skb_get_queue_mapping(skb);
+			mt7915_lmac_mapping(dev, skb_get_queue_mapping(skb));
 		p_fmt = MT_TX_TYPE_CT;
 	} else if (beacon) {
 		q_idx = MT_LMAC_BCN0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
index b9bc8b25b031..4b0871ab2414 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.h
@@ -149,16 +149,6 @@ enum tx_pkt_type {
 	MT_TX_TYPE_FW,
 };
 
-enum tx_pkt_queue_idx {
-	MT_LMAC_AC00,
-	MT_LMAC_AC01,
-	MT_LMAC_AC02,
-	MT_LMAC_AC03,
-	MT_LMAC_ALTX0 = 0x10,
-	MT_LMAC_BMC0 = 0x10,
-	MT_LMAC_BCN0 = 0x12,
-};
-
 enum tx_port_idx {
 	MT_TX_PORT_IDX_LMAC,
 	MT_TX_PORT_IDX_MCU
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 05b5650c56c8..e09899748c9b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -350,9 +350,12 @@ static int
 mt7915_conf_tx(struct ieee80211_hw *hw, struct ieee80211_vif *vif, u16 queue,
 	       const struct ieee80211_tx_queue_params *params)
 {
+	struct mt7915_dev *dev = mt7915_hw_dev(hw);
 	struct mt7915_vif *mvif = (struct mt7915_vif *)vif->drv_priv;
 
 	/* no need to update right away, we'll get BSS_CHANGED_QOS */
+	queue = mt7915_lmac_mapping(dev, queue);
+
 	mvif->wmm[queue].cw_min = params->cw_min;
 	mvif->wmm[queue].cw_max = params->cw_max;
 	mvif->wmm[queue].aifs = params->aifs;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 85d74ecd0351..b3b00d099236 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -199,6 +199,16 @@ enum {
 	EXT_BSSID_END
 };
 
+enum {
+	MT_LMAC_AC00,
+	MT_LMAC_AC01,
+	MT_LMAC_AC02,
+	MT_LMAC_AC03,
+	MT_LMAC_ALTX0 = 0x10,
+	MT_LMAC_BMC0,
+	MT_LMAC_BCN0,
+};
+
 enum {
 	MT_RX_SEL0,
 	MT_RX_SEL1,
@@ -254,6 +264,21 @@ mt7915_ext_phy(struct mt7915_dev *dev)
 	return phy->priv;
 }
 
+static inline u8 mt7915_lmac_mapping(struct mt7915_dev *dev, u8 ac)
+{
+	static const u8 lmac_queue_map[] = {
+		[IEEE80211_AC_BK] = MT_LMAC_AC00,
+		[IEEE80211_AC_BE] = MT_LMAC_AC01,
+		[IEEE80211_AC_VI] = MT_LMAC_AC02,
+		[IEEE80211_AC_VO] = MT_LMAC_AC03,
+	};
+
+	if (WARN_ON_ONCE(ac >= ARRAY_SIZE(lmac_queue_map)))
+		return MT_LMAC_AC01; /* BE */
+
+	return lmac_queue_map[ac];
+}
+
 static inline void
 mt7915_set_aggr_state(struct mt7915_sta *msta, u8 tid,
 		      enum mt7915_ampdu_state state)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
