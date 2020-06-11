Return-Path: <SRS0=zMKO=7Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC9FC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 14:02:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F0F4206C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2020 14:02:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CPQeqNL7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="n5+Ok7nJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F0F4206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oYBCxB/gzSjfvheCDMJ77dHZI1s9t/5B5pOGUJu6wfM=; b=CPQeqNL7DLfpjD
	j0L2DL9Xlw2ACgDFNb9q7Sr4Dnaxv92A01VHUx9x28mPZSgN6dlqyCZYwp8MZImJI2lufiCokG2Yg
	/GKBygVb/d+VXo3AW8aVIMWfn2hg1Zezxd/9WbPZgGwvonAkySBKevFGYNMzxAcwTg2KiGAyk/zaG
	XYm4l8Yjv+LAOsZxvwWkzd9+X3SV2qrIF/gQ53XqyxTPWzKTKHGMWU2+qJk6AhjfY7jMax6ytnelC
	CLsCPvi0YRZGAlGjKSG4Xi/sOBA2+aq2VBKZ5Y/tKXdB+6eLkda9YI3iGjnBl7Dt0mDE9ZOrrIRtp
	TZm5Lae2uQO1cpZnfa5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjNmE-0005mP-Sn; Thu, 11 Jun 2020 14:01:54 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjNmC-0005ll-5p
 for linux-mediatek@lists.infradead.org; Thu, 11 Jun 2020 14:01:53 +0000
Received: by mail-wm1-x344.google.com with SMTP id u13so5084084wml.1
 for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2020 07:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BkNnx+PJ4tEldkFE6NmGlbgnjVg2aGw3VhchR9OtaZw=;
 b=n5+Ok7nJ1Ld/w/7Po5tTgIg8khBvF2s7B4dF3iaf+dDI8f0kQUt9RRFUQ3/rjW4pjE
 D+g/9FREe+gmve3Mr2TykH97UBYHXWt5bL4O9GWAOueL27DPI2HXycc/Ts3nJXIslckn
 oraBFf1U8oWqH0DIRzC9ugtDfmz1gHnKmMQkeJEopugoikKPyF85BMOGj/MQJTnhqde3
 saUGkkSTzvlD5YpPjlJVwZPBoo7ZcqFNzl5nhj8/SOy8KRvTag6vgU6+OPIoR29JORt8
 s99sJ4V0DjoVCQrxu6oTqwXKIWCHaCo95r23NHAKCfxrO3svZkwOvW6RHh6g4yZLwRLT
 fQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BkNnx+PJ4tEldkFE6NmGlbgnjVg2aGw3VhchR9OtaZw=;
 b=NDtmaJo61LyW9naJyEXilPiPUrK6bBp2Az1WCsVuZ3VFFUipzpvE9h3Vu6GUKXsEvd
 vzufC324KT1tlu4/OPdNXFA5piEeOd7Hx/JUzm8QC8uU1hDi0DwBr4Z7H9kllU8aCB4f
 iMP1DGo/zsZmTH+lGfi5ZS8C210EnUZ+DQTIlZ1JxMh1rM14pn3W2LYpglYj9PHGFAjD
 D6a4LK9hur1tlK6s4iuvtJEOQbep0RaQq8wcXJtpyQvr02NOfI49N/KwUSuPAqnNb3V/
 8H+zG+AMo5l/7D2blnFnVmq7Np8P872+7stWLBNNTyaq0Y1kKv6NrDfubItLJN3zwstz
 lmJw==
X-Gm-Message-State: AOAM532ZFyed1xSv+jgjaFy5bY1dd4Ciuo28yx4TbLtPl8AHQ69Ae/3c
 IOIqVlQG5rozCjUhjhtCSi2g9A==
X-Google-Smtp-Source: ABdhPJzJTiQTtzCLL7YjE7Ki6AamPyJbUN9TYcNqL++1AxXSzCWNvaw1iqZfoStaFChZgwa3LhbhNw==
X-Received: by 2002:a1c:c908:: with SMTP id f8mr8469246wmb.150.1591884110019; 
 Thu, 11 Jun 2020 07:01:50 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id y5sm5360300wrs.63.2020.06.11.07.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 07:01:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] net: ethernet: mtk-star-emac: simplify interrupt handling
Date: Thu, 11 Jun 2020 16:01:39 +0200
Message-Id: <20200611140139.17702-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_070152_244456_49C05352 
X-CRM114-Status: GOOD (  17.28  )
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
Cc: Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

During development we tried to make the interrupt handling as fine-grained
as possible with TX and RX interrupts being disabled/enabled independently
and the counter registers reset from workqueue context.

Unfortunately after thorough testing of current mainline, we noticed the
driver has become unstable under heavy load. While this is hard to
reproduce, it's quite consistent in the driver's current form.

This patch proposes to go back to the previous approach of doing all
processing in napi context with all interrupts masked in order to make the
driver usable in mainline linux. This doesn't impact the performance on
pumpkin boards at all and it's in line with what many ethernet drivers do
in mainline linux anyway.

At the same time we're adding a FIXME comment about the need to improve
the interrupt handling.

Fixes: 8c7bd5a454ff ("net: ethernet: mtk-star-emac: new driver")
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 118 +++++-------------
 1 file changed, 29 insertions(+), 89 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index f1ace4fec19f..3e765bdcf9e1 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -24,7 +24,6 @@
 #include <linux/regmap.h>
 #include <linux/skbuff.h>
 #include <linux/spinlock.h>
-#include <linux/workqueue.h>
 
 #define MTK_STAR_DRVNAME			"mtk_star_emac"
 
@@ -262,7 +261,6 @@ struct mtk_star_priv {
 	spinlock_t lock;
 
 	struct rtnl_link_stats64 stats;
-	struct work_struct stats_work;
 };
 
 static struct device *mtk_star_get_dev(struct mtk_star_priv *priv)
@@ -432,42 +430,6 @@ static void mtk_star_intr_disable(struct mtk_star_priv *priv)
 	regmap_write(priv->regs, MTK_STAR_REG_INT_MASK, ~0);
 }
 
-static void mtk_star_intr_enable_tx(struct mtk_star_priv *priv)
-{
-	regmap_clear_bits(priv->regs, MTK_STAR_REG_INT_MASK,
-			  MTK_STAR_BIT_INT_STS_TNTC);
-}
-
-static void mtk_star_intr_enable_rx(struct mtk_star_priv *priv)
-{
-	regmap_clear_bits(priv->regs, MTK_STAR_REG_INT_MASK,
-			  MTK_STAR_BIT_INT_STS_FNRC);
-}
-
-static void mtk_star_intr_enable_stats(struct mtk_star_priv *priv)
-{
-	regmap_clear_bits(priv->regs, MTK_STAR_REG_INT_MASK,
-			  MTK_STAR_REG_INT_STS_MIB_CNT_TH);
-}
-
-static void mtk_star_intr_disable_tx(struct mtk_star_priv *priv)
-{
-	regmap_set_bits(priv->regs, MTK_STAR_REG_INT_MASK,
-			MTK_STAR_BIT_INT_STS_TNTC);
-}
-
-static void mtk_star_intr_disable_rx(struct mtk_star_priv *priv)
-{
-	regmap_set_bits(priv->regs, MTK_STAR_REG_INT_MASK,
-			MTK_STAR_BIT_INT_STS_FNRC);
-}
-
-static void mtk_star_intr_disable_stats(struct mtk_star_priv *priv)
-{
-	regmap_set_bits(priv->regs, MTK_STAR_REG_INT_MASK,
-			MTK_STAR_REG_INT_STS_MIB_CNT_TH);
-}
-
 static unsigned int mtk_star_intr_read(struct mtk_star_priv *priv)
 {
 	unsigned int val;
@@ -663,20 +625,6 @@ static void mtk_star_update_stats(struct mtk_star_priv *priv)
 	stats->rx_errors += stats->rx_fifo_errors;
 }
 
-/* This runs in process context and parallel TX and RX paths executing in
- * napi context may result in losing some stats data but this should happen
- * seldom enough to be acceptable.
- */
-static void mtk_star_update_stats_work(struct work_struct *work)
-{
-	struct mtk_star_priv *priv = container_of(work, struct mtk_star_priv,
-						 stats_work);
-
-	mtk_star_update_stats(priv);
-	mtk_star_reset_counters(priv);
-	mtk_star_intr_enable_stats(priv);
-}
-
 static struct sk_buff *mtk_star_alloc_skb(struct net_device *ndev)
 {
 	uintptr_t tail, offset;
@@ -767,42 +715,25 @@ static void mtk_star_free_tx_skbs(struct mtk_star_priv *priv)
 	mtk_star_ring_free_skbs(priv, ring, mtk_star_dma_unmap_tx);
 }
 
-/* All processing for TX and RX happens in the napi poll callback. */
+/* All processing for TX and RX happens in the napi poll callback.
+ *
+ * FIXME: The interrupt handling should be more fine-grained with each
+ * interrupt enabled/disabled independently when needed. Unfortunatly this
+ * turned out to impact the driver's stability and until we have something
+ * working properly, we're disabling all interrupts during TX & RX processing
+ * or when resetting the counter registers.
+ */
 static irqreturn_t mtk_star_handle_irq(int irq, void *data)
 {
 	struct mtk_star_priv *priv;
 	struct net_device *ndev;
-	bool need_napi = false;
-	unsigned int status;
 
 	ndev = data;
 	priv = netdev_priv(ndev);
 
 	if (netif_running(ndev)) {
-		status = mtk_star_intr_read(priv);
-
-		if (status & MTK_STAR_BIT_INT_STS_TNTC) {
-			mtk_star_intr_disable_tx(priv);
-			need_napi = true;
-		}
-
-		if (status & MTK_STAR_BIT_INT_STS_FNRC) {
-			mtk_star_intr_disable_rx(priv);
-			need_napi = true;
-		}
-
-		if (need_napi)
-			napi_schedule(&priv->napi);
-
-		/* One of the counters reached 0x8000000 - update stats and
-		 * reset all counters.
-		 */
-		if (unlikely(status & MTK_STAR_REG_INT_STS_MIB_CNT_TH)) {
-			mtk_star_intr_disable_stats(priv);
-			schedule_work(&priv->stats_work);
-		}
-
-		mtk_star_intr_ack_all(priv);
+		mtk_star_intr_disable(priv);
+		napi_schedule(&priv->napi);
 	}
 
 	return IRQ_HANDLED;
@@ -1169,8 +1100,6 @@ static void mtk_star_tx_complete_all(struct mtk_star_priv *priv)
 	if (wake && netif_queue_stopped(ndev))
 		netif_wake_queue(ndev);
 
-	mtk_star_intr_enable_tx(priv);
-
 	spin_unlock(&priv->lock);
 }
 
@@ -1332,20 +1261,32 @@ static int mtk_star_process_rx(struct mtk_star_priv *priv, int budget)
 static int mtk_star_poll(struct napi_struct *napi, int budget)
 {
 	struct mtk_star_priv *priv;
+	unsigned int status;
 	int received = 0;
 
 	priv = container_of(napi, struct mtk_star_priv, napi);
 
-	/* Clean-up all TX descriptors. */
-	mtk_star_tx_complete_all(priv);
-	/* Receive up to $budget packets. */
-	received = mtk_star_process_rx(priv, budget);
+	status = mtk_star_intr_read(priv);
+	mtk_star_intr_ack_all(priv);
 
-	if (received < budget) {
-		napi_complete_done(napi, received);
-		mtk_star_intr_enable_rx(priv);
+	if (status & MTK_STAR_BIT_INT_STS_TNTC)
+		/* Clean-up all TX descriptors. */
+		mtk_star_tx_complete_all(priv);
+
+	if (status & MTK_STAR_BIT_INT_STS_FNRC)
+		/* Receive up to $budget packets. */
+		received = mtk_star_process_rx(priv, budget);
+
+	if (unlikely(status & MTK_STAR_REG_INT_STS_MIB_CNT_TH)) {
+		mtk_star_update_stats(priv);
+		mtk_star_reset_counters(priv);
 	}
 
+	if (received < budget)
+		napi_complete_done(napi, received);
+
+	mtk_star_intr_enable(priv);
+
 	return received;
 }
 
@@ -1532,7 +1473,6 @@ static int mtk_star_probe(struct platform_device *pdev)
 	ndev->max_mtu = MTK_STAR_MAX_FRAME_SIZE;
 
 	spin_lock_init(&priv->lock);
-	INIT_WORK(&priv->stats_work, mtk_star_update_stats_work);
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
-- 
2.26.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
