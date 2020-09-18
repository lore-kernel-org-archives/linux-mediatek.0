Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F324C43465
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 02:04:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3567235FD
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 02:04:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HbRpcc3b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dt7zA69E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3567235FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r7zFj1SMcBtK4/4Nsov9p0mfiX3c0mkroK5aJs4txNc=; b=HbRpcc3bggvQf1yA6gXvfeK8u
	NdNo2r3PKbM/D8DJmh6DS0NZnUUvL1ivcBZOPkTdjriUJoL6yGUyy4OC0C6H24NNZ+O87NCflQa1Z
	DcVH9HZ1Gej6xKGAEiESZNoXI5b/viIJKXdSC/d2N9PEI5FiUegM2NqLmUwi3+IGLsisQzFv7VmpD
	ENYT2/xhZDpLJ0kiTyC3y9o6JAgfRL7eLhu0SdAFgVvFXzq/Dp5y4oCoBGY88HIpIMDDD7njRxaJt
	3bp7iMBWCvVAtHYa/wwfc7+ugktGY46nAWCPU47orH/1m3DlLAQBGFEB4VORw4sEJoyYCZV4x4oU3
	1kZtTLYgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ5kf-0002qU-HX; Fri, 18 Sep 2020 02:03:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ5js-0002PW-W2; Fri, 18 Sep 2020 02:03:06 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 76400235F7;
 Fri, 18 Sep 2020 02:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394583;
 bh=4ArYKZ/cOZ/rDNpNLfku/rCgHABEw+VMVH8kjYJ4YY4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dt7zA69E0lKA8+YMOJFQMqYPlc8idAawpmR2/nzODhDp3LloAHFEAHNNSjYR4xsQu
 5+jZCvso7i+4BEi5ga/HlRBdkCUbFZ7Wxh0RJknf1qmoo3Ry1zy6OP5EMICmyD/Y/c
 eYlNogGRSP5dyoUxK29HJGWXcCTOg4zr8TfowcUY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 093/330] scsi: ufs: Fix a race condition in the
 tracing code
Date: Thu, 17 Sep 2020 21:57:13 -0400
Message-Id: <20200918020110.2063155-93-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_220305_112827_191AEC62 
X-CRM114-Status: GOOD (  14.03  )
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
Cc: Sasha Levin <sashal@kernel.org>, Bart Van Assche <bvanassche@acm.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Avri Altman <avri.altman@wdc.com>, Can Guo <cang@codeaurora.org>,
 linux-mediatek@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-scsi@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bart Van Assche <bvanassche@acm.org>

[ Upstream commit eacf36f5bebde5089dddb3d5bfcbeab530b01f8a ]

Starting execution of a command before tracing a command may cause the
completion handler to free data while it is being traced. Fix this race by
tracing a command before it is submitted.

Cc: Bean Huo <beanhuo@micron.com>
Cc: Can Guo <cang@codeaurora.org>
Cc: Avri Altman <avri.altman@wdc.com>
Cc: Stanley Chu <stanley.chu@mediatek.com>
Cc: Tomas Winkler <tomas.winkler@intel.com>
Link: https://lore.kernel.org/r/20191224220248.30138-5-bvanassche@acm.org
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufshcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 020a93a40a982..d538b3d4f74a5 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -1888,12 +1888,12 @@ void ufshcd_send_command(struct ufs_hba *hba, unsigned int task_tag)
 {
 	hba->lrb[task_tag].issue_time_stamp = ktime_get();
 	hba->lrb[task_tag].compl_time_stamp = ktime_set(0, 0);
+	ufshcd_add_command_trace(hba, task_tag, "send");
 	ufshcd_clk_scaling_start_busy(hba);
 	__set_bit(task_tag, &hba->outstanding_reqs);
 	ufshcd_writel(hba, 1 << task_tag, REG_UTP_TRANSFER_REQ_DOOR_BELL);
 	/* Make sure that doorbell is committed immediately */
 	wmb();
-	ufshcd_add_command_trace(hba, task_tag, "send");
 }
 
 /**
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
