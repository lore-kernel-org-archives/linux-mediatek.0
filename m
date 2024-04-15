Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F05C04FF8
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 12:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rv1TatWslQa2714uUvWldyHLE7EGL/ZbW4eSw+alzRM=; b=v3waPpUKppBEveYZfnOy2A6kPT
	nniqbw85uqU3EKi/zfsoyFMnnbwam73e1znytvNDuZbJWDzD88Vhk4ElNqYZigl96HT+n/G4CRk+6
	x9CD+nJZJsOJ3pKsf7FmaZd/+k/SRy04/JE6087GhvhpGON+W08OFpG6fS9t4dJ18azSnXINoiMmW
	F3xqYRCPFRp8zvgmXFsfH+oQH+iR+T/TwbDqJB9feZLX7YL2e67C9zzLYffPoEUV9KAiHJpVHy8Ss
	95d/XMoBGMIqWfPokQ9H/GWMhPUnOD/Qo/0FJ7Sh3c/LdtKmdQdq4xJNcOeA/hy4SfLx1eqd2r398
	uwo5Q17w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLmy-00000008HLN-3i3u;
	Mon, 15 Apr 2024 12:50:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLml-00000008HBB-0ZGc;
	Mon, 15 Apr 2024 12:50:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9CD8960C7C;
	Mon, 15 Apr 2024 12:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C81C3277B;
	Mon, 15 Apr 2024 12:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713185410;
	bh=ZJeH9mmRkzVeKciQNcI/iGRPUWnIOGpgJPuEVgETO3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YxSSIfssIn4IdHKRU5fl+rFn04fO49FP64K01XBnX192z1aK78P2TeOF+fmWx0gmr
	 AlR7X7/KKxuM+ueGGYdu7SaCEpTyDLPlUoWcQcfV4Ry2GHNnhdXI1vN+lI1j3VjEjS
	 YkhQd4n2WBrcpa/l94ySRkWeyaUqDY+THuDrCxZpRYcWZFQjy3/vwFKqo3dmRPteJJ
	 ddwYevbxCR1BO1cuDTQHf/T0yHQVY24KuTqjK6PK1IGRy6PU7aCSmPMMU+GgAeAhis
	 aVAkEZxR80kk8gVGcWkeZDdHcSmRjMmAsiuEUXPBkvpO3n1oCxi/oq/M80SSyOP7q2
	 wu/75liXeGu+g==
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
	beanhuo@micron.com,
	manivannan.sadhasivam@linaro.org,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 06/12] scsi: ufs: core: Fix MCQ mode dev command timeout
Date: Mon, 15 Apr 2024 06:03:41 -0400
Message-ID: <20240415100358.3127162-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240415100358.3127162-1-sashal@kernel.org>
References: <20240415100358.3127162-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.27
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_055011_357320_FDDE3C1F 
X-CRM114-Status: GOOD (  13.32  )
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
index 8005373e20bae..344806330be16 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -3064,7 +3064,9 @@ static int ufshcd_wait_for_dev_cmd(struct ufs_hba *hba,
 
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


