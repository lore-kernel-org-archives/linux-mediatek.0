Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F02C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 08:55:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E2326113E
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 08:55:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E2326113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZjxVGtiDezatrE7wk2evKjUw0GXSnh8x1Wv3+zl0cxQ=; b=LM+Umyvuh27XfY
	Phd4CFOMesCTzxSYwZp/6vcgWze12kWb3uM1mMF04eqNBWx+7oaaXMyHeaw3DsieucZFC8BbIWPSI
	GIGHrGuq0XgOxok8Yrc2L3wrZZ9qHqRG5CwT7S9Sf4G/Eje6B4AJNLc/dIotoicpfbv+30aoepp39
	InA0aiifiFDltnIXFut5J5F2K6XQBzQVFRCZNap9CXDfLNTdaTYvR50DGk7Q5cLGz0nq2YtAPBmpV
	qYDosLKyw5ypZH1sGWmn3XhMKHbVs4P0jNsdQwxan+003VRwkCKi59VxZb2tmjjUcHvB28D/P71nY
	5dk8SzlRTlfArkf23vHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvcBy-006JQO-E8; Tue, 22 Jun 2021 08:55:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvcBv-006JOu-5M; Tue, 22 Jun 2021 08:55:32 +0000
X-UUID: c6a04d9e855d4b9fb7d476e41208e16a-20210622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=7i5vombE2LgwFykIPcGk4y+2hu2bStqgOtES8TP4NYo=; 
 b=nXdlmaahLXYSVdifLiqXc4ID1MDL4yEI6Em9HNYvlV+T0sCD7h9zLEUJZXX4mUDQhKLEbY8qsv20MjSrTpqw/v/khvU0igOMwpWtkNkl0mRsr92W6gK10UyNg/EURrlSNHDXiy8XIW4FerSnQJ6nOTnbO4H7YWjhfnDyJVRpxA0=;
X-UUID: c6a04d9e855d4b9fb7d476e41208e16a-20210622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 359449174; Tue, 22 Jun 2021 01:55:24 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Jun 2021 01:47:59 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Jun 2021 16:47:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Jun 2021 16:47:57 +0800
From: <yee.lee@mediatek.com>
To: <andreyknvl@gmail.com>
CC: <wsd_upstream@mediatek.com>, Yee Lee <yee.lee@mediatek.com>, "Andrey
 Ryabinin" <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, "open
 list:KASAN" <kasan-dev@googlegroups.com>, "open list:MEMORY MANAGEMENT"
 <linux-mm@kvack.org>, open list <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH] kasan: [v2]unpoison use memzero to init unaligned object
Date: Tue, 22 Jun 2021 16:47:20 +0800
Message-ID: <20210622084723.27637-1-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_015531_250303_BA5AA727 
X-CRM114-Status: GOOD (  13.40  )
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

Follows the discussion: https://patchwork.kernel.org/project/linux-mediatek/list/?series=504439

This patch Add memzero_explict to initialize unaligned object.

Based on the integrateion of initialization in kasan_unpoison(). The hwtag instructions, constrained with its granularity, has to overwrite the data btyes in unaligned objects. This would cause issue when it works with SLUB debug redzoning.

In this patch, an additional initalizaing path is added for the unaligned objects. It contains memzero_explict() to clear out the data and disables its init flag for the following hwtag actions.

In lab test, this path is executed about 1.1%(941/80854) within the overall kasan_unpoison during a non-debug booting process.

Lab test: QEMU5.2 (+mte) / linux kernel 5.13-rc7

Signed-off-by: Yee Lee <yee.lee@mediatek.com>
---
 mm/kasan/kasan.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index d8faa64614b7..edc11bcc3ff3 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -389,7 +389,7 @@ static inline void kasan_unpoison(const void *addr, size_t size, bool init)
 		return;
 	if (init && ((unsigned long)size & KASAN_GRANULE_MASK)) {
 		init = false;
-		memset((void *)addr, 0, size);
+		memzero_explicit((void *)addr, size);
 	}
 	size = round_up(size, KASAN_GRANULE_SIZE);
 	hw_set_mem_tag_range((void *)addr, size, tag, init);
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
