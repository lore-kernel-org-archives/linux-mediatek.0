From: <miles.chen@mediatek.com>
Subject: [PATCH] mm: Remove PG_highmem description
Date: Wed, 31 Jan 2018 17:33:32 +0800
Message-ID: <1517391212-2950-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Huang Ying <ying.huang@intel.com>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Michal Hocko <mhocko@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Miles Chen <miles.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Miles Chen <miles.chen@mediatek.com>

The commit cbe37d093707 ("[PATCH] mm: remove PG_highmem") has removed
PG_highmem to save a page flag. So the description of PG_highmem
is no longer needed, remove it.

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 include/linux/page-flags.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 3ec44e27aa9d..50c2b8786831 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -46,11 +46,6 @@
  * guarantees that this bit is cleared for a page when it first is entered into
  * the page cache.
  *
- * PG_highmem pages are not permanently mapped into the kernel virtual address
- * space, they need to be kmapped separately for doing IO on the pages.  The
- * struct page (these bits with information) are always mapped into kernel
- * address space...
- *
  * PG_hwpoison indicates that a page got corrupted in hardware and contains
  * data with incorrect ECC bits that triggered a machine check. Accessing is
  * not safe since it may cause another machine check. Don't touch!
-- 
2.12.5
