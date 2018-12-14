From: David Hildenbrand <david@redhat.com>
Subject: [PATCH v1 4/9] riscv/vdso: don't clear PG_reserved
Date: Fri, 14 Dec 2018 12:10:09 +0100
Message-ID: <20181214111014.15672-5-david@redhat.com>
References: <20181214111014.15672-1-david@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181214111014.15672-1-david@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-mediatek@lists.infradead.org, David Hildenbrand <david@redhat.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Tobias Klauser <tklauser@distanz.ch>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>, Matthew Wilcox <willy@infradead.org>
List-Id: linux-mediatek@lists.infradead.org

The VDSO is part of the kernel image and therefore the struct pages are
marked as reserved during boot.

As we install a special mapping, the actual struct pages will never be
exposed to MM via the page tables. We can therefore leave the pages
marked as reserved.

Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Tobias Klauser <tklauser@distanz.ch>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>
Acked-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/riscv/kernel/vdso.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index 582cb153eb24..0cd044122234 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -54,7 +54,6 @@ static int __init vdso_init(void)
 		struct page *pg;
 
 		pg = virt_to_page(vdso_start + (i << PAGE_SHIFT));
-		ClearPageReserved(pg);
 		vdso_pagelist[i] = pg;
 	}
 	vdso_pagelist[i] = virt_to_page(vdso_data);
-- 
2.17.2
