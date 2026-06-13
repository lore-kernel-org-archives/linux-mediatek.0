Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00264CD98C5
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 22:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=321hUeIgZZu6R1Mtyh4MWYy/Mrv5RJd99Cf5mZJVDl8=; b=LwyrLHv20TOXHTcGUcwKwiuZa2
	mtcBtC+i6eYn8wVXY/TGA2ZmA9drdZTajLI5loUK8ooR8MwED2WwOPExScnMabffOWFutlvO3hFsp
	sgMlXp571GY7gC8uHIsi7qQVfL63hlTYYhxhggSNjd9qANnpio3tbISMoZHYLmbDKMn6wZVxS0PH8
	A7haivm+H0FjoDJDHq2Q+tDDJ6pYKdAL3nXGMs70h+zPvA8SBjmYTfH9hOAD5hboOpjo6fCpSfOpq
	IDgAhDMWhYEnJUwDvMdKN/JuRLdbLQ7nlJyqb0zTpFE24MJtZCH/EsvicJ8B5QDdLBjGtJZlD8bCH
	jCrfTUHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX8K-0000000CaMl-1yiT;
	Sat, 13 Jun 2026 22:47:20 +0000
Received: from mail-dl1-f54.google.com ([74.125.82.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX8G-0000000CaKN-24me
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 22:47:17 +0000
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-137335bc3caso2438992c88.0
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 15:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781390836; x=1781995636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=321hUeIgZZu6R1Mtyh4MWYy/Mrv5RJd99Cf5mZJVDl8=;
        b=d6bufzeKZDBGi7YgUnwTQGxOJUsNPv4HWLzKOSxUbS0nW0A2zvYXh5vDiONDQ9cnUB
         ChWUdr9c6B3syObYWV/jE9K//i+G68+bp/SdNbuNx3RK+4bPOqyE8tx0eIB7GuH36cpM
         Ye+RENHO+ERs76cZ6sXHbxRUmceehrdYiJozRUpFcB+sMGHoo9qQZHIJLpauTtUTV4p3
         ysRHTqavMTVqBQpxqXofkSOcOV3q2ie7XdqZFreV1CtZq+qI/7AFBkbaPlBHZWch02oZ
         93T+xruUrtsQF7r1En3OM/BSX2nX8PQsL0vkQKmqHzUv9Pe8u7jYcLZFwu0Ycn3AqTIR
         zyGA==
X-Forwarded-Encrypted: i=1; AFNElJ9uXDoJSiOH3pJuqEbqap3an9JRCDbOgF24fGdPNlFNIi/2KkIMC0OaJZfFgjzKZg2xy0HGaZshCvIi9Xj9ZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUEVmOC4agD82CoqWVtV6YjktJlpS/X109ISmpTKUY4cYtTn70
	6mMUTG/DVeyYRSy+u3shyWEzBIbObT2iB2OIbAsuiLaG4QQ0ee/WSSwvkVsHwkDI
X-Gm-Gg: Acq92OEWnX1cvbOmjdk5eduxMy8t7T8kZIgsgfpn6E/2eF6LPGtV5+9P0NB5DhFQwre
	anCcvaM1WYBe4t14cs0UMRAuhP7Yr75/4ZWy4gjjgtraHHZbzDNaQty6Lz+8U3knUfd/s1vjpVJ
	OhWe9u874zhF442D7YR9j3qP/QdlRtNJN8V1W8WRcYOyZzOVnp2SmcR0meL/iakeeaqSFXBKj/h
	ZOceX41A4zHDfDs/WD+sLWuZ96at4obmCmgRoPzk7iJZjPsD+YglKflrn7oNEJHnAuxe8FXeGXi
	A2AQlnJGwEK0Ga2ofMUZjVSibeT/fPhegEpJl6aTTpPZ+Xo5jPmChSa+izEF/q5+riSTaxY4S9U
	+Uu+yqJkp/Lk1G4ZV7/wRXolC0sAiuzeCdjnYhPuscsOH8ErtycoSi32vW9sjpvVpanFV1DAI8q
	WJCeinOhU9JNo4UiGka/wqMLew1fd0RPI6tkUgg3Ifuj61sanUqodHsiJyuWtwjy3SQkytjshMv
	f55C2eN3rAVXsKu94O/9R+3UPEFu2K4pHqo0mAo
X-Received: by 2002:a05:7022:fa03:b0:138:508b:93ca with SMTP id a92af1059eb24-138508b957emr2715475c88.18.1781390835542;
        Sat, 13 Jun 2026 15:47:15 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b97bf09sm6345380c88.14.2026.06.13.15.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:47:15 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 3/5] wifi: mt76: usb: add optional RX aggregation support
Date: Sat, 13 Jun 2026 17:46:53 -0500
Message-ID: <20260613224655.2405686-4-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613224655.2405686-1-sean.wang@kernel.org>
References: <20260613224655.2405686-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_154716_564022_777908F3 
X-CRM114-Status: GOOD (  23.83  )
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

From: Sean Wang <sean.wang@mediatek.com>

Add common USB RX aggregation support and let drivers opt in by programming
the UDMA RX aggregation limit and timeout.

RX aggregation allows the device to pack multiple RX packets into one USB
transfer, reducing URB completion rate, USB interrupt/IO overhead, and host
RX scheduling pressure. This is especially useful at high throughput, where
per-packet USB RX handling can become a CPU bottleneck.

Keep it disabled by default so existing USB drivers keep the current RX
behavior unless they explicitly enable aggregation.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     |  21 ++-
 .../net/wireless/mediatek/mt76/mt7925/usb.c   |  12 ++
 .../net/wireless/mediatek/mt76/mt792x_usb.c   |  23 +++-
 drivers/net/wireless/mediatek/mt76/usb.c      | 124 +++++++++++++++++-
 4 files changed, 169 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 81740aa7df71..125c97dc1f28 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -680,6 +680,13 @@ struct mt76_usb {
 	void (*ctrl_timeout)(struct mt76_dev *dev, int err);
 	bool sg_en;
 
+	struct {
+		bool enable;
+		int align;
+		int padding;
+		int buf_size;
+	} rx_aggr;
+
 	struct mt76u_mcu {
 		u8 *data;
 		/* multiple reads */
@@ -1857,6 +1864,17 @@ mt76u_bulk_msg(struct mt76_dev *dev, void *data, int len, int *actual_len,
 	return usb_bulk_msg(udev, pipe, data, len, actual_len, timeout);
 }
 
+static inline int
+mt76u_rx_aggr_buf_size(int max_mpdu, int aggr_limit, int aggr_pkt_limit,
+		       int padding)
+{
+	int aggr_size;
+
+	aggr_size = min(aggr_limit, aggr_pkt_limit * (max_mpdu + padding));
+
+	return PAGE_ALIGN(max_mpdu + aggr_size);
+}
+
 void mt76_ethtool_page_pool_stats(struct mt76_dev *dev, u64 *data, int *index);
 void mt76_ethtool_worker(struct mt76_ethtool_worker_info *wi,
 			 struct mt76_sta_stats *stats, bool eht);
@@ -1882,7 +1900,8 @@ void mt76u_stop_tx(struct mt76_dev *dev);
 void mt76u_stop_rx(struct mt76_dev *dev);
 int mt76u_resume_rx(struct mt76_dev *dev);
 void mt76u_queues_deinit(struct mt76_dev *dev);
-
+void mt76u_enable_rx_aggr(struct mt76_dev *dev, int align, int padding,
+			  int buf_size);
 int mt76s_init(struct mt76_dev *dev, struct sdio_func *func,
 	       const struct mt76_bus_ops *bus_ops);
 int mt76s_alloc_rx_queue(struct mt76_dev *dev, enum mt76_rxq_id qid);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
index 49ad4fe9eb1b..a0bfe6f09ae4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/usb.c
@@ -3,12 +3,24 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/sizes.h>
 #include <linux/usb.h>
 
 #include "mt7925.h"
 #include "mcu.h"
 #include "mac.h"
 
+#define MT7927_USB_RX_AGGR_ALIGN	16
+#define MT7927_USB_RX_AGGR_PADDING	12
+#define MT7927_USB_RX_AGGR_LIMIT	SZ_32K
+#define MT7927_USB_RX_AGGR_PKT_LIMIT	30
+#define MT7927_USB_RX_MAX_MPDU		(13 * SZ_1K)
+#define MT7927_USB_RX_AGGR_BUF_SIZE \
+	mt76u_rx_aggr_buf_size(MT7927_USB_RX_MAX_MPDU, \
+			       MT7927_USB_RX_AGGR_LIMIT, \
+			       MT7927_USB_RX_AGGR_PKT_LIMIT, \
+			       MT7927_USB_RX_AGGR_PADDING)
+
 static const struct usb_device_id mt7925u_device_table[] = {
 	{ USB_DEVICE_AND_INTERFACE_INFO(0x0e8d, 0x6639, 0xff, 0xff, 0xff),
 		.driver_info = (kernel_ulong_t)MT7925_FIRMWARE_WM },
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
index 6280bc4bf78d..769e828e9449 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_usb.c
@@ -13,6 +13,9 @@
 
 #define MT792X_USB_TX_TIMEOUT_LIMIT	50000
 #define MT792X_USB_UDMA_IDLE_TIMEOUT	1000
+#define MT792X_USB_RX_AGG_LIMIT		32
+#define MT792X_USB_RX_AGG_TIMEOUT	100
+#define MT792X_USB_RX_AGG_PKT_LIMIT	30
 
 static int mt792xu_read32(struct mt76_dev *dev, u32 addr, void *buf)
 {
@@ -403,9 +406,23 @@ int mt792xu_dma_init(struct mt792x_dev *dev, bool resume)
 		 FIELD_PREP(MT_WL_TX_TMOUT_LMT,
 			    MT792X_USB_TX_TIMEOUT_LIMIT));
 	mt76_set(dev, MT_UDMA_WLCFG_0, MT_WL_TX_TMOUT_FUNC_EN);
-	mt76_clear(dev, MT_UDMA_WLCFG_0,
-		   MT_WL_RX_AGG_TO | MT_WL_RX_AGG_LMT);
-	mt76_clear(dev, MT_UDMA_WLCFG_1, MT_WL_RX_AGG_PKT_LMT);
+
+	if (dev->mt76.usb.rx_aggr.enable) {
+		mt76_set(dev, MT_UDMA_WLCFG_0, MT_WL_RX_AGG_EN);
+		mt76_rmw(dev, MT_UDMA_WLCFG_0,
+			 MT_WL_RX_AGG_TO | MT_WL_RX_AGG_LMT,
+			 FIELD_PREP(MT_WL_RX_AGG_TO,
+				    MT792X_USB_RX_AGG_TIMEOUT) |
+			 FIELD_PREP(MT_WL_RX_AGG_LMT,
+				    MT792X_USB_RX_AGG_LIMIT));
+		mt76_rmw(dev, MT_UDMA_WLCFG_1, MT_WL_RX_AGG_PKT_LMT,
+			 FIELD_PREP(MT_WL_RX_AGG_PKT_LMT,
+				    MT792X_USB_RX_AGG_PKT_LIMIT));
+	} else {
+		mt76_clear(dev, MT_UDMA_WLCFG_0, MT_WL_RX_AGG_EN |
+			   MT_WL_RX_AGG_TO | MT_WL_RX_AGG_LMT);
+		mt76_clear(dev, MT_UDMA_WLCFG_1, MT_WL_RX_AGG_PKT_LMT);
+	}
 
 	if (resume)
 		return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index cab36630c978..cbdd663fbb25 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -371,6 +371,14 @@ mt76u_refill_rx(struct mt76_dev *dev, struct mt76_queue *q,
 		return mt76u_fill_rx_sg(dev, q, urb, nsgs);
 
 	urb->transfer_buffer_length = q->buf_size;
+	if (qid == MT_RXQ_MAIN && dev->usb.rx_aggr.enable) {
+		if (!urb->transfer_buffer)
+			urb->transfer_buffer =
+				mt76_get_page_pool_buf(q, &offset, q->buf_size);
+
+		return urb->transfer_buffer ? 0 : -ENOMEM;
+	}
+
 	urb->transfer_buffer = mt76_get_page_pool_buf(q, &offset, q->buf_size);
 
 	return urb->transfer_buffer ? 0 : -ENOMEM;
@@ -538,18 +546,113 @@ mt76u_build_rx_skb(struct mt76_dev *dev, void *data,
 	return skb;
 }
 
+static struct sk_buff *
+mt76u_build_rx_skb_aggr(struct mt76_dev *dev, void *data, int data_len,
+			int buf_len)
+{
+	int head_room, drv_flags = dev->drv->drv_flags;
+	int len = min_t(int, data_len, MT_SKB_HEAD_LEN);
+	struct sk_buff *skb;
+
+	if (data_len <= 0)
+		return NULL;
+
+	head_room = drv_flags & MT_DRV_RX_DMA_HDR ? 0 : MT_DMA_HDR_LEN;
+	skb = alloc_skb(len, GFP_ATOMIC);
+	if (!skb)
+		return NULL;
+
+	data += head_room;
+	skb_put_data(skb, data, len);
+	if (data_len > len) {
+		struct page *page;
+
+		data += len;
+		page = virt_to_head_page(data);
+		skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
+				page, data - page_address(page),
+				data_len - len, buf_len);
+		get_page(page);
+	}
+
+	return skb;
+}
+
+static int mt76u_process_rx_agg_entry(struct mt76_dev *dev, struct urb *urb)
+{
+	int offset = 0, head_room, drv_flags = dev->drv->drv_flags;
+	int align = dev->usb.rx_aggr.align ?: 4;
+	int padding = dev->usb.rx_aggr.padding ?: 4;
+	u8 *data = urb->transfer_buffer;
+	int min_len;
+	int nframes = 0;
+
+	if (!test_bit(MT76_STATE_INITIALIZED, &dev->phy.state) ||
+	    test_bit(MT76_REMOVED, &dev->phy.state))
+		return 0;
+
+	head_room = drv_flags & MT_DRV_RX_DMA_HDR ? 0 : MT_DMA_HDR_LEN;
+	min_len = head_room + MT_RX_RXWI_LEN;
+
+	while (urb->actual_length - offset >= min_len) {
+		struct sk_buff *skb;
+		int len, frame_len, agg_len;
+
+		len = mt76u_get_rx_entry_len(dev, data + offset,
+					     urb->actual_length - offset);
+		if (len < 0) {
+			dev_warn_ratelimited(dev->dev,
+					     "invalid USB RX aggregate at offset %d\n",
+					     offset);
+			break;
+		}
+
+		frame_len = head_room + len;
+		if (frame_len > urb->actual_length - offset) {
+			dev_warn_ratelimited(dev->dev,
+					     "truncated USB RX aggregate at offset %d\n",
+					     offset);
+			break;
+		}
+
+		agg_len = ALIGN(frame_len, align) + padding;
+		if (dev->drv->rx_check &&
+		    !dev->drv->rx_check(dev, data + offset + head_room, len))
+			goto next;
+
+		skb = mt76u_build_rx_skb_aggr(dev, data + offset, len,
+					      agg_len);
+		if (skb) {
+			dev->drv->rx_skb(dev, MT_RXQ_MAIN, skb, NULL);
+			nframes++;
+		}
+
+next:
+		offset += agg_len;
+	}
+
+	mt76_put_page_pool_buf(urb->transfer_buffer, false);
+	urb->transfer_buffer = NULL;
+
+	return max(nframes, 1);
+}
+
 static int
 mt76u_process_rx_entry(struct mt76_dev *dev, struct urb *urb,
-		       int buf_size)
+		       enum mt76_rxq_id qid, int buf_size)
 {
 	u8 *data = urb->num_sgs ? sg_virt(&urb->sg[0]) : urb->transfer_buffer;
 	int data_len = urb->num_sgs ? urb->sg[0].length : urb->actual_length;
 	int len, nsgs = 1, head_room, drv_flags = dev->drv->drv_flags;
 	struct sk_buff *skb;
 
-	if (!test_bit(MT76_STATE_INITIALIZED, &dev->phy.state))
+	if (!test_bit(MT76_STATE_INITIALIZED, &dev->phy.state) ||
+	    test_bit(MT76_REMOVED, &dev->phy.state))
 		return 0;
 
+	if (qid == MT_RXQ_MAIN && dev->usb.rx_aggr.enable && !urb->num_sgs)
+		return mt76u_process_rx_agg_entry(dev, urb);
+
 	len = mt76u_get_rx_entry_len(dev, data, urb->actual_length);
 	if (len < 0)
 		return 0;
@@ -594,6 +697,9 @@ static void mt76u_complete_rx(struct urb *urb)
 
 	trace_rx_urb(dev, urb);
 
+	if (test_bit(MT76_REMOVED, &dev->phy.state))
+		return;
+
 	switch (urb->status) {
 	case -ECONNRESET:
 	case -ESHUTDOWN:
@@ -658,12 +764,14 @@ mt76u_process_rx_queue(struct mt76_dev *dev, struct mt76_queue *q)
 		if (!urb)
 			break;
 
-		count = mt76u_process_rx_entry(dev, urb, q->buf_size);
+		count = mt76u_process_rx_entry(dev, urb, qid, q->buf_size);
 		if (count > 0) {
 			err = mt76u_refill_rx(dev, q, urb, count);
 			if (err < 0)
 				break;
 		}
+		if (test_bit(MT76_REMOVED, &dev->phy.state))
+			break;
 		mt76u_submit_rx_buf(dev, qid, urb);
 	}
 }
@@ -729,10 +837,6 @@ mt76u_alloc_rx_queue(struct mt76_dev *dev, enum mt76_rxq_id qid)
 	struct mt76_queue *q = &dev->q_rx[qid];
 	int i, err;
 
-	err = mt76_create_page_pool(dev, q);
-	if (err)
-		return err;
-
 	spin_lock_init(&q->lock);
 	q->entry = devm_kcalloc(dev->dev,
 				MT_NUM_RX_ENTRIES, sizeof(*q->entry),
@@ -742,6 +846,12 @@ mt76u_alloc_rx_queue(struct mt76_dev *dev, enum mt76_rxq_id qid)
 
 	q->ndesc = MT_NUM_RX_ENTRIES;
 	q->buf_size = PAGE_SIZE;
+	if (qid == MT_RXQ_MAIN && dev->usb.rx_aggr.enable)
+		q->buf_size = dev->usb.rx_aggr.buf_size ?: PAGE_SIZE;
+
+	err = mt76_create_page_pool(dev, q);
+	if (err)
+		return err;
 
 	for (i = 0; i < q->ndesc; i++) {
 		err = mt76u_rx_urb_alloc(dev, q, &q->entry[i]);
-- 
2.43.0


