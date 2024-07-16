Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33A2C3DA4B
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jul 2024 01:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ecczJKhQmZrvgk6AQTQATT11lmeJ+vbOQtxp2jxvHEM=; b=EM14VvZWgXdOi7ZwdLCvmU9G8t
	2nvD4fMfe8pvGsLe4c+6eR9T1ATDrJRMFjeuWuhFqrTy9b0ZkIg+BJDyFoVZ27dfk6yBSZwHOQG65
	fmfhi5ZeegVE0xSU0uyeFT25oq0WErk0nMZX4VI4ThcmCEqpVGrI+TlKwwr7lDYWpiTX1X4udNkhN
	lQmhAD4vbaoSLeUg3FJ8lrO/JZvFlqy6PJxN4ZD/DK4BE9JmUn2T1gUCVKtUc5hDPw2WL4sjl7zfQ
	AIO0isUIYecq1Bhc/2CyG46JFQWahAbode5/9qtrXaGLPpFci+Dx++fH52LNYWo2LJXF49CHhokzJ
	0CtxISyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTX8A-00000008yq9-2ohp;
	Tue, 16 Jul 2024 01:37:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTX87-00000008ypV-3m9i;
	Tue, 16 Jul 2024 01:37:25 +0000
X-UUID: ef77e8ea431311efa6c87f6b4542ff6b-20240715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ecczJKhQmZrvgk6AQTQATT11lmeJ+vbOQtxp2jxvHEM=;
	b=nEO5P307u69mZl6rmZ1EyoHzC45LoCh5rewn0HUlKAopIJK9jTgnLHGMrfAu+gPoDzw8ODlP2K9NnqoaEl8HR/ImIrSe67KQLVH0F7W9+t2IE1F0nnlGZCIw7RcgNU8ts9dP89Osgl1GoBI7ttGcKnmW+q1h0jxrpbCB6rdyLIc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:a7a601c0-43e1-4e88-ae01-2d560b120523,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:ba885a6,CLOUDID:1cc57e0d-46b0-425a-97d3-4623fe284021,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ef77e8ea431311efa6c87f6b4542ff6b-20240715
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <mengqi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1300138473; Mon, 15 Jul 2024 18:37:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 16 Jul 2024 09:37:14 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 16 Jul 2024 09:37:14 +0800
From: Mengqi Zhang <mengqi.zhang@mediatek.com>
To: <ulf.hansson@linaro.org>, <chaotian.jing@mediatek.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Mengqi
 Zhang <mengqi.zhang@mediatek.com>, <stable@vger.stable.com>
Subject: [v1, 1/1] mmc: mtk-sd: receive cmd8 data when hs400 tuning fail
Date: Tue, 16 Jul 2024 09:37:04 +0800
Message-ID: <20240716013704.10578-1-mengqi.zhang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_183723_968277_56966DBC 
X-CRM114-Status: GOOD (  11.40  )
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

When we use cmd8 as the tuning command in hs400 mode, the command
response sent back by some eMMC devices cannot be correctly sampled
by MTK eMMC controller at some weak sample timing. In this case,
command timeout error may occur. So we must receive the following
data to make sure the next cmd8 send correctly.

Signed-off-by: Mengqi Zhang <mengqi.zhang@mediatek.com>
Fixes: c4ac38c6539b ("mmc: mtk-sd: Add HS400 online tuning support")
Cc: stable@vger.stable.com
---
 drivers/mmc/host/mtk-sd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index a94835b8ab93..e386f78e3267 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1230,7 +1230,7 @@ static bool msdc_cmd_done(struct msdc_host *host, int events,
 	}
 
 	if (!sbc_error && !(events & MSDC_INT_CMDRDY)) {
-		if (events & MSDC_INT_CMDTMO ||
+		if ((events & MSDC_INT_CMDTMO && !host->hs400_tuning) ||
 		    (!mmc_op_tuning(cmd->opcode) && !host->hs400_tuning))
 			/*
 			 * should not clear fifo/interrupt as the tune data
@@ -1323,9 +1323,9 @@ static void msdc_start_command(struct msdc_host *host,
 static void msdc_cmd_next(struct msdc_host *host,
 		struct mmc_request *mrq, struct mmc_command *cmd)
 {
-	if ((cmd->error &&
-	    !(cmd->error == -EILSEQ &&
-	      (mmc_op_tuning(cmd->opcode) || host->hs400_tuning))) ||
+	if ((cmd->error && !host->hs400_tuning &&
+	     !(cmd->error == -EILSEQ &&
+	     mmc_op_tuning(cmd->opcode))) ||
 	    (mrq->sbc && mrq->sbc->error))
 		msdc_request_done(host, mrq);
 	else if (cmd == mrq->sbc)
-- 
2.25.1


