Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA1DC3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 09:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gwqM7M4CejLnrb6PXGa1wK3vz+TNRJWDRKuQxwjYyBM=; b=nWAxWCNfy26n4Wc0OGngXJy8vV
	Fw0GqkZ3JnZUuyR8LfCUkQB2IvhRLhi0xyWfxX5B6ka6peycBc4HlPY9bvIM+bQTY2U7Ak4lCvXYU
	CAGIDb37guW3Ol+2+H0vxZ9/Wy/7y+7K866J4ryrMUfqlPTgcROAN0TSdhiU0ZkKFogKcKI08Qoqn
	rLyHO6P7CTLk9pBClgy7nTKpdDO2wUu3kdwCxGa1LDJHxAe7+DoTXGUcduF4eqweK9V+wn7SOtMRa
	yvKlKSuXPkm5uIecZF20oZjXrHQjI5fwlpwtoqMzsjOD6BsfXDYQ69xCohQGYUVI14FJrt1LQFXWf
	r5r8g5vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRTVK-0000000A36B-1QRA;
	Wed, 10 Jul 2024 09:20:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRTVI-0000000A35c-10Zy;
	Wed, 10 Jul 2024 09:20:49 +0000
X-UUID: aec7d15e3e9d11efa6c87f6b4542ff6b-20240710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=gwqM7M4CejLnrb6PXGa1wK3vz+TNRJWDRKuQxwjYyBM=;
	b=O/cGqZprTM4DrwyH+t66lCfKfaN7DGQhoz6Bq+iW93A9QHfNoJw+GyQGOzTxK33OHV5st2TxMm0hfiWAcIAx7wwOJF5RCImiEg65uODG8mA1LHDAr18aQBF4opE5msePrliJjOAuUS2Wx6eYNjQLH7KSNIPaeIr7WI0iSRzrg4k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:0b3f7d47-66fc-4398-80a7-d5093f026577,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:037f2145-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: aec7d15e3e9d11efa6c87f6b4542ff6b-20240710
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <tze-nan.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1336655215; Wed, 10 Jul 2024 02:20:43 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 10 Jul 2024 02:20:06 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 10 Jul 2024 17:20:06 +0800
From: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
To: <rostedt@goodmis.org>
CC: <cheng-jui.wang@mediatek.com>, <bobule.chang@mediatek.com>,
	<eric-yk.wu@mediatek.com>, <wsd_upstream@mediatek.com>, Tze-nan Wu
	<Tze-nan.Wu@mediatek.com>, Mathieu Desnoyers
	<mathieu.desnoyers@efficios.com>, <linux-kernel@vger.kernel.org>,
	<linux-trace-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] tracing: Fix overflow in get_free_elt()
Date: Wed, 10 Jul 2024 17:19:05 +0800
Message-ID: <20240710091908.7030-1-Tze-nan.Wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_022048_290692_7DAE2B91 
X-CRM114-Status: GOOD (  12.62  )
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

"tracing_map->next_elt" in get_free_elt() is at risk of overflowing.

Once it overflows, new elements can still be inserted into the tracing_map
even though the maximum number of elements (`max_elts`) has been reached.
Continuing to insert elements after the overflow could result in the
tracing_map containing "tracing_map->max_size" elements, leaving no empty
entries.
If any attempt is made to insert an element into a full tracing_map using
`__tracing_map_insert()`, it will cause an infinite loop with preemption
disabled, leading to a CPU hang problem.

Fix this by preventing any further increments to "tracing_map->next_elt"
once it reaches "tracing_map->max_elt".

Co-developed-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
Signed-off-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
---
 kernel/trace/tracing_map.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/tracing_map.c b/kernel/trace/tracing_map.c
index a4dcf0f24352..3a56e7c8aa4f 100644
--- a/kernel/trace/tracing_map.c
+++ b/kernel/trace/tracing_map.c
@@ -454,7 +454,7 @@ static struct tracing_map_elt *get_free_elt(struct tracing_map *map)
 	struct tracing_map_elt *elt = NULL;
 	int idx;
 
-	idx = atomic_inc_return(&map->next_elt);
+	idx = atomic_fetch_add_unless(&map->next_elt, 1, map->max_elts);
 	if (idx < map->max_elts) {
 		elt = *(TRACING_MAP_ELT(map->elts, idx));
 		if (map->ops && map->ops->elt_init)
@@ -699,7 +699,7 @@ void tracing_map_clear(struct tracing_map *map)
 {
 	unsigned int i;
 
-	atomic_set(&map->next_elt, -1);
+	atomic_set(&map->next_elt, 0);
 	atomic64_set(&map->hits, 0);
 	atomic64_set(&map->drops, 0);
 
@@ -783,7 +783,7 @@ struct tracing_map *tracing_map_create(unsigned int map_bits,
 
 	map->map_bits = map_bits;
 	map->max_elts = (1 << map_bits);
-	atomic_set(&map->next_elt, -1);
+	atomic_set(&map->next_elt, 0);
 
 	map->map_size = (1 << (map_bits + 1));
 	map->ops = ops;
-- 
2.18.0


