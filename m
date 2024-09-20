Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA608CF58F6
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Sep 2024 09:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xNb7mFTITTmMurg2rCVqzTzwqSCK4YZX8H6PFFqaw4=; b=An0Tc6vnCAnHNQWpleOFkLnMJ9
	6gLi62AQLzVWKV4Vj5+p+d1vm1B9wOTKXPwWPr5X3CkIX5Om5tZIWZRsMIkFr6D1DcmIGq5x02eRS
	l1AndtCu/q0grKEU9p1XTt+94XInwgoDHSEFp69PJOqO8h1t6zfwZoivzgnefAVH6bvsy0FcQd86D
	3ZW06FN34mj7aGqknvk7dG59OoDm16FilgBlrkZ4OrLDHBahAdil8XGP9+cCI2O4zqUHTKTiuWFkc
	rcp8rBaYk7tm1IV4nzwkvAzoFlD9lf1dZXan9thJZdEKtIIQzuB7VIKvIiGSZYZ17MzHtmYs6llf3
	k+S6exBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srZbL-0000000Bsxv-2Z5p;
	Fri, 20 Sep 2024 09:06:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srZbI-0000000Bsvy-3rxd
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Sep 2024 09:06:54 +0000
X-UUID: aab9a284772f11efba0aef63c0775dbf-20240920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0xNb7mFTITTmMurg2rCVqzTzwqSCK4YZX8H6PFFqaw4=;
	b=AK7JGcznKyV5i+DW0Zx7tV+/hTfiK+FTwly5zg+d7MryehRmaHKDmFzR8x5A7V0AAkyPQNprMiHseP2o2Yh1eYcoyzgYhd3MNIcWKbc7M37px5hR2cngAv9V61YSxLWDsQggrkcyvTePJKZXl7HYy9iq9WtPoo/YhhJpxKHmhEs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:67e003ae-9c3d-4873-9c16-0ea234c4fecb,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:779bfc17-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: aab9a284772f11efba0aef63c0775dbf-20240920
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1738102549; Fri, 20 Sep 2024 02:06:48 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Sep 2024 02:06:44 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Sep 2024 17:06:44 +0800
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
Subject: [PATCH v7 3/4] ufs: core: add a quirk for MediaTek SDB mode aborted
Date: Fri, 20 Sep 2024 17:06:42 +0800
Message-ID: <20240920090643.3566-4-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240920090643.3566-1-peter.wang@mediatek.com>
References: <20240920090643.3566-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_020653_012980_65839D6A 
X-CRM114-Status: GOOD (  11.86  )
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
 drivers/ufs/core/ufshcd.c       | 3 ++-
 drivers/ufs/host/ufs-mediatek.c | 1 +
 include/ufs/ufshcd.h            | 6 ++++++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 4f9c7a632465..b34125238a70 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5405,7 +5405,8 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp,
 		}
 		break;
 	case OCS_ABORTED:
-		if (lrbp->abort_initiated_by == UFS_ERR_HANDLER)
+		if ((lrbp->abort_initiated_by == UFS_ERR_HANDLER) ||
+		    (!hba->mcq_enabled && (hba->quirks & UFSHCD_QUIRK_OCS_ABORTED)))
 			result |= DID_REQUEUE << 16;
 		else
 			result |= DID_ABORT << 16;
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
index 61a7dc489511..4d17a13ac558 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -692,6 +692,12 @@ enum ufshcd_quirks {
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


