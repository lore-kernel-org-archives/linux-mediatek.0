Return-Path: <SRS0=Yo4y=AQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97571C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2020 06:37:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63D3520870
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jul 2020 06:37:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P2B8bBb0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SyBFKzt8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63D3520870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BFY64fh3zGyaS3xCQpXKOp+Uu1N8IVbPJjgBeT7NOek=; b=P2B8bBb0hVMinvYmngb3jmQTz
	4wRjmpWoolKjFVfv4/yKpBSX7N/eSbivNOs33Yb7BIy+WFXZbs7ezvfOYPStW1REYTDyaKCyuJyra
	vXjgRM3DfQpFWBCbJIL6cl1Yj8GN/K1K2NV2jbAgihRCA5y1yID85LihtBxs6avmk7mPMyGvlMRGg
	UqCwEr/7xlZ2nqSZdPNKpbSh0xGePqOBSY6gWEvdTLHoeKaeF35gf8Ma8wJxripgFRZAeFGuWOzwV
	zq5FRo6Lbg3Mil8SVi3ruB+ucMPObjKjTM4epK4mOj/mAttJ+K8oZuSGv3PDf9MvS3TtgNbNFAPWb
	p4xWT635g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jryHb-0005oL-No; Sun, 05 Jul 2020 06:37:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jryHO-0005hl-PU; Sun, 05 Jul 2020 06:37:35 +0000
X-UUID: d60ede08c3234373b12ff93345eefdce-20200704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=H8QcGrkRwb9r12g7RW7vRcc+HdqW1TEDVi2UVMczqEw=; 
 b=SyBFKzt8HafvmDNlNr/QJY+rNqs1gp4N8QAsXeHSHaQa44Zc7rsfbqekJkaPx3B2hHe8WDrCCgtw8MSoz+swPdnpAmHV4dFPQTZJJwslx1GiGrO63OmL4D9YjD08Qk0AxyegqcnQuOT+fYarnvu7c9G2XbwZMKTejiU5vnU92nw=;
X-UUID: d60ede08c3234373b12ff93345eefdce-20200704
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1555270644; Sat, 04 Jul 2020 22:37:18 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 4 Jul 2020 23:37:25 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Jul 2020 14:37:18 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 5 Jul 2020 14:37:18 +0800
From: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>, Bibby Hsieh
 <bibby.hsieh@mediatek.com>, CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v8 4/4] mailbox: mediatek: cmdq: clear task in channel before
 shutdown
Date: Sun, 5 Jul 2020 14:37:16 +0800
Message-ID: <1593931037-24405-5-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1593931037-24405-1-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1593931037-24405-1-git-send-email-dennis-yc.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_023735_061190_6B9E029C 
X-CRM114-Status: GOOD (  12.46  )
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
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 HS Liao <hs.liao@mediatek.com>, Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Do success callback in channel when shutdown. For those task not finish,
callback with error code thus client has chance to cleanup or reset.

Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c |   38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 08bd4f1eb469..484d4438cd83 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -349,6 +349,12 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 
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
@@ -391,6 +397,38 @@ static int cmdq_mbox_startup(struct mbox_chan *chan)
 
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
 
 static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
