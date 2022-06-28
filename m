Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F3CCCA482
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 02:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xjyts7DUF8IJ2dRdvXYB/VSubKrpO8B283MZXrdO+9M=; b=bIf976IC6YqAW2ahNmm8R564d0
	ZgRigf3ZOlmV7/SM9bCo/I9vuCR3fmZGZCxT04/FPG0JfVPaPFBCj2HKKvLDWDuXXDQEMAfG3ba30
	AdxIVhnaKb94DS326irMe27DEaEoUKKMX2Q0xJiRY2kfOLxATbJWfSXT1YZHoZ4l+BjdeYiMq67B5
	Sag9rSDmpNHywG7NVPx4wKz3g7UdRhgMmzql49LVVoAEZoYZ9C+FTlEtgeWcfT316ULEVvQaYLoVI
	lwz4FpMRR+HRyqrKVizVal/qAnjSelNFfgXm9gKFusHHL3uV8askRQNy3tzWl6X9SFTiNWXnjE8Jx
	fagDyFzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o60p6-003eTB-8z; Tue, 28 Jun 2022 02:19:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o60os-003eN9-UY; Tue, 28 Jun 2022 02:19:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 88686617DB;
	Tue, 28 Jun 2022 02:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3051C341CD;
	Tue, 28 Jun 2022 02:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656382752;
	bh=SVjIUq468ZnkreE+5CnjX830DKpi6K2VxXz1oYBEyvA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rn6u6QlxLBnmRNY35IZnY6ItdgcwojK2IcrNULdcPkP1u9i98Q3quXvWVyu5vSMSE
	 lPPv/o8jfPKAmFpUIo3leXW37ErEKHbuRqEtzOadimDhou+2X0TLEbDPCLYf6R6Cnq
	 wmI3Lt5BuoutKRUOQvX5pwzxcjUsGm/LiKV5nNFodV88t8c37mJ7C9Ymi8KNPjXRla
	 BwFAJEzsnTvZqHBDCp63XlFF7EcwWiYJcCokF1lfWiu3vlI33pWWYznpj1DFmJJ8ON
	 jbuHAy0lS/6uvu2/Qre6R2na8HSEKT7SOefGkubFPsp9BB/l4eHMnWdqDTSAcATyys
	 t5g3FNjCr0XOg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bart Van Assche <bvanassche@acm.org>,
	Stanley Chu <stanley.chu@mediatek.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	jejb@linux.ibm.com,
	matthias.bgg@gmail.com,
	beanhuo@micron.com,
	avri.altman@wdc.com,
	daejun7.park@samsung.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.18 14/53] scsi: ufs: Simplify ufshcd_clear_cmd()
Date: Mon, 27 Jun 2022 22:18:00 -0400
Message-Id: <20220628021839.594423-14-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628021839.594423-1-sashal@kernel.org>
References: <20220628021839.594423-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_191915_042930_591E6C81 
X-CRM114-Status: GOOD (  12.97  )
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

From: Bart Van Assche <bvanassche@acm.org>

[ Upstream commit da8badd7d3583f447eac2ab65a332f2d773deca1 ]

Remove the local variable 'err'. This patch does not change any
functionality.

Link: https://lore.kernel.org/r/20220613214442.212466-2-bvanassche@acm.org
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufshcd.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 4c9eb4be449c..8f26c4c09c66 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -2856,7 +2856,6 @@ static int ufshcd_compose_dev_cmd(struct ufs_hba *hba,
 static int
 ufshcd_clear_cmd(struct ufs_hba *hba, int tag)
 {
-	int err = 0;
 	unsigned long flags;
 	u32 mask = 1 << tag;
 
@@ -2869,11 +2868,8 @@ ufshcd_clear_cmd(struct ufs_hba *hba, int tag)
 	 * wait for h/w to clear corresponding bit in door-bell.
 	 * max. wait is 1 sec.
 	 */
-	err = ufshcd_wait_for_register(hba,
-			REG_UTP_TRANSFER_REQ_DOOR_BELL,
-			mask, ~mask, 1000, 1000);
-
-	return err;
+	return ufshcd_wait_for_register(hba, REG_UTP_TRANSFER_REQ_DOOR_BELL,
+					mask, ~mask, 1000, 1000);
 }
 
 static int
-- 
2.35.1


