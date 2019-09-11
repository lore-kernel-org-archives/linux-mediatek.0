From: Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH v1 1/2] block: bypass blk_set_runtime_active for uninitialized
 q->dev
Date: Wed, 11 Sep 2019 14:32:41 +0800
Message-ID: <1568183562-18241-2-git-send-email-stanley.chu@mediatek.com>
References: <1568183562-18241-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1568183562-18241-1-git-send-email-stanley.chu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-scsi@vger.kernel.org, linux-block@vger.kernel.org, martin.petersen@oracle.com, axboe@kernel.dk, jejb@linux.ibm.com, matthias.bgg@gmail.com
Cc: andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com, linux-mediatek@lists.infradead.org, peter.wang@mediatek.com, Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Some devices may skip blk_pm_runtime_init() and have null pointer
in its request_queue->dev. For example, SCSI devices of UFS Well-Known
LUNs.

Currently the null pointer is checked by the user of
blk_set_runtime_active(), i.e., scsi_dev_type_resume(). It is better to
check it by blk_set_runtime_active() itself instead of by its users.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 block/blk-pm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/blk-pm.c b/block/blk-pm.c
index 0a028c189897..56ed94f7a2a3 100644
--- a/block/blk-pm.c
+++ b/block/blk-pm.c
@@ -207,6 +207,9 @@ EXPORT_SYMBOL(blk_post_runtime_resume);
  */
 void blk_set_runtime_active(struct request_queue *q)
 {
+	if (!q->dev)
+		return;
+
 	spin_lock_irq(&q->queue_lock);
 	q->rpm_status = RPM_ACTIVE;
 	pm_runtime_mark_last_busy(q->dev);
-- 
2.18.0
