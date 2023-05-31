Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB3AC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 08:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0nv3Rl9Ah0Yurqkil5EC4EA2Z4hlg1w19JmuTm7+APQ=; b=Y/+Lm5bBlVQoPSEOGKw+f3TDOa
	24ThEqVXUh6R/z3jRlgswaGAOMDSQ3NMhoQYKWH+ktPoKEpfJwhQUHxeFJJ8P01SEJ45o7nQfbULB
	qP0beb73ye9Tpultcq0nmMgvT8COjfnZzcjsF1/KogH0AuceCyGbxsx1ZyF01oY6UutLfarr+OC1q
	rQqSDTp8gzmbI/jxEvAsvsZ2ZN6BuzkZ8o32EtgDQOpcxLj1HSPsXMaDOrNzUTw0XCg5E5YWrn60F
	5f51iyN/WNqmHktft0xH+YnenpI60hr9R0m/CaQGElXwkKaUfw/JIPEOgaakQEhM02u5cp38lFYr8
	FL4beNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4HVv-00GiFm-1V;
	Wed, 31 May 2023 08:49:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4HVs-00GiEF-2a;
	Wed, 31 May 2023 08:49:02 +0000
X-UUID: fb60d644ff8f11ed912e1518a6540028-20230531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0nv3Rl9Ah0Yurqkil5EC4EA2Z4hlg1w19JmuTm7+APQ=;
	b=mtnsGzE7RinVue+XL2iMRZmrc+bigQKb/3ebA8d+pwbfbCGRagViSmJFStkCGqlPFmsLLj/DKvo8GcR//KFG33M28wuXenoySUKbzsFt9+saHi8/4yaqA17H55qutIJsXjRfIA4MlKlaU44aTScpjEGrHwXeS1NpxE5yRYjU5Rk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:b3a13bcf-a427-4597-9a22-ba7b0ad30bc0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:d6e2916d-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: fb60d644ff8f11ed912e1518a6540028-20230531
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1411374547; Wed, 31 May 2023 01:48:58 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 May 2023 16:38:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 May 2023 16:38:55 +0800
From: Ed Tsai <ed.tsai@mediatek.com>
To: <axboe@kernel.dk>
CC: <kbusch@kernel.org>, <liusong@linux.alibaba.com>,
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<wsd_upstream@mediatek.com>, <peter.wang@mediatek.com>,
	<stanley.chu@mediatek.com>, <powen.kao@mediatek.com>,
	<alice.chao@mediatek.com>, <naomi.chu@mediatek.com>, Ed Tsai
	<ed.tsai@mediatek.com>
Subject: blk-mq: check on cpu id when there is only one ctx mapping
Date: Wed, 31 May 2023 16:38:28 +0800
Message-ID: <20230531083828.8009-1-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_014900_866478_B3BE85CE 
X-CRM114-Status: GOOD (  12.51  )
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

commit f168420 ("blk-mq: don't redirect completion for hctx withs only
one ctx mapping") When nvme applies a 1:1 mapping of hctx and ctx, there
will be no remote request.

But for ufs, the submission and completion queues could be asymmetric.
(e.g. Multiple SQs share one CQ) Therefore, 1:1 mapping of hctx and
ctx won't complete request on the submission cpu. In this situation,
this nr_ctx check could violate the QUEUE_FLAG_SAME_FORCE, as a result,
check on cpu id when there is only one ctx mapping.

Signed-off-by: Ed Tsai <ed.tsai@mediatek.com>
Signed-off-by: Po-Wen Kao <powen.kao@mediatek.com>
---
 block/blk-mq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 41f7e2b500bd..ecc30ebe9483 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -1176,7 +1176,8 @@ bool blk_mq_complete_request_remote(struct request *rq)
 	 * or a polled request, always complete locally,
 	 * it's pointless to redirect the completion.
 	 */
-	if (rq->mq_hctx->nr_ctx == 1 ||
+	if ((rq->mq_hctx->nr_ctx == 1 &&
+	     rq->mq_ctx->cpu == raw_smp_processor_id()) ||
 		rq->cmd_flags & REQ_POLLED)
 		return false;
 
-- 
2.18.0


