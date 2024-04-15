Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2635EC00A94
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 12:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ryM3Qt8LycKJa3US0+JUFJoheop2tMOFgbbMk98eXLk=; b=LLjoYTt3SlfSEJUYgaQ0FdET/R
	NhcPwvPq1Xg9oxOVnurz8FfVNdwXmO60O1Kr6z/Mgx/EnLOhT3E2jLtS4lAcNMm5HkUDdb9xQBQhx
	G+5DdjGDlTm5zkOpBa/MsujYhwCKKZtWGZjuKMp5FptMDxbsBUsm247oE0pjFYXUJG37vXejF3TbP
	PUI70a50dP1/k6EKOQHonHvx/2TiVmKzEXHApDMwjCd2lnJeRqiCiZB/84fyud9T/CDtFrSBj0X1R
	sEmhARjdXfRrtDej/TydMrMJmkEECLfAeEdDqrE1svIWC3nKi6IZ06BvDT7Ijtqxy9RKTRV68u35C
	ugLeLSiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLmD-00000008Goo-19Se;
	Mon, 15 Apr 2024 12:49:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLm3-00000008Gib-1rlo;
	Mon, 15 Apr 2024 12:49:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C92960C7E;
	Mon, 15 Apr 2024 12:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2542CC3277B;
	Mon, 15 Apr 2024 12:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713185365;
	bh=6bzgEIhKA6CeQaTfg8ENrNbGmzaOmGDRBZQ5wVFTRJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rYS3VPhL570YLwluqOiBb5CJhLuWhVjviJje7E5CCIRDp5YvloO3UIwy0pPzdOUX2
	 dRrJxdCUfBh+vV6lpjQc2PoMtKyHucCU8j1GJ9QumcCwzdepwKL0+3NkXwa2gRnZfz
	 hv9NoigpNN2BkSqal0x760bk7vPzSbJJLkYes3Udx4WWyV2OakZjbVUQacwvyhcL/2
	 bjIOWbdh4AtSXJSnQSm3F5HSGdT+ZSiNj0Q4npza9g9p2dSSBUaAii+tYttxa+5ZKm
	 1NLzEsQR+TLzAImVjJlIRpUOLu5DDwKypybfBWniz+SmixooRbKdAymShKcSGw1jr1
	 tzBjj/TB8tPlQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Peter Wang <peter.wang@mediatek.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	jejb@linux.ibm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	stanley.chu@mediatek.com,
	quic_cang@quicinc.com,
	avri.altman@wdc.com,
	quic_nguyenb@quicinc.com,
	manivannan.sadhasivam@linaro.org,
	beanhuo@micron.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.8 07/15] scsi: ufs: core: Fix MCQ mode dev command timeout
Date: Mon, 15 Apr 2024 06:02:47 -0400
Message-ID: <20240415100311.3126785-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240415100311.3126785-1-sashal@kernel.org>
References: <20240415100311.3126785-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_054927_561382_B377EF6C 
X-CRM114-Status: GOOD (  13.42  )
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

From: Peter Wang <peter.wang@mediatek.com>

[ Upstream commit 2a26a11e9c258b14be6fd98f8a85f20ac1fff66e ]

When a dev command times out in MCQ mode, a successfully cleared command
should cause a retry. However, because we currently return 0, the caller
considers the command a success which causes the following error to be
logged: "Invalid offset 0x0 in descriptor IDN 0x9, length 0x0".

Retry if clearing the command was successful.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Link: https://lore.kernel.org/r/20240328111244.3599-1-peter.wang@mediatek.com
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ufs/core/ufshcd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 14a6a100fcdb0..4a07a18cf835d 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -3172,7 +3172,9 @@ static int ufshcd_wait_for_dev_cmd(struct ufs_hba *hba,
 
 		/* MCQ mode */
 		if (is_mcq_enabled(hba)) {
-			err = ufshcd_clear_cmd(hba, lrbp->task_tag);
+			/* successfully cleared the command, retry if needed */
+			if (ufshcd_clear_cmd(hba, lrbp->task_tag) == 0)
+				err = -EAGAIN;
 			hba->dev_cmd.complete = NULL;
 			return err;
 		}
-- 
2.43.0


