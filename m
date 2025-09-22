Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AC9CAC5A7
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Sep 2025 02:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SPCqIDb+yNYcV+5yEAWwdEaCDvI8BD77bbTSTfws3Yw=; b=Pg4mh8BaWiB3GspPRf5D4o3lTw
	OurxK3bQctq1pJ/O5hFkIQDYD8X8GFtoTvtMSi6ceIkoWtV9mS0IbahV7AN0rQICW4xsgxrySNlU8
	70DIgB+mQZNI9GmpX8VPuXbvC6PX3+bVn+9mcZsbucgilzn1WNGrtIR8O6RK1I/ZGh/PP5U+sb0p9
	qX4zgsvocHnNkLGngQMhjG761XyyYYjrm+PGe2OVpg8rkNsIPKzlyLjAUiZhsC1TocsBeHeYIjQNL
	OtZy9KceNoklo8VP4qLh7eO+ukQZrI0AANautGYxHuQnzz45/PFh9GauY4HZYiYzcRWazqWgardMN
	l9wnotUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0W5U-00000008Zy2-2tPc;
	Mon, 22 Sep 2025 02:15:32 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0W5H-00000008Zlz-1JHY
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Sep 2025 02:15:30 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45de56a042dso23857465e9.3
        for <linux-mediatek@lists.infradead.org>; Sun, 21 Sep 2025 19:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758507317; x=1759112117;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPCqIDb+yNYcV+5yEAWwdEaCDvI8BD77bbTSTfws3Yw=;
        b=iskeC4+ZWl04GAYiqfwcJGB/LgVS6rNuzgb+zHCYTpXcSYFpStlQyapqT1DWzoowY3
         mtGLqls+RpAzWO81OmHE/zZh3t7E1Zh4hgxoE3fm904Gr3r7jKfzlovSvl5/o5IYlOUA
         zL/LKIQYgS+9qiwOjJQyqjAVkVvQS5DDgw1uWK71JwiByRs03DalxrUbF6qacTn038b5
         YIjFtHl+Oy1Q4Y732/Pklnk9xDx1Rv8dS66xaBkwgP//WzSXQyFwCt2WOTm9EvZaxv5H
         Rq3x2abIb6bjI3xSUgsKYBJ8TF/KJ+8ULvjcn3fjEsWak1QcPg/vDMXf5EaKwAhgMiMI
         uMUw==
X-Forwarded-Encrypted: i=1; AJvYcCWgGk9KhUys6oLQLH8NXdQpKXBzYz8L4gPxFnY0+I238Lnv/c0MGVC/N8F5vRLwxzrm+w0EAjRUz4maKYd+ZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8KJLdK+VjRLaAGEf0iQ2klzDBlDG2Rzzm2Forff4N7fRGGIjP
	ccAplpdv/wVsq1Mjr1kIfJFlJCyho9FJzBQnDn5Z0tQYJvQVBdwD9/sm
X-Gm-Gg: ASbGncs09BoiGgbeUkicSmN98dBwiZU9ewjzEXA4d3rQNrCeGOq1imaep9bizoG+oZf
	j08U6HaTeJS/toG+wcn6zOmVL2y1zrxGWCXWaQYrta5gOMnY0r/QqS/x5W7CDTqLWhkTzzDEVBf
	j0tj1pIT5nyxWvfhFWi2bDgNpX9mlh9ouzvq52gHYoDBdEkhKN5F6o5pcIBwdrjg8Qg+ivRXETr
	1y4jgjX9TuXpiD4H/oLHQ8jm8TzxrexyYeAVOeop3BJfl5yEqwyp+RYQOWtAClEwvY75+pMa4Qu
	wQuriJ0D7OAC5hus9x2sNr3pDxQU/xF3p5OAc657G6sr6z4hIJ4VaqBdvFD+dZYNrcUZj81+Yo3
	C3G5hQES8
X-Google-Smtp-Source: AGHT+IH9s1cY1E+H2vTOe2w6B4oa+af+uNdUi3NtjrXEcg2rWJv7ohFVr7kLsZhy27UnUnTj0ObGrQ==
X-Received: by 2002:a05:600c:630e:b0:46c:9e81:ad0 with SMTP id 5b1f17b1804b1-46c9e904ffamr24190015e9.0.1758507313301;
        Sun, 21 Sep 2025 19:15:13 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([2a09:0:1:2::3086])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613dccb5e2sm220376635e9.17.2025.09.21.19.15.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 21 Sep 2025 19:15:13 -0700 (PDT)
From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org,
	david@redhat.com,
	lorenzo.stoakes@oracle.com
Cc: usamaarif642@gmail.com,
	yuzhao@google.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	baohua@kernel.org,
	voidice@gmail.com,
	Liam.Howlett@oracle.com,
	catalin.marinas@arm.com,
	cerasuolodomenico@gmail.com,
	hannes@cmpxchg.org,
	kaleshsingh@google.com,
	npache@redhat.com,
	riel@surriel.com,
	roman.gushchin@linux.dev,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	ryncsn@gmail.com,
	shakeel.butt@linux.dev,
	surenb@google.com,
	hughd@google.com,
	willy@infradead.org,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	qun-wei.lin@mediatek.com,
	Andrew.Yang@mediatek.com,
	casper.li@mediatek.com,
	chinwen.chang@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mm@kvack.org,
	ioworker0@gmail.com,
	stable@vger.kernel.org,
	Qun-wei Lin <Qun-wei.Lin@mediatek.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH 1/1] mm/thp: fix MTE tag mismatch when replacing zero-filled subpages
Date: Mon, 22 Sep 2025 10:14:58 +0800
Message-ID: <20250922021458.68123-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_191519_388019_3158F9A0 
X-CRM114-Status: GOOD (  16.99  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lance Yang <lance.yang@linux.dev>

When both THP and MTE are enabled, splitting a THP and replacing its
zero-filled subpages with the shared zeropage can cause MTE tag mismatch
faults in userspace.

Remapping zero-filled subpages to the shared zeropage is unsafe, as the
zeropage has a fixed tag of zero, which may not match the tag expected by
the userspace pointer.

KSM already avoids this problem by using memcmp_pages(), which on arm64
intentionally reports MTE-tagged pages as non-identical to prevent unsafe
merging.

As suggested by David[1], this patch adopts the same pattern, replacing the
memchr_inv() byte-level check with a call to pages_identical(). This
leverages existing architecture-specific logic to determine if a page is
truly identical to the shared zeropage.

Having both the THP shrinker and KSM rely on pages_identical() makes the
design more future-proof, IMO. Instead of handling quirks in generic code,
we just let the architecture decide what makes two pages identical.

[1] https://lore.kernel.org/all/ca2106a3-4bb2-4457-81af-301fd99fbef4@redhat.com

Cc: <stable@vger.kernel.org>
Reported-by: Qun-wei Lin <Qun-wei.Lin@mediatek.com>
Closes: https://lore.kernel.org/all/a7944523fcc3634607691c35311a5d59d1a3f8d4.camel@mediatek.com
Fixes: b1f202060afe ("mm: remap unused subpages to shared zeropage when splitting isolated thp")
Suggested-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
Tested on x86_64 and on QEMU for arm64 (with and without MTE support),
and the fix works as expected.

 mm/huge_memory.c | 15 +++------------
 mm/migrate.c     |  8 +-------
 2 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 32e0ec2dde36..28d4b02a1aa5 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -4104,29 +4104,20 @@ static unsigned long deferred_split_count(struct shrinker *shrink,
 static bool thp_underused(struct folio *folio)
 {
 	int num_zero_pages = 0, num_filled_pages = 0;
-	void *kaddr;
 	int i;
 
 	for (i = 0; i < folio_nr_pages(folio); i++) {
-		kaddr = kmap_local_folio(folio, i * PAGE_SIZE);
-		if (!memchr_inv(kaddr, 0, PAGE_SIZE)) {
-			num_zero_pages++;
-			if (num_zero_pages > khugepaged_max_ptes_none) {
-				kunmap_local(kaddr);
+		if (pages_identical(folio_page(folio, i), ZERO_PAGE(0))) {
+			if (++num_zero_pages > khugepaged_max_ptes_none)
 				return true;
-			}
 		} else {
 			/*
 			 * Another path for early exit once the number
 			 * of non-zero filled pages exceeds threshold.
 			 */
-			num_filled_pages++;
-			if (num_filled_pages >= HPAGE_PMD_NR - khugepaged_max_ptes_none) {
-				kunmap_local(kaddr);
+			if (++num_filled_pages >= HPAGE_PMD_NR - khugepaged_max_ptes_none)
 				return false;
-			}
 		}
-		kunmap_local(kaddr);
 	}
 	return false;
 }
diff --git a/mm/migrate.c b/mm/migrate.c
index aee61a980374..ce83c2c3c287 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -300,9 +300,7 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
 					  unsigned long idx)
 {
 	struct page *page = folio_page(folio, idx);
-	bool contains_data;
 	pte_t newpte;
-	void *addr;
 
 	if (PageCompound(page))
 		return false;
@@ -319,11 +317,7 @@ static bool try_to_map_unused_to_zeropage(struct page_vma_mapped_walk *pvmw,
 	 * this subpage has been non present. If the subpage is only zero-filled
 	 * then map it to the shared zeropage.
 	 */
-	addr = kmap_local_page(page);
-	contains_data = memchr_inv(addr, 0, PAGE_SIZE);
-	kunmap_local(addr);
-
-	if (contains_data)
+	if (!pages_identical(page, ZERO_PAGE(0)))
 		return false;
 
 	newpte = pte_mkspecial(pfn_pte(my_zero_pfn(pvmw->address),
-- 
2.49.0


