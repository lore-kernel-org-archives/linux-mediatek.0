From: Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH v4 1/3] scsi: core: allow auto suspend override by low-level
 driver
Date: Mon, 16 Sep 2019 23:56:49 +0800
Message-ID: <1568649411-5127-2-git-send-email-stanley.chu@mediatek.com>
References: <1568649411-5127-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1568649411-5127-1-git-send-email-stanley.chu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, pedrom.sousa@synopsys.com, sthumma@codeaurora.org, jejb@linux.ibm.com, bvanassche@acm.org
Cc: marc.w.gonzalez@free.fr, andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com, evgreen@chromium.org, subhashj@codeaurora.org, linux-mediatek@lists.infradead.org, peter.wang@mediatek.com, vivek.gautam@codeaurora.org, matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>, kernel-team@android.com, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
List-Id: linux-mediatek@lists.infradead.org

Rework from previous work by:
Sujit Reddy Thumma <sthumma@codeaurora.org>

Until now the scsi mid-layer forbids runtime suspend till userspace
enables it. This is mainly to quarantine some disks with broken
runtime power management or have high latencies executing suspend
resume callbacks. If the userspace doesn't enable the runtime suspend
the underlying hardware will be always on even when it is not doing
any useful work and thus wasting power.

Some low-level drivers for the controllers can efficiently use runtime
power management to reduce power consumption and improve battery life.
Allow runtime suspend parameters override within the LLD itself
instead of waiting for userspace to control the power management.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/scsi/scsi_sysfs.c  | 3 ++-
 drivers/scsi/sd.c          | 4 ++++
 include/scsi/scsi_device.h | 3 ++-
 include/scsi/scsi_host.h   | 3 +++
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
index 64c96c7828ee..cebb9336c02b 100644
--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@ -1300,7 +1300,8 @@ int scsi_sysfs_add_sdev(struct scsi_device *sdev)
 	device_enable_async_suspend(&sdev->sdev_gendev);
 	scsi_autopm_get_target(starget);
 	pm_runtime_set_active(&sdev->sdev_gendev);
-	pm_runtime_forbid(&sdev->sdev_gendev);
+	if (!sdev->rpm_autosuspend)
+		pm_runtime_forbid(&sdev->sdev_gendev);
 	pm_runtime_enable(&sdev->sdev_gendev);
 	scsi_autopm_put_target(starget);
 
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 149d406aacc9..7358d2b0b2d2 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -3371,6 +3371,10 @@ static int sd_probe(struct device *dev)
 	}
 
 	blk_pm_runtime_init(sdp->request_queue, dev);
+	if (sdp->rpm_autosuspend) {
+		pm_runtime_set_autosuspend_delay(dev,
+			sdp->host->hostt->rpm_autosuspend_delay);
+	}
 	device_add_disk(dev, gd, NULL);
 	if (sdkp->capacity)
 		sd_dif_config_host(sdkp);
diff --git a/include/scsi/scsi_device.h b/include/scsi/scsi_device.h
index 202f4d6a4342..039e289f295e 100644
--- a/include/scsi/scsi_device.h
+++ b/include/scsi/scsi_device.h
@@ -199,7 +199,8 @@ struct scsi_device {
 	unsigned broken_fua:1;		/* Don't set FUA bit */
 	unsigned lun_in_cdb:1;		/* Store LUN bits in CDB[1] */
 	unsigned unmap_limit_for_ws:1;	/* Use the UNMAP limit for WRITE SAME */
-
+	unsigned rpm_autosuspend:1;	/* Enable runtime autosuspend at device
+					 * creation time */
 	atomic_t disk_events_disable_depth; /* disable depth for disk events */
 
 	DECLARE_BITMAP(supported_events, SDEV_EVT_MAXBITS); /* supported events */
diff --git a/include/scsi/scsi_host.h b/include/scsi/scsi_host.h
index cc139dbd71e5..3cb64f0a7e3a 100644
--- a/include/scsi/scsi_host.h
+++ b/include/scsi/scsi_host.h
@@ -474,6 +474,9 @@ struct scsi_host_template {
 	 */
 	unsigned int cmd_size;
 	struct scsi_host_cmd_pool *cmd_pool;
+
+	/* Delay for runtime autosuspend */
+	int rpm_autosuspend_delay;
 };
 
 /*
-- 
2.18.0
