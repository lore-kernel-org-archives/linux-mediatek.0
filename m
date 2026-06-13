Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD43CD8CA8
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 22:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rh/2Eq507HykjFUSyM79lweTsoPJN45Ln2Hf87GqCWg=; b=tcmBo4ixpQJ6Hf048eO6+LArn8
	h2P4rYdzXYeOMKsi8YpbKOuQqLmDAi4i1Z6xCmC9C7hGlBCjXkmq5L8opUoPfFHjPf4HrZE3kvExO
	2AvjuxDsajpZjxY/8Behn1hoGO7veTczC0tbtaGzAxLpvVk+yRtbXO3xXo4Qwr62vHOUc/H3MnoLm
	iLyciFdJPB+dpZ2yo8XCPwU8/9qS3bLGFDok9MDmEpfYU3Yj6vQfc8oOeWGj6Gckc0RpRQvseUocx
	OUSdzlCKsxeCkEleG1o6dcXDpFLiekcOxu93nh0CgIGnwk2j47cZazivQd8h6hMbN3y3PAEmuH9e2
	L3HoGiTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX8N-0000000CaOJ-3Ul3;
	Sat, 13 Jun 2026 22:47:23 +0000
Received: from mail-dl1-f43.google.com ([74.125.82.43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX8J-0000000CaMK-3gX5
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 22:47:23 +0000
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-13810b63a1aso5089084c88.1
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 15:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781390839; x=1781995639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rh/2Eq507HykjFUSyM79lweTsoPJN45Ln2Hf87GqCWg=;
        b=XdBnX3Yf4Ce28cG90lqGHA/Pa7QOINdPLySpvel3AKRjVmwZukHf991+aWhL8R+wTQ
         G/oPK3tKFRnSDiGlsTUHvXbNUJa+YBntJxYZ07H7cv84LwbnkHMXd6qfy/FEMboaw5sa
         R3NqpLqNnQMXTDvFE9MDiXV3E+2dapIQyJBguMJfNMSD2fnJFg7diogs+PTERE+DDSY3
         Kgl7gdIPLAL+aTGvrqbPIjw3w7MkW7jvIqh84tBmttZOnO5SJ+62ouGoAqtZeCT+lw9j
         /4FABMPT6nFyljMq8cXJ553sDNMiJCbfvw6XUExdyQQnuOunt2iphcBbs2BIsXDhcsmR
         7Uew==
X-Forwarded-Encrypted: i=1; AFNElJ8v6T5pYmCeTuPhaeyzQhZ49+2FeSMMqheBhGh9UxR2++k5pVnh/iJ8sSL5Y05L5t/BDMeC5Rtot4cYWALDyA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw//2xX2Knps8frF+kfz+T8jDnD79iSApwZ60vNXGSp5sklCTTD
	7rjXqFBiazdZ7DRO3q4sCZDDegvTc4LKLFcCgyqa990D37E7UWvuLXca
X-Gm-Gg: Acq92OGt6iDphoI4qsX4tSYydebHegO9GlrLuWBBufOemdL17FytZVUxc6xtsDj9lxP
	+V3v5diUAKU8urpbYUu+X5xKXIOp9aWY7ZOeS3Ju/TN1uCqckmOSCN5KCn+A8YrnKL7yChh5mrU
	7FHkxqVFEa0X7qy6tDWsBc6DGAGHvNPi7Aavo734t2nAD6rmKjkidDXiFLc+h0xBTV6SDFhkg9t
	y+OrfDlE1NtI/4V8Cqoj5n1YPYJUY8pmsvWca/O9qxz067OqlLeD1QMKOG1R7Swi91TLiKOvUuk
	ZRq4y3c/ZcMpmTf7EZJtOQ+WDz3nw6xKGGUAq/sud7uSXasMgXUDc57RmbqA3skAtst70DnCLlx
	lb0CRxVmI7rj2ygjJSHjOnZeBwhapEeWwUvCiXdH/Zt8khuYanW8L3uB+ABrvpLBFB+tt9W4Xfl
	F2lmqoNlS1nqYb9I6fqhl5zNLIsiB7jCvklyfGsLX+0VYr3BWM9BjI0huMI9lpyjPRIDDXLJ9ij
	G8sE+/z4C5OM+/pZnE7bh9DvmV9LVlfAwZkQAl4SfQ6QvYCLUQ=
X-Received: by 2002:a05:7022:f82:b0:12d:d972:b96e with SMTP id a92af1059eb24-1384bba8b3amr3914654c88.20.1781390839035;
        Sat, 13 Jun 2026 15:47:19 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b97bf09sm6345380c88.14.2026.06.13.15.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:47:18 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 4/5] wifi: mt76: usb: add debugfs aggregation stats
Date: Sat, 13 Jun 2026 17:46:54 -0500
Message-ID: <20260613224655.2405686-5-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613224655.2405686-1-sean.wang@kernel.org>
References: <20260613224655.2405686-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_154720_391827_EF76DA1A 
X-CRM114-Status: GOOD (  13.26  )
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

Add USB debugfs counters for RX/TX URBs, packets, bytes and recent RX
aggregation frame counts.

These stats make it easier to verify whether USB RX aggregation are working
as expected, and to debug throughput issues without adding
temporary driver logs.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/debugfs.c | 35 ++++++++++++++++++
 drivers/net/wireless/mediatek/mt76/mt76.h    | 12 ++++++
 drivers/net/wireless/mediatek/mt76/usb.c     | 39 ++++++++++++++++++++
 3 files changed, 86 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/debugfs.c b/drivers/net/wireless/mediatek/mt76/debugfs.c
index a5ac6ca86735..b3f1bc3cd69b 100644
--- a/drivers/net/wireless/mediatek/mt76/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/debugfs.c
@@ -88,6 +88,38 @@ static int mt76_rx_queues_read(struct seq_file *s, void *data)
 	return 0;
 }
 
+static int mt76_usb_stats_read(struct seq_file *s, void *data)
+{
+	struct mt76_dev *dev = dev_get_drvdata(s->private);
+	struct mt76_usb *usb = &dev->usb;
+	u64 seq;
+	int i, n;
+
+	seq_printf(s, "rx_aggr\t%d\n", usb->rx_aggr.enable);
+	seq_printf(s, "sg_en\t%d\n", usb->sg_en);
+	seq_printf(s, "tx_urbs\t%lld\n", atomic64_read(&usb->stats.tx_urbs));
+	seq_printf(s, "tx_packets\t%lld\n",
+		   atomic64_read(&usb->stats.tx_packets));
+	seq_printf(s, "tx_bytes\t%lld\n", atomic64_read(&usb->stats.tx_bytes));
+	seq_printf(s, "rx_urbs\t%lld\n", atomic64_read(&usb->stats.rx_urbs));
+	seq_printf(s, "rx_packets\t%lld\n",
+		   atomic64_read(&usb->stats.rx_packets));
+	seq_printf(s, "rx_bytes\t%lld\n", atomic64_read(&usb->stats.rx_bytes));
+
+	seq = atomic64_read(&usb->stats.rx_aggr_seq);
+	seq_puts(s, "rx_aggr_nframes");
+	n = min_t(u64, seq, MT_USB_AGGR_STATS_LEN);
+	for (i = 0; i < n; i++) {
+		u64 idx = seq - n + i;
+		u64 slot = idx % MT_USB_AGGR_STATS_LEN;
+
+		seq_printf(s, " %u", READ_ONCE(usb->stats.rx_aggr_nframes[slot]));
+	}
+	seq_puts(s, "\n");
+
+	return 0;
+}
+
 void mt76_seq_puts_array(struct seq_file *file, const char *str,
 			 s8 *val, int len)
 {
@@ -120,6 +152,9 @@ mt76_register_debugfs_fops(struct mt76_phy *phy,
 		debugfs_create_blob("otp", 0400, dir, &dev->otp);
 	debugfs_create_devm_seqfile(dev->dev, "rx-queues", dir,
 				    mt76_rx_queues_read);
+	if (mt76_is_usb(dev))
+		debugfs_create_devm_seqfile(dev->dev, "usb-stats", dir,
+					    mt76_usb_stats_read);
 
 	return dir;
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 125c97dc1f28..c11a463ae092 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -664,6 +664,7 @@ struct mt76u_rx_entry {
 #define MT_RX_SG_MAX_SIZE	4
 #define MT_NUM_TX_ENTRIES	256
 #define MT_NUM_RX_ENTRIES	128
+#define MT_USB_AGGR_STATS_LEN	128
 #define MCU_RESP_URB_SIZE	1024
 struct mt76_usb {
 	struct mutex usb_ctrl_mtx;
@@ -687,6 +688,17 @@ struct mt76_usb {
 		int buf_size;
 	} rx_aggr;
 
+	struct {
+		atomic64_t tx_urbs;
+		atomic64_t tx_packets;
+		atomic64_t tx_bytes;
+		atomic64_t rx_urbs;
+		atomic64_t rx_packets;
+		atomic64_t rx_bytes;
+		atomic64_t rx_aggr_seq;
+		u8 rx_aggr_nframes[MT_USB_AGGR_STATS_LEN];
+	} stats;
+
 	struct mt76u_mcu {
 		u8 *data;
 		/* multiple reads */
diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index cbdd663fbb25..10ad2b024985 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -15,6 +15,36 @@ static bool disable_usb_sg;
 module_param_named(disable_usb_sg, disable_usb_sg, bool, 0644);
 MODULE_PARM_DESC(disable_usb_sg, "Disable usb scatter-gather support");
 
+static void mt76u_tx_stats_add(struct mt76_dev *dev, struct urb *urb,
+			       unsigned int packets)
+{
+	atomic64_inc(&dev->usb.stats.tx_urbs);
+	atomic64_add(packets, &dev->usb.stats.tx_packets);
+	atomic64_add(urb->transfer_buffer_length, &dev->usb.stats.tx_bytes);
+}
+
+static void mt76u_rx_urb_stats_add(struct mt76_dev *dev, struct urb *urb)
+{
+	atomic64_inc(&dev->usb.stats.rx_urbs);
+	atomic64_add(urb->actual_length, &dev->usb.stats.rx_bytes);
+}
+
+static void mt76u_rx_packet_stats_add(struct mt76_dev *dev,
+				      unsigned int packets)
+{
+	atomic64_add(packets, &dev->usb.stats.rx_packets);
+}
+
+static void mt76u_rx_aggr_stats_add(struct mt76_dev *dev, unsigned int packets)
+{
+	u64 idx, slot;
+
+	idx = atomic64_inc_return(&dev->usb.stats.rx_aggr_seq) - 1;
+	slot = idx % MT_USB_AGGR_STATS_LEN;
+	WRITE_ONCE(dev->usb.stats.rx_aggr_nframes[slot],
+		   min_t(unsigned int, packets, U8_MAX));
+}
+
 int __mt76u_vendor_request(struct mt76_dev *dev, u8 req, u8 req_type,
 			   u16 val, u16 offset, void *buf, size_t len)
 {
@@ -634,6 +664,10 @@ static int mt76u_process_rx_agg_entry(struct mt76_dev *dev, struct urb *urb)
 	mt76_put_page_pool_buf(urb->transfer_buffer, false);
 	urb->transfer_buffer = NULL;
 
+	if (nframes)
+		mt76u_rx_packet_stats_add(dev, nframes);
+	mt76u_rx_aggr_stats_add(dev, nframes);
+
 	return max(nframes, 1);
 }
 
@@ -681,6 +715,7 @@ mt76u_process_rx_entry(struct mt76_dev *dev, struct urb *urb,
 
 	skb_mark_for_recycle(skb);
 	dev->drv->rx_skb(dev, MT_RXQ_MAIN, skb, NULL);
+	mt76u_rx_packet_stats_add(dev, 1);
 
 	return nsgs;
 }
@@ -714,6 +749,9 @@ static void mt76u_complete_rx(struct urb *urb)
 		break;
 	}
 
+	if (!urb->status)
+		mt76u_rx_urb_stats_add(dev, urb);
+
 	spin_lock_irqsave(&q->lock, flags);
 	idx = e - q->entry;
 	pending = q->ndesc - q->queued;
@@ -1083,6 +1121,7 @@ static void mt76u_tx_kick(struct mt76_dev *dev, struct mt76_queue *q)
 					err);
 			break;
 		}
+		mt76u_tx_stats_add(dev, urb, 1);
 		q->first = (q->first + 1) % q->ndesc;
 	}
 }
-- 
2.43.0


