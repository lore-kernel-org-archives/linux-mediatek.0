Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85759C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 09:51:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5729161372
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 09:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5729161372
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vwuVaE06LZQOJvQSXjJrDaYt4YoL2jXFNH6PFxrSJfY=; b=FTuzeSmEAdATMs
	OB6zlRnjP9NhKiBhjTqEgsClwrFKaW16ty24SxnS3R7wyAit917wjzAT0AtPcraFPA1oaJ1HPYNoz
	9ZG6dJQ8+lEsUzhAcT8Qqdk6Wbzx/Q1L2MPoBzOJQeNEKjiAklrJi/vY0e3iR/MjCA6UNxTFx/cK4
	SZEX0ubthhEYy57L3OzNki0We0chw5bX3jzIh2vX94F07o12Rr/DtmQ0ubJXrIEykwngtdmPmTn80
	eOG2u0HW57y3eX4NSDHFnfasNPMEVY01hLtzEkGbaqK/cHXBlbpDC71hCNVOw2uZkqjCXK896JuZD
	79XBa/uhWY5puJzm13Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md8G0-0044A4-J5; Wed, 20 Oct 2021 09:51:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md8Fw-00447d-LL; Wed, 20 Oct 2021 09:51:35 +0000
X-UUID: 5b1f7f6d6bff4784a836801ce3c51888-20211020
X-UUID: 5b1f7f6d6bff4784a836801ce3c51888-20211020
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1666861593; Wed, 20 Oct 2021 02:51:28 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Oct 2021 02:48:54 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 20 Oct 2021 17:48:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 20 Oct 2021 17:48:52 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
 <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov
 <dvyukov@google.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Marco Elver <elver@google.com>
CC: <chinwen.chang@mediatek.com>, <yee.lee@mediatek.com>,
 <nicholas.tang@mediatek.com>, <kasan-dev@googlegroups.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-mediatek@lists.infradead.org>, Kuan-Ying Lee
 <Kuan-Ying.Lee@mediatek.com>
Subject: [PATCH v3] kasan: add kasan mode messages when kasan init
Date: Wed, 20 Oct 2021 17:48:50 +0800
Message-ID: <20211020094850.4113-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_025132_727908_5D7517AB 
X-CRM114-Status: GOOD (  14.27  )
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

There are multiple kasan modes. It makes sense that we add some messages
to know which kasan mode is when booting up. see [1].

Link: https://bugzilla.kernel.org/show_bug.cgi?id=212195 [1]
Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
v3:
 - Rebase to linux-next
 - Move kasan_mode_info() into hw_tags.c
v2:
 - Rebase to linux-next
 - HW-tag based mode need to consider asymm mode
 - Thanks Marco's suggestion

 arch/arm64/mm/kasan_init.c |  2 +-
 mm/kasan/hw_tags.c         | 14 +++++++++++++-
 mm/kasan/sw_tags.c         |  2 +-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index 5b996ca4d996..6f5a6fe8edd7 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -309,7 +309,7 @@ void __init kasan_init(void)
 	kasan_init_depth();
 #if defined(CONFIG_KASAN_GENERIC)
 	/* CONFIG_KASAN_SW_TAGS also requires kasan_init_sw_tags(). */
-	pr_info("KernelAddressSanitizer initialized\n");
+	pr_info("KernelAddressSanitizer initialized (generic)\n");
 #endif
 }
 
diff --git a/mm/kasan/hw_tags.c b/mm/kasan/hw_tags.c
index dc892119e88f..7355cb534e4f 100644
--- a/mm/kasan/hw_tags.c
+++ b/mm/kasan/hw_tags.c
@@ -106,6 +106,16 @@ static int __init early_kasan_flag_stacktrace(char *arg)
 }
 early_param("kasan.stacktrace", early_kasan_flag_stacktrace);
 
+static inline const char *kasan_mode_info(void)
+{
+	if (kasan_mode == KASAN_MODE_ASYNC)
+		return "async";
+	else if (kasan_mode == KASAN_MODE_ASYMM)
+		return "asymm";
+	else
+		return "sync";
+}
+
 /* kasan_init_hw_tags_cpu() is called for each CPU. */
 void kasan_init_hw_tags_cpu(void)
 {
@@ -177,7 +187,9 @@ void __init kasan_init_hw_tags(void)
 		break;
 	}
 
-	pr_info("KernelAddressSanitizer initialized\n");
+	pr_info("KernelAddressSanitizer initialized (hw-tags, mode=%s, stacktrace=%s)\n",
+		kasan_mode_info(),
+		kasan_stack_collection_enabled() ? "on" : "off");
 }
 
 void kasan_alloc_pages(struct page *page, unsigned int order, gfp_t flags)
diff --git a/mm/kasan/sw_tags.c b/mm/kasan/sw_tags.c
index bd3f540feb47..77f13f391b57 100644
--- a/mm/kasan/sw_tags.c
+++ b/mm/kasan/sw_tags.c
@@ -42,7 +42,7 @@ void __init kasan_init_sw_tags(void)
 	for_each_possible_cpu(cpu)
 		per_cpu(prng_state, cpu) = (u32)get_cycles();
 
-	pr_info("KernelAddressSanitizer initialized\n");
+	pr_info("KernelAddressSanitizer initialized (sw-tags)\n");
 }
 
 /*
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
