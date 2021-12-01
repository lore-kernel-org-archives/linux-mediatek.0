Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53CEC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 23:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qv/lirXFuKCnIUz4EWJC+d7+tdYKcBBG9pWeqsFjPHU=; b=WrabZiACIyWP/e
	DE2G7+FPkoSKA/j4R4+/YFR1bsvSJjoG18R9AH67oSEDWVVMinhDNemYbs00ktum0Xot38rB5pH8U
	hV/tox7P2iuL+dWjx/50MqLeZIjto2ZDA+GWfK+MuK4UtHxrYSM8o7jNJQlFEYet9NQvFe5crFNQ1
	7es3JFPrk6OqvgZifOyUivqBJWEBCQiPP7iafzoEA6vRlfJ5n2Ewk8KqIFV4mB9jJUn91ViLhuBeY
	k84gkg4Cwdq8IR2oflVUKKREJa3PFBtmSWiN+OXNvQp74hL2w+CKU5tnQn4vT1SLFzq+IrWu7gfct
	31PXeMIDOw/bvbALH/KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msZVH-00AMYJ-AC; Wed, 01 Dec 2021 23:59:11 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msZUz-00AMOe-J1
 for linux-mediatek@lists.infradead.org; Wed, 01 Dec 2021 23:58:55 +0000
Received: by mail-qt1-x835.google.com with SMTP id 8so25870327qtx.5
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Dec 2021 15:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mKAVFtfRZpn9mek6iPysBIxAT9sFeNDh1PJVk69vAok=;
 b=UiQtL7PYDLYrQNpaKD6zuScFDLJgXtjIiVUSuenai/weJwHaNZGd50drPKnS644xJI
 FsIUoEA38p0/+CgS2GnR18T3SWsehh9cfFdQhsGcYNw83eEXy2yN0V551YDlQed1a5ia
 suumy0/x42VakjEbn2dWsY6UEt7ktkLXMzUVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mKAVFtfRZpn9mek6iPysBIxAT9sFeNDh1PJVk69vAok=;
 b=BTqhyYzc4yQ+JqkIZViGKlehTmKDK4hirEoMGSiR7bdnYblrtwyPd/iyYoIAR9UQDQ
 R21zEifwg6TDmmjC3fJr0GSpOqdkmchn50yw6i51bSnvRtWRW9in6H1LXtWcjSQrcof1
 7IgMghAxkOEui0u1LNNhkv+HGPLiqjbs1hRbTvNlWWxbr22HyBmUxXxNt+x0+77Q1Y55
 ujdn9IqdVdYbDVQarwJkodn2OMzRrU/soqZDSzWdOgQBdVMsrKwB8xs+NNKawCnif2nV
 MrfH20/UMlkq0OoewlgpnTzQczkMsGeU5BFIa1Nm0AeW1DyXvKy9RFlJr5MLd98czoSH
 52iw==
X-Gm-Message-State: AOAM530s7ftBY6WCUJ2UFbh6jYT/yj9OTRiocfDjXyWOJaUANr+Vdrva
 LX4tMat4oTpYX8H01mydtMXUO3r+GWC7A4ZIVyRfGA==
X-Google-Smtp-Source: ABdhPJxjAowIZNevtYxc/JYBCkiAIs98qYglgiULGYpJOCGmpv/QaOf2gRWJM912xU3UVIlhW8QOcnJt6ZYIil4W+Lg=
X-Received: by 2002:a05:622a:130e:: with SMTP id
 v14mr10542855qtk.458.1638403121278; 
 Wed, 01 Dec 2021 15:58:41 -0800 (PST)
MIME-Version: 1.0
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-3-yunfei.dong@mediatek.com>
 <CAC-pXoPXc=q8KPUcSfY6XZ=sLt71vDZbJV=f4SZx55Gc6VbRQw@mail.gmail.com>
In-Reply-To: <CAC-pXoPXc=q8KPUcSfY6XZ=sLt71vDZbJV=f4SZx55Gc6VbRQw@mail.gmail.com>
From: Steve Cho <stevecho@chromium.org>
Date: Wed, 1 Dec 2021 15:58:30 -0800
Message-ID: <CAC-pXoPtPb1y8c5FovXJ_T-689t_RRdyGu=54yr9BufDK+zmkw@mail.gmail.com>
Subject: Re: [PATCH v11, 02/19] media: mtk-vcodec: Align vcodec wake up
 interrupt interface
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Tzung-Bi Shih <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_155853_658044_4B493D68 
X-CRM114-Status: GOOD (  21.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Reviewed-by: Steve Cho <stevecho@chromium.org>

On Wed, Dec 1, 2021 at 3:55 PM Steve Cho <stevecho@chromium.org> wrote:
>
> LGTM.
>
> On Sun, Nov 28, 2021 at 7:44 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> >
> > Vdec and venc can use the same function to wake up interrupt event.
> >
> > Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 9 +--------
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h     | 8 ++++++++
> >  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 8 --------
> >  3 files changed, 9 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > index 59caf2163349..055d50e52720 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > @@ -31,13 +31,6 @@
> >  module_param(mtk_v4l2_dbg_level, int, 0644);
> >  module_param(mtk_vcodec_dbg, bool, 0644);
> >
> > -/* Wake up context wait_queue */
> > -static void wake_up_ctx(struct mtk_vcodec_ctx *ctx)
> > -{
> > -       ctx->int_cond = 1;
> > -       wake_up_interruptible(&ctx->queue);
> > -}
> > -
> >  static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
> >  {
> >         struct mtk_vcodec_dev *dev = priv;
> > @@ -69,7 +62,7 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int irq, void *priv)
> >         writel((readl(vdec_misc_addr) & ~VDEC_IRQ_CLR),
> >                 dev->reg_base[VDEC_MISC] + VDEC_IRQ_CFG_REG);
> >
> > -       wake_up_ctx(ctx);
> > +       wake_up_ctx(ctx, MTK_INST_IRQ_RECEIVED);
>
> Assuming setting up reason doesn't change functionality.
>
> >
> >         mtk_v4l2_debug(3,
> >                         "mtk_vcodec_dec_irq_handler :wake up ctx %d, dec_done_status=%x",
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > index 581522177308..1d2370608d0d 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > @@ -473,4 +473,12 @@ static inline struct mtk_vcodec_ctx *ctrl_to_ctx(struct v4l2_ctrl *ctrl)
> >         return container_of(ctrl->handler, struct mtk_vcodec_ctx, ctrl_hdl);
> >  }
> >
> > +/* Wake up context wait_queue */
> > +static inline void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason)
> > +{
> > +       ctx->int_cond = 1;
> > +       ctx->int_type = reason;
> > +       wake_up_interruptible(&ctx->queue);
> > +}
> > +
> >  #endif /* _MTK_VCODEC_DRV_H_ */
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > index eed67394cf46..7c3487fb3498 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> > @@ -65,14 +65,6 @@ static const struct mtk_video_fmt mtk_video_formats_capture_vp8[] =  {
> >         },
> >  };
> >
> > -/* Wake up context wait_queue */
> > -static void wake_up_ctx(struct mtk_vcodec_ctx *ctx, unsigned int reason)
> > -{
> > -       ctx->int_cond = 1;
> > -       ctx->int_type = reason;
> > -       wake_up_interruptible(&ctx->queue);
> > -}
> > -
> >  static void clean_irq_status(unsigned int irq_status, void __iomem *addr)
> >  {
> >         if (irq_status & MTK_VENC_IRQ_STATUS_PAUSE)
> > --
> > 2.25.1
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
