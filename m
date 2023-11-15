Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C34C48BF9
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 13:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C9bLgmSE/bzwUoE9sEirds2nyAgb0y2Jz1sKDbtfvr8=; b=AcdotdrzIr3wWP3hqAv0dqRDiC
	GxCjkX+aeTfb6po5DGd78J0lPm8fMT/KQFxqkMxS2TiFBNREILcQ5IgQyq7WEkiuJv6C+Xx0qpaG2
	ohnZPNc3aN3F8F+64WKAzy2toXG+nGl9CkCTCOK5AHaTKxg4CpVR1waakrGWq9hG7Hn5b4rOgFCRn
	HhD9g3ucsx/1X+bn4QKW09I01gWSRLRd8HCai/O8vnlv7QvF2zOwuC0cyVc3lk/sCGk6iqxKXxBno
	nQuiSK2pattTRTtdGjjLU2F7sHyTUwHTXMtiQGM+OjA7wcwoxPbYX/X9ViD+TQSsVsl8tHN1LUXC3
	S1yldLzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3G0A-000t5e-1D;
	Wed, 15 Nov 2023 13:32:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3G05-000t4t-1w
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 13:32:16 +0000
X-UUID: 250e29d883bb11ee86758d4a7c00f3a0-20231115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=C9bLgmSE/bzwUoE9sEirds2nyAgb0y2Jz1sKDbtfvr8=;
	b=ImLO6QUZ/fgbhGiF9jfSOQES9syW6aYWHftjkMJEloObzBVhMzjzMkhnUbXrS/9RFXM4bHb0sMGcVejSFsFdWaNkWMij0Ch/+GhMVviACReIU6K6r2/czyLIXxh1PVlELqsYZjAlwIHzQQSAZ7zce4Pr3GKkdpkCL1TVC4M/sew=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:4d938dd5-9fcd-4b39-b71e-044110d9d59c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:364b77b,CLOUDID:196d6d95-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 250e29d883bb11ee86758d4a7c00f3a0-20231115
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 233856257; Wed, 15 Nov 2023 06:30:29 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 15 Nov 2023 21:10:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 15 Nov 2023 21:10:26 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
	<naomi.chu@mediatek.com>, <stable@vger.kernel.org>
Subject: [PATCH v2] ufs: core: clear cmd if abort success in mcq mode
Date: Wed, 15 Nov 2023 21:10:24 +0800
Message-ID: <20231115131024.15829-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.243600-8.000000
X-TMASE-MatchedRID: eim6YYjnci0MQLXc2MGSbO7KTDtx8CggCt59Uh3p/NWsafcFLFlU1OhA
	oL09ZB7k7Oz5SO8AjrR6fWcwarN2OU2VnXMRzIBjMJoQm3jo+mk7pfSjRsD2Og2Y8xyy93kWcam
	vz988laLcGqNrS/CXVwG2ORx9EyapQq2SOVgDzZ2e7UdJp0QINX0tCKdnhB58x1VpQxNE5Sol1b
	QZsjoiro6HM5rqDwqtwhyVdat1JJ4YTSC8+eLAsZoa6WdfBq3sGScriA4mVLNnqMsc5IhUrQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.243600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: FCB1E0C5A67EF3923329F8C1EEAB1D739410A2AA11A224C8A64FF2DC537955D42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_053214_899468_0F80E402 
X-CRM114-Status: GOOD (  10.16  )
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

In mcq mode, if cmd is pending in device and abort success, response
will not return from device. So we need clear this cmd right now,
else command timeout happen and next time use same tag will have
warning. WARN_ON(lrbp->cmd).

Below is error log:
<3>[ 2277.447611][T21376] ufshcd-mtk 112b0000.ufshci: ufshcd_try_to_abort_task: cmd pending in the device. tag = 7
<3>[ 2277.476954][T21376] ufshcd-mtk 112b0000.ufshci: Aborting tag 7 / CDB 0x2a succeeded
<6>[ 2307.551263][T30974] ufshcd-mtk 112b0000.ufshci: ufshcd_abort: Device abort task at tag 7
<4>[ 2307.623264][  T327] WARNING: CPU: 5 PID: 327 at source/drivers/ufs/core/ufshcd.c:3021 ufshcd_queuecommand+0x66c/0xe34

Fixes: ab248643d3d6 ("scsi: ufs: core: Add error handling for MCQ mode")
Cc: stable@vger.kernel.org
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 8b1031fb0a44..6aa6f79d7841 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6444,11 +6444,24 @@ static bool ufshcd_abort_one(struct request *rq, void *priv)
 	struct scsi_device *sdev = cmd->device;
 	struct Scsi_Host *shost = sdev->host;
 	struct ufs_hba *hba = shost_priv(shost);
+	struct ufshcd_lrb *lrbp = &hba->lrb[tag];
+	struct ufs_hw_queue *hwq;
+	unsigned long flags;
 
 	*ret = ufshcd_try_to_abort_task(hba, tag);
 	dev_err(hba->dev, "Aborting tag %d / CDB %#02x %s\n", tag,
 		hba->lrb[tag].cmd ? hba->lrb[tag].cmd->cmnd[0] : -1,
 		*ret ? "failed" : "succeeded");
+
+	/* Release cmd in mcq mode if abort success */
+	if (is_mcq_enabled(hba) && (*ret == 0)) {
+		hwq = ufshcd_mcq_req_to_hwq(hba, scsi_cmd_to_rq(lrbp->cmd));
+		spin_lock_irqsave(&hwq->cq_lock, flags);
+		if (ufshcd_cmd_inflight(lrbp->cmd))
+			ufshcd_release_scsi_cmd(hba, lrbp);
+		spin_unlock_irqrestore(&hwq->cq_lock, flags);
+	}
+
 	return *ret == 0;
 }
 
-- 
2.18.0


