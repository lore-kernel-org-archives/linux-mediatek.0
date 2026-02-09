Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A68DE81BAD
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Feb 2026 12:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uYHdjwe6Z2tYVFm2NU+tRR4i/B4PB/vlm+8kwLkkP6w=; b=J3Wqs4xJku/IR8om/Aadwu4vOC
	XmqtYnS5VaVRwkwZTWGooflYOzhnZ7IrTOWVLzkZflEwJvqUDUcGK99v/zXWnv6HxKq75l7Kmnnel
	hNsaunXErwM6wCb16qOG6ARYljZ+x2T7zsaPKX8sm6srRxaEfDofo6dhCKUKSn+CsL+lNYcHZcZOM
	rTzsbT2FVRhGXEly7An/oR50ktSnaPeheBEs1KyW3YeTU0PcpeWFnSlmySCI8KYGvIDYiTKL3TNb8
	GJji6pHyNOjG8MMMkNAPTb35Mg5rBToHSp+pmQlviEqPLZ4deozY9tMvpl5hmsG9KXeQDBToz1Xfh
	5L5ATM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQGP-0000000FMFY-3Cc1;
	Mon, 09 Feb 2026 12:21:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpQGM-0000000FMFB-3rmW
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Feb 2026 12:21:12 +0000
X-UUID: ce1182e405b111f1ad39f32c34db0b1c-20260209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=uYHdjwe6Z2tYVFm2NU+tRR4i/B4PB/vlm+8kwLkkP6w=;
	b=rnVOYM7jZvQe+kKaQj/i08fAUZZVCCHVPwgbkyxFPjx1fx6dsihpPG4NwJwv8dynJebDQgMzTkwpyLnuc8ToeJCfyYyHsd1QyJI5WPBty0s00O2xnRf1rUVgoSQ2K9680LLyc57zLKa2UIuFXNsv3KFyPDbPVYuV3yMA4NQUkMM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:9eb22e8e-7729-4fb5-b242-1dad01626168,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:cbe2185b-a957-4259-bcca-d3af718d7034,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|123|836|888|898,TC:-5,Content:0|
	15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ce1182e405b111f1ad39f32c34db0b1c-20260209
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1302769787; Mon, 09 Feb 2026 05:21:04 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 9 Feb 2026 20:21:03 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 9 Feb 2026 20:21:03 +0800
From: <peter.wang@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@sandisk.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <tun-yu.yu@mediatek.com>,
	<eddie.huang@mediatek.com>, <naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>,
	<bvanassche@acm.org>
Subject: [PATCH v1] ufs: core: support UFS 4.1 CQ entry tag
Date: Mon, 9 Feb 2026 20:20:37 +0800
Message-ID: <20260209122101.1529379-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_042110_991853_B2E1C574 
X-CRM114-Status: UNSURE (   9.96  )
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

The UFS 4.1 specification introduces a new completion queue(CQ)
entry format, allowing the tag to be obtained directly.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/ufs/core/ufs-mcq.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index ad0ada57959a..d8b5cf18a01c 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -273,13 +273,18 @@ void ufshcd_mcq_write_cqis(struct ufs_hba *hba, u32 val, int i)
 EXPORT_SYMBOL_GPL(ufshcd_mcq_write_cqis);
 
 /*
- * Current MCQ specification doesn't provide a Task Tag or its equivalent in
+ * UFS 4.0 MCQ specification doesn't provide a Task Tag or its equivalent in
  * the Completion Queue Entry. Find the Task Tag using an indirect method.
+ * UFS 4.1 and above can directly return the Task Tag in the Completion Queue
+ * Entry.
  */
 static int ufshcd_mcq_get_tag(struct ufs_hba *hba, struct cq_entry *cqe)
 {
 	u64 addr;
 
+	if (hba->ufs_version >= ufshci_version(4, 1))
+		return cqe->task_tag;
+
 	/* sizeof(struct utp_transfer_cmd_desc) must be a multiple of 128 */
 	BUILD_BUG_ON(sizeof(struct utp_transfer_cmd_desc) & GENMASK(6, 0));
 
-- 
2.45.2


