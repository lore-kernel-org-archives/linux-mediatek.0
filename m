Return-Path: <SRS0=qrwZ=H5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C53C433E6
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Feb 2021 07:40:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E2B364EC4
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Feb 2021 07:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E2B364EC4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3PmmYSmbmYjUhpTX4RQJ+LVXwbKwgc5XsU+W8BS1zLY=; b=ox4QG8d1N20RE2AWWcFMUv6WDW
	+4mh4ru6VfwvA2AjwmkyvdxSTbKRIu+qMrEwa/7U2UvJkCfBA5nXgZcVy0rNrfTYfqUVcHHxZnV+S
	bBYRoJ4h5e/U1oBRJ3IhJYF2+83aqp0Mhtt55UJVdxQdT42sEc5JDiPQGImQhpmmrGRwTma1UP6JL
	ZmkaCy0tA5u+7pELyY7M7J0T6H0mGtxf7b4uYYw2blfbLK9H6z90A+KYk2c49gyem69EiGd9E+z5m
	W0G+HwnrlsnwknUcbgOY6RCTXA/UMW9YqrImQUhwAEAZ6DkrYVP8fgkHymEYVZNQQ73UPmkzVY73B
	EnKqjc9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFuDL-0007R1-Rf; Sat, 27 Feb 2021 07:40:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFuDH-0007Pl-5q
 for linux-mediatek@lists.infradead.org; Sat, 27 Feb 2021 07:40:33 +0000
X-UUID: 3162b7dd5d9e4419abfee3bce720ca89-20210226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=hWmoP6IlerTLRvieb6yD4dVlgLgy5Z8NhVeen9Q9ydA=; 
 b=pt95KE/b1W3r+H8qfiijRkkeKjfqMnbe4WgFwJB4b8loCPrX5ON4MpR+bf5/AhOnlY//xff1mISb4YWiAg7sKV1HruVxJHz5oOH1occCRh2mW6vLBgJ9laVnOqEsY3l5C5LDm8/kHFvVuQW/26gli1uZR8ge2dGPNwxm5Ndns8c=;
X-UUID: 3162b7dd5d9e4419abfee3bce720ca89-20210226
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 328309446; Fri, 26 Feb 2021 23:40:27 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Feb 2021 23:40:25 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 27 Feb 2021 15:40:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 27 Feb 2021 15:40:23 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 1/5] mt76: mt7615: fix CSA notification for DBDC
Date: Sat, 27 Feb 2021 15:39:42 +0800
Message-ID: <d6f2573790582538e8ba82f87a4c35329692ee32.1614411256.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: EA1C5E3E32218177D76903F4A34CD4015FFB7D72857672C39A62C94C6E93C04B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210227_024032_058564_E1B3BC4A 
X-CRM114-Status: GOOD (  10.11  )
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
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add CSA notification for second phy.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 24 +++++++++++++++----
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   | 11 ++++++++-
 2 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 65c6ab14fe6f..44daee41aa6c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -372,6 +372,22 @@ mt7615_mcu_csa_finish(void *priv, u8 *mac, struct ieee80211_vif *vif)
 		ieee80211_csa_finish(vif);
 }
 
+static void
+mt7615_mcu_rx_csa_notify(struct mt7615_dev *dev, struct sk_buff *skb)
+{
+	struct mt76_phy *mphy = &dev->mt76.phy;
+	struct mt7615_mcu_csa_notify *c;
+
+	c = (struct mt7615_mcu_csa_notify *)skb->data;
+
+	if (c->band_idx && dev->mt76.phy2)
+		mphy = dev->mt76.phy2;
+
+	ieee80211_iterate_active_interfaces_atomic(mphy->hw,
+			IEEE80211_IFACE_ITER_RESUME_ALL,
+			mt7615_mcu_csa_finish, mphy->hw);
+}
+
 static void
 mt7615_mcu_rx_radar_detected(struct mt7615_dev *dev, struct sk_buff *skb)
 {
@@ -380,7 +396,7 @@ mt7615_mcu_rx_radar_detected(struct mt7615_dev *dev, struct sk_buff *skb)
 
 	r = (struct mt7615_mcu_rdd_report *)skb->data;
 
-	if (r->idx && dev->mt76.phy2)
+	if (r->band_idx && dev->mt76.phy2)
 		mphy = dev->mt76.phy2;
 
 	ieee80211_radar_detected(mphy->hw);
@@ -419,9 +435,7 @@ mt7615_mcu_rx_ext_event(struct mt7615_dev *dev, struct sk_buff *skb)
 		mt7615_mcu_rx_radar_detected(dev, skb);
 		break;
 	case MCU_EXT_EVENT_CSA_NOTIFY:
-		ieee80211_iterate_active_interfaces_atomic(dev->mt76.hw,
-				IEEE80211_IFACE_ITER_RESUME_ALL,
-				mt7615_mcu_csa_finish, dev);
+		mt7615_mcu_rx_csa_notify(dev, skb);
 		break;
 	case MCU_EXT_EVENT_FW_LOG_2_HOST:
 		mt7615_mcu_rx_log_message(dev, skb);
@@ -2176,7 +2190,7 @@ int mt7615_mcu_set_chan_info(struct mt7615_phy *phy, int cmd)
 		.center_chan2 = ieee80211_frequency_to_channel(freq2),
 	};
 
-	if (dev->mt76.hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
+	if (phy->mt76->hw->conf.flags & IEEE80211_CONF_OFFCHANNEL)
 		req.switch_reason = CH_SWITCH_SCAN_BYPASS_DPD;
 	else if ((chandef->chan->flags & IEEE80211_CHAN_RADAR) &&
 		 chandef->chan->dfs_state != NL80211_DFS_AVAILABLE)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index 411ebb56baef..dbf72b1396c7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -176,10 +176,19 @@ struct mt7615_mcu_rxd {
 	u8 s2d_index;
 };
 
+struct mt7615_mcu_csa_notify {
+	struct mt7615_mcu_rxd rxd;
+
+	u8 omac_idx;
+	u8 csa_count;
+	u8 band_idx;
+	u8 rsv;
+} __packed;
+
 struct mt7615_mcu_rdd_report {
 	struct mt7615_mcu_rxd rxd;
 
-	u8 idx;
+	u8 band_idx;
 	u8 long_detected;
 	u8 constant_prf_detected;
 	u8 staggered_prf_detected;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
