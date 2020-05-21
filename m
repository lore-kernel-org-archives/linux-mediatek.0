Return-Path: <SRS0=x8tw=7D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D93C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 17:11:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D93820759
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2020 17:11:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KAGxdRoS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oMC3yZa5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D93820759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVkQm7SFU06Rd1TTrIPD0MrM3/OJfaQYzS4CteAluvU=; b=KAGxdRoS9C9eSK
	twTF3Wzwo3d/79Bskj97ETf/f7Ngk4UYsO5sgUpIzMFDCrz3vBQb9DWczi7fnNq5nONpzPT/jXc1n
	mTfV11urURN1F6ZpOnnb7wi/Mj0/V+52T0khOBrl4F3O9+BJurTGOhuVnF8hanWa411vjF3QXyTMM
	1gd5H8fTD9uvjLjMh1G0rb5bogksGFdNdNULd8Exb2CEX1l4iJbjLTQxyvrJA/hmNI8FqO2tUaXpS
	3EnJi9rPfU5karWvSVlnzG9bULJp0f0DHiQJnO3zQWRdp0t8dI+mlXp1CMXKvJOPH1oudrlIdUZMY
	7XSPLWTTTLCzDk/YesQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jboiy-0006XE-QA; Thu, 21 May 2020 17:11:16 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jboio-0006OR-OF
 for linux-mediatek@lists.infradead.org; Thu, 21 May 2020 17:11:08 +0000
Received: by mail-wr1-x444.google.com with SMTP id g12so6197947wrw.1
 for <linux-mediatek@lists.infradead.org>; Thu, 21 May 2020 10:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2YwOR8lo9fEQo3/VcqBff/dFzuaCVkdrHNiMan7lYfs=;
 b=oMC3yZa52bcy2SsjHm4z8NPHD/7aVhSHTn2dQ2SQPI4UnBbD0Y4efwbIVa1l5oFepl
 gu+7e/bcOEIIAgqMME/+6QShCYVw/0M28lZztpLVGnVct+JCiM/xqiBnYgCTPsJhrdOs
 79Kktj7vtSesuSDdFJcNZF8FxFcThWWKu5FyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2YwOR8lo9fEQo3/VcqBff/dFzuaCVkdrHNiMan7lYfs=;
 b=OOnWC/C7JiSdts2A1ZJ+E23hhsLz81PybQPWgByyj4w998P+ZiGy8fy0i/U21lzdWY
 YPIjzCaeRegPBHroN6GyubDl0yWsTKX/ylAXKZywTRe3RjkezR9WogfilNGwmVuJzh2n
 2yjAnebri9ahUmgq2havAx9znTBTFmkgafOKkVjPoPc1fajqmgIgsaVk5UNVsohwMTBt
 bryLi0PNvVNlcw/Sr/9uWnU3w9oNoHRdl10DmowPZZ8qHfM5ifBio7vWlbeITLixzL5t
 WLquDZmTJfdiR02TWxXlm4RL3FMQhinKLeueCcZ9Y3oSM1zogHj5+JA2zwF6G9Qx8IJQ
 3jKg==
X-Gm-Message-State: AOAM5329ZVVeUyIYp/cMtqGVue8C+weZ9WSCJH6NeHT9m55PTrO96+mR
 WppQmluJuZKLg8PF3Oiau3aAAg==
X-Google-Smtp-Source: ABdhPJyalFzY/329jsR0udLrkGAaMOvnHOWO2TScGUsIP0HOjdvvEOY1hhpVY3V7qytj0Q9F7A/KTw==
X-Received: by 2002:a5d:44c6:: with SMTP id z6mr2368580wrr.20.1590081064371;
 Thu, 21 May 2020 10:11:04 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id 81sm7682882wme.16.2020.05.21.10.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 10:11:03 -0700 (PDT)
Date: Thu, 21 May 2020 17:11:01 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>,
 Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [RFC PATCH V4 1/4] media: v4l2-mem2mem: add v4l2_m2m_suspend,
 v4l2_m2m_resume
Message-ID: <20200521171101.GA243874@chromium.org>
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <20191204124732.10932-2-Jerry-Ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204124732.10932-2-Jerry-Ch.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_101106_810228_A81796D5 
X-CRM114-Status: GOOD (  21.15  )
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

Hi Jerry,

On Wed, Dec 04, 2019 at 08:47:29PM +0800, Jerry-ch Chen wrote:
> From: Pi-Hsun Shih <pihsun@chromium.org>
> 
> Add two functions that can be used to stop new jobs from being queued /
> continue running queued job. This can be used while a driver using m2m
> helper is going to suspend / wake up from resume, and can ensure that
> there's no job running in suspend process.
> 
> BUG=b:143046833
> TEST=build
> 
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>
> ---
>  drivers/media/v4l2-core/v4l2-mem2mem.c | 40 ++++++++++++++++++++++++++
>  include/media/v4l2-mem2mem.h           | 22 ++++++++++++++
>  2 files changed, 62 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> index 5bbdec55b7d7..76ba203e0035 100644
> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> @@ -47,6 +47,10 @@ module_param(debug, bool, 0644);
>  #define TRANS_ABORT		(1 << 2)
>  
>  
> +/* The job queue is not running new jobs */
> +#define QUEUE_PAUSED		(1 << 0)
> +
> +
>  /* Offset base for buffers on the destination queue - used to distinguish
>   * between source and destination buffers when mmapping - they receive the same
>   * offsets but for different queues */
> @@ -88,6 +92,7 @@ static const char * const m2m_entity_name[] = {
>   * @job_queue:		instances queued to run
>   * @job_spinlock:	protects job_queue
>   * @job_work:		worker to run queued jobs.
> + * @job_queue_flags:	flags of the queue status, %QUEUE_PAUSED.
>   * @m2m_ops:		driver callbacks
>   */
>  struct v4l2_m2m_dev {
> @@ -105,6 +110,7 @@ struct v4l2_m2m_dev {
>  	struct list_head	job_queue;
>  	spinlock_t		job_spinlock;
>  	struct work_struct	job_work;
> +	unsigned long		job_queue_flags;
>  
>  	const struct v4l2_m2m_ops *m2m_ops;
>  };
> @@ -267,6 +273,12 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
>  		return;
>  	}
>  
> +	if (m2m_dev->job_queue_flags & QUEUE_PAUSED) {
> +		spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +		dprintk("Running new jobs is paused\n");
> +		return;
> +	}
> +
>  	m2m_dev->curr_ctx = list_first_entry(&m2m_dev->job_queue,
>  				   struct v4l2_m2m_ctx, queue);
>  	m2m_dev->curr_ctx->job_flags |= TRANS_RUNNING;
> @@ -447,6 +459,34 @@ void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
>  }
>  EXPORT_SYMBOL(v4l2_m2m_job_finish);
>  
> +void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
> +{
> +	unsigned long flags;
> +	struct v4l2_m2m_ctx *curr_ctx;
> +
> +	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> +	m2m_dev->job_queue_flags |= QUEUE_PAUSED;
> +	curr_ctx = m2m_dev->curr_ctx;
> +	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +
> +	if (curr_ctx)
> +		wait_event(curr_ctx->finished,
> +			   !(curr_ctx->job_flags & TRANS_RUNNING));
> +}
> +EXPORT_SYMBOL(v4l2_m2m_suspend);
> +
> +void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> +	m2m_dev->job_queue_flags &= ~QUEUE_PAUSED;
> +	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> +
> +	v4l2_m2m_try_run(m2m_dev);
> +}
> +EXPORT_SYMBOL(v4l2_m2m_resume);
> +
>  int v4l2_m2m_reqbufs(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
>  		     struct v4l2_requestbuffers *reqbufs)
>  {
> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> index 5467264771ec..119a195da390 100644
> --- a/include/media/v4l2-mem2mem.h
> +++ b/include/media/v4l2-mem2mem.h
> @@ -183,6 +183,28 @@ v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state)
>  	vb2_buffer_done(&buf->vb2_buf, state);
>  }
>  
> +/**
> + * v4l2_m2m_suspend() - stop new jobs from being run and wait for current job
> + * to finish
> + *
> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> + *
> + * Called by a driver in the suspend hook. Stop new jobs from being run, and
> + * wait for current running job to finish.
> + */
> +void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev);
> +
> +/**
> + * v4l2_m2m_resume() - resume job running and try to run a queued job
> + *
> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> + *
> + * Called by a driver in the resume hook. This reverts the operation of
> + * v4l2_m2m_suspend() and allows job to be run. Also try to run a queued job if
> + * there is any.
> + */
> +void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev);
> +
>  /**
>   * v4l2_m2m_reqbufs() - multi-queue-aware REQBUFS multiplexer
>   *
> -- 
> 2.18.0

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

[Corrected Hans's email address.]
Hans, does this look good to you?

Best regards,
Tomasz


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
