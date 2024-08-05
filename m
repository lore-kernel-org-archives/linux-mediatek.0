Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C910EC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Aug 2024 06:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KCCE+7BB5PHXZJjrX/rPFtOvm22mgzZ/W4Yze4U9Lr4=; b=wVg8a5xR1qTQ2P9gY0U6V4nfX/
	fq58EIJJEQy70eItpi2sX3vEpwOPcEzc19GgNEUKqBoDq65kdRFlUqsL+oYvbqffzqfv1e5L6mK3X
	xB8oY1ghGJSSYg9uVcr5RNL6a+CsEd35/WtPfOmfJoF6GzBE7sHUhgzbM/AZ5Qby32RWPN7ft7hqR
	a+gJc3JNWCLuBJVONWOXNbCNO4azdYayXcSmKeZv5RN1aYrXYZwx4SXcWSKPiqHTYjIrieE1fInU8
	Hep2gasaQgh5uOp3y7uvRGk6G0yLBU+xguYBqYSORP5sov6UdfhCwCKucS63tOArG0xVz4icORXSO
	0CMEO50g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saqnY-0000000Ekpc-3iQ3;
	Mon, 05 Aug 2024 06:02:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saqnW-0000000Ekol-0kXB
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Aug 2024 06:02:23 +0000
X-UUID: 44f53e7652f011efa6c87f6b4542ff6b-20240804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=KCCE+7BB5PHXZJjrX/rPFtOvm22mgzZ/W4Yze4U9Lr4=;
	b=PCJWrEZ+eirVfFlx/rQUoxdkZMYvYGaeGKBaWzTkw69yznHBzbQ05YXmUZzWoxyoW8hyA39h5s/ka+N25ohrm6B0sKvF4I2hk99edIsOiFXT7IGG20ZbN7PkX+mDPGTVWh6Zk6WCaDBv09mLzAAjKttE5hqNN8Wlq+6eksluj1A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:485e1972-1391-4b29-adf9-d7dee5189d3a,IP:0,U
	RL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:6dc6a47,CLOUDID:7978a672-cb85-40d0-97b5-772ada27139a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 44f53e7652f011efa6c87f6b4542ff6b-20240804
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <tze-nan.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1925145474; Sun, 04 Aug 2024 23:02:17 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 4 Aug 2024 23:01:44 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 5 Aug 2024 14:01:44 +0800
From: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
	<mhiramat@kernel.org>
CC: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	<linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <bobule.chang@mediatek.com>,
	<eric-yc.wu@mediatek.com>, <wsd_upstream@mediatek.com>, Tze-nan Wu
	<Tze-nan.Wu@mediatek.com>, Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
Subject: [PATCH RESEND] tracing: Fix overflow in get_free_elt()
Date: Mon, 5 Aug 2024 13:59:22 +0800
Message-ID: <20240805055922.6277-1-Tze-nan.Wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_230222_227369_C86AB426 
X-CRM114-Status: GOOD (  14.23  )
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
We have encountered this issue internally after enabling the
throttle_rss_stat feature provided by Perfetto in background for more than
two days, during which `rss_stat` tracepoint was invoked over 2^32 times.
After tracing_map->next_elt overflow, new elements can continue to be 
inserted to the tracing_map belong to `rss_stat`.
Then the CPU could hang inside the while dead loop in function
`__tracing_map_insert()` by calling it after the tracing_map left no empty
entry.

Call trace during hang:
  __tracing_map_insert()
  tracing_map_insert()
  event_hist_trigger()
  event_triggers_call()
  __event_trigger_test_discard()
  trace_event_buffer_commit()
  trace_event_raw_event_rss_stat()
  __traceiter_rss_stat()
  trace_rss_stat()
  mm_trace_rss_stat()
  inc_mm_counter()
  do_swap_page()

throttle_rss_stat is literally a synthetic event triggered by `rss_stat`
with condition:
 1. $echo "rss_stat_throttled unsigned int mm_id unsigned int curr int
    member long size" >> /sys/kernel/tracing/synthetic_events
 2. $echo
    'hist:keys=mm_id,member:bucket=size/0x80000:onchange($bucket).rss_stat_
    throttled(mm_id,curr,member,size)' >
    /sys/kernel/tracing/events/kmem/rss_stat/trigger

The hang issue could also be reproduced easily by calling a customize
trace event `myevent(u64 mycount)` for more than 2^32+(map_size-max_elts)
times during its histogram enabled with the key set to variable "mycount".
While we call `myevent` with different argument "mycount" everytime.

BTW, I added Cheng-jui to Co-developed because we have a lot of discussions
during debugging this.
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


