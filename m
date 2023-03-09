Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9106EC64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 03:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmCxRJAwty6b/2EGqOb1mSmCTea85Ex1MqYRon3VirM=; b=RNLFkFvQGOxb+szjVW+w9aAQ4C
	AucjhBhf1kO+P5IFAZ8KdhlEAf+YGfH48VHYdbt0goA95zjUllf5ihVty2ylEwrjE9k/vwUsEi4N+
	9S07gfGynMwD2w4nhpDXeP1LSbHEWizABHmvdRnlxtrdMhRzRXz8YK0PO8wOEBFP58DbbL3QBMXDy
	aEzVog1N17NrCa3FsRTB7udITd45ww333QVNk9oQEHugA0xRB40LSs/hDc7z1nfzxkYsVrsRSn/kv
	YvdZ3KpezK9p843HUxd0DqY3XApD8t7kn4bX4E/kyeM9Ohv+Qj+mCbt9g7ScwTw5F7z11kxGW08KG
	b+yEYv6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa7QM-007j9f-9y; Thu, 09 Mar 2023 03:58:38 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa7QB-007j7I-Vd; Thu, 09 Mar 2023 03:58:29 +0000
Received: by mail-pg1-x52c.google.com with SMTP id d8so313717pgm.3;
        Wed, 08 Mar 2023 19:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678334306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmCxRJAwty6b/2EGqOb1mSmCTea85Ex1MqYRon3VirM=;
        b=PQDsKeYQ0FvqjtrJ3LGUtbdrCu24FAps1LQEeOwYDV8sGffspl6yyyTZOmEchFlbh2
         pIYHlHModyAUY/FhgFVS9CE2IGvayNNTTyFUNOIulUs/tcU1cQh3L0zn/IyHLTZk+jUu
         +hN5UQT9TXT3YJGM+rJS1AKQZz8VVc1czsHUUgro/Zy3FTx6aqTVg+FSYqfi+u9fkPpu
         NCT8kV8cxDnPkvsP6LgO/ce8h94VU/7g5q2PbbEoiiuxWzld3qTNoivoZblLOc/sCwXP
         SnzzdoP7NquhUF62FHpyqQFtbaMZoIGx3DbERxiYuQq26Yb+FB5Zpr9Gvaopjt6p4hCW
         jDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678334306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmCxRJAwty6b/2EGqOb1mSmCTea85Ex1MqYRon3VirM=;
        b=Au6+YMCu5pzTEFfwoOZw0mFhNkmThf6CmOjpOS8hTlp2d/+efzTKd9gOtjXUGYgGpl
         M0Kgf0TXy8zLT5MMiB9k/QdS7zyYgup6dTE1E8mggIFxqWP3Y6zisjC24fdV5AYfJU6u
         J+V0rXYGwYabsZPzGrobBg+BVXF2mHEu9HCUnt17N/czxDai+joee3HcVJSTw7nhvK94
         e5CLlzknH5zDrtQ4p42IgCYxJ/MBexuO37Bbj+QzhdkijlXXXs3Tqqxpg+ZShqvxa/A7
         ZVnRuXfKUpDH2Py5VlUdQzqfdFsn95JZLPWLHThGFdwCvO1GcSGtY6Qw3SIa3A65Vs98
         AkIw==
X-Gm-Message-State: AO0yUKVU6I+zom2YskmKF+kQghyTAyTS0GlmNWw6pQadcbiOpFEE95fD
	vTgOkukEdUEfqhKQsG2d9RVqOZXuhzGOHiFKkAQ=
X-Google-Smtp-Source: AK7set/euvZgnXAe7GlvSz/eRYCPls6/DK2w/wRld8xz6VWJXHmDQ7EO0SQsPXGR2mZDG+XiOx06YqhJdxG3dqPep1c=
X-Received: by 2002:a63:8c17:0:b0:503:7be0:ea51 with SMTP id
 m23-20020a638c17000000b005037be0ea51mr7172255pgd.9.1678334305713; Wed, 08 Mar
 2023 19:58:25 -0800 (PST)
MIME-Version: 1.0
References: <20230302093715.811758-1-zyytlz.wz@163.com> <d27127a1-2572-4ad4-b69c-8a6f53384009@roeck-us.net>
In-Reply-To: <d27127a1-2572-4ad4-b69c-8a6f53384009@roeck-us.net>
From: Zheng Hacker <hackerzheng666@gmail.com>
Date: Thu, 9 Mar 2023 11:58:12 +0800
Message-ID: <CAJedcCxYQYmORfnqcdudFKwy9hhU=mZh_d9MM7x+37ies2S-MA@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-jpeg: Fix use after free bug due to uncanceled work
To: Guenter Roeck <linux@roeck-us.net>
Cc: Zheng Wang <zyytlz.wz@163.com>, mchehab@kernel.org, bin.liu@mediatek.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	1395428693sheep@gmail.com, alex000young@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_195828_060244_51E767A1 
X-CRM114-Status: GOOD (  27.53  )
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

Hi,

Thanks for your reply. I think you're right. I don't know if there is
other method to stop new work from enqueing. Could you please give me
some advice about the fix?

Regards,
Zheng

Guenter Roeck <linux@roeck-us.net> =E4=BA=8E2023=E5=B9=B43=E6=9C=889=E6=97=
=A5=E5=91=A8=E5=9B=9B 08:27=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Mar 02, 2023 at 05:37:15PM +0800, Zheng Wang wrote:
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
> >       struct mtk_jpeg_dev *jpeg =3D platform_get_drvdata(pdev);
> > -
> > +     cancel_delayed_work(&jpeg->job_timeout_work);
>
> The empty line is needed (coding style). Also, this doesn't cancel
> the worker if it is already running. This should probably be
> cancel_delayed_work_sync(). Even then the question is if it is
> possible that new work is queued before the device is unregistered.
>
> Guenter
>
> >       pm_runtime_disable(&pdev->dev);
> >       video_unregister_device(jpeg->vdev);
> >       v4l2_m2m_release(jpeg->m2m_dev);
> > --
> > 2.25.1
> >

