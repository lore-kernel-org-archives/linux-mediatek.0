Return-Path: <SRS0=3/N7=7X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6CAC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 10:33:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C96520760
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 10:33:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JTs+QnfC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l1lc9WvN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C96520760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PicSpy9pwLkAmO35ZzltFSFcRQomqggn8hrx6ILtOoc=; b=JTs+QnfCAfrY/y
	ZrSVUlCjztSvo2dS7GPzLnXvi2HocZk2LgLb+4lpu9kxlg+Ql1/BM1Py/oh8DEiscGwO8wysZynnU
	DUsD3zMy50z6No9QIbwd7+9tszLCGjSjTxVzftl1lG9jTvXhu44QjVdwt4mEQAgxyAC7LJC2yozci
	cOjKSQnavnQKVkdhpCrH8rTZFUX9jMuDGgyHlOoV6k0F1mLcMYjZ0Iku5dfj9UOrfCMT1J6QAhgXy
	yRiOofeast2uXo8A2YL8mB7VfQzvFMHqVYN1yfK1wVQt8vKQ6hK3p3q6mcbOfBqHixr4zBbcPXG1U
	f7rVuPpJPYcEKpTlk4CA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiy2i-0002AB-IO; Wed, 10 Jun 2020 10:33:12 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiy2g-00029o-58
 for linux-mediatek@lists.infradead.org; Wed, 10 Jun 2020 10:33:11 +0000
Received: by mail-ej1-x644.google.com with SMTP id w16so1418913ejj.5
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2020 03:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b4xt9ro4s6EJh9yAJChrfwEE70fQqv8RKm8O5jxwnF8=;
 b=l1lc9WvNx7QdPB4+apffY5SPACt/ijyjhjbYY0C9EkWG3RnABAwn7TKeVaauSy9NMU
 MPhfLiuNtdM7gCzTJw6ftAbcxtZY2ersGZ0blDLT2GHrZiBZgnN0CO2oE5ddHmxZvIWd
 jimEGBuvkuu8oPARZ7ltp1pHctgWaMHIOf8o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b4xt9ro4s6EJh9yAJChrfwEE70fQqv8RKm8O5jxwnF8=;
 b=XfNMTxSmVTTJ9bhsJbOVP6VFG1PIhopAG5bf4CtIMvNB+2Elpi+3SdVQhH5JmxrSTg
 7L1tBnNIhETSwRM5ewlnCvn9oND3HoZmyfP0RKabekaJodromFOWJZjprGdRrSFDxRrK
 nRCeUe73nqRLg7FZemZk4cP1uqbWXz37GEuHgwyozgXtK+dVJcc/b+7mgcEhBFSn8PQw
 3OTEkPdACUZZufrEqyDFG/lkfcbPiNaU4wTpojW0akJSLgOW8dnjfsZgcdSpOhftBKFY
 cRC0GvtrMA84yxEq/IC1f6Xi5qkn+Ag1lJadQw/SkVa6WHqNvjmBnnb1oHUiq6A912jE
 obYA==
X-Gm-Message-State: AOAM5310RGV13kh7Rm15XsZwBLysDhZfXbVK1de68L8fM+TOrmgjtYQD
 fqPeL9Ebmo40PDDj0orf9Vy3DFfzsJ0UKg==
X-Google-Smtp-Source: ABdhPJy0hhjCXgUweyTeivbYIoTE9+EEEMb72eBhZZUxMQdS4KYqAhm/HxZSn1vdAOCLxH049RLXog==
X-Received: by 2002:a17:906:1d56:: with SMTP id
 o22mr2650746ejh.406.1591785188082; 
 Wed, 10 Jun 2020 03:33:08 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id i21sm14802286ejd.51.2020.06.10.03.33.07
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 03:33:07 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id t18so1656480wru.6
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2020 03:33:07 -0700 (PDT)
X-Received: by 2002:adf:e2ce:: with SMTP id d14mr2923508wrj.415.1591785187039; 
 Wed, 10 Jun 2020 03:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20191204124732.10932-1-Jerry-Ch.chen@mediatek.com>
 <20191204124732.10932-2-Jerry-Ch.chen@mediatek.com>
 <20200521171101.GA243874@chromium.org>
 <e31fe64a-c5c1-7b1e-eec1-27111fe43ac2@xs4all.nl>
In-Reply-To: <e31fe64a-c5c1-7b1e-eec1-27111fe43ac2@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 10 Jun 2020 12:32:56 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Ad_cnv0qztZOk9c2H0Y+XO6tRcRmS1t4dBw5qbG-d8Nw@mail.gmail.com>
Message-ID: <CAAFQd5Ad_cnv0qztZOk9c2H0Y+XO6tRcRmS1t4dBw5qbG-d8Nw@mail.gmail.com>
Subject: Re: [RFC PATCH V4 1/4] media: v4l2-mem2mem: add v4l2_m2m_suspend,
 v4l2_m2m_resume
To: Hans Verkuil <hverkuil@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_033310_220652_D8265D0E 
X-CRM114-Status: GOOD (  23.87  )
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
Cc: linux-devicetree <devicetree@vger.kernel.org>,
 =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <Sean.Cheng@mediatek.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?B?UnlubiBXdSAo5ZCz6IKy5oGpKQ==?= <Rynn.Wu@mediatek.com>,
 zwisler@chromium.org, srv_heupstream <srv_heupstream@mediatek.com>,
 Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>,
 Jerry-ch Chen <Jerry-Ch.chen@mediatek.com>,
 =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
 Sj Huang <sj.huang@mediatek.com>, yuzhao@chromium.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>,
 =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= <frederic.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= <christie.yu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jun 10, 2020 at 12:29 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 21/05/2020 19:11, Tomasz Figa wrote:
> > Hi Jerry,
> >
> > On Wed, Dec 04, 2019 at 08:47:29PM +0800, Jerry-ch Chen wrote:
> >> From: Pi-Hsun Shih <pihsun@chromium.org>
> >>
> >> Add two functions that can be used to stop new jobs from being queued /
> >> continue running queued job. This can be used while a driver using m2m
> >> helper is going to suspend / wake up from resume, and can ensure that
> >> there's no job running in suspend process.
> >>
> >> BUG=b:143046833
> >> TEST=build
> >>
> >> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> >> Signed-off-by: Jerry-ch Chen <jerry-ch.chen@mediatek.corp-partner.google.com>
> >> ---
> >>  drivers/media/v4l2-core/v4l2-mem2mem.c | 40 ++++++++++++++++++++++++++
> >>  include/media/v4l2-mem2mem.h           | 22 ++++++++++++++
> >>  2 files changed, 62 insertions(+)
> >>
> >> diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> >> index 5bbdec55b7d7..76ba203e0035 100644
> >> --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> >> +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> >> @@ -47,6 +47,10 @@ module_param(debug, bool, 0644);
> >>  #define TRANS_ABORT         (1 << 2)
> >>
> >>
> >> +/* The job queue is not running new jobs */
> >> +#define QUEUE_PAUSED                (1 << 0)
> >> +
> >> +
> >>  /* Offset base for buffers on the destination queue - used to distinguish
> >>   * between source and destination buffers when mmapping - they receive the same
> >>   * offsets but for different queues */
> >> @@ -88,6 +92,7 @@ static const char * const m2m_entity_name[] = {
> >>   * @job_queue:              instances queued to run
> >>   * @job_spinlock:   protects job_queue
> >>   * @job_work:               worker to run queued jobs.
> >> + * @job_queue_flags:        flags of the queue status, %QUEUE_PAUSED.
> >>   * @m2m_ops:                driver callbacks
> >>   */
> >>  struct v4l2_m2m_dev {
> >> @@ -105,6 +110,7 @@ struct v4l2_m2m_dev {
> >>      struct list_head        job_queue;
> >>      spinlock_t              job_spinlock;
> >>      struct work_struct      job_work;
> >> +    unsigned long           job_queue_flags;
> >>
> >>      const struct v4l2_m2m_ops *m2m_ops;
> >>  };
> >> @@ -267,6 +273,12 @@ static void v4l2_m2m_try_run(struct v4l2_m2m_dev *m2m_dev)
> >>              return;
> >>      }
> >>
> >> +    if (m2m_dev->job_queue_flags & QUEUE_PAUSED) {
> >> +            spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> >> +            dprintk("Running new jobs is paused\n");
> >> +            return;
> >> +    }
> >> +
> >>      m2m_dev->curr_ctx = list_first_entry(&m2m_dev->job_queue,
> >>                                 struct v4l2_m2m_ctx, queue);
> >>      m2m_dev->curr_ctx->job_flags |= TRANS_RUNNING;
> >> @@ -447,6 +459,34 @@ void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
> >>  }
> >>  EXPORT_SYMBOL(v4l2_m2m_job_finish);
> >>
> >> +void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
> >> +{
> >> +    unsigned long flags;
> >> +    struct v4l2_m2m_ctx *curr_ctx;
> >> +
> >> +    spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> >> +    m2m_dev->job_queue_flags |= QUEUE_PAUSED;
> >> +    curr_ctx = m2m_dev->curr_ctx;
> >> +    spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> >> +
> >> +    if (curr_ctx)
> >> +            wait_event(curr_ctx->finished,
> >> +                       !(curr_ctx->job_flags & TRANS_RUNNING));
> >> +}
> >> +EXPORT_SYMBOL(v4l2_m2m_suspend);
> >> +
> >> +void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev)
> >> +{
> >> +    unsigned long flags;
> >> +
> >> +    spin_lock_irqsave(&m2m_dev->job_spinlock, flags);
> >> +    m2m_dev->job_queue_flags &= ~QUEUE_PAUSED;
> >> +    spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
> >> +
> >> +    v4l2_m2m_try_run(m2m_dev);
> >> +}
> >> +EXPORT_SYMBOL(v4l2_m2m_resume);
> >> +
> >>  int v4l2_m2m_reqbufs(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
> >>                   struct v4l2_requestbuffers *reqbufs)
> >>  {
> >> diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> >> index 5467264771ec..119a195da390 100644
> >> --- a/include/media/v4l2-mem2mem.h
> >> +++ b/include/media/v4l2-mem2mem.h
> >> @@ -183,6 +183,28 @@ v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state)
> >>      vb2_buffer_done(&buf->vb2_buf, state);
> >>  }
> >>
> >> +/**
> >> + * v4l2_m2m_suspend() - stop new jobs from being run and wait for current job
> >> + * to finish
> >> + *
> >> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> >> + *
> >> + * Called by a driver in the suspend hook. Stop new jobs from being run, and
> >> + * wait for current running job to finish.
> >> + */
> >> +void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev);
> >> +
> >> +/**
> >> + * v4l2_m2m_resume() - resume job running and try to run a queued job
> >> + *
> >> + * @m2m_dev: opaque pointer to the internal data to handle M2M context
> >> + *
> >> + * Called by a driver in the resume hook. This reverts the operation of
> >> + * v4l2_m2m_suspend() and allows job to be run. Also try to run a queued job if
> >> + * there is any.
> >> + */
> >> +void v4l2_m2m_resume(struct v4l2_m2m_dev *m2m_dev);
> >> +
> >>  /**
> >>   * v4l2_m2m_reqbufs() - multi-queue-aware REQBUFS multiplexer
> >>   *
> >> --
> >> 2.18.0
> >
> > Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> >
> > [Corrected Hans's email address.]
> > Hans, does this look good to you?
>
> Yes, this looks good.
>
> Sorry for the late reply.

No worries! Thanks a lot.

>
> I assume this will be part of a future patch series that calls these new functions?

The mtk-jpeg encoder series depends on this patch as well, so I guess
it would go together with whichever is ready first.

I would also envision someone changing the other existing drivers to
use the helpers, as I'm pretty much sure some of them don't handle
suspend/resume correctly.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
