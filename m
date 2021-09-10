Return-Path: <SRS0=J3PH=OA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54113C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 00:37:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E672600AA
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 00:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E672600AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KX7IXfDQ7EsLpBkJbly/12VOgDB+r6M/jLjEkOTb/M=; b=k5eb/bYE13nrvC
	SjfQmyuvSlfIzv7O4e9dlkOiv/qJYnIDOKyFfmDLIll03Nm4w6ZTfUZorXMOEl3q86gqt/3sFFGUj
	M3CtKixd57dyC/RxjRxkaGijH61zmnSYic3b67Gxw5aOwoiTpRN+IAwXrML05cOmm9cOntu4Ea0iC
	Lzkir20OLdKdUpqiubKOOvBTZ45Y6d3Gcfqz8rmmi5qN0oGHmheolBoR2I2F/qc8sl8t901sNvKNU
	h58MihUEJfdWcpwk2a9BAJFyC2wrfDQQLl10PeB9Dz6gpprdp/VZMLt137369Lzjm+dgARlaSDO0h
	W0UdeVKNqNtgn5v4+8bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOUXI-00BMpY-B4; Fri, 10 Sep 2021 00:36:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOUIp-00BG38-I5; Fri, 10 Sep 2021 00:22:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DFE360F6C;
 Fri, 10 Sep 2021 00:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233319;
 bh=dtQE6qpxahyt6p2yznUbHA//kAq5UXiIVqJAS7BSAmc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ALbpLLYUtg/dbyv+PxAgDercLO6B2xRSKQSqOHxQMuT44ij09ejHWZfNUHb3n+UEb
 hckfJd840rwD0gVY6la0c/7NwEcGZju/VFyr+sXL6p8MexbZevPMZwA5WjHH8ULOK6
 AgmYAgZYQPjad1uG15srlcji5uXtOXJ4Qbtql7UljTkPTdpvdaBJVstUOIVJX8+m9S
 uGi1UCMbfs1k/W5OdYQCoFMsFugsTgOXalYTSXnCzrKTpaNQe74P1ZfMgO6lAK52+5
 uRlM9ce/3vNkKYw2luyJhKancSId1RTJpi4voA0fAGARoEMurvIgYw0JR0K23EoBtQ
 E966SSXTcCPUA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bart Van Assche <bvanassche@acm.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Stanley Chu <stanley.chu@mediatek.com>, Can Guo <cang@codeaurora.org>,
 Asutosh Das <asutoshd@codeaurora.org>, Avri Altman <avri.altman@wdc.com>,
 Bean Huo <beanhuo@micron.com>, Daejun Park <daejun7.park@samsung.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Sasha Levin <sashal@kernel.org>, linux-scsi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 11/37] scsi: ufs: Verify UIC locking requirements
 at runtime
Date: Thu,  9 Sep 2021 20:21:16 -0400
Message-Id: <20210910002143.175731-11-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910002143.175731-1-sashal@kernel.org>
References: <20210910002143.175731-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_172159_696429_C7D42F9E 
X-CRM114-Status: GOOD (  13.67  )
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

[ Upstream commit 35c7d874f5993db04ce3aa310ae088f14b801eda ]

Instead of documenting the locking requirements of the UIC code as
comments, use lockdep_assert_held() such that lockdep verifies the lockdep
requirements at runtime if lockdep is enabled.

Link: https://lore.kernel.org/r/20210722033439.26550-8-bvanassche@acm.org
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Stanley Chu <stanley.chu@mediatek.com>
Cc: Can Guo <cang@codeaurora.org>
Cc: Asutosh Das <asutoshd@codeaurora.org>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Daejun Park <daejun7.park@samsung.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufshcd.c | 16 +++++++++-------
 drivers/scsi/ufs/ufshcd.h |  2 +-
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 0429ba5d7d23..f8d0fe6cb09d 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1986,15 +1986,15 @@ static inline u8 ufshcd_get_upmcrs(struct ufs_hba *hba)
 }
 
 /**
- * ufshcd_dispatch_uic_cmd - Dispatch UIC commands to unipro layers
+ * ufshcd_dispatch_uic_cmd - Dispatch an UIC command to the Unipro layer
  * @hba: per adapter instance
  * @uic_cmd: UIC command
- *
- * Mutex must be held.
  */
 static inline void
 ufshcd_dispatch_uic_cmd(struct ufs_hba *hba, struct uic_command *uic_cmd)
 {
+	lockdep_assert_held(&hba->uic_cmd_mutex);
+
 	WARN_ON(hba->active_uic_cmd);
 
 	hba->active_uic_cmd = uic_cmd;
@@ -2010,11 +2010,10 @@ ufshcd_dispatch_uic_cmd(struct ufs_hba *hba, struct uic_command *uic_cmd)
 }
 
 /**
- * ufshcd_wait_for_uic_cmd - Wait complectioin of UIC command
+ * ufshcd_wait_for_uic_cmd - Wait for completion of an UIC command
  * @hba: per adapter instance
  * @uic_cmd: UIC command
  *
- * Must be called with mutex held.
  * Returns 0 only if success.
  */
 static int
@@ -2023,6 +2022,8 @@ ufshcd_wait_for_uic_cmd(struct ufs_hba *hba, struct uic_command *uic_cmd)
 	int ret;
 	unsigned long flags;
 
+	lockdep_assert_held(&hba->uic_cmd_mutex);
+
 	if (wait_for_completion_timeout(&uic_cmd->done,
 					msecs_to_jiffies(UIC_CMD_TIMEOUT)))
 		ret = uic_cmd->argument2 & MASK_UIC_COMMAND_RESULT;
@@ -2042,14 +2043,15 @@ ufshcd_wait_for_uic_cmd(struct ufs_hba *hba, struct uic_command *uic_cmd)
  * @uic_cmd: UIC command
  * @completion: initialize the completion only if this is set to true
  *
- * Identical to ufshcd_send_uic_cmd() expect mutex. Must be called
- * with mutex held and host_lock locked.
  * Returns 0 only if success.
  */
 static int
 __ufshcd_send_uic_cmd(struct ufs_hba *hba, struct uic_command *uic_cmd,
 		      bool completion)
 {
+	lockdep_assert_held(&hba->uic_cmd_mutex);
+	lockdep_assert_held(hba->host->host_lock);
+
 	if (!ufshcd_ready_for_uic_cmd(hba)) {
 		dev_err(hba->dev,
 			"Controller not ready to accept UIC commands\n");
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 92ef6e6a3e51..803a2a37875b 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -493,7 +493,7 @@ struct ufs_stats {
  * @priv: pointer to variant specific private data
  * @irq: Irq number of the controller
  * @active_uic_cmd: handle of active UIC command
- * @uic_cmd_mutex: mutex for uic command
+ * @uic_cmd_mutex: mutex for UIC command
  * @tmf_tag_set: TMF tag set.
  * @tmf_queue: Used to allocate TMF tags.
  * @pwr_done: completion for power mode change
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
