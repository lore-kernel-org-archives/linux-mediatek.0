From: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v3 1/3] scsi: core: allow auto suspend override by
 low-level driver
Date: Mon, 16 Sep 2019 23:55:36 +0800
Message-ID: <1568649336.16730.22.camel@mtkswgap22>
References: <1568616437-16271-1-git-send-email-stanley.chu@mediatek.com>
 <1568616437-16271-2-git-send-email-stanley.chu@mediatek.com>
 <bebea62f-8ab0-528f-5634-9b3c06f47ef7@acm.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <bebea62f-8ab0-528f-5634-9b3c06f47ef7@acm.org>
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
Cc: "sthumma@codeaurora.org" <sthumma@codeaurora.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, "marc.w.gonzalez@free.fr" <marc.w.gonzalez@free.fr>, "vivek.gautam@codeaurora.org" <vivek.gautam@codeaurora.org>, "kernel-team@android.com" <kernel-team@android.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>, Chun-Hung Wu =?UTF-8?Q?=28=E5=B7=AB=E9=A7=BF=E5=AE=8F=29?= <Chun-hung.Wu@mediatek.com>, Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?= <kuohong.wang@mediatek.com>, "subhashj@codeaurora.org" <subhashj@codeaurora.org>, "evgreen@chromium.org" <evgreen@chromium.org>, "avri.altman@wdc.com" <avri.altman@wdc.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Peter Wang =?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=8F=8B=29?= <peter.wang@mediatek.com>, alim.akhtar@samsung.
List-Id: linux-mediatek@lists.infradead.org

Hi Bart,

> > -
> > +	unsigned rpm_autosuspend_on:1;	/* Runtime autosuspend */
> >   	atomic_t disk_events_disable_depth; /* disable depth for disk events */
>     The "_on" part in the variable name "rpm_autosuspend_on" is probably 
> redundant and the comment could have been more elaborate. Anyway:

OK! Thanks for suggestions. Will fix both in next version.

> 
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>

Thanks,
Stanley
