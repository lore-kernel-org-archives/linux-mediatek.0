From: Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH v2 1/3] scsi: core: allow auto suspend override by
 low-level driver
Date: Thu, 12 Sep 2019 14:43:44 +0100
Message-ID: <485731ed-d455-dbb2-0cd5-3110ff14f6b7@acm.org>
References: <1568270135-32442-1-git-send-email-stanley.chu@mediatek.com>
 <1568270135-32442-2-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1568270135-32442-2-git-send-email-stanley.chu@mediatek.com>
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
To: Stanley Chu <stanley.chu@mediatek.com>, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, pedrom.sousa@synopsys.com, sthumma@codeaurora.org, jejb@linux.ibm.com
Cc: marc.w.gonzalez@free.fr, andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com, evgreen@chromium.org, subhashj@codeaurora.org, linux-mediatek@lists.infradead.org, peter.wang@mediatek.com, vivek.gautam@codeaurora.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
List-Id: linux-mediatek@lists.infradead.org

On 9/12/19 7:35 AM, Stanley Chu wrote:
> diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
> index 64c96c7828ee..461aafadd208 100644
> --- a/drivers/scsi/scsi_sysfs.c
> +++ b/drivers/scsi/scsi_sysfs.c
> @@ -1300,7 +1300,8 @@ int scsi_sysfs_add_sdev(struct scsi_device *sdev)
>  	device_enable_async_suspend(&sdev->sdev_gendev);
>  	scsi_autopm_get_target(starget);
>  	pm_runtime_set_active(&sdev->sdev_gendev);
> -	pm_runtime_forbid(&sdev->sdev_gendev);
> +	if (sdev->rpm_autosuspend_delay < 0)
> +		pm_runtime_forbid(&sdev->sdev_gendev);
>  	pm_runtime_enable(&sdev->sdev_gendev);
>  	scsi_autopm_put_target(starget);

So we have a single new struct member, rpm_autosuspend_delay, that
controls two different behaviors: (a) whether or not runtime suspend is
enabled at device creation time and (b) the power management autosuspend
delay. I don't like this. Should two separate variables be introduced
instead of using a single variable to control both behaviors?

> diff --git a/include/scsi/scsi_device.h b/include/scsi/scsi_device.h
> index 202f4d6a4342..133b282fae5a 100644
> --- a/include/scsi/scsi_device.h
> +++ b/include/scsi/scsi_device.h
> @@ -199,7 +199,7 @@ struct scsi_device {
>  	unsigned broken_fua:1;		/* Don't set FUA bit */
>  	unsigned lun_in_cdb:1;		/* Store LUN bits in CDB[1] */
>  	unsigned unmap_limit_for_ws:1;	/* Use the UNMAP limit for WRITE SAME */
> -
> +	int rpm_autosuspend_delay;
>  	atomic_t disk_events_disable_depth; /* disable depth for disk events */
>  
>  	DECLARE_BITMAP(supported_events, SDEV_EVT_MAXBITS); /* supported events */
> 

Since the default value for the autosuspend delay is the same for all
SCSI devices attached to a SCSI host is the same, please add a variable
with the same name in the SCSI host template and use that value as the
default value for SCSI devices. If the rpm_autosuspend_delay variable
only occurs in struct scsi_device then LLD authors are forced to
introduce a slave_configure function. Introducing such a function can be
avoided if the default autosuspend delay can be specified in the host
template.

Bart.
