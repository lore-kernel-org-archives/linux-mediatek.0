Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DA3C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 00:59:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67882229CA
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 00:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67882229CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ESdE7o+tQ0Vr+GoOWNT/B9wEq3EJhV5ce39KYpzJn8o=; b=lA+lG3js03hg/kPt87YnKDPkM
	MfdN0zbm5csmdp8I+rpv/L7oA756pHJeM80Be5aj/PNpI70N2ihZZa5QUVGnHqiTyhz6Jn60Jtc7W
	T21osDG3/Xm07dYg2koxg7xBEYEmo4RDG54ThX5uPDNLc7VKyBwZjDkdLmZLC2kqQtIH/uMdk/zx9
	xDHE8UFDubWI7qjG/zNaqbtArnbXeqKGWFAL0iG1HzhfH3xC9xIMpDpA0lF4SlUq8/HO6fXE1D6tg
	Mb/ZTc7JEx8MY/F5k40Guepig4RBwyaRtX1/ezVfBTsQKULGXYPZ4Cto+nfVquJPjl/PIgYAZQEZI
	E8vXZzX+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwahE-0005Db-6v; Tue, 05 Jan 2021 00:59:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwah8-0005BL-7o; Tue, 05 Jan 2021 00:59:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C80C225AC;
 Tue,  5 Jan 2021 00:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609808369;
 bh=+gGqkzy+8CQx9AUpsQyAbvAkoZxFMkzQtzuM3XQ1zLw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xxgdwm+9u5Q2i5kYiTKudV3tCivty9pNX46zuWULXzbfbhUmGfqDIgn22+1QBpLSk
 /qY/MGuKlnfNQYObS98LyS5aQ+A76Kyz1QhgvuioHNJaNDt21xPaZZI7LUOzKcWgoM
 ZYAacF2OO/TANDEAvZ7y+UaKuVLigkRsMwlFELdMkYO11HXl0aNgoZ5jsb5YXt27x3
 fViCbilQ1FFP+P5Fy+5dc6RHNXe3RHlHRhLq1JgwT1Je/gfM9gUUqcgH3DljdIq4+H
 lGUjaUrcS6z63p8izRK4VZgjJet8Jlow0T5TYthra63LCDLTfjYg8mBJU1UPLffhXY
 059cx8OGCDjQA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 09/17] scsi: ide: Do not set the RQF_PREEMPT flag
 for sense requests
Date: Mon,  4 Jan 2021 19:59:07 -0500
Message-Id: <20210105005915.3954208-9-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105005915.3954208-1-sashal@kernel.org>
References: <20210105005915.3954208-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_195930_429394_C7EC9C12 
X-CRM114-Status: GOOD (  19.41  )
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
 Ming Lei <ming.lei@redhat.com>, linux-ide@vger.kernel.org,
 Can Guo <cang@codeaurora.org>, Alan Stern <stern@rowland.harvard.edu>,
 Hannes Reinecke <hare@suse.de>, linux-mediatek@lists.infradead.org,
 Stanley Chu <stanley.chu@mediatek.com>, Christoph Hellwig <hch@lst.de>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bart Van Assche <bvanassche@acm.org>

[ Upstream commit 96d86e6a80a3ab9aff81d12f9f1f2a0da2917d38 ]

RQF_PREEMPT is used for two different purposes in the legacy IDE code:

 1. To mark power management requests.

 2. To mark requests that should preempt another request. An (old)
    explanation of that feature is as follows: "The IDE driver in the Linux
    kernel normally uses a series of busywait delays during its
    initialization. When the driver executes these busywaits, the kernel
    does nothing for the duration of the wait. The time spent in these
    waits could be used for other initialization activities, if they could
    be run concurrently with these waits.

    More specifically, busywait-style delays such as udelay() in module
    init functions inhibit kernel preemption because the Big Kernel Lock is
    held, while yielding APIs such as schedule_timeout() allow
    preemption. This is true because the kernel handles the BKL specially
    and releases and reacquires it across reschedules allowed by the
    current thread.

    This IDE-preempt specification requires that the driver eliminate these
    busywaits and replace them with a mechanism that allows other work to
    proceed while the IDE driver is initializing."

Since I haven't found an implementation of (2), do not set the PREEMPT flag
for sense requests. This patch causes sense requests to be postponed while
a drive is suspended instead of being submitted to ide_queue_rq().

If it would ever be necessary to restore the IDE PREEMPT functionality,
that can be done by introducing a new flag in struct ide_request.

Link: https://lore.kernel.org/r/20201209052951.16136-4-bvanassche@acm.org
Cc: David S. Miller <davem@davemloft.net>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Can Guo <cang@codeaurora.org>
Cc: Stanley Chu <stanley.chu@mediatek.com>
Cc: Ming Lei <ming.lei@redhat.com>
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ide/ide-atapi.c | 1 -
 drivers/ide/ide-io.c    | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/drivers/ide/ide-atapi.c b/drivers/ide/ide-atapi.c
index 2162bc80f09e0..013ad33fbbc81 100644
--- a/drivers/ide/ide-atapi.c
+++ b/drivers/ide/ide-atapi.c
@@ -223,7 +223,6 @@ void ide_prep_sense(ide_drive_t *drive, struct request *rq)
 	sense_rq->rq_disk = rq->rq_disk;
 	sense_rq->cmd_flags = REQ_OP_DRV_IN;
 	ide_req(sense_rq)->type = ATA_PRIV_SENSE;
-	sense_rq->rq_flags |= RQF_PREEMPT;
 
 	req->cmd[0] = GPCMD_REQUEST_SENSE;
 	req->cmd[4] = cmd_len;
diff --git a/drivers/ide/ide-io.c b/drivers/ide/ide-io.c
index 1a53c7a752244..c210ea3bd02fa 100644
--- a/drivers/ide/ide-io.c
+++ b/drivers/ide/ide-io.c
@@ -515,11 +515,6 @@ blk_status_t ide_issue_rq(ide_drive_t *drive, struct request *rq,
 		 * above to return us whatever is in the queue. Since we call
 		 * ide_do_request() ourselves, we end up taking requests while
 		 * the queue is blocked...
-		 * 
-		 * We let requests forced at head of queue with ide-preempt
-		 * though. I hope that doesn't happen too much, hopefully not
-		 * unless the subdriver triggers such a thing in its own PM
-		 * state machine.
 		 */
 		if ((drive->dev_flags & IDE_DFLAG_BLOCKED) &&
 		    ata_pm_request(rq) == 0 &&
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
