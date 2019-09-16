From: Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH v3 1/3] scsi: core: allow auto suspend override by
 low-level driver
Date: Mon, 16 Sep 2019 08:16:16 -0700
Message-ID: <bebea62f-8ab0-528f-5634-9b3c06f47ef7@acm.org>
References: <1568616437-16271-1-git-send-email-stanley.chu@mediatek.com>
 <1568616437-16271-2-git-send-email-stanley.chu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1568616437-16271-2-git-send-email-stanley.chu@mediatek.com>
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
Cc: marc.w.gonzalez@free.fr, andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com, evgreen@chromium.org, subhashj@codeaurora.org, linux-mediatek@lists.infradead.org, peter.wang@mediatek.com, vivek.gautam@codeaurora.org, matthias.bgg@gmail.com, kernel-team@android.com, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
List-Id: linux-mediatek@lists.infradead.org

On 9/15/19 11:47 PM, Stanley Chu wrote:
> diff --git a/include/scsi/scsi_device.h b/include/scsi/scsi_device.h
> index 202f4d6a4342..495e30adb53f 100644
> --- a/include/scsi/scsi_device.h
> +++ b/include/scsi/scsi_device.h
> @@ -199,7 +199,7 @@ struct scsi_device {
>   	unsigned broken_fua:1;		/* Don't set FUA bit */
>   	unsigned lun_in_cdb:1;		/* Store LUN bits in CDB[1] */
>   	unsigned unmap_limit_for_ws:1;	/* Use the UNMAP limit for WRITE SAME */
> -
> +	unsigned rpm_autosuspend_on:1;	/* Runtime autosuspend */
>   	atomic_t disk_events_disable_depth; /* disable depth for disk events */
    The "_on" part in the variable name "rpm_autosuspend_on" is probably 
redundant and the comment could have been more elaborate. Anyway:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
