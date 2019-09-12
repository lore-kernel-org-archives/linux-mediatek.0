From: Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH v2 1/2] block: bypass blk_set_runtime_active for uninitialized
 q->dev
Date: Thu, 12 Sep 2019 16:35:27 +0800
Message-ID: <1568277328-4597-2-git-send-email-stanley.chu@mediatek.com>
References: <1568277328-4597-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1568277328-4597-1-git-send-email-stanley.chu@mediatek.com>
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
 block/blk-pm.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/block/blk-pm.c b/block/blk-pm.c
index 0a028c189897..1adc1cd748b4 100644
--- a/block/blk-pm.c
+++ b/block/blk-pm.c
@@ -207,10 +207,12 @@ EXPORT_SYMBOL(blk_post_runtime_resume);
  */
 void blk_set_runtime_active(struct request_queue *q)
 {
-	spin_lock_irq(&q->queue_lock);
-	q->rpm_status = RPM_ACTIVE;
-	pm_runtime_mark_last_busy(q->dev);
-	pm_request_autosuspend(q->dev);
-	spin_unlock_irq(&q->queue_lock);
+	if (q->dev) {
+		spin_lock_irq(&q->queue_lock);
+		q->rpm_status = RPM_ACTIVE;
+		pm_runtime_mark_last_busy(q->dev);
+		pm_request_autosuspend(q->dev);
+		spin_unlock_irq(&q->queue_lock);
+	}
 }
 EXPORT_SYMBOL(blk_set_runtime_active);
-- 
2.18.0
