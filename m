Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77C7C55174
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2026 20:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lsbxk4DD6MTaYwn6/BXYYPb1S/6SO9MBPU/YZIAV3pY=; b=apkdBhBrgAGC649xqQKqnIBEOw
	13mNmg/6uPXIy+JHNncpDmko9PWEArvTQkx6kLpv3qwN5ekns+Q0n3h54rdTsg/q9gt1Zb+RhEVfr
	bF2Fk2xdB59FuymX9N6JQCixIOcXh09eS5sujnlZTl/MJme3hoaBXqtDoh9sAAw0CtMh1VO1Pm1lR
	SEX2BSO56IvYI4lqi//pl7/vNC0EF8cZ3XX4/hflDxdhGVQMGYTMu6LDdySjNHBRefZStc5rTVJ7A
	JtafPMxJ1B4s8E1zPlEa1p5/bDNJnaXhi6AfmNn9Z9CIsysMMKUvVnsLcpNAqz6QYoOOFT8vg4Ph8
	1A9iz5cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrhvt-00000004VuA-01xz;
	Wed, 05 Aug 2026 20:09:45 +0000
Received: from mta1.migadu.com ([37.59.57.117] helo=out-178.mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrhvp-00000004Vtr-3iWQ
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Aug 2026 20:09:43 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1785960577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Lsbxk4DD6MTaYwn6/BXYYPb1S/6SO9MBPU/YZIAV3pY=;
	b=DDnyOjcALJewwQs06v6eFgXc2iSlbmRKeU4WPFKZuPOczI/Jzu1fjuWfZIXh450qFgyQsS
	oz2Z4tHEJM1u7RDsmBbIvDzeZf4AQS7ha1nzgRE50p2OvpR2AmRMWWoZF1U2vjfG8fRm25
	fZExdmDoiNIcxNDb7YcJvL0oyXhOWzFfycVk3TJCQJ2xrcQTPR4E45hLplUCBHrs9fvJhl
	RnC0ZZu05lTWr3Radw9QIgoTAiDzcxyKibhimvEmv66QzuD30/YLka9q446rG2STHzCW2r
	IA6FYjaLC9a+prd9nxN/wCFTPT7apJ4h5gkLTEcvDEh81O9bE7imW7WDel5BWA==
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Eason Lai <eason.lai@mediatek.com>
Subject: [PATCH] wifi: mt76: take rcu_read_lock in the USB/SDIO tx completion path
Date: Wed,  5 Aug 2026 13:09:28 -0700
Message-ID: <20260805200928.37874-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_130942_353236_F740442C 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

mt7925_usb_sdio_tx_complete_skb() looks up the wcid and then the sta
links, both with rcu_dereference(), from the mt76-usb-status kthread
holding nothing. PROVE_RCU catches it twice on the first association:

  mt76.h:1305 suspicious rcu_dereference_check() usage!
  no locks held by mt76-usb-status/1254.
   mt7925_usb_sdio_tx_complete_skb+0x119/0x130 [mt7925_common]
   mt76_queue_tx_complete+0x27/0x60 [mt76]
   mt76u_status_worker+0xed/0x1e0 [mt76_usb]

  mt7925/mac.c:856 suspicious rcu_dereference_check() usage!
   mt7925_tx_check_aggr.part.0+0xc2/0xe0 [mt7925_common]
   mt7925_usb_sdio_tx_complete_skb+0xa0/0x130 [mt7925_common]

mt7921's USB/SDIO completion has the same unprotected wcid lookup and
warns at mt76.h:1305 too. It only warns once because
mt76_connac2_tx_check_aggr() reads sta->deflink directly. The DMA path
does the same lookups but completes from softirq, so it stays quiet.

Tested on 7.2-rc5 with PROVE_RCU, fresh module load per arm: MT7925
(Netgear A9000) two splats before and none after, MT7921 (Alfa) one
before and none after, 4000 packets on each arm with no change to the
link. mt7921e on the same kernel was clean throughout.

Fixes: dc66a129adf1 ("wifi: mt76: add a wrapper for wcid access with validation")
Fixes: c22769de2509 ("wifi: mt76: mt7925u: use connac3 tx aggr check in tx complete")
Cc: stable@vger.kernel.org
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index f7d54472d..661a54e6c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -828,11 +828,14 @@ void mt7921_usb_sdio_tx_complete_skb(struct mt76_dev *mdev,
 	u16 idx;
 
 	idx = le32_get_bits(txwi[1], MT_TXD1_WLAN_IDX);
+
+	rcu_read_lock();
 	wcid = __mt76_wcid_ptr(mdev, idx);
 	sta = wcid_to_sta(wcid);
 
 	if (sta && likely(e->skb->protocol != cpu_to_be16(ETH_P_PAE)))
 		mt76_connac2_tx_check_aggr(sta, txwi);
+	rcu_read_unlock();
 
 	skb_pull(e->skb, headroom);
 	mt76_tx_complete_skb(mdev, e->wcid, e->skb);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index 6b0cd1996..20e0919d2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1470,11 +1470,14 @@ void mt7925_usb_sdio_tx_complete_skb(struct mt76_dev *mdev,
 	u16 idx;
 
 	idx = le32_get_bits(txwi[1], MT_TXD1_WLAN_IDX);
+
+	rcu_read_lock();
 	wcid = __mt76_wcid_ptr(mdev, idx);
 	sta = wcid_to_sta(wcid);
 
 	if (sta && likely(e->skb->protocol != cpu_to_be16(ETH_P_PAE)))
 		mt7925_tx_check_aggr(sta, e->skb, wcid);
+	rcu_read_unlock();
 
 	skb_pull(e->skb, headroom);
 	mt76_tx_complete_skb(mdev, e->wcid, e->skb);
-- 
2.55.0


