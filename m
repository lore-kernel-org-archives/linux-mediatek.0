Return-Path: <SRS0=J3PH=OA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AD6C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 00:17:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD7DB611C9
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 00:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD7DB611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/86tEV/1mgytpb+ELHz6He7V3lyxOG9uNnAGvPKY0tQ=; b=2AKXGHO5lv3qmi
	vAUeVlzB7JCGvf+HfaKTMdvT7dezxVJNAvZOFtnJ+17FgdwO9whIhPpX4R6GMREXu99oTQZX3H/Bo
	vp+5Y0v86jAIPzYQ+qY+0b9CrsVo/DfkAmOI13KtEd47tGfutnLg5HmQAf41OxGhyL/GdOXS1SPT0
	SthjgeXxQBUy7eLO+Ae7zKhTZr0GRrfn6H8I4CnguR2ODv4Feqr6h8tG8WB+FF3nNm7plea+nlrfW
	NwGRYKhVkEGm1x7vLS9egp2wMsQmFftcBcwsuUPsiQ9KgpWfBkiq3ICXUxdwPw2DSmtTbrJc88bf+
	sO7gqGou3RitCmtbHKbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOUEF-00BDJs-5O; Fri, 10 Sep 2021 00:17:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOUDh-00BD1Q-IJ; Fri, 10 Sep 2021 00:16:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9DA2611C3;
 Fri, 10 Sep 2021 00:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233001;
 bh=JQ3M0VmSzNeZYdd0bN97o/E8ZQit8PGdocEvTNuEi6k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uYSdTSJpKUtDLEq5GEyRm7K0ae1nWVTI6a8bq69Z+coZv/KZLuwH0VV+LS8PPhaQP
 w+ctinxexhBCjEI46/VGh1FlKvKsgn9NXEisfRxpP4b4PS+4yMOuEFK3VOW2gRcbsz
 F+oo9ubKhofZY37HV8Q6Mhq3txPHWeWTucjKaSTpmyxy9PsQ/36qwBofTwsxOO6ZZk
 Xdz4SxOBS6x8pXUhUtgDJ4QAWwYQlc0HN4ZCcAGeUZBapYOZNUo0gPqplaRVN5o+xQ
 R7BnXNsuB3YyMRnHhZ9of2kB0D7PwjKL3hW/PGARyPsJfvWUgLcFPo3ztBw4emEEaY
 yOOxpShYBbOqw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bart Van Assche <bvanassche@acm.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Stanley Chu <stanley.chu@mediatek.com>, Can Guo <cang@codeaurora.org>,
 Asutosh Das <asutoshd@codeaurora.org>, Avri Altman <avri.altman@wdc.com>,
 Bean Huo <beanhuo@micron.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Sasha Levin <sashal@kernel.org>, linux-scsi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.14 30/99] scsi: ufs: Request sense data
 asynchronously
Date: Thu,  9 Sep 2021 20:14:49 -0400
Message-Id: <20210910001558.173296-30-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910001558.173296-1-sashal@kernel.org>
References: <20210910001558.173296-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_171641_704163_7B642EA0 
X-CRM114-Status: GOOD (  13.83  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bart Van Assche <bvanassche@acm.org>

[ Upstream commit ac1bc2ba060f9609972fb486073ebd9eab1ef3b6 ]

Clearing a unit attention synchronously from inside the UFS error handler
may trigger the following deadlock:

 - ufshcd_err_handler() calls ufshcd_err_handling_unprepare() and the
   latter function calls ufshcd_clear_ua_wluns().

 - ufshcd_clear_ua_wluns() submits a REQUEST SENSE command and that command
   activates the SCSI error handler.

 - The SCSI error handler calls ufshcd_host_reset_and_restore().

 - ufshcd_host_reset_and_restore() executes the following code:
   ufshcd_schedule_eh_work(hba); flush_work(&hba->eh_work);

This sequence results in a deadlock (circular wait). Fix this by requesting
sense data asynchronously.

Link: https://lore.kernel.org/r/20210722033439.26550-16-bvanassche@acm.org
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Stanley Chu <stanley.chu@mediatek.com>
Cc: Can Guo <cang@codeaurora.org>
Cc: Asutosh Das <asutoshd@codeaurora.org>
Cc: Avri Altman <avri.altman@wdc.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufshcd.c | 64 ++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 31 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 3350b0cff9ef..52731dffa624 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -7911,8 +7911,39 @@ static int ufshcd_add_lus(struct ufs_hba *hba)
 	return ret;
 }
 
+static void ufshcd_request_sense_done(struct request *rq, blk_status_t error)
+{
+	if (error != BLK_STS_OK)
+		pr_err("%s: REQUEST SENSE failed (%d)", __func__, error);
+	blk_put_request(rq);
+}
+
 static int
-ufshcd_send_request_sense(struct ufs_hba *hba, struct scsi_device *sdp);
+ufshcd_request_sense_async(struct ufs_hba *hba, struct scsi_device *sdev)
+{
+	/*
+	 * From SPC-6: the REQUEST SENSE command with any allocation length
+	 * clears the sense data.
+	 */
+	static const u8 cmd[6] = {REQUEST_SENSE, 0, 0, 0, 0, 0};
+	struct scsi_request *rq;
+	struct request *req;
+
+	req = blk_get_request(sdev->request_queue, REQ_OP_DRV_IN, /*flags=*/0);
+	if (IS_ERR(req))
+		return PTR_ERR(req);
+
+	rq = scsi_req(req);
+	rq->cmd_len = ARRAY_SIZE(cmd);
+	memcpy(rq->cmd, cmd, rq->cmd_len);
+	rq->retries = 3;
+	req->timeout = 1 * HZ;
+	req->rq_flags |= RQF_PM | RQF_QUIET;
+
+	blk_execute_rq_nowait(/*bd_disk=*/NULL, req, /*at_head=*/true,
+			      ufshcd_request_sense_done);
+	return 0;
+}
 
 static int ufshcd_clear_ua_wlun(struct ufs_hba *hba, u8 wlun)
 {
@@ -7940,7 +7971,7 @@ static int ufshcd_clear_ua_wlun(struct ufs_hba *hba, u8 wlun)
 	if (ret)
 		goto out_err;
 
-	ret = ufshcd_send_request_sense(hba, sdp);
+	ret = ufshcd_request_sense_async(hba, sdp);
 	scsi_device_put(sdp);
 out_err:
 	if (ret)
@@ -8535,35 +8566,6 @@ static void ufshcd_hba_exit(struct ufs_hba *hba)
 	}
 }
 
-static int
-ufshcd_send_request_sense(struct ufs_hba *hba, struct scsi_device *sdp)
-{
-	unsigned char cmd[6] = {REQUEST_SENSE,
-				0,
-				0,
-				0,
-				UFS_SENSE_SIZE,
-				0};
-	char *buffer;
-	int ret;
-
-	buffer = kzalloc(UFS_SENSE_SIZE, GFP_KERNEL);
-	if (!buffer) {
-		ret = -ENOMEM;
-		goto out;
-	}
-
-	ret = scsi_execute(sdp, cmd, DMA_FROM_DEVICE, buffer,
-			UFS_SENSE_SIZE, NULL, NULL,
-			msecs_to_jiffies(1000), 3, 0, RQF_PM, NULL);
-	if (ret)
-		pr_err("%s: failed with err %d\n", __func__, ret);
-
-	kfree(buffer);
-out:
-	return ret;
-}
-
 /**
  * ufshcd_set_dev_pwr_mode - sends START STOP UNIT command to set device
  *			     power mode
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
