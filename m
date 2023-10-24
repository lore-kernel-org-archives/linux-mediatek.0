Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF3AC07545
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 08:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iN/cYNw0UBNU6pS7nhFH1FIimWvZP96iaW/lpJmIqTw=; b=lRh6R81Z2r2C32CPeyyZ0Am+4k
	4KvSroGLsoMbOG9t/VCdqtiJkozM41l9ZEzKbmknOVCzakOUFa3nqtn2v3rLlP2K1EOLi+aT0/q5+
	IubMJ9dhPzykMtyAgTClqKgQDp4ewFL9q+kZhvhdUrSVxYO1NUGb/m/kI/JI6voFMvX/Gzo8t7We0
	Y2QOszMk/k16+MeYhjHaVMZesxCuMro3qJhST5e+16iruts1xudj/eBxk6ZdXpw0gx/IFK71B2TyV
	I4+WmR07+eopePgMkuTNGgKO0GdxJo8/t+npB1YIr6Yb2tZp7TrHvdAO7BJHOh/yrIVnABw+UrF86
	z5eYzw8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvD1s-009DvR-0q;
	Tue, 24 Oct 2023 08:44:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvD1p-009DuV-1C;
	Tue, 24 Oct 2023 08:44:46 +0000
X-UUID: 91171b36724911ee86758d4a7c00f3a0-20231024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=iN/cYNw0UBNU6pS7nhFH1FIimWvZP96iaW/lpJmIqTw=;
	b=hb5ZPBvOHXRMszD2tulqM6eEWslsMET4yNvb50MwB1e6BgAQ8b56WhUveCOD23wgaUi5JVz5XqjFsAi3P7JFuW4VJAiSml0wl+YVaRzI4UX9JpHNXfB/pqspnD+rVtBdvy/epr8VhKMP4xRRN1/xI67so4y70QRs0BP5Io5mASI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:72b05418-3204-400b-b9a9-8ce688fcf2b6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:c87bb4fb-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 91171b36724911ee86758d4a7c00f3a0-20231024
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <alice.chao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 395156077; Tue, 24 Oct 2023 01:44:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 24 Oct 2023 16:44:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 24 Oct 2023 16:44:03 +0800
From: <alice.chao@mediatek.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, "James E.J. Bottomley"
	<jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <stanley.chu@mediatek.com>,
	<peter.wang@mediatek.com>, <powen.kao@mediatek.com>,
	<naomi.chu@mediatek.com>, <cc.chou@mediatek.com>, <tun-yu.yu@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <casper.li@mediatek.com>, Alice Chao
	<alice.chao@mediatek.com>, <linux-scsi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] core: ufs: fix racing issue between force complete and isr
Date: Tue, 24 Oct 2023 16:43:21 +0800
Message-ID: <20231024084324.12197-1-alice.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.717400-8.000000
X-TMASE-MatchedRID: 4PO3xRYykVLSny9D3D7cj0Zakoam9+aebd6rGhWOAwRNShtWKzkFv8bB
	l+mdYPNDSJ98p/k48isBtjkcfRMmqZH0YXYnbGozFEUknJ/kEl7dB/CxWTRRuzBqYATSOgWj78T
	SUWAmEuXDhdFgIBeVjG+CyFalGpOx8YHPyIbJBEDSU+hTwCSC7435hht3qJMTDFM6+OpJabFtlz
	Lk1e/pyNvWO5JXDjg6gITnGkK0NFNRskXKHhdfKpij9M86UwHhsKHfMTjCprzAgTvs8QFuaX7cG
	d19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.717400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4F8ECFD8968BA5811C9F2C3A81AE4EDBFB36B326E3EB9A5C89A185A3FA9E72622000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_014445_411465_13C5BBD8 
X-CRM114-Status: GOOD (  12.31  )
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

From: Alice Chao <alice.chao@mediatek.com>

While error handler force complete command (Thread A) and completion irq
raising (Thread B) of the same command, it may cause race condition.

Below is racing step (from 1 to 6):
	ufshcd_mcq_compl_pending_transfer (Thread A)
1	if (cmd && !test_bit(SCMD_STATE_COMPLETE, &cmd->state)) {
5		spin_lock_irqsave(&hwq->cq_lock, flags);	// wait lock release
		set_host_byte(cmd, DID_REQUEUE);
6		ufshcd_release_scsi_cmd(hba, lrbp);	// access null pointer
		scsi_done(cmd);
		spin_unlock_irqrestore(&hwq->cq_lock, flags);
	}

	ufshcd_mcq_poll_cqe_lock (Thread B)
2	spin_lock_irqsave(&hwq->cq_lock, flags);
	 ufshcd_mcq_poll_cqe_nolock()
	  ufshcd_compl_one_cqe()
3	   ufshcd_release_scsi_cmd()	// lrbp->cmd = NULL;
4	spin_unlock_irqrestore(&hwq->cq_lock, flags);

Signed-off-by: Alice Chao <alice.chao@mediatek.com>
---
 drivers/ufs/core/ufshcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 8382e8cfa414..ef6bd146a767 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5518,13 +5518,13 @@ static void ufshcd_mcq_compl_pending_transfer(struct ufs_hba *hba,
 			 * For those cmds of which the cqes are not present
 			 * in the cq, complete them explicitly.
 			 */
+			spin_lock_irqsave(&hwq->cq_lock, flags);
 			if (cmd && !test_bit(SCMD_STATE_COMPLETE, &cmd->state)) {
-				spin_lock_irqsave(&hwq->cq_lock, flags);
 				set_host_byte(cmd, DID_REQUEUE);
 				ufshcd_release_scsi_cmd(hba, lrbp);
 				scsi_done(cmd);
-				spin_unlock_irqrestore(&hwq->cq_lock, flags);
 			}
+			spin_unlock_irqrestore(&hwq->cq_lock, flags);
 		} else {
 			ufshcd_mcq_poll_cqe_lock(hba, hwq);
 		}
-- 
2.18.0


