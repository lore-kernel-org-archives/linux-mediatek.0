Return-Path: <SRS0=tJCI=6P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC64C47254
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 10:37:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 968532166E
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 10:37:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M4jClSUg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0pLZoci"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 968532166E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6rqiZ/u/SwV2r3VspKKByX2gMNjU80m06Ai/88MJKE=; b=M4jClSUgrzEDst
	jB06CKkzFXUT4yWjBVXabptvPKkLTTgSe9m8DTjsyqXWJ7Rx9/mkVSx/AlMqn8Y7N2qvGLnwRj7Hd
	J80PgLj3KIayh+t6fbZVzBxghptKfuxTurCSeK13vvQBIn1TtCaxsJWojctG+dvuF3G0lr2T80IBa
	I3cMoLyN1S4kmv2lkirajXz9gHHbOvEXFZauYe7rgUDEW8jZvQd2/ZhZOGBUXERMR05RbL0rnhcHA
	7sMCdljrnV9byC2kNfiMBNM9sZN4k24jt0NkmY1BxDP28gwX2GeB7tAqz2/Vysm/lArAjJVAtcvd1
	tQI10S2I581UO66oz1bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUT2K-0004aN-TK; Fri, 01 May 2020 10:36:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUT2H-0004VI-6H
 for linux-mediatek@lists.infradead.org; Fri, 01 May 2020 10:36:50 +0000
Received: from lore-desk.lan (unknown [151.48.155.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 96C3520787;
 Fri,  1 May 2020 10:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588329408;
 bh=yaTZdHdetXbjivlqnpNad3+2VachzitT+BEiJ73hIx8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R0pLZociAqDr252R76Z3Adz3Tlb/APFsL85kjJun6Xq5WPxUqIF7LCobZfnqb2CW7
 c2lazoviKxbPFeI7LRmF7aP97tMkROQVCZiOaYkKAxgDUUbRhlpMAcToa821Rbefah
 nBV+OqOeYPxhB2M5bktKlRqs4wpf3/NTHYt6O5E4=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 7/7] mt76: mt7615: introduce beacon_loss mcu event
Date: Fri,  1 May 2020 12:36:17 +0200
Message-Id: <5f1da837b2470ff01ae4e59b75f3d8acdf3d16ab.1588329170.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1588329170.git.lorenzo@kernel.org>
References: <cover.1588329170.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_033649_279871_0D8A0F41 
X-CRM114-Status: GOOD (  10.33  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org,
 soul.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If device has enabled beacon hw filter rx beacons are not reported to
the host. Introduce beacon_loss mcu event to trigger mac80211 mlme
connection state machine in this configuration.
IEEE80211_VIF_BEACON_FILTER has not set in vif flags since hw beacon
filter is not enabled yet

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 38 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |  7 ++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 84d4b96028f2..214328133c65 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -359,6 +359,40 @@ mt7615_mcu_scan_event(struct mt7615_dev *dev, struct sk_buff *skb)
 				     MT7615_HW_SCAN_TIMEOUT);
 }
 
+static void
+mt7615_mcu_beacon_loss_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
+{
+	struct mt7615_vif *mvif = (struct mt7615_vif *)vif->drv_priv;
+	struct mt7615_beacon_loss_event *event = priv;
+
+	if (mvif->idx != event->bss_idx)
+		return;
+
+	if (!(vif->driver_flags & IEEE80211_VIF_BEACON_FILTER))
+		return;
+
+	ieee80211_beacon_loss(vif);
+}
+
+static void
+mt7615_mcu_beacon_loss_event(struct mt7615_dev *dev, struct sk_buff *skb)
+{
+	struct mt7615_beacon_loss_event *event;
+	struct mt76_phy *mphy;
+	u8 band_idx = 0; /* DBDC support */
+
+	skb_pull(skb, sizeof(struct mt7615_mcu_rxd));
+	event = (struct mt7615_beacon_loss_event *)skb->data;
+	if (band_idx && dev->mt76.phy2)
+		mphy = dev->mt76.phy2;
+	else
+		mphy = &dev->mt76.phy;
+
+	ieee80211_iterate_active_interfaces_atomic(mphy->hw,
+					IEEE80211_IFACE_ITER_RESUME_ALL,
+					mt7615_mcu_beacon_loss_iter, event);
+}
+
 static void
 mt7615_mcu_bss_event(struct mt7615_dev *dev, struct sk_buff *skb)
 {
@@ -389,6 +423,9 @@ mt7615_mcu_rx_unsolicited_event(struct mt7615_dev *dev, struct sk_buff *skb)
 	case MCU_EVENT_EXT:
 		mt7615_mcu_rx_ext_event(dev, skb);
 		break;
+	case MCU_EVENT_BSS_BEACON_LOSS:
+		mt7615_mcu_beacon_loss_event(dev, skb);
+		break;
 	case MCU_EVENT_SCHED_SCAN_DONE:
 	case MCU_EVENT_SCAN_DONE:
 		mt7615_mcu_scan_event(dev, skb);
@@ -410,6 +447,7 @@ void mt7615_mcu_rx_event(struct mt7615_dev *dev, struct sk_buff *skb)
 	    rxd->ext_eid == MCU_EXT_EVENT_FW_LOG_2_HOST ||
 	    rxd->ext_eid == MCU_EXT_EVENT_ASSERT_DUMP ||
 	    rxd->ext_eid == MCU_EXT_EVENT_PS_SYNC ||
+	    rxd->eid == MCU_EVENT_BSS_BEACON_LOSS ||
 	    rxd->eid == MCU_EVENT_SCHED_SCAN_DONE ||
 	    rxd->eid == MCU_EVENT_BSS_ABSENCE ||
 	    rxd->eid == MCU_EVENT_SCAN_DONE ||
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index 890a202acfc9..737ccec6dd96 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -83,6 +83,7 @@ enum {
 	MCU_EVENT_MT_PATCH_SEM = 0x04,
 	MCU_EVENT_SCAN_DONE = 0x0d,
 	MCU_EVENT_BSS_ABSENCE  = 0x11,
+	MCU_EVENT_BSS_BEACON_LOSS = 0x13,
 	MCU_EVENT_CH_PRIVILEGE = 0x18,
 	MCU_EVENT_SCHED_SCAN_DONE = 0x23,
 	MCU_EVENT_EXT = 0xed,
@@ -291,6 +292,12 @@ struct mt7615_mcu_uni_event {
 	__le32 status; /* 0: success, others: fail */
 } __packed;
 
+struct mt7615_beacon_loss_event {
+	u8 bss_idx;
+	u8 reason;
+	u8 pad[2];
+} __packed;
+
 struct mt7615_mcu_scan_ssid {
 	__le32 ssid_len;
 	u8 ssid[IEEE80211_MAX_SSID_LEN];
-- 
2.25.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
