Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52BDC98302
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2026 22:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HH7Mx1ASGQGZXIkAoii0TJeZ9j5LKy/zgHlKkIF1avg=; b=wD9EjnVTE/HSu7clNygJETzYHD
	SNIA8EcIsKqnv7cIoK1Z2JdhBxU1ncClRQZfhZ4oeAIn7EjFvWjalBucoAX3AEVUShtsVuOKXcvTy
	sYEjkPYZmSxNpEs9qPvn22bcZ8qxQf2LkdDJrW3rGt7bOfPzKmFZcy3wDIjW1v3E8slw4Z6D7hMjm
	6iaVDdRNiOgV0QW4W/wBiMGg0TjWsv3LUc4jVqHlBJ8IUSMu9ZZ0/SkfI7z/Mi6bV9fLCx7YHW3TK
	ddyscvs3Og6nTtwc+t/x97wgpQk+dI/bD5Uwt0ROcQHJl4367pg+2tFGIZtILzE+a9IGu+gqD7NN4
	zcJ0xRRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98fB-00000006f7X-3M3y;
	Tue, 22 Sep 2026 22:08:33 +0000
Received: from mail-vs2-x0f.google.com ([2a00:1450:4864:3a::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98f9-00000006f7B-2Qev
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Sep 2026 22:08:32 +0000
Received: by mail-vs2-x0f.google.com with SMTP id ada2fe7eead31-790ec94be85so159895137.3
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Sep 2026 15:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790114910; x=1790719710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HH7Mx1ASGQGZXIkAoii0TJeZ9j5LKy/zgHlKkIF1avg=;
        b=muZO2yJYYa/2VyaTJGUHr4iFXmlXTg/X5qPIk2Kz4dolFMv2C8Qbjd2+cG8+x709bP
         Othi93Bjlikv0EQWAkLqGM0c9mx+FaX7jpf1INmjx4qcMlvvdwHBUM2darReiwi50pKG
         OzqFVkqdZoJ0qJiKdlOcRnHwlYCHJbNndDBjdGFqPGK26ejjNuFtSWkFI00RNF45Gh8+
         dbNYZDTng5pyU0kFj/dJcOSgApGOnzu6FVFDXiDr8fJe7WxY1jMfEy3h7aao5czTaM/9
         FHHAkSiACuibGJEOJbo+c80tJnIhLYoYBoY9oO60D3zwOoJYz9Svb9QVVaw4T1vmAc/1
         8wuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790114910; x=1790719710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HH7Mx1ASGQGZXIkAoii0TJeZ9j5LKy/zgHlKkIF1avg=;
        b=2D5df431zdHcmr0+yjrq3bWMZpyU+AIadVwS+7CjRw6Hn+/cEUswvWsB0kzWbcK9DR
         0jRkeXp6BAs1RgHC1EFy8gardT9Znrytzs9hF68SeAJ+mSOKX1sWWO6Tc+sS0Ky0MthU
         btgLRhKR6VcriavuMitO2ayQYB5FRdRjoNfeAd7IR6OH423zDRSxn0pxefN28EZeBOph
         HS8jqV91D8NdJoIEOyT30fbkSVqFuHSY+fqRC4YL9Z60tPds/HJNnEB9wcHrFZyZw4iP
         5EqXvqoEqv2MWmNri7gouFtHSLlo2bYt9AOvMKKbfvwmEhBKUN+Y2BFUaWSurx1uP/6u
         vs4w==
X-Forwarded-Encrypted: i=1; AKwUvByEU2K9LtgRrIVTLR83HrHevelgsylJEuoPbg8wnxol2D5j2CvOyMdtkW6kDQpVFaA9NvFX1G0AiIFpFufMSQ==@lists.infradead.org
X-Gm-Message-State: AFuF++m3Nu9c9VNEG11vSluW7NniXvNgEvwnzpgv4G2im472FA0KEORK
	ptzC5LB9psTxiACLK4R7GxM9QdQDya0t95s7Pfd5be1095FGkkeyqrGm
X-Gm-Gg: AYBFou0iOfBK9J5u6GzYvcwf97kJvhRw1tIIRRCanVj/99s6pE9Wuh+9L9XeZToeecn
	XaEi4/J+pOrkYBqvev6oLWj2EgZnKujHU5xFFmpI2WemW1dE6+DhKeZHrUFV9xlFZWh3uT7JETU
	ivU6WAPrJYf40GnjQ5fpwYZ+v7O3QDOq8/YtR9fFAksjx+hK7KmaYTLJ6UvC9HbsAOi6CO6I7qI
	wmgc1YRmHF1RmvmXpy4n+zeWdAin9reJ4LXX74mc/RY4/WuO0mdgwv6HWcmBSzkVZpDwiO9RiDT
	Nw7L/cKSIo1dkFeAEA6PG1tbZ7hEXc9b5SPeK7Dgd9IQipQAljLkq3O/oOsfFiKmTUYr8oGkh+g
	0VATZaTMHIEJbEm3kSW4UL9Y3EZP0DiJM30e8L4kNwm9z2prXxYk/Ndwb1kwYFnughtd232FGJb
	aeAfIBRen8SAtzdql6l+7D04XEfZoAvn6LVIKKhOhcZTQK6wWMgISMNurQHtfGhLQlYuD+B6DqV
	hHDB7c227f+1LgxFYGLD6feOHUQ05n2diZ2nAB0S3C5SvswvSSJ3Iw75JzOTCIwRNsgm9NLEQ==
X-Received: by 2002:a05:6102:5711:b0:7a6:a59e:777e with SMTP id ada2fe7eead31-7ac1c78dc3cmr821363137.16.1790114909612;
        Tue, 22 Sep 2026 15:08:29 -0700 (PDT)
Received: from localhost.localdomain (host61.181-1-22.telecom.net.ar. [181.1.22.61])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-985169f579bsm1362564241.3.2026.09.22.15.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:08:29 -0700 (PDT)
From: Cristian Papa <pcristian292@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] wifi: mt76: mt7603: don't drop short frames looped back on PS entry
Date: Tue, 22 Sep 2026 19:08:14 -0300
Message-ID: <20260922220814.15070-1-pcristian292@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_150831_633303_65E4F3CA 
X-CRM114-Status: GOOD (  17.38  )
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

When a station enters power save, mt7603 has the PSE redirect the frames
still queued for it back to the host, and mt7603_rx_loopback_skb() parks
them until the station wakes up.

The handler rejects every frame shorter than a four-address header
(sizeof(struct ieee80211_hdr), 30 bytes) before looking at it. A
BlockAck request is 20 bytes and a QoS-Null 26, so both are freed
without a trace. Since commit b473c0e47f04 ("wifi: mt76: mt7603: fix tx
queue of loopback packets"), a BAR would also be freed later as a frame
that is not a bufferable MMPDU, although mac80211 buffers BARs for a
sleeping station like any other unicast frame.

mac80211 queues the BAR with IEEE80211_TX_CTL_REQ_TX_STATUS, so it only
learns about the loss when the tx status times out, and the recipient
keeps waiting on its reorder window until then.

Check the length against the header length of the actual frame, and
park a BlockAck request on the queue of its TID, behind the data frames
it refers to.

Found on a TP-Link Archer XR500v (MT7603E) with a client whose Bluetooth
coexistence toggles PM every ~15 ms under load. To test the change on
its own, a temporary debugfs switch flipped between the old and the new
checks every 30 seconds during a bidirectional TCP test, with counters
on the loop-back path and on the tx status of BARs. With the old check,
all 92 BARs that came back were freed, and 91 of the 544 BARs queued in
those phases never got a tx status from the hardware. With this change,
all 129 BARs that came back were parked and sent again, and 11 of 411
got no tx status. Throughput was the same with both checks.

Fixes: e004b7006600 ("mt76: mt7603: notify mac80211 about buffered frames in ps queue")
Assisted-by: LLM
Signed-off-by: Cristian Papa <pcristian292@gmail.com>
---
Testing: the numbers above come from mt76 as packaged by OpenWrt
(2026.07.01, 59676919) on kernel 6.18, with the temporary switch and
counters added (not part of this patch; samples straddling a switch left
out). Its mt7603_rx_loopback_skb() differs from wireless-next only in
where skb->priority is set. The change also runs on the same device as
part of a larger local series, including a 30 minute soak. Build-tested
on mt76.git at be5ce79105, whose mt7603/dma.c is identical to
wireless-next.

Tools: an AI coding assistant (Claude Opus 5.5 in Claude Code) wrote
the instrumentation, analyzed the captures, and drafted this fix and
changelog; the tests ran on my device.

 .../net/wireless/mediatek/mt76/mt7603/dma.c    | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/dma.c b/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
index 477a9b7a8..491c8c937 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/dma.c
@@ -34,7 +34,7 @@ mt7603_rx_loopback_skb(struct mt7603_dev *dev, struct sk_buff *skb)
 	int idx;
 	u32 val;
 
-	if (skb->len < MT_TXD_SIZE + sizeof(struct ieee80211_hdr))
+	if (skb->len < MT_TXD_SIZE + 2)
 		goto free;
 
 	val = le32_to_cpu(txd[1]);
@@ -52,6 +52,9 @@ mt7603_rx_loopback_skb(struct mt7603_dev *dev, struct sk_buff *skb)
 	sta = container_of(priv, struct ieee80211_sta, drv_priv);
 	hdr = (struct ieee80211_hdr *)&skb->data[MT_TXD_SIZE];
 
+	if (skb->len < MT_TXD_SIZE + ieee80211_hdrlen(hdr->frame_control))
+		goto free;
+
 	hwq = wmm_queue_map[IEEE80211_AC_BE];
 	if (ieee80211_is_data_qos(hdr->frame_control)) {
 		tid = *ieee80211_get_qos_ctl(hdr) &
@@ -62,6 +65,19 @@ mt7603_rx_loopback_skb(struct mt7603_dev *dev, struct sk_buff *skb)
 	} else if (ieee80211_is_data(hdr->frame_control)) {
 		skb_set_queue_mapping(skb, IEEE80211_AC_BE);
 		hwq = wmm_queue_map[IEEE80211_AC_BE];
+	} else if (ieee80211_is_back_req(hdr->frame_control)) {
+		struct ieee80211_bar *bar = (struct ieee80211_bar *)hdr;
+
+		if (skb->len < MT_TXD_SIZE + sizeof(*bar))
+			goto free;
+
+		tid = (le16_to_cpu(bar->control) &
+		       IEEE80211_BAR_CTRL_TID_INFO_MASK) >>
+		      IEEE80211_BAR_CTRL_TID_INFO_SHIFT;
+		tid &= IEEE80211_QOS_CTL_TAG1D_MASK;
+		qid = tid_to_ac[tid];
+		hwq = wmm_queue_map[qid];
+		skb_set_queue_mapping(skb, qid);
 	} else {
 		skb_pull(skb, MT_TXD_SIZE);
 		if (!ieee80211_is_bufferable_mmpdu(skb))
-- 
2.47.3


