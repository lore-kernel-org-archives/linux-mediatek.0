Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC42C25B70
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Oct 2023 08:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VcyzQ2NeYWUVU838NXIO17JVGw61EnQMWdi7e/381zA=; b=bKij2qEEnTmf5J7De0gFLwg26g
	gW2vGydGwTGGEX0pbrj90bn5XDJm5l22wr3g9JJYOvXJGkoeVC5j3Pl6uuggzrxO9kQhetzh2VCsY
	L9QoQtWw77+qEHEiFdt5DlQzK6HoJesE17EhEjMCr5AKSDe9FAEA+2K77Wcm9OS5YJaQfkhelM2m3
	AqbwrrNdTKzXqAEwPLVL+uOqM6z1XlTbbK4cxP2nftO5OaASFa50Ir91KcQuzsHn5cq80y0soIrVE
	X+eYCaAQTMFdiScPx6MODrUJ5R0BODYGYky6KFN14dpSaDHbwHpk+QghTLyXTXGx1nTZpYQ68Ajae
	dnA80Mww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwIRR-00FxY0-2a;
	Fri, 27 Oct 2023 08:43:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwIRP-00FxXC-2p
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Oct 2023 08:43:41 +0000
X-UUID: ea7bf16274a411ee9b7791016c24628a-20231027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VcyzQ2NeYWUVU838NXIO17JVGw61EnQMWdi7e/381zA=;
	b=PlSNIqIyH+uOTmuhN3OfBEjheZtn5ANtrQOjCymKJj4pE3dtzBeAn3PhCmg9YgiTdYjIJYNmJsyy7fikQLilVziVAnKGSBJ7E+uIqUI/M37wfolOu5JjUtgbFudxH9mJ7hE2i+gY8CNTNcsg97GOZBiRvtXFJLSngtxBijSNUdM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:07b5fc0a-5b45-406b-938b-9079a6a41283,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:f434f771-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: ea7bf16274a411ee9b7791016c24628a-20231027
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1398258287; Fri, 27 Oct 2023 01:43:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Oct 2023 16:43:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Oct 2023 16:43:32 +0800
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
Subject: [PATCH v1] ufs: core: fix racing issue between ufshcd_mcq_abort and ISR
Date: Fri, 27 Oct 2023 16:43:29 +0800
Message-ID: <20231027084329.4067-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.853700-8.000000
X-TMASE-MatchedRID: sBypFcuOxUYMQLXc2MGSbBuZoNKc6pl+WPJn4UmMuVJ0cpXNtrVD/RFG
	4EGBR4d4nFnqwstPnWZOTRDyBol0uXAvdl/gU+kWydRN/Yyg4pid2Wz0X3OaLd9RlPzeVuQQ8rM
	P48ANS13i8zVgXoAltsIJ+4gwXrEtwrbXMGDYqV94uFxKD13nMe+qZbkhrKAvDcHRGkNOD0huqx
	mYCr02+2o6x355ikkS
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.853700-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 6956C7A927BB23CF71FBC2478C5F13C21FD7890C25E3F5B2D56A548C830530692000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_014339_919482_34CC9F47 
X-CRM114-Status: UNSURE (   9.04  )
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


