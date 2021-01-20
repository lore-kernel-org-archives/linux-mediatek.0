Return-Path: <SRS0=1cO+=GX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB609C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 19:43:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 694F22343B
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 19:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 694F22343B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kp0ZTEBA4YEPPnbwy/h09/qgcsZylX27C1AvfBRDJbk=; b=OhLPzM1ZPu+txABc1m0fDmX4i
	S7ZJjMLBskorXGSgq5qxJo29mV9T2nzZ2sYTUgFflnkGRXvIq/weAa0CCdNiEXWsNGYoPkJLokPjS
	bYfUjHIGc829N+73uY28vvBKPwT2YjbYoN9N6s5XOCUbJq0VNQpGZ2r1E+SvkaAqhbXM+pbpacH+4
	ryX5icXWp56RH2Z+4tuXreeaaWCzX7Lzw/2zeRTNoLSMk9w4GQ65pkUvOXdsgTlPFa8mD6bcYdxuK
	/1eBriqHs2hWblyrYS/PITPf9fK9ii1Uep0yqzMxZefc9kybOKIQW6N2lkofiRE7k/4hIPOVH5/pt
	/qaXLWdfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2JNO-0007Mr-V9; Wed, 20 Jan 2021 19:42:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2JNB-0007GR-NT
 for linux-mediatek@lists.infradead.org; Wed, 20 Jan 2021 19:42:35 +0000
X-UUID: aaedd64318224d2080984af72f76ebc4-20210120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hT44laZqghDRbhPEgdAg95jIB5V5cg9FUXotVmuS3zw=; 
 b=Mo33RG2DNMNAZESHICO7F+Jsi6GRHDIgVRd5VuJ/IwwRlLX1rCNelH0X0BofQtWuMYhUrWnDt9t298JbtJHibc7BcIGJzIvn46tNPFcjt73Fy9PWomuXuEi73cgymp6jgyPQZspC52yormPyMTyz6ZASzDX4eXLWHcB+xEuu93M=;
X-UUID: aaedd64318224d2080984af72f76ebc4-20210120
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 941626699; Wed, 20 Jan 2021 11:42:26 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Jan 2021 11:33:57 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Jan 2021 03:33:56 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 21 Jan 2021 03:33:55 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v6 14/15] mt76: mt7921: introduce beacon_loss mcu event
Date: Thu, 21 Jan 2021 03:33:50 +0800
Message-ID: <cdb79da712ad6ce26adc8e39d74e62affcb96c0c.1611060302.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1611060302.git.objelf@gmail.com>
References: <cover.1611060302.git.objelf@gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: D60B84684953E799F7B4BE3FCB33B78F1D238696F60F0727DB4D86145A4D2BE42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_144233_928221_09DCC01C 
X-CRM114-Status: GOOD (  12.05  )
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
Cc: ryder.lee@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 Eric.Liang@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, posh.sun@mediatek.com, YN.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, Soul.Huang@mediatek.com,
 Lorenzo Bianconi <lorenzo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

If device has enabled beacon hw filter rx beacons are not reported to
the host. Introduce beacon_loss mcu event to trigger mac80211 mlme
connection state machine in this configuration.
IEEE80211_VIF_BEACON_FILTER has not set in vif flags since hw beacon
filter is not enabled yet

Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 35 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7921/mcu.h   |  6 ++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 945d0e44ae71..3b8e5de63db8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -543,6 +543,40 @@ mt7921_mcu_scan_event(struct mt7921_dev *dev, struct sk_buff *skb)
 				     MT7921_HW_SCAN_TIMEOUT);
 }
 
+static void
+mt7921_mcu_beacon_loss_iter(void *priv, u8 *mac, struct ieee80211_vif *vif)
+{
+	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
+	struct mt7921_beacon_loss_event *event = priv;
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
+mt7921_mcu_beacon_loss_event(struct mt7921_dev *dev, struct sk_buff *skb)
+{
+	struct mt7921_beacon_loss_event *event;
+	struct mt76_phy *mphy;
+	u8 band_idx = 0; /* DBDC support */
+
+	skb_pull(skb, sizeof(struct mt7921_mcu_rxd));
+	event = (struct mt7921_beacon_loss_event *)skb->data;
+	if (band_idx && dev->mt76.phy2)
+		mphy = dev->mt76.phy2;
+	else
+		mphy = &dev->mt76.phy;
+
+	ieee80211_iterate_active_interfaces_atomic(mphy->hw,
+					IEEE80211_IFACE_ITER_RESUME_ALL,
+					mt7921_mcu_beacon_loss_iter, event);
+}
+
 static void
 mt7921_mcu_bss_event(struct mt7921_dev *dev, struct sk_buff *skb)
 {
@@ -593,6 +627,7 @@ mt7921_mcu_rx_unsolicited_event(struct mt7921_dev *dev, struct sk_buff *skb)
 
 	switch (rxd->eid) {
 	case MCU_EVENT_BSS_BEACON_LOSS:
+		mt7921_mcu_beacon_loss_event(dev, skb);
 		break;
 	case MCU_EVENT_SCHED_SCAN_DONE:
 	case MCU_EVENT_SCAN_DONE:
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
index de3a9aabec04..bf2e643cd870 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.h
@@ -784,6 +784,12 @@ struct mt7921_bss_qos_tlv {
 	u8 pad[3];
 } __packed;
 
+struct mt7921_beacon_loss_event {
+	u8 bss_idx;
+	u8 reason;
+	u8 pad[2];
+} __packed;
+
 struct mt7921_mcu_scan_ssid {
 	__le32 ssid_len;
 	u8 ssid[IEEE80211_MAX_SSID_LEN];
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
