Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A52C0502C
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 17:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oH/YF/FZ0WyDXHhba0DcSnCsPe665lSaDjJxlS/jIbU=; b=bPWgEe7PzybcwDWjM7zVibpRrF
	YGTKsdVxmiItwMqjcpmpQRgB61GzpIihYTyC3xNmoCF90uTrcqLceUPru1bEKvZcsUlN/duNt8Ttt
	k7HUl6KjsWmSda/Q5nR54jC1fAQm86Me9H8/maeslZgShT1+A2/JVTOUyv+/1l1BNiXGzIs8rfbXy
	PAi0Jt5IOM5cYiFuXFCZl8S/S7Mu76CN+HxtkxjYy5vMoDlj8/HwruqI4+etdgqTKvyxOqMCUKSYf
	2mNV2gMeAD3IU/2J42/nFTe+iHRHMcL7IC7VqpUnB9Jmvkak2JB6sW/hyayRVBkV2DKhICedkarBF
	QRfsRKag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT4wf-000nDZ-3S; Tue, 30 Aug 2022 17:22:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT4wP-000n5z-Am; Tue, 30 Aug 2022 17:22:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id ED70CB81D14;
	Tue, 30 Aug 2022 17:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4C7C433C1;
	Tue, 30 Aug 2022 17:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661880138;
	bh=mbw7MSPR3g4EtRoj9xhwty39pKwBVqgVI8IGo4q1OC0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IF+2Y1sx24FtRDdhwmgYxZ3eGfKe008sG5nYQibJQUgTkEDpOhlGBPbi2iq5ewTjX
	 q2D6v9tEVH2X36A1+9Sb1gLgUi2QRG34bgMCks0YjYlf8/eBDDxK2EH9yKq9e8iRCz
	 rGzKYZX9bu0WTKOTc71qfPYCV6PbQEU0+LKgdJk38Ed105szXm2pKSTll7DJEG3uiH
	 tUEqL+1Q8JqyGS6gSRvk1rnFmQuqQMGpcsJjlXIavf/S5qjXsgYOoEepX/1Ywj614D
	 a6DL5RamroTmHEaA32yf/xdEdgtKIo8s1AJfmA/5aaTQBodaADLGaG4JN5vOzhpEnc
	 p8TTWw7NeIWBQ==
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
	j-young.choi@samsung.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 09/23] scsi: ufs: core: Reduce the power mode change timeout
Date: Tue, 30 Aug 2022 13:21:26 -0400
Message-Id: <20220830172141.581086-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220830172141.581086-1-sashal@kernel.org>
References: <20220830172141.581086-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_102221_547521_D1E42EA8 
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
 drivers/scsi/ufs/ufshcd.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 2f6468f22b489..dae1a85f1512c 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -8476,6 +8476,8 @@ static int ufshcd_set_dev_pwr_mode(struct ufs_hba *hba,
 	struct scsi_device *sdp;
 	unsigned long flags;
 	int ret, retries;
+	unsigned long deadline;
+	int32_t remaining;
 
 	spin_lock_irqsave(hba->host->host_lock, flags);
 	sdp = hba->sdev_ufs_device;
@@ -8508,9 +8510,14 @@ static int ufshcd_set_dev_pwr_mode(struct ufs_hba *hba,
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


