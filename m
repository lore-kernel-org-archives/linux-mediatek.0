From: Chunhui Li <chunhui.li@mediatek.com>
Subject: [PATCH] fs: seq_buf_alloc use vmalloc for high order allocations
Date: Wed, 5 Apr 2017 09:29:04 +0800
Message-ID: <20170405012904.1469-1-chunhui.li@mediatek.com>
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
To: Alexander Viro <viro@zeniv.linux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, "chunhui.li" <chunhui.li@mediatek.com>, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: "chunhui.li" <chunhui.li@mediatek.com>

For high order allocations, use vmalloc() to reduce physically
contiguous memory consumption and avoid memory fragmentation issues

Signed-off-by: chunhui.li <chunhui.li@mediatek.com>
---
 fs/seq_file.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/fs/seq_file.c b/fs/seq_file.c
index ca69fb9..4527e79 100644
--- a/fs/seq_file.c
+++ b/fs/seq_file.c
@@ -26,19 +26,17 @@ static void seq_set_overflow(struct seq_file *m)
 static void *seq_buf_alloc(unsigned long size)
 {
 	void *buf;
-	gfp_t gfp = GFP_KERNEL;
 
 	/*
-	 * For high order allocations, use __GFP_NORETRY to avoid oom-killing -
-	 * it's better to fall back to vmalloc() than to kill things.  For small
-	 * allocations, just use GFP_KERNEL which will oom kill, thus no need
-	 * for vmalloc fallback.
-	 */
+	 * For high order allocations, use vmalloc() to reduce physically
+	 * contiguous memory usage and avoid memory fragmentation issue.
+	 * For small allocations, just use GFP_KERNEL
+	 * which will oom kill, thus no need for vmalloc fallback.
+	 */
 	if (size > PAGE_SIZE)
-		gfp |= __GFP_NORETRY | __GFP_NOWARN;
-	buf = kmalloc(size, gfp);
-	if (!buf && size > PAGE_SIZE)
 		buf = vmalloc(size);
+	else
+		buf = kmalloc(size, GFP_KERNEL);
 	return buf;
 }
 
-- 
2.9.2
