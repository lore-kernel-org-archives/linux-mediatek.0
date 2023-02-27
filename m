Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65435C64ED6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 02:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdq8+VsqlbI2u6Evmuk88Rc26p/SCT0pud0zTL9cmrg=; b=WExBII52CGyu9pHG6k/T8+2VBK
	VDjFTJycNTfctFbnyEHWAQWmbUFWYu/LTIJWqeC31Sc/g0mNvXPywj3qFwvILMty4Ya53xtPIukBk
	OiP/6AwInE9WLTdSTn6ftWDtTmmPhEah59ErBIzoSxSC+L0xLYEwZAXEmy88bHX7uEHq/ov4mMpEs
	XOfpOd4gf/609uhiAAIg3CzRYyC8jFhceDPlLGkh5Yb27ZyFyW9bKIr1iwDZqoZIGfBnNc5ckHWSL
	xg+DDdqwX/MuUfVc/T2fGlJvvo4DJN/LW+BDdkeaGoFJ1u1xIvJkkQ7jzt01lBhJxy3HTxjCLBB33
	ICdZyU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWSs0-008Bwz-6u; Mon, 27 Feb 2023 02:04:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWSrn-008BuP-6v; Mon, 27 Feb 2023 02:03:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C119460D3D;
	Mon, 27 Feb 2023 02:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B3FC4339B;
	Mon, 27 Feb 2023 02:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677463430;
	bh=j+XTeN79BZ0V4oGHSuZTC0p7hA7lal1/SpBfS9PiwJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t1ol70l9VF9UbpsyuVgzv98SehWUpEmxtJ/prbhiRT5dPmnyGzBgT2+D0ZnF1mtUR
	 va5odEJd+i08qrUa7WyblBcC9NhWTcvddYh+srKlrYDZrix5aET48ZIRYCFRJJQUcc
	 B9VHyjKa+MNeJS1hROo2HpZsHNf+zO0MAUrq2+5GK6nkMoRWYYk8K92Qxzk+T1yq1f
	 jnZ1O53rq6GT0weXR6wVPDYpKpvdijU8qgfQrtxEmJB9o/Go+pFYWVVFp3HrKymo5C
	 JYXoUuwXuWSzTtFxYKBxesLfs6fpXZ8iN8iEQm3Hy0SIIs5hKpUNXVNKFb39zdjbjX
	 7/ZIgIERCGAxA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mason Zhang <Mason.Zhang@mediatek.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	jejb@linux.ibm.com,
	matthias.bgg@gmail.com,
	beanhuo@micron.com,
	avri.altman@wdc.com,
	stanley.chu@mediatek.com,
	quic_asutoshd@quicinc.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.2 48/60] scsi: ufs: core: Fix device management cmd timeout flow
Date: Sun, 26 Feb 2023 21:00:33 -0500
Message-Id: <20230227020045.1045105-48-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020045.1045105-1-sashal@kernel.org>
References: <20230227020045.1045105-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_180351_347677_99942349 
X-CRM114-Status: GOOD (  14.11  )
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

From: Mason Zhang <Mason.Zhang@mediatek.com>

[ Upstream commit 36822124f9de200cedc2f42516301b50d386a6cd ]

In the UFS error handling flow, the host will send a device management cmd
(NOP OUT) to the device for link recovery. If this cmd times out and
clearing the doorbell fails, ufshcd_wait_for_dev_cmd() will do nothing and
return. hba->dev_cmd.complete struct is not set to NULL.

When this happens, if cmd has been completed by device, then we will call
complete() in __ufshcd_transfer_req_compl(). Because the complete struct is
allocated on the stack, the following crash will occur:

  ipanic_die+0x24/0x38 [mrdump]
  die+0x344/0x748
  arm64_notify_die+0x44/0x104
  do_debug_exception+0x104/0x1e0
  el1_dbg+0x38/0x54
  el1_sync_handler+0x40/0x88
  el1_sync+0x8c/0x140
  queued_spin_lock_slowpath+0x2e4/0x3c0
  __ufshcd_transfer_req_compl+0x3b0/0x1164
  ufshcd_trc_handler+0x15c/0x308
  ufshcd_host_reset_and_restore+0x54/0x260
  ufshcd_reset_and_restore+0x28c/0x57c
  ufshcd_err_handler+0xeb8/0x1b6c
  process_one_work+0x288/0x964
  worker_thread+0x4bc/0xc7c
  kthread+0x15c/0x264
  ret_from_fork+0x10/0x30

Link: https://lore.kernel.org/r/20221216032532.1280-1-mason.zhang@mediatek.com
Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ufs/core/ufshcd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 3a1c4d31e010d..fa386b6f1ee09 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -3008,6 +3008,22 @@ static int ufshcd_wait_for_dev_cmd(struct ufs_hba *hba,
 		} else {
 			dev_err(hba->dev, "%s: failed to clear tag %d\n",
 				__func__, lrbp->task_tag);
+
+			spin_lock_irqsave(&hba->outstanding_lock, flags);
+			pending = test_bit(lrbp->task_tag,
+					   &hba->outstanding_reqs);
+			if (pending)
+				hba->dev_cmd.complete = NULL;
+			spin_unlock_irqrestore(&hba->outstanding_lock, flags);
+
+			if (!pending) {
+				/*
+				 * The completion handler ran while we tried to
+				 * clear the command.
+				 */
+				time_left = 1;
+				goto retry;
+			}
 		}
 	}
 
-- 
2.39.0


