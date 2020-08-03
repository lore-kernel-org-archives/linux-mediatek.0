Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C1EC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 09:05:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 247FC2068F
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 09:05:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gBxZnWHn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 247FC2068F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bW3yTIZhGNw2BCNWvfBSbRBVEfrjqtv3qZIMHSvfWHk=; b=gBxZnWHnIT+MiP5gshIyju9fvf
	zceLrQN1FMqIWeiG/h+Lne03rhlAOKxsA0FjkutI+tddd735gu0FAB3tGN8N6BQ7ca4aCuY04wTw5
	Mupf2JpBjfkv2Jx72Pcm2g5YQgL3D40jRmX876nzaECNc00mswWwbSgviEYyqk02ClaUwDEa5y4bT
	e7oI2+BwZmlhwPYTdtNlX4MfxGX9wVdA23PO9zkLyGhIn6ehhlFs0zorywBvIzH1NrDFHprnHoYzn
	fjIfi910mrgpoDvbcMizT3Y1OGqZIZNaLZ6+3zxcUwmVJ/2HmjmaHLtZsCy+BRts8vneFb1K+x6BG
	gaAL5tFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2WPR-0004zc-31; Mon, 03 Aug 2020 09:05:29 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2WPK-0004wE-6b; Mon, 03 Aug 2020 09:05:24 +0000
IronPort-SDR: tiMR4BmNoE4dGZXEe91/ql5tjyhGGdcKzVBe6GFDh5EPp4+AcxMCmZLDPHJnWA+sOQv/ltA46z
 mU9ijqkmdMJlQJfcxSytc4TKkbX1cpn6x0No59DuvABy0CJ+EIcDljLzOIrkcvMfhgjml9fMSl
 ajgrm5HGIE0QMkK9vXIrj6WOxkgCAfyiY9pBjBzq7RDZj34UlBm2tXzcfjinD4Y5+jB4Vzkf5p
 XO9a9aETGR7DJVr6EFFR7BJ2Lnit4TMbXXnrQhbFIgsLKUTw9FOTtdAq3ZtR4U9mniBa1uo57M
 W9A=
X-IronPort-AV: E=Sophos;i="5.75,429,1589266800"; d="scan'208";a="47240958"
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by labrats.qualcomm.com with ESMTP; 03 Aug 2020 02:05:21 -0700
Received: from stor-presley.qualcomm.com ([192.168.140.85])
 by ironmsg02-sd.qualcomm.com with ESMTP; 03 Aug 2020 02:05:20 -0700
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
 id 0AB2A214E4; Mon,  3 Aug 2020 02:05:21 -0700 (PDT)
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 rnayak@codeaurora.org, linux-scsi@vger.kernel.org, kernel-team@android.com,
 saravanak@google.com, salyzyn@google.com, cang@codeaurora.org
Subject: [PATCH v9 9/9] scsi: ufs: Properly release resources if a task is
 aborted successfully
Date: Mon,  3 Aug 2020 02:04:44 -0700
Message-Id: <1596445485-19834-10-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596445485-19834-1-git-send-email-cang@codeaurora.org>
References: <1596445485-19834-1-git-send-email-cang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_050522_452447_019090C3 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>, Avri Altman <avri.altman@wdc.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Bean Huo <beanhuo@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In current UFS task abort hook, namely ufshcd_abort(), if a task is
aborted successfully, clock scaling busy time statistics is not updated
and, most important, clk_gating.active_reqs is not decreased, which makes
clk_gating.active_reqs stay above zero forever, thus clock gating would
never happen. To fix it, instead of releasing resources "mannually", use
the existing func __ufshcd_transfer_req_compl(). This can also eliminate
racing of scsi_dma_unmap() from the real completion in IRQ handler path.

Signed-off-by: Can Guo <cang@codeaurora.org>
CC: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index d7d2758..9a48389 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6635,11 +6635,8 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
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
