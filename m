Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBB8C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 02:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMBDLShSFZGhf9MPmCMP4kHQ8JD/jxuWPn53udaSr34=; b=icceLKFlBoxrWKNvVO57DjqZk7
	0bMb/AeTQik49U07aZoWhAfR9i8zY9rbmUKJTgPeGpJrz0wrX7KccWmesWHDvLGeq3mbKXznnHJrZ
	38+vThUMz6x9hKnnSOIlJ39yJr/u09DyNlo0zJAzrzxU3+osKCgRoN0qujwTK6pTqmsa2h2fDGFlE
	VaEkaXymNyXjrphvvSRnzyRHBmfkncgTp7tftj5deWVp0LKcwHEBvnbrZnYU4yN8MVR0AvYzFvLz5
	9wfAPIlSMKOxdM2CnYvoqqhH9j3wTkrhiLqy+pwa86w6f2nWDUk9YcD6Hm/DO2TDqbFgefcrS9sUP
	Zyf9Fw+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o610H-003l5l-R3; Tue, 28 Jun 2022 02:31:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o60sb-003gjH-HB; Tue, 28 Jun 2022 02:23:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 125F9617CA;
	Tue, 28 Jun 2022 02:23:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58BDC34115;
	Tue, 28 Jun 2022 02:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656382984;
	bh=61r4ir6D/oIz9lNaR6B0OiZXPVrxN4SE4g4dd6RhOsI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B4NeMg5jurjxLGgjvSeM692KbnzLa0uPlfTrK/OF5P02LOSbPbaVGQLwk9gEc+Z6D
	 FNKHwUyTLtN8JtWaqqCAzBJVDIEaLSkc++3IH5/3cF5/Bn+91vo/DYERrCfTRht16v
	 8eUhLQn9TtMZ9bJb1Ul8LKLhcF92FPicHyMlNpU1tPrjnG7isTcMjULwTVAQMke73I
	 /kI3PSdZ9b04v/iYcNsSBylRrLh/kwpT0d64ELQt8Zcfq0Q0rUh9ns8TVa5fdUCuA9
	 /XTHnsH9ltpV0ylS6Y/SG+osWAd7Zg5hIG/PcLdrmaPXkclG4ePWqaUPJ+P3Xipi5F
	 wclgZiC0OkInA==
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
Subject: [PATCH AUTOSEL 5.10 09/34] scsi: ufs: Simplify ufshcd_clear_cmd()
Date: Mon, 27 Jun 2022 22:22:16 -0400
Message-Id: <20220628022241.595835-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022241.595835-1-sashal@kernel.org>
References: <20220628022241.595835-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_192305_650085_0728BBFA 
X-CRM114-Status: GOOD (  12.74  )
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
index ea6ceab1a1b2..1b32d4f4e21e 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -2649,7 +2649,6 @@ static int ufshcd_compose_dev_cmd(struct ufs_hba *hba,
 static int
 ufshcd_clear_cmd(struct ufs_hba *hba, int tag)
 {
-	int err = 0;
 	unsigned long flags;
 	u32 mask = 1 << tag;
 
@@ -2662,11 +2661,8 @@ ufshcd_clear_cmd(struct ufs_hba *hba, int tag)
 	 * wait for for h/w to clear corresponding bit in door-bell.
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


