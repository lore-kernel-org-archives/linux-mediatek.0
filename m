Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7A7C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 11:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5okvqKg2PDE61SDmVWij9bFE6XRmgrUMwiefGKRk0xM=; b=yDaHj28vxDgBZf
	UUhvoLydFe06bPknA0f7qau4JqZMlh8lSSURk7w0ZXiQ3enTJb19BAIHCa2GEO4MjzW/DVbbN3UWI
	IqgTHUeC7elr/sclmOSfCEf/MnIdvezgRxX/T8FUUqL/PvS/Wdhr2bbsQw7NLm/b/8x7/RsOst+CI
	Mgeg5blTtykqYUGauTf5RTlzKKIDf6hlzwg4gjL3scTvndYhId8XtF7iicwXCQ60wDilLosnOzabu
	svEC0QwXNNkpz5+S0DJHhxOMsgFmpBHJuZbCltYRDKFcuqru6rfrr9ccjKul2Fg6WHL32fAoEKS+5
	jbZ6Qh4pWRg5dMJCJTNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNYjY-004ftE-UK; Fri, 25 Feb 2022 11:26:00 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNYjV-004fri-6y
 for linux-mediatek@lists.infradead.org; Fri, 25 Feb 2022 11:25:59 +0000
Received: by mail-ot1-x32a.google.com with SMTP id
 s1-20020a056830148100b005acfdcb1f4bso3387086otq.4
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Feb 2022 03:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=j9eyYj+TimaALQqMan/85f4JKhFDdx91y1LEUa+DlHQ=;
 b=2v+GTA0YCk6bKgTKJZj9HZtCDJ2vR1Fc3EAyl9SVBsGbEDfBdrmqjXMUIBIC+60reL
 54YtDEgu3l/Dwznnnt+ATKFLQvco/+ZmIASsBmYI58IKO+wfI0z+IW5ncd1QR0Op/i7R
 EEJLdjfp/hsJxoHxKfEZDfxKo95UHZV02Zhs5lhmY1REgGdN+UT/XFgJ/eJTR4zOTXcx
 HKlMI1EhOsdl9iwtZdew+TtkbnaJJLeeoAf/jMMtNTAPGd3PbzM5NE37KXr+iMKBSnVJ
 NXwWHUWqXdfmVjIT+SeRlErTlpDX21mZXJd+8oUwkvHxIWCJNDEw2xFHwppA0Qe8Xop4
 KtMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=j9eyYj+TimaALQqMan/85f4JKhFDdx91y1LEUa+DlHQ=;
 b=b5bOvFECU+dllYlJnh/FbmGx1ZWe9EykoUO/9blqu59FllA7eo9w8hCrekz0o4BRlY
 VwaI3F5SPrWqwOLscG37etmvSBH2Z4cpGLchV8fWZBMz7ivmKmiFTrw1dFe5c6cLnkvm
 VkOm2lYCPLx+LXfZPGtCU7RDPrC/iLwdv79AZihf0oykQdQLOdgTLSHQu9dI0E7/Witc
 JWsNmmVeqTgZH+HCGcd6ktTDDykvyrEbb9jHvEIfFbcaR7f5l53tqYnXLCMWuAqwUgLA
 ldo2Hd/Ofw3zVHn6hS/tueh+Gt7jswWUXelxsR5Joh8FeiRPylc3uA5tLCXDWtSjNQ7E
 M3EQ==
X-Gm-Message-State: AOAM533FNK4uXApaAOfC2DD5sYmihmR+PoFNsPYRQZ66x0Al8kUL27io
 7F5Fvrzw1Cmay0J6RANSkdjuAc8gdhLQSlvZrwIiXA==
X-Google-Smtp-Source: ABdhPJwNw2wtPy0KHL3PQiqYEhiPmCxk6rAq4qGFNwnWtoy0ePuAtjLH/96gTq6wUc67Tr53dh5BA2lPIP17pn6Z4AM=
X-Received: by 2002:a05:6830:3113:b0:5af:4eec:6132 with SMTP id
 b19-20020a056830311300b005af4eec6132mr2557082ots.6.1645788356151; Fri, 25 Feb
 2022 03:25:56 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 03:25:55 -0800
MIME-Version: 1.0
In-Reply-To: <20220221094420.5oqsydyjvub7d7h3@houat>
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-14-granquet@baylibre.com>
 <20220221094420.5oqsydyjvub7d7h3@houat>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Fri, 25 Feb 2022 03:25:55 -0800
Message-ID: <CABnWg9uq_b2=UsVaDD2HzBwD0ep8CWaH-EjGd1Uud29o1gQO1w@mail.gmail.com>
Subject: Re: [PATCH v8 13/19] drm/mediatek: dpi: Add dpintf support
To: Maxime Ripard <maxime@cerno.tech>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie, 
 daniel@ffwll.ch, robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com, 
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com, 
 jitao.shi@mediatek.com, angelogioacchino.delregno@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-fbdev@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_032557_295565_AE40ECD7 
X-CRM114-Status: GOOD (  40.50  )
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

Quoting Maxime Ripard (2022-02-21 10:44:20)
> Hi
>
> (Now I remember your series ;)
Hi,

I'm not sure this is a good thing though :)

>
> On Fri, Feb 18, 2022 at 03:54:31PM +0100, Guillaume Ranquet wrote:
> > dpintf is the displayport interface hardware unit. This unit is similar
> > to dpi and can reuse most of the code.
> >
> > This patch adds support for mt8195-dpintf to this dpi driver. Main
> > differences are:
> >  - Some features/functional components are not available for dpintf
> >    which are now excluded from code execution once is_dpintf is set
> >  - dpintf can and needs to choose between different clockdividers based
> >    on the clockspeed. This is done by choosing a different clock parent.
> >  - There are two additional clocks that need to be managed. These are
> >    only set for dpintf and will be set to NULL if not supplied. The
> >    clk_* calls handle these as normal clocks then.
> >  - Some register contents differ slightly between the two components. To
> >    work around this I added register bits/masks with a DPINTF_ prefix
> >    and use them where different.
> >
> > Based on a separate driver for dpintf created by
> > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> >
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c          | 164 +++++++++++++++++---
> >  drivers/gpu/drm/mediatek/mtk_dpi_regs.h     |  38 +++++
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   8 +
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   5 +-
> >  include/linux/soc/mediatek/mtk-mmsys.h      |   2 +
> >  6 files changed, 198 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index be99399faf1bb..c5639ada868f8 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -63,6 +63,14 @@ enum mtk_dpi_out_color_format {
> >       MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
> >  };
> >
> > +enum TVDPLL_CLK {
> > +     TVDPLL_PLL = 0,
> > +     TVDPLL_D2 = 2,
> > +     TVDPLL_D4 = 4,
> > +     TVDPLL_D8 = 8,
> > +     TVDPLL_D16 = 16,
> > +};
> > +
> >  struct mtk_dpi {
> >       struct drm_encoder encoder;
> >       struct drm_bridge bridge;
> > @@ -71,8 +79,10 @@ struct mtk_dpi {
> >       void __iomem *regs;
> >       struct device *dev;
> >       struct clk *engine_clk;
> > +     struct clk *dpi_ck_cg;
> >       struct clk *pixel_clk;
> >       struct clk *tvd_clk;
> > +     struct clk *pclk_src[5];
> >       int irq;
> >       struct drm_display_mode mode;
> >       const struct mtk_dpi_conf *conf;
> > @@ -126,6 +136,7 @@ struct mtk_dpi_conf {
> >       const u32 *output_fmts;
> >       u32 num_output_fmts;
> >       bool is_ck_de_pol;
> > +     bool is_dpintf;
> >       bool swap_input_support;
> >       // Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH (no shift)
> >       u32 dimension_mask;
> > @@ -384,6 +395,25 @@ static void mtk_dpi_config_disable_edge(struct mtk_dpi *dpi)
> >               mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0, EDGE_SEL_EN);
> >  }
> >
> > +static void mtk_dpi_matrix_sel(struct mtk_dpi *dpi, enum mtk_dpi_out_color_format format)
> > +{
> > +     u32 matrix_sel = 0;
> > +
> > +     switch (format) {
> > +     case MTK_DPI_COLOR_FORMAT_YCBCR_422:
> > +     case MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL:
> > +     case MTK_DPI_COLOR_FORMAT_YCBCR_444:
> > +     case MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL:
> > +     case MTK_DPI_COLOR_FORMAT_XV_YCC:
> > +             if (dpi->mode.hdisplay <= 720)
> > +                     matrix_sel = 0x2;
> > +             break;
> > +     default:
> > +             break;
> > +     }
> > +     mtk_dpi_mask(dpi, DPI_MATRIX_SET, matrix_sel, INT_MATRIX_SEL_MASK);
> > +}
> > +
> >  static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
> >                                       enum mtk_dpi_out_color_format format)
> >  {
> > @@ -391,6 +421,7 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
> >           (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
> >               mtk_dpi_config_yuv422_enable(dpi, false);
> >               mtk_dpi_config_csc_enable(dpi, true);
> > +             mtk_dpi_matrix_sel(dpi, format);
> >               if (dpi->conf->swap_input_support)
> >                       mtk_dpi_config_swap_input(dpi, false);
> >               mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_BGR);
> > @@ -398,6 +429,7 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
> >                  (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
> >               mtk_dpi_config_yuv422_enable(dpi, true);
> >               mtk_dpi_config_csc_enable(dpi, true);
> > +             mtk_dpi_matrix_sel(dpi, format);
> >               if (dpi->conf->swap_input_support)
> >                       mtk_dpi_config_swap_input(dpi, true);
> >               mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
> > @@ -438,6 +470,8 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
> >       mtk_dpi_disable(dpi);
> >       clk_disable_unprepare(dpi->pixel_clk);
> >       clk_disable_unprepare(dpi->engine_clk);
> > +     clk_disable_unprepare(dpi->dpi_ck_cg);
> > +     clk_disable_unprepare(dpi->tvd_clk);
> >  }
> >
> >  static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> > @@ -447,12 +481,24 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> >       if (++dpi->refcount != 1)
> >               return 0;
> >
> > +     ret = clk_prepare_enable(dpi->tvd_clk);
> > +     if (ret) {
> > +             dev_err(dpi->dev, "Failed to enable tvd pll: %d\n", ret);
> > +             goto err_pixel;
> > +     }
> > +
> >       ret = clk_prepare_enable(dpi->engine_clk);
> >       if (ret) {
> >               dev_err(dpi->dev, "Failed to enable engine clock: %d\n", ret);
> >               goto err_refcount;
> >       }
> >
> > +     ret = clk_prepare_enable(dpi->dpi_ck_cg);
> > +     if (ret) {
> > +             dev_err(dpi->dev, "Failed to enable dpi_ck_cg clock: %d\n", ret);
> > +             goto err_ck_cg;
> > +     }
> > +
> >       ret = clk_prepare_enable(dpi->pixel_clk);
> >       if (ret) {
> >               dev_err(dpi->dev, "Failed to enable pixel clock: %d\n", ret);
> > @@ -462,10 +508,11 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> >       if (dpi->pinctrl && dpi->pins_dpi)
> >               pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
> >
> > -     mtk_dpi_enable(dpi);
> >       return 0;
> >
> >  err_pixel:
> > +     clk_disable_unprepare(dpi->dpi_ck_cg);
> > +err_ck_cg:
> >       clk_disable_unprepare(dpi->engine_clk);
> >  err_refcount:
> >       dpi->refcount--;
> > @@ -497,12 +544,21 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
> >       pll_rate = clk_get_rate(dpi->tvd_clk);
> >
> >       vm.pixelclock = pll_rate / factor;
> > -     if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
> > -         (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
> > +     if (dpi->conf->is_dpintf) {
> > +             if (factor == 1)
> > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_src[2]);
> > +             else if (factor == 2)
> > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_src[3]);
> > +             else if (factor == 4)
> > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_src[4]);
> > +             else
> > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_src[2]);
>
> You get a reference to these clocks using:
> >
> > +     dpi->pclk_src[1] = devm_clk_get(dev, "TVDPLL_D2");
> > +     dpi->pclk_src[2] = devm_clk_get(dev, "TVDPLL_D4");
> > +     dpi->pclk_src[3] = devm_clk_get(dev, "TVDPLL_D8");
> > +     dpi->pclk_src[4] = devm_clk_get(dev, "TVDPLL_D16");
> > +
>
> So if the clock isn't there, you'll get an error pointer, won't check
> it, but will dereference it.
>
> If the clock is optional, you should use clk_get_optional, otherwise you
> should check the error returned.
>
> That clock setup is weird though. I don't have any knowledge about your
> platform, but either the clock should be a single one if it has multiple
> dividers, or the pixel_clk clock should behave as a mux and just pick
> the best parent for the rate it's given.
>
> Maxime

You're right about the error management... but even worse, those clocks
were removed in an earlier version of the patch [1]
I have reintroduced that bit of code in v7 by mistake when I applied
fixes coming from mediatek engineers.

I don't know anything about dp/dpi or display in general, but the design
posted by markus in v1 [2] seemed closed to what you are suggesting.


Thx,
Guillaume.

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210816192523.1739365-3-msp@baylibre.com/#24384971
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/20210906193529.718845-6-msp@baylibre.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
