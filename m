Return-Path: <SRS0=9GQg=CD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54970C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 01:59:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 230FB204EC
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2020 01:59:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tYUfpo+R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CkY8+fD9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 230FB204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PE9XR53h6nCuG7GUBrh0ZckS9cjUHb7fnm48KohHcEM=; b=tYUfpo+RB4I4rMGGl5dVq7HMko
	qK8bG/lxvN07Ms77OASVFac7WePHdLaAmId9aJOOwMyGGdhCer2NmROWP/x7yHTXVeH49XEfFubkE
	BFSig0LtGNvV1orAYbCz+oIOc+x/cLNGlW1WM023SW5kLUiTLTek5oLx2m2i2gEOzrER6XTG+GVXa
	gNqS2etP83DEoXPgFZHz4TokuM39ixP5YIEdjWfvwJsZWsnE1RV8T6iCflKBJ1wnN6TH35TwYPQlA
	zxNDzinOPJAevUIgjmHxSJjk2aTr12rLUTHU2YFUEGJ9MhLdfvIP8q3Wp0VNjxIDPYBZu/i151zVu
	kigldXgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAOF8-0003Hm-4k; Tue, 25 Aug 2020 01:59:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAOF3-0003G8-O9; Tue, 25 Aug 2020 01:59:18 +0000
X-UUID: 8cd626b3af0049d1b1f31b15ec3b9b34-20200824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=HDzXMXMz+Dzcg9DxfMTu2qwgwLYa3ujPve0aUqFM/KA=; 
 b=CkY8+fD91Y9Ppm4YktSKuklZvE9EhtNf0Jh+t/uJj4TSZUSbDZteRMrgYyy+ErGHI6Xh+Q7rpiF+caZO4Jua+9w4sDvDoFGfj6j2dP/iHHO+yZkIoTLkdQ8lhaHNFA3scyvTAULE32u8VT4kTR6WHiZGkAyCdOowtNAZ9kIUCnU=;
X-UUID: 8cd626b3af0049d1b1f31b15ec3b9b34-20200824
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 834529245; Mon, 24 Aug 2020 17:59:13 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 18:59:10 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Aug 2020 09:59:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 25 Aug 2020 09:59:04 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Marco Elver <elver@google.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 3/6] kasan: print timer and workqueue stack
Date: Tue, 25 Aug 2020 09:59:02 +0800
Message-ID: <20200825015902.27951-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_215917_950259_4CEC8DB9 
X-CRM114-Status: GOOD (  12.82  )
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
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
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
