Return-Path: <SRS0=12Pn=BT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13F5C433E1
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 12:17:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A035206A2
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 12:17:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mdMC9Der"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A035206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yR5Ne6vFHgMKhEq0wcNLDeeNalxbFWf56tdQaCxCye0=; b=mdMC9DertbyF4h79oXX0SmugQ5
	+AjxVUQQdv9MpOGLO9iIp6FWl6tVET6JFNsjAU3rwH+xYx0wt5tTHcDKE51CbV9vPH/WpLZUVH2Vi
	SA5Q+Y8DKvNGOKXspDURnEZMfQQD4ZB/sIBSAOzgDt1NFx0O7cx18RjXwYVqMqVngiUZT5E5BSQny
	5MsZs+lTphIF8oEfvtshUBGaxrHBPTsZv6okbDANVMEuly5fb2xHEtUWVHnd0VjwJyiHM5WLzDs5t
	MiXaMrc8ipk39qesEuDnLCL1B1tdi7+JF4zZgyjPVykn2cmZ+xDH0DrWjsm/MNNk6ziqYXxhU6/Z/
	KJZCz2Hg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4kFw-0003vt-Im; Sun, 09 Aug 2020 12:16:52 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4kFk-0003uJ-6u; Sun, 09 Aug 2020 12:16:41 +0000
IronPort-SDR: yssPynAa+KB3fJ5xFlAz6+8VyxgQIDBqTyEBCW7y56j0EeM9Sv8MbR4pzyH9mINWtYQGZP2+V2
 ohzFu1iPS29+MrL8ytpycWwTmMOtr7G2tkHJO8WNEVVWoFCY9z5f/9UQxx5/BGz1dk8ChP1Afd
 oa6NZjOtNtfw8wyYx+1JJd0AD93szwXkbJZ7VpRajwo+lgBGiSvDVs+OYiZXb4AWLA0K752HZr
 Z18quy9XXI6vlfuF7HJU4zJoIpRFTigY3pFkOQGUFSUjfsvPXROZnQlK8XABtBxzwrws1IOekI
 dXc=
X-IronPort-AV: E=Sophos;i="5.75,453,1589266800"; d="scan'208";a="47246501"
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by labrats.qualcomm.com with ESMTP; 09 Aug 2020 05:16:40 -0700
Received: from stor-presley.qualcomm.com ([192.168.140.85])
 by ironmsg01-sd.qualcomm.com with ESMTP; 09 Aug 2020 05:16:38 -0700
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
 id CBE512156E; Sun,  9 Aug 2020 05:16:38 -0700 (PDT)
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 rnayak@codeaurora.org, linux-scsi@vger.kernel.org, kernel-team@android.com,
 saravanak@google.com, salyzyn@google.com, cang@codeaurora.org
Subject: [PATCH 9/9] scsi: ufs: Properly release resources if a task is
 aborted successfully
Date: Sun,  9 Aug 2020 05:15:55 -0700
Message-Id: <1596975355-39813-10-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596975355-39813-1-git-send-email-cang@codeaurora.org>
References: <1596975355-39813-1-git-send-email-cang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200809_081640_545440_C04074B8 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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
Cc: Santosh Y <santoshsy@gmail.com>,
 Sujit Reddy Thumma <sthumma@codeaurora.org>,
 Bart Van Assche <bvanassche@acm.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>,
 James Bottomley <JBottomley@Parallels.com>, Avri Altman <avri.altman@wdc.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Dolev Raviv <draviv@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Bean Huo <beanhuo@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In current UFS task abort hook, namely ufshcd_abort(), if one task is
aborted successfully, clk_gating.active_reqs held by this task is not
decreased, which makes clk_gating.active_reqs stay above zero forever,
thus clock gating would never happen. Instead of releasing resources of
one task "manually", use the existing func __ufshcd_transfer_req_compl().
This change can also eliminate possible racing of scsi_dma_unmap() from
the real completion in IRQ handler path.

Fixes: 5a0b0cb9bee76 ("ufs: Add support for clock gating")
Signed-off-by: Can Guo <cang@codeaurora.org>
CC: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 9ebb5cd..efb40b1 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6636,11 +6636,8 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 		goto out;
 	}
 
-	scsi_dma_unmap(cmd);
-
 	spin_lock_irqsave(host->host_lock, flags);
-	ufshcd_outstanding_req_clear(hba, tag);
-	hba->lrb[tag].cmd = NULL;
+	__ufshcd_transfer_req_compl(hba, (1UL << tag));
 	spin_unlock_irqrestore(host->host_lock, flags);
 
 out:
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
