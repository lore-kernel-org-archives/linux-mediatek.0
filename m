Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB26C11F6A
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 08:54:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A98D4613F3
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 08:54:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A98D4613F3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bdPCAfgjZ8ABLtZ30hU8yHDMaHtGBrL/h/sRKOd0ssI=; b=4g7k858jrKQ+1H
	LHb6B8ogzpaAYHu75xWQkNmPBFV55186BL35wDhbeIjiLSkOP1SjTchWlCH/x2gJmO4JJlsiI/qBz
	ZDKJJEr5phARnc+/vjpOGD6sTIuAeSEG9oAfXg+TYrD9T9rvKdKCqge8bSpikwhftYaFvZ1DiEN7q
	NjcrWzJjaLOY9fQe1HZTcNs2/lNv6MawmvV8DuLLVRM2F+UlawYtnMkE3IQ4iECca6j+nUhG8+WA2
	fMufyfzq2zjc0FBH5oC/ihOqNFYWrtK1OWMMqtv1G4uqw0wFV80Rnj/jM3M5D7BxzWHvTFafOwAvP
	C/9qBJN3Kj94ZU+O2PrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzEwH-002X9Z-O8; Fri, 02 Jul 2021 08:54:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzEw4-002X77-4Q; Fri, 02 Jul 2021 08:54:10 +0000
X-UUID: b78da6c95bca463eb6cd1a1e5fd5f212-20210702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=c4UgKqcAv83mx7vfnDYDkN7HdQr8nRTSVbN5uJSg+MA=; 
 b=kHLNcEMU/7m05VjiCP0+reuWw1IpybGBAdZwWJ7SNn1jIWwyL6NRwIl+cWa5rC0o/aKZDeqAglAzaTOGKF551tVEXGJ+gjJRk57VQYOSgs9Y/Gb+ZEscKvS11uqtv/PysRNrXY3PMndmAc7Mj52yqm54bydILM8BEVA/kCu+A88=;
X-UUID: b78da6c95bca463eb6cd1a1e5fd5f212-20210702
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 240433748; Fri, 02 Jul 2021 01:54:00 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Jul 2021 01:53:59 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Jul 2021 16:53:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 2 Jul 2021 16:53:57 +0800
From: <yee.lee@mediatek.com>
To: <andreyknvl@gmail.com>
CC: <wsd_upstream@mediatek.com>, <nicholas.Tang@mediatek.com>,
 <Kuan-Ying.lee@mediatek.com>, <chinwen.chang@mediatek.com>, Marco Elver
 <elver@google.com>, Yee Lee <yee.lee@mediatek.com>, Christoph Lameter
 <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes
 <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton
 <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "open list:SLAB ALLOCATOR"
 <linux-mm@kvack.org>, open list <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 1/2] mm: introduce helper to check slub_debug_enabled
Date: Fri, 2 Jul 2021 16:53:31 +0800
Message-ID: <20210702085332.10035-1-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_015408_231429_7CEC1782 
X-CRM114-Status: GOOD (  11.25  )
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

Introduce a helper to check slub_debug_enabled, so that we can confine
the use of #ifdef to the definition of the slub_debug_enabled_unlikely()
helper.

---

Signed-off-by: Marco Elver <elver@google.com>
Signed-off-by: Yee Lee <yee.lee@mediatek.com>

---
 mm/slab.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/mm/slab.h b/mm/slab.h
index 7b60ef2f32c3..a11126afe24c 100644
--- a/mm/slab.h
+++ b/mm/slab.h
@@ -216,10 +216,18 @@ DECLARE_STATIC_KEY_FALSE(slub_debug_enabled);
 #endif
 extern void print_tracking(struct kmem_cache *s, void *object);
 long validate_slab_cache(struct kmem_cache *s);
+static inline bool slub_debug_enabled_unlikely(void)
+{
+	return static_branch_unlikely(&slub_debug_enabled);
+}
 #else
 static inline void print_tracking(struct kmem_cache *s, void *object)
 {
 }
+static inline bool slub_debug_enabled_unlikely(void)
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
+	if (slub_debug_enabled_unlikely())
 		return s->flags & flags;
-#endif
 	return false;
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
