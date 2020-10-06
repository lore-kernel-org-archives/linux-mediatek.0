Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23226C41604
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 05:52:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2BFE2078A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 05:52:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DAwkCzLL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iu2qxx7n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2BFE2078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S7HCp/vGzoBD3MxweDJIQPgsshQD1ScwcYwQ6+moHR8=; b=DAwkCzLLtcEaDk7WnCBFEBBet
	UbzRi35B3BbhI8jXAHalNGyuZ8rkeQnF5aLaBKOZZV91EBC2u320RgNsFDULQxPIifmyNLQSHUexr
	VLa8OD23sBtt7EKIrAfUQfiy94jp4Hjokj1YEUJD+MLtpa7BzQQYt74JRMLC4ZXQPgWpbBtG0O+Sj
	zToKnDTLVz9bBzxcFwCzy8YULe2jVHxabNW9zrbDjqYLtNhHzZNdZbcR4vv+of48XBxfQhU1yqKAI
	fVQKxsXu3cNlf3O0NMm8fkym6WkrtL6JXUMu1dETi33d6+yBynVcQYvaqOE1vaDVM+qfdbvTSSWHI
	H7tTdjMNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPftL-0005Hz-KB; Tue, 06 Oct 2020 05:52:03 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPftJ-0005Gh-0s; Tue, 06 Oct 2020 05:52:01 +0000
Received: by mail-pl1-x642.google.com with SMTP id c6so677727plr.9;
 Mon, 05 Oct 2020 22:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L9S6dNgcY2hOWdZzm9r/z3rxfbvgfnUp4lHemfjXmvs=;
 b=iu2qxx7nqszWCRF/0Wc5RWPNPoD6uWpkxddKEUAPCelJuijptrzlh78J0XtBpJ/Y+E
 9fengwvC+qDHKnHhBKasCJ3OMsiw731lPe/bOQqcRpawALLukCuO5+8nqFCFaqtZroyX
 oyfKJdpmkeoJsbr4EcGF9eyUAEuI1yr6jZwcK4w0vrEBMUqcHPTWh3NIapGQ4ApGE2u3
 uPGDl8OypCkyQZ3HvuRapMd4N4lMqr3Ywnz4qkVDgQaMMoCWGymKnxUe92GVsT6e6ePu
 RJwj86ebQ8n4lQkiXLdxz7sLUDHr84T8g25iHcansB0SjgDlQPkBwo4HDrH82not8IM4
 D1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L9S6dNgcY2hOWdZzm9r/z3rxfbvgfnUp4lHemfjXmvs=;
 b=sekxB4+BJjDXJPAFbqelMxKCwethEvUOhSmiGs8ecGsEQZa4JgnkXJ3jM7usGOIX3F
 3/vxtPAxDfzf5KaWBkzB+7+7eWgCDEvNm/P/wvsk5KbEOYyosxlrmekjwe8x0Fecekb6
 cZ42vo8jePj+kpPPftcmuNOwYUKhO3JMML6+9+0tnuN6Q0SiPhNfazzT8FiobR16FtLm
 hhedm0DFvah7+EQJNzG31LWp4Hx41P/XOi92kmsO4CcPRSbKSEZhq4HzjZUf3FArELqL
 XGII2J9SJr/cyWcQLZD/Ts3iHr+ucskHOy99jxWvP5di3J+6znp9ftDwKmMZyc48oL9i
 I9Xw==
X-Gm-Message-State: AOAM532cpXnA07L29lG28EPe3YDfX2+A5U6ofP50RcyXRmFET6Nyyoaf
 FWbYJikBXTGazq8IXUT3xDE=
X-Google-Smtp-Source: ABdhPJwLArF02FLz+1MhlLzLJSH3pT/uoCnd7tqx1KSkSIlECAJ4Kk6LiGFN98LVaU5APUTdOr8LGQ==
X-Received: by 2002:a17:902:c394:b029:d2:4ca:2e22 with SMTP id
 g20-20020a170902c394b02900d204ca2e22mr1817746plg.77.1601963519051; 
 Mon, 05 Oct 2020 22:51:59 -0700 (PDT)
Received: from localhost.localdomain ([49.207.203.202])
 by smtp.gmail.com with ESMTPSA id x6sm1413685pjp.25.2020.10.05.22.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 22:51:58 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: kvalo@codeaurora.org
Subject: [PATCH 2/2] wireless: mt76: convert tasklets to use new
 tasklet_setup() API
Date: Tue,  6 Oct 2020 11:21:35 +0530
Message-Id: <20201006055135.291411-3-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201006055135.291411-1-allen.lkml@gmail.com>
References: <20201006055135.291411-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_015201_098573_36E13EB5 
X-CRM114-Status: GOOD (  16.61  )
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
Cc: ryder.lee@mediatek.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, kuba@kernel.org,
 Romain Perier <romain.perier@gmail.com>,
 Allen Pais <apais@linux.microsoft.com>, davem@davemloft.net, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Allen Pais <apais@linux.microsoft.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <apais@linux.microsoft.com>
---
 drivers/net/wireless/mediatek/mt76/mt7603/beacon.c |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt7603/init.c   |  3 +--
 drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h |  2 +-
 drivers/net/wireless/mediatek/mt76/mt7615/mmio.c   |  6 +++---
 drivers/net/wireless/mediatek/mt76/mt76x02_dfs.c   | 10 +++++-----
 drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c  |  7 +++----
 drivers/net/wireless/mediatek/mt76/usb.c           |  6 +++---
 drivers/net/wireless/mediatek/mt7601u/dma.c        | 12 ++++++------
 8 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c b/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
index d728c5e43..53c229cad 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/beacon.c
@@ -64,9 +64,9 @@ mt7603_add_buffered_bc(void *priv, u8 *mac, struct ieee80211_vif *vif)
 	data->count[mvif->idx]++;
 }
 
-void mt7603_pre_tbtt_tasklet(unsigned long arg)
+void mt7603_pre_tbtt_tasklet(struct tasklet_struct *t)
 {
-	struct mt7603_dev *dev = (struct mt7603_dev *)arg;
+	struct mt7603_dev *dev = from_tasklet(dev, t, mt76.pre_tbtt_tasklet);
 	struct mt76_queue *q;
 	struct beacon_bc_data data = {};
 	struct sk_buff *skb;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/init.c b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
index c4848fafd..126f7c95f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/init.c
@@ -533,8 +533,7 @@ int mt7603_register_device(struct mt7603_dev *dev)
 	spin_lock_init(&dev->ps_lock);
 
 	INIT_DELAYED_WORK(&dev->mt76.mac_work, mt7603_mac_work);
-	tasklet_init(&dev->mt76.pre_tbtt_tasklet, mt7603_pre_tbtt_tasklet,
-		     (unsigned long)dev);
+	tasklet_setup(&dev->mt76.pre_tbtt_tasklet, mt7603_pre_tbtt_tasklet);
 
 	dev->slottime = 9;
 	dev->sensitivity_limit = 28;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
index 2a6e4332a..6e0a92a28 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mt7603.h
@@ -256,7 +256,7 @@ void mt7603_sta_assoc(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 void mt7603_sta_remove(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta);
 
-void mt7603_pre_tbtt_tasklet(unsigned long arg);
+void mt7603_pre_tbtt_tasklet(struct tasklet_struct *t);
 
 void mt7603_update_channel(struct mt76_dev *mdev);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
index 6de492a4c..b108324aa 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mmio.c
@@ -98,9 +98,9 @@ static irqreturn_t mt7615_irq_handler(int irq, void *dev_instance)
 	return IRQ_HANDLED;
 }
 
-static void mt7615_irq_tasklet(unsigned long data)
+static void mt7615_irq_tasklet(struct tasklet_struct *t)
 {
-	struct mt7615_dev *dev = (struct mt7615_dev *)data;
+	struct mt7615_dev *dev = from_tasklet(dev, t, irq_tasklet);
 	u32 intr, mask = 0, tx_mcu_mask = mt7615_tx_mcu_int_mask(dev);
 
 	mt76_wr(dev, MT_INT_MASK_CSR, 0);
@@ -203,7 +203,7 @@ int mt7615_mmio_probe(struct device *pdev, void __iomem *mem_base,
 
 	dev = container_of(mdev, struct mt7615_dev, mt76);
 	mt76_mmio_init(&dev->mt76, mem_base);
-	tasklet_init(&dev->irq_tasklet, mt7615_irq_tasklet, (unsigned long)dev);
+	tasklet_setup(&dev->irq_tasklet, mt7615_irq_tasklet);
 
 	dev->reg_map = map;
 	dev->ops = ops;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_dfs.c b/drivers/net/wireless/mediatek/mt76/mt76x02_dfs.c
index b29cd39dc..a60135053 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_dfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_dfs.c
@@ -609,10 +609,11 @@ static void mt76x02_dfs_check_event_window(struct mt76x02_dev *dev)
 	}
 }
 
-static void mt76x02_dfs_tasklet(unsigned long arg)
+static void mt76x02_dfs_tasklet(struct tasklet_struct *t)
 {
-	struct mt76x02_dev *dev = (struct mt76x02_dev *)arg;
-	struct mt76x02_dfs_pattern_detector *dfs_pd = &dev->dfs_pd;
+	struct mt76x02_dfs_pattern_detector *dfs_pd = from_tasklet(dfs_pd, t,
+								   dfs_tasklet);
+	struct mt76x02_dev *dev = container_of(dfs_pd, typeof(*dev), dfs_pd);
 	u32 engine_mask;
 	int i;
 
@@ -860,8 +861,7 @@ void mt76x02_dfs_init_detector(struct mt76x02_dev *dev)
 	INIT_LIST_HEAD(&dfs_pd->seq_pool);
 	dev->mt76.region = NL80211_DFS_UNSET;
 	dfs_pd->last_sw_check = jiffies;
-	tasklet_init(&dfs_pd->dfs_tasklet, mt76x02_dfs_tasklet,
-		     (unsigned long)dev);
+	tasklet_setup(&dfs_pd->dfs_tasklet, mt76x02_dfs_tasklet);
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
index cf68731bd..67911c021 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x02_mmio.c
@@ -11,9 +11,9 @@
 #include "mt76x02_mcu.h"
 #include "trace.h"
 
-static void mt76x02_pre_tbtt_tasklet(unsigned long arg)
+static void mt76x02_pre_tbtt_tasklet(struct tasklet_struct *t)
 {
-	struct mt76x02_dev *dev = (struct mt76x02_dev *)arg;
+	struct mt76x02_dev *dev = from_tasklet(dev, t, mt76.pre_tbtt_tasklet);
 	struct mt76_queue *q = dev->mt76.q_tx[MT_TXQ_PSD];
 	struct beacon_bc_data data = {};
 	struct sk_buff *skb;
@@ -198,8 +198,7 @@ int mt76x02_dma_init(struct mt76x02_dev *dev)
 		return -ENOMEM;
 
 	dev->mt76.tx_worker.fn = mt76x02_tx_worker;
-	tasklet_init(&dev->mt76.pre_tbtt_tasklet, mt76x02_pre_tbtt_tasklet,
-		     (unsigned long)dev);
+	tasklet_setup(&dev->mt76.pre_tbtt_tasklet, mt76x02_pre_tbtt_tasklet);
 
 	spin_lock_init(&dev->txstatus_fifo_lock);
 	kfifo_init(&dev->txstatus_fifo, status_fifo, fifo_size);
diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index 7d3f0a2e5..911fb61df 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -669,9 +669,9 @@ mt76u_process_rx_queue(struct mt76_dev *dev, struct mt76_queue *q)
 		mt76_rx_poll_complete(dev, MT_RXQ_MAIN, NULL);
 }
 
-static void mt76u_rx_tasklet(unsigned long data)
+static void mt76u_rx_tasklet(struct tasklet_struct *t)
 {
-	struct mt76_dev *dev = (struct mt76_dev *)data;
+	struct mt76_dev *dev = from_tasklet(dev, t, usb.rx_tasklet);
 	int i;
 
 	rcu_read_lock();
@@ -1110,7 +1110,7 @@ int mt76u_init(struct mt76_dev *dev,
 	mt76u_ops.write_copy = ext ? mt76u_copy_ext : mt76u_copy;
 
 	dev->tx_worker.fn = mt76u_tx_worker;
-	tasklet_init(&usb->rx_tasklet, mt76u_rx_tasklet, (unsigned long)dev);
+	tasklet_setup(&usb->rx_tasklet, mt76u_rx_tasklet);
 	INIT_WORK(&usb->stat_work, mt76u_tx_status_data);
 
 	usb->data_len = usb_maxpacket(udev, usb_sndctrlpipe(udev, 0), 1);
diff --git a/drivers/net/wireless/mediatek/mt7601u/dma.c b/drivers/net/wireless/mediatek/mt7601u/dma.c
index 09f931d45..5f99054f5 100644
--- a/drivers/net/wireless/mediatek/mt7601u/dma.c
+++ b/drivers/net/wireless/mediatek/mt7601u/dma.c
@@ -212,9 +212,9 @@ static void mt7601u_complete_rx(struct urb *urb)
 	spin_unlock_irqrestore(&dev->rx_lock, flags);
 }
 
-static void mt7601u_rx_tasklet(unsigned long data)
+static void mt7601u_rx_tasklet(struct tasklet_struct *t)
 {
-	struct mt7601u_dev *dev = (struct mt7601u_dev *) data;
+	struct mt7601u_dev *dev = from_tasklet(dev, t, rx_tasklet);
 	struct mt7601u_dma_buf_rx *e;
 
 	while ((e = mt7601u_rx_get_pending_entry(dev))) {
@@ -266,9 +266,9 @@ static void mt7601u_complete_tx(struct urb *urb)
 	spin_unlock_irqrestore(&dev->tx_lock, flags);
 }
 
-static void mt7601u_tx_tasklet(unsigned long data)
+static void mt7601u_tx_tasklet(struct tasklet_struct *t)
 {
-	struct mt7601u_dev *dev = (struct mt7601u_dev *) data;
+	struct mt7601u_dev *dev = from_tasklet(dev, t, tx_tasklet);
 	struct sk_buff_head skbs;
 	unsigned long flags;
 
@@ -507,8 +507,8 @@ int mt7601u_dma_init(struct mt7601u_dev *dev)
 {
 	int ret = -ENOMEM;
 
-	tasklet_init(&dev->tx_tasklet, mt7601u_tx_tasklet, (unsigned long) dev);
-	tasklet_init(&dev->rx_tasklet, mt7601u_rx_tasklet, (unsigned long) dev);
+	tasklet_setup(&dev->tx_tasklet, mt7601u_tx_tasklet);
+	tasklet_setup(&dev->rx_tasklet, mt7601u_rx_tasklet);
 
 	ret = mt7601u_alloc_tx(dev);
 	if (ret)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
