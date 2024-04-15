Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26A7C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1S+tv3JEEeqqMktRx9OUpijqZ9qMqM9913nCcZggDc=; b=jy7yTcdijGOc36OFUCjMjpnsP+
	PlYAqTe+7sACg34ye01itltTYRng13T2nMEYauFdbqysOLS1VFiQrkkmAvljXp7tmMKzgWG9Qn72c
	ZNNdp0iEz8TuGYOqjNW11SOvXGAAHNmAfFvPySuJX1NIZecZeQ5SGanx3x1/oIfinZX9Qg0VaF5r9
	0QncACzWv9EHQluE7J2NAmr3/pdky4BjbZdj7cuuq3vQniGctlCOcIwABQ2Ns6GqZop91G3RkaI23
	tn2A9xyorcyq1Zh1Iowtm5R8kq10kiKN54wqGsi+Cex3O7RgjGoIcvO+WsYfSGy/X1O5jVM+0Sfsw
	sH51Y+Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLmm-00000008HCV-1OzU;
	Mon, 15 Apr 2024 12:50:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLme-00000008H6O-2Gnd;
	Mon, 15 Apr 2024 12:50:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D4B3CCE0B76;
	Mon, 15 Apr 2024 12:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336E8C2BD10;
	Mon, 15 Apr 2024 12:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713185402;
	bh=s47cdW7+juh03SCq6QFN4+wAqadPWwm5ERPpWRoCDow=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lDqXy1zH3ScAofun5w60bVZ1JEkvdqHtTvq1klFOiCR8oX5HfbfwUJ0fpMBbnqn6T
	 6PHryPT3952Q/iZW6JEhuRSMDZvKHsa93gxvFddsgONlFyIkOjEG2DP3JelbhDyNhG
	 eQ8P2OrAxrOZbJfaVsFNn0E6QtdK6VamD/eqvcC/66t8msJNM9jSRDqnGbim0fyh7z
	 WyOfzROFCYVoZlJCWM0q4MRhpkbVygnMyFgw6uWfo2kbm6G9D+hWD8BqRV2DQRt/ok
	 /S4kE0WztAN0R6Lm6LNkGT7FvN37MKKueBaYDziacs+6/MgQkMClwJOs6aNXrkagWe
	 vzildnL2MToZw==
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
Subject: [PATCH AUTOSEL 6.6 04/12] scsi: ufs: core: WLUN suspend dev/link state error recovery
Date: Mon, 15 Apr 2024 06:03:39 -0400
Message-ID: <20240415100358.3127162-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240415100358.3127162-1-sashal@kernel.org>
References: <20240415100358.3127162-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.27
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_055004_789414_086C1993 
X-CRM114-Status: GOOD (  13.97  )
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

[ Upstream commit 6bc5e70b1c792b31b497e48b4668a9a2909aca0d ]

When wl suspend error occurs, for example BKOP or SSU timeout, the host
triggers an error handler and returns -EBUSY to break the wl suspend
process.  However, it is possible for the runtime PM to enter wl suspend
again before the error handler has finished, and return -EINVAL because the
device is in an error state. To address this, ensure that the rumtime PM
waits for the error handler to finish, or trigger the error handler in such
cases, because returning -EINVAL can cause the I/O to hang.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Link: https://lore.kernel.org/r/20240329015036.15707-1-peter.wang@mediatek.com
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ufs/core/ufshcd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index ee9119b708f01..8005373e20bae 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -9547,7 +9547,10 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
 	/* UFS device & link must be active before we enter in this function */
 	if (!ufshcd_is_ufs_dev_active(hba) || !ufshcd_is_link_active(hba)) {
-		ret = -EINVAL;
+		/*  Wait err handler finish or trigger err recovery */
+		if (!ufshcd_eh_in_progress(hba))
+			ufshcd_force_error_recovery(hba);
+		ret = -EBUSY;
 		goto enable_scaling;
 	}
 
-- 
2.43.0


