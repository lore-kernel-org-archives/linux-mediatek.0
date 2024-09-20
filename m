Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB970CF58F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Sep 2024 09:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LQLPSb8ldyG1OVVh0BB+yFOhjzNrq/gu6sGXkPkLj9A=; b=yPRwN3ql4Lg5tjRd+WZYzue4fU
	8b8e9pXhF6pAok+1irxGSom3IwN7whxmP8ChKr3zWkeoLCCSX8AjbueTwD/2thOkp/XPqYyZwerRQ
	e59x2WLOaEV19DauJL2w7spxeoqOm4pKr5NmmN+M1p+oSR0xgFaYb2/Pl5JiRFlCWQl3lgIAQpkRb
	SqTrPFdFdYuxCqfP1R/PiLAdTwhsdFdgVIXoBxEVDUPzn15s8K3w/A+h03Ntq0wx9mLt0yGAOxGhV
	T4UF2brE8HPCa7d7LGlOwCGnsBzoQgO4xIrOFYqX5Aaj+mV8yunH1FUYX9Kuy3C+VjP8sultx3Wgw
	LD5RAeAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srZbM-0000000Bsyd-1rMg;
	Fri, 20 Sep 2024 09:06:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srZbJ-0000000Bswi-1G9c
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Sep 2024 09:06:55 +0000
X-UUID: aa1bc2da772f11efba0aef63c0775dbf-20240920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LQLPSb8ldyG1OVVh0BB+yFOhjzNrq/gu6sGXkPkLj9A=;
	b=kcPkI4q97MBJv97o41awTYaF2TrAghtcM1fssO3GIev9X1ILT9huzoQgbUWxxGsnX+qRM21D5BHWipxGkDICIEddtDfyJ4VJEmF2tp4vxGvmzwC3DiWdcV2d/1x3HBetPvwMmwZs6Ni5e6lLdYEiLf26K7j5BeD48ydSeA4AW3U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:80d33b10-764a-4a6a-9afe-7b4a71da429e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:68ec7fd0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: aa1bc2da772f11efba0aef63c0775dbf-20240920
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1837905487; Fri, 20 Sep 2024 02:06:47 -0700
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
	<quic_nguyenb@quicinc.com>, <stable@vger.kernel.org>
Subject: [PATCH v7 1/4] ufs: core: fix the issue of ICU failure
Date: Fri, 20 Sep 2024 17:06:40 +0800
Message-ID: <20240920090643.3566-2-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240920090643.3566-1-peter.wang@mediatek.com>
References: <20240920090643.3566-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_020653_746888_DC8A9A76 
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

When setting the ICU bit without using read-modify-write,
SQRTCy will restart SQ again and receive an RTC return
error code 2 (Failure - SQ not stopped).

Additionally, the error log has been modified so that
this type of error can be observed.

Fixes: ab248643d3d6 ("scsi: ufs: core: Add error handling for MCQ mode")
Cc: stable@vger.kernel.org
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/ufs/core/ufs-mcq.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 5891cdacd0b3..3903947dbed1 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -539,7 +539,7 @@ int ufshcd_mcq_sq_cleanup(struct ufs_hba *hba, int task_tag)
 	struct scsi_cmnd *cmd = lrbp->cmd;
 	struct ufs_hw_queue *hwq;
 	void __iomem *reg, *opr_sqd_base;
-	u32 nexus, id, val;
+	u32 nexus, id, val, rtc;
 	int err;
 
 	if (hba->quirks & UFSHCD_QUIRK_MCQ_BROKEN_RTC)
@@ -569,17 +569,18 @@ int ufshcd_mcq_sq_cleanup(struct ufs_hba *hba, int task_tag)
 	opr_sqd_base = mcq_opr_base(hba, OPR_SQD, id);
 	writel(nexus, opr_sqd_base + REG_SQCTI);
 
-	/* SQRTCy.ICU = 1 */
-	writel(SQ_ICU, opr_sqd_base + REG_SQRTC);
+	/* Initiate Cleanup */
+	writel(readl(opr_sqd_base + REG_SQRTC) | SQ_ICU,
+		opr_sqd_base + REG_SQRTC);
 
 	/* Poll SQRTSy.CUS = 1. Return result from SQRTSy.RTC */
 	reg = opr_sqd_base + REG_SQRTS;
 	err = read_poll_timeout(readl, val, val & SQ_CUS, 20,
 				MCQ_POLL_US, false, reg);
-	if (err)
-		dev_err(hba->dev, "%s: failed. hwq=%d, tag=%d err=%ld\n",
-			__func__, id, task_tag,
-			FIELD_GET(SQ_ICU_ERR_CODE_MASK, readl(reg)));
+	rtc = FIELD_GET(SQ_ICU_ERR_CODE_MASK, readl(reg));
+	if (err || rtc)
+		dev_err(hba->dev, "%s: failed. hwq=%d, tag=%d err=%d RTC=%d\n",
+			__func__, id, task_tag, err, rtc);
 
 	if (ufshcd_mcq_sq_start(hba, hwq))
 		err = -ETIMEDOUT;
-- 
2.45.2


