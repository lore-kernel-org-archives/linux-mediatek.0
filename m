Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77F3C369C8
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 10:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJnQKK/9GVFCpol62/YKdi7Bop9r1f03D07/z2b8dVI=; b=0Wqpb35lk6Gsv20z2+2ou6LJT7
	2SRh3vfBvM4qQgkb3Do5ZdRTAbK8L8sJifBEQBvwHcxz/dneCwgouuZSc8LMZc2/A5d5LcIGRLbte
	zI0RoiCAArWTFJtFE2Pizbafl9Fogrx84qdsKVuMC9N3QbdxR4CwOPl2gu7JQSkSZEvFU03YVQWFh
	KzUy8aoOQYK2Foxo4XpZk73wWyuEbuXntym+JHa3fZIiqHPyHmsv9qd4X7GVzVtbjqKvoFG5uL0P4
	WUD9tm4qkT6l2wnazjTbx/peUrJxPui3yuGMrJZlVKLCWYy95xl6Su4s8/K+K0KTIhbf+i5P6j8l/
	jJeUmQlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stP03-00000004iXN-2esb;
	Wed, 25 Sep 2024 10:11:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stP00-00000004iVF-0pMS
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 10:11:57 +0000
X-UUID: 952fbd5e7b2611efba0aef63c0775dbf-20240925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=MJnQKK/9GVFCpol62/YKdi7Bop9r1f03D07/z2b8dVI=;
	b=GY15UL5rFPRXr/Z1SUYsyi2gzkEUAUsz89RqWiXIaWS8bZULjvztgqIkodx7EEozSUB5Zi4iHVJ7oKe8S7kibXs0ZzJ+STqQBEg/ow7W8K+jqIiHT85ab1YoPeoYIT7QzOZetXa+ql8eRo4IM1vNV+fIKJJT/UP1PRtXfCSkjco=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:1c81c1a8-928e-44ff-ae7f-fe9ca854e6ba,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:e8ddbed0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 952fbd5e7b2611efba0aef63c0775dbf-20240925
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 470723533; Wed, 25 Sep 2024 03:11:51 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 25 Sep 2024 03:11:47 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 25 Sep 2024 18:11:47 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>,
	<quic_nguyenb@quicinc.com>
Subject: [PATCH v9 3/3] ufs: core: add a quirk for MediaTek SDB mode aborted
Date: Wed, 25 Sep 2024 17:55:46 +0800
Message-ID: <20240925095546.19492-4-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240925095546.19492-1-peter.wang@mediatek.com>
References: <20240925095546.19492-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_031156_272071_25ECDB7C 
X-CRM114-Status: GOOD (  13.55  )
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

Because the MediaTek UFS controller uses UTRLCLR to clear commands
and fills the OCS with ABORTED, this patch introduces a quirk to
treat ABORTED as INVALID_OCS_VALUE.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c       | 5 ++++-
 drivers/ufs/host/ufs-mediatek.c | 1 +
 include/ufs/ufshcd.h            | 6 ++++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 4fff929b70d6..d429817fca94 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5404,7 +5404,10 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp,
 		}
 		break;
 	case OCS_ABORTED:
-		result |= DID_ABORT << 16;
+		if (hba->quirks & UFSHCD_QUIRK_OCS_ABORTED)
+			result |= DID_REQUEUE << 16;
+		else
+			result |= DID_ABORT << 16;
 		dev_warn(hba->dev,
 				"OCS aborted from controller for tag %d\n",
 				lrbp->task_tag);
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 02c9064284e1..8a4c1b8f5a26 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1021,6 +1021,7 @@ static int ufs_mtk_init(struct ufs_hba *hba)
 	hba->quirks |= UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL;
 	hba->quirks |= UFSHCD_QUIRK_MCQ_BROKEN_INTR;
 	hba->quirks |= UFSHCD_QUIRK_MCQ_BROKEN_RTC;
+	hba->quirks |= UFSHCD_QUIRK_OCS_ABORTED;
 	hba->vps->wb_flush_threshold = UFS_WB_BUF_REMAIN_PERCENT(80);
 
 	if (host->caps & UFS_MTK_CAP_DISABLE_AH8)
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 0fd2aebac728..8f156803d703 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -684,6 +684,12 @@ enum ufshcd_quirks {
 	 * single doorbell mode.
 	 */
 	UFSHCD_QUIRK_BROKEN_LSDBS_CAP			= 1 << 25,
+
+	/*
+	 * Some host controllers set OCS_ABORTED after UTRLCLR (SDB mode),
+	 * this quirk is set to treat OCS: ABORTED as INVALID_OCS_VALUE
+	 */
+	UFSHCD_QUIRK_OCS_ABORTED			= 1 << 26,
 };
 
 enum ufshcd_caps {
-- 
2.45.2


