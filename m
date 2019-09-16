From: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v2 1/3] scsi: core: allow auto suspend override by
 low-level driver
Date: Mon, 16 Sep 2019 14:38:25 +0800
Message-ID: <1568615905.16730.21.camel@mtkswgap22>
References: <1568270135-32442-1-git-send-email-stanley.chu@mediatek.com>
 <1568270135-32442-2-git-send-email-stanley.chu@mediatek.com>
 <485731ed-d455-dbb2-0cd5-3110ff14f6b7@acm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <485731ed-d455-dbb2-0cd5-3110ff14f6b7@acm.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bart Van Assche <bvanassche@acm.org>
Cc: "sthumma@codeaurora.org" <sthumma@codeaurora.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "vivek.gautam@codeaurora.org" <vivek.gautam@codeaurora.org>, "subhashj@codeaurora.org" <subhashj@codeaurora.org>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>, Chun-Hung Wu =?UTF-8?Q?=28=E5=B7=AB=E9=A7=BF=E5=AE=8F=29?= <Chun-hung.Wu@mediatek.com>, Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?= <kuohong.wang@mediatek.com>, "evgreen@chromium.org" <evgreen@chromium.org>, "avri.altman@wdc.com" <avri.altman@wdc.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Peter Wang =?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=8F=8B=29?= <peter.wang@mediatek.com>, "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, Andy
List-Id: linux-mediatek@lists.infradead.org

Hi Bart,

> > -	pm_runtime_forbid(&sdev->sdev_gendev);
> > +	if (sdev->rpm_autosuspend_delay < 0)
> > +		pm_runtime_forbid(&sdev->sdev_gendev);
> >  	pm_runtime_enable(&sdev->sdev_gendev);
> >  	scsi_autopm_put_target(starget);
> 
> So we have a single new struct member, rpm_autosuspend_delay, that
> controls two different behaviors: (a) whether or not runtime suspend is
> enabled at device creation time and (b) the power management autosuspend
> delay. I don't like this. Should two separate variables be introduced
> instead of using a single variable to control both behaviors?
> 

OK! Will try to separate different variables to control different things
in next version.

> > diff --git a/include/scsi/scsi_device.h b/include/scsi/scsi_device.h
> > index 202f4d6a4342..133b282fae5a 100644
> > --- a/include/scsi/scsi_device.h
> > +++ b/include/scsi/scsi_device.h
> > @@ -199,7 +199,7 @@ struct scsi_device {
> >  	unsigned broken_fua:1;		/* Don't set FUA bit */
> >  	unsigned lun_in_cdb:1;		/* Store LUN bits in CDB[1] */
> >  	unsigned unmap_limit_for_ws:1;	/* Use the UNMAP limit for WRITE SAME */
> > -
> > +	int rpm_autosuspend_delay;
> >  	atomic_t disk_events_disable_depth; /* disable depth for disk events */
> >  
> >  	DECLARE_BITMAP(supported_events, SDEV_EVT_MAXBITS); /* supported events */
> > 
> 
> Since the default value for the autosuspend delay is the same for all
> SCSI devices attached to a SCSI host is the same, please add a variable
> with the same name in the SCSI host template and use that value as the
> default value for SCSI devices. If the rpm_autosuspend_delay variable
> only occurs in struct scsi_device then LLD authors are forced to
> introduce a slave_configure function. Introducing such a function can be
> avoided if the default autosuspend delay can be specified in the host
> template.
> 

Sounds reasonable. Will create a member indicating autosuspend delay for
the same SCSI host in SCSI host template in next version.

> Bart.
> 

Thanks,
Stanley
