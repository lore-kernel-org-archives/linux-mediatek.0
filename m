Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7E3C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:11:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7DCD60F4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7DCD60F4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BsQfuoIQ2PVfUhbhoySVt4u3dqmUGJ6Qn1QJlbeyZ0g=; b=dxDxzVkmyoj9zH
	Rs6lqnXoILGbovznmwJjevNLBGkum8ZcgDvrPRW9NHxKu5R8Z08qwDVJ7sV/Jq076sh7PCLRwgL99
	q3q6LwfCMSuSIxl6DFTwrlunhWIYJHZlA5g5pFVz4QIm+B9n2IoY1NwKYabAC1sjCwDxAxm483QUo
	MK3fxRcfiFj4zAiIGlDnCNOiXa2v4y4/1y/walInayHFSLKdPrSzYrK1jUtgHB6AC2AlSJ+PsmAup
	2i62xBVZR0K50vHv4KxByX9jEhJRtUfkx/eWgjo6aRh2+6udBhH2SGs+t4Enz/R8YJu+ERK1Vo+5P
	YKFaY0LE1ro2typfme/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8EQc-00D7qM-Vp; Tue, 27 Jul 2021 04:10:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8EQa-00D7pM-FL; Tue, 27 Jul 2021 04:10:49 +0000
X-UUID: c72817ba518c4cbe9ccfcbb31318ee77-20210726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Hxt3KJSiksSLT61csNYyDNidMjF1j3Q6QzzOsWfpmaY=; 
 b=QgP4upqSe6hMAt3YMKthN3mT2v4Bhz2BkrItnpTCnkxBPZSct1K+AIAUa4A2rzuanNfFhs0AZerXdwRHppFS5cz0RS33wDXRJRqDj9X2NcakXWH+t+26SkPPUuFc6gUMiHSyxCacxxsH4tA8hW+/m2ZucldyP21X3t+2QouTRx0=;
X-UUID: c72817ba518c4cbe9ccfcbb31318ee77-20210726
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 454653061; Mon, 26 Jul 2021 21:10:45 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Jul 2021 21:00:43 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Jul 2021 12:00:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 27 Jul 2021 12:00:42 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Nicholas Tang <nicholas.tang@mediatek.com>, Andrew Yang
 <andrew.yang@mediatek.com>, Andrey Konovalov <andreyknvl@gmail.com>, "Andrey
 Ryabinin" <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, Chinwen Chang <chinwen.chang@mediatek.com>,
 Andrew Morton <akpm@linux-foundation.org>
CC: <kasan-dev@googlegroups.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Kuan-Ying Lee
 <Kuan-Ying.Lee@mediatek.com>
Subject: [PATCH 1/2] kasan, mm: reset tag when access metadata
Date: Tue, 27 Jul 2021 12:00:20 +0800
Message-ID: <20210727040021.21371-2-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210727040021.21371-1-Kuan-Ying.Lee@mediatek.com>
References: <20210727040021.21371-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_211048_563433_9093D8B3 
X-CRM114-Status: GOOD (  10.02  )
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

Hardware tag-based KASAN doesn't use compiler instrumentation, we
can not use kasan_disable_current() to ignore tag check.

Thus, we need to reset tags when accessing metadata.

Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
 mm/kmemleak.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 228a2fbe0657..73d46d16d575 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -290,7 +290,7 @@ static void hex_dump_object(struct seq_file *seq,
 	warn_or_seq_printf(seq, "  hex dump (first %zu bytes):\n", len);
 	kasan_disable_current();
 	warn_or_seq_hex_dump(seq, DUMP_PREFIX_NONE, HEX_ROW_SIZE,
-			     HEX_GROUP_SIZE, ptr, len, HEX_ASCII);
+			     HEX_GROUP_SIZE, kasan_reset_tag((void *)ptr), len, HEX_ASCII);
 	kasan_enable_current();
 }
 
@@ -1171,7 +1171,7 @@ static bool update_checksum(struct kmemleak_object *object)
 
 	kasan_disable_current();
 	kcsan_disable_current();
-	object->checksum = crc32(0, (void *)object->pointer, object->size);
+	object->checksum = crc32(0, kasan_reset_tag((void *)object->pointer), object->size);
 	kasan_enable_current();
 	kcsan_enable_current();
 
@@ -1246,7 +1246,7 @@ static void scan_block(void *_start, void *_end,
 			break;
 
 		kasan_disable_current();
-		pointer = *ptr;
+		pointer = *(unsigned long *)kasan_reset_tag((void *)ptr);
 		kasan_enable_current();
 
 		untagged_ptr = (unsigned long)kasan_reset_tag((void *)pointer);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
