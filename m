Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3026C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 00:59:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF5C6229CA
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 00:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF5C6229CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=arrNfEdIl3EDPc2Im2l/pvBJ56JjBL0NIVDhOeadZds=; b=uOMRtW4DJigZhdDAoNtY5G0uB
	BFuFA1EZA86bD3lr52eDEds5Qb+ST0Tu5wsV0G9kVGYN8HijKeAjlrkOq2lIxvnrmPHvZMtNJ/0br
	aUX3i5KWrlqvp1ZRPcUBdSpNdWEphizi2/15sKfNKiNjxqyCiMhSyIRHukKEfILJlOtMupSXwxMMv
	oQh+Wha7wrsExmUMtUpmJk69wWl/JFk0KS+CpvaAwMaRgMDMMWQwV3lMuaVKH6gq+mUBCU9fXqNyk
	b+HebCxp+qbDJ7WcssGHWNlqKICECwoY8z0KgHT4SHu0TPJjdjcNNn9QxSVo3hghzgaxHfgzKLLMP
	bUBf1NFeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwahB-0005CW-Hi; Tue, 05 Jan 2021 00:59:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwah6-0005Ao-E4; Tue, 05 Jan 2021 00:59:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C35622597;
 Tue,  5 Jan 2021 00:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609808367;
 bh=0dOcWsGh9Z/V+w6PU/Ju3OjRV+n9m9dtFHHPjcms3l4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UpvGE2Oom9D6rcDWbzDAqlIlyRHZcwDZRjYF5/eD2kS78z6kZUFRgjBn3D9WlvtV3
 yTXGFLJI/Sd1vq+IYgH6AMR3ehOW9mZ+nwUVj5s4pp10srj7hGpnChtac7yiFBJo4o
 ujZCofGLP+2Db2DAccq+uNaN0hyCpS8TyuKX+sSsj5ddZpq0BiRvNIzjseL0wUGAeK
 17B9UQoFea6geE2q1QsjKljK7a8KXUQyr8KMnbRQsTNWXGBiYLySEFLaK29N5GoLuz
 PBKY643BqmhVMuCY3x3bZx3pTNY0v7e/R0neVsgvR+OfeazKZYK2P7z22cM4zRNDmK
 1PGZ8QEOmE8hA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 08/17] scsi: block: Introduce BLK_MQ_REQ_PM
Date: Mon,  4 Jan 2021 19:59:06 -0500
Message-Id: <20210105005915.3954208-8-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105005915.3954208-1-sashal@kernel.org>
References: <20210105005915.3954208-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_195928_611333_09706935 
X-CRM114-Status: GOOD (  14.07  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Sasha Levin <sashal@kernel.org>,
 Bart Van Assche <bvanassche@acm.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
 Can Guo <cang@codeaurora.org>, Alan Stern <stern@rowland.harvard.edu>,
 Hannes Reinecke <hare@suse.de>, linux-mediatek@lists.infradead.org,
 Stanley Chu <stanley.chu@mediatek.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bart Van Assche <bvanassche@acm.org>

[ Upstream commit 0854bcdcdec26aecdc92c303816f349ee1fba2bc ]

Introduce the BLK_MQ_REQ_PM flag. This flag makes the request allocation
functions set RQF_PM. This is the first step towards removing
BLK_MQ_REQ_PREEMPT.

Link: https://lore.kernel.org/r/20201209052951.16136-3-bvanassche@acm.org
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Stanley Chu <stanley.chu@mediatek.com>
Cc: Ming Lei <ming.lei@redhat.com>
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Cc: Can Guo <cang@codeaurora.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Jens Axboe <axboe@kernel.dk>
Reviewed-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 block/blk-core.c       | 7 ++++---
 block/blk-mq.c         | 2 ++
 include/linux/blk-mq.h | 2 ++
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 2db8bda43b6e6..10696f9fb6ac6 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -424,11 +424,11 @@ EXPORT_SYMBOL(blk_cleanup_queue);
 /**
  * blk_queue_enter() - try to increase q->q_usage_counter
  * @q: request queue pointer
- * @flags: BLK_MQ_REQ_NOWAIT and/or BLK_MQ_REQ_PREEMPT
+ * @flags: BLK_MQ_REQ_NOWAIT, BLK_MQ_REQ_PM and/or BLK_MQ_REQ_PREEMPT
  */
 int blk_queue_enter(struct request_queue *q, blk_mq_req_flags_t flags)
 {
-	const bool pm = flags & BLK_MQ_REQ_PREEMPT;
+	const bool pm = flags & (BLK_MQ_REQ_PM | BLK_MQ_REQ_PREEMPT);
 
 	while (true) {
 		bool success = false;
@@ -630,7 +630,8 @@ struct request *blk_get_request(struct request_queue *q, unsigned int op,
 	struct request *req;
 
 	WARN_ON_ONCE(op & REQ_NOWAIT);
-	WARN_ON_ONCE(flags & ~(BLK_MQ_REQ_NOWAIT | BLK_MQ_REQ_PREEMPT));
+	WARN_ON_ONCE(flags & ~(BLK_MQ_REQ_NOWAIT | BLK_MQ_REQ_PM |
+			       BLK_MQ_REQ_PREEMPT));
 
 	req = blk_mq_alloc_request(q, op, flags);
 	if (!IS_ERR(req) && q->mq_ops->initialize_rq_fn)
diff --git a/block/blk-mq.c b/block/blk-mq.c
index 55bcee5dc0320..0072ffa50b46e 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -292,6 +292,8 @@ static struct request *blk_mq_rq_ctx_init(struct blk_mq_alloc_data *data,
 	rq->mq_hctx = data->hctx;
 	rq->rq_flags = 0;
 	rq->cmd_flags = data->cmd_flags;
+	if (data->flags & BLK_MQ_REQ_PM)
+		rq->rq_flags |= RQF_PM;
 	if (data->flags & BLK_MQ_REQ_PREEMPT)
 		rq->rq_flags |= RQF_PREEMPT;
 	if (blk_queue_io_stat(data->q))
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index 794b2a33a2c36..c9ecfd8b03381 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -446,6 +446,8 @@ enum {
 	BLK_MQ_REQ_NOWAIT	= (__force blk_mq_req_flags_t)(1 << 0),
 	/* allocate from reserved pool */
 	BLK_MQ_REQ_RESERVED	= (__force blk_mq_req_flags_t)(1 << 1),
+	/* set RQF_PM */
+	BLK_MQ_REQ_PM		= (__force blk_mq_req_flags_t)(1 << 2),
 	/* set RQF_PREEMPT */
 	BLK_MQ_REQ_PREEMPT	= (__force blk_mq_req_flags_t)(1 << 3),
 };
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
