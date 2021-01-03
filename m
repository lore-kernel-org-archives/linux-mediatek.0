Return-Path: <SRS0=/oW/=GG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5655C433DB
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 13:56:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 947A720B1F
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Jan 2021 13:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 947A720B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y5RU+ghcem9ffagwTVbXY04rAZ1BvlYJ59F23e1kXlc=; b=iuDZKTfNEim5XfYHRoZDW5e2N8
	BynCbNltJlmcKQTiLvT09SPqrxPJQagm4jElswX7oX7aU0RSdCeOcI3QJ+tyEWEUkgoFyL7O930BI
	5Zdf0XBgrBbus5GZ6bXHU9V4uJoaILolbOXAus32Sgi/YHX9BxR4aFgFx2ypL2pp3hm89g8PtuePI
	2SdPCIbg0wS4lkNZi4E9K85su/ZVbk31CgVy9VHbt28W5VfNegvEERfLm7/dT4Mnj0v4Zem9CwnSp
	4cfqeU+IzBSHv1VR2ZD1qbrGYi49vsDorkALppaMOSRhUq4a4ZQ9eHcfNKGXI7jn1bT/f6EaGHdDe
	u1rKM4bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kw3s4-00006t-To; Sun, 03 Jan 2021 13:56:37 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kw3s2-00005n-QP
 for linux-mediatek@lists.infradead.org; Sun, 03 Jan 2021 13:56:35 +0000
Received: by mail-pf1-x434.google.com with SMTP id h186so14742577pfe.0
 for <linux-mediatek@lists.infradead.org>; Sun, 03 Jan 2021 05:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OkmIEGZrUYxTikbU8Yd5Ez0Y/58b3wmDmzrHUQ/JMJM=;
 b=nGjvjcmdsFlkfDjdvxxYRqohrXCuqaKdYCNjBP1AJYFGuN8bT0krRV+4Nnzp+QG9RN
 iABSwavXnFmlBX2apMYrgTZORFtYaKMlKI6y/uz5KdMGKDxdf9Z29rHQYAiLDOOjEm+K
 G9zIyW0Fq9CkTvOltoikIB8nRZCo4DJVh9j3OL8VeDnm9GgS4b2P4GOXQ9wqA54oXuv4
 HA5lHIMg72vc7Wswx8uy9HG8RRAQrVywRjP02mc6fG7JgWj+QJh8y7erpzdN3HJCGvaf
 5MzI1FW8qzWfkNNCcjH4dTluJzs9wIipgT4mb6YbFQuHBjXD/o1wFLAGUGKqSUj5BsF6
 Ni5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OkmIEGZrUYxTikbU8Yd5Ez0Y/58b3wmDmzrHUQ/JMJM=;
 b=dIfYfnvX9EymXO35g8BIFrIcIbX3+RgM44vU4k3ol1CtxRLWpT2LIRstLgM+IkmzH6
 b6QXkhPH0XnhACSaC9ifPCswRs028pWllSCD5PugOMOtD0SjtMWgKZg3MFxITLCzSV05
 IaVkKXxxIqX0oP+0V0KasUQSYqa0U2+DXoTbrIgGN8P3ASlURvj6k237HriRi07bpz5g
 WDEnNqthm9Ryw5JUeVzP/sWV7WvGM6dCvqpgePLxTXRcZ9+9Upk0SMe735x/yHJ2jIlT
 g8Lqmq+LOCYJoH9QnavU2FZSoR+xs2Pof8xgDHP8bo8Trv88Z5kraSu5IGkSaX9weWkj
 Bz3A==
X-Gm-Message-State: AOAM532E/pgNrapP649cJkaglm0SePPVvMOlnVkxg5LUa6NNXgSXhEhy
 MJkB32DbcVTKdd45tbBExY4=
X-Google-Smtp-Source: ABdhPJxW8b/T9Mjgg0bCBSsDDs05greg1V5BdrxjsF8j/i2UplKH6ZyUEqMxWXlFrLFHRQKRV7Q91Q==
X-Received: by 2002:a62:ea17:0:b029:1ad:4788:7815 with SMTP id
 t23-20020a62ea170000b02901ad47887815mr55124711pfh.1.1609682191812; 
 Sun, 03 Jan 2021 05:56:31 -0800 (PST)
Received: from localhost.localdomain (61-230-37-4.dynamic-ip.hinet.net.
 [61.230.37.4])
 by smtp.gmail.com with ESMTPSA id u12sm25928427pgi.91.2021.01.03.05.56.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 05:56:31 -0800 (PST)
From: Lecopzer Chen <lecopzer@gmail.com>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kasan-dev@googlegroups.com
Subject: [PATCH] kasan: fix unaligned address is unhandled in
 kasan_remove_zero_shadow
Date: Sun,  3 Jan 2021 21:56:21 +0800
Message-Id: <20210103135621.83129-1-lecopzer@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210103_085634_873693_9F6265F2 
X-CRM114-Status: GOOD (  10.70  )
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
Cc: Lecopzer Chen <lecopzer.chen@mediatek.com>, glider@google.com,
 yj.chiang@mediatek.com, Lecopzer Chen <lecopzer@gmail.com>,
 linux-mediatek@lists.infradead.org, aryabinin@virtuozzo.com,
 dan.j.williams@intel.com, akpm@linux-foundation.org, dvyukov@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

During testing kasan_populate_early_shadow and kasan_remove_zero_shadow,
if the shadow start and end address in kasan_remove_zero_shadow() is
not aligned to PMD_SIZE, the remain unaligned PTE won't be removed.

In the test case for kasan_remove_zero_shadow():
    shadow_start: 0xffffffb802000000, shadow end: 0xffffffbfbe000000
    3-level page table:
      PUD_SIZE: 0x40000000 PMD_SIZE: 0x200000 PAGE_SIZE: 4K
0xffffffbf80000000 ~ 0xffffffbfbdf80000 will not be removed because
in kasan_remove_pud_table(), kasan_pmd_table(*pud) is true but the
next address is 0xffffffbfbdf80000 which is not aligned to PUD_SIZE.

In the correct condition, this should fallback to the next level
kasan_remove_pmd_table() but the condition flow always continue to skip
the unaligned part.

Fix by correcting the condition when next and addr are neither aligned.

Fixes: 0207df4fa1a86 ("kernel/memremap, kasan: make ZONE_DEVICE with work with KASAN")
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
---
 mm/kasan/init.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/mm/kasan/init.c b/mm/kasan/init.c
index 67051cfae41c..ae9158f7501f 100644
--- a/mm/kasan/init.c
+++ b/mm/kasan/init.c
@@ -372,9 +372,10 @@ static void kasan_remove_pmd_table(pmd_t *pmd, unsigned long addr,
 
 		if (kasan_pte_table(*pmd)) {
 			if (IS_ALIGNED(addr, PMD_SIZE) &&
-			    IS_ALIGNED(next, PMD_SIZE))
+			    IS_ALIGNED(next, PMD_SIZE)) {
 				pmd_clear(pmd);
-			continue;
+				continue;
+			}
 		}
 		pte = pte_offset_kernel(pmd, addr);
 		kasan_remove_pte_table(pte, addr, next);
@@ -397,9 +398,10 @@ static void kasan_remove_pud_table(pud_t *pud, unsigned long addr,
 
 		if (kasan_pmd_table(*pud)) {
 			if (IS_ALIGNED(addr, PUD_SIZE) &&
-			    IS_ALIGNED(next, PUD_SIZE))
+			    IS_ALIGNED(next, PUD_SIZE)) {
 				pud_clear(pud);
-			continue;
+				continue;
+			}
 		}
 		pmd = pmd_offset(pud, addr);
 		pmd_base = pmd_offset(pud, 0);
@@ -423,9 +425,10 @@ static void kasan_remove_p4d_table(p4d_t *p4d, unsigned long addr,
 
 		if (kasan_pud_table(*p4d)) {
 			if (IS_ALIGNED(addr, P4D_SIZE) &&
-			    IS_ALIGNED(next, P4D_SIZE))
+			    IS_ALIGNED(next, P4D_SIZE)) {
 				p4d_clear(p4d);
-			continue;
+				continue;
+			}
 		}
 		pud = pud_offset(p4d, addr);
 		kasan_remove_pud_table(pud, addr, next);
@@ -456,9 +459,10 @@ void kasan_remove_zero_shadow(void *start, unsigned long size)
 
 		if (kasan_p4d_table(*pgd)) {
 			if (IS_ALIGNED(addr, PGDIR_SIZE) &&
-			    IS_ALIGNED(next, PGDIR_SIZE))
+			    IS_ALIGNED(next, PGDIR_SIZE)) {
 				pgd_clear(pgd);
-			continue;
+				continue;
+			}
 		}
 
 		p4d = p4d_offset(pgd, addr);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
