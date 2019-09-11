From: Avri Altman <Avri.Altman@wdc.com>
Subject: RE: [PATCH v1 1/3] scsi: core: allow auto suspend override by
 low-level driver
Date: Wed, 11 Sep 2019 10:54:19 +0000
Message-ID: <MN2PR04MB6991142450EEF05E2AF2D8DFFCB10@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <1568194890-24439-1-git-send-email-stanley.chu@mediatek.com>
 <1568194890-24439-2-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1568194890-24439-2-git-send-email-stanley.chu@mediatek.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stanley Chu <stanley.chu@mediatek.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "pedrom.sousa@synopsys.com" <pedrom.sousa@synopsys.com>, "sthumma@codeaurora.org" <sthumma@codeaurora.org>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>, "bvanassche@acm.org" <bvanassche@acm.org>
Cc: "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "andy.teng@mediatek.com" <andy.teng@mediatek.com>, "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>, "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>, "evgreen@chromium.org" <evgreen@chromium.org>, "subhashj@codeaurora.org" <subhashj@codeaurora.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "peter.wang@mediatek.com" <peter.wang@mediatek.com>, "vivek.gautam@codeaurora.org" <vivek.gautam@codeaurora.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "beanhuo@micron.com" <beanhuo@micron.com>
List-Id: linux-mediatek@lists.infradead.org

> 
> Rework from previous work by:
> Sujit Reddy Thumma <sthumma@codeaurora.org>
> 
> Until now the scsi mid-layer forbids runtime suspend till userspace enables it.
> This is mainly to quarantine some disks with broken runtime power
> management or have high latencies executing suspend resume callbacks. If
> the userspace doesn't enable the runtime suspend the underlying hardware
> will be always on even when it is not doing any useful work and thus wasting
> power.
> 
> Some low-level drivers for the controllers can efficiently use runtime power
> management to reduce power consumption and improve battery life.
> Allow runtime suspend parameters override within the LLD itself instead of
> waiting for userspace to control the power management.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>

Stanley hi,
Your series looks fine.
I added some comments/questions - feel free to ignore it.

Thanks,
Avri


> ---
>  drivers/scsi/scsi_sysfs.c  | 3 ++-
>  drivers/scsi/sd.c          | 3 +++
>  include/scsi/scsi_device.h | 2 +-
>  3 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c index
> 64c96c7828ee..66a8a5c74352 100644
> --- a/drivers/scsi/scsi_sysfs.c
> +++ b/drivers/scsi/scsi_sysfs.c
> @@ -1300,7 +1300,8 @@ int scsi_sysfs_add_sdev(struct scsi_device *sdev)
>         device_enable_async_suspend(&sdev->sdev_gendev);
>         scsi_autopm_get_target(starget);
>         pm_runtime_set_active(&sdev->sdev_gendev);
> -       pm_runtime_forbid(&sdev->sdev_gendev);
> +       if (sdev->rpm_autosuspend_delay <= 0)
> +               pm_runtime_forbid(&sdev->sdev_gendev);
>         pm_runtime_enable(&sdev->sdev_gendev);
>         scsi_autopm_put_target(starget);
> 
> diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c index
> 149d406aacc9..2218d57c4c0c 100644
> --- a/drivers/scsi/sd.c
> +++ b/drivers/scsi/sd.c
> @@ -3371,6 +3371,9 @@ static int sd_probe(struct device *dev)
>         }
> 
>         blk_pm_runtime_init(sdp->request_queue, dev);
> +       if (sdp->rpm_autosuspend_delay > 0)
> +               pm_runtime_set_autosuspend_delay(dev, 
> +
Redundant line ?
> + sdp->rpm_autosuspend_delay);
Don't you need to call now pm_runtime_use_autosuspend() ?

>         device_add_disk(dev, gd, NULL);
>         if (sdkp->capacity)
>                 sd_dif_config_host(sdkp); diff --git a/include/scsi/scsi_device.h
> b/include/scsi/scsi_device.h index 202f4d6a4342..133b282fae5a 100644
> --- a/include/scsi/scsi_device.h
> +++ b/include/scsi/scsi_device.h
> @@ -199,7 +199,7 @@ struct scsi_device {
>         unsigned broken_fua:1;          /* Don't set FUA bit */
>         unsigned lun_in_cdb:1;          /* Store LUN bits in CDB[1] */
>         unsigned unmap_limit_for_ws:1;  /* Use the UNMAP limit for WRITE
> SAME */
> -
> +       int rpm_autosuspend_delay;
Can suspend be negative?

>         atomic_t disk_events_disable_depth; /* disable depth for disk events */
> 
>         DECLARE_BITMAP(supported_events, SDEV_EVT_MAXBITS); /*
> supported events */
> --
> 2.18.0
