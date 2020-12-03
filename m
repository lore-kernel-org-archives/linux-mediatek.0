Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53ABC6369E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 02:37:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D80B21D91
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 02:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D80B21D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PLQ1mHFpaOmHTlnf6L58FBRZ+JKGyrU0pNe6Iqa7Uus=; b=DSUUvU2RkUbJNsKKYhmZ3YoxxB
	1zGd+iU9fw1aATzNBnambb8tMdQCJDv3977297dokXxnYI69LitKZpXXL0nZov7l6nYrhGGfh/bCL
	LfOYmM/SBD3HScP6Q0GtTQNo3PaVVyyY9yUdL99J76gXrYZxhg9h0NyrxAfMDNBBVQlY38+CrmEYB
	iYPpV9wwamP0enhvZFonQopuRmduLC/hi66dMYLVfmqkCrtiR2U67N8z935YTf5df6q4f/N6Hf64y
	kQWiNCTV1/5+PbPNCTwcWWMSbj/Ikh2BObuvG3KjTWKAr81/x7co5FxO3cTOKrh4uydsPkN2kWN8i
	MliXkjDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkeUt-0002jw-Q1; Thu, 03 Dec 2020 02:37:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkeUo-0002ii-5k; Thu, 03 Dec 2020 02:37:27 +0000
X-UUID: 6c7a9ae2f0a24312a14a836cefb8f900-20201202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=/yf8gMq0VSi/z2OsptkOVUZQ3+aKfKlCEfZLZ3X54hs=; 
 b=OhYU+d3R70DS2IMacU11p+Gp3O79J3MC2fpCuU6OwQ0h1/3NdIHD3zHerBvNXwXiBaQbxtMbfGP0oeLQg2VU3dFsXO/yCpIkfVfeLABXYMxfok73iKWGcANBcAN9J/gjqYAGj/QW3nuFs+ONRlwyjdVnwPsOwsvjwxEr0CfmTfs=;
X-UUID: 6c7a9ae2f0a24312a14a836cefb8f900-20201202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 964181347; Wed, 02 Dec 2020 18:37:22 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Dec 2020 18:27:18 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Dec 2020 10:27:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 3 Dec 2020 10:27:16 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, 
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov
 <andreyknvl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5 2/4] kasan: print workqueue stack
Date: Thu, 3 Dec 2020 10:27:15 +0800
Message-ID: <20201203022715.30635-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 02036FC500E99B99F6C523F3F2DFF607ACC4B5DC0C67FC4EA24112FB0A729D982000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_213726_472245_08879281 
X-CRM114-Status: GOOD (  13.89  )
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

The aux_stack[2] is reused to record the call_rcu() call stack
and enqueuing work call stacks. So that we need to change the
auxiliary stack title for common title, print them in KASAN report.

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Suggested-by: Marco Elver <elver@google.com>
Acked-by: Marco Elver <elver@google.com>
Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
Reviewed-by: Andrey Konovalov <andreyknvl@google.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Alexander Potapenko <glider@google.com>
---

v4:
- remove a mention of call_rcu() at kasan_record_aux_stack()
  Thanks for Alexander reminder.

v2:
- Thanks for Marco suggestion.
- We modify aux stack title name in KASAN report
  in order to print call_rcu()/timer/workqueue stack.

---
 mm/kasan/generic.c | 3 ---
 mm/kasan/report.c  | 4 ++--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 248264b9cb76..30c0a5038b5c 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -339,9 +339,6 @@ void kasan_record_aux_stack(void *addr)
 	object = nearest_obj(cache, page, addr);
 	alloc_info = get_alloc_info(cache, object);
 
-	/*
-	 * record the last two call_rcu() call stacks.
-	 */
 	alloc_info->aux_stack[1] = alloc_info->aux_stack[0];
 	alloc_info->aux_stack[0] = kasan_save_stack(GFP_NOWAIT);
 }
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index 00a53f1355ae..5a0102f37171 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -185,12 +185,12 @@ static void describe_object(struct kmem_cache *cache, void *object,
 
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
