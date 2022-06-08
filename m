Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BB5C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 14:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dJ79jCMi+UWSOev+AswH4cf3rbI9IUAqqhgAwoLPZNQ=; b=nS9gWl4GuDNACR
	E4kdc+3A4zSSDbWWT9FXMatYkXQ/l8R8ssRla6nQPGC6nbW62Z9xHKDJJmtjJPWwzIQBdOMRsZJZ7
	k+Kv3c5cdLAamMzDRMS26PZ1HPVRSRUdetZtNEFQbvHAzpG/qefuIvL5P0LQP10zXiZuqPX6bSVDV
	smZKWOCU2M3+Rz25bwzx1Pyx3uM/8RT2Nfs45u1fHqftQwqRJ3JT/4ec2UaXZnj9xA7osM734D9U8
	IWAuu0YFpFdEyx8WJ/LHihrYlj8wRVvlzoVSFXKioJuijZhzmSmAbCjq7zhwMshHQw6rEsjELOy/H
	GRYkFyW5LrASao1nSHwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nywsU-00Dijp-JP; Wed, 08 Jun 2022 14:41:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nywsJ-00Diff-BN; Wed, 08 Jun 2022 14:41:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6DDA1B8284B;
	Wed,  8 Jun 2022 14:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FE7C3411E;
	Wed,  8 Jun 2022 14:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654699292;
	bh=uBWqNSsuugL8gAJvkHPjJN0Gcc3wNBUrDVxOkLfzSW4=;
	h=From:To:Cc:Subject:Date:From;
	b=AG+HsRqm3ySG4CDH49vTyZCJ9jM/I7LkekpEtXER3zQgZq/NFypOrO6546G4Mf5gS
	 ukcujXukaxbtbVCMZSsYyFeLQYHXMFWVRZS6i14mR/C9RC35XzTc5AXkecRbpuokj1
	 PDELsIXkklqEdLG9Y3xdGENi2ELcIdB3FJGyUW4d7Q3B4BTqPV9Vj190KaoXTbCAfY
	 3Ku2CuzrfzRQqyD4tk/HQgmuiAutQUyh033N8AGioX7sNq5WHqhO7nDThWnTwb9ie2
	 ZFIH4Y4aDzZYskruz5miRu7fRM/LcIwWOl1TEjDCMzWoTgwUoR/jkGNqKZGEVCyoIs
	 qQdEmKpb2Bxrg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] mailbox: mtk-cmdq: Remove proprietary cmdq_task_cb
Date: Wed,  8 Jun 2022 22:40:55 +0800
Message-Id: <20220608144055.27562-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_074135_692405_0A353417 
X-CRM114-Status: GOOD (  12.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

rx_callback is a standard mailbox callback mechanism and could cover the
function of proprietary cmdq_task_cb, so use the standard one instead of
the proprietary one. Client driver has changed to use standard
rx_callback, so remove proprietary cmdq_task_cb.

Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
---
 drivers/mailbox/mtk-cmdq-mailbox.c       | 11 -----------
 include/linux/mailbox/mtk-cmdq-mailbox.h | 10 ----------
 2 files changed, 21 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 2578e5aaa935..9465f9081515 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -192,15 +192,10 @@ static bool cmdq_thread_is_in_wfe(struct cmdq_thread *thread)
 
 static void cmdq_task_exec_done(struct cmdq_task *task, int sta)
 {
-	struct cmdq_task_cb *cb = &task->pkt->async_cb;
 	struct cmdq_cb_data data;
 
 	data.sta = sta;
-	data.data = cb->data;
 	data.pkt = task->pkt;
-	if (cb->cb)
-		cb->cb(data);
-
 	mbox_chan_received_data(task->thread->chan, &data);
 
 	list_del(&task->list_entry);
@@ -448,7 +443,6 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 {
 	struct cmdq_thread *thread = (struct cmdq_thread *)chan->con_priv;
-	struct cmdq_task_cb *cb;
 	struct cmdq_cb_data data;
 	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
 	struct cmdq_task *task, *tmp;
@@ -465,13 +459,8 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 
 	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
 				 list_entry) {
-		cb = &task->pkt->async_cb;
 		data.sta = -ECONNABORTED;
-		data.data = cb->data;
 		data.pkt = task->pkt;
-		if (cb->cb)
-			cb->cb(data);
-
 		mbox_chan_received_data(task->thread->chan, &data);
 		list_del(&task->list_entry);
 		kfree(task);
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index 44365aab043c..a8f0070c7aa9 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -67,24 +67,14 @@ enum cmdq_code {
 
 struct cmdq_cb_data {
 	int			sta;
-	void			*data;
 	struct cmdq_pkt		*pkt;
 };
 
-typedef void (*cmdq_async_flush_cb)(struct cmdq_cb_data data);
-
-struct cmdq_task_cb {
-	cmdq_async_flush_cb	cb;
-	void			*data;
-};
-
 struct cmdq_pkt {
 	void			*va_base;
 	dma_addr_t		pa_base;
 	size_t			cmd_buf_size; /* command occupied size */
 	size_t			buf_size; /* real buffer size */
-	struct cmdq_task_cb	cb;
-	struct cmdq_task_cb	async_cb;
 	void			*cl;
 };
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
