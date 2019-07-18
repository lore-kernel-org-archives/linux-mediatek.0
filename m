From: Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH v1] ubifs: support page statistics in vmstat
Date: Thu, 18 Jul 2019 20:03:57 +0800
Message-ID: <1563451437-15725-1-git-send-email-stanley.chu@mediatek.com>
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
To: linux-mtd@lists.infradead.org, richard@nod.at, dedekind1@gmail.com, adrian.hunter@intel.com, matthias.bgg@gmail.com
Cc: linger.lee@mediatek.com, chienwei.chang@mediatek.com, kuohong.wang@mediatek.com, linux-mediatek@lists.infradead.org, Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Currently PGPGIN and PGPGOUT statistics in vmstat is only
hooked in submit_bio() for block device I/O path.

This patch adds this feature for ubifs as well.

Change-Id: I8505bd2a7aa9eadc6abcd68b7d8b870752e71339
Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 fs/ubifs/file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 512e7d9c60cd..ffe7ce77f389 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -902,6 +902,8 @@ static int ubifs_bulk_read(struct page *page)
 
 static int ubifs_readpage(struct file *file, struct page *page)
 {
+	count_vm_events(PGPGIN, PAGE_CACHE_SIZE >> 9);
+
 	if (ubifs_bulk_read(page))
 		return 0;
 	do_readpage(page);
@@ -1032,6 +1034,8 @@ static int ubifs_writepage(struct page *page, struct writeback_control *wbc)
 		goto out_unlock;
 	}
 
+	count_vm_events(PGPGOUT, PAGE_CACHE_SIZE >> 9);
+
 	spin_lock(&ui->ui_lock);
 	synced_i_size = ui->synced_i_size;
 	spin_unlock(&ui->ui_lock);
-- 
2.18.0
