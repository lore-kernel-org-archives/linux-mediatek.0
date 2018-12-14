From: David Hildenbrand <david@redhat.com>
Subject: [PATCH v1 3/9] powerpc/vdso: don't clear PG_reserved
Date: Fri, 14 Dec 2018 12:10:08 +0100
Message-ID: <20181214111014.15672-4-david@redhat.com>
References: <20181214111014.15672-1-david@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181214111014.15672-1-david@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-mediatek@lists.infradead.org, David Hildenbrand <david@redhat.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@c-s.fr>, Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>, Matthew Wilcox <willy@infradead.org>
List-Id: linux-mediatek@lists.infradead.org

The VDSO is part of the kernel image and therefore the struct pages are
marked as reserved during boot.

As we install a special mapping, the actual struct pages will never be
exposed to MM via the page tables. We can therefore leave the pages
marked as reserved.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Kees Cook <keescook@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/kernel/vdso.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 65b3bdb99f0b..d59dc2e9a695 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -795,7 +795,6 @@ static int __init vdso_init(void)
 	BUG_ON(vdso32_pagelist == NULL);
 	for (i = 0; i < vdso32_pages; i++) {
 		struct page *pg = virt_to_page(vdso32_kbase + i*PAGE_SIZE);
-		ClearPageReserved(pg);
 		get_page(pg);
 		vdso32_pagelist[i] = pg;
 	}
@@ -809,7 +808,6 @@ static int __init vdso_init(void)
 	BUG_ON(vdso64_pagelist == NULL);
 	for (i = 0; i < vdso64_pages; i++) {
 		struct page *pg = virt_to_page(vdso64_kbase + i*PAGE_SIZE);
-		ClearPageReserved(pg);
 		get_page(pg);
 		vdso64_pagelist[i] = pg;
 	}
-- 
2.17.2
