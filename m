From: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v1 1/2] block: bypass blk_set_runtime_active for
 uninitialized q->dev
Date: Thu, 12 Sep 2019 16:33:12 +0800
Message-ID: <1568277192.16730.16.camel@mtkswgap22>
References: <1568183562-18241-1-git-send-email-stanley.chu@mediatek.com>
 <1568183562-18241-2-git-send-email-stanley.chu@mediatek.com>
 <66fddf12-0dc4-1c73-affd-f8404e87342f@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <66fddf12-0dc4-1c73-affd-f8404e87342f@kernel.dk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jens Axboe <axboe@kernel.dk>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>, Andy Teng =?UTF-8?Q?=28=E9=84=A7=E5=A6=82=E5=AE=8F=29?= <Andy.Teng@mediatek.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>, Chun-Hung Wu =?UTF-8?Q?=28=E5=B7=AB=E9=A7=BF=E5=AE=8F=29?= <Chun-hung.Wu@mediatek.com>, Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?= <kuohong.wang@mediatek.com>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Peter Wang =?UTF-8?Q?=28=E7=8E=8B=E4=BF=A1=E5=8F=8B=29?= <peter.wang@mediatek.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Jens,

> >   void blk_set_runtime_active(struct request_queue *q)
> >   {
> > +	if (!q->dev)
> > +		return;
> > +
> >   	spin_lock_irq(&q->queue_lock);
> >   	q->rpm_status = RPM_ACTIVE;
> >   	pm_runtime_mark_last_busy(q->dev);
> 
> I'd prefer just doing:
> 
> 	if (q->dev) {
> 		...
> 	}
> 
> instead. Other than that little complaint, looks good to me.
> 

OK! I will change it in v2.

Thanks,
Stanley
