Return-Path: <SRS0=3/N7=7X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15055C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 10:29:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D994B2078C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 10:29:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OCy7bgAx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="OuOrUdIn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D994B2078C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OE4B417UWzA7vQwlbg57is6dSKc1gCnFbB/HmFSxrBE=; b=OCy7bgAxl1V0vq
	LvhnfMVRFRt6lS8nHLAokdZNKRpt1CR//l7iwI2Uy7dB67BMTlL+YlCXOEJVrcUshXQ8YU/7/lVUl
	5ZE7OaDejl3N/OgfGFZZ7Vj8ce8FmIeICNLEZqIPqYWbAtTofoXw0cSQfQvEesojH+cJJa21pbTTF
	oghxI90MeBNKfth50H8s0P/zeFu+YOiOoEO7IajGQ5PNvPSUUT51XnL+GHMcnm9+WU6Gd7fAOsDml
	qCRWqKdRIe7UUcK/4rV4qQnMnoLmEeXMxXF/3rC5+DUhMmj/V8vzGChVcPox/E0MsZ+T+4T0fnwIu
	uWq5iB27llv03ZQbL8XA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jixyp-0006Tv-1P; Wed, 10 Jun 2020 10:29:11 +0000
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jixye-0006LL-LB; Wed, 10 Jun 2020 10:29:02 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id ixyWjgYFiCKzeixyajwFcP; Wed, 10 Jun 2020 12:28:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1591784937; bh=Qmd3Po5WmedPd6SnQS15ReHXur2bmLTHnIR4zy7yoME=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=OuOrUdInufSqMQzHCE6CTrGv5w53ZTR9p0+gjoLzomyoxjSgAkUXQvrcZxZQiiR12
 OfDWSbNU06h/33MFHQoXg7S7nw6WLs9wIAouDW/YqB5jR0eQgoRnDla6endslz4xMB
 Sztk27N3QWisuLoa7DYKBbbmPliFVvutkWgnZ54hU4wIlDyGDixlfFN6HdZmADM244
 2JOhUfQ/vmWQiQY1R9VL+Ffos00eZk3yAbYgNMSDQephICAEFJe3iQVFtmVamPCuk+
 rXGyiaXlGYPw45NjkbwhROW2IT+rrl9rCmrayTE2XDQjVflZbRdXOXgKx7Ke9M5wRb
 t0axYFskIzFCw==
Subject: Re: [RFC PATCH V4 1/4] media: v4l2-mem2mem: add v4l2_m2m_suspend,
 v4l2_m2m_resume
To: Tomasz Figa <tfiga@chromium.org>,
 Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <20191204124732.10932-2-Jerry-Ch.chen@mediatek.com>
 <20200521171101.GA243874@chromium.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <e31fe64a-c5c1-7b1e-eec1-27111fe43ac2@xs4all.nl>
Date: Wed, 10 Jun 2020 12:28:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200521171101.GA243874@chromium.org>
Content-Language: en-US
X-CMAE-Envelope: MS4wfPjvDRwAPuBWAShnkaoy0Ko1HJ/dBfaHGDX6rtabWr+JGzfga9JvRL0Z10aQ1hEni+uuVwBL9NpJlbHqv1Xk/3g6Ii3fEMHWp8W6kf3u1uALpb2Gn9Ao
 QAqUDEgTW2OGCL2CFkzRJPvzV47P+7vm/mf1wEO+hTf/jgPTZLBuMLTo4DSM4YwTSL9CUG4IL8DVfFdKLq8T0Y8PX0uvKd8svILMRVngvwwCw8JA8BiXZxBo
 Iu26+DEFrg0Hc9tclOpaf51WxPfSRwLoi15S3UbAHaBiGa9G78WlIVgoUgP89Sk/EOgNd8P6hlARgeAf8/a9eYojiuOGFDxIhpEp3XuanMMW96e1yGI2h3Ba
 oODjlnzhs8KXcNk4+Qq1Nn06tKrzFPTTnyP9Bo9pqLnWyoOFiZfx/CQgR0z6zMdMkoLjXQGxahk+k2OwPxfQloq6Mf+K3bNynE25GDSLHUR6/flvrQUJ8EOT
 Ynec3fePBQtGaPxWUQm46segEwXUomve1yOK1sjOYJiZlombg3CEZmxLmrEh6Eltw/BcDDuURdl2SrjUAbiEXQxx3REFR992xLvfCqqr8AzsVZgoH3dStTWG
 YUhX4yub2tL3JgDtKE2OtJSI377Buy5UEVZmsILVDp0IVrLoA+Mh6CbzsnSlt7/M4K3saP7ympO8IYRFu1H4PI3n69jwRjUYzySaqguKO+4PR5VOb7qY2ZmT
 MPyvsqUfBgfCzntwyCzk3A019FsIwqhqSfGoWnO5ibXy41Gt071yMqVcQe1Pwob28KMorI0UmVzez3QqSI5VI1nXCRJm6SSGNA8lyjeiyqWp+SqDuHl2JSV3
 ukeiqR4R6rbbCsa3WoLGusGd4lutrXB4WS+tgRveshrLBptlmrl3nc7nFDdX0GjgewYzBwqJckaOqjl/rNnm5WVjFbPCk3e5DFxVMAtp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_032900_832969_A28884F3 
X-CRM114-Status: GOOD (  17.18  )
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
 pihsun@chromium.org, srv_heupstream@mediatek.com,
 Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>,
 jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org,
 linux-mediatek@lists.infradead.org, zwisler@chromium.org,
 frederic.chen@mediatek.com, matthias.bgg@gmail.com, christie.yu@mediatek.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 21/05/2020 19:11, Tomasz Figa wrote:
> Hi Jerry,
> 
> On Wed, Dec 04, 2019 at 08:47:29PM +0800, Jerry-ch Chen wrote:
>> From: Pi-Hsun Shih <pihsun@chromium.org>
>>
>> Add two functions that can be used to stop new jobs from being queued /
>> continue running queued job. This can be used while a driver using m2m
>> helper is going to suspend / wake up from resume, and can ensure that
>> there's no job running in suspend process.
>>
>> BUG=b:143046833
>> TEST=build
>>
>> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
>> Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>
>> ---
>>  drivers/media/v4l2-core/v4l2-mem2mem.c | 40 ++++++++++++++++++++++++++
>>  include/media/v4l2-mem2mem.h           | 22 ++++++++++++++
>>  2 files changed, 62 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
>> index 5bbdec55b7d7..76ba203e0035 100644
>> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
>> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
>> @@ -47,6 +47,10 @@ module_param(debug, bool, 0644);
>>  #define TRANS_ABORT		(1 << 2)
>>  
>>  
>> +/* The job queue is not running new jobs */
>> +#define QUEUE_PAUSED		(1 << 0)
>> +
>> +
>>  /* Offset base for buffers on the destination queue - used to distinguish
>>   * between source and destination buffers when mmapping - they receive the same
>>   * offsets but for different queues */
>> @@ -88,6 +92,7 @@ static const char * const m2m_entity_name[] = {
>>   * @job_queue:		instances queued to run
>>   * @job_spinlock:	protects job_queue
>>   * @job_work:		worker to run queued jobs.
>> + * @job_queue_flags:	flags of the queue status, %QUEUE_PAUSED.
>>   * @m2m_ops:		driver callbacks
>>   */
>>  struct v4l2_m2m_dev {
>> @@ -105,6 +110,7 @@ struct v4l2_m2m_dev {
>>  	struct list_head	job_queue;
>>  	spinlock_t		job_spinlock;
>>  	struct work_struct	job_work;
>> +	unsigned long		job_queue_flags;
>>  
>>  	const struct v4l2_m2m_ops *m2m_ops;
>>  };
>> @@ -267,6 +273,12 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
>>  		return;
>>  	}
>>  
>> +	if (m2m_dev->job_queue_flags & QUEUE_PAUSED) {
>> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>> +		dprintk("Running new jobs is paused\n");
>> +		return;
>> +	}
>> +
>>  	m2m_dev->curr_ctx = list_first_entry(&m2m_dev->job_queue,
>>  				   struct v4l2_m2m_ctx, queue);
>>  	m2m_dev->curr_ctx->job_flags |= TRANS_RUNNING;
>> @@ -447,6 +459,34 @@ void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
>>  }
>>  EXPORT_SYMBOL(v4l2_m2m_job_finish);
>>  
>> +void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
>> +{
>> +	unsigned long flags;
>> +	struct v4l2_m2m_ctx *curr_ctx;
>> +
>> +	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
>> +	m2m_dev->job_queue_flags |= QUEUE_PAUSED;
>> +	curr_ctx = m2m_dev->curr_ctx;
>> +	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>> +
>> +	if (curr_ctx)
>> +		wait_event(curr_ctx->finished,
>> +			   !(curr_ctx->job_flags & TRANS_RUNNING));
>> +}
>> +EXPORT_SYMBOL(v4l2_m2m_suspend);
>> +
>> +void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev)
>> +{
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
>> +	m2m_dev->job_queue_flags &= ~QUEUE_PAUSED;
>> +	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
>> +
>> +	v4l2_m2m_try_run(m2m_dev);
>> +}
>> +EXPORT_SYMBOL(v4l2_m2m_resume);
>> +
>>  int v4l2_m2m_reqbufs(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>>  		     struct v4l2_requestbuffers *reqbufs)
>>  {
>> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
>> index 5467264771ec..119a195da390 100644
>> --- a/include/media/v4l2-mem2mem.h
>> +++ b/include/media/v4l2-mem2mem.h
>> @@ -183,6 +183,28 @@ v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state)
>>  	vb2_buffer_done(&buf->vb2_buf, state);
>>  }
>>  
>> +/**
>> + * v4l2_m2m_suspend() - stop new jobs from being run and wait for current job
>> + * to finish
>> + *
>> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
>> + *
>> + * Called by a driver in the suspend hook. Stop new jobs from being run, and
>> + * wait for current running job to finish.
>> + */
>> +void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev);
>> +
>> +/**
>> + * v4l2_m2m_resume() - resume job running and try to run a queued job
>> + *
>> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
>> + *
>> + * Called by a driver in the resume hook. This reverts the operation of
>> + * v4l2_m2m_suspend() and allows job to be run. Also try to run a queued job if
>> + * there is any.
>> + */
>> +void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev);
>> +
>>  /**
>>   * v4l2_m2m_reqbufs() - multi-queue-aware REQBUFS multiplexer
>>   *
>> -- 
>> 2.18.0
> 
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> 
> [Corrected Hans's email address.]
> Hans, does this look good to you?

Yes, this looks good.

Sorry for the late reply.

I assume this will be part of a future patch series that calls these new functions?

Regards,

	Hans

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
