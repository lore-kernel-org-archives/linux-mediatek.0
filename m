Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64064C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Nov 2023 07:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CagbjiyHuObTfB2ebUdZvhvKU/p7R4uaVW0eJiXNBeQ=; b=C+X91WF0Jf2QJCTWbyU+fiKbKl
	DwYB23nB+gTVlQ1wGjpznWjMjZRRuo8lnk4bi7saz5RgnaCr3W433ruo6RF5t+BG5ZTcp2CJ9sCZ0
	UBwIiJeRvmcsTBdJKdzfJkepdXLbhfDHtuk7mTklg+npavEZo9PobbFxvi+JsX9zb70rACNctATSO
	CrMP1OHp7pAfS+kZ/70oRDustODLDkVIrmdZr80rppL/zDIakkTSVdhTTLm3MAJAudBQuvP2dHOK1
	pzGi9voVsC1VLlRYhK3S79+P8+Ccfu3I6VxY99EAU7KZnlm4jC4y0qpvfVWOmF5R2rOzZ36TPn23a
	jHLtBRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qzuOu-00G22t-1J;
	Mon, 06 Nov 2023 07:52:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qzuOs-00G22X-0R
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Nov 2023 07:51:59 +0000
X-UUID: 5955afde7c7911ee9b7791016c24628a-20231106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=CagbjiyHuObTfB2ebUdZvhvKU/p7R4uaVW0eJiXNBeQ=;
	b=hbWumjcQkpH1hm3QlKTre/PhvCbLGwZkdFHqq4ccuHgaIeDwKiXb1JNv6JQkh2CIKFfGIOnKfJIRqh+FzLCw6Gr0J88C9YFwkREvu7/0ww5sgFdiKNzKMMeDCPU31FWQEK4iRZUpqaSjQrQ+nsHqH/qg803HusddD691xvcshvg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:22aaa93d-9c73-4d34-8531-8183ad6cec69,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:364b77b,CLOUDID:e28f32fc-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 5955afde7c7911ee9b7791016c24628a-20231106
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1086870586; Mon, 06 Nov 2023 00:51:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 6 Nov 2023 15:51:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 6 Nov 2023 15:51:19 +0800
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
Subject: [PATCH v2] ufs: core: fix racing issue between ufshcd_mcq_abort and ISR
Date: Mon, 6 Nov 2023 15:51:17 +0800
Message-ID: <20231106075117.8995-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.853700-8.000000
X-TMASE-MatchedRID: lR9wedxBitsMQLXc2MGSbBuZoNKc6pl+WPJn4UmMuVJ0cpXNtrVD/RFG
	4EGBR4d4nFnqwstPnWZOTRDyBol0uXAvdl/gU+kWydRN/Yyg4pid2Wz0X3OaLd9RlPzeVuQQ8rM
	P48ANS13i8zVgXoAltsIJ+4gwXrEtIAcCikR3vq8qDZkmyvidBcJ/Nl2qTLefGKqfq7OIc/OSiu
	JY0MlQAWn31fAH18h0
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.853700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: F0D8E375B0487D897EC3F5022A612D7ED0F588FD4CEC84055C5E5F7CC37AF0CF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231105_235158_183871_036FFF24 
X-CRM114-Status: UNSURE (   8.91  )
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

If command timeout happen and cq complete irq raise at the same time,
ufshcd_mcq_abort null the lprb->cmd and NULL poiner KE in ISR.
Below is error log.

ufshcd_abort: Device abort task at tag 18
Unable to handle kernel NULL pointer dereference at virtual address
0000000000000108
pc : [0xffffffe27ef867ac] scsi_dma_unmap+0xc/0x44
lr : [0xffffffe27f1b898c] ufshcd_release_scsi_cmd+0x24/0x114

Fixes: f1304d442077 ("scsi: ufs: mcq: Added ufshcd_mcq_abort()")
Cc: stable@vger.kernel.org
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufs-mcq.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 2ba8ec254dce..6ea96406f2bf 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -630,6 +630,7 @@ int ufshcd_mcq_abort(struct scsi_cmnd *cmd)
 	int tag = scsi_cmd_to_rq(cmd)->tag;
 	struct ufshcd_lrb *lrbp = &hba->lrb[tag];
 	struct ufs_hw_queue *hwq;
+	unsigned long flags;
 	int err = FAILED;
 
 	if (!ufshcd_cmd_inflight(lrbp->cmd)) {
@@ -670,8 +671,10 @@ int ufshcd_mcq_abort(struct scsi_cmnd *cmd)
 	}
 
 	err = SUCCESS;
+	spin_lock_irqsave(&hwq->cq_lock, flags);
 	if (ufshcd_cmd_inflight(lrbp->cmd))
 		ufshcd_release_scsi_cmd(hba, lrbp);
+	spin_unlock_irqrestore(&hwq->cq_lock, flags);
 
 out:
 	return err;
-- 
2.18.0


