Return-Path: <SRS0=XU5C=LU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFBDC49EA5
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Jun 2021 10:10:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6E1761278
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Jun 2021 10:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6E1761278
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vam4VcLledsmMPUsq/gG7dOpiWMBh8jtPy9IBTSFO0s=; b=BOeQpAoNf+rfcH
	aEzDug+ucVo0J+Vry3/22ci5JyioP/3RJwkcSw0YO2gPuvTCwIHvw5kPShx0dKbcUcHFXwkH5Howy
	OhtrsmEsSJOJ5JcNg67LHAgCha6+TbY+82+l4S7LddOeL7H0axaY77YMlTbj9qRlzpwEOZKE8A86l
	oyjnEDz4zKJVCOwtRYYTf6TqwdmInrcFIsCfqcLPZsYTiVltKrpC1i/iWVmvzEHgOKCSY7mXVw4eE
	jie33n6xzyCLp5M+9vDsQBgwauZdh7P2ueAdvOp2wHyod6EpEzhum9FkqyfVE52IpVXf3BbmBveXC
	H6EOx7xi0V7aZihFXgVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lx5GM-003pOB-2g; Sat, 26 Jun 2021 10:10:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lx5Fy-003pIk-S6; Sat, 26 Jun 2021 10:09:48 +0000
X-UUID: 4c25f9bceae64073bf4c314e98060fba-20210626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=9Hfqsm7PkqYuiPNBpmlvterTJKuG/ILX+dUL8EAHW6I=; 
 b=hhnzEtKKReGYxlZpTm0sSRR2bzDGSFvLeUq8x7VHWBV6smoKzRUKn1GYYqEySXg5D7f1IbnZqRPh24atmGNYYb6dTgrUnv1C+GL0GgVnIUqh6eRQ6FrpSsec6M6PkV+HtVozhEg77EtZ7Auh3QX9l9LxW2uFMOHK5YP1jNBqGns=;
X-UUID: 4c25f9bceae64073bf4c314e98060fba-20210626
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1325621336; Sat, 26 Jun 2021 03:09:41 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 26 Jun 2021 03:09:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 26 Jun 2021 18:09:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 26 Jun 2021 18:09:38 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
 <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Marco Elver
 <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <kasan-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>,
 <chinwen.chang@mediatek.com>, <nicholas.tang@mediatek.com>, Kuan-Ying Lee
 <Kuan-Ying.Lee@mediatek.com>
Subject: [PATCH v4 3/3] kasan: add memory corruption identification support
 for hardware tag-based mode
Date: Sat, 26 Jun 2021 18:09:31 +0800
Message-ID: <20210626100931.22794-4-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210626100931.22794-1-Kuan-Ying.Lee@mediatek.com>
References: <20210626100931.22794-1-Kuan-Ying.Lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210626_030947_071135_521FA89D 
X-CRM114-Status: GOOD (  11.98  )
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

Add memory corruption identification support for hardware tag-based
mode. We store one old free pointer tag and free backtrace instead
of five because hardware tag-based kasan only has 16 different tags.

If we store as many stacks as SW tag-based kasan does(5 stacks),
there is high probability to find the same tag in the stacks when
out-of-bound issues happened and we will mistake out-of-bound
issue for use-after-free.

Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Suggested-by: Marco Elver <elver@google.com>
Reviewed-by: Alexander Potapenko <glider@google.com>
Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 lib/Kconfig.kasan | 2 +-
 mm/kasan/kasan.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index fdb4a08dba83..1e2d10f86011 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -169,7 +169,7 @@ config KASAN_STACK
 
 config KASAN_TAGS_IDENTIFY
 	bool "Enable memory corruption identification"
-	depends on KASAN_SW_TAGS
+	depends on KASAN_SW_TAGS || KASAN_HW_TAGS
 	help
 	  This option enables best-effort identification of bug type
 	  (use-after-free or out-of-bounds) at the cost of increased
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 952df2db7fdd..f58672f6029a 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -153,7 +153,7 @@ struct kasan_track {
 	depot_stack_handle_t stack;
 };
 
-#ifdef CONFIG_KASAN_TAGS_IDENTIFY
+#if defined(CONFIG_KASAN_TAGS_IDENTIFY) && defined(CONFIG_KASAN_SW_TAGS)
 #define KASAN_NR_FREE_STACKS 5
 #else
 #define KASAN_NR_FREE_STACKS 1
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
