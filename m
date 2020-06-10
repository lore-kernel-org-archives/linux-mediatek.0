Return-Path: <SRS0=3/N7=7X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56BCC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 18:06:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8C0B206F4
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 18:06:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HKSa+vFo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TZoNec8U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8C0B206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GfUMPvOQUqlJ0G78EK/DsZCRmT8UuMQvVlzY8AhtCI4=; b=HKSa+vFolmd/Z4
	BR34nynOBA262bTHVZFWfH5Fzdd3BOh9Z34sKSLI/OpFRbTSNvVC/T7AgKYln9hLPcx/4JrqZaO5B
	IjVn9/rRIMIjh9D16HcMIrLyvudvLiAs7CLTgN1/fb2vKBTlNVHk17OVSbIDk+cL7lZwEo/pi7SX3
	A3n6unmAU2QbbldSgBWl/1RC/+cNWRiDPg1QlOLrFbsDDaMXS0/PAcEhVkPXhb3PSQK4Zo4snft0P
	SqyV1jwppNpDM4iTseChUktBuXoVcNwLNBSFo83MMnbc3iYF+BQmyzbRm6bZYXFm6GTCrjbgSylXN
	nzd/6Zg2cSjqiI4NJiwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jj576-0005QQ-C1; Wed, 10 Jun 2020 18:06:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jj574-0005Pp-5q
 for linux-mediatek@lists.infradead.org; Wed, 10 Jun 2020 18:06:11 +0000
X-UUID: 9c1140539a3c4e76bc37c27fa5453c2a-20200610
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=o0+AgrL3m36KnRD2w1Z2U2NCS3XCI/jOOzPoe2G9JL4=; 
 b=TZoNec8UL32ix2T2o0a/FryMs4f4uC0LkrggjejPyUpsekqwYWzTWK1B0o0IF62UGlij4u5Q5js+ZNtaYRd7CaCrefa0F+n/miEfcgp2tgMe9JEFf1mz7qjSza0E1mymrGo82apy6rxeCQXbRlNrjkdMHHg2Bb055KMh1+G6KKE=;
X-UUID: 9c1140539a3c4e76bc37c27fa5453c2a-20200610
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1624247908; Wed, 10 Jun 2020 10:06:03 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Jun 2020 10:56:02 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Jun 2020 01:55:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 11 Jun 2020 01:55:50 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 1/2] mt76: mt7915: add a fixed QoS queue mapping
Date: Thu, 11 Jun 2020 01:55:50 +0800
Message-ID: <8464fdd2191d8d77e51441474e5c99e18b64185b.1591809100.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 89DE9F1DBD27ECA5AB09A68BD58023C14A0A6DCD88EDDA4DFD0295AD2D8A7DDF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_110610_219229_C2482D19 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   |  2 +-
 .../net/wireless/mediatek/mt76/mt7915/mac.h   | 10 --------
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  3 +++
 .../wireless/mediatek/mt76/mt7915/mt7915.h    | 25 +++++++++++++++++++
 4 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index ab20dfde94af..63a23a332303 100644
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
index 0575c259f245..e105531ef065 100644
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
index 85d74ecd0351..64ea1e0a1fb0 100644
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
+	MT_LMAC_BMC0 = 0x10,
+	MT_LMAC_BCN0 = 0x12,
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
