Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1771CC678D5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 04:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnlnWFbORRUW7WotUUBNStj9+HXnlgPod90NeKp1RSA=; b=I9gHoj9CFRx91QJU/5Z0m4R87W
	Pgo5eh/Ggr6h/pZbNvs95tEj/9zZjAn+Ric1FToFJi9nzpRO7gjfne7YQlyeJpP0YMaHsIKyOZGUE
	wM9o5SQFuf+E551lzfPXmF85aQ3F4IgUYSU+2hpMgRezkF5KJlAq/M//rLxl5KU+AXd1FII4GlqIJ
	aK2KLPfU5aBqDGZpTG/IIvaSQKK0AXrnvageRyHS7WDMmKuGHu7GDvwU6z1ZiirRwDGSwbAxIezmO
	7bQVKLWRdHcA4ZoE5Y6KMz8Rnq1KaTgq1MEakM/U5FiQRuFvcYUM6lDmabfgF5SWsxbayLOZW9Bas
	+Ao8F+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZlU9-003T1J-LL; Wed, 08 Mar 2023 04:33:05 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZlU6-003T0Q-3q; Wed, 08 Mar 2023 04:33:04 +0000
Received: by mail-pf1-x42d.google.com with SMTP id y10so9472631pfi.8;
        Tue, 07 Mar 2023 20:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678249979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnlnWFbORRUW7WotUUBNStj9+HXnlgPod90NeKp1RSA=;
        b=FJ+IUjhXNOO8+G+be8rJmlTEtFsEBVXy8Yc53e6jSgEtpmPme/oBlrtOmlT3HdW3Tm
         7l09AtBr9+5I/NWCWLt1dZVDRq3eCqLquT6Rp563QocYBPR9lEuO8084mPj1f77IdtBJ
         HrKyHMMPIqE0gvEYK83Oj4TR7z3+M0d2WKR++tQVx1taYiAkirHou160XeFYVVVI0ypI
         kv/+D3c28xlZTf91X78JGCWY0Q2Z+gYyCfuHk048PclUNd6ugxZqB2cW6Nk+Bs+UP6QI
         WjSw4mE3ISNurhQ3wyFc7u8C1EwFgeHNnfxwIRuALFJEZdI6q7NBfYwcfahSmSTfc3ue
         PrCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678249979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnlnWFbORRUW7WotUUBNStj9+HXnlgPod90NeKp1RSA=;
        b=yHKWyQuOFNxzujd67CHN3s87xVSG//BrHF1w3K3izyjtV2gRY7SedynkXbQFkXIyAA
         9mN9BM8bItk/n86doErpyw+6NaqRnEba6TIUc2BXX5oNSetjvWIRTXh4fginw/S7kOXs
         h+kA2nk/OXgZWUf6lUFp+LuE161fuxauvweBvBivn4EA2QQb1ip3+39UlBhcophInGCl
         5cbn+i92WzbDapFcE+iuVZP6gUZdCgOH+XRTDNRsvM/B30Mkw2mSllRBEzhDqunkNoMV
         dkzDfPi6fs5wt6IbNbbjekWLaZod7kvPJaKUrfljK2AY+qKrbVCyLccn0MkjdWEW/v9s
         iOKA==
X-Gm-Message-State: AO0yUKUPv4CdYv/mI6xLA/uHHnFrX8PwjeMvSwnsCvRnH3hUcuc27WJi
	sxMVVzs2iEIWo9XX5Ez6NOHCWIX2b19DnNrpin4=
X-Google-Smtp-Source: AK7set82TysaLAqeDmXsG1fbDnyaC/PXgRmq9+k8PphsiSF8ywjhc76iouhmrHSpB3HbUL6ZpXYZc0pmxH6HqsCJx90=
X-Received: by 2002:a63:5508:0:b0:502:fd71:d58c with SMTP id
 j8-20020a635508000000b00502fd71d58cmr6236376pgb.9.1678249978831; Tue, 07 Mar
 2023 20:32:58 -0800 (PST)
MIME-Version: 1.0
References: <20230306062633.200427-1-zyytlz.wz@163.com> <CAJedcCzeVwwi9SkkwouFXUAVhF-tKF4dkqsFqVQwszSwY1SJ0A@mail.gmail.com>
 <57c17bfd-83f3-fcce-0eab-e28469fb0ced@collabora.com> <11c2bce1e5286ad3a9a5be2ee59c2beac168f135.camel@mediatek.com>
 <CAJedcCx13sz5h=fWvJU38P_1W-zd6yZe=iSMpO28_E_kAqUGDA@mail.gmail.com>
 <cfa2f64d2d01ffc53a6afdc9a5b867bbcb07b5f6.camel@mediatek.com>
 <CAJedcCwhk_XuMF8keGZGBTVBZSMuoQeyV_7L1H2VeT2x_vj-ZQ@mail.gmail.com> <86c98d73b0d294e143014ea5e15d0a5d065e1a66.camel@mediatek.com>
In-Reply-To: <86c98d73b0d294e143014ea5e15d0a5d065e1a66.camel@mediatek.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Wed, 8 Mar 2023 12:32:45 +0800
Message-ID: <CAJedcCzdwAFGK1U56AQ-iXLgBmbnNcc3i4428RMd4WHR1cJZsQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] media: mtk-jpeg: Fix use after free bug due to
 uncanceled work
To: =?UTF-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>, 
	"zyytlz.wz@163.com" <zyytlz.wz@163.com>, "alex000young@gmail.com" <alex000young@gmail.com>, 
	=?UTF-8?B?QmluIExpdSAo5YiY5b2sKQ==?= <bin.liu@mediatek.com>, 
	=?UTF-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"1395428693sheep@gmail.com" <1395428693sheep@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_203302_227394_3C097139 
X-CRM114-Status: GOOD (  65.82  )
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

Hi Kyrie,

Thanks for your quick response and detailed information. I understand
more about the design with your explanation. As you say,  there
shouldn't be any issues with the normal flow. And if the attacker use
some tricks to enhance the race window and call remove function
directly as [1] mentioned, this might trigger uaf bug unexpectedly.

Besides, I found another code path which may call v4l2_m2m_cancel_job
and finally make the situation looks safe. The invoking chain is

mtk_jpeg_release
  v4l2_m2m_ctx_release
    v4l2_m2m_cancel_job

If the attacker have to call mtk_jpeg_release function before the
remove function, it might be harmless. But I'm not sure about that.

[1]  https://www.usenix.org/system/files/sec21-lee-yoochan.pdf

Best regards,
Zheng

Kyrie Wu (=E5=90=B4=E6=99=97) <Kyrie.Wu@mediatek.com> =E4=BA=8E2023=E5=B9=
=B43=E6=9C=888=E6=97=A5=E5=91=A8=E4=B8=89 11:32=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 2023-03-08 at 10:20 +0800, Zheng Hacker wrote:
> > Hi Kyrie,
> >
> > Thank you for your careful analysis and response. I still have some
> > areas that I don't quite understand and would like to ask for
> > clarification. That is, how do the function pointers for stop
> > streaming, initialized as mtk_jpeg_enc_stop_streaming and
> > mtk_jpeg_dec_stop_streaming, ensure that the worker is canceled? I
> > would greatly appreciate your response.
> >
> > Best regards,
> > Zheng
>
> Dear zheng,
>
> For stop streaming, what I mean is that stoppping jpeg decoding or
> encoding.
> Ok, let me introduce the sw flow of stop streaming:
> Firstly, the app will call v4l2_m2m_ioctl_streamoff, which will call
> v4l2_m2m_cancel_job, if it finds a job running(as you note, cpu1 is
> running), it will wait event, the event is wake up by
> v4l2_m2m_job_finish function. And v4l2_m2m_job_finish is called by jpeg
> dec/enc irq handler, which means that the waitting would result mtk hw
> to finish dec/enc, irq will occur and irq handler would cancel timeout
> worker. The follow is shown as blow.
> v4l2_m2m_ioctl_streamoff
>    v4l2_m2m_cancel_job                mtk_jpeg_enc_irq/mtk_jpeg_dec_irq
>        wait evnet <------ wake up ------v4l2_m2m_job_finish
>                                         cancel timeout work
>
> As mentioned above, if it is normal stop streaming action, there will
> be no happen that the timeout worker does not canceled.
>
> But if mtk_jpeg_remove is called directly without above flow, it would
> cause lots of issues.
>
> Regards,
> Kyrie.
> >
> > Kyrie Wu (=E5=90=B4=E6=99=97) <Kyrie.Wu@mediatek.com> =E4=BA=8E2023=E5=
=B9=B43=E6=9C=888=E6=97=A5=E5=91=A8=E4=B8=89 10:02=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Tue, 2023-03-07 at 23:03 +0800, Zheng Hacker wrote:
> > > > The timer function was set in mtk_jpeg_probe with
> > > > mtk_jpeg_job_timeout_work function.
> > > > And the worker is started in mtk_jpeg_dec_device_run.
> > > > There are two functions (mtk_jpeg_enc_irq and mtk_jpeg_dec_irq)
> > > > which
> > > > may cancel the worker.
> > > > They are used as IRQ handler function which is saved as function
> > > > pointer in a variable.
> > > > In mtk_jpeg_probe, they are registered by devm_request_irq:
> > > >
> > > > ret =3D devm_request_irq(&pdev->dev,
> > > >                jpeg_irq,
> > > >                jpeg->variant->irq_handler,
> > > >                0,
> > > >                pdev->name, jpeg);
> > > >     if (ret) {
> > > >       dev_err(&pdev->dev, "Failed to request jpeg_irq %d (%d)\n",
> > > >         jpeg_irq, ret);
> > > >       return ret;
> > > >     }
> > > >
> > > > However, if we remove the module without triggering the irq, the
> > > > worker will never be removed.
> > > >
> > > > As for the schedule, mtk_jpeg_dec_device_run and
> > > > mtk_jpeg_enc_device_run will start the worker.
> > > > The schedule invoking is quite complicated. As far as I know, the
> > > > invoking chain is as follows:
> > > >
> > > > v4l2_m2m_init->v4l2_m2m_device_run_work->v4l2_m2m_try_run
> > > >
> > > > the v4l2_m2m_device_run_work function is also a worker which is
> > > > set
> > > > in
> > > > v4l2_m2m_init and started in
> > > > v4l2_m2m_schedule_next_job.
> > > >
> > > > Before calling remove function, the  mtk_jpeg_release was invoked
> > > > to
> > > > release the related resource.
> > > >
> > > > v4l2_m2m_cancel_job will cancel the job by calling
> > > > m2m_dev->m2m_ops->job_abort(m2m_ctx->priv).
> > > >
> > > > But this will only cancel the current queue by
> > > > list_del(&m2m_dev->curr_ctx->queue);
> > > >
> > > > I think this can not cancel the posted task mentioned before. So
> > > > I
> > > > think if mtk_jpeg_job_timeout_work
> > > >
> > > > is working on, and using jpeg->m2m_dev after freeing it in
> > > > mtk_jpeg_remove, it will cause a UAF bug.
> > > >
> > > > static int mtk_jpeg_release(struct file *file)
> > > > {
> > > >   struct mtk_jpeg_dev *jpeg =3D video_drvdata(file);
> > > >   struct mtk_jpeg_ctx *ctx =3D mtk_jpeg_fh_to_ctx(file-
> > > > >private_data);
> > > >
> > > >   mutex_lock(&jpeg->lock);
> > > >   v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> > > >   [1] v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> > > >   v4l2_fh_del(&ctx->fh);
> > > >   v4l2_fh_exit(&ctx->fh);
> > > >   kfree(ctx);
> > > >   mutex_unlock(&jpeg->lock);
> > > >   return 0;
> > > > }
> > > >
> > > > void v4l2_m2m_ctx_release(struct v4l2_m2m_ctx *m2m_ctx)
> > > > {
> > > >   /* wait until the current context is dequeued from job_queue */
> > > >   [2] v4l2_m2m_cancel_job(m2m_ctx);
> > > >
> > > >   vb2_queue_release(&m2m_ctx->cap_q_ctx.q);
> > > >   vb2_queue_release(&m2m_ctx->out_q_ctx.q);
> > > >
> > > >   kfree(m2m_ctx);
> > > > }
> > > >
> > > > Note that all of this is static analysis, which may be false
> > > > positive.
> > > > Feel free to tell me if there is something I've missed.
> > > >
> > > > Regard,
> > > > Zheng
> > >
> > > Dear Zheng,
> > >
> > > You set up an application scenario:
> > > cpu1 is using the mtk-jpeg driver and timeout work has been
> > > scheduled.
> > > At the same time cpu0 wanted to remove the mtk-jpeg driver, which
> > > caused the UAF bug.
> > > I wonder if such an irrational application scenario could exist.
> > > This
> > > scenario, as you described, not only leads to the problems you
> > > mentioned, but also to output&capture memory leaks and unreleased
> > > resources, such as spinlock.
> > > Typically, if we want to remove the driver, we firstly do stop
> > > streaming, which ensures that the worker has been canceled.
> > > I agree with your changes from the perspective of strengthening the
> > > robustness of the driver code.
> > >
> > > Regards,
> > > Kyrie.
> > > >
> > > > Irui Wang (=E7=8E=8B=E7=91=9E) <Irui.Wang@mediatek.com> =E4=BA=8E20=
23=E5=B9=B43=E6=9C=887=E6=97=A5=E5=91=A8=E4=BA=8C 18:23=E5=86=99=E9=81=93=
=EF=BC=9A
> > > > >
> > > > > Dear Angelo and Zheng,
> > > > >
> > > > > Thanks for your patch and comments.
> > > > >
> > > > > Dear Kyrie,
> > > > >
> > > > > Please help to check this, thanks.
> > > > >
> > > > > Best Regards
> > > > >
> > > > > On Tue, 2023-03-07 at 10:49 +0100, AngeloGioacchino Del Regno
> > > > > wrote:
> > > > > > Il 07/03/23 10:27, Zheng Hacker ha scritto:
> > > > > > > Hi,
> > > > > > >
> > > > > > > Is there anyone who can help with this? I can provide more
> > > > > > > details
> > > > > > > like invoking chain if needed.
> > > > > > >
> > > > > >
> > > > > > Providing more details is always good. Please do.
> > > > > >
> > > > > > Meanwhile, adding Irui Wang to the loop: he's doing mtk-jpeg.
> > > > > >
> > > > > > Regards,
> > > > > > Angelo
> > > > > >
> > > > > > > Thanks,
> > > > > > > Zheng
> > > > > > >
> > > > > > > Zheng Wang <zyytlz.wz@163.com> =E4=BA=8E2023=E5=B9=B43=E6=9C=
=886=E6=97=A5=E5=91=A8=E4=B8=80 14:28=E5=86=99=E9=81=93=EF=BC=9A
> > > > > > > >
> > > > > > > > In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
> > > > > > > > mtk_jpeg_job_timeout_work. Then mtk_jpeg_dec_device_run
> > > > > > > > and mtk_jpeg_enc_device_run may be called to start the
> > > > > > > > work.
> > > > > > > > If we remove the module which will call mtk_jpeg_remove
> > > > > > > > to make cleanup, there may be a unfinished work. The
> > > > > > > > possible sequence is as follows, which will cause a
> > > > > > > > typical UAF bug.
> > > > > > > >
> > > > > > > > Fix it by canceling the work before cleanup in the
> > > > > > > > mtk_jpeg_remove
> > > > > > > >
> > > > > > > > CPU0                  CPU1
> > > > > > > >
> > > > > > > >                      |mtk_jpeg_job_timeout_work
> > > > > > > > mtk_jpeg_remove     |
> > > > > > > >    v4l2_m2m_release  |
> > > > > > > >      kfree(m2m_dev); |
> > > > > > > >                      |
> > > > > > > >                      | v4l2_m2m_get_curr_priv
> > > > > > > >                      |   m2m_dev->curr_ctx //use
> > > > > > > >
> > > > > > > > Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> > > > > > > > ---
> > > > > > > >   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c |
> > > > > > > > 2 +-
> > > > > > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > >
> > > > > > > > diff --git
> > > > > > > > a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > > > > > > b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > > > > > > index 969516a940ba..364513e7897e 100644
> > > > > > > > ---
> > > > > > > > a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > > > > > > +++
> > > > > > > > b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > > > > > > > @@ -1793,7 +1793,7 @@ static int mtk_jpeg_probe(struct
> > > > > > > > platform_device *pdev)
> > > > > > > >   static int mtk_jpeg_remove(struct platform_device
> > > > > > > > *pdev)
> > > > > > > >   {
> > > > > > > >          struct mtk_jpeg_dev *jpeg =3D
> > > > > > > > platform_get_drvdata(pdev);
> > > > > > > > -
> > > > > > > > +       cancel_delayed_work(&jpeg->job_timeout_work);
> > > > > > > >          pm_runtime_disable(&pdev->dev);
> > > > > > > >          video_unregister_device(jpeg->vdev);
> > > > > > > >          v4l2_m2m_release(jpeg->m2m_dev);
> > > > > > > > --
> > > > > > > > 2.25.1
> > > > > > > >
> > > > > >
> > > > > >
> > > > > >

