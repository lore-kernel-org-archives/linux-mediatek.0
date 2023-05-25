Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09949C7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 18:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14NDPODyriVKk3psoRtKc89ZLbbPeVnEQQMFmIcHOyg=; b=W/NaBnCHy8K9UMS3UkiUaPET9l
	KKDfFcgQ4lmDdN8ar64c2H086GwIiUwlQUUecdODFc0BuzEet19mQGT/KUxKE5bEUU3Z5DRC3kVY8
	X49V0CnYyYQuw/RYgF5NwGVtWdoYJEvJAkPdoyfCRkZ1TYOpkSmD0cTjgQOjsSi0lmgNx90MJngiG
	0OS7gAH6zBRlDlkKBsYsiYY5vNwLWJU57uieyP7crvyak1BnSzUGun4vzoDoU22700ZkMmmKG1Ryi
	qvrJYe6RFisjBVy4bskdXnhVEUeXmsVcNDSOnd6PxCAdXOwA2U3osCjyeZyKk/LR2n/zRERN15aUo
	VJn91e+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Fo9-00HQ5d-3C;
	Thu, 25 May 2023 18:35:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Fo7-00HQ3K-0W;
	Thu, 25 May 2023 18:35:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AAA8E648AA;
	Thu, 25 May 2023 18:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B8FFC433D2;
	Thu, 25 May 2023 18:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685039726;
	bh=PRWCD+xhEF1UZpcAgOovW3slI80wQJy3hmteQFBF7Aw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WryjnOAr5Yrk4dtaSb4qFtIYlevRojllHmbcpJOe9hHrzK1SLLEVx9cu32EE7Otpy
	 DW37k5C3dmRGWu8D2CtADKFjApMaNpkemcPKK7lh2dbmX+X33EvG0EffwmSwIObUrB
	 zfCAYCBBJVFqYl/AoFyy8JQt+X3KF2zwHLkXZ8nFTwKYFpNIxi89q/ROfKxZ/Sg8Fe
	 tG3spPtNZhborHOnmbCG6RqLs+EPec1+1VeL8n+GvtsT1qaZctiRtYLHtT9tG4L0i8
	 z9CdjOUjVZAHHK3RWftn9xKPr6po9/BESloLrKtraZ5pIvZljDnzD7hHO2Ot1cL/so
	 zR9f4m2LqaiJg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Po-Wen Kao <powen.kao@mediatek.com>,
	Bean Huo <beanhuo@micron.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Stanley Chu <stanley.chu@mediatek.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	jejb@linux.ibm.com,
	matthias.bgg@gmail.com,
	quic_cang@quicinc.com,
	quic_asutoshd@quicinc.com,
	alice.chao@mediatek.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.3 51/67] scsi: ufs: core: Fix MCQ nr_hw_queues
Date: Thu, 25 May 2023 14:31:28 -0400
Message-Id: <20230525183144.1717540-51-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230525183144.1717540-1-sashal@kernel.org>
References: <20230525183144.1717540-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_113527_238762_3222D415 
X-CRM114-Status: GOOD (  12.25  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Po-Wen Kao <powen.kao@mediatek.com>

[ Upstream commit 72a81bb0b6fc9b759ac0fdaca3ec5884a8b2f304 ]

Since MAXQ is 0-based value, add one to obtain number of hardware queues.

Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
Link: https://lore.kernel.org/r/20230504154454.26654-4-powen.kao@mediatek.com
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ufs/core/ufs-mcq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 937933d3f77c2..51b3c6ae781df 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -150,7 +150,8 @@ static int ufshcd_mcq_config_nr_queues(struct ufs_hba *hba)
 	u32 hba_maxq, rem, tot_queues;
 	struct Scsi_Host *host = hba->host;
 
-	hba_maxq = FIELD_GET(MAX_QUEUE_SUP, hba->mcq_capabilities);
+	/* maxq is 0 based value */
+	hba_maxq = FIELD_GET(MAX_QUEUE_SUP, hba->mcq_capabilities) + 1;
 
 	tot_queues = UFS_MCQ_NUM_DEV_CMD_QUEUES + read_queues + poll_queues +
 			rw_queues;
-- 
2.39.2


