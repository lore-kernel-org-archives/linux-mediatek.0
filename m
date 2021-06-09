Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808D3C47095
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 09:10:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5425D61285
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 09:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5425D61285
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gl6weipjhW68cPeL4xZ3LRe4P3ViVV3wh+/bVHDZqnQ=; b=QqoYtGuQEJxxMT
	bc4pXx39g9GmuJAWd6rEw0h6M5+dQccKqPBINFEXH/seJLPP9uO+VXjIEuHePEsDhAYNi0948NqpS
	pZ4le3iKtdj2powq/C19vk73QUQz6/82k/NxvNaoKCDDTaUvsJScKD2RWSfVW1dQjg6mTHEOnZHwx
	mCAxeiy3ab37Oh6ZGrq4N8kqM3aqh45Hvzs5SlKC9wfccr9T6CwkX/XMrMWiQcZJ1wHNOBVnAHpjq
	mb6Jssq5EfmChl5XONXfPEI85u0R+/yJDDgkYxt54CflQrIvUwsvQNPXDHA9yqeMAb8lD+DDgw4sI
	aEKzWSeYo9NliK3/piPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lquDx-00Ca02-B0; Wed, 09 Jun 2021 09:10:09 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqtVQ-00CMPo-2P; Wed, 09 Jun 2021 08:24:09 +0000
IronPort-SDR: 3RIrc1zMYL0CwGu753WOSZXjPYtsfKXr4Z/Lc7IRt4hQuKlapzYLVjuwft4CVJ8rY8nhScLXsK
 FULjQS5sFz+7zcMSpbN09NYwZyMdY1eWY5VepZwZYEYt9B+t4apssR4bPVxoTaiDP4rh1PLUTC
 4R7dOZFiueQWbYx3m8GN3m8PnSC6Uyum1+4HCWR3WgWy2g0oGPLbcvuxy2/2ix91Zi5BeLrziJ
 sOLikgPWeZdOipf7aG63FZoEvqwS84wMyhMNt1ShRMLxZDC6FS3cSY3XZ9Qm6tzjw2o/39HOJ9
 F4U=
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; d="scan'208";a="29778265"
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by labrats.qualcomm.com with ESMTP; 09 Jun 2021 01:24:07 -0700
X-QCInternal: smtphost
Received: from stor-presley.qualcomm.com ([192.168.140.85])
 by ironmsg03-sd.qualcomm.com with ESMTP; 09 Jun 2021 01:24:06 -0700
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
 id 1644321B40; Wed,  9 Jun 2021 01:24:06 -0700 (PDT)
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 ziqichen@codeaurora.org, linux-scsi@vger.kernel.org,
 kernel-team@android.com, cang@codeaurora.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, Bean Huo <beanhuo@micron.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org (open list),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v3] scsi: ufs: Fix a possible use before initialization case
Date: Wed,  9 Jun 2021 01:24:00 -0700
Message-Id: <1623227044-22635-1-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_012408_184361_9B7A5ECF 
X-CRM114-Status: GOOD (  11.13  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In ufshcd_exec_dev_cmd(), if error happens before lrpb is initialized,
then we should bail out instead of letting trace record the error.

Fixes: a45f937110fa6 ("scsi: ufs: Optimize host lock on transfer requests send/compl paths")
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Can Guo <cang@codeaurora.org>
---

Change since V2:
- Removed unused goto out_put_tag

Change since V1:
- Use codeaurora mail in Signed-off-by tag

 drivers/scsi/ufs/ufshcd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index fe1b5f4..25fe18a 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -2980,7 +2980,7 @@ static int ufshcd_exec_dev_cmd(struct ufs_hba *hba,
 	WARN_ON(lrbp->cmd);
 	err = ufshcd_compose_dev_cmd(hba, lrbp, cmd_type, tag);
 	if (unlikely(err))
-		goto out_put_tag;
+		goto out;
 
 	hba->dev_cmd.complete = &wait;
 
@@ -2990,11 +2990,10 @@ static int ufshcd_exec_dev_cmd(struct ufs_hba *hba,
 
 	ufshcd_send_command(hba, tag);
 	err = ufshcd_wait_for_dev_cmd(hba, lrbp, timeout);
-out:
 	ufshcd_add_query_upiu_trace(hba, err ? UFS_QUERY_ERR : UFS_QUERY_COMP,
 				    (struct utp_upiu_req *)lrbp->ucd_rsp_ptr);
 
-out_put_tag:
+out:
 	blk_put_request(req);
 out_unlock:
 	up_read(&hba->clk_scaling_lock);
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
