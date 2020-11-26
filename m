Return-Path: <SRS0=o4uA=FA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29189C63777
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 05:39:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B913F206F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 05:39:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MVW+epO3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oYIhp5FX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B913F206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=17uPxzcOetDSKjaqULP9d90+I/lELLV2FVGgmlNAwfc=; b=MVW+epO3Ekuo3lwOz91VruTXX
	x68umHhMwN5srAkGnOLdi34sR1MegSpbdCJE2C64qoCtkx1xxxg6crOLzaEC1o/upt2qfetXxPIN+
	FGt4ZkA6btnLFSQl+s72l0BWX9xNS3NMbgDVUKyqn4qBX+HDNpZUu/gQJFaUqRx0B9+WTrf5zps4Y
	cCDIW4pD3j6/EQiNuCc2bWE2gz0vioX6tRuZy4GiRiI3f1S/6u9oLmzLYPnHcmAPAU2b1PmCCTE7S
	taniP6oc7n9qL3VrErp1MpONwkiTljcx582Y7si4/c8f3Ajquof+gKszrwsqVkOq/Pn+97YrWKzw2
	4sDCJi4qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiA0N-0005gz-5u; Thu, 26 Nov 2020 05:39:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki9zg-0005X9-2q; Thu, 26 Nov 2020 05:39:00 +0000
X-UUID: 1f30fac157e7487c9a5044c5094a1f4a-20201125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=B2s51sR/M+kmcMC+n0ow8UlPGesasqrudbBWfD7h6i4=; 
 b=oYIhp5FXfX39il3ERY5P1x9J3hCxFk0a1cI7i8x8X7csOnXaE3kD1JAm5I4HPIpd4aaYSCbXcQlu3BC0c9hHJNZOGo4vlgCWjJExyUZnwTxZd4hVb5KkhKEuBOVWcHzCUyHHrwbfj5us+UDU7rQmJV8bRo8Ks42QLgiKiZ4rVS0=;
X-UUID: 1f30fac157e7487c9a5044c5094a1f4a-20201125
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 340513252; Wed, 25 Nov 2020 21:38:29 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Nov 2020 21:38:55 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 Nov 2020 13:38:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 26 Nov 2020 13:38:40 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 1/3] scsi: ufs: Add error history for abort event in UFS
 Device W-LUN
Date: Thu, 26 Nov 2020 13:38:37 +0800
Message-ID: <20201126053839.25889-2-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201126053839.25889-1-stanley.chu@mediatek.com>
References: <20201126053839.25889-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 130BC8D7BEA1DFFC31F184632A009456CB0D0F6DA020AB6400F2F83B92F318792000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_003900_287209_0C305130 
X-CRM114-Status: GOOD (  11.13  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, alice.chao@mediatek.com,
 bvanassche@acm.org, huadian.liu@mediatek.com, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add error history for abort event in UFS Device W-LUN.
Besides, use specified value as parameter of ufshcd_update_reg_hist()
to identify the aborted tag or LUNs.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 0e5473d4699b..28e4def13f21 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -6742,8 +6742,10 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 	 * To avoid these unnecessary/illegal step we skip to the last error
 	 * handling stage: reset and restore.
 	 */
-	if (lrbp->lun == UFS_UPIU_UFS_DEVICE_WLUN)
+	if (lrbp->lun == UFS_UPIU_UFS_DEVICE_WLUN) {
+		ufshcd_update_reg_hist(&hba->ufs_stats.task_abort, lrbp->lun);
 		return ufshcd_eh_host_reset_handler(cmd);
+	}
 
 	ufshcd_hold(hba, false);
 	reg = ufshcd_readl(hba, REG_UTP_TRANSFER_REQ_DOOR_BELL);
@@ -6767,7 +6769,7 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 	 */
 	scsi_print_command(hba->lrb[tag].cmd);
 	if (!hba->req_abort_count) {
-		ufshcd_update_reg_hist(&hba->ufs_stats.task_abort, 0);
+		ufshcd_update_reg_hist(&hba->ufs_stats.task_abort, tag);
 		ufshcd_print_host_regs(hba);
 		ufshcd_print_host_state(hba);
 		ufshcd_print_pwr_info(hba);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
