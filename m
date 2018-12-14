From: David Hildenbrand <david@redhat.com>
Subject: [PATCH v1 5/9] m68k/mm: use __ClearPageReserved()
Date: Fri, 14 Dec 2018 12:10:10 +0100
Message-ID: <20181214111014.15672-6-david@redhat.com>
References: <20181214111014.15672-1-david@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181214111014.15672-1-david@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-mediatek@lists.infradead.org, David Hildenbrand <david@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>, Matthew Wilcox <willy@infradead.org>
List-Id: linux-mediatek@lists.infradead.org

The PG_reserved flag is cleared from memory that is part of the kernel
image (and therefore marked as PG_reserved). Avoid using PG_reserved
directly.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/m68k/mm/memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/mm/memory.c b/arch/m68k/mm/memory.c
index b86a2e21693b..227c04fe60d2 100644
--- a/arch/m68k/mm/memory.c
+++ b/arch/m68k/mm/memory.c
@@ -51,7 +51,7 @@ void __init init_pointer_table(unsigned long ptable)
 	pr_debug("init_pointer_table: %lx, %x\n", ptable, PD_MARKBITS(dp));
 
 	/* unreserve the page so it's possible to free that page */
-	PD_PAGE(dp)->flags &= ~(1 << PG_reserved);
+	__ClearPageReserved(PD_PAGE(dp));
 	init_page_count(PD_PAGE(dp));
 
 	return;
-- 
2.17.2
