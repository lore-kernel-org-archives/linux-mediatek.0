Return-Path: <SRS0=M313=EX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7E7C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 12:57:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE2C52151B
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2020 12:57:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vQIZR6/b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="k+Ezn9+S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE2C52151B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uefrex9N2MuumQ/GxCAaWyP2Nmrxwi1bkSxEgYdg33U=; b=vQIZR6/bn0QFI9+QqYEJ+hx0k
	o31CSH1tEcW0tHi1mhqGsFzUYw46AHG8vP/UmuuGn/N8q+Z8alTr6mptG0mkzceSPIJ11ili3fJO3
	JnD7nOajAT+NsL2GDXIeUHqYDY9Mp5lXQtoMvz9Recbp+LQEAyQvJXDIRUOx5z86vI/77sYfa1sbY
	agozssJ3NyLvltgyydS2uXfl5tFQwEhIEw/PscrFxMixZdOdbUo1ogiG/4YWJY2Qb2AThYBMWoNJh
	XMvo3zBGCIxaszgmiDAlTuuOVXCD0AqFU/LwfCKvtRCFmhkTlSputchy4t+Bqzt+nAYjfAvmrdSf1
	mqCNEUFkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf0Y8-00018i-U4; Tue, 17 Nov 2020 12:57:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf0Xg-0000xF-Dg; Tue, 17 Nov 2020 12:57:08 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 802342464E;
 Tue, 17 Nov 2020 12:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605617823;
 bh=bmntKh40Rt/hnMj496EtbyZ+MsWTcvjmdL9eQkWgf1s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k+Ezn9+SsaOH8msl9HgFsAwY37VhcqnEVfE1aiL2lVjum4O/DKdbWGA8e+kQbADDW
 fcOLusTLisAO0jIvrShHtclrvsR8R9BND7E0HY6rHWLASxobinB7YZDaas/CvIxzqO
 tmPEdwUMLzMC3+6JkrMNk5OP0nBUUufF5dgU/ZqY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 06/21] scsi: ufs: Try to save power mode change
 and UIC cmd completion timeout
Date: Tue, 17 Nov 2020 07:56:37 -0500
Message-Id: <20201117125652.599614-6-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201117125652.599614-1-sashal@kernel.org>
References: <20201117125652.599614-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_075704_695854_A0E6FB37 
X-CRM114-Status: GOOD (  19.37  )
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
Cc: Sasha Levin <sashal@kernel.org>, linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Can Guo <cang@codeaurora.org>, linux-mediatek@lists.infradead.org,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Can Guo <cang@codeaurora.org>

[ Upstream commit 0f52fcb99ea2738a0a0f28e12cf4dd427069dd2a ]

Use the uic_cmd->cmd_active as a flag to track the lifecycle of an UIC cmd.
The flag is set before sending the UIC cmd and cleared in IRQ handler. When
a PMC or UIC cmd completion timeout happens, if the flag is not set,
instead of returning timeout error, we still treat it as a successful
operation.  This is to deal with the scenario in which completion has been
raised but the one waiting for the completion cannot be awaken in time due
to kernel scheduling problem.

Link: https://lore.kernel.org/r/1604384682-15837-3-git-send-email-cang@codeaurora.org
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufshcd.c | 26 ++++++++++++++++++++++++--
 drivers/scsi/ufs/ufshcd.h |  2 ++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 0cb3e71f30ffb..54928a837dad0 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -2100,10 +2100,20 @@ ufshcd_wait_for_uic_cmd(struct ufs_hba *hba, struct uic_command *uic_cmd)
 	unsigned long flags;
 
 	if (wait_for_completion_timeout(&uic_cmd->done,
-					msecs_to_jiffies(UIC_CMD_TIMEOUT)))
+					msecs_to_jiffies(UIC_CMD_TIMEOUT))) {
 		ret = uic_cmd->argument2 & MASK_UIC_COMMAND_RESULT;
-	else
+	} else {
 		ret = -ETIMEDOUT;
+		dev_err(hba->dev,
+			"uic cmd 0x%x with arg3 0x%x completion timeout\n",
+			uic_cmd->command, uic_cmd->argument3);
+
+		if (!uic_cmd->cmd_active) {
+			dev_err(hba->dev, "%s: UIC cmd has been completed, return the result\n",
+				__func__);
+			ret = uic_cmd->argument2 & MASK_UIC_COMMAND_RESULT;
+		}
+	}
 
 	spin_lock_irqsave(hba->host->host_lock, flags);
 	hba->active_uic_cmd = NULL;
@@ -2135,6 +2145,7 @@ __ufshcd_send_uic_cmd(struct ufs_hba *hba, struct uic_command *uic_cmd,
 	if (completion)
 		init_completion(&uic_cmd->done);
 
+	uic_cmd->cmd_active = 1;
 	ufshcd_dispatch_uic_cmd(hba, uic_cmd);
 
 	return 0;
@@ -3774,10 +3785,18 @@ static int ufshcd_uic_pwr_ctrl(struct ufs_hba *hba, struct uic_command *cmd)
 		dev_err(hba->dev,
 			"pwr ctrl cmd 0x%x with mode 0x%x completion timeout\n",
 			cmd->command, cmd->argument3);
+
+		if (!cmd->cmd_active) {
+			dev_err(hba->dev, "%s: Power Mode Change operation has been completed, go check UPMCRS\n",
+				__func__);
+			goto check_upmcrs;
+		}
+
 		ret = -ETIMEDOUT;
 		goto out;
 	}
 
+check_upmcrs:
 	status = ufshcd_get_upmcrs(hba);
 	if (status != PWR_LOCAL) {
 		dev_err(hba->dev,
@@ -4887,11 +4906,14 @@ static irqreturn_t ufshcd_uic_cmd_compl(struct ufs_hba *hba, u32 intr_status)
 			ufshcd_get_uic_cmd_result(hba);
 		hba->active_uic_cmd->argument3 =
 			ufshcd_get_dme_attr_val(hba);
+		if (!hba->uic_async_done)
+			hba->active_uic_cmd->cmd_active = 0;
 		complete(&hba->active_uic_cmd->done);
 		retval = IRQ_HANDLED;
 	}
 
 	if ((intr_status & UFSHCD_UIC_PWR_MASK) && hba->uic_async_done) {
+		hba->active_uic_cmd->cmd_active = 0;
 		complete(hba->uic_async_done);
 		retval = IRQ_HANDLED;
 	}
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 363589c0bd370..23f46c7b8cb28 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -64,6 +64,7 @@ enum dev_cmd_type {
  * @argument1: UIC command argument 1
  * @argument2: UIC command argument 2
  * @argument3: UIC command argument 3
+ * @cmd_active: Indicate if UIC command is outstanding
  * @done: UIC command completion
  */
 struct uic_command {
@@ -71,6 +72,7 @@ struct uic_command {
 	u32 argument1;
 	u32 argument2;
 	u32 argument3;
+	int cmd_active;
 	struct completion done;
 };
 
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
