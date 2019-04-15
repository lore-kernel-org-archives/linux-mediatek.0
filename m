From: Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH] arm64: mm: check virtual addr in virt_to_page() if CONFIG_DEBUG_VIRTUAL=y
Date: Tue, 16 Apr 2019 01:36:36 +0800
Message-ID: <1555349796-9456-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Miles Chen <miles.chen@mediatek.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: linux-mediatek@lists.infradead.org

This change uses the original virt_to_page() (the one with __pa()) to
check the given virtual address if CONFIG_DEBUG_VIRTUAL=y.

Recently, I worked on a bug: a driver passes a symbol address to
dma_map_single() and the virt_to_page() (called by dma_map_single())
does not work for non-linear addresses after commit 9f2875912dac
("arm64: mm: restrict virt_to_page() to the linear mapping").

I tried to trap the bug by enabling CONFIG_DEBUG_VIRTUAL but it
did not work - bacause the commit removes the __pa() from
virt_to_page() but CONFIG_DEBUG_VIRTUAL checks the virtual address
in __pa()/__virt_to_phys().

A simple solution is to use the original virt_to_page()
(the one with__pa()) if CONFIG_DEBUG_VIRTUAL=y.

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
---
 arch/arm64/include/asm/memory.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
index 290195168bb3..2cb8248fa2c8 100644
--- a/arch/arm64/include/asm/memory.h
+++ b/arch/arm64/include/asm/memory.h
@@ -302,7 +302,7 @@ static inline void *phys_to_virt(phys_addr_t x)
  */
 #define ARCH_PFN_OFFSET		((unsigned long)PHYS_PFN_OFFSET)
 
-#ifndef CONFIG_SPARSEMEM_VMEMMAP
+#if !defined(CONFIG_SPARSEMEM_VMEMMAP) || defined(CONFIG_DEBUG_VIRTUAL)
 #define virt_to_page(kaddr)	pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
 #define _virt_addr_valid(kaddr)	pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
 #else
-- 
2.18.0
