Return-Path: <SRS0=lPor=4C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8D9C35242
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 04:34:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD7022187F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 04:34:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XPLGCp2K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tl+bmU9u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD7022187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8902uxn4givoWRP/f0SCpPyQXIEs0eASTjNBApWYA5I=; b=XPLGCp2K1iRfrY
	PMpPNfm4Qm/Czj6qapcqSx0Eba+EyCK6B34AFJ0L2o6rh4KalQG36u/OURFdT1x4PGmgzTx1BI6YU
	kUsSjbxWCNPXu2K/fDt8XM8hwes91bj1hwlz+b3WmjpEigIc4IEJ5YCRu9AxdqGbK8/Kugh2cIWa1
	NG+BxXLXap+uOBQFwWhNekfJcHTMvXcYFdM10ZJJUOnF8h4T4VOeAL2N6Zd5J+Wet3/kvypwF3iBv
	tYWp751dLo27WLPfapszImesbb+pGkDZDN58dhg5I47MIbVZIj+ANg5yYp+1iPE0kvSddeTgC89wt
	KLDMCEc+5uoCPOXXwoFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2Sg0-0004AZ-Id; Fri, 14 Feb 2020 04:34:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2Sfc-0003jO-Ql; Fri, 14 Feb 2020 04:33:42 +0000
X-UUID: 2edddf15b67946758340c20de4c553bc-20200213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=pXdRTGlO/UWEDb7GkCFHAFd4vtjwvmu6YVdID32AlX0=; 
 b=tl+bmU9u6C0nN/qAd9VtIJhb4WJiRKPCX1UiJDxSLzrGwzuVWqyvX9ph/cpaBTQjMqJmx/fIn6VLDc9Sj1h4LJUYrOdxD2d/FOLkXPGScQV6uyW2qBOjvGr+k5H6RFi6n3U8GwpvKyYqKLtvPXSfOf4mk8UXzUvAqVeitqlpZEI=;
X-UUID: 2edddf15b67946758340c20de4c553bc-20200213
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1545345822; Thu, 13 Feb 2020 20:33:29 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 20:33:41 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 14 Feb 2020 12:32:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 14 Feb 2020 12:33:18 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU
 <ck.hu@mediatek.com>
Subject: [PATCH 1/3] mailbox: mediatek: implement flush function
Date: Fri, 14 Feb 2020 12:33:23 +0800
Message-ID: <20200214043325.16618-2-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200214043325.16618-1-bibby.hsieh@mediatek.com>
References: <20200214043325.16618-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_203340_870362_AF0DD782 
X-CRM114-Status: GOOD (  12.49  )
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
 drivers/mailbox/mtk-cmdq-mailbox.c | 50 ++++++++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 9a6ce9f5a7db..03e58ff62007 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -5,6 +5,7 @@
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/completion.h>
 #include <linux/dma-mapping.h>
 #include <linux/errno.h>
 #include <linux/interrupt.h>
@@ -428,14 +429,59 @@ static int cmdq_mbox_startup(struct mbox_chan *chan)
 	return 0;
 }
 
-static void cmdq_mbox_shutdown(struct mbox_chan *chan)
+static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 {
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
+		list_del(&task->list_entry);
+		kfree(task);
+	}
+
+	if (cb->cb) {
+		data.sta = -ENOBUFS;
+		data.data = cb->data;
+		cb->cb(data);
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
+				      enable, enable == 0, 1, timeout))
+		dev_err(cmdq->mbox.dev, "Fail to wait GCE thread 0x%x done\n",
+			(u32)(thread->base - cmdq->base));
+	return 0;
 }
 
 static const struct mbox_chan_ops cmdq_mbox_chan_ops = {
 	.send_data = cmdq_mbox_send_data,
 	.startup = cmdq_mbox_startup,
-	.shutdown = cmdq_mbox_shutdown,
+	.flush = cmdq_mbox_flush,
 };
 
 static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
