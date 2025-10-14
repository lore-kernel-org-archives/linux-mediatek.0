Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A667CCD192
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Oct 2025 13:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0v/CBd1rmPyG88zln9xhPVoHM485BZhnHYxuMKXiFXE=; b=uu+xGV70r7mFUTpbf4yPiYu+6a
	REAPEAcqEgHIOlGHaSjWgi8Nh6yyKbB+gnoJ85vbOsvXa+njSCFl3slSnt9zZTacEq/fbrwz1yWlZ
	3uxl/4yYruIkwOKAyElIYU+m9TPx5w/HUhqbm80aSDMccu3aLeKlzq6Ws1kp61nFcW6p1OCQp2HAR
	Sa++6EDROyhoJcF+ZAyolUOW4ndW8h2txJIFam26kD9I/4oqda3Mlmte57FvoGLwaJ1l8Vdk5HIvi
	0qv2mbXi3hMWPx4TzqALr+dysUQmCjhQOu5J+0O2vJ/uqIYav9ImcLol/p9otRZyjQ5s+qMSeZ36G
	mzYHdwdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eus-0000000GRos-2jGd;
	Tue, 14 Oct 2025 13:18:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eup-0000000GRoM-306K
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Oct 2025 13:18:12 +0000
X-UUID: 37140942a90011f09f706fa2197c6ceb-20251014
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0v/CBd1rmPyG88zln9xhPVoHM485BZhnHYxuMKXiFXE=;
	b=nVpg5dXgCG08lKzjCVgj8dPRlxJCowM2jQHQ1LFC5+0s6A2qpuvigUG+Au2ZhhA23M9WwLeptmnjR5HJVW90NAutQBsg1eip3DRJY4+iQ/Yx80uXOR1QKh4PY+7EQuIiJQd2tAd0kXvXRaw/ambu4t3twlOvXt6yhOTUDR2uOcM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:3c552def-d026-4dc3-a0a7-a80c0cb4fb15,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:a9d874c,CLOUDID:94023486-2e17-44e4-a09c-1e463bf6bc47,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 37140942a90011f09f706fa2197c6ceb-20251014
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1246382358; Tue, 14 Oct 2025 06:18:03 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 14 Oct 2025 21:18:00 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.10 via Frontend Transport; Tue, 14 Oct 2025 21:18:00 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<qilin.tan@mediatek.com>, <lin.gui@mediatek.com>, <tun-yu.yu@mediatek.com>,
	<eddie.huang@mediatek.com>, <naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>,
	<bvanassche@acm.org>
Subject: [PATCH v1 2/2] ufs: core: support dumping CQ entry in MCQ Mode
Date: Tue, 14 Oct 2025 21:15:56 +0800
Message-ID: <20251014131758.270324-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251014131758.270324-1-peter.wang@mediatek.com>
References: <20251014131758.270324-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_061811_797716_F302460C 
X-CRM114-Status: GOOD (  12.36  )
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
 drivers/ufs/core/ufshcd.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index d779cc777a17..b90500126b35 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -599,7 +599,8 @@ static void ufshcd_print_evt_hist(struct ufs_hba *hba)
 }
 
 static
-void ufshcd_print_tr(struct ufs_hba *hba, int tag, bool pr_prdt)
+void ufshcd_print_tr(struct ufs_hba *hba, struct cq_entry *cqe,
+		     int tag, bool pr_prdt)
 {
 	const struct ufshcd_lrb *lrbp;
 	int prdt_length;
@@ -618,6 +619,8 @@ void ufshcd_print_tr(struct ufs_hba *hba, int tag, bool pr_prdt)
 
 	ufshcd_hex_dump("UPIU TRD: ", lrbp->utr_descriptor_ptr,
 			sizeof(struct utp_transfer_req_desc));
+	if (cqe)
+		ufshcd_hex_dump("UPIU CQE: ", cqe, sizeof(struct cq_entry));
 	dev_err(hba->dev, "UPIU[%d] - Request UPIU phys@0x%llx\n", tag,
 		(u64)lrbp->ucd_req_dma_addr);
 	ufshcd_hex_dump("UPIU REQ: ", lrbp->ucd_req_ptr,
@@ -648,7 +651,7 @@ static bool ufshcd_print_tr_iter(struct request *req, void *priv)
 	struct Scsi_Host *shost = sdev->host;
 	struct ufs_hba *hba = shost_priv(shost);
 
-	ufshcd_print_tr(hba, req->tag, *(bool *)priv);
+	ufshcd_print_tr(hba, NULL, req->tag, *(bool *)priv);
 
 	return true;
 }
@@ -5536,7 +5539,7 @@ ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp,
 
 	if ((host_byte(result) != DID_OK) &&
 	    (host_byte(result) != DID_REQUEUE) && !hba->silence_err_logs)
-		ufshcd_print_tr(hba, lrbp->task_tag, true);
+		ufshcd_print_tr(hba, cqe, lrbp->task_tag, true);
 	return result;
 }
 
@@ -7763,9 +7766,9 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 		ufshcd_print_evt_hist(hba);
 		ufshcd_print_host_state(hba);
 		ufshcd_print_pwr_info(hba);
-		ufshcd_print_tr(hba, tag, true);
+		ufshcd_print_tr(hba, NULL, tag, true);
 	} else {
-		ufshcd_print_tr(hba, tag, false);
+		ufshcd_print_tr(hba, NULL, tag, false);
 	}
 	hba->req_abort_count++;
 
-- 
2.45.2


