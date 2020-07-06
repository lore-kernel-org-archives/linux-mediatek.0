Return-Path: <SRS0=Wnqn=AR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63735C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 06:12:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CB8820724
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2020 06:12:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="epE7EImp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="u7wVUTpX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CB8820724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iEloH442SORk2draF7bOHz+OZ9eDhcYD2V1SqcRVYQo=; b=epE7EImpOVdt8HUFoHjc+4ZeY
	HSq3L7kKmIEOz5ZR/J2l6/281re1L9FQsJoieYLMR1H/PdpGVJFIQGuFDgnSkXRKKXMF0yKbpU7/6
	4rGhOuUUQ69TZd27QzMJB1VCLkwFUvkEIu4bL2XnBHmFnQZF7cUIX9lf+jZDsY7Tb80jUk7HbknGw
	M3tvaaLS+85PZ86ksT2PJeF7fd88ULwhQMXZh2YLY03+6fJ0MtIn6rmHai6OeSqyhlw68GpINoYh4
	b5SpSgopGPI4DKRtv2gwXVQ6GcuoxDApGmnKxEqEnc/bsI4uy4xy0grjCOnuWn5THGMupF2bqmAmp
	+jvTyju5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsKMO-0007wD-3h; Mon, 06 Jul 2020 06:12:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsKMK-0007v6-8U; Mon, 06 Jul 2020 06:12:09 +0000
X-UUID: 6570df701cae43b18c187e424e4ad7c4-20200705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TEVJ+Nr51pohIXBKHppotISQ5SGWi6nMpNvyxh0dqh4=; 
 b=u7wVUTpXFHtcf3DF+PloFy7FAEuFtIm37rJC/+n3PjG/OrXb3g35FOVe/ndJTZ9nM38v1bW6U4sgeAJ6yn8z/ZO/cH/lIDjJR8sjKtF/ASlWENP0SfTXKYfLBYWBmiI9epAS3VDHl6SSRYTFu4MI9yMvUSsUrrQwq8ppuVfPfRg=;
X-UUID: 6570df701cae43b18c187e424e4ad7c4-20200705
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1706316981; Sun, 05 Jul 2020 22:11:58 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 5 Jul 2020 23:07:06 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 6 Jul 2020 14:07:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 6 Jul 2020 14:07:05 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <bvanassche@acm.org>
Subject: [PATCH v1 1/2] scsi: ufs: Simplify completion timestamp for SCSI and
 query commands
Date: Mon, 6 Jul 2020 14:07:06 +0800
Message-ID: <20200706060707.32608-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200706060707.32608-1-stanley.chu@mediatek.com>
References: <20200706060707.32608-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_021208_448859_0E9E5EBE 
X-CRM114-Status: GOOD (  10.20  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Simplify recording command completion time in
__ufshcd_transfer_req_compl() by assigning lrbp->compl_time_stamp
in an unified location.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 18da2d64f9fa..71e8d7c782bd 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -4881,6 +4881,7 @@ static void __ufshcd_transfer_req_compl(struct ufs_hba *hba,
 
 	for_each_set_bit(index, &completed_reqs, hba->nutrs) {
 		lrbp = &hba->lrb[index];
+		lrbp->compl_time_stamp = ktime_get();
 		cmd = lrbp->cmd;
 		if (cmd) {
 			ufshcd_add_command_trace(hba, index, "complete");
@@ -4889,13 +4890,11 @@ static void __ufshcd_transfer_req_compl(struct ufs_hba *hba,
 			cmd->result = result;
 			/* Mark completed command as NULL in LRB */
 			lrbp->cmd = NULL;
-			lrbp->compl_time_stamp = ktime_get();
 			/* Do not touch lrbp after scsi done */
 			cmd->scsi_done(cmd);
 			__ufshcd_release(hba);
 		} else if (lrbp->command_type == UTP_CMD_TYPE_DEV_MANAGE ||
 			lrbp->command_type == UTP_CMD_TYPE_UFS_STORAGE) {
-			lrbp->compl_time_stamp = ktime_get();
 			if (hba->dev_cmd.complete) {
 				ufshcd_add_command_trace(hba, index,
 						"dev_complete");
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
