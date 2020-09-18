Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C442DC43467
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 02:23:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71AE723119
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 02:23:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TrRXtXXy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5tya8TG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71AE723119
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DKwcZN3nyW7CLllzNBWB3vDbcm+Uv6fr4mKiDfp3bcw=; b=TrRXtXXyNbQ9vJRTHTzrxbR5T
	6ms3lDxascgOEkq1oWZEga2N13GXz1hPRhBPDlIDSR8uRTnb13Ok42Sfoc60Uwr4Wrg8SWz5OIM4U
	MglF+MaVTw6CkenkIsX1PnT/LYDP3TbaCOIDfUnd/HL3jxc7GxJy5j1zGBmNnqYF2Mjj+jFS6Uh0Q
	I3Hdvp3zi3tSR1mR3NAygF2xyP1aZze1W7vZXalo6xO2sT+Z2CNwBY/v6lm/IxvyYH0r3+gjqJHoM
	yP2/F6tlWdLyWF+KP6kp5IKrCbSsfU8/7Nx7wDuwYG3QmpisbngyRbmCzc6HFDU1yCn4eav1snmvU
	Q4Q6z38ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ63Z-0004YX-Sg; Fri, 18 Sep 2020 02:23:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ5ph-0005hv-DE; Fri, 18 Sep 2020 02:09:07 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89E502389E;
 Fri, 18 Sep 2020 02:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394941;
 bh=+j2ZRsSpdWAd+sIN/Kapw0Gf/H6JDaOOG8n/Qn3yYyg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m5tya8TG5506W05eFw/CHQByOHapSaDNRgiqpU2waDmr7cClJwrFu1Y3PsMFzazDU
 TuW53Z1dHU1Aa0mD8Ea2RN79hRRmKk9GmR2QoF4qDshJsdY8M1f61gZzYVce7ODsRE
 euU6UsLU0PCQ8S9/CQIWFYQ1BcvW2sWYM6dh1ZJw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 050/206] scsi: ufs: Make
 ufshcd_add_command_trace() easier to read
Date: Thu, 17 Sep 2020 22:05:26 -0400
Message-Id: <20200918020802.2065198-50-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020802.2065198-1-sashal@kernel.org>
References: <20200918020802.2065198-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_220905_721583_A6AD70E7 
X-CRM114-Status: GOOD (  14.26  )
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

[ Upstream commit e4d2add7fd5bc64ee3e388eabe6b9e081cb42e11 ]

Since the lrbp->cmd expression occurs multiple times, introduce a new local
variable to hold that pointer. This patch does not change any
functionality.

Cc: Bean Huo <beanhuo@micron.com>
Cc: Can Guo <cang@codeaurora.org>
Cc: Avri Altman <avri.altman@wdc.com>
Cc: Stanley Chu <stanley.chu@mediatek.com>
Cc: Tomas Winkler <tomas.winkler@intel.com>
Link: https://lore.kernel.org/r/20191224220248.30138-3-bvanassche@acm.org
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Can Guo <cang@codeaurora.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufshcd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index eb10a5cacd90c..faf1959981784 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -353,27 +353,27 @@ static void ufshcd_add_command_trace(struct ufs_hba *hba,
 	u8 opcode = 0;
 	u32 intr, doorbell;
 	struct ufshcd_lrb *lrbp = &hba->lrb[tag];
+	struct scsi_cmnd *cmd = lrbp->cmd;
 	int transfer_len = -1;
 
 	if (!trace_ufshcd_command_enabled()) {
 		/* trace UPIU W/O tracing command */
-		if (lrbp->cmd)
+		if (cmd)
 			ufshcd_add_cmd_upiu_trace(hba, tag, str);
 		return;
 	}
 
-	if (lrbp->cmd) { /* data phase exists */
+	if (cmd) { /* data phase exists */
 		/* trace UPIU also */
 		ufshcd_add_cmd_upiu_trace(hba, tag, str);
-		opcode = (u8)(*lrbp->cmd->cmnd);
+		opcode = cmd->cmnd[0];
 		if ((opcode == READ_10) || (opcode == WRITE_10)) {
 			/*
 			 * Currently we only fully trace read(10) and write(10)
 			 * commands
 			 */
-			if (lrbp->cmd->request && lrbp->cmd->request->bio)
-				lba =
-				  lrbp->cmd->request->bio->bi_iter.bi_sector;
+			if (cmd->request && cmd->request->bio)
+				lba = cmd->request->bio->bi_iter.bi_sector;
 			transfer_len = be32_to_cpu(
 				lrbp->ucd_req_ptr->sc.exp_data_transfer_len);
 		}
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
