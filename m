Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AC0CA5FDD
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2026 23:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qOcjtYhwOS178owsYiSd+GNOFQJLXugSIuvWsGlNp/w=; b=0dVW5CcBfgar/RsXbZGjBk9smz
	aJ6ugon4yvocnjIodAQ46jeU4iUxktaSEbL04z4K6oL6Cn5M478ejj2rSGXPZ7eMf/Zzh+++F504M
	F+S+viEWBNJsTAaZWCr2ypDPnLxBDYV5JmHHJhUV6GiwloCocEjMkJ6rISwOS85mG5eQd460dfNN6
	DTnJ4iDRqLePphWNriErhriQDk9Ig6t+k26v+RWq7/+cV+yERl5m+hfFMTYUa59MvLOGKcUU1N52x
	mpLL5FSNuFfmgZoe9/SKSszl3n+CDUCIdmfla5ZofECQWFMfXiBJT25uXNCxvU8KmyVhSEZHa9YQR
	goE/+HCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD9C6-0000000EAfB-1cvE;
	Sat, 03 Oct 2026 23:31:06 +0000
Received: from out-179.mta1.migadu.com ([2001:41d0:203:375::b3] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD9C1-0000000EAeP-3sJm
	for linux-mediatek@lists.infradead.org;
	Sat, 03 Oct 2026 23:31:05 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Xw1FjG3l+X5v/tmL+AFv+0fYunh6K0cphgfqBQpcsDM=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791070259; v=1; x=1791675059;
 b=LoIZVhnDBTzw4tmm2bQcHILWhM8IEt3Rfdn5QuopCAu45qYdG4d6wqIFUA3TKrgwu306aYP2
 QcaWKpKoARndNWIXJ/7H/OsSfVdKZkb788ybIuNrEzscFTGB7QC7E50BI5i8C8VsbKfZfG89DCM
 xLrUn8DMNQhjNuN+hu9/ymMMaVKmFNveKyUU0weYpvDF8ve8ttX5k/rBV+YSBB8Ua+K1Cd69Tmc
 IhN2IrXs8wqWM7axrtc8v6+hKqGNrn+Yl/QL4p5AR1NY/XRypb0o1d1PR5CA4cC+Pjxzv/k2S2R
 awUmW14YG9SHXX2LjGDucgLGRKusGFmZ3OoaWH16K35cg==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8392b3fc8d7e1049;
	Sat, 03 Oct 2026 23:30:59 +0000
X-Mizu-Trace-ID: 8392b3fc8d7e1049
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Eason Lai <eason.lai@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH RESEND wireless] wifi: mt76: take rcu_read_lock in the USB/SDIO tx completion path
Date: Sat,  3 Oct 2026 16:30:56 -0700
Message-ID: <20261003233056.94497-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_163102_850733_8BA8BB21 
X-CRM114-Status: UNSURE (   8.54  )
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

The USB and SDIO completion path reads a station pointer that RCU
protects, without holding the read lock. Lockdep catches it on the
first association:

  mt76.h:1305 suspicious rcu_dereference_check() usage!
  no locks held by mt76-usb-status/1254.
   mt7925_usb_sdio_tx_complete_skb+0x119/0x130 [mt7925_common]
   mt76_queue_tx_complete+0x27/0x60 [mt76]
   mt76u_status_worker+0xed/0x1e0 [mt76_usb]

  mt7925/mac.c:856 suspicious rcu_dereference_check() usage!
   mt7925_tx_check_aggr.part.0+0xc2/0xe0 [mt7925_common]
   mt7925_usb_sdio_tx_complete_skb+0xa0/0x130 [mt7925_common]

mt7921 does the same, and warns once instead of twice because its
aggregation check reads the default link directly. The DMA path makes
the same reads but completes from softirq, so it stays quiet.

Take the read lock around the lookup and the check.

Tested on 7.2-rc5 with lockdep, fresh module load per arm, 4000
packets each and no change to the link:

                             splats before   after
    MT7925  Netgear A9000          2           0
    MT7921  Alfa                   1           0
    mt7921e same kernel            0           0

Fixes: dc66a129adf1 ("wifi: mt76: add a wrapper for wcid access with validation")
Fixes: c22769de2509 ("wifi: mt76: mt7925u: use connac3 tx aggr check in tx complete")
Cc: stable@vger.kernel.org
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index e69978184f68..ad1352ddf1fc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -831,11 +831,14 @@ void mt7921_usb_sdio_tx_complete_skb(struct mt76_dev *mdev,
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
index 101f571b027f..45bc79727426 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1687,11 +1687,14 @@ void mt7925_usb_sdio_tx_complete_skb(struct mt76_dev *mdev,
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


