From: Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH v3] scsi: ufs: fix broken hba->outstanding_tasks
Date: Mon, 19 Aug 2019 21:43:28 +0800
Message-ID: <1566222208-19890-1-git-send-email-stanley.chu@mediatek.com>
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
To: linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, pedrom.sousa@synopsys.com
Cc: marc.w.gonzalez@free.fr, andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com, evgreen@chromium.org, linux-mediatek@lists.infradead.org, peter.wang@mediatek.com, matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
List-Id: linux-mediatek@lists.infradead.org

Currently bits in hba->outstanding_tasks are cleared only after their
corresponding task management commands are successfully done by
__ufshcd_issue_tm_cmd().

If timeout happens in a task management command, its corresponding
bit in hba->outstanding_tasks will not be cleared until next task
management command with the same tag used successfully finishes.

This is wrong and can lead to some issues, like power issue.
For example, ufshcd_release() and ufshcd_gate_work() will do nothing
if hba->outstanding_tasks is not zero even if both UFS host and devices
are actually idle.

Solution is referried from error handling of device commands: bits in
hba->outstanding_tasks shall be cleared regardless of their execution
results.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 3804a704e565..30b752c61b97 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -5676,13 +5676,12 @@ static int __ufshcd_issue_tm_cmd(struct ufs_hba *hba,
 		memcpy(treq, hba->utmrdl_base_addr + free_slot, sizeof(*treq));
 
 		ufshcd_add_tm_upiu_trace(hba, task_tag, "tm_complete");
-
-		spin_lock_irqsave(hba->host->host_lock, flags);
-		__clear_bit(free_slot, &hba->outstanding_tasks);
-		spin_unlock_irqrestore(hba->host->host_lock, flags);
-
 	}
 
+	spin_lock_irqsave(hba->host->host_lock, flags);
+	__clear_bit(free_slot, &hba->outstanding_tasks);
+	spin_unlock_irqrestore(hba->host->host_lock, flags);
+
 	clear_bit(free_slot, &hba->tm_condition);
 	ufshcd_put_tm_slot(hba, free_slot);
 	wake_up(&hba->tm_tag_wq);
-- 
2.18.0
