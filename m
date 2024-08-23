Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DC3C52D7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 10:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/hVDi5QlE7twKetiUuJWI0sQsaizIXKv/4S0mRRLMs=; b=p/MSCDZr3uuDroB6RqSnwIxix0
	MsM6lqgKRb7J3V4RTyzW+W7a8G9Exg9uZyLD0zU5FVKuAXB/BwJ3U8mRDWZTai7rrRX3KUlG8V3K4
	QDTrfEAnOtsZZdA+a4VXz+R7W/w6kHeP2EIe95v5d+9d7p0onMtxj4b9gxRMz0ANQhhybvDY8qUt7
	laj0Ke3+M1OBP6lUcWJhO5hXdmAqwkQAsAhdnO6ennHwBlv/pZcc+3uV53mxjiP+wk5ZBUdMCjXmg
	8n4Vc2acbb4NgOG6bq3EqwGtk0oXFPu/d4Sy1N5pmg9JhUH8m8yUPiO8Wz3KAXR41/+UgvhhkryBh
	9jVRZTcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shRWu-0000000GKvO-3A39;
	Fri, 23 Aug 2024 10:28:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shRRg-0000000GJwf-0dB8
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Aug 2024 10:23:05 +0000
X-UUID: 8c25939a613711efb3adad29d29602c1-20240823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Q/hVDi5QlE7twKetiUuJWI0sQsaizIXKv/4S0mRRLMs=;
	b=nilores/ifgJbNFLNxbKyTOBmGeCFx1zggzRJSGOv6FHouMlwV4tDrOmqSi4oG/+M3mqVY+F2wR9Qd9NQwR+MRYRvfoXVkEl1BCnXkR/CQsdj2MIcgCjaoxnHYgLKSnGdiG+0C2ZX01TWl8l6macYjIzJehzOcfFz5BTWRHY+nU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:edeb1142-eed6-468d-9ef0-3f246e8bce23,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:ebf2af14-737d-40b3-9394-11d4ad6e91a1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8c25939a613711efb3adad29d29602c1-20240823
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 596878962; Fri, 23 Aug 2024 03:07:47 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 23 Aug 2024 03:07:09 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 23 Aug 2024 18:07:09 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <chu.stanley@gmail.com>, <stable@vger.kernel.org>
Subject: [PATCH v1 1/2] ufs: core: complete scsi command after release
Date: Fri, 23 Aug 2024 18:07:06 +0800
Message-ID: <20240823100707.6699-2-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240823100707.6699-1-peter.wang@mediatek.com>
References: <20240823100707.6699-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_032304_203739_073C6780 
X-CRM114-Status: GOOD (  11.51  )
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

When the error handler successfully aborts a MCQ request,
it only releases the command and does not notify the SCSI layer.
This may cause another abort after 30 seconds timeout.
This patch notifies the SCSI layer to requeue the request.

Below is error log
[   14.183804][   T74] ufshcd-mtk 112b0000.ufshci: ufshcd_err_handler started; HBA state eh_non_fatal; powered 1; shutting down 0; saved_err = 4; saved_uic_err = 64; force_reset = 0
[   14.256164][   T74] ufshcd-mtk 112b0000.ufshci: ufshcd_try_to_abort_task: cmd pending in the device. tag = 19
[   14.257511][   T74] ufshcd-mtk 112b0000.ufshci: Aborting tag 19 / CDB 0x35 succeeded
[   34.287949][    T8] ufshcd-mtk 112b0000.ufshci: ufshcd_abort: Device abort task at tag 19
[   34.290514][    T8] ufshcd-mtk 112b0000.ufshci: ufshcd_mcq_abort: skip abort. cmd at tag 19 already completed.

Fixes:93e6c0e19d5b ("scsi: ufs: core: Clear cmd if abort succeeds in MCQ mode")
Cc: <stable@vger.kernel.org> 6.6.x

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 0b3d0c8e0dda..4bcd4e5b62bd 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6482,8 +6482,12 @@ static bool ufshcd_abort_one(struct request *rq, void *priv)
 		if (!hwq)
 			return 0;
 		spin_lock_irqsave(&hwq->cq_lock, flags);
-		if (ufshcd_cmd_inflight(lrbp->cmd))
+		if (ufshcd_cmd_inflight(lrbp->cmd)) {
+			struct scsi_cmnd *cmd = lrbp->cmd;
+			set_host_byte(cmd, DID_REQUEUE);
 			ufshcd_release_scsi_cmd(hba, lrbp);
+			scsi_done(cmd);
+		}
 		spin_unlock_irqrestore(&hwq->cq_lock, flags);
 	}
 
-- 
2.45.2


