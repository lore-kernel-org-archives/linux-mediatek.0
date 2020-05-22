Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD017C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 06:02:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A5A72078D
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 06:02:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nibbo/CC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="etQwEyKN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A5A72078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uA+zOBJVwG7RQVJhXsSxvVT1rt34tt1KPFGx5zYdPOE=; b=nibbo/CCh+qt5T
	MdaFM9ZaaPqAycLhG09ZCCeSnaMThRkCHsdlxeYA5ANidmY/7t2TUjTFGvmVHyiWo95Y9rG2oJxwA
	WQw6p1lW1/HXlb/SM1kBs5EdBagP62xm29pMKZbHXyLbqiEa8bjBlKsZ6B/HGNnHJiRc21rB+teww
	zqFwiqJwsTqPIBBcfNiKQ7y8uMsfmM0/0jj1UP3k2XczPLZHjQ8zw7U9mDDQTW7nbscMGOAyPxV1X
	uci/yfP2KnytDmoYa8owkGWzCq9jA8Yn37Dj/9G/9yhMlN0Ti0F4RElMuons0QWb9PXzW6huYfBiH
	HNzZ2bunMPykLJjpC/8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc0ks-0004Nr-Mw; Fri, 22 May 2020 06:02:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc0kg-0004FP-2b; Fri, 22 May 2020 06:01:53 +0000
X-UUID: 3884cfe726374df1ba8a59c7440f9f35-20200521
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qqEHW95WdmSOAWr9riOJVXKketJrkFgXfouzxJOvWDQ=; 
 b=etQwEyKNvFcEhO5WbLfBescJVRQXY9OrUTJ/OABaLscv6yz2Ne0sU9ZXyTJ+gHN+fHQVcJHa8hzdpHzI6TDay5aGngSxMuRb0nA7PVHS7HjgGbSBkhvCDnLidELWkVt6ezLbS0xhjFXTOzb9WCBgkXwsAoSwZjgzh0z9faPSba0=;
X-UUID: 3884cfe726374df1ba8a59c7440f9f35-20200521
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jerry-ch.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1070749144; Thu, 21 May 2020 22:01:29 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 May 2020 23:01:42 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 May 2020 14:01:41 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 May 2020 14:01:41 +0800
Message-ID: <1590127302.27807.3.camel@mtksdccf07>
Subject: Re: [RFC PATCH V4 1/4] media: v4l2-mem2mem: add v4l2_m2m_suspend,
 v4l2_m2m_resume
From: Jerry-ch Chen <Jerry-ch.Chen@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 22 May 2020 14:01:42 +0800
In-Reply-To: <20200521171101.GA243874@chromium.org>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <20191204124732.10932-2-Jerry-Ch.chen@mediatek.com>
 <20200521171101.GA243874@chromium.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_230150_127770_906C0E4A 
X-CRM114-Status: GOOD (  22.56  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com,
 laurent.pinchart+renesas@ideasonboard.com, Rynn.Wu@mediatek.com,
 zwisler@chromium.org, srv_heupstream@mediatek.com,
 Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, jungo.lin@mediatek.com,
 sj.huang@mediatek.com, yuzhao@chromium.org, linux-mediatek@lists.infradead.org,
 pihsun@chromium.org, frederic.chen@mediatek.com, matthias.bgg@gmail.com,
 christie.yu@mediatek.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tomasz,

On Thu, 2020-05-21 at 17:11 +0000, Tomasz Figa wrote:
> Hi Jerry,
> 
> On Wed, Dec 04, 2019 at 08:47:29PM +0800, Jerry-ch Chen wrote:
> > From: Pi-Hsun Shih <pihsun@chromium.org>
> > 
> > Add two functions that can be used to stop new jobs from being queued /
> > continue running queued job. This can be used while a driver using m2m
> > helper is going to suspend / wake up from resume, and can ensure that
> > there's no job running in suspend process.
> > 
> > BUG=b:143046833
> > TEST=build
> > 
> > Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> > Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-mem2mem.c | 40 ++++++++++++++++++++++++++
> >  include/media/v4l2-mem2mem.h           | 22 ++++++++++++++
> >  2 files changed, 62 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > index 5bbdec55b7d7..76ba203e0035 100644
> > --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> > +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > @@ -47,6 +47,10 @@ module_param(debug, bool, 0644);
> >  #define TRANS_ABORT		(1 << 2)
> >  
> >  
> > +/* The job queue is not running new jobs */
> > +#define QUEUE_PAUSED		(1 << 0)
> > +
> > +
> >  /* Offset base for buffers on the destination queue - used to distinguish
> >   * between source and destination buffers when mmapping - they receive the same
> >   * offsets but for different queues */
> > @@ -88,6 +92,7 @@ static const char * const m2m_entity_name[] = {
> >   * @job_queue:		instances queued to run
> >   * @job_spinlock:	protects job_queue
> >   * @job_work:		worker to run queued jobs.
> > + * @job_queue_flags:	flags of the queue status, %QUEUE_PAUSED.
> >   * @m2m_ops:		driver callbacks
> >   */
> >  struct v4l2_m2m_dev {
> > @@ -105,6 +110,7 @@ struct v4l2_m2m_dev {
> >  	struct list_head	job_queue;
> >  	spinlock_t		job_spinlock;
> >  	struct work_struct	job_work;
> > +	unsigned long		job_queue_flags;
> >  
> >  	const struct v4l2_m2m_ops *m2m_ops;
> >  };
> > @@ -267,6 +273,12 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
> >  		return;
> >  	}
> >  
> > +	if (m2m_dev->job_queue_flags & QUEUE_PAUSED) {
> > +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> > +		dprintk("Running new jobs is paused\n");
> > +		return;
> > +	}
> > +
> >  	m2m_dev->curr_ctx = list_first_entry(&m2m_dev->job_queue,
> >  				   struct v4l2_m2m_ctx, queue);
> >  	m2m_dev->curr_ctx->job_flags |= TRANS_RUNNING;
> > @@ -447,6 +459,34 @@ void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
> >  }
> >  EXPORT_SYMBOL(v4l2_m2m_job_finish);
> >  
> > +void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
> > +{
> > +	unsigned long flags;
> > +	struct v4l2_m2m_ctx *curr_ctx;
> > +
> > +	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> > +	m2m_dev->job_queue_flags |= QUEUE_PAUSED;
> > +	curr_ctx = m2m_dev->curr_ctx;
> > +	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> > +
> > +	if (curr_ctx)
> > +		wait_event(curr_ctx->finished,
> > +			   !(curr_ctx->job_flags & TRANS_RUNNING));
> > +}
> > +EXPORT_SYMBOL(v4l2_m2m_suspend);
> > +
> > +void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev)
> > +{
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> > +	m2m_dev->job_queue_flags &= ~QUEUE_PAUSED;
> > +	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> > +
> > +	v4l2_m2m_try_run(m2m_dev);
> > +}
> > +EXPORT_SYMBOL(v4l2_m2m_resume);
> > +
> >  int v4l2_m2m_reqbufs(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
> >  		     struct v4l2_requestbuffers *reqbufs)
> >  {
> > diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> > index 5467264771ec..119a195da390 100644
> > --- a/include/media/v4l2-mem2mem.h
> > +++ b/include/media/v4l2-mem2mem.h
> > @@ -183,6 +183,28 @@ v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state)
> >  	vb2_buffer_done(&buf->vb2_buf, state);
> >  }
> >  
> > +/**
> > + * v4l2_m2m_suspend() - stop new jobs from being run and wait for current job
> > + * to finish
> > + *
> > + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> > + *
> > + * Called by a driver in the suspend hook. Stop new jobs from being run, and
> > + * wait for current running job to finish.
> > + */
> > +void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev);
> > +
> > +/**
> > + * v4l2_m2m_resume() - resume job running and try to run a queued job
> > + *
> > + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> > + *
> > + * Called by a driver in the resume hook. This reverts the operation of
> > + * v4l2_m2m_suspend() and allows job to be run. Also try to run a queued job if
> > + * there is any.
> > + */
> > +void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev);
> > +
> >  /**
> >   * v4l2_m2m_reqbufs() - multi-queue-aware REQBUFS multiplexer
> >   *
> > -- 
> > 2.18.0
> 
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> 
Ok, I've added it in the commit message.

Thanks and Best regards,
Jerry

> [Corrected Hans's email address.]
> Hans, does this look good to you?
> 
> Best regards,
> Tomasz
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
