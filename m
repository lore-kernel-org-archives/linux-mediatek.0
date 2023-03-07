Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB35C678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 15:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNHKxNT0c5JC0gPj8eQAxc4/vh0SceOoVMKlv96e3CE=; b=aCMBcSPGfqRtUy6NnLIHc7NNUm
	AX30s1UAwcgOzouF5R7ChcNbhoJx47vwOkzDnSKmBq2rbgBiFb1dlVca1ukUnrgkozFY81TXVJvjr
	pN3rAEeIeUuRSnQxeUWIBq8YJLSuPjk+eBi9lkzOObSZABcVcDeDBfa8TkSc/d02nWE1zUwNdqsBq
	WRral5HPxqDgeI63d2iweHmP4sjLnAh6M7B6FGwqaeIrna3r70mNPCz7hEQsC00PilOEFV9wtP465
	7iSq3+NtLEbQuTFxvr14+RAa+7uBxSlRfgqFN2sNfH1LRTEBEoK/S6rip2jgz9Rp+oASvx/8o+osw
	skNE1I9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZ6A-001BXS-PL; Tue, 07 Mar 2023 15:19:30 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZYn4-0011h7-PH; Tue, 07 Mar 2023 14:59:48 +0000
Received: by mail-pg1-x530.google.com with SMTP id q189so7727971pga.9;
        Tue, 07 Mar 2023 06:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678201184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNHKxNT0c5JC0gPj8eQAxc4/vh0SceOoVMKlv96e3CE=;
        b=KUOmHD41UyLUET01uAguKq9lIpNeVGT+6YWm0lrLNXVWQ5okoY4rWa1FiMGKT2Rj44
         0o8kaMb979rpYjEUsgrhmfC6hh5yr3Qgq/KoMgC2enCe2oWHohtOBsrKpGXysvOTvSoK
         kFbItxEcRxvage51y7RyYkaIdmdKApWpIXIBPL8i38OjkVhqidf8Bx92F8gn4IFed5yz
         +3bipw/8nq98xaqtZqGl4w3GR08TgNUSQ0EB0TDj5E3W9hT8cTHkhD60sB2KCtsHTtwU
         B1sazMCEacCEeDBlzVM3N0vzvT5GNyGX6ggez2Q/CNgNda04HnH+d6Ko8PoIzi6GjtUK
         ABxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678201184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNHKxNT0c5JC0gPj8eQAxc4/vh0SceOoVMKlv96e3CE=;
        b=awfo0cTlo3XU+oTrWen10Vu23fYw9Ip2Cc4+HIQZs/IKYzUL81kaDJ9HNLEGAoHOGp
         +C1oEnKf5e15NSpntLjvypwTiaEuEIYxwRvVIOtoPzWtDqnJtIbH6Zvb8bRu02lZgu30
         iAtMy7XFsrOg/1awvhF2V3KGW6a40SOMX5dPq9E64Kn5V+0E+Ra8vvBvc45qMyPRmshN
         MatZhvwzW0GNkTXR36R0FZhCAj81YPQ7dBLc4pVOgXzw644sagXUNwYQMxUlGa0edcZh
         zswDUQsiEp17oqG/qtPC/ShI9VW08p/5K/8c3oUQExoS948SDr93p0KQut8JtQeRrwS+
         p1bw==
X-Gm-Message-State: AO0yUKUUXZNGk/k4ZiDivYLGwAQG1qDbhwShypOfhqzrwQxjCMywhJ05
	zugl3qVv8Taw2Y+JDaRhcAlr8TO5XcLElPhob+Q=
X-Google-Smtp-Source: AK7set/WOQxv8H/7aV+F946wAXqf7ORNX6U+xFFccQrhIqEOQdhoG7L7xRrbc2tm4bdT5SrOksNQ6CSe3plvbg/RNCA=
X-Received: by 2002:a62:8245:0:b0:590:3182:9341 with SMTP id
 w66-20020a628245000000b0059031829341mr6135030pfd.0.1678201183659; Tue, 07 Mar
 2023 06:59:43 -0800 (PST)
MIME-Version: 1.0
References: <20230306062633.200427-1-zyytlz.wz@163.com> <CAJedcCzeVwwi9SkkwouFXUAVhF-tKF4dkqsFqVQwszSwY1SJ0A@mail.gmail.com>
In-Reply-To: <CAJedcCzeVwwi9SkkwouFXUAVhF-tKF4dkqsFqVQwszSwY1SJ0A@mail.gmail.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Tue, 7 Mar 2023 22:59:31 +0800
Message-ID: <CAJedcCwf4st_KBxYA1dTNT3TNpyyZ_5-2o0oBP7h6kQt7Nzv3Q@mail.gmail.com>
Subject: Re: [RESEND PATCH] media: mtk-jpeg: Fix use after free bug due to
 uncanceled work
To: Zheng Wang <zyytlz.wz@163.com>
Cc: mchehab@kernel.org, bin.liu@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 1395428693sheep@gmail.com, 
	alex000young@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_065946_842602_1921C66B 
X-CRM114-Status: GOOD (  26.40  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The timer function was inited in mtk_jpeg_probe with
mtk_jpeg_job_timeout_work function.
And the worker is started in mtk_jpeg_dec_device_run.
There are two functions (mtk_jpeg_enc_irq and mtk_jpeg_dec_irq) which
may cancel the worker.
They are used as IRQ handler function which is saved as function
pointer in a variable.
In mtk_jpeg_probe, they are registered by devm_request_irq:

ret =3D devm_request_irq(&pdev->dev,
               jpeg_irq,
               jpeg->variant->irq_handler,
               0,
               pdev->name, jpeg);
    if (ret) {
      dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
        jpeg_irq, ret);
      return ret;
    }

However, if we remove the module without triigering the irq, the
worker will never be removed.

As for the schedule, mtk_jpeg_dec_device_run and
mtk_jpeg_enc_device_run will start the worker.
The schedule invoking is quite complicated. As far as I know, the
invoking chain is as follows:

v4l2_m2m_init->v4l2_m2m_device_run_work->v4l2_m2m_try_run

the v4l2_m2m_device_run_work is also a worker which is inited in
v4l2_m2m_init and started in
v4l2_m2m_schedule_next_job.

Before calling remove function, the  mtk_jpeg_release was invoked to
release the related resource.

v4l2_m2m_cancel_job will cancel the job by calling
m2m_dev->m2m_ops->job_abort(m2m_ctx->priv).

But this will only cancel the current queue by
list_del(&m2m_dev->curr_ctx->queue);

I think this can not cancel the posted task mentioned before. So I
think if mtk_jpeg_job_timeout_work

is working on, and use jpeg->m2m_dev after freeing it in
mtk_jpeg_remove, it wll cause UAF bug.

static int mtk_jpeg_release(struct file *file)
{
  struct mtk_jpeg_dev *jpeg =3D video_drvdata(file);
  struct mtk_jpeg_ctx *ctx =3D mtk_jpeg_fh_to_ctx(file->private_data);

  mutex_lock(&jpeg->lock);
  v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
  [1] v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
  v4l2_fh_del(&ctx->fh);
  v4l2_fh_exit(&ctx->fh);
  kfree(ctx);
  mutex_unlock(&jpeg->lock);
  return 0;
}

void v4l2_m2m_ctx_release(struct v4l2_m2m_ctx *m2m_ctx)
{
  /* wait until the current context is dequeued from job_queue */
  [2] v4l2_m2m_cancel_job(m2m_ctx);

  vb2_queue_release(&m2m_ctx->cap_q_ctx.q);
  vb2_queue_release(&m2m_ctx->out_q_ctx.q);

  kfree(m2m_ctx);
}

Note that, all of this is static analysis, which may be false positive.
Feel free to tell me if there is something I've missed.

Regard,
Zheng

Zheng Hacker <hackerzheng666@gmail.com> =E4=BA=8E2023=E5=B9=B43=E6=9C=887=
=E6=97=A5=E5=91=A8=E4=BA=8C 17:27=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> Is there anyone who can help with this? I can provide more details
> like invoking chain if needed.
>
> Thanks,
> Zheng
>
> Zheng Wang <zyytlz.wz@163.com> =E4=BA=8E2023=E5=B9=B43=E6=9C=886=E6=97=A5=
=E5=91=A8=E4=B8=80 14:28=E5=86=99=E9=81=93=EF=BC=9A
> >
> > In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
> > mtk_jpeg_job_timeout_work. Then mtk_jpeg_dec_device_run
> > and mtk_jpeg_enc_device_run may be called to start the
> > work.
> > If we remove the module which will call mtk_jpeg_remove
> > to make cleanup, there may be a unfinished work. The
> > possible sequence is as follows, which will cause a
> > typical UAF bug.
> >
> > Fix it by canceling the work before cleanup in the mtk_jpeg_remove
> >
> > CPU0                  CPU1
> >
> >                     |mtk_jpeg_job_timeout_work
> > mtk_jpeg_remove     |
> >   v4l2_m2m_release  |
> >     kfree(m2m_dev); |
> >                     |
> >                     | v4l2_m2m_get_curr_priv
> >                     |   m2m_dev->curr_ctx //use
> >
> > Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> > ---
> >  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/dri=
vers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > index 969516a940ba..364513e7897e 100644
> > --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > @@ -1793,7 +1793,7 @@ static int mtk_jpeg_probe(struct platform_device =
*pdev)
> >  static int mtk_jpeg_remove(struct platform_device *pdev)
> >  {
> >         struct mtk_jpeg_dev *jpeg =3D platform_get_drvdata(pdev);
> > -
> > +       cancel_delayed_work(&jpeg->job_timeout_work);
> >         pm_runtime_disable(&pdev->dev);
> >         video_unregister_device(jpeg->vdev);
> >         v4l2_m2m_release(jpeg->m2m_dev);
> > --
> > 2.25.1
> >

