Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9F5C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 12:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdCE4etNELCKEWMOzXm6kdEBAulwJh74JEiUIdDkIHA=; b=0Odbwt1Sy2CpIzp6kkX4k2yKPY
	gdyktqkdLsEd4uURmaPbNwY1GQGIT3wLdqt3XsMQWZusovua1KkDrI6iwSLIgu1ePKTEjspQDpIpI
	afGx4saVLszGuiDQ6f0wDvxXexLIJk13cBx4nyiLeAA4n+bpGWBpaXEQpqMoEV4YSKNdyBj2hmvle
	w+p8JAQM6gFUS+1TMiYAx8fixZJHHIPa1tO+xmeKMEVbn0O57IVDfaP6RkdwcTZTvrDpGFD1vK9bE
	lC6qRdZbxbPAJlpJ8S/Lp5F01zqIGhd9XGxrjr8uoy851XORLXDQ9ltL/LKquxrKcsi6PDbJJdzbI
	yJbnxfxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLm5-00000008Gk5-0uIg;
	Mon, 15 Apr 2024 12:49:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwLlu-00000008GeU-346Q;
	Mon, 15 Apr 2024 12:49:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B91D60C81;
	Mon, 15 Apr 2024 12:49:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2351C4AF0F;
	Mon, 15 Apr 2024 12:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713185357;
	bh=xeF/Zq3a01ro9m11LFhlH6sAGGaai4u4gzl+O3dH0T8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AfWPQRr2HFI4gDeBmLh7Hqo9jLfYzh8p/wsIMVa7v4qqQuHTePCuSh2fvlTmv6X8l
	 1FYNoxWkbmrX+6SgYCRPOWGvC1VS7JLXLsIsqYBPl6xJsm5wtAnNYtW39IXo3w6h0j
	 DxAuLrou3IrriFUOgajW+3CY5WP2MYHcV+8TAHxB2TKC21t22iNPEs3C+sko8TIFUW
	 519FzRcWhbcaO/HPiW2nulLQHCbrIUBVaMl5GGC/JbsQxoGir8d+hSJa6njhlqJmtH
	 i1WPNexqmIu+GUyFD4e2/bb2ZUmhgqU3h/JrzIE9YqgHw0Gm8Qd3mS5Z8QThQ7CDBY
	 Rhka+qXd+D0rA==
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
	avri.altman@wdc.com,
	quic_cang@quicinc.com,
	quic_nguyenb@quicinc.com,
	manivannan.sadhasivam@linaro.org,
	beanhuo@micron.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.8 05/15] scsi: ufs: core: WLUN suspend dev/link state error recovery
Date: Mon, 15 Apr 2024 06:02:45 -0400
Message-ID: <20240415100311.3126785-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240415100311.3126785-1-sashal@kernel.org>
References: <20240415100311.3126785-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_054918_861828_2E184E14 
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
index 3b89c9d4aa404..14a6a100fcdb0 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -9745,7 +9745,10 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
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


