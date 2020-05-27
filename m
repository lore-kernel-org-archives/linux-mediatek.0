Return-Path: <SRS0=IT6v=7J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D74C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 14:47:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25A1B208C3
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 14:47:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g8KNxFqN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VStnWt6j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25A1B208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kI9oqX6lbzyBzLwKQPkAOa43JOxgWCSaPc3qT4OHyoA=; b=g8KNxFqNz/83Cp
	+3f8L3txUP8koznh+5MQu3B3fUj2agq2tTvIhdZa7mjr8VVCzYOhyJ8j5mxTMS7/g7ALMYlPDhOy3
	qqfNBao7luh0/fzEQcAvIiV9lrbenn+5ye5muy0o48EEGIi7TwFuhtNnhfPp6YsrNPN6vH1qyjxJ8
	e+ZPcz4E5OGEbZDNLfZRsntrD8DOf0kPKwosYYj8ko/v315i6OwLfpcSzONA2rHSqEu3gF6D004WI
	ZZysumdB0d/P2i42ioq4NjGV6xKJa/v9b7cFHriKr1Xi4N55tNsrM2XhdAz+VD99BiPz9+uHNittv
	y45TWTeZMdiSqYhvu2kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdxKY-0005SC-60; Wed, 27 May 2020 14:46:54 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdxKW-0005QS-10
 for linux-mediatek@lists.infradead.org; Wed, 27 May 2020 14:46:53 +0000
Received: by mail-il1-x141.google.com with SMTP id j3so24209336ilk.11
 for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2020 07:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AU7716CyemDmasYys+I/AcpiH3oj4x9jWwzzxX5tgKU=;
 b=VStnWt6jTjFgaMVpk3oAYnsncjATXU/wAutYtmJZxldXplcS0pQN70hvvNDVsOPkH4
 vnpNBR2ZdymxIB23xtSA8Lf6Q+U1apKa27CyqmEcDbIor/6l6or9W2gJF5nwV4rqyhy5
 zn5mI5nrRB5YSUzlGDB5NcEQTR9RL2pEiZTE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AU7716CyemDmasYys+I/AcpiH3oj4x9jWwzzxX5tgKU=;
 b=FV8uxcahx1Dw6EJ+cMY+uGSZP9cesdz8ju+1MbLqIeJVoA2C5eJEgBljQzMSIX5nt5
 AxIvaD4hWBKoWM6zLhQuieI3ZBadfGUlI0Iyi3sNDpP1QHY/NzasIYn6wHinZ533Xfdl
 0IiXgye9aNMHderJFLXbLs+g0VOV1IKSAVBFumHhpC462/kL2uHq3uDLmJQh+SBu9bsV
 TFeL/hvRBuYCBjOizAW+eH/gqvrMJf0EAUuOvJmYjppuK5fVhW7eZGc5QdOGwkgll5xi
 Slngft2PPKPzk94y/W65uqupBhJt+AjOV8rebaAQPX62Lc8RvdKDnVZsv2iAo1sDLeeH
 ND/A==
X-Gm-Message-State: AOAM530bqqQm/wLSWOPfCxma7DhGKAvZpaA9SZ8LVg7W8FXQRJcsPFEn
 n/PShSEtjrfjJONKY+A7VTs8BBWRKI6QDBQ3zVYSkQ==
X-Google-Smtp-Source: ABdhPJzUVd1aHH7lzmeRjgv7wJnpzxeLVtfR5lAOrmZRujWuS3ksAZB8tphWnFf4uD7EhaGC6PT22n7EI0O6IBqmsk8=
X-Received: by 2002:a92:d182:: with SMTP id z2mr6049581ilz.47.1590590811109;
 Wed, 27 May 2020 07:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200403094033.8288-1-xia.jiang@mediatek.com>
 <20200403094033.8288-7-xia.jiang@mediatek.com>
 <20200521153257.GF209565@chromium.org> <1590544320.12671.10.camel@mhfsdcap03>
In-Reply-To: <1590544320.12671.10.camel@mhfsdcap03>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 27 May 2020 16:46:39 +0200
Message-ID: <CAHD77HkUrO4em_=7aJqHLU0WnkdsiGJYHMgEyv23fbztQfupCA@mail.gmail.com>
Subject: Re: [PATCH v8 06/14] media: platform: Improve the implementation of
 the system PM ops
To: Xia Jiang <xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_074652_091641_8581467D 
X-CRM114-Status: GOOD (  25.68  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Hsu Wei-Cheng <mojahsu@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Rick Chang <rick.chang@mediatek.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 maoguang.meng@mediatek.com, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 27, 2020 at 3:58 AM Xia Jiang <xia.jiang@mediatek.com> wrote:
>
> On Thu, 2020-05-21 at 15:32 +0000, Tomasz Figa wrote:
> > Hi Xia,
> >
> > On Fri, Apr 03, 2020 at 05:40:25PM +0800, Xia Jiang wrote:
> > > Cancel reset hw operation in suspend and resume function because this
> > > will be done in device_run().
> >
> > This and...
> >
> > > Add spin_lock and unlock operation in irq and resume function to make
> > > sure that the current frame is processed completely before suspend.
> >
> > ...this are two separate changes. Please split.
> >
> > >
> > > Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> > > ---
> > >  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 11 +++++++++--
> > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > > index dd5cadd101ef..2fa3711fdc9b 100644
> > > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > > @@ -911,6 +911,8 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
> > >     u32 dec_ret;
> > >     int i;
> > >
> > > +   spin_lock(&jpeg->hw_lock);
> > > +
> >
> > nit: For consistency, it is recommended to always use the same, i.e. the
> > strongest, spin_(un)lock_ primitives when operating on the same spinlock.
> > In this case it would be the irqsave(restore) variants.
> >
> > >     dec_ret = mtk_jpeg_dec_get_int_status(jpeg->dec_reg_base);
> > >     dec_irq_ret = mtk_jpeg_dec_enum_result(dec_ret);
> > >     ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
> > > @@ -941,6 +943,7 @@ static irqreturn_t mtk_jpeg_dec_irq(int irq, void *priv)
> > >     v4l2_m2m_buf_done(src_buf, buf_state);
> > >     v4l2_m2m_buf_done(dst_buf, buf_state);
> > >     v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> > > +   spin_unlock(&jpeg->hw_lock);
> > >     pm_runtime_put_sync(ctx->jpeg->dev);
> > >     return IRQ_HANDLED;
> > >  }
> > > @@ -1191,7 +1194,6 @@ static __maybe_unused int mtk_jpeg_pm_suspend(struct device *dev)
> > >  {
> > >     struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);
> > >
> > > -   mtk_jpeg_dec_reset(jpeg->dec_reg_base);
> > >     mtk_jpeg_clk_off(jpeg);
> > >
> > >     return 0;
> > > @@ -1202,19 +1204,24 @@ static __maybe_unused int mtk_jpeg_pm_resume(struct device *dev)
> > >     struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);
> > >
> > >     mtk_jpeg_clk_on(jpeg);
> > > -   mtk_jpeg_dec_reset(jpeg->dec_reg_base);
> > >
> > >     return 0;
> > >  }
> > >
> > >  static __maybe_unused int mtk_jpeg_suspend(struct device *dev)
> > >  {
> > > +   struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);
> > > +   unsigned long flags;
> > >     int ret;
> > >
> > >     if (pm_runtime_suspended(dev))
> > >             return 0;
> > >
> > > +   spin_lock_irqsave(&jpeg->hw_lock, flags);
> >
> > What does this spinlock protect us from? I can see that it would prevent
> > the interrupt handler from being called, but is it okay to suspend the
> > system without handling the interrupt?
> Dear Tomasz,
> I mean that if current image is processed in irq handler,suspend
> function can not get the lock(it was locked in irq handler).Should I
> move the spin_lock_irqsave(&jpeg->hw_lock, flags) to the start location
> of suspend function or

Do we have any guarantee that the interrupt handler would be executed
and acquire the spinlock before mtk_jpeg_suspend() is called?

> use wait_event_timeout() to handle the interrupt
> before suspend?

Yes, that would indeed work better. :)

However, please refer to the v4l2_m2m suspend/resume helpers [1] and
the MTK FD driver [2] for how to implement this nicely.

[1] https://patchwork.kernel.org/patch/11272917/
[2] https://patchwork.kernel.org/patch/11272903/

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
