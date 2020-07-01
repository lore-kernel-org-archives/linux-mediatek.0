Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48281C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 11:08:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CCFF20722
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 11:08:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vNCenFvL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fVQ98MAx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CCFF20722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TLZu4EDm5dCgMjI3D6zze5i1dNDu1jtw4kNhVEtMGC8=; b=vNCenFvLNvwpZlvCLAgH1O/rB
	BQlGAczr34LVSk2rhNn0r9qTq6l3PPt2xSVQBcL/xfeZoq3fbRA1t2YoYONmyHVSczd3t92kp/rRP
	kudXkfC3p2EG0DdPjB2xK99IPwWxiHXaLJrwyz60sixB3i2SFnRi7kLkdcmhkjp+mPmjFVYmX6beU
	ZudF4WC3Jr/YQ7KFNsN+RzAQf6ZwfeH/FQYqPmTzU/N1sAxlrjTFiY9pLKmTkR2XKRC2OELK+Ydmj
	KOrZA6NQ2wwpxvUGGMb2DHOADLoj9TJ4T21on7nSCnu/TWE3fK2JY5x10HqSC10n4OXnyl9j5pEYx
	bkXRnMdtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqab0-0002Jp-AM; Wed, 01 Jul 2020 11:08:06 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqaay-0002JN-6G
 for linux-mediatek@lists.infradead.org; Wed, 01 Jul 2020 11:08:05 +0000
Received: by mail-ed1-x543.google.com with SMTP id d15so19256053edm.10
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 04:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QP5FcPoiY5gXfyecRZBIW+zJ5fFtp0kaGdHXnp9CMG4=;
 b=fVQ98MAxkuz/crY3rTB1m+oOjUydIVeHv9NbArEHstkqBmEIb/9rO61DiEQhfBrkN5
 6Kw4mYd4I3+pbZPHm3jXGj4RgdvT/Hl59047J0u5/D1TiG4iV5StiJUh8kcGNYp7tY7c
 S7MBaqP1XdnMPhv2TTyK5WYdIyU/EUWeQ1H2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QP5FcPoiY5gXfyecRZBIW+zJ5fFtp0kaGdHXnp9CMG4=;
 b=dJhoVodGnXCV/ACgUb8ZZMAU6h8KbTvhugLMPkLr1djb0n/IRpoLmRbQ+/w0rhQqNQ
 3KofGhCrQToNjCvUYPkKM/rHfaIDQtSf5DDXKP3M4VvVty2CX/Z2UBPnrhcVOTenWMHC
 E1R69Xv1B8jmhbeNkPvM2Q7Yhh4M49SZjBJocWLctKErORNagyRQgp5wBna0GHYRkml5
 DOgJ2LEAdfRSUjkY4jmgTjxytgc778JUCP8Y8D09mzoL9NjgVGn0erbvLm0zL2cpGHiU
 VbXF79MHQZMOKFu82fka78a2n8PBtzJO4xvwTbJtwnZW0On57aMhi0YpP6kSJ+t+TXhC
 rojQ==
X-Gm-Message-State: AOAM532qwt5h/+Szf32bt9EMy61TtM+2J9f5damB2KULhgRMHyssvuxf
 qpguraGZIDmtG9e65L+/uld95Ceq0MSvRw==
X-Google-Smtp-Source: ABdhPJyNfbjxXuA9wY6q0CKASGZQmc2L5VhQxx1fbHHf2GKIjpFHMCH4sbdFYjnr7IwpxsI31e+IDQ==
X-Received: by 2002:a05:6402:377:: with SMTP id
 s23mr28981426edw.200.1593601682695; 
 Wed, 01 Jul 2020 04:08:02 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51])
 by smtp.gmail.com with ESMTPSA id s14sm5915507edq.36.2020.07.01.04.08.01
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 04:08:01 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id f7so20346829wrw.1
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 04:08:01 -0700 (PDT)
X-Received: by 2002:adf:f34f:: with SMTP id e15mr26582689wrp.415.1593601680393; 
 Wed, 01 Jul 2020 04:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
 <20200604090553.10861-20-xia.jiang@mediatek.com>
 <20200611184640.GC8694@chromium.org>
 <1593485781.20112.43.camel@mhfsdcap03> <20200630165301.GA1212092@chromium.org>
 <1593592121.4007.33.camel@mhfsdcap03>
In-Reply-To: <1593592121.4007.33.camel@mhfsdcap03>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 1 Jul 2020 13:07:48 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DJsB70-Zr2asUCAMY9-eKHjE-nki5EsvUwzsPgL7WKmQ@mail.gmail.com>
Message-ID: <CAAFQd5DJsB70-Zr2asUCAMY9-eKHjE-nki5EsvUwzsPgL7WKmQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v9 18/18] media: platform: Add jpeg enc feature
To: Xia Jiang <xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_070804_310158_15306153 
X-CRM114-Status: GOOD (  46.79  )
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
 linux-devicetree <devicetree@vger.kernel.org>, mojahsu@chromium.org,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Rick Chang <rick.chang@mediatek.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?= <maoguang.meng@mediatek.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
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

On Wed, Jul 1, 2020 at 10:29 AM Xia Jiang <xia.jiang@mediatek.com> wrote:
>
> On Tue, 2020-06-30 at 16:53 +0000, Tomasz Figa wrote:
> > Hi Xia,
> >
> > On Tue, Jun 30, 2020 at 10:56:21AM +0800, Xia Jiang wrote:
> > > On Thu, 2020-06-11 at 18:46 +0000, Tomasz Figa wrote:
> > > > Hi Xia,
> > > >
> > > > On Thu, Jun 04, 2020 at 05:05:53PM +0800, Xia Jiang wrote:
> > [snip]
> > > > > +static void mtk_jpeg_enc_device_run(void *priv)
> > > > > +{
> > > > > +       struct mtk_jpeg_ctx *ctx = priv;
> > > > > +       struct mtk_jpeg_dev *jpeg = ctx->jpeg;
> > > > > +       struct vb2_v4l2_buffer *src_buf, *dst_buf;
> > > > > +       enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
> > > > > +       unsigned long flags;
> > > > > +       struct mtk_jpeg_src_buf *jpeg_src_buf;
> > > > > +       struct mtk_jpeg_enc_bs enc_bs;
> > > > > +       int ret;
> > > > > +
> > > > > +       src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> > > > > +       dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> > > > > +       jpeg_src_buf = mtk_jpeg_vb2_to_srcbuf(&src_buf->vb2_buf);
> > > > > +
> > > > > +       ret = pm_runtime_get_sync(jpeg->dev);
> > > > > +       if (ret < 0)
> > > > > +               goto enc_end;
> > > > > +
> > > > > +       spin_lock_irqsave(&jpeg->hw_lock, flags);
> > > > > +
> > > > > +       /*
> > > > > +        * Resetting the hardware every frame is to ensure that all the
> > > > > +        * registers are cleared. This is a hardware requirement.
> > > > > +        */
> > > > > +       mtk_jpeg_enc_reset(jpeg->reg_base);
> > > > > +
> > > > > +       mtk_jpeg_set_enc_dst(ctx, jpeg->reg_base, &dst_buf->vb2_buf, &enc_bs);
> > > > > +       mtk_jpeg_set_enc_src(ctx, jpeg->reg_base, &src_buf->vb2_buf);
> > > > > +       mtk_jpeg_enc_set_config(jpeg->reg_base, ctx->out_q.fmt->hw_format,
> > > > > +                               ctx->enable_exif, ctx->enc_quality,
> > > > > +                               ctx->restart_interval);
> > > > > +       mtk_jpeg_enc_start(jpeg->reg_base);
> > > >
> > > > Could we just move the above 5 functions into one function inside
> > > > mtk_jpeg_enc_hw.c that takes mtk_jpeg_dev pointer as its argument, let's
> > > > say mtk_jpeg_enc_hw_run() and simply program all the data to the registers
> > > > directly, without the extra level of abstractions?
> > > I can move the 5 functions into one function(mtk_jpeg_enc_hw_run()), but
> > > this function will be very long, because it contains computation code
> > > such as setting dst addr, blk_num, quality.
> > > In v4, you have adviced the following architecture:
> > > How about the following model, as used by many other drivers:
> > >
> > > mtk_jpeg_enc_set_src()
> > > {
> > >         // Set any registers related to source format and buffer
> > > }
> > >
> > > mtk_jpeg_enc_set_dst()
> > > {
> > >         // Set any registers related to destination format and buffer
> > > }
> > >
> > > mtk_jpeg_enc_set_params()
> > > {
> > >         // Set any registers related to additional encoding parameters
> > > }
> > >
> > > mtk_jpeg_enc_device_run(enc, ctx)
> > > {
> > >         mtk_jpeg_enc_set_src(enc, src_buf, src_fmt);
> > >         mtk_jpeg_enc_set_dst(enc, dst_buf, dst_fmt);
> > >         mtk_jpeg_enc_set_params(enc, ctx);
> > >         // Trigger the hardware run
> > > }
> > > I think that this architecture is more clear(mtk_jpeg_enc_set_config is
> > > equivalent to mtk_jpeg_enc_set_params).
> > > Should I keep the original architecture or move 5 functions into
> > > mtk_jpeg_enc_hw_run?
> >
> > Sounds good to me.
> >
> > My biggest issue with the code that it ends up introducing one more
> > level of abstraction, but with the approach you suggested, the arguments
> > just accept standard structs, which avoids that problem.
> Dear Tomasz,
>
> Sorry for that I didn't understand your final preference.
>
> As you mentioned, using mtk_jpeg_dev pointer as its argument, but some
> arguments come from mtk_jpeg_ctx pointer, such as ctx->enable_exif/
> ctx->enc_quality/ctx->restart_interval. Should we use  mtk_jpeg_ctx
> pointer as its argument? Should we use src_dma_addr/dst_dma_addr as its
> arguments too? Because that src_dma_addr/dst_dma_addr need to be getted
> by v4l2 interfaces(
> src_buf=v4l2_m2m_next_src_buf();
> src_dma_ddr=vb2_dma_contig_plane_dma_addr();).
> Using V4L2 interfaces in mtk_jpeg_enc_hw.c doesn't seem reasonable.
>
> solution 1:
> mtk_jpeg_enc_hw_run(ctx, src_dma_addr, dst_dma_addr)
> {
>         //Set all the registers
> without one more level of abstraction
> }
>
> solution 2:
> mtk_jpeg_enc_reset(jpeg)
> {
>         //set the reset register
> }
>
> mtk_jpeg_set_enc_dst(ctx, dst_dma_addr)
> {
>
>         //Set any registers related to destination format and buffer
> without one more level of abstraction
> }
> mtk_jpeg_set_enc_src(ctx, src_dma_addr)
> {
>
>         //Set any registers related to source format and buffer     without one
> more level of abstraction
> }
> mtk_jpeg_enc_set_config(ctx)
> {
>         // Set any registers related to additional encoding parameters
> without one more level of abstraction
> }
> mtk_jpeg_enc_start(jpeg)
> {
>         //set the trigger register
> }
>
> Solution 1 or Solution 2?

I like your previous proposal the most. Let me quote it below:

mtk_jpeg_enc_set_src()
{
        // Set any registers related to source format and buffer
}

mtk_jpeg_enc_set_dst()
{
        // Set any registers related to destination format and buffer
}

mtk_jpeg_enc_set_params()
{
        // Set any registers related to additional encoding parameters
}

mtk_jpeg_enc_device_run(enc, ctx)
{
        mtk_jpeg_enc_set_src(enc, src_buf, src_fmt);
        mtk_jpeg_enc_set_dst(enc, dst_buf, dst_fmt);
        mtk_jpeg_enc_set_params(enc, ctx);
        // Trigger the hardware run
}

That is assuming src/dst_buf would be vb2_buffer and src/dst_fmt
v4l2_pix_format_mplane. Does it make sense?

Best regards,
Tomasz

>
> Best Regards,
> Xia Jiang
> >
> > [snip]
> > > > > +
> > > > > +       ctx->fh.ctrl_handler = &ctx->ctrl_hdl;
> > > > > +       ctx->colorspace = V4L2_COLORSPACE_JPEG,
> > > > > +       ctx->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
> > > > > +       ctx->quantization = V4L2_QUANTIZATION_DEFAULT;
> > > > > +       ctx->xfer_func = V4L2_XFER_FUNC_DEFAULT;
> > > >
> > > > Since we already have a v4l2_pix_format_mplane struct which has fields for
> > > > the above 4 values, could we just store them there?
> > > >
> > > > Also, I don't see this driver handling the colorspaces in any way, but it
> > > > seems to allow changing them from the userspace. This is incorrect, because
> > > > the userspace has no way to know that the colorspace is not handled.
> > > > Instead, the try_fmt implementation should always override the
> > > > userspace-provided colorspace configuration with the ones that the driver
> > > > assumes.
> > > >
> > > > > +       pix_mp->width = MTK_JPEG_MIN_WIDTH;
> > > > > +       pix_mp->height = MTK_JPEG_MIN_HEIGHT;
> > > > > +
> > > > > +       q->fmt = mtk_jpeg_find_format(V4L2_PIX_FMT_YUYV,
> > > > > +                                     MTK_JPEG_FMT_FLAG_ENC_OUTPUT);
> > > > > +       vidioc_try_fmt(container_of(pix_mp, struct v4l2_format,
> > > > > +                                   fmt.pix_mp), q->fmt);
> > > > > +       q->w = pix_mp->width;
> > > > > +       q->h = pix_mp->height;
> > > > > +       q->crop_rect.width = pix_mp->width;
> > > > > +       q->crop_rect.height = pix_mp->height;
> > > > > +       q->sizeimage[0] = pix_mp->plane_fmt[0].sizeimage;
> > > > > +       q->bytesperline[0] = pix_mp->plane_fmt[0].bytesperline;
> > > >
> > > > Actually, do we need this custom mtk_jpeg_q_data struct? Why couldn't we
> > > > just keep the same values inside the standard v4l2_pix_format_mplane
> > > > struct?
> > > I think that we need mtk_jpeg_q_data struct.If we delete it, how can we
> > > know these values(w, h, sizeimage, bytesperline, mtk_jpeg_fmt) belong to
> > > output or capture(output and capture's sizeimages are different, width
> > > and height are differnt too for jpeg dec )?We have
> > > s_fmt_vid_out_mplane/cap_mplane function to set these values.
> > >
> > > But we can use standard v4l2_pix_format_mplane struct replacing the w, h
> > > bytesperline, sizeimage in mtk_jpeg_q_data struct like this:
> > > struct mtk_jpeg_q_data{
> > >     struct mtk_jpeg_fmt *fmt;
> > >     struct v4l2_pix_format_mplane pix_mp;
> > >     struct v4l2_rect enc_crop_rect
> > > }
> > > Then delete ctx->colorspace ctx->ycbcr_enc ctx->quantization
> > > ctx->xfer_func, becuase v4l2_pix_format_mplane in q_data has contained
> > > them and assign them for out_q and cap_q separately.
> > >
> > > WDYT?
> >
> > Sounds good to me. I was considering just making it like
> >
> > struct mtk_jpeg_ctx {
> >       struct mtk_jpeg_fmt *src_fmt;
> >       struct v4l2_pix_format_mplane src_pix_mp;
> >       struct v4l2_rect src_crop;
> >
> >       struct mtk_jpeg_fmt *dst_fmt;
> >       struct v4l2_pix_format_mplane dst_pix_mp;
> >       struct v4l2_rect dst_crop;
> > };
> >
> > but I like your suggestion as well, as long as custom data structures
> > are not used to store standard information.
> > [snip]
> > > > > @@ -1042,8 +1619,12 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
> > > > >                 return jpeg_irq;
> > > > >         }
> > > > >
> > > > > -       ret = devm_request_irq(&pdev->dev, jpeg_irq, mtk_jpeg_dec_irq, 0,
> > > > > -                              pdev->name, jpeg);
> > > > > +       if (jpeg->variant->is_encoder)
> > > > > +               ret = devm_request_irq(&pdev->dev, jpeg_irq, mtk_jpeg_enc_irq,
> > > > > +                                      0, pdev->name, jpeg);
> > > > > +       else
> > > > > +               ret = devm_request_irq(&pdev->dev, jpeg_irq, mtk_jpeg_dec_irq,
> > > > > +                                      0, pdev->name, jpeg);
> > > >
> > > > Rather than having "is_encoder" in the variant struct, would it make more
> > > > sense to have "irq_handler" instead? That would avoid the explicit if.
> > > Do you mean to delete "is_encoder"? It is used 8 times in the
> > > driver.Should I move them all to the match data?
> >
> > Yes. It would make the code linear and the varability between the
> > decoder and encoder would be self-contained in the variant struct.
> >
> > Best regards,
> > Tomasz
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
