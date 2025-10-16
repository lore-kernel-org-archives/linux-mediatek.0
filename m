Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B1FCCD185
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Oct 2025 02:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpMbLrFO3xrtqtbWYAE6PugpJegq2buyMLaZMm5tQjM=; b=Nh35AiATmM1Qdt5obm+DEICsGc
	8NR84lJ97LxY8qelZS/jZpgYNBqRoUCw+44oyjYlR1ojkbeAizEkymF8uxcWRexqkLSl1Rnxr9lo5
	+WQbZ82lvo5RaWNqct3GeV72cFnXTRqGaN2BJzh3S8tYIlnKb8EXUV8iVVJrmEgvKhcJRZnU5wh9K
	8CzzU4VTxd6S3VUUEdRrOlYb6oc8v6NApkOSZS2J1RPF7C7bVCIYBT3bFXDcxh0tAgdsUjt1syTyy
	oMPd8AMIQkLdLQBH2QZW8d+iVnx+sO2aS4FbaFMBU5x4h5L8/ISlJprC/rgaYVjfSqI+9Xgr6jY2E
	hr/i5JMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Dpp-00000003JNO-1mOe;
	Thu, 16 Oct 2025 02:35:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Dpk-00000003JLM-2HXa
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Oct 2025 02:35:17 +0000
X-UUID: bd71687aaa3811f09f706fa2197c6ceb-20251015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LpMbLrFO3xrtqtbWYAE6PugpJegq2buyMLaZMm5tQjM=;
	b=DtMcBXnWC6cJiFCgIZGDKIP1F9BKJ6d0tbN62JpaBGJA/UqXo//Ku2D06i/OX4m/Shg1vESGNOF2tvICJkJuV+bjj3I2hbi0Y1bv8wz4QGWFVYAoVieokq2Vibw5fA1wxfcOpZ18M9/yWNQxwpFWCV2njDeNrbUwp/wdga4ovzc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:f5876caf-b3f8-4a94-b3b8-20d5f552d113,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:a9d874c,CLOUDID:5c907002-eaf8-4c8c-94de-0bc39887e077,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bd71687aaa3811f09f706fa2197c6ceb-20251015
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 453717911; Wed, 15 Oct 2025 19:35:12 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 16 Oct 2025 10:35:08 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Thu, 16 Oct 2025 10:35:08 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<qilin.tan@mediatek.com>, <lin.gui@mediatek.com>, <tun-yu.yu@mediatek.com>,
	<eddie.huang@mediatek.com>, <naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>,
	<bvanassche@acm.org>
Subject: [PATCH v2 2/2] ufs: core: support dumping CQ entry in MCQ Mode
Date: Thu, 16 Oct 2025 10:32:32 +0800
Message-ID: <20251016023507.1000664-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251016023507.1000664-1-peter.wang@mediatek.com>
References: <20251016023507.1000664-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_193516_592104_BE4C2E54 
X-CRM114-Status: GOOD (  12.64  )
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

Enhance the ufshcd_print_tr function to support dumping
completion queue (CQ) entries in MCQ mode when an error occurs.
This addition provides more detailed debugging information
by including the CQ entry data in the error logs, aiding
in the diagnosis of issues in MCQ mode.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index d779cc777a17..c7d28d87ad85 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5535,8 +5535,11 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp,
 	} /* end of switch */
 
 	if ((host_byte(result) != DID_OK) &&
-	    (host_byte(result) != DID_REQUEUE) && !hba->silence_err_logs)
+	    (host_byte(result) != DID_REQUEUE) && !hba->silence_err_logs) {
+		if (cqe)
+			ufshcd_hex_dump("UPIU CQE: ", cqe, sizeof(struct cq_entry));
 		ufshcd_print_tr(hba, lrbp->task_tag, true);
+	}
 	return result;
 }
 
-- 
2.45.2


