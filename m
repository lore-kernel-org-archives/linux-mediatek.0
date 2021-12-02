Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CE0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 14:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F5sH/KbaExju42eAVU0MNc72bkfsW2kvScScfO9+quc=; b=aZzy14dqlFEAI4
	pnDrMdzqJXh4AamXk4HBLbE9/0KkNYr/6NLdMQA0EGpnMTkyGdxln/WoCm8vSoq18lvDsAY3b1vL6
	AkSkf4vaZ/O/sth9bP3dg4812q1RnpbkZn2M6ttSnU1mga8qG3TYUMapZa65QZIS5zVu8qhz4D3ft
	yzjxy/+IO8Fi9w/YQ6U7X+AWVTBDPWfkgVfrKgGMN4g21I/qtGrS1kovjR3azL+QCpspkwh1AKX7d
	XCWBxkjYYfyf5tiKKeHdG/3CIBqWgjrGy8k92TfU84sIecs6b06LKsBFOFK9kOfH0+x5P7MYEjwzL
	2SYYTHKXgom+25GcWCUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msnOH-00CeZ2-Tk; Thu, 02 Dec 2021 14:48:53 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msnNf-00CeHG-OO
 for linux-mediatek@lists.infradead.org; Thu, 02 Dec 2021 14:48:19 +0000
Received: by mail-ot1-x32b.google.com with SMTP id
 n17-20020a9d64d1000000b00579cf677301so40225821otl.8
 for <linux-mediatek@lists.infradead.org>; Thu, 02 Dec 2021 06:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Zvp6r4mCs/8L9l1dbZwuzFtnt8Ckc6Ar0XXFO95rJ+I=;
 b=EgLe8vM5wTzSadMvkxe2YhCrRZ5rJe4UllvUeRTvTxKMUjtYNuzE/ELYtOE4LJlH2S
 d3EajocreNP1tep7qWjPzf8/fNEkCG6Wb1zbrPtkMXhJlYAVm6+unLAPiQ8thwtA0fvs
 SVaLA7iP6brGPfCngvQsQpyFELgnuz0of54soy5O0KTIJzylp5FCYBic6TPAN6Zn3JIC
 saORt/CjJw7wYqMbokiCd1osh8ULU8W22wHEpSAxkg1089viXggev1JhmSYP8Hfyl+zS
 kTtEkNfcckXLUaoWej7uGr+8dKMZGyKGl/2p9QpPXsPJXL5P2mw71Sw3OTcrDFpLaw/A
 3LYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Zvp6r4mCs/8L9l1dbZwuzFtnt8Ckc6Ar0XXFO95rJ+I=;
 b=AZEk9/efMd3wX9rcqgVXGWJOQHwOI2IKrTEzCz2JQqPGl9nizA4R6HY2GFpXafq/GB
 Fpt6NGrodCXASgAus/GaSYe+6IwvS0USty8bqa1IHtez0G1D10k8TE6Wo9Fj4DrwPZ3Q
 fAq9GJsKnTcO25zUjZASgrxLc1XQwiUWL43rpHCMVOMB6FX3AYu3xRDOZ3NgUPec4RkR
 Nlpbez0DdkOMJ2F9BjTD+ROT422bysFEJcIRuJntVwo7Bxygz6iCMKU711UwgIwkxC+s
 aq0DMockO6UV/B++13S/fSuvmZHQPnN/xyu8MdI7maFQllvr/838KtFidZ0Ewvnku2Ze
 Q/3w==
X-Gm-Message-State: AOAM531TTC6VZwHDbMZ4osiO6ow3tEkThOHv74gytdF2vx7+m/DjEStd
 YcJBip7YLGiS0A7cRX3GazztwQ9peCINkkjIUkLhVQ==
X-Google-Smtp-Source: ABdhPJzWJK8b2mM4PCn4eSNMu5WxHg/rdPi4EfivT7kAzZPjBYljUa/r31earj4x9CqhuF1K+MiVMfzd77vGdZ03iBI=
X-Received: by 2002:a9d:2aa3:: with SMTP id e32mr11644849otb.6.1638456493599; 
 Thu, 02 Dec 2021 06:48:13 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Dec 2021 06:48:12 -0800
MIME-Version: 1.0
In-Reply-To: <20211125143034.tzikvlxxl6fdhsif@gilmour>
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-8-granquet@baylibre.com>
 <20211115101129.lyxxmb6i7paaonwi@gilmour>
 <CABnWg9tNPGZSi1RLqF5+Qs1GHtynyVoOzAyw+i9mPRYEoByk8g@mail.gmail.com>
 <20211116145112.xyoxzfll6exysnvt@gilmour>
 <CABnWg9uhuchdWyBeTacR6Cy0A9OHziUi051BQ5wsZVU0ajYjyA@mail.gmail.com>
 <20211125143034.tzikvlxxl6fdhsif@gilmour>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Thu, 2 Dec 2021 06:48:12 -0800
Message-ID: <CABnWg9tcWdfPQwNtFhqVZxCriT848fy42VHoQZs3X2UmL4LYSA@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] drm/mediatek: Add mt8195 DisplayPort driver
To: Maxime Ripard <maxime@cerno.tech>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_064815_830844_B8391413 
X-CRM114-Status: GOOD (  56.53  )
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

Hi,

Quoting Maxime Ripard (2021-11-25 15:30:34)
> On Wed, Nov 24, 2021 at 01:45:21PM +0000, Guillaume Ranquet wrote:
> > Hi,
> > Thanks for all your input, really appreciated.
> >
> > Quoting Maxime Ripard (2021-11-16 15:51:12)
> > > Hi,
> > >
> > > On Mon, Nov 15, 2021 at 09:33:52AM -0500, Guillaume Ranquet wrote:
> > > > Quoting Maxime Ripard (2021-11-15 11:11:29)
> > > > > > The driver creates a child device for the phy. The child device will
> > > > > > never exist without the parent being active. As they are sharing a
> > > > > > register range, the parent passes a regmap pointer to the child so that
> > > > > > both can work with the same register range. The phy driver sets device
> > > > > > data that is read by the parent to get the phy device that can be used
> > > > > > to control the phy properties.
> > > > >
> > > > > If the PHY is in the same register space than the DP controller, why do
> > > > > you need a separate PHY driver in the first place?
> > > >
> > > > This has been asked by Chun-Kuang Hu in a previous revision of the series:
> > > >
> > > > https://lore.kernel.org/linux-mediatek/CAAOTY_-+T-wRCH2yw2XSm=ZbaBbqBQ4EqpU2P0TF90gAWQeRsg@mail.gmail.com/
> > >
> > > It's a bit of a circular argument though :)
> > >
> > > It's a separate phy driver because it needs to go through another
> > > maintainer's tree, but it needs to go through another maintainer's tree
> > > because it's a separate phy driver.
> > >
> > > It doesn't explain why it needs to be a separate phy driver? Why can't
> > > the phy setup be done directly in the DP driver, if it's essentially a
> > > single device?
> > >
> > > That being said, usually what those kind of questions mean is that
> > > you're missing a comment or something in the commit log to provide that
> > > context in the first place, so it would be great to add that context
> > > here.
> > >
> > > And it will avoid the situation we're now in where multiple reviewers
> > > ask the same questions over and over again :)
> > >
> > At first I didn't understand your reply, then I realized I gave you
> > the wrong link...
> > my bad! I'm struggling a bit with mail reviews, but I'll get there eventually.
> >
> > The driver and phy were a single driver until v2 of this patch series
> > and the phy setup
> > was done directly in the driver (single driver, single C file).
> > Here's the relevant link to the discussion between Chun-Kuang and Markus
> >
> > https://lore.kernel.org/linux-mediatek/CAAOTY__cJMqcAieEraJ2sz4gi0Zs-aiNXz38_x7dPQea6HvYEg@mail.gmail.com/#t
> >
> > I'll try to find a way to make it clearer for v7.
>
> OK, it makes sense then :)
>
> There's something weird though: the devices definitely look like they're
> in a separate register range, yet you mention a regmap to handle the
> shared register range. That range doesn't seem described anywhere in the
> device tree though? What is it for?
>

My understanding is that 0x1000 to 0x1fff controls the phy functionalities and
 0x2000 to 0x4fff controls "non-phy" functionalities.
And you are right, there's no description of that in the device tree whatsoever.
The ranges are in the same actual device and thus it has been decided
to not have
dt-bindings for the phy device.

The phy driver is a child of the DP driver that we register using
platform_device_register_data() and we pass along the same regmap as the DP
driver in its platform data.

I'm not sure I've understood and fully replied to the question...

> > > > > > +static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
> > > > > > +                                     struct drm_bridge_state *old_state)
> > > > > > +{
> > > > > > +     struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> > > > > > +     struct drm_connector *conn;
> > > > > > +     struct drm_connector_state *conn_state;
> > > > > > +     struct drm_crtc *crtc;
> > > > > > +     struct drm_crtc_state *crtc_state;
> > > > > > +     int ret = 0;
> > > > > > +     int i;
> > > > > > +
> > > > > > +     conn = drm_atomic_get_new_connector_for_encoder(old_state->base.state,
> > > > > > +                                                     bridge->encoder);
> > > > > > +     if (!conn) {
> > > > > > +             drm_err(mtk_dp->drm_dev,
> > > > > > +                     "Can't enable bridge as connector is missing\n");
> > > > > > +             return;
> > > > > > +     }
> > > > > > +
> > > > > > +     memcpy(mtk_dp->connector_eld, conn->eld, MAX_ELD_BYTES);
> > > > >
> > > > > This should be protected by a mutex (just like any resource shared
> > > > > between KMS and ALSA)
> > > >
> > > > Ok.
> > >
> > > I forgot to ask (even though checkpatch does mention it iirc), but since
> > > you have multiple mutex it would be nice to have a comment for each
> > > mutex stating exactly what it protects, and against what.
> > >
> > > It's hard otherwise to remember or figure out what the locks are here
> > > for.
> > >
> > > > > > +     ret = mtk_dp_dt_parse_pdata(mtk_dp, pdev);
> > > > > > +     if (ret)
> > > > > > +             return ret;
> > > > >
> > > > > pdata?
> > > > >
> > > > can you elaborate?
> > >
> > > Sorry, yeah, pdata is usually the abbreviation used in linux for the
> > > platform_data mechanism, but you're using the DT to retrieve your
> > > resources (and platform_data usually don't involve any parsing), so the
> > > name is odd.
> > >
> > > > > > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > > > index 384074f69111b..e6e88e3cd811d 100644
> > > > > > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > > > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > > > > @@ -63,6 +63,14 @@ enum mtk_dpi_out_color_format {
> > > > > >       MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
> > > > > >  };
> > > > > >
> > > > > > +enum TVDPLL_CLK {
> > > > > > +     TVDPLL_PLL = 0,
> > > > > > +     TVDPLL_D2 = 2,
> > > > > > +     TVDPLL_D4 = 4,
> > > > > > +     TVDPLL_D8 = 8,
> > > > > > +     TVDPLL_D16 = 16,
> > > > > > +};
> > > > > > +
> > > > > >  struct mtk_dpi {
> > > > > >       struct drm_encoder encoder;
> > > > > >       struct drm_bridge bridge;
> > > > > > @@ -71,8 +79,10 @@ struct mtk_dpi {
> > > > > >       void __iomem *regs;
> > > > > >       struct device *dev;
> > > > > >       struct clk *engine_clk;
> > > > > > +     struct clk *dpi_ck_cg;
> > > > > >       struct clk *pixel_clk;
> > > > > >       struct clk *tvd_clk;
> > > > > > +     struct clk *pclk_src[5];
> > > > > >       int irq;
> > > > > >       struct drm_display_mode mode;
> > > > > >       const struct mtk_dpi_conf *conf;
> > > > > > @@ -135,6 +145,7 @@ struct mtk_dpi_conf {
> > > > > >       u32 hvsize_mask;
> > > > > >       u32 channel_swap_shift;
> > > > > >       u32 yuv422_en_bit;
> > > > > > +     u32 csc_enable_bit;
> > > > > >       const struct mtk_dpi_yc_limit *limit;
> > > > > >  };
> > > > > >
> > > > > > @@ -365,7 +376,7 @@ static void mtk_dpi_config_yuv422_enable(struct mtk_dpi *dpi, bool enable)
> > > > > >
> > > > > >  static void mtk_dpi_config_csc_enable(struct mtk_dpi *dpi, bool enable)
> > > > > >  {
> > > > > > -     mtk_dpi_mask(dpi, DPI_CON, enable ? CSC_ENABLE : 0, CSC_ENABLE);
> > > > > > +     mtk_dpi_mask(dpi, DPI_CON, enable ? dpi->conf->csc_enable_bit : 0, dpi->conf->csc_enable_bit);
> > > > > >  }
> > > > > >
> > > > > >  static void mtk_dpi_config_swap_input(struct mtk_dpi *dpi, bool enable)
> > > > > > @@ -384,22 +395,45 @@ static void mtk_dpi_config_disable_edge(struct mtk_dpi *dpi)
> > > > > >               mtk_dpi_mask(dpi, dpi->conf->reg_h_fre_con, 0, EDGE_SEL_EN);
> > > > > >  }
> > > > > >
> > > > > > +static void mtk_dpi_matrix_sel(struct mtk_dpi *dpi, enum mtk_dpi_out_color_format format)
> > > > > > +{
> > > > > > +     u32 matrix_sel = 0;
> > > > > > +
> > > > > > +     switch (format) {
> > > > > > +     case MTK_DPI_COLOR_FORMAT_YCBCR_422:
> > > > > > +     case MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL:
> > > > > > +     case MTK_DPI_COLOR_FORMAT_YCBCR_444:
> > > > > > +     case MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL:
> > > > > > +     case MTK_DPI_COLOR_FORMAT_XV_YCC:
> > > > > > +             if (dpi->mode.hdisplay <= 720)
> > > > > > +                     matrix_sel = 0x2;
> > > > > > +             break;
> > > > > > +     default:
> > > > > > +             break;
> > > > > > +     }
> > > > > > +     mtk_dpi_mask(dpi, DPI_MATRIX_SET, matrix_sel, INT_MATRIX_SEL_MASK);
> > > > > > +}
> > > > > > +
> > > > > >  static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
> > > > > >                                       enum mtk_dpi_out_color_format format)
> > > > > >  {
> > > > > >       if ((format == MTK_DPI_COLOR_FORMAT_YCBCR_444) ||
> > > > > >           (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
> > > > > >               mtk_dpi_config_yuv422_enable(dpi, false);
> > > > > > -             if (dpi->conf->csc_support)
> > > > > > +             if (dpi->conf->csc_support) {
> > > > > >                       mtk_dpi_config_csc_enable(dpi, true);
> > > > > > +                     mtk_dpi_matrix_sel(dpi, format);
> > > > > > +             }
> > > > > >               if (dpi->conf->swap_input_support)
> > > > > >                       mtk_dpi_config_swap_input(dpi, false);
> > > > > >               mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_BGR);
> > > > > >       } else if ((format == MTK_DPI_COLOR_FORMAT_YCBCR_422) ||
> > > > > >                  (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
> > > > > >               mtk_dpi_config_yuv422_enable(dpi, true);
> > > > > > -             if (dpi->conf->csc_support)
> > > > > > +             if (dpi->conf->csc_support) {
> > > > > >                       mtk_dpi_config_csc_enable(dpi, true);
> > > > > > +                     mtk_dpi_matrix_sel(dpi, format);
> > > > > > +             }
> > > > > >               if (dpi->conf->swap_input_support)
> > > > > >                       mtk_dpi_config_swap_input(dpi, true);
> > > > > >               mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
> > > > > > @@ -441,6 +475,8 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
> > > > > >       mtk_dpi_disable(dpi);
> > > > > >       clk_disable_unprepare(dpi->pixel_clk);
> > > > > >       clk_disable_unprepare(dpi->engine_clk);
> > > > > > +     clk_disable_unprepare(dpi->dpi_ck_cg);
> > > > > > +     clk_disable_unprepare(dpi->tvd_clk);
> > > > > >  }
> > > > > >
> > > > > >  static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> > > > > > @@ -450,12 +486,24 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> > > > > >       if (++dpi->refcount != 1)
> > > > > >               return 0;
> > > > > >
> > > > > > +     ret = clk_prepare_enable(dpi->tvd_clk);
> > > > > > +     if (ret) {
> > > > > > +             dev_err(dpi->dev, "Failed to enable tvd pll: %d\n", ret);
> > > > > > +             goto err_pixel;
> > > > > > +     }
> > > > > > +
> > > > > >       ret = clk_prepare_enable(dpi->engine_clk);
> > > > > >       if (ret) {
> > > > > >               dev_err(dpi->dev, "Failed to enable engine clock: %d\n", ret);
> > > > > >               goto err_refcount;
> > > > > >       }
> > > > > >
> > > > > > +     ret = clk_prepare_enable(dpi->dpi_ck_cg);
> > > > > > +     if (ret) {
> > > > > > +             dev_err(dpi->dev, "Failed to enable dpi_ck_cg clock: %d\n", ret);
> > > > > > +             goto err_ck_cg;
> > > > > > +     }
> > > > > > +
> > > > > >       ret = clk_prepare_enable(dpi->pixel_clk);
> > > > > >       if (ret) {
> > > > > >               dev_err(dpi->dev, "Failed to enable pixel clock: %d\n", ret);
> > > > > > @@ -465,10 +513,11 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
> > > > > >       if (dpi->pinctrl && dpi->pins_dpi)
> > > > > >               pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
> > > > > >
> > > > > > -     mtk_dpi_enable(dpi);
> > > > > >       return 0;
> > > > > >
> > > > > >  err_pixel:
> > > > > > +     clk_disable_unprepare(dpi->dpi_ck_cg);
> > > > > > +err_ck_cg:
> > > > > >       clk_disable_unprepare(dpi->engine_clk);
> > > > > >  err_refcount:
> > > > > >       dpi->refcount--;
> > > > > > @@ -500,9 +549,16 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
> > > > > >       pll_rate = clk_get_rate(dpi->tvd_clk);
> > > > > >
> > > > > >       vm.pixelclock = pll_rate / factor;
> > > > > > -     if (dpi->conf->is_dpintf)
> > > > > > -             clk_set_rate(dpi->pixel_clk, vm.pixelclock / 4);
> > > > > > -     else if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
> > > > > > +     if (dpi->conf->is_dpintf) {
> > > > > > +             if (factor == 1)
> > > > > > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_src[2]);
> > > > > > +             else if (factor == 2)
> > > > > > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_src[3]);
> > > > > > +             else if (factor == 4)
> > > > > > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_src[4]);
> > > > > > +             else
> > > > > > +                     clk_set_parent(dpi->pixel_clk, dpi->pclk_src[2]);
> > > > > > +     } else if ((dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_LE) ||
> > > > > >                (dpi->output_fmt == MEDIA_BUS_FMT_RGB888_2X12_BE))
> > > > > >               clk_set_rate(dpi->pixel_clk, vm.pixelclock * 2);
> > > > > >       else
> > > > > > @@ -581,6 +637,8 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
> > > > > >       }
> > > > > >       mtk_dpi_sw_reset(dpi, false);
> > > > > >
> > > > > > +     mtk_dpi_enable(dpi);
> > > > > > +
> > > > > >       return 0;
> > > > > >  }
> > > > > >
> > > > > > @@ -623,7 +681,6 @@ static u32 *mtk_dpi_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> > > > > >       u32 *input_fmts;
> > > > > >
> > > > > >       *num_input_fmts = 0;
> > > > > > -
> > > > > >       input_fmts = kcalloc(1, sizeof(*input_fmts),
> > > > > >                            GFP_KERNEL);
> > > > > >       if (!input_fmts)
> > > > > > @@ -649,7 +706,7 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
> > > > > >               if (dpi->conf->num_output_fmts)
> > > > > >                       out_bus_format = dpi->conf->output_fmts[0];
> > > > > >
> > > > > > -     dev_dbg(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
> > > > > > +     dev_info(dpi->dev, "input format 0x%04x, output format 0x%04x\n",
> > > > > >               bridge_state->input_bus_cfg.format,
> > > > > >               bridge_state->output_bus_cfg.format);
> > > > > >
> > > > > > @@ -657,7 +714,10 @@ static int mtk_dpi_bridge_atomic_check(struct drm_bridge *bridge,
> > > > > >       dpi->bit_num = MTK_DPI_OUT_BIT_NUM_8BITS;
> > > > > >       dpi->channel_swap = MTK_DPI_OUT_CHANNEL_SWAP_RGB;
> > > > > >       dpi->yc_map = MTK_DPI_OUT_YC_MAP_RGB;
> > > > > > -     dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> > > > > > +     if (out_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
> > > > > > +             dpi->color_format = MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL;
> > > > > > +     else
> > > > > > +             dpi->color_format = MTK_DPI_COLOR_FORMAT_RGB;
> > > > > >
> > > > > >       return 0;
> > > > > >  }
> > > > > > @@ -835,6 +895,12 @@ static const u32 mt8183_output_fmts[] = {
> > > > > >       MEDIA_BUS_FMT_RGB888_2X12_BE,
> > > > > >  };
> > > > > >
> > > > > > +static const u32 mt8195_output_fmts[] = {
> > > > > > +     MEDIA_BUS_FMT_RGB888_1X24,
> > > > > > +     MEDIA_BUS_FMT_YUV8_1X24,
> > > > > > +     MEDIA_BUS_FMT_YUYV8_1X16,
> > > > > > +};
> > > > > > +
> > > > > >  static const struct mtk_dpi_yc_limit mtk_dpi_limit = {
> > > > > >       .c_bottom = 0x0010,
> > > > > >       .c_top = 0x0FE0,
> > > > > > @@ -862,6 +928,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
> > > > > >       .hvsize_mask = HSIZE_MASK,
> > > > > >       .channel_swap_shift = CH_SWAP,
> > > > > >       .yuv422_en_bit = YUV422_EN,
> > > > > > +     .csc_enable_bit = CSC_ENABLE,
> > > > > >       .limit = &mtk_dpi_limit,
> > > > > >  };
> > > > > >
> > > > > > @@ -879,6 +946,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
> > > > > >       .hvsize_mask = HSIZE_MASK,
> > > > > >       .channel_swap_shift = CH_SWAP,
> > > > > >       .yuv422_en_bit = YUV422_EN,
> > > > > > +     .csc_enable_bit = CSC_ENABLE,
> > > > > >       .limit = &mtk_dpi_limit,
> > > > > >  };
> > > > > >
> > > > > > @@ -895,6 +963,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
> > > > > >       .hvsize_mask = HSIZE_MASK,
> > > > > >       .channel_swap_shift = CH_SWAP,
> > > > > >       .yuv422_en_bit = YUV422_EN,
> > > > > > +     .csc_enable_bit = CSC_ENABLE,
> > > > > >       .limit = &mtk_dpi_limit,
> > > > > >  };
> > > > > >
> > > > > > @@ -911,18 +980,21 @@ static const struct mtk_dpi_conf mt8192_conf = {
> > > > > >       .hvsize_mask = HSIZE_MASK,
> > > > > >       .channel_swap_shift = CH_SWAP,
> > > > > >       .yuv422_en_bit = YUV422_EN,
> > > > > > +     .csc_enable_bit = CSC_ENABLE,
> > > > > >       .limit = &mtk_dpi_limit,
> > > > > >  };
> > > > > >
> > > > > >  static const struct mtk_dpi_conf mt8195_dpintf_conf = {
> > > > > >       .cal_factor = mt8195_dpintf_calculate_factor,
> > > > > > -     .output_fmts = mt8173_output_fmts,
> > > > > > -     .num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> > > > > > +     .output_fmts = mt8195_output_fmts,
> > > > > > +     .num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
> > > > > >       .is_dpintf = true,
> > > > > > +     .csc_support = true,
> > > > > >       .dimension_mask = DPINTF_HPW_MASK,
> > > > > >       .hvsize_mask = DPINTF_HSIZE_MASK,
> > > > > >       .channel_swap_shift = DPINTF_CH_SWAP,
> > > > > >       .yuv422_en_bit = DPINTF_YUV422_EN,
> > > > > > +     .csc_enable_bit = DPINTF_CSC_ENABLE,
> > > > > >       .limit = &mtk_dpintf_limit,
> > > > > >  };
> > > > > >
> > > > > > @@ -979,6 +1051,16 @@ static int mtk_dpi_probe(struct platform_device *pdev)
> > > > > >               return ret;
> > > > > >       }
> > > > > >
> > > > > > +     dpi->dpi_ck_cg = devm_clk_get(dev, "ck_cg");
> > > > > > +     if (IS_ERR(dpi->dpi_ck_cg)) {
> > > > > > +             ret = PTR_ERR(dpi->dpi_ck_cg);
> > > > > > +             if (ret != -EPROBE_DEFER)
> > > > > > +                     dev_err(dev, "Failed to get dpi ck cg clock: %d\n",
> > > > > > +                             ret);
> > > > > > +
> > > > > > +             return ret;
> > > > > > +     }
> > > > > > +
> > > > > >       dpi->pixel_clk = devm_clk_get(dev, "pixel");
> > > > > >       if (IS_ERR(dpi->pixel_clk)) {
> > > > > >               ret = PTR_ERR(dpi->pixel_clk);
> > > > > > @@ -997,6 +1079,11 @@ static int mtk_dpi_probe(struct platform_device *pdev)
> > > > > >               return ret;
> > > > > >       }
> > > > > >
> > > > > > +     dpi->pclk_src[1] = devm_clk_get(dev, "TVDPLL_D2");
> > > > > > +     dpi->pclk_src[2] = devm_clk_get(dev, "TVDPLL_D4");
> > > > > > +     dpi->pclk_src[3] = devm_clk_get(dev, "TVDPLL_D8");
> > > > > > +     dpi->pclk_src[4] = devm_clk_get(dev, "TVDPLL_D16");
> > > > > > +
> > > > > >       dpi->irq = platform_get_irq(pdev, 0);
> > > > > >       if (dpi->irq <= 0)
> > > > > >               return -EINVAL;
> > > > >
> > > > > All those changes look unrelated as well?
> > > > >
> > > > Do you mean all the changes in mtk_dpi.c ? They are in support of
> > > > enabling the mt8195 dpintf driver... so, not sure they are unlreated?
> > >
> > > I don't know that driver at all, so it's probably related if you say so
> > > :)
> > >
> > > The DPI interface seems to be a panel interface, so it's a bit weird to
> > > me why you would need to change things in the panel interface while
> > > claiming to support a DP output.
> > >
> > > Especially since it looks like you have some support for CSC, and
> > > support for additional output formats?
> > >
> > > I guess the DPI interface feeds the DP that essentially acts as a RGB ->
> > > DP bridge?
> > >
> > > If so, then the part adding support for CSC and additional formats
> > > should be split into a separate patch, and it should be mentioned in the
> > > commit log
> > >
> > > Maxime
> >
> > I see what you mean, I'll split the patches functionally...
> > I'm discovering the gpu/drm tree, so It may take me a while to get it right :D
>
> It's not really yet another weird drm rule :)
>
> Splitting your patches is valuable for a bunch of reasons that apply to
> basically every tree:
>
>   - It's easier to review (and maintainers like that). It's also easier
>     to justify in a commit log, so it leads to a better history over the
>     long term.
>
>   - It's also easier to merge since you can merge smaller chunks when
>     they are ready, even if the entire set is not. Smaller chunks also
>     mean it's easier to apply (for the maintainer) and rebase (for you).
>
>   - Finally, and possibly the strongest technical argument, it's much
>     more helpful when you're bisecting. Taking the above patch as an
>     example, let's assume you introduced a bug in some RGB panel with
>     the colors being off due to the CSC changes. If you run git bisect,
>     you'll end up with that big patch affecting multiple things and it
>     would still be difficult to figure out what's wrong exactly. If it
>     was split, you would end up only on the changeset that introduces
>     the regression, which is very likely to be much easier to analyze.
>
> Maxime

Thx,
Guillaume.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
