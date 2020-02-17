Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E327C7619F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 09:07:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2EFA2067D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 09:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cbtt8YX6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VgOHmY9/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2EFA2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K7l/woulHk4jDxRLA6/nuUqElCGGZE7HnWtL/AotdOI=; b=cbtt8YX6lmvRtq
	krV7pbW718+3TIrxxaMh4pdB989Oaf/uUEOuMtIqkI3ju5W+lMn5b/WWzwQ++UdUQBLK8svdqFBVl
	R0pxuYIvN3YNWUaSYw19e+Cin3kvXDIySUiTKdRgcUEy+zBma3wnamqQBuIKh1bMWhTPjn54iay0N
	KJLkhqL65j/B0oOx8PeZCU+fzblYb/kB5umBuRXN1f+Jvr5MiyxwhdJvoV1oNHIztstzayuZNyE8H
	kZPqOMmYsqPrPPPK5/sMTomXMHo17zsglyBtOgHcZIrw57Yq5NreBsMcDwIIjloVfZ9Vc16LOvvEH
	PHGPWCvXVV6f4e+8aW0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3cMc-0004MW-Oe; Mon, 17 Feb 2020 09:06:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3cLW-0003XZ-Pu; Mon, 17 Feb 2020 09:05:44 +0000
X-UUID: 43b8bd47711e42f7874953ed635897ba-20200217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=I3Oim7gZHvMV9Qef+8S9vRrpbkNgTWn+GySP5pP9Xs4=; 
 b=VgOHmY9/vyqGbxp3NtNb80kXHOXkz99xqU3Yx4wYe6vrpmytUFPPlDuVT+OzLTWxbSMkBZQcqKUm0uIdJvJLN+Viw0nBTG++rjLZPeCKEEvfwAGFis77uCeKiqiVR406C0iGVj7fLH3R/ndUA86k46me5gS5RFfn7nvNINd8N5M=;
X-UUID: 43b8bd47711e42f7874953ed635897ba-20200217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 422782845; Mon, 17 Feb 2020 01:05:36 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 01:06:24 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 17:04:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 17 Feb 2020 17:03:36 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU
 <ck.hu@mediatek.com>
Subject: [PATCH v1 2/3] mailbox: mediatek: implement flush function
Date: Mon, 17 Feb 2020 17:05:31 +0800
Message-ID: <20200217090532.16019-3-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200217090532.16019-1-bibby.hsieh@mediatek.com>
References: <20200217090532.16019-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_010542_885254_6887606B 
X-CRM114-Status: GOOD (  10.87  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>,
 Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

For client driver which need to reorganize the command buffer, it could
use this function to flush the send command buffer.
If the channel doesn't be started (usually in waiting for event), this
function will abort it directly.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 52 ++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 9a6ce9f5a7db..0da5e2dc2c0e 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -432,10 +432,62 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 {
 }
 
+static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
+{
+	struct cmdq_thread *thread = (struct cmdq_thread *)chan->con_priv;
+	struct cmdq_task_cb *cb;
+	struct cmdq_cb_data data;
+	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
+	struct cmdq_task *task, *tmp;
+	unsigned long flags;
+	u32 enable;
+
+	spin_lock_irqsave(&thread->chan->lock, flags);
+	if (list_empty(&thread->task_busy_list))
+		goto out;
+
+	WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
+	if (!cmdq_thread_is_in_wfe(thread))
+		goto wait;
+
+	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
+				 list_entry) {
+		cb = &task->pkt->async_cb;
+		if (cb->cb) {
+			data.sta = CMDQ_CB_ERROR;
+			data.data = cb->data;
+			cb->cb(data);
+		}
+		list_del(&task->list_entry);
+		kfree(task);
+	}
+
+	cmdq_thread_resume(thread);
+	cmdq_thread_disable(cmdq, thread);
+	clk_disable(cmdq->clock);
+
+out:
+	spin_unlock_irqrestore(&thread->chan->lock, flags);
+	return 0;
+
+wait:
+	cmdq_thread_resume(thread);
+	spin_unlock_irqrestore(&thread->chan->lock, flags);
+	if (readl_poll_timeout_atomic(thread->base + CMDQ_THR_ENABLE_TASK,
+				      enable, enable == 0, 1, timeout)) {
+		dev_err(cmdq->mbox.dev, "Fail to wait GCE thread 0x%x done\n",
+			(u32)(thread->base - cmdq->base));
+
+		return -EFAULT;
+	}
+	return 0;
+}
+
 static const struct mbox_chan_ops cmdq_mbox_chan_ops = {
 	.send_data = cmdq_mbox_send_data,
 	.startup = cmdq_mbox_startup,
 	.shutdown = cmdq_mbox_shutdown,
+	.flush = cmdq_mbox_flush,
 };
 
 static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
