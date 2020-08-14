Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726CAC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 07:14:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 336E620708
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 07:14:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1s7eAXSN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ot9quvh5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 336E620708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h783uzjdo2biQaEKERfvZ1Z0LPierSse0CF62AMsx4I=; b=1s7eAXSNnTWLyowWfJWnhut3c
	Qho82SVLWQsf14xyOcSV9/ory/1blBh27xrc0wGw2xg1YGrpvNN/c3oqrTGpXMmpb2NNfNfIlUmat
	uJI2dUceIVFrO9KGbsyw68OVA4J/YiKIIsoMhiGQMh7d3qCeqX1SQSnmpl+pteuDGYtjsI+61cupd
	30l10nnd/dHRNx+yOpj+vGj5uvSrnPyhTXkQecStzovn0WHGUk7imMkaPINCjkPd7FWdfZP7kWMlH
	y/CLzZBukXdbtDt64M7OK3cQTufU7oqjNIP/FyVl0q4BOqOy229wo2WKHuwxeX5+Nm0r7skuhy4yO
	jb8GqxDTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6Tur-0000wU-LS; Fri, 14 Aug 2020 07:14:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6Ttz-0000Lv-BZ; Fri, 14 Aug 2020 07:13:35 +0000
X-UUID: 2e07ab2883304f33a62bfa27d1e118d1-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IbiFDDHum+jOdniC/v+DA+ppKQzebMyLkYXcc0l8USM=; 
 b=Ot9quvh51KxtwShoGN7yXKEuS8Pq5C5WpFPOEpjrtoUk1uCtf0kIpzi/+gi3xpEVlcdlPdMPUQwIXYxGhX8IxcCTuuHdntFw10HJqrzKPpoOa5V2o97sL/+gu5TlIzVioWNUo7ucrtmQUxd79aAgJcChP85wT2vz3Ys9GOnWNUw=;
X-UUID: 2e07ab2883304f33a62bfa27d1e118d1-20200813
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 668225933; Thu, 13 Aug 2020 23:13:15 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 00:13:14 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:11 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:10 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v12 07/29] media: v4l2-mem2mem: add v4l2_m2m_suspend,
 v4l2_m2m_resume
Date: Fri, 14 Aug 2020 15:11:40 +0800
Message-ID: <20200814071202.25067-9-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200814071202.25067-1-xia.jiang@mediatek.com>
References: <20200814071202.25067-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_031323_619016_8B5A36A5 
X-CRM114-Status: GOOD (  20.84  )
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
Cc: maoguang.meng@mediatek.com, devicetree@vger.kernel.org,
 mojahsu@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 senozhatsky@chromium.org, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, Pi-Hsun Shih <pihsun@chromium.org>,
 Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
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
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
---
v12: add this relied patch to the series
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 41 ++++++++++++++++++++++++++
 include/media/v4l2-mem2mem.h           | 22 ++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index 62ac9424c92a..ddfdb6375064 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -43,6 +43,10 @@ module_param(debug, bool, 0644);
 #define TRANS_ABORT		(1 << 2)
 
 
+/* The job queue is not running new jobs */
+#define QUEUE_PAUSED		(1 << 0)
+
+
 /* Offset base for buffers on the destination queue - used to distinguish
  * between source and destination buffers when mmapping - they receive the same
  * offsets but for different queues */
@@ -84,6 +88,7 @@ static const char * const m2m_entity_name[] = {
  * @job_queue:		instances queued to run
  * @job_spinlock:	protects job_queue
  * @job_work:		worker to run queued jobs.
+ * @job_queue_flags:	flags of the queue status, %QUEUE_PAUSED.
  * @m2m_ops:		driver callbacks
  */
 struct v4l2_m2m_dev {
@@ -101,6 +106,7 @@ struct v4l2_m2m_dev {
 	struct list_head	job_queue;
 	spinlock_t		job_spinlock;
 	struct work_struct	job_work;
+	unsigned long		job_queue_flags;
 
 	const struct v4l2_m2m_ops *m2m_ops;
 };
@@ -263,6 +269,12 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
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
@@ -504,6 +516,7 @@ void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
 
 	if (WARN_ON(!src_buf || !dst_buf))
 		goto unlock;
+	v4l2_m2m_buf_done(src_buf, state);
 	dst_buf->is_held = src_buf->flags & V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF;
 	if (!dst_buf->is_held) {
 		v4l2_m2m_dst_buf_remove(m2m_ctx);
@@ -528,6 +541,34 @@ void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
 }
 EXPORT_SYMBOL(v4l2_m2m_buf_done_and_job_finish);
 
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
index 98753f00df7e..5a91b548ecc0 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -304,6 +304,28 @@ v4l2_m2m_is_last_draining_src_buf(struct v4l2_m2m_ctx *m2m_ctx,
 void v4l2_m2m_last_buffer_done(struct v4l2_m2m_ctx *m2m_ctx,
 			       struct vb2_v4l2_buffer *vbuf);
 
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
