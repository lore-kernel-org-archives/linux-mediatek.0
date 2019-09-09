From: Walter Wu <walter-zh.wu@mediatek.com>
Subject: [PATCH v2 1/2] mm/page_ext: support to record the last stack of page
Date: Mon, 9 Sep 2019 16:53:39 +0800
Message-ID: <20190909085339.25350-1-walter-zh.wu@mediatek.com>
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
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Martin
 Schwidefsky <schwidefsky@de.ibm.com>, Will Deacon <will@kernel.org>, Andrey
 Konovalov <andreyknvl@google.com>, Arnd Bergmann <arnd@arndb.de>, Thomas
 Gleixner <tglx@linutronix.de>, Michal Hocko <mhocko@kernel.org>, Qian Cai <cai@lca.pw>
Cc: Walter Wu <walter-zh.wu@mediatek.com>, wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

KASAN will record last stack of page in order to help programmer
to see memory corruption caused by page.

What is difference between page_owner and our patch?
page_owner records alloc stack of page, but our patch is to record
last stack(it may be alloc or free stack of page).

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
---
 mm/page_ext.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/page_ext.c b/mm/page_ext.c
index 5f5769c7db3b..7ca33dcd9ffa 100644
--- a/mm/page_ext.c
+++ b/mm/page_ext.c
@@ -65,6 +65,9 @@ static struct page_ext_operations *page_ext_ops[] = {
 #if defined(CONFIG_IDLE_PAGE_TRACKING) && !defined(CONFIG_64BIT)
 	&page_idle_ops,
 #endif
+#ifdef CONFIG_KASAN
+	&page_stack_ops,
+#endif
 };
 
 static unsigned long total_usage;
-- 
2.18.0
