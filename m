Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC31DC07548
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 07:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hIaTDgDzLIscHf5CKI3TUjE0bb/R8Q6i6db1afgHSuQ=; b=GUvWpCozKnMohH+J5rk18h2qjq
	tT8T6RVu5NcbimC8V2Dw5ANNlovQ0USM8JZs5O0mg775tw7Hl1N7DQxBga3CXISveNPFrd7PcdNZd
	8sIFxV+O5boBu3effv7t+UXiHc9BxtmZryq0Te/JdWUX9l9wjjnoDPQDGtLzebNvkWTvyP4QAgMNg
	z1og+ebokAm3a6LmdaWn+OdS5MHuTrE0JVS3YQrQk5kWMUoRe73cOW7wqhq0MzYwogFT1uO/K5ADD
	HtS4eLD1UzQ53aQIv5ibnpumb9PT3ZbdZ6ICZv0YLtpJciDh8kfGVDbAR56rV+mB87znwN6uoFTNL
	HEvx6UqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3A7C-0006qw-2P;
	Wed, 15 Nov 2023 07:15:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3A7A-0006qJ-2W
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 07:15:10 +0000
X-UUID: b1ffa2fc838611ee9b7791016c24628a-20231115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=hIaTDgDzLIscHf5CKI3TUjE0bb/R8Q6i6db1afgHSuQ=;
	b=jfBaPhGkL2sQQ6PjYrDY34FjNfsWp1/5LSRsEkUtC4OxCjmwNvU+wW9bXFHJKHgGz3KZrY3jDDrkPAO4j4vu+mBdWiA+MD7+DXCSIjXORohLnwCfmpJgqyEtejCe+19kQ9O4dClOPja3gqBtg+q6rA04cElLI7Z2omdYOPEYP1Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:b73355b9-17e9-4f2a-916d-b519a757d651,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:364b77b,CLOUDID:fbd91460-c89d-4129-91cb-8ebfae4653fc,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: b1ffa2fc838611ee9b7791016c24628a-20231115
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1565792526; Wed, 15 Nov 2023 00:15:03 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 15 Nov 2023 15:14:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 15 Nov 2023 15:14:49 +0800
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
	<naomi.chu@mediatek.com>, <stable@vger.kernel.org>
Subject: [PATCH v1] ufs: core: clear cmd if abort success in mcq mode
Date: Wed, 15 Nov 2023 15:14:46 +0800
Message-ID: <20231115071446.23912-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--8.173600-8.000000
X-TMASE-MatchedRID: NeCdpr+F3d4MQLXc2MGSbO7KTDtx8CggCt59Uh3p/NWsafcFLFlU1OhA
	oL09ZB7k7Oz5SO8AjrR6fWcwarN2OU2VnXMRzIBjMJoQm3jo+mk7pfSjRsD2Og2Y8xyy93kWcam
	vz988laLcGqNrS/CXVwG2ORx9EyapQq2SOVgDzZ2eAiCmPx4NwJuJ+Pb8n/VxdMrO7yc0I/wqtq
	5d3cxkNf1GGMILmA8BR0fN/zghq0cQZQGdbkyzRAyH5HTyOLIFidciRFVG7v7AvpLE+mvX8g==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--8.173600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2F4036E4201BD7F8BC5623DF16C952CC2C84C88063EA7D5054272B455441BA7C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_231508_853219_AF12B235 
X-CRM114-Status: UNSURE (   9.03  )
X-CRM114-Notice: Please train this message.
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
 drivers/ufs/core/ufshcd.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 8b1031fb0a44..e559593e6979 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6449,6 +6449,16 @@ static bool ufshcd_abort_one(struct request *rq, void *priv)
 	dev_err(hba->dev, "Aborting tag %d / CDB %#02x %s\n", tag,
 		hba->lrb[tag].cmd ? hba->lrb[tag].cmd->cmnd[0] : -1,
 		*ret ? "failed" : "succeeded");
+
+	/* Release cmd in mcq mode if abort success */
+	if (is_mcq_enabled(hba) && (*ret == 0)) {
+		hwq = ufshcd_mcq_req_to_hwq(hba, scsi_cmd_to_rq(hba->lrb[tag].cmd));
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


