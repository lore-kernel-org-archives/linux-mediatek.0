From: Stanley Chu <stanley.chu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2] scsi: allow auto suspend override by low-level driver
Date: Thu, 12 Sep 2019 14:35:32 +0800
Message-ID: <1568270135-32442-1-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
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

Until now the scsi mid-layer forbids runtime suspend till userspace
enables it. This is mainly to quarantine some disks with broken
runtime power management or have high latencies executing suspend
resume callbacks. If the userspace doesn't enable the runtime suspend
the underlying hardware will be always on even when it is not doing
any useful work and thus wasting power.

Some low-level drivers for the controllers can efficiently use runtime
power management to reduce power consumption and improve battery life.

This patchset allows runtime suspend parameters override within the LLD itself
instead of waiting for userspace to control the power management, and
make UFS as the first user of this capability.

v1 => v2:
- Allow "zero" sdev->rpm_autosuspend_delay (Avri)
- Fix format of some lines (Avri)

Stanley Chu (3):
  scsi: core: allow auto suspend override by low-level driver
  scsi: ufs: override auto suspend tunables for ufs
  scsi: ufs-mediatek: enable auto suspend capability

 drivers/scsi/scsi_scan.c        |  6 ++++++
 drivers/scsi/scsi_sysfs.c       |  3 ++-
 drivers/scsi/sd.c               |  4 ++++
 drivers/scsi/ufs/ufs-mediatek.c |  7 +++++++
 drivers/scsi/ufs/ufshcd.c       |  8 ++++++++
 drivers/scsi/ufs/ufshcd.h       | 10 ++++++++++
 include/scsi/scsi_device.h      |  2 +-
 7 files changed, 38 insertions(+), 2 deletions(-)

-- 
2.18.0
