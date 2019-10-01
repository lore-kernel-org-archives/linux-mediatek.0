From: Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH] docs: printk-formats: add ptrdiff_t type to printk-formats
Date: Tue, 1 Oct 2019 18:04:49 +0800
Message-ID: <20191001100449.19481-1-miles.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com, Miles Chen <miles.chen@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

When print the difference between two pointers, we should use
the ptrdiff_t modifier %t.

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 Documentation/core-api/printk-formats.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index ecbebf4ca8e7..8a0f49cd158b 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -135,6 +135,20 @@ equivalent to %lx (or %lu). %px is preferred because it is more uniquely
 grep'able. If in the future we need to modify the way the kernel handles
 printing pointers we will be better equipped to find the call sites.
 
+Pointer Differences
+-------------------
+
+::
+
+	%td	2560
+	%tx	a00
+
+For printing the pointer differences, use the %t modifier for ptrdiff_t.
+
+Example::
+
+	printk("test: difference between pointers: %td\n", ptr2 - ptr1);
+
 Struct Resources
 ----------------
 
-- 
2.18.0
