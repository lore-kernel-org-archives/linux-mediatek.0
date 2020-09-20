Return-Path: <SRS0=UMOv=C5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B37BBC43465
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2020 23:42:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7143206B7
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2020 23:42:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YoZN9Aep";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="VG6dVd0/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7143206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C0ihqxdevZ6V4vqmHrZEfZxKvjnPXwPHXopmSDJxHvw=; b=YoZN9AepvxomPAxzRD6vc9CyFP
	RJUQD1rESBXLgRqznSb3py6v9p82vFul1VouWUE0CsceOO0XeYWm/TRJrCEH1uNxrMaJXbwoib3Gz
	TcVjYJ9eBl5Zhr6d44u8uFLNIombAc9GCLGi/eTR1/9pKgKiW7d0xnlx4H4uW5Zt8wSM14T/Mr6h6
	BkFn7e/IILhqHufdYPU6elstCgrzz8I1MU02jx2zRTj6BlqEt5Rz6W+GfhIek9AD8hAq0aL2N2+DS
	5LYLO9j6czp1LLNUwga44PlJdnPo0vpmGfYpwpQTgkt6lD3Ee9j653gPzIriahWUOSLaA0RRWZEq3
	OGjYxaqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kK8yj-0000Lg-7O; Sun, 20 Sep 2020 23:42:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kK8yg-0000L8-Re
 for linux-mediatek@lists.infradead.org; Sun, 20 Sep 2020 23:42:44 +0000
Received: from DESKTOP-GFFITBK.localdomain (218-161-90-76.HINET-IP.hinet.net
 [218.161.90.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2F54206B5;
 Sun, 20 Sep 2020 23:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600645360;
 bh=mgDMbfvtNzbst4k3uB+Gk/tPgYe2PUC1BGewW5HBe6o=;
 h=From:To:Cc:Subject:Date:From;
 b=VG6dVd0/Fn4VJ50WzoCKAFBFRXnTPT/ye7Ft3GnBqUdVPeQ+zaBtOq8PnznE7Foru
 7HlV8S24Gt+0H293nb8SfIdWMJsVnDJ8lldeanNSDsaB8P14uQ/ix33ExOI6NLxDah
 G4WO2gSTFXWhb2KVJK0qmEeVwUlKZadOyn3bLcLg=
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] soc: mediatek: cmdq: Remove timeout handler in helper function
Date: Mon, 21 Sep 2020 07:42:16 +0800
Message-Id: <20200920234216.16884-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_194243_107266_66A41279 
X-CRM114-Status: GOOD (  15.09  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For each client driver, its timeout handler need to dump hardware register
or its state machine information, so remove timeout handler in helper
function and let client driver implement its own timeout handler.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  3 +-
 drivers/soc/mediatek/mtk-cmdq-helper.c  | 41 +------------------------
 include/linux/soc/mediatek/mtk-cmdq.h   | 11 +------
 3 files changed, 3 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 3fc5511330b9..cabeb7fea2be 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -824,8 +824,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	mtk_crtc->cmdq_client =
 			cmdq_mbox_create(mtk_crtc->mmsys_dev,
-					 drm_crtc_index(&mtk_crtc->base),
-					 2000);
+					 drm_crtc_index(&mtk_crtc->base));
 	if (IS_ERR(mtk_crtc->cmdq_client)) {
 		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
 			drm_crtc_index(&mtk_crtc->base));
diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index dc644cfb6419..4f311f035b59 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -65,14 +65,7 @@ int cmdq_dev_get_client_reg(struct device *dev,
 }
 EXPORT_SYMBOL(cmdq_dev_get_client_reg);
 
-static void cmdq_client_timeout(struct timer_list *t)
-{
-	struct cmdq_client *client = from_timer(client, t, timer);
-
-	dev_err(client->client.dev, "cmdq timeout!\n");
-}
-
-struct cmdq_client *cmdq_mbox_create(struct device *dev, int index, u32 timeout)
+struct cmdq_client *cmdq_mbox_create(struct device *dev, int index)
 {
 	struct cmdq_client *client;
 
@@ -80,12 +73,6 @@ struct cmdq_client *cmdq_mbox_create(struct device *dev, int index, u32 timeout)
 	if (!client)
 		return (struct cmdq_client *)-ENOMEM;
 
-	client->timeout_ms = timeout;
-	if (timeout != CMDQ_NO_TIMEOUT) {
-		spin_lock_init(&client->lock);
-		timer_setup(&client->timer, cmdq_client_timeout, 0);
-	}
-	client->pkt_cnt = 0;
 	client->client.dev = dev;
 	client->client.tx_block = false;
 	client->client.knows_txdone = true;
@@ -107,11 +94,6 @@ EXPORT_SYMBOL(cmdq_mbox_create);
 
 void cmdq_mbox_destroy(struct cmdq_client *client)
 {
-	if (client->timeout_ms != CMDQ_NO_TIMEOUT) {
-		spin_lock(&client->lock);
-		del_timer_sync(&client->timer);
-		spin_unlock(&client->lock);
-	}
 	mbox_free_channel(client->chan);
 	kfree(client);
 }
@@ -342,18 +324,6 @@ static void cmdq_pkt_flush_async_cb(struct cmdq_cb_data data)
 	struct cmdq_task_cb *cb = &pkt->cb;
 	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
 
-	if (client->timeout_ms != CMDQ_NO_TIMEOUT) {
-		unsigned long flags = 0;
-
-		spin_lock_irqsave(&client->lock, flags);
-		if (--client->pkt_cnt == 0)
-			del_timer(&client->timer);
-		else
-			mod_timer(&client->timer, jiffies +
-				  msecs_to_jiffies(client->timeout_ms));
-		spin_unlock_irqrestore(&client->lock, flags);
-	}
-
 	dma_sync_single_for_cpu(client->chan->mbox->dev, pkt->pa_base,
 				pkt->cmd_buf_size, DMA_TO_DEVICE);
 	if (cb->cb) {
@@ -366,7 +336,6 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
 			 void *data)
 {
 	int err;
-	unsigned long flags = 0;
 	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
 
 	pkt->cb.cb = cb;
@@ -377,14 +346,6 @@ int cmdq_pkt_flush_async(struct cmdq_pkt *pkt, cmdq_async_flush_cb cb,
 	dma_sync_single_for_device(client->chan->mbox->dev, pkt->pa_base,
 				   pkt->cmd_buf_size, DMA_TO_DEVICE);
 
-	if (client->timeout_ms != CMDQ_NO_TIMEOUT) {
-		spin_lock_irqsave(&client->lock, flags);
-		if (client->pkt_cnt++ == 0)
-			mod_timer(&client->timer, jiffies +
-				  msecs_to_jiffies(client->timeout_ms));
-		spin_unlock_irqrestore(&client->lock, flags);
-	}
-
 	err = mbox_send_message(client->chan, pkt);
 	if (err < 0)
 		return err;
diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
index 2249ecaf77e4..175bd89f46f8 100644
--- a/include/linux/soc/mediatek/mtk-cmdq.h
+++ b/include/linux/soc/mediatek/mtk-cmdq.h
@@ -11,8 +11,6 @@
 #include <linux/mailbox/mtk-cmdq-mailbox.h>
 #include <linux/timer.h>
 
-#define CMDQ_NO_TIMEOUT		0xffffffffu
-
 struct cmdq_pkt;
 
 struct cmdq_client_reg {
@@ -22,12 +20,8 @@ struct cmdq_client_reg {
 };
 
 struct cmdq_client {
-	spinlock_t lock;
-	u32 pkt_cnt;
 	struct mbox_client client;
 	struct mbox_chan *chan;
-	struct timer_list timer;
-	u32 timeout_ms; /* in unit of microsecond */
 };
 
 /**
@@ -49,13 +43,10 @@ int cmdq_dev_get_client_reg(struct device *dev,
  * cmdq_mbox_create() - create CMDQ mailbox client and channel
  * @dev:	device of CMDQ mailbox client
  * @index:	index of CMDQ mailbox channel
- * @timeout:	timeout of a pkt execution by GCE, in unit of microsecond, set
- *		CMDQ_NO_TIMEOUT if a timer is not used.
  *
  * Return: CMDQ mailbox client pointer
  */
-struct cmdq_client *cmdq_mbox_create(struct device *dev, int index,
-				     u32 timeout);
+struct cmdq_client *cmdq_mbox_create(struct device *dev, int index);
 
 /**
  * cmdq_mbox_destroy() - destroy CMDQ mailbox client and channel
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
