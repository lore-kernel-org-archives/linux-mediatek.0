Return-Path: <SRS0=zzne=KF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47F58C43617
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 15:15:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA4236023E
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 15:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA4236023E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aATwLx2D3LdCotp7SZKxv030s6Uct8aPfWa6EvVnGRE=; b=caKFVAyPrT4H/XjywokZT2jo/
	Yse5/b9Ww9pDSKnZ71nagKV22lKtM6/yQQCXUnoH7+Glrh2l3oJuUwHO8Ln3LcPKQ0+Eo676I08pQ
	nA5mTbD4houb+YCZ/Zha8VLkbleA0ggcflFMte3ty4RUPHrphx+NwmJMFL9l8CoriyHWFH4POgAqN
	BCHE3AvRSq23CS4DA4lPugBgkwk+aCik1j+O5Xys8l15bPrHePH+MSQFs2Oob1m2FJLukZkjkkG5l
	HK2ZkQ6C0lt9zGtaa6n5YTBlveyO/LxAJxW9LXlhmK0D8MZqE9Nt+/jSvatXWJwxvxi9LM03XDhA0
	706gOJPvA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg7cr-00ElOT-NG; Mon, 10 May 2021 15:15:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7ck-00ElLz-Ui
 for linux-mediatek@desiato.infradead.org; Mon, 10 May 2021 15:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=CdlSP5sar+14tPyIMdY4cTvE+b2/79Yvzw9H8+869v4=; b=IfbPk1r6MCP7Ciy45QRVJpSidb
 DAGEBA+ij5DFrh9g2kOu0FkoQuTKbvwjl/KHvETDAHrB+yoZphrDbWldiHSwx+a7BdJwRlFqLkk0X
 07nGRKkZTs0mWlPlBGcxCZbx1J2PmostPkuAdHPV9RaFHn3ZZEMCAWHy1m93/r/5Ye2VdgcQ08CFZ
 E3qlWbbrk0ykPgGJLswT1bGHIdvjE1YDmJ6Lul9rQf2LYI2QgN1RF4Jhfe9ZVISI3n9iptf34BgRZ
 r+HYIb/eM6SivzSQxXFPYbjxj5LaSQDS+0ssruxc8TUUfMGwy8JYSg7P3Snx907mQMFJa2ZHs1n3Z
 zMKceeAw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg7ci-008rIR-76
 for linux-mediatek@lists.infradead.org; Mon, 10 May 2021 15:15:09 +0000
X-UUID: dde54503fd4c47deb69540d53c8006bf-20210510
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=CdlSP5sar+14tPyIMdY4cTvE+b2/79Yvzw9H8+869v4=; 
 b=GCjDh4ToYAxE2gTN39uH9t1/H9aSuWIeRtcXFJi2e+YBMCMrIYkTlJN4MXKM2QN/ewT5l5gmpICBlkpWG8tmZOdsV+AwpncJOgNYG8gD3q6HaU0Xk3tfTyzoPzutU6L2BfAdBA+di5X73w2+LC6U/fbH94aUIz7nR2qttYpyxso=;
X-UUID: dde54503fd4c47deb69540d53c8006bf-20210510
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 96937685; Mon, 10 May 2021 08:15:01 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 May 2021 08:15:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 May 2021 23:15:00 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 May 2021 23:14:59 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>, "YN
 Chen" <yn.chen@mediatek.com>
Subject: [PATCH 9/9] mt76: mt7921: add back connection monitor support
Date: Mon, 10 May 2021 23:14:57 +0800
Message-ID: <1620659697-12048-9-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1620659697-12048-1-git-send-email-sean.wang@mediatek.com>
References: <1620659697-12048-1-git-send-email-sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_081508_293354_2D0646CA 
X-CRM114-Status: GOOD (  15.14  )
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

Hw beacon cmd to the mt7921 firmware doesn't only filter out the beacon,
but also performs its own connection monitoring, including periodic
keep-alives to the AP and probing the AP on beacon loss. Will indicate
the host with the event when the firmware detects the connection is lost.

Fixes: 1d8efc741df8 ("mt76: mt7921: introduce Runtime PM support")
Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: YN Chen <yn.chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/init.c  |  4 +++
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 32 +++++++++++++------
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
index cd68721314fa..cbb1d432a591 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
@@ -73,6 +73,7 @@ static void
 mt7921_init_wiphy(struct ieee80211_hw *hw)
 {
 	struct mt7921_phy *phy = mt7921_hw_phy(hw);
+	struct mt7921_dev *dev = phy->dev;
 	struct wiphy *wiphy = hw->wiphy;
 
 	hw->queues = 4;
@@ -112,6 +113,9 @@ mt7921_init_wiphy(struct ieee80211_hw *hw)
 	ieee80211_hw_set(hw, SUPPORTS_PS);
 	ieee80211_hw_set(hw, SUPPORTS_DYNAMIC_PS);
 
+	if (dev->pm.enable)
+		ieee80211_hw_set(hw, CONNECTION_MONITOR);
+
 	hw->max_tx_fragments = 4;
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 67dc4b4cc094..7c68182cad55 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -450,22 +450,33 @@ mt7921_mcu_scan_event(struct mt7921_dev *dev, struct sk_buff *skb)
 }
 
 static void
-mt7921_mcu_beacon_loss_event(struct mt7921_dev *dev, struct sk_buff *skb)
+mt7921_mcu_connection_loss_iter(void *priv, u8 *mac,
+				struct ieee80211_vif *vif)
+{
+	struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
+	struct mt76_connac_beacon_loss_event *event = priv;
+
+	if (mvif->idx != event->bss_idx)
+		return;
+
+	if (!(vif->driver_flags & IEEE80211_VIF_BEACON_FILTER))
+		return;
+
+	ieee80211_connection_loss(vif);
+}
+
+static void
+mt7921_mcu_connection_loss_event(struct mt7921_dev *dev, struct sk_buff *skb)
 {
 	struct mt76_connac_beacon_loss_event *event;
-	struct mt76_phy *mphy;
-	u8 band_idx = 0; /* DBDC support */
+	struct mt76_phy *mphy = &dev->mt76.phy;
 
 	skb_pull(skb, sizeof(struct mt7921_mcu_rxd));
 	event = (struct mt76_connac_beacon_loss_event *)skb->data;
-	if (band_idx && dev->mt76.phy2)
-		mphy = dev->mt76.phy2;
-	else
-		mphy = &dev->mt76.phy;
 
 	ieee80211_iterate_active_interfaces_atomic(mphy->hw,
 					IEEE80211_IFACE_ITER_RESUME_ALL,
-					mt76_connac_mcu_beacon_loss_iter, event);
+					mt7921_mcu_connection_loss_iter, event);
 }
 
 static void
@@ -530,7 +541,7 @@ mt7921_mcu_rx_unsolicited_event(struct mt7921_dev *dev, struct sk_buff *skb)
 
 	switch (rxd->eid) {
 	case MCU_EVENT_BSS_BEACON_LOSS:
-		mt7921_mcu_beacon_loss_event(dev, skb);
+		mt7921_mcu_connection_loss_event(dev, skb);
 		break;
 	case MCU_EVENT_SCHED_SCAN_DONE:
 	case MCU_EVENT_SCAN_DONE:
@@ -1368,6 +1379,7 @@ mt7921_pm_interface_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 {
 	struct mt7921_phy *phy = priv;
 	struct mt7921_dev *dev = phy->dev;
+	struct ieee80211_hw *hw = mt76_hw(dev);
 	int ret;
 
 	if (dev->pm.enable)
@@ -1380,9 +1392,11 @@ mt7921_pm_interface_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
 
 	if (dev->pm.enable) {
 		vif->driver_flags |= IEEE80211_VIF_BEACON_FILTER;
+		ieee80211_hw_set(hw, CONNECTION_MONITOR);
 		mt76_set(dev, MT_WF_RFCR(0), MT_WF_RFCR_DROP_OTHER_BEACON);
 	} else {
 		vif->driver_flags &= ~IEEE80211_VIF_BEACON_FILTER;
+		__clear_bit(IEEE80211_HW_CONNECTION_MONITOR, hw->flags);
 		mt76_clear(dev, MT_WF_RFCR(0), MT_WF_RFCR_DROP_OTHER_BEACON);
 	}
 }
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
