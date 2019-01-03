From: Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH] tools/vm/page_owner: use page_owner_sort in the use example
Date: Thu, 3 Jan 2019 19:36:01 +0800
Message-ID: <1546515361-8317-1-git-send-email-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>
Cc: linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, Miles Chen <miles.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

The example in comment does not useable because the output
binary is named "page_owner_sort", not "sort".

Also add a reference to Documentation/vm/page_owner.rst

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 tools/vm/page_owner_sort.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/vm/page_owner_sort.c b/tools/vm/page_owner_sort.c
index 18fc112b65cd..d3a8755c039c 100644
--- a/tools/vm/page_owner_sort.c
+++ b/tools/vm/page_owner_sort.c
@@ -5,7 +5,9 @@
  * Example use:
  * cat /sys/kernel/debug/page_owner > page_owner_full.txt
  * grep -v ^PFN page_owner_full.txt > page_owner.txt
- * ./sort page_owner.txt sorted_page_owner.txt
+ * ./page_owner_sort page_owner.txt sorted_page_owner.txt
+ *
+ * See Documentation/vm/page_owner.rst
 */
 
 #include <stdio.h>
-- 
2.18.0
