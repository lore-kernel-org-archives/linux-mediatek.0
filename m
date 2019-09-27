From: Walter Wu <walter-zh.wu@mediatek.com>
Subject: [PATCH] kasan: fix the missing underflow in memmove and memcpy with
 CONFIG_KASAN_GENERIC=y
Date: Fri, 27 Sep 2019 11:43:38 +0800
Message-ID: <20190927034338.15813-1-walter-zh.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Walter Wu <walter-zh.wu@mediatek.com>, wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

memmove() and memcpy() have missing underflow issues.
When -7 <= size < 0, then KASAN will miss to catch the underflow issue.
It looks like shadow start address and shadow end address is the same,
so it does not actually check anything.

The following test is indeed not caught by KASAN:

	char *p = kmalloc(64, GFP_KERNEL);
	memset((char *)p, 0, 64);
	memmove((char *)p, (char *)p + 4, -2);
	kfree((char*)p);

It should be checked here:

void *memmove(void *dest, const void *src, size_t len)
{
	check_memory_region((unsigned long)src, len, false, _RET_IP_);
	check_memory_region((unsigned long)dest, len, true, _RET_IP_);

	return __memmove(dest, src, len);
}

We fix the shadow end address which is calculated, then generic KASAN
get the right shadow end address and detect this underflow issue.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=199341

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Reported-by: Dmitry Vyukov <dvyukov@google.com>
---
 lib/test_kasan.c   | 36 ++++++++++++++++++++++++++++++++++++
 mm/kasan/generic.c |  8 ++++++--
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/lib/test_kasan.c b/lib/test_kasan.c
index b63b367a94e8..8bd014852556 100644
--- a/lib/test_kasan.c
+++ b/lib/test_kasan.c
@@ -280,6 +280,40 @@ static noinline void __init kmalloc_oob_in_memset(void)
 	kfree(ptr);
 }
 
+static noinline void __init kmalloc_oob_in_memmove_underflow(void)
+{
+	char *ptr;
+	size_t size = 64;
+
+	pr_info("underflow out-of-bounds in memmove\n");
+	ptr = kmalloc(size, GFP_KERNEL);
+	if (!ptr) {
+		pr_err("Allocation failed\n");
+		return;
+	}
+
+	memset((char *)ptr, 0, 64);
+	memmove((char *)ptr, (char *)ptr + 4, -2);
+	kfree(ptr);
+}
+
+static noinline void __init kmalloc_oob_in_memmove_overflow(void)
+{
+	char *ptr;
+	size_t size = 64;
+
+	pr_info("overflow out-of-bounds in memmove\n");
+	ptr = kmalloc(size, GFP_KERNEL);
+	if (!ptr) {
+		pr_err("Allocation failed\n");
+		return;
+	}
+
+	memset((char *)ptr, 0, 64);
+	memmove((char *)ptr + size, (char *)ptr, 2);
+	kfree(ptr);
+}
+
 static noinline void __init kmalloc_uaf(void)
 {
 	char *ptr;
@@ -734,6 +768,8 @@ static int __init kmalloc_tests_init(void)
 	kmalloc_oob_memset_4();
 	kmalloc_oob_memset_8();
 	kmalloc_oob_memset_16();
+	kmalloc_oob_in_memmove_underflow();
+	kmalloc_oob_in_memmove_overflow();
 	kmalloc_uaf();
 	kmalloc_uaf_memset();
 	kmalloc_uaf2();
diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index 616f9dd82d12..34ca23d59e67 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -131,9 +131,13 @@ static __always_inline bool memory_is_poisoned_n(unsigned long addr,
 						size_t size)
 {
 	unsigned long ret;
+	void *shadow_start = kasan_mem_to_shadow((void *)addr);
+	void *shadow_end = kasan_mem_to_shadow((void *)addr + size - 1) + 1;
 
-	ret = memory_is_nonzero(kasan_mem_to_shadow((void *)addr),
-			kasan_mem_to_shadow((void *)addr + size - 1) + 1);
+	if ((long)size < 0)
+		shadow_end = kasan_mem_to_shadow((void *)addr + size);
+
+	ret = memory_is_nonzero(shadow_start, shadow_end);
 
 	if (unlikely(ret)) {
 		unsigned long last_byte = addr + size - 1;
-- 
2.18.0
