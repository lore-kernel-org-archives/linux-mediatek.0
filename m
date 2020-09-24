Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1BAC4346E
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 04:13:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FDE4238A1
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 04:13:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DX+HOAkM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Tvu1auoU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FDE4238A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IwBIYoGq0tIFeBKP6ySJLKNO9IZktEiLz5R/iJ9nmAs=; b=DX+HOAkM29zvd/Jpu8i30JLhoz
	m81n/0SVoGnbC1WCOgiW+BfSP8jagEahY5dTwegYNj9MuRogP7ELwPvb5qNDNm3CoM+DMJB3opNMH
	YiM1vJCcu+CMsp0lHEETRAmngZSiOU2MdMLkp4MFhRw13DMQQpCOd1hUwk77iMXtuyFy9196cNMZZ
	cc/Q9RUXJ85CHNUF+Dad/NfxK4QciZlU34b5RVIO+YjWDPOZk0ZRGtTCwF81ky5KPeB0PVSUVluQk
	Q3EK28jHwdFkuVBbc16WDo5P1NX6tyKIvZl90D2D9bnYxi1EvxrTaQBVYt3vCyDDffDpIbILt9b5P
	9cNwZv7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLIcn-00070f-7J; Thu, 24 Sep 2020 04:12:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLIcb-0006xJ-3y; Thu, 24 Sep 2020 04:12:42 +0000
X-UUID: 8b664fda1aec42059856f46b262eeafe-20200923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=jERA97XeyBTxK9uRT3LHVudEGcqfyQoFzaVX3v1wRNo=; 
 b=Tvu1auoUk0g9FYSf6jotBbJKeVSRyb9lnVgpl3AH/erIGOKbm45KiBMwLXr9UAJG1RAcGQcY2UcVUx57ozW/RymS+D+RkCmOGUyNWtgWh7Ry85R7gTw4kmqM9ufzf4MW5tVFlTFSTC3iib9BseEagCxFpABmdcsVceRpeF/d05A=;
X-UUID: 8b664fda1aec42059856f46b262eeafe-20200923
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 624694231; Wed, 23 Sep 2020 20:12:37 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Sep 2020 21:05:15 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 12:05:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Sep 2020 12:05:13 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, 
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov
 <andreyknvl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 3/6] kasan: print timer and workqueue stack
Date: Thu, 24 Sep 2020 12:05:13 +0800
Message-ID: <20200924040513.31051-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_001241_366429_4E8BF7C9 
X-CRM114-Status: GOOD (  13.71  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The aux_stack[2] is reused to record the call_rcu() call stack,
timer init call stack, and enqueuing work call stacks. So that
we need to change the auxiliary stack title for common title,
print them in KASAN report.

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Suggested-by: Marco Elver <elver@google.com>
Acked-by: Marco Elver <elver@google.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Reviewed-by: Andrey Konovalov <andreyknvl@google.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Alexander Potapenko <glider@google.com>
---

v2:
- Thanks for Marco suggestion.
- We modify aux stack title name in KASAN report
  in order to print call_rcu()/timer/workqueue stack.

---
 mm/kasan/report.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index 4f49fa6cd1aa..886809d0a8dd 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -183,12 +183,12 @@ static void describe_object(struct kmem_cache *cache, void *object,
 
 #ifdef CONFIG_KASAN_GENERIC
 		if (alloc_info->aux_stack[0]) {
-			pr_err("Last call_rcu():\n");
+			pr_err("Last potentially related work creation:\n");
 			print_stack(alloc_info->aux_stack[0]);
 			pr_err("\n");
 		}
 		if (alloc_info->aux_stack[1]) {
-			pr_err("Second to last call_rcu():\n");
+			pr_err("Second to last potentially related work creation:\n");
 			print_stack(alloc_info->aux_stack[1]);
 			pr_err("\n");
 		}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
