From: Stanley Chu <stanley.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v1 1/3] scsi: core: allow auto suspend override by low-level
 driver
Date: Wed, 11 Sep 2019 17:41:28 +0800
Message-ID: <1568194890-24439-2-git-send-email-stanley.chu@mediatek.com>
References: <1568194890-24439-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1568194890-24439-1-git-send-email-stanley.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-scsi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, martin.petersen-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, avri.altman-Sjgp3cTcYWE@public.gmane.org, alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pedrom.sousa-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, sthumma-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, jejb-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org, bvanassche-HInyCGIudOg@public.gmane.org
Cc: marc.w.gonzalez-GANU6spQydw@public.gmane.org, andy.teng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chun-hung.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, kuohong.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, evgreen-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, subhashj-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, peter.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, vivek.gautam-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Stanley Chu <stanley.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, beanhuo-AL4WhLSQfzjQT0dZR+AlfA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Rework from previous work by:
Sujit Reddy Thumma <sthumma-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>

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

Signed-off-by: Stanley Chu <stanley.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/scsi/scsi_sysfs.c  | 3 ++-
 drivers/scsi/sd.c          | 3 +++
 include/scsi/scsi_device.h | 2 +-
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
index 64c96c7828ee..66a8a5c74352 100644
--- a/drivers/scsi/scsi_sysfs.c
+++ b/drivers/scsi/scsi_sysfs.c
@@ -1300,7 +1300,8 @@ int scsi_sysfs_add_sdev(struct scsi_device *sdev)
 	device_enable_async_suspend(&sdev->sdev_gendev);
 	scsi_autopm_get_target(starget);
 	pm_runtime_set_active(&sdev->sdev_gendev);
-	pm_runtime_forbid(&sdev->sdev_gendev);
+	if (sdev->rpm_autosuspend_delay <= 0)
+		pm_runtime_forbid(&sdev->sdev_gendev);
 	pm_runtime_enable(&sdev->sdev_gendev);
 	scsi_autopm_put_target(starget);
 
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 149d406aacc9..2218d57c4c0c 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -3371,6 +3371,9 @@ static int sd_probe(struct device *dev)
 	}
 
 	blk_pm_runtime_init(sdp->request_queue, dev);
+	if (sdp->rpm_autosuspend_delay > 0)
+		pm_runtime_set_autosuspend_delay(dev,
+						 sdp->rpm_autosuspend_delay);
 	device_add_disk(dev, gd, NULL);
 	if (sdkp->capacity)
 		sd_dif_config_host(sdkp);
diff --git a/include/scsi/scsi_device.h b/include/scsi/scsi_device.h
index 202f4d6a4342..133b282fae5a 100644
--- a/include/scsi/scsi_device.h
+++ b/include/scsi/scsi_device.h
@@ -199,7 +199,7 @@ struct scsi_device {
 	unsigned broken_fua:1;		/* Don't set FUA bit */
 	unsigned lun_in_cdb:1;		/* Store LUN bits in CDB[1] */
 	unsigned unmap_limit_for_ws:1;	/* Use the UNMAP limit for WRITE SAME */
-
+	int rpm_autosuspend_delay;
 	atomic_t disk_events_disable_depth; /* disable depth for disk events */
 
 	DECLARE_BITMAP(supported_events, SDEV_EVT_MAXBITS); /* supported events */
-- 
2.18.0
