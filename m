Return-Path: <SRS0=B6WE=Z2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A98C43603
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2019 12:58:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37E8120674
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Dec 2019 12:58:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s7nF9F72";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="rdUNfcQI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37E8120674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6M2ECSZmnCxKrUSs3XMJK8lo2MkbX69+xztq1qKAWk=; b=s7nF9F7225c5tG
	BE54gHkOCX6UTZNx1i+c7rbFfK3aUXgn9PWuF7zTEBteiH/2YAcDDYwq+KzDLLMjicMOCo0V53x6u
	IEiFAq9nzDdR+voy51/CB4MAYhzXauDVcrKNdWk8Y3bMarRVLwkNg1BBrxk+yJGoIoiy3djSnrFQO
	Dz+SdhJTbkdRLIwg3JiIwB5nBX1HlfeIMa1VHbV4gOW6fjkXirrOwJatL18DjQN2usPHdYYWYsEGw
	BU0aB2bCjW53lHYkim2oDpys1Gee3yRXFnckondpW8I50UHJaxC0vDa3iWVcJ6E/RUtxVGqHlojUG
	OQT7So97Mx57Svw/JM7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1icUEv-0002WR-Sd; Wed, 04 Dec 2019 12:58:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1icUDz-0001lE-5h; Wed, 04 Dec 2019 12:57:50 +0000
X-UUID: 1c7a6ef0367f417798e3758d4cf8d2fb-20191204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AJ6EJ09qaARojHJVEQN6B8vyTmhEAX2xvL+vGW8QBaU=; 
 b=rdUNfcQIvYCeI2NBJoGMPH8MeXwADc7TbsJv5o0UfBbDLYwboAHoEv62c3WRETa7Qn4vWwlIp2x3lQrdq9fCj9dkBHPAKZsvcIHPPwJkP1CqpRPTz2bfNJk9zHeZ1nCveoC4ARQUqiIiPbXh+88wz1qnok6hFSTae7wIi72Gmew=;
X-UUID: 1c7a6ef0367f417798e3758d4cf8d2fb-20191204
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jerry-ch.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 110816230; Wed, 04 Dec 2019 04:57:44 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 04:48:33 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 20:47:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 4 Dec 2019 20:46:45 +0800
From: Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
To: <hans.verkuil@cisco.com>, <laurent.pinchart+renesas@ideasonboard.com>,
 <tfiga@chromium.org>, <matthias.bgg@gmail.com>, <mchehab@kernel.org>
Subject: [RFC PATCH V4 1/4] media: v4l2-mem2mem: add v4l2_m2m_suspend,
 v4l2_m2m_resume
Date: Wed, 4 Dec 2019 20:47:29 +0800
Message-ID: <20191204124732.10932-2-Jerry-Ch.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_045747_254273_D7272997 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com,
 pihsun@chromium.org, srv_heupstream@mediatek.com, Jerry-ch.Chen@mediatek.com,
 jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org,
 linux-mediatek@lists.infradead.org, zwisler@chromium.org,
 Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>,
 christie.yu@mediatek.com, frederic.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Pi-Hsun Shih <pihsun@chromium.org>

Add two functions that can be used to stop new jobs from being queued /
continue running queued job. This can be used while a driver using m2m
helper is going to suspend / wake up from resume, and can ensure that
there's no job running in suspend process.

BUG=b:143046833
TEST=build

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 40 ++++++++++++++++++++++++++
 include/media/v4l2-mem2mem.h           | 22 ++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 5bbdec55b7d7..76ba203e0035 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -47,6 +47,10 @@ module_param(debug, bool, 0644);
 #define TRANS_ABORT		(1 << 2)
 
 
+/* The job queue is not running new jobs */
+#define QUEUE_PAUSED		(1 << 0)
+
+
 /* Offset base for buffers on the destination queue - used to distinguish
  * between source and destination buffers when mmapping - they receive the same
  * offsets but for different queues */
@@ -88,6 +92,7 @@ static const char * const m2m_entity_name[] = {
  * @job_queue:		instances queued to run
  * @job_spinlock:	protects job_queue
  * @job_work:		worker to run queued jobs.
+ * @job_queue_flags:	flags of the queue status, %QUEUE_PAUSED.
  * @m2m_ops:		driver callbacks
  */
 struct v4l2_m2m_dev {
@@ -105,6 +110,7 @@ struct v4l2_m2m_dev {
 	struct list_head	job_queue;
 	spinlock_t		job_spinlock;
 	struct work_struct	job_work;
+	unsigned long		job_queue_flags;
 
 	const struct v4l2_m2m_ops *m2m_ops;
 };
@@ -267,6 +273,12 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
 		return;
 	}
 
+	if (m2m_dev->job_queue_flags & QUEUE_PAUSED) {
+		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
+		dprintk("Running new jobs is paused\n");
+		return;
+	}
+
 	m2m_dev->curr_ctx = list_first_entry(&m2m_dev->job_queue,
 				   struct v4l2_m2m_ctx, queue);
 	m2m_dev->curr_ctx->job_flags |= TRANS_RUNNING;
@@ -447,6 +459,34 @@ void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
 }
 EXPORT_SYMBOL(v4l2_m2m_job_finish);
 
+void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
+{
+	unsigned long flags;
+	struct v4l2_m2m_ctx *curr_ctx;
+
+	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
+	m2m_dev->job_queue_flags |= QUEUE_PAUSED;
+	curr_ctx = m2m_dev->curr_ctx;
+	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
+
+	if (curr_ctx)
+		wait_event(curr_ctx->finished,
+			   !(curr_ctx->job_flags & TRANS_RUNNING));
+}
+EXPORT_SYMBOL(v4l2_m2m_suspend);
+
+void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
+	m2m_dev->job_queue_flags &= ~QUEUE_PAUSED;
+	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
+
+	v4l2_m2m_try_run(m2m_dev);
+}
+EXPORT_SYMBOL(v4l2_m2m_resume);
+
 int v4l2_m2m_reqbufs(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		     struct v4l2_requestbuffers *reqbufs)
 {
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 5467264771ec..119a195da390 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -183,6 +183,28 @@ v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state)
 	vb2_buffer_done(&buf->vb2_buf, state);
 }
 
+/**
+ * v4l2_m2m_suspend() - stop new jobs from being run and wait for current job
+ * to finish
+ *
+ * @m2m_dev: opaque pointer to the internal data to handle M2M context
+ *
+ * Called by a driver in the suspend hook. Stop new jobs from being run, and
+ * wait for current running job to finish.
+ */
+void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev);
+
+/**
+ * v4l2_m2m_resume() - resume job running and try to run a queued job
+ *
+ * @m2m_dev: opaque pointer to the internal data to handle M2M context
+ *
+ * Called by a driver in the resume hook. This reverts the operation of
+ * v4l2_m2m_suspend() and allows job to be run. Also try to run a queued job if
+ * there is any.
+ */
+void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev);
+
 /**
  * v4l2_m2m_reqbufs() - multi-queue-aware REQBUFS multiplexer
  *
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
