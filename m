Return-Path: <SRS0=1cO+=GX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D19C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 01:32:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5F5B20449
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 01:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5F5B20449
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ije64kr0w3H8XbCh/BYz303Kwi2wfqjkKR3OhWovFnU=; b=TiaBiq8CjU0fE4BNqZZVP2oxj
	f8yFDR6gExbZEC9Q7GgwuAEsEx1FF/+4wgyVOMONM8yQXv+DBVp8Tfxa96jqQKkD8I9sO7AnXiNbX
	2PGRwiV0A8QqhCS5OuY52XuHOaONvA2rte8/udUWzSz8sDNbVCabxo4smVcYeVG8i86GrfjTTG9SA
	AZiOdu5cbKuZRB3OThFo4SXT4X3vkhK3eea+61w+RzJj+eDjbQmOi7Dsx5dXslSZss06Kf6MdoYdZ
	7Mgx9ScWMHeAgukJN/9tk+rJOTbrmbiyiIrdRv3DZK94YQPGPq2u7ssEnCyjplFo89mu8+OwMqdZJ
	NgZiQgRZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l22Lr-000679-7X; Wed, 20 Jan 2021 01:32:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l22IH-0003qd-Gz; Wed, 20 Jan 2021 01:28:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E7A282332A;
 Wed, 20 Jan 2021 01:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611106100;
 bh=6s/Zt7W+Wkg1fAW8F+7rxzIrH/88u0za87HrNngqBCU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xjay960n1aYnj1AFVw8xaK8sJmgQeJgO5vbQjDKnWWsgUt3pfOO6ZvReEc5mls34X
 fTxv4BZYrkz+oj/2//MiaJeVAtllJxe1wx75TPvVBHzXg5BiO6pz4/cODedT0nJ/3t
 9WTujEWEb+YrPbv/qnkIUF+mBWoxMFwDFs973rs15CnpWHRge+Ja/sF6MEL2qv8R1G
 tOL727xHpieZ8NiNshikFbhRk1k5COGxqBw56y+tcomkyBGMGerSOj2lk8WSbDhSd0
 9vIbFxinpk7iQUh4pvec/VLXDIIZaW1Z4at0YNBi2OvrwNhJbF+7jCtwbFICiBHT05
 SWKAK0zC1EJ4g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 2/4] scsi: ufs: Correct the LUN used in
 eh_device_reset_handler() callback
Date: Tue, 19 Jan 2021 20:28:14 -0500
Message-Id: <20210120012816.770648-2-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012816.770648-1-sashal@kernel.org>
References: <20210120012816.770648-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_202821_705784_E14E748D 
X-CRM114-Status: GOOD (  12.56  )
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
 Avri Altman <avri.altman@wdc.com>, Can Guo <cang@codeaurora.org>,
 linux-mediatek@lists.infradead.org, Stanley Chu <stanley.chu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Can Guo <cang@codeaurora.org>

[ Upstream commit 35fc4cd34426c242ab015ef280853b7bff101f48 ]

Users can initiate resets to specific SCSI device/target/host through
IOCTL. When this happens, the SCSI cmd passed to eh_device/target/host
_reset_handler() callbacks is initialized with a request whose tag is -1.
In this case it is not right for eh_device_reset_handler() callback to
count on the LUN get from hba->lrb[-1]. Fix it by getting LUN from the SCSI
device associated with the SCSI cmd.

Link: https://lore.kernel.org/r/1609157080-26283-1-git-send-email-cang@codeaurora.org
Reviewed-by: Avri Altman <avri.altman@wdc.com>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufshcd.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index ad80e4223c2d3..a767d942bfca5 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -4552,19 +4552,16 @@ static int ufshcd_eh_device_reset_handler(struct scsi_cmnd *cmd)
 {
 	struct Scsi_Host *host;
 	struct ufs_hba *hba;
-	unsigned int tag;
 	u32 pos;
 	int err;
-	u8 resp = 0xF;
-	struct ufshcd_lrb *lrbp;
+	u8 resp = 0xF, lun;
 	unsigned long flags;
 
 	host = cmd->device->host;
 	hba = shost_priv(host);
-	tag = cmd->request->tag;
 
-	lrbp = &hba->lrb[tag];
-	err = ufshcd_issue_tm_cmd(hba, lrbp->lun, 0, UFS_LOGICAL_RESET, &resp);
+	lun = ufshcd_scsi_to_upiu_lun(cmd->device->lun);
+	err = ufshcd_issue_tm_cmd(hba, lun, 0, UFS_LOGICAL_RESET, &resp);
 	if (err || resp != UPIU_TASK_MANAGEMENT_FUNC_COMPL) {
 		if (!err)
 			err = resp;
@@ -4573,7 +4570,7 @@ static int ufshcd_eh_device_reset_handler(struct scsi_cmnd *cmd)
 
 	/* clear the commands that were pending for corresponding LUN */
 	for_each_set_bit(pos, &hba->outstanding_reqs, hba->nutrs) {
-		if (hba->lrb[pos].lun == lrbp->lun) {
+		if (hba->lrb[pos].lun == lun) {
 			err = ufshcd_clear_cmd(hba, pos);
 			if (err)
 				break;
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
