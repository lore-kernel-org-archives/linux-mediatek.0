Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DADFCC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 08:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sV0HmmZUiWC6Xd0DtqakbNIl0Npt80+JI0PP8g3KMFo=; b=H1wSnN5sNjwqzzVGPGJOEImDaH
	WfHqSNUGrMdaZ2BHSiur6wjp6MhSjLZJRDW97AhM05oFTeFdpaDXtZB7Yr75o8ul00kTiPgsbKfPS
	bK9vdMpd0UMxwOU6kAoRpQHCqdwtZ4h/3Hqqo1oHfYV/enC1/hx2e3W/+ZhLYEYUV94jrcCsqWVCd
	2BsUG+eG+vGopWbndkZKBEBybiRVf+p8/c5ar+MpcxXNP8E0cPhizp+gtwANtAI83Gynqe3xqMtHh
	D1nonWAUWlY75wxoX1ae3Wephx3pHnvboNy0OuLO/8vGxGNzxhEom1lO7wZhkwJUn6AaN09G+bif5
	BnLsQWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4HNP-00GeP8-2r;
	Wed, 31 May 2023 08:40:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4HNN-00GeNy-0J;
	Wed, 31 May 2023 08:40:14 +0000
X-UUID: bdb54556ff8e11ed912e1518a6540028-20230531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sV0HmmZUiWC6Xd0DtqakbNIl0Npt80+JI0PP8g3KMFo=;
	b=iCaUoCRyUVHWXUhOxlQM4PBnPKoZyUrb21NDECmyzdmBa8mzcTRwn2csd1WCFuM5Qq5rnZMXkjb1Jx+ZeDvWODkmjNdf4rczpdIs0U06nmw2cdDHrDa6e2simJj0c6rfQhLXf5PsEYWGGOPvhNm2dMQePo1FjtbAt/tn8wXYbDw=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:7ed0a56b-e300-4145-b91f-a01434cd52a1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.25,REQID:7ed0a56b-e300-4145-b91f-a01434cd52a1,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:d5b0ae3,CLOUDID:1fb2ec3c-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:230531163930DY68GEE0,BulkQuantity:1,Recheck:0,SF:29|28|16|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI
	:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: bdb54556ff8e11ed912e1518a6540028-20230531
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ed.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 621431646; Wed, 31 May 2023 01:40:05 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 May 2023 16:39:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 May 2023 16:39:28 +0800
From: Ed Tsai <ed.tsai@mediatek.com>
To: <axboe@kernel.dk>
CC: <kbusch@kernel.org>, <liusong@linux.alibaba.com>,
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<wsd_upstream@mediatek.com>, <peter.wang@mediatek.com>,
	<stanley.chu@mediatek.com>, <powen.kao@mediatek.com>,
	<alice.chao@mediatek.com>, <naomi.chu@mediatek.com>, Ed Tsai
	<ed.tsai@mediatek.com>
Subject: [PATCH v2] blk-mq: check on cpu id when there is only one ctx mapping
Date: Wed, 31 May 2023 16:38:29 +0800
Message-ID: <20230531083828.8009-2-ed.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230531083828.8009-1-ed.tsai@mediatek.com>
References: <20230531083828.8009-1-ed.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_014013_141504_1FFBE580 
X-CRM114-Status: GOOD (  12.91  )
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
Change-Id: I4f95d7538532f72dcb20dacfdd639c97951c2729
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


