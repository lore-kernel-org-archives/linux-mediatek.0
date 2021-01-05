Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC516C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 01:00:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F6222256F
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 01:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F6222256F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FZlR5PWqkfQiyC4LWn3cFPAeJOqR2lx3R6JYZtr1PTE=; b=ZHM0utH9mmehO28/2+5WyX9fU
	67TCdIjS181Uq459zIaF7X78FaRAfij6gWtpANhInwk5J5JYJnhgkPtW01oNCwUYR8TDBPqH1Eihs
	cSWqA3ppb3RD05DM0VSsOP+gTvuKFky6shafu7O3yFu5Xiyrc4F3iVDZso4tJ8b9jX425hnef0SBE
	QRlHtzP3nr921csvKNqoSeo9ir+F7oP/42DnLG4F08k5NHudiLVLI48g90uNjiiPCO0/aeeG53+Rr
	gKNU56BS6YjfzmznX+u+I0CM1yEvowb4alBv4KU1FMkni8orf5xa3zo4kr74ZDT3qA4h7+p/ughYy
	/RHQNwcXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwahR-0005K1-TC; Tue, 05 Jan 2021 00:59:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwahE-0005Dq-Qz; Tue, 05 Jan 2021 00:59:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D5EE22838;
 Tue,  5 Jan 2021 00:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609808376;
 bh=27eIFbX1I7PrBJaWxYzwZi1zfub80K7yPMyP+kG2urQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=n0WpJUOj69r42HMbd36A6+/G1NGzHMuqNJ8+BMYHLBb8AeTAgiy9aVy5FkBGvmFLI
 kyOXssSHTWrqnMTYU0Q8KJ7R9kGukN1TcDRG+iT0dVGDc+b5pvM6mDl+rruUQLtarc
 AQa9PSuEUzpmrCrObW7jfhR/tmRqW5EgKeOVcdj6rP4mE+esJv5wKSU52DxAnyYJFE
 mgGIplBh3WF2kFDxc6w10v7B2RtNKYFha17AajsiVPT6xgmmYfB70oMjwNNRgIFpkP
 5mvPS1OQeCir/djaxwYVYr1YWt4HkqiQ8ssLNgFBl6kKYrhNxyLPABlC/T6MbdSYM5
 CCKCVJ1vhzvqA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 12/17] scsi: core: Only process PM requests if
 rpm_status != RPM_ACTIVE
Date: Mon,  4 Jan 2021 19:59:10 -0500
Message-Id: <20210105005915.3954208-12-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105005915.3954208-1-sashal@kernel.org>
References: <20210105005915.3954208-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_195937_045275_1AD929BB 
X-CRM114-Status: GOOD (  15.68  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Martin Kepplinger <martin.kepplinger@puri.sm>,
 Bart Van Assche <bvanassche@acm.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Sasha Levin <sashal@kernel.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Ming Lei <ming.lei@redhat.com>, Can Guo <cang@codeaurora.org>,
 Alan Stern <stern@rowland.harvard.edu>, Hannes Reinecke <hare@suse.de>,
 linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Stanley Chu <stanley.chu@mediatek.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bart Van Assche <bvanassche@acm.org>

[ Upstream commit e6044f714b256259df9611ff49af433e5411c5c8 ]

Instead of submitting all SCSI commands submitted with scsi_execute() to a
SCSI device if rpm_status != RPM_ACTIVE, only submit RQF_PM (power
management requests) if rpm_status != RPM_ACTIVE. This patch makes the SCSI
core handle the runtime power management status (rpm_status) as it should
be handled.

Link: https://lore.kernel.org/r/20201209052951.16136-7-bvanassche@acm.org
Cc: Can Guo <cang@codeaurora.org>
Cc: Stanley Chu <stanley.chu@mediatek.com>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Ming Lei <ming.lei@redhat.com>
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Cc: Martin Kepplinger <martin.kepplinger@puri.sm>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Jens Axboe <axboe@kernel.dk>
Reviewed-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/scsi_lib.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 2d17137f8ff3b..31d7a6ddc9db7 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -249,7 +249,8 @@ int __scsi_execute(struct scsi_device *sdev, const unsigned char *cmd,
 
 	req = blk_get_request(sdev->request_queue,
 			data_direction == DMA_TO_DEVICE ?
-			REQ_OP_SCSI_OUT : REQ_OP_SCSI_IN, BLK_MQ_REQ_PREEMPT);
+			REQ_OP_SCSI_OUT : REQ_OP_SCSI_IN,
+			rq_flags & RQF_PM ? BLK_MQ_REQ_PM : 0);
 	if (IS_ERR(req))
 		return ret;
 	rq = scsi_req(req);
@@ -1203,6 +1204,8 @@ static blk_status_t
 scsi_device_state_check(struct scsi_device *sdev, struct request *req)
 {
 	switch (sdev->sdev_state) {
+	case SDEV_CREATED:
+		return BLK_STS_OK;
 	case SDEV_OFFLINE:
 	case SDEV_TRANSPORT_OFFLINE:
 		/*
@@ -1229,18 +1232,18 @@ scsi_device_state_check(struct scsi_device *sdev, struct request *req)
 		return BLK_STS_RESOURCE;
 	case SDEV_QUIESCE:
 		/*
-		 * If the devices is blocked we defer normal commands.
+		 * If the device is blocked we only accept power management
+		 * commands.
 		 */
-		if (req && !(req->rq_flags & RQF_PREEMPT))
+		if (req && WARN_ON_ONCE(!(req->rq_flags & RQF_PM)))
 			return BLK_STS_RESOURCE;
 		return BLK_STS_OK;
 	default:
 		/*
 		 * For any other not fully online state we only allow
-		 * special commands.  In particular any user initiated
-		 * command is not allowed.
+		 * power management commands.
 		 */
-		if (req && !(req->rq_flags & RQF_PREEMPT))
+		if (req && !(req->rq_flags & RQF_PM))
 			return BLK_STS_IOERR;
 		return BLK_STS_OK;
 	}
@@ -2508,15 +2511,13 @@ void sdev_evt_send_simple(struct scsi_device *sdev,
 EXPORT_SYMBOL_GPL(sdev_evt_send_simple);
 
 /**
- *	scsi_device_quiesce - Block user issued commands.
+ *	scsi_device_quiesce - Block all commands except power management.
  *	@sdev:	scsi device to quiesce.
  *
  *	This works by trying to transition to the SDEV_QUIESCE state
  *	(which must be a legal transition).  When the device is in this
- *	state, only special requests will be accepted, all others will
- *	be deferred.  Since special requests may also be requeued requests,
- *	a successful return doesn't guarantee the device will be
- *	totally quiescent.
+ *	state, only power management requests will be accepted, all others will
+ *	be deferred.
  *
  *	Must be called with user context, may sleep.
  *
@@ -2578,12 +2579,12 @@ void scsi_device_resume(struct scsi_device *sdev)
 	 * device deleted during suspend)
 	 */
 	mutex_lock(&sdev->state_mutex);
+	if (sdev->sdev_state == SDEV_QUIESCE)
+		scsi_device_set_state(sdev, SDEV_RUNNING);
 	if (sdev->quiesced_by) {
 		sdev->quiesced_by = NULL;
 		blk_clear_pm_only(sdev->request_queue);
 	}
-	if (sdev->sdev_state == SDEV_QUIESCE)
-		scsi_device_set_state(sdev, SDEV_RUNNING);
 	mutex_unlock(&sdev->state_mutex);
 }
 EXPORT_SYMBOL(scsi_device_resume);
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
