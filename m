Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B2DC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:29:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B1F122DFA
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 12:29:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J3WACxAv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B1F122DFA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7r6g6Q+lYn7B5mmNyITl3toxNq9ivzADwyKI1g2jb9A=; b=J3WACxAvwpZcamVfdQfZyXBbkR
	Ti9wm8HLtjJgpckGIVLXgarRiB/s6E7QvUvcgTvXJ95B7lzmPSKWZr/xTnREzrNpabMf0pjW3KCnz
	Qrs6avcu2heWCOgVFzTv5FtbRrjiqbzvqGA0nHaesj/jMB74PAlqdO9pIXC9+VnLIPUzabzj7STIg
	2AutQLut+fI9STnJRtftn8GAxZdq+tc0UcuI/Nw37hcI5L2vurCpbutGrrLGGLvtNBrHT6MhiL2Lq
	jeNEz9Oy5mGYzwmCqLdGhALvMpGnSq/VF2XJm23d5etyvrLv6Jb5dvB+N8v3NSYJThae7bhYF1WaT
	+WUKkHyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3Y7Q-0000wL-Lg; Thu, 06 Aug 2020 05:07:08 +0000
Received: from labrats.qualcomm.com ([199.106.110.90])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3Y7N-0000vG-43; Thu, 06 Aug 2020 05:07:05 +0000
IronPort-SDR: QLVrMAOEpUUgTjsvYyz0a51seXYBaPgpETDw5Qyl6hTyOv4IIZ0wZ/qjPIR84Fc21aFvbVtmyy
 bY7wkePJzez75bac8OW0bapsr7te5gNNUn/bGjLTXw6D6PmAZdokjkkc7OfI1zIE/B0w69d87H
 vCnncy80cu+7lr6wWFN7WE42ysz6wOPpgDSpWX29+4BIZOWojIOjmyEvxUTrKg98Y30hTy5n8B
 z0HhIL06ehxA3n3QqHRNhicrvwgJ7odwX55ya8llmBmvXVWVY+lK/TlLfNKLIlxcTpb8pggV7e
 I4E=
X-IronPort-AV: E=Sophos;i="5.75,440,1589266800"; d="scan'208";a="29068261"
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by labrats.qualcomm.com with ESMTP; 05 Aug 2020 22:07:04 -0700
Received: from stor-presley.qualcomm.com ([192.168.140.85])
 by ironmsg02-sd.qualcomm.com with ESMTP; 05 Aug 2020 22:07:03 -0700
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
 id 06A2621562; Wed,  5 Aug 2020 22:07:04 -0700 (PDT)
From: Can Guo <cang@codeaurora.org>
To: asutoshd@codeaurora.org, nguyenb@codeaurora.org, hongwus@codeaurora.org,
 rnayak@codeaurora.org, linux-scsi@vger.kernel.org, kernel-team@android.com,
 saravanak@google.com, salyzyn@google.com, cang@codeaurora.org
Subject: [PATCH 9/9] scsi: ufs: Properly release resources if a task is
 aborted successfully
Date: Wed,  5 Aug 2020 22:06:20 -0700
Message-Id: <1596690383-16438-10-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596690383-16438-1-git-send-email-cang@codeaurora.org>
References: <1596690383-16438-1-git-send-email-cang@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_010705_318617_94DB9A78 
X-CRM114-Status: UNSURE (   7.66  )
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
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index b2947ab..9541fc7 100644
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
