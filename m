Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 245D5C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 00:59:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B732227C3
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 00:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B732227C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UZpdvfzHJKITVpvjD2i9V8li0EEtclSQnB6NxPoKjJM=; b=sfc5/nGyZ9l6NzIE03VYwOz5V
	+K70knSxFtw1QoqKzK6LcWbZBTaTIk6gZyiu518PTk014KHTG2ltLO7cwFqXjTP+m6UfEmoMcTHpY
	q63dN1TC6u03tgMtrfZxgCKoSg3yGagcwCoxnd6y2rsyhNiM3yS1pAtyXLEdF+m8VjITZjZs/ud3r
	S3/gzjbugdRTgERm7h/BdGTOrW3t7FpP6wqWCOWKTQsqb+djhAonJLmRUH+MOAOtkLDuOYAjAJyk7
	c5ouVVLhxN4+MDEgWShCfBjajXHFHX81F9bKKIAwNwzU+kwqm3ByFBeOlr2Wsjsatt59zd7lTBxH4
	o7V7G7ujw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwah3-0005AL-1R; Tue, 05 Jan 2021 00:59:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwagz-00059r-DS; Tue, 05 Jan 2021 00:59:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 97AF622581;
 Tue,  5 Jan 2021 00:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609808360;
 bh=p9/ot+8cguDCXR5x0/upe/u3QXAAv78RzEbKzbOalkY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=svheP+Tyk14UERaRZr5m5f8EgIKooDiM3f/1QjdqTZ71wMXiwjJTww/Ed3dAzlpih
 Yvu2CNN382yrF2twrjy8PvntLMBcYJ56g6OBAJZYaHgwGRZ9t8Vcvrq8usI7pTjFaS
 Zsl/dsVnoKCFXshPmEqg253oOOiGcFfdpP4OzeIrkAf2hxeVxPWpyCBpK8dt1ubRYN
 o/zNpOr7nnq0bV7SUQcvG6K13LT29pbfs+FQg3l6eWJSro1mTX4R2bkrejOsfnphpC
 VhZl7MrMjiWwEhAamZDZyYYSCVJzfHOYasWEPE97C3YSpA6u+um+JtpmVYbelX10NW
 h1icjcjHqNHDQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 03/17] scsi: ufs: Clear UAC for RPMB after ufshcd
 resets
Date: Mon,  4 Jan 2021 19:59:01 -0500
Message-Id: <20210105005915.3954208-3-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105005915.3954208-1-sashal@kernel.org>
References: <20210105005915.3954208-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_195921_542135_0E50D8D8 
X-CRM114-Status: GOOD (  12.42  )
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
Cc: Sasha Levin <sashal@kernel.org>, Randall Huang <huangrandall@google.com>,
 kernel test robot <lkp@intel.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-scsi@vger.kernel.org, Leo Liou <leoliou@google.com>,
 Stanley Chu <stanley.chu@mediatek.com>, Jaegeuk Kim <jaegeuk@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Randall Huang <huangrandall@google.com>

[ Upstream commit 1918651f2d7e8d58c9b7c49755c61e41ed655009 ]

If RPMB is not provisioned, we may see RPMB failure after UFS
suspend/resume.  Inject request_sense to clear uac in ufshcd reset flow.

Link: https://lore.kernel.org/r/20201201041402.3860525-1-jaegeuk@kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Randall Huang <huangrandall@google.com>
Signed-off-by: Leo Liou <leoliou@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@google.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufshcd.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index d7e9c4bc80478..ec7005bcf61d8 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -220,6 +220,7 @@ static int ufshcd_reset_and_restore(struct ufs_hba *hba);
 static int ufshcd_eh_host_reset_handler(struct scsi_cmnd *cmd);
 static int ufshcd_clear_tm_cmd(struct ufs_hba *hba, int tag);
 static void ufshcd_hba_exit(struct ufs_hba *hba);
+static int ufshcd_clear_ua_wluns(struct ufs_hba *hba);
 static int ufshcd_probe_hba(struct ufs_hba *hba, bool async);
 static int __ufshcd_setup_clocks(struct ufs_hba *hba, bool on,
 				 bool skip_ref_clk);
@@ -6842,7 +6843,8 @@ static int ufshcd_host_reset_and_restore(struct ufs_hba *hba)
 
 	/* Establish the link again and restore the device */
 	err = ufshcd_probe_hba(hba, false);
-
+	if (!err)
+		ufshcd_clear_ua_wluns(hba);
 out:
 	if (err)
 		dev_err(hba->dev, "%s: Host init failed %d\n", __func__, err);
@@ -8274,13 +8276,7 @@ static int ufshcd_set_dev_pwr_mode(struct ufs_hba *hba,
 	 * handling context.
 	 */
 	hba->host->eh_noresume = 1;
-	if (hba->wlun_dev_clr_ua) {
-		ret = ufshcd_send_request_sense(hba, sdp);
-		if (ret)
-			goto out;
-		/* Unit attention condition is cleared now */
-		hba->wlun_dev_clr_ua = false;
-	}
+	ufshcd_clear_ua_wluns(hba);
 
 	cmd[4] = pwr_mode << 4;
 
@@ -8301,7 +8297,7 @@ static int ufshcd_set_dev_pwr_mode(struct ufs_hba *hba,
 
 	if (!ret)
 		hba->curr_dev_pwr_mode = pwr_mode;
-out:
+
 	scsi_device_put(sdp);
 	hba->host->eh_noresume = 0;
 	return ret;
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
