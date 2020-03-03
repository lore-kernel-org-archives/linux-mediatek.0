Return-Path: <SRS0=Bv85=4U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED359C3F2C6
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2020 10:59:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC66C214D8
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2020 10:59:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B/RzHuaJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cdn22QR+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC66C214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=su8F9EPkzVfURgol4jkJ8uA9ecaYCrmsCsVR53FLfws=; b=B/RzHuaJW7ln16
	uf7Tpuo+uRu5nl0Hv+A+mUCHlLGoHSi8cZob1fUpUJFu/bkWHqxlubUmoQR8ujBG3S92GOHHDhzYe
	3AOtaPSDydNb/jcwi3qV1cNrdmIs1ex6IVixHmp/Yw/rUi6IjLxw6FObH1mj1JP/xYn9fSnsjgaOf
	nxyAC9lRi5A+0gXfcRRaeNJ/FihVNLnwJK5U8EWtcE1Wd3POgNTDF1wTaNDKfq1B5yMr2nacFzMYL
	hO2ch31bbkCLw6BOVHJLrvdxHsYHbhNEhuGk2RFFmygdN49N0DN9Gin5Vc5eRqaE70F/U4X0+XioB
	e5M/J1nddyOp09V8WFWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j95Gp-0004vO-E6; Tue, 03 Mar 2020 10:59:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j95GJ-0004IR-Dq; Tue, 03 Mar 2020 10:58:58 +0000
X-UUID: a5f3666a74354fa9831a0fd1b401a106-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=n91f0uofl0asqlUlap0WpLknqR4syuPs3+1WSrUJsOQ=; 
 b=cdn22QR+sStRIQVwBGt4inGa5ngUM8MVvQVDp7vc2WVoeCvtgckl0oUQgm02w8pX/ERS4HI1xmXjMSzWVXa6fwOTQw4Jis4hwMzmIo2GY6k2IfKaHPDc0ElPVUUEqkXc3dRef77EekzvlhTCmic4Rs1T0U67MG2adkcT1jmBXsE=;
X-UUID: a5f3666a74354fa9831a0fd1b401a106-20200303
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1488205584; Tue, 03 Mar 2020 02:58:51 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 03:00:06 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 18:57:41 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 3 Mar 2020 18:58:11 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jassi Brar
 <jassisinghbrar@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v4 04/13] mailbox: mediatek: cmdq: clear task in channel
 before shutdown
Date: Tue, 3 Mar 2020 18:58:36 +0800
Message-ID: <1583233125-7827-5-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: DC30B30E062A9263D4C2EDB9C3BE08E0741AE0EE0162D48019CACD8965CBF2312000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_025855_482221_1307F41D 
X-CRM114-Status: GOOD (  10.27  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 HS Liao <hs.liao@mediatek.com>, Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Do success callback in channel when shutdown. For those task not finish,
callback with error code thus client has chance to cleanup or reset.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 9994ac9426d6..b56d340c8982 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -387,6 +387,12 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 
 	if (list_empty(&thread->task_busy_list)) {
 		WARN_ON(clk_enable(cmdq->clock) < 0);
+		/*
+		 * The thread reset will clear thread related register to 0,
+		 * including pc, end, priority, irq, suspend and enable. Thus
+		 * set CMDQ_THR_ENABLED to CMDQ_THR_ENABLE_TASK will enable
+		 * thread and make it running.
+		 */
 		WARN_ON(cmdq_thread_reset(cmdq, thread) < 0);
 
 		writel(task->pa_base >> cmdq->shift_pa,
@@ -450,6 +456,38 @@ static int cmdq_mbox_startup(struct mbox_chan *chan)
 
 static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 {
+	struct cmdq_thread *thread = (struct cmdq_thread *)chan->con_priv;
+	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
+	struct cmdq_task *task, *tmp;
+	unsigned long flags;
+
+	spin_lock_irqsave(&thread->chan->lock, flags);
+	if (list_empty(&thread->task_busy_list))
+		goto done;
+
+	WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
+
+	/* make sure executed tasks have success callback */
+	cmdq_thread_irq_handler(cmdq, thread);
+	if (list_empty(&thread->task_busy_list))
+		goto done;
+
+	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
+				 list_entry) {
+		cmdq_task_exec_done(task, CMDQ_CB_ERROR);
+		kfree(task);
+	}
+
+	cmdq_thread_disable(cmdq, thread);
+	clk_disable(cmdq->clock);
+done:
+	/*
+	 * The thread->task_busy_list empty means thread already disable. The
+	 * cmdq_mbox_send_data() always reset thread which clear disable and
+	 * suspend statue when first pkt send to channel, so there is no need
+	 * to do any operation here, only unlock and leave.
+	 */
+	spin_unlock_irqrestore(&thread->chan->lock, flags);
 }
 
 static const struct mbox_chan_ops cmdq_mbox_chan_ops = {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
