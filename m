Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B66AC83F2C
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 04:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NnASQxHgo8NIvWcsPfvTXJYjWgu/MakjTu4ln9RX/cg=; b=wzCBLpP9KjgSzJ6Sy5x0syG1Wy
	J7IESdjXbNcINNZ5e7JosdLCgAZYhrTjvDFRT0v9A1lMv1xc/CHVgzxBPgB9li/hg1qoX/424yjXR
	RBn+iJp9C8NHd2HZ1MEUqyBsjeAYmBw+OezozV/iSzTrJoSRCFzJ8dGt4whiWiG5kbe17WtCsOgW6
	eLZjqPE3DOAWCwqhJEAjwMeQ4u+af060FnEmts2ReNm6+3kVWgZ1alrR81IsfHF2i3yZ3L43svQWS
	jwiH/o0MmZoYnZrEAHoqXpsEbMJ0LL7MXQXr/ksGR6jaxv6Ekz6Aonzd4m+kkb66g8/w5rtdYc1j2
	mU0OK4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdNcU-005FUZ-2L;
	Tue, 05 Sep 2023 04:24:54 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdNcR-005FTp-0s;
	Tue, 05 Sep 2023 04:24:52 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-48feedb90d2so544454e0c.1;
        Mon, 04 Sep 2023 21:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693887889; x=1694492689; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnASQxHgo8NIvWcsPfvTXJYjWgu/MakjTu4ln9RX/cg=;
        b=b8XmyimE2wlsTXMNcrUIw+BLxEVD7YEr3vtHIrRT4WPIqT5A03xHu/9qV5VSJJP7eH
         FqU5opwagPWuJcBHkuhRhwYzd8uSX8o909i4wys++mVYWkvXG/dAUnFjXQUEQ9dDS6xQ
         +f5pRi8xxHygWQb11QvFuzsTAXSuKwAlsk8WMNxq4vvaMAGshlnyrMYWNi3M98ztPuBD
         M+2/U1PF+a3NtJqI5U+ALTSzJAxlK/6wmWZSqVF8ijBO2C+6fXVv9+uNkoYrgotaoPuu
         hQ1DGQ5gScccU4um00k2fU91c/f4LGEzn8XLZd99wBZnbHvtmc6F6Nb2VsiQTB9yTfiB
         XDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693887889; x=1694492689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnASQxHgo8NIvWcsPfvTXJYjWgu/MakjTu4ln9RX/cg=;
        b=BLwj1jRe0ImiDE75qK9H5neSg6bi1fl/PolCMguHivQ/RIx0l+LYzD7j2RvkZkEKnR
         XrIlkacZteO0tnN2gqE+Y8lAxgwS+Kk9JPUw6XVsANKwNAIZDY/1VkF3BaxVhrDp5lLz
         Zbnw6OmDbR0/3Y4z0enAi4fbM3TpnNCvkwUby62a8AUiBWh0JeBv//fnyGaDkrNFsdtV
         kEza4gOPgHzfLKRyEqQ+MylN96Kb2zbRRS8dkXmS3MB61zQ5F5cM74f4QZSj9xqYYDjW
         MDcqRmKoXW2giQpYARPz1FwPAxPi23blhkF9ZBapCBkoPX3rQWMKPeIuVZEcGL/9YwSM
         2LCw==
X-Gm-Message-State: AOJu0YxchPauWGVWYMM416xAYZ42ORgyEXgFyCRduaO/QGgIMYIALB9F
	STtFj6HwzZKmuAyWlP4BCPlDlTfHJdgKTHZ0YE8=
X-Google-Smtp-Source: AGHT+IHo2INpKSBzOEYnrP6Bz5w6d7VidD2XxmUoIivUbkDLhS/QC5QbuGWTzE7Y7AbpOk1oxYg7FerDRPk/NM2c5CA=
X-Received: by 2002:a1f:dac4:0:b0:48f:b24d:21d3 with SMTP id
 r187-20020a1fdac4000000b0048fb24d21d3mr8004461vkg.15.1693887889034; Mon, 04
 Sep 2023 21:24:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230707092414.866760-1-zyytlz.wz@163.com> <8c8bd3ec-a5a4-32e4-45b5-ee16eeeac246@collabora.com>
 <CAJedcCxPG1mKtgB7AcJSwaQB_qvODObwq3gz6eM_1w777b2PfQ@mail.gmail.com>
 <54b14ebe-b51b-2744-328d-2adcdaaf6d0e@collabora.com> <CAJedcCyn+VHxcSXH+HqP3yiXX8L0wjNao+suti5GgyQzYORcYA@mail.gmail.com>
In-Reply-To: <CAJedcCyn+VHxcSXH+HqP3yiXX8L0wjNao+suti5GgyQzYORcYA@mail.gmail.com>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Tue, 5 Sep 2023 12:24:36 +0800
Message-ID: <CAJedcCw2A1hJ89g5W1u+XvP26gqaUeVFOYRw_tj7eWYNMPfXBQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] media: mtk-jpeg: Fix use after free bug due to
 uncanceled work
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Zheng Wang <zyytlz.wz@163.com>, Kyrie.Wu@mediatek.com, bin.liu@mediatek.com, 
	mchehab@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Irui.Wang@mediatek.com, 
	security@kernel.org, 1395428693sheep@gmail.com, alex000young@gmail.com, 
	Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_212451_317168_B32797BA 
X-CRM114-Status: GOOD (  50.63  )
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

Friendly ping.

Zheng Hacker <hackerzheng666@gmail.com> =E4=BA=8E2023=E5=B9=B48=E6=9C=8831=
=E6=97=A5=E5=91=A8=E5=9B=9B 16:18=E5=86=99=E9=81=93=EF=BC=9A
>
> Dmitry Osipenko <dmitry.osipenko@collabora.com> =E4=BA=8E2023=E5=B9=B48=
=E6=9C=8828=E6=97=A5=E5=91=A8=E4=B8=80 10:04=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On 8/24/23 11:20, Zheng Hacker wrote:
> > > Dmitry Osipenko <dmitry.osipenko@collabora.com> =E4=BA=8E2023=E5=B9=
=B48=E6=9C=8823=E6=97=A5=E5=91=A8=E4=B8=89 02:51=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > >>
> > >> Hello Zheng,
> > >>
> > >> On 7/7/23 12:24, Zheng Wang wrote:
> > >>> In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
> > >>> mtk_jpeg_job_timeout_work. Then mtk_jpeg_dec_device_run
> > >>> and mtk_jpeg_enc_device_run may be called to start the
> > >>> work.
> > >>> If we remove the module which will call mtk_jpeg_remove
> > >>> to make cleanup, there may be a unfinished work. The
> > >>> possible sequence is as follows, which will cause a
> > >>> typical UAF bug.
> > >>>
> > >>> Fix it by canceling the work before cleanup in the mtk_jpeg_remove
> > >>>
> > >>> CPU0                  CPU1
> > >>>
> > >>>                     |mtk_jpeg_job_timeout_work
> > >>> mtk_jpeg_remove     |
> > >>>   v4l2_m2m_release  |
> > >>>     kfree(m2m_dev); |
> > >>>                     |
> > >>>                     | v4l2_m2m_get_curr_priv
> > >>>                     |   m2m_dev->curr_ctx //use
> > >>> Fixes: b2f0d2724ba4 ("[media] vcodec: mediatek: Add Mediatek JPEG D=
ecoder Driver")
> > >>> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> > >>> ---
> > >>> - v2: use cancel_delayed_work_sync instead of cancel_delayed_work s=
uggested by Kyrie.
> > >>> ---
> > >>>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 1 +
> > >>>  1 file changed, 1 insertion(+)
> > >>>
> > >>> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b=
/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > >>> index 0051f372a66c..6069ecf420b0 100644
> > >>> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > >>> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> > >>> @@ -1816,6 +1816,7 @@ static void mtk_jpeg_remove(struct platform_d=
evice *pdev)
> > >>>  {
> > >>>       struct mtk_jpeg_dev *jpeg =3D platform_get_drvdata(pdev);
> > >>>
> > >>> +     cancel_delayed_work_sync(&jpeg->job_timeout_work);
> > >>>       pm_runtime_disable(&pdev->dev);
> > >>>       video_unregister_device(jpeg->vdev);
> > >>>       v4l2_m2m_release(jpeg->m2m_dev);
> > >>
> > >> AFAICS, there is a fundamental problem here. The job_timeout_work us=
es
> > >> v4l2_m2m_get_curr_priv() and at the time when driver module is unloa=
ded,
> > >> all the v4l contexts must be closed and released. Hence the
> > >> v4l2_m2m_get_curr_priv() shall return NULL and crash the kernel when
> > >> work is executed before cancel_delayed_work_sync().
> > >>
> > >
> > > Hi Dmitry,
> > >
> > > Thanks for your reply. I think you're right. As m2m_dev is freed in
> > > v4l2_m2m_release,
> > > the invoking in v4l2_m2m_get_curr_priv might cause either UAF or null
> > > pointer dereference
> > > bug. I am sure that context is closed when we invoke mtk_jpeg_remove.
> > > But I'm not sure if
> > > context is released when mtk_jpegdec_timeout_work running.
> > >
> > >> At the time when mtk_jpeg_remove() is invoked, there shall be no
> > >> job_timeout_work running in background because all jobs should be
> > >> completed before context is released. If you'll look at
> > >> v4l2_m2m_cancel_job(), you can see that it waits for the task comple=
tion
> > >> before closing context.
> > >
> > > Yes, so I think the better way is to put the cancel_delayed_work_sync
> > > invoking into
> > > v4l2_m2m_ctx_release function?
> >
> > The v4l2_m2m_ctx_release() already should wait for the job_timeout_work
> > completion or for the interrupt fire. Apparently it doesn't work in
> > yours case. You'll need to debug why v4l job or job_timeout_work is
> > running after v4l2_m2m_ctx_release(), it shouldn't happen.
> >
>
> Yes, v4l2_m2m_cancel_job waits for m2m_ctx->job_flags to be  ~TRANS_RUNNI=
NG,
> the mtk_jpeg_job_timeout_work will finally invoke v4l2_m2m_job_finish
> to trigger that.
>
> However, this is not the only path to call v4l2_m2m_job_finish. Here
> is a invoking chain:
> v4l_streamon
>   ->v4l2_m2m_ioctl_streamon
>     ->v4l2_m2m_streamon
>       ->v4l2_m2m_try_schedule
>         ->v4l2_m2m_try_run
>           ->mtk_jpeg_dec_device_run
>             ->schedule_delayed_work(&jpeg->job_timeout_work...
>             ->error path goto dec_end
>             ->v4l2_m2m_job_finish
>
> In some specific situation, it starts the worker and also calls
> v4l2_m2m_job_finish, which might
> make v4l2_m2m_cancel_job continues.
>
> > The interrupt handler cancels job_timeout_work, you shouldn't need to
> > flush the work.
>
> It will, but as I said, there might be an early invocation chain to
> start the work.(Not very sure)
>
> >
> > Technically, interrupt handler may race with job_timeout_work, but the
> > timeout is set to 1 second and in practice should be difficult to
> > trigger the race. The interrupt handler needs to be threaded, it should
> > use cancel_delayed_work_sync() and check the return value of this funct=
ion.
> >
>
> Yes, it's better to use cancel_delayed_work_sync here.
>
> > >>
> > >> You shouldn't be able to remove driver module while it has active/op=
ened
> > >> v4l contexts. If you can do that, then this is yours bug that needs =
to
> > >> be fixed.
> > >>
> > >> In addition to this all, the job_timeout_work is initialized only fo=
r
> > >> the single-core JPEG device. I'd expect this patch should crash
> > >> multi-core JPEG devices.
> > >>
> > >
> > > I think that's true. As I'm not familiar with the code here. Could yo=
u
> > > please give me some advice about the patch?
> >
> > We'll need to understand why v4l2_m2m_ctx_release() doesn't work as
> > expected before thinking about the patch.
> >
> > --
> > Best regards,
> > Dmitry
> >

