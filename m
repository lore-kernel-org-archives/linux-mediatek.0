Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1218AC07E99
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 10:33:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D27A7613F7
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 10:33:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D27A7613F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ld+K8aGWj04khvnsTzbpXWEEBrnMUlxA+CxHISHfOEs=; b=3rH0WlbST//05F
	1muHAt2qH1jEVnuVTDmavmZ0jGRR4OVwvO68RrAv39KHdVXmJyQexZafaGsntyH1nZK6I5kCVygOu
	SCnAvajiu8l/zcfvEz89T1iwbF7op5BnfRPTSEaOGmdpTXrEuwwmFLHbQUZv2QBBJm1btL+ckW+Rn
	6DBzAW9TSQRu2RViEh4zKw/9F+maB8olBcrDQGFe7llsn1KENQzAg+M5Zt1vlDKtLWXMHA4/OwFp4
	xyEdfMj8oIB/j0rVGbCG9TJCFbT8KuJHyjXEZb0W29zfSiOQ7PuP3CdFnXGU9b5yTctHRQeY3QfMl
	5H9a71M4Xaai0WUuf3fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Lv6-008aOU-Dj; Mon, 05 Jul 2021 10:33:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0Lus-008aKu-I7; Mon, 05 Jul 2021 10:33:32 +0000
X-UUID: 71b738b91a2044029e182eacee257f62-20210705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=c3apyg+1j9K6wAJpMo0RJJyr5s7DwbhlyZZLh0X8Vlg=; 
 b=HkqXizvaJJyEEK6mB2PALIHc4r8jp/M7xUCcy7AdGe3LlB0ySmRlc0DdaFqiGHYDEpTqN4UYT89CjBiQipc5oILB8ma6rKsvPl0Y7zTSQaePdxhUfPYI3Cpl2dQ3CVbFO0egOBc+TTDSTykTTOPizqqM6VyLxotsEbivs26/h6c=;
X-UUID: 71b738b91a2044029e182eacee257f62-20210705
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 88766971; Mon, 05 Jul 2021 03:33:28 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 03:33:27 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 18:33:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 5 Jul 2021 18:33:25 +0800
From: <yee.lee@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <nicholas.Tang@mediatek.com>, <Kuan-Ying.lee@mediatek.com>,
 <chinwen.chang@mediatek.com>, Yee Lee <yee.lee@mediatek.com>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, "Dmitry
 Vyukov" <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Andrey Konovalov <andreyknvl@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, "open list:KASAN" <kasan-dev@googlegroups.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v6 2/2] kasan: Add memzero int for unaligned size at DEBUG
Date: Mon, 5 Jul 2021 18:32:27 +0800
Message-ID: <20210705103229.8505-3-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210705103229.8505-1-yee.lee@mediatek.com>
References: <20210705103229.8505-1-yee.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_033330_656389_E2E18BFB 
X-CRM114-Status: GOOD (  12.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yee Lee <yee.lee@mediatek.com>

Issue: when SLUB debug is on, hwtag kasan_unpoison() would overwrite
the redzone of object with unaligned size.

An additional memzero_explicit() path is added to replacing init by
hwtag instruction for those unaligned size at SLUB debug mode.

The penalty is acceptable since they are only enabled in debug mode,
not production builds. A block of comment is added for explanation.

Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Suggested-by: Marco Elver <elver@google.com>
Suggested-by: Andrey Konovalov <andreyknvl@gmail.com>
Signed-off-by: Yee Lee <yee.lee@mediatek.com>
---
 mm/kasan/kasan.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 98e3059bfea4..d739cdd1621a 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -9,6 +9,7 @@
 #ifdef CONFIG_KASAN_HW_TAGS
 
 #include <linux/static_key.h>
+#include "../slab.h"
 
 DECLARE_STATIC_KEY_FALSE(kasan_flag_stacktrace);
 extern bool kasan_flag_async __ro_after_init;
@@ -387,6 +388,17 @@ static inline void kasan_unpoison(const void *addr, size_t size, bool init)
 
 	if (WARN_ON((unsigned long)addr & KASAN_GRANULE_MASK))
 		return;
+	/*
+	 * Explicitly initialize the memory with the precise object size to
+	 * avoid overwriting the SLAB redzone. This disables initialization in
+	 * the arch code and may thus lead to performance penalty. The penalty
+	 * is accepted since SLAB redzones aren't enabled in production builds.
+	 */
+	if (__slub_debug_enabled() &&
+	    init && ((unsigned long)size & KASAN_GRANULE_MASK)) {
+		init = false;
+		memzero_explicit((void *)addr, size);
+	}
 	size = round_up(size, KASAN_GRANULE_SIZE);
 
 	hw_set_mem_tag_range((void *)addr, size, tag, init);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
