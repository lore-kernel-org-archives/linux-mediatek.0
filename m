Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBE4EB2700
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Feb 2026 20:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a7LT16Pkf6gAH2KbKPKOEQEsN90e34wIpaLIN5RNQcw=; b=U1FYvQ1GYz+pIp8PPUMiULc597
	nDtj1Hv3A+OoC+0oqPEVKUw9UonLFX53Ic/rhr7CHyb4edisiHdHx3rsgkWYC6Ep3VlKTin5hK3Af
	ksjXKIB1HdOIxb08BKhuTp525amTfdo9upnR16u5RH4gCbGvyD/T5X4mqOOfaxeQdRPpHkCeg6LAL
	q7fC+7PTXM87385eSUweMt3OzWCfbnViP+Ur6UbNau0PwRvQes8qGKvkfpP7pgrTkkGFyEA2w7yRW
	Zz23s7ZUIkLa2N2oYDa0V5ZMSvXAS17SSBE4IR7QeLV74O8rtmhAuHC80dSm8c5dOHgA9RaMMuZ/G
	HUC8a2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpuD2-0000000HTi5-2apg;
	Tue, 10 Feb 2026 20:19:44 +0000
Received: from mailgate02.uberspace.is ([2a00:d0c0:200:0:1c7b:a6ff:fee0:8ea4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpuCy-0000000HTgd-2eNr
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Feb 2026 20:19:42 +0000
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id EC3891802AF
	for <linux-mediatek@lists.infradead.org>; Tue, 10 Feb 2026 21:19:29 +0100 (CET)
Received: (qmail 28944 invoked by uid 988); 10 Feb 2026 20:19:29 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by perseus.uberspace.de (Haraka/3.1.1) with ESMTPSA; Tue, 10 Feb 2026 21:19:29 +0100
From: David Bauer <mail@david-bauer.net>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH mt76] wifi: mt76: mt7915: sync station power save state
Date: Tue, 10 Feb 2026 21:19:14 +0100
Message-ID: <20260210201917.993424-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-3) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=+iJygy5Rsph3wgdm2ihgiOtTPWuxGIOIgL9IIraZFsc=;
	b=RC9Kht1zeY9OVpr4Eb3kudMKBbZdFnACKFC2IFZQRPkWWoE4rI1ToCk3lYpUisMmwqQh3rd0Ji
	R4+bbYFtW1zElJ31SHgumImP/uN5otpyaRyHh4irmmGKEL4DASpUCzYqERaquhicCNHJ7OH+IvSg
	853X61J+oHhxwPXXJ3UwjW5sLHBfYEhCDGmygbvnVyUrv/Pehn04oC1UvSTcRapuegwq/hE9xf7S
	uxkdIyjz1LJZRHoH/S1MxSkHsdXoTvxkiLrMsiu7vzeV6Xx1NTiErp1R+h0UKmsxZm15FNmhGoO+
	Ig8VA09VAwykr3ASxXgrD4BHm54dj/laleQAFGjnkHc/pmZWjmmel4MpmPMhKYgoYVxfbDSY1yyH
	X/csZYmHmaaZUiUiXTRiEGH8mnNmwjtXRlGXqjZof6xYqavPMgauEISq7GtMYLgMtiGqcAjeqKTI
	PEQCjURKpQbQvM5qLHafJUXTlRRGQi4gDrTZrkmF8tSKSUUER6YCGGnDN2f7RoDhlQWmyOTKcHHB
	PsMMR231EdKW0hmcYwJOQX3XEafrSmTT4CYb/kfU2ziWcQq8jAosEVCWvfR4PMOTTC9wIlgxgupp
	YaKCzDPLe8QM4BP8n205UFwxsjEbDAuUZ4ct6ZpxAhGcL0Hg8zd+vJB3uV0guY8yBJVMaVhRyEy4
	E=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_121941_160490_437D22A2 
X-CRM114-Status: GOOD (  11.28  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Host receives a power save state change event everytime a station enters
or leaves PS mode. Use this unsolicited event to stop filling up TX
queues in firmware, as the hardware will buffer frames for stations in
power safe indefinitely.

Limit packets to be enqueued for sleeping STAs in order to manage the
packet backlog in the host-system while still being able to indicate
pending traffic to said STAs.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  1 +
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 28 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  9 ++++++
 3 files changed, 38 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 90d5e79fbf74d..71b94db64ef6d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -1783,6 +1783,7 @@ const struct ieee80211_ops mt7915_ops = {
 	.sw_scan_complete = mt76_sw_scan_complete,
 	.release_buffered_frames = mt76_release_buffered_frames,
 	.get_txpower = mt76_get_txpower,
+	.set_tim = mt76_set_tim,
 	.set_sar_specs = mt7915_set_sar_specs,
 	.channel_switch_beacon = mt7915_channel_switch_beacon,
 	.get_stats = mt7915_get_stats,
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 00bff4d3aab80..8b4a5973b240c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -402,6 +402,31 @@ mt7915_mcu_rx_bcc_notify(struct mt7915_dev *dev, struct sk_buff *skb)
 			mt7915_mcu_cca_finish, mphy->hw);
 }
 
+static void mt7915_mcu_rx_ps_sync(struct mt7915_dev *dev, struct sk_buff *skb)
+{
+	struct mt7915_mcu_ps_notify *p;
+	struct ieee80211_sta *sta;
+	struct mt76_wcid *wcid;
+	u16 wcid_idx;
+
+	p = (struct mt7915_mcu_ps_notify *)skb->data;
+	wcid_idx = p->wtbl_lower | (p->wtbl_higher) << 8;
+
+	rcu_read_lock();
+	wcid = mt76_wcid_ptr(dev, wcid_idx);
+	if (!wcid)
+		goto out;
+
+	sta = wcid_to_sta(wcid);
+	if (!sta)
+		goto out;
+
+	ieee80211_sta_ps_transition_ni(sta, !!p->ps_bit);
+
+out:
+	rcu_read_unlock();
+}
+
 static void
 mt7915_mcu_rx_ext_event(struct mt7915_dev *dev, struct sk_buff *skb)
 {
@@ -424,6 +449,9 @@ mt7915_mcu_rx_ext_event(struct mt7915_dev *dev, struct sk_buff *skb)
 	case MCU_EXT_EVENT_BCC_NOTIFY:
 		mt7915_mcu_rx_bcc_notify(dev, skb);
 		break;
+	case MCU_EXT_EVENT_PS_SYNC:
+		mt7915_mcu_rx_ps_sync(dev, skb);
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
index 3af11a075a2f4..836fe46393256 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.h
@@ -54,6 +54,15 @@ struct mt7915_mcu_bcc_notify {
 	u8 rsv;
 } __packed;
 
+struct mt7915_mcu_ps_notify {
+	struct mt76_connac2_mcu_rxd_hdr rxd;
+
+	u8 wtbl_lower;
+	u8 ps_bit;
+	u8 wtbl_higher;
+	u8 rsv;
+} __packed;
+
 struct mt7915_mcu_rdd_report {
 	struct mt76_connac2_mcu_rxd_hdr rxd;
 
-- 
2.51.0


