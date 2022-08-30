Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E8AECAAA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 17:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOsfAkGI40A6CBpIh9NrNBCT5lSN/GtUJ3Dtr8wIVZk=; b=Ou/ktLv6LnkpGLT/kRfTBdc31k
	dTIjqHDe/YkAsEsuj6kFdXe4O566Zbk1y3NBhUHxKingxal3to+3ac6QwSowvWxXgRzkoOkiw2llM
	WV+BOaY+ZR6Rqg9DIhUoB0O/osfj/W+rZWZ1WBIYzJh/ophls2dPumabBkJFgKIv0u1W2GxThO2O1
	vqcmrx/V876T/8Wu16JduP4jdDSCtApz4Dtbj4TELeQ+Gs6r1MKrW10AeY0tskLCWGhBr24ko+Q00
	Q0R31WNhP5WQ66zp2XThU+gH5gg1AidYESXED6YgeIelGyEjDF00mfErEFRihZUk+y0rSh1gmMa0d
	KFXQrX4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT4u4-000loR-Uh; Tue, 30 Aug 2022 17:19:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT4tr-000lke-5X; Tue, 30 Aug 2022 17:19:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C1A436172E;
	Tue, 30 Aug 2022 17:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC57C433D7;
	Tue, 30 Aug 2022 17:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661879982;
	bh=5QvKRRAHDIo7HHKgbgxqt8ycMrr/leXRZbEgZYnHQDc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eBCtEKRyajrUYKTPT9hUtsMNgrSjio1kOmLhu98UH/W6hGZ/GKwBBUxvQEHFJEnFo
	 UzPZKMR+gmqgY1aZ7O5YsKC03U4VqfDOcDQrOt1wWnq02CoZeIGHt8/jgiBiFpsl9J
	 72oIT2611LRuRG19P90hwaUVNWFQpQTQx+Fd4W75d5iPRvh84tlR6S9anT/GhoE+Z3
	 Nl+Mzgo5/tFG0pfhfpofb5mdJ9yGpePu0VeNH4pUMQScFU8xxnX74+d5qtvJC9jl/T
	 Ad2ZPsXBBQmUqOaxrDpAb51K81nivPgQlCMw9AqlmN/QZEje4stNpxXusZNpOFHsdB
	 hVboHQHkHOKHg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bart Van Assche <bvanassche@acm.org>,
	Stanley Chu <stanley.chu@mediatek.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	jejb@linux.ibm.com,
	matthias.bgg@gmail.com,
	beanhuo@micron.com,
	avri.altman@wdc.com,
	adrian.hunter@intel.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.19 14/33] scsi: ufs: core: Reduce the power mode change timeout
Date: Tue, 30 Aug 2022 13:18:05 -0400
Message-Id: <20220830171825.580603-14-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830171825.580603-1-sashal@kernel.org>
References: <20220830171825.580603-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_101943_267250_E4EACFE6 
X-CRM114-Status: GOOD (  13.54  )
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

[ Upstream commit 8f2c96420c6ec3dcb18c8be923e24c6feaa5ccf6 ]

The current power mode change timeout (180 s) is so large that it can cause
a watchdog timer to fire. Reduce the power mode change timeout to 10
seconds.

Link: https://lore.kernel.org/r/20220811234401.1957911-1-bvanassche@acm.org
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ufs/core/ufshcd.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index a51ca56a0ebe7..829da9cb14a86 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8723,6 +8723,8 @@ static int ufshcd_set_dev_pwr_mode(struct ufs_hba *hba,
 	struct scsi_device *sdp;
 	unsigned long flags;
 	int ret, retries;
+	unsigned long deadline;
+	int32_t remaining;
 
 	spin_lock_irqsave(hba->host->host_lock, flags);
 	sdp = hba->ufs_device_wlun;
@@ -8755,9 +8757,14 @@ static int ufshcd_set_dev_pwr_mode(struct ufs_hba *hba,
 	 * callbacks hence set the RQF_PM flag so that it doesn't resume the
 	 * already suspended childs.
 	 */
+	deadline = jiffies + 10 * HZ;
 	for (retries = 3; retries > 0; --retries) {
+		ret = -ETIMEDOUT;
+		remaining = deadline - jiffies;
+		if (remaining <= 0)
+			break;
 		ret = scsi_execute(sdp, cmd, DMA_NONE, NULL, 0, NULL, &sshdr,
-				START_STOP_TIMEOUT, 0, 0, RQF_PM, NULL);
+				   remaining / HZ, 0, 0, RQF_PM, NULL);
 		if (!scsi_status_is_check_condition(ret) ||
 				!scsi_sense_valid(&sshdr) ||
 				sshdr.sense_key != UNIT_ATTENTION)
-- 
2.35.1


