From: Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH] arm64: trap illegal translations in __virt_to_phys()
Date: Mon, 7 Jan 2019 19:21:20 +0800
Message-ID: <1546860080-13027-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Miles Chen <miles.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Current __virt_to_phys() only print warning messages for non-linear
addresses. It's hard to catch all warnings by those messages. So add a
VIRTUAL_BUG_ON() to trap all non-linear and non-symbol addresses
(e.g., stack addresses)

Tested by pass stack addresses and symbol addresses to __pa(). Result:
stack addresses: kernel BUG()
symbol addresses: kernel warning message

Maybe we should trap all non-linear address translations in the future.

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 arch/arm64/mm/physaddr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/mm/physaddr.c b/arch/arm64/mm/physaddr.c
index 67a9ba9eaa96..f6b935dad19c 100644
--- a/arch/arm64/mm/physaddr.c
+++ b/arch/arm64/mm/physaddr.c
@@ -14,6 +14,11 @@ phys_addr_t __virt_to_phys(unsigned long x)
 	      (void *)x,
 	      (void *)x);
 
+	/* trap all non-linear and non-symbol addresses */
+	VIRTUAL_BUG_ON(!__is_lm_address(x) &&
+			(x < (unsigned long)KERNEL_START ||
+			 x > (unsigned long)KERNEL_END));
+
 	return __virt_to_phys_nodebug(x);
 }
 EXPORT_SYMBOL(__virt_to_phys);
-- 
2.18.0
