Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19EBFC07E99
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 10:34:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6B52613F3
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 10:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6B52613F3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJsuHn1AeltPRuU3RiXXEYpr6wC4qwo51dSx5axjoZI=; b=L3rQHX50U+mWxg
	iWL5SjMmgzKjGTfz6IJOSgi+AFvUPRXmiuConFMIx/PaB63CKHvXkO0SCWPzUdfisTAnFYgQIFxsn
	jC+/SWwOJP82yXj27cc+koexC1I+QIJ9sunJekfu/LBfWMgTaUpA55bFGiZFo3Y7ETH/aJ9U9BTyC
	YsFxTG1sjRZCr+dloI/ZAYBqvUuW67pqQBrztlevdcqsRZ/r8YdsY6vaUG5SbJhrXGKaRpYKgy3RS
	EsgBtepJQqB8/fBWTEBU/1w2UIeeHvbUxgTMaO+F/OmeETqjB2hcAvuS0CEj51nm3R56LUMWdHR3J
	xUN+OoxEtRUjw9SfmNNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0LvH-008aRl-Gs; Mon, 05 Jul 2021 10:33:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0Lut-008aLD-36; Mon, 05 Jul 2021 10:33:32 +0000
X-UUID: 0f23347964fc4840a0c5f7fb6ba7c001-20210705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=natBv6bjlendt8Mb35/LbpmkSFKSCys35LqsTZpd4qo=; 
 b=C5+o24QuLb6yeJXjvM4sNcd4sF2ZXKYOTbxkJU70ixBtQYY9Wh+SNLmgXw0taxizRkh4TGOQFM6qK7YfBxp/c08t39mZIPtD+fujwOCsPX4kxoP+Syv4RIBjm0KD3VbN8iVilBFJl96Ftp/lBZOXyxLH1W3+pn6LmPNqwjzMpXA=;
X-UUID: 0f23347964fc4840a0c5f7fb6ba7c001-20210705
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 693258614; Mon, 05 Jul 2021 03:33:28 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 03:33:27 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 18:33:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 5 Jul 2021 18:33:25 +0800
From: <yee.lee@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <nicholas.Tang@mediatek.com>, <Kuan-Ying.lee@mediatek.com>,
 <chinwen.chang@mediatek.com>, Marco Elver <elver@google.com>, Yee Lee
 <yee.lee@mediatek.com>, Christoph Lameter <cl@linux.com>, Pekka Enberg
 <penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim
 <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:SLAB ALLOCATOR" <linux-mm@kvack.org>, "moderated list:ARM/Mediatek
 SoC support" <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v6 1/2] mm: move helper to check slub_debug_enabled
Date: Mon, 5 Jul 2021 18:32:26 +0800
Message-ID: <20210705103229.8505-2-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210705103229.8505-1-yee.lee@mediatek.com>
References: <20210705103229.8505-1-yee.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_033331_216296_DDCC8BD6 
X-CRM114-Status: GOOD (  10.28  )
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

From: Marco Elver <elver@google.com>

Move the helper to check slub_debug_enabled, so that we can confine
the use of #ifdef outside slub.c as well.

Suggested-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Marco Elver <elver@google.com>
Signed-off-by: Yee Lee <yee.lee@mediatek.com>
---
 mm/slab.h | 15 +++++++++++----
 mm/slub.c | 14 --------------
 2 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/mm/slab.h b/mm/slab.h
index 7b60ef2f32c3..67d3272f3368 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -216,10 +216,18 @@ DECLARE_STATIC_KEY_FALSE(slub_debug_enabled);
 #endif
 extern void print_tracking(struct kmem_cache *s, void *object);
 long validate_slab_cache(struct kmem_cache *s);
+static inline bool __slub_debug_enabled(void)
+{
+	return static_branch_unlikely(&slub_debug_enabled);
+}
 #else
 static inline void print_tracking(struct kmem_cache *s, void *object)
 {
 }
+static inline bool __slub_debug_enabled(void)
+{
+	return false;
+}
 #endif
 
 /*
@@ -229,11 +237,10 @@ static inline void print_tracking(struct kmem_cache *s, void *object)
  */
 static inline bool kmem_cache_debug_flags(struct kmem_cache *s, slab_flags_t flags)
 {
-#ifdef CONFIG_SLUB_DEBUG
-	VM_WARN_ON_ONCE(!(flags & SLAB_DEBUG_FLAGS));
-	if (static_branch_unlikely(&slub_debug_enabled))
+	if (IS_ENABLED(CONFIG_SLUB_DEBUG))
+		VM_WARN_ON_ONCE(!(flags & SLAB_DEBUG_FLAGS));
+	if (__slub_debug_enabled())
 		return s->flags & flags;
-#endif
 	return false;
 }
 
diff --git a/mm/slub.c b/mm/slub.c
index 3bc8b940c933..71515c484d1c 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -119,25 +119,11 @@
  */
 
 #ifdef CONFIG_SLUB_DEBUG
-
 #ifdef CONFIG_SLUB_DEBUG_ON
 DEFINE_STATIC_KEY_TRUE(slub_debug_enabled);
 #else
 DEFINE_STATIC_KEY_FALSE(slub_debug_enabled);
 #endif
-
-static inline bool __slub_debug_enabled(void)
-{
-	return static_branch_unlikely(&slub_debug_enabled);
-}
-
-#else		/* CONFIG_SLUB_DEBUG */
-
-static inline bool __slub_debug_enabled(void)
-{
-	return false;
-}
-
 #endif		/* CONFIG_SLUB_DEBUG */
 
 static inline bool kmem_cache_debug(struct kmem_cache *s)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
