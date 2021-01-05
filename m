Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1F1C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 00:59:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 643CA22A83
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 00:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 643CA22A83
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zfN+ARlYbfgbtGyTpG4dPTB93RNXOFy6WXdHc8ylTPY=; b=qZ3uPm3geKfbJ5SvUa/ZJVhtg
	GnDUHCW6y9JL0RW7j5li8frxDXOt5mIRzcc6/PmtL0iUPYPsb2ahY9K6caTb7j71UgATgY3Lo7esJ
	WMByxFW4b+Wh21+9u0hxhbkWzD040cVJoK2TsxXWGa4as49CmDWkIxDWM7y8eHBrKHAhcFuxaEVZ3
	CpfYh62yfdyuhG392NBbrAFVPLMRCrXbkfcmwHGbOHbpRu6INbF+8qaFy3G5gbTD7yLZh4Cf4OgFJ
	aBk/R6zr4wyFJkGK0wLXZoS4zvBMRQvYIrXMY2bmZ3HB6mCUQlF73y8gDGTP5BhKB+D7w288ZFBj0
	Tyvj5BLNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwahH-0005F0-Ca; Tue, 05 Jan 2021 00:59:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwahA-0005Bv-FX; Tue, 05 Jan 2021 00:59:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3382F22795;
 Tue,  5 Jan 2021 00:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609808371;
 bh=DOn/dF1JQSKk+Qo6oym2pLOpByqawptwcz/+AmpGngs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OnHDtJHlQWE7MKfL1ajDhd0bmAUKehYlbxUdY+nvy17RL0V4Dc3uUcn1+tgcFgfNZ
 zYjED+f/uT7D5SP70WACFiF6yAH6JO3it8RrBfvrrcmpqC9zZzwiR94nDBLLBKBkeL
 8AcaDNCrj/QDZyG7E9E7NoBh8KSVC9qqrQh6hpO281y7x3O2NZthqqV/Dn/zlOsPoD
 qr03+X4+GI2rFoMyeFHLA3JRZbafDTNhyux+NIkzFE68I/PoWCpHSWBKyCVFs0Svfp
 b1IzieVLMy2ZWR4UAh0/RCF5NoFWluyFZyaex6mLhWpMpyleYvjv/Pi+wZtCe1kzlN
 bft+GHzHIbyvQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 10/17] scsi: ide: Mark power management requests
 with RQF_PM instead of RQF_PREEMPT
Date: Mon,  4 Jan 2021 19:59:08 -0500
Message-Id: <20210105005915.3954208-10-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105005915.3954208-1-sashal@kernel.org>
References: <20210105005915.3954208-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_195932_657355_3A3988C1 
X-CRM114-Status: GOOD (  14.41  )
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

[ Upstream commit 5ae65383fc7633e0247c31b0c8bf0e6ea63b95a3 ]

This is another step that prepares for the removal of RQF_PREEMPT.

Link: https://lore.kernel.org/r/20201209052951.16136-5-bvanassche@acm.org
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
 drivers/ide/ide-io.c | 2 +-
 drivers/ide/ide-pm.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ide/ide-io.c b/drivers/ide/ide-io.c
index c210ea3bd02fa..4867b67b60d69 100644
--- a/drivers/ide/ide-io.c
+++ b/drivers/ide/ide-io.c
@@ -518,7 +518,7 @@ blk_status_t ide_issue_rq(ide_drive_t *drive, struct request *rq,
 		 */
 		if ((drive->dev_flags & IDE_DFLAG_BLOCKED) &&
 		    ata_pm_request(rq) == 0 &&
-		    (rq->rq_flags & RQF_PREEMPT) == 0) {
+		    (rq->rq_flags & RQF_PM) == 0) {
 			/* there should be no pending command at this point */
 			ide_unlock_port(hwif);
 			goto plug_device;
diff --git a/drivers/ide/ide-pm.c b/drivers/ide/ide-pm.c
index 192e6c65d34e7..82ab308f1aafe 100644
--- a/drivers/ide/ide-pm.c
+++ b/drivers/ide/ide-pm.c
@@ -77,7 +77,7 @@ int generic_ide_resume(struct device *dev)
 	}
 
 	memset(&rqpm, 0, sizeof(rqpm));
-	rq = blk_get_request(drive->queue, REQ_OP_DRV_IN, BLK_MQ_REQ_PREEMPT);
+	rq = blk_get_request(drive->queue, REQ_OP_DRV_IN, BLK_MQ_REQ_PM);
 	ide_req(rq)->type = ATA_PRIV_PM_RESUME;
 	ide_req(rq)->special = &rqpm;
 	rqpm.pm_step = IDE_PM_START_RESUME;
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
