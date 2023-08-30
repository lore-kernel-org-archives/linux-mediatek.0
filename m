Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D59C83F14
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Aug 2023 13:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wFdRmdpCsZ45j7y1oLGMF8enjtWZ4nVcCl66VJ08MF4=; b=e1JaGAXg8YwkD/H7mFGZzTjadf
	KBq49vG0etoAg+/ofRGQsOTVmYx2Di13W6BfywvIrYlklsqNuoZccZ+XObw5aV1aPU9i1qr8JOTI7
	MPmdQQvL3UeYNlIH8M+O7CfibXyrvMdXyCCydi1Wwr4tFNBPLCNOp36fG/OuA7AGCc3DLLUGejnxb
	mPDoTbazL3mr+Qwtr4ykRBdlpqlHdQ5b2Sr0L7i/aRNKXPfYAq2rcSe3XTQgNvtYgG1jtUtExdIqJ
	W+uvm3RVv+i46pRr3mE6olqM2u1BXyp7ztEbw3WEsYITuXNs5A7QQYuF1gQONNCGZmIOoYv/SisTG
	/KGdbr8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL20-00DWvr-2E;
	Wed, 30 Aug 2023 13:14:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbL1y-00DWvM-0r
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Aug 2023 13:14:47 +0000
X-UUID: 2db83512473711ee83ed1395ce914268-20230830
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wFdRmdpCsZ45j7y1oLGMF8enjtWZ4nVcCl66VJ08MF4=;
	b=AcgEO7r5wXlwCKO2F9LEocZMAxRs65127Z2ZIJXp+hdpymBzh2LtgMNxwenMyDnfyrIa3PPAJEuQj18DprI+gWLcinmh2Q4myKUs1JiEunaAQ47fUmFvTiNb2AT8PL9wKQjzLVfpre4PIMYonMCuHGg9Ho/qb51Yci/xA02Smk4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:44b5c911-f0a8-49cf-8a69-376b85a64ec4,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:0ad78a4,CLOUDID:67a9ec1f-33fd-4aaa-bb43-d3fd68d9d5ae,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 2db83512473711ee83ed1395ce914268-20230830
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1682620011; Wed, 30 Aug 2023 06:14:41 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 30 Aug 2023 21:14:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 30 Aug 2023 21:14:04 +0800
From: <peter.wang@mediatek.com>
To: <stanley.chu@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>
Subject: [PATCH v1] ufs: core: fix runtime pm with uic error(NON_FATAL) hang
Date: Wed, 30 Aug 2023 21:14:03 +0800
Message-ID: <20230830131403.14193-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_061446_315091_C35B896A 
X-CRM114-Status: GOOD (  12.41  )
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

When uic error (NON_FATAL) happen in runtime pm flow, ufshcd_err_handler
stuck in ufshcd_rpm_get_sync, but runtime pm(suspend or resume) stuck in
send SSU(sleep or active) which always get SCSI_MLQUEUE_HOST_BUSY.

This patch try to solve this deadlock:
1. Return error to break runtime suspend let err handler going, same as
   UFSHCD_STATE_EH_SCHEDULED_FATAL do.
2. Try do recovery if SSU(active) fail when resume, prevent resume
   return fail which casue IO hang.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 129446775796..bc30a0842277 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2863,6 +2863,14 @@ static int ufshcd_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *cmd)
 		 * being issued in that case.
 		 */
 		if (ufshcd_eh_in_progress(hba)) {
+			/* Same as UFSHCD_STATE_EH_SCHEDULED_FATAL */
+			if (hba->pm_op_in_progress) {
+				hba->force_reset = true;
+				set_host_byte(cmd, DID_BAD_TARGET);
+				scsi_done(cmd);
+				goto out;
+			}
+
 			err = SCSI_MLQUEUE_HOST_BUSY;
 			goto out;
 		}
@@ -9784,6 +9792,9 @@ static int __ufshcd_wl_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 
 	if (!ufshcd_is_ufs_dev_active(hba)) {
 		ret = ufshcd_set_dev_pwr_mode(hba, UFS_ACTIVE_PWR_MODE);
+		/* Try prevent return error, else IO hang */
+		if (ret)
+			ret = ufshcd_link_recovery(hba);
 		if (ret)
 			goto set_old_link_state;
 		ufshcd_set_timestamp_attr(hba);
-- 
2.18.0


