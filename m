Return-Path: <SRS0=otxm=HP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D03C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Feb 2021 14:35:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D044E64D9E
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Feb 2021 14:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D044E64D9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9E28DBTbAN1ISKcUyS0Hk2Zx7gVYb02myXLnDtOVWyM=; b=xWJ2VutdpBvY4lsVDUu0KjO9/
	vvTBBTEqCOlAS3Lgwc5Thcg6yGQoLnoFDnqTM6gJMVGkd7fILkXkigwLkpFKF3snyYAQu7F9xC2/Q
	TdwfsoYp41YGtNZwdt10raKp6DBE/G76pNFJ5i6XaDOHEif0Ja2dMdbOayGgwFKjSJNpbst8SHhTn
	hUZQ/lTW8BiXBDpoSe9UIJEar9ls0lMfxvM2vLHw7ZSTXthFWx/aVUkHJjFY7rnGkmSZqs5ujivHu
	w0/pcb/SSaXpLrbaLnQ99iqngjqpoREhsLXYTRnJfBKZuEIBmr+VZVjYY0fZRyl+8tyhp7a9ijvx/
	x+Ya4SKWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAw0u-0003nI-Fh; Sat, 13 Feb 2021 14:35:12 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAw0q-0003m1-0F
 for linux-mediatek@lists.infradead.org; Sat, 13 Feb 2021 14:35:09 +0000
Received: by mail-vs1-xe35.google.com with SMTP id o186so1156634vso.1
 for <linux-mediatek@lists.infradead.org>; Sat, 13 Feb 2021 06:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JOR9IfKzh/aAizYitDZAhS1BYlLKD2WQaQZDVSqy5Lc=;
 b=XdYg5H9pL7KUN8K68Y+z5M210rVlu9kiD9RbDbB25+aBZbIkegIMvNIpeeK6Uu4mHP
 5BbANhxXsDIvzXxcTGbTyenpeNNf7cSLsNiW/YNoHvMv3+1ZVMcPxVqKZqMz+Zq59hY2
 e3kN1AMUdfAgcFBeF5r7OPQ4I1vE1KHxHiYwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JOR9IfKzh/aAizYitDZAhS1BYlLKD2WQaQZDVSqy5Lc=;
 b=m82lmEj+Qmafxbu6eHEE92vt/B5d3SuTGLAeCY55vCNor1Tvv9FjYDI5tA2fXu0NX2
 BW7QFTRaa21vPWNR1G7bW5kzQ2P59jYN4ryP+6C8xp2u6kS9ekIhz8rd3OXusWuJghOW
 YndszReJD3vpxEfZT6PewQnSkw9imdl6hZqtZNEXp/FIn54Ve9khz+PsRhbhXO6KYHFX
 GZ1IPipkH7mv4MMAodwlRJV9kF3OHm10Om0Nw09UXElbbVLVATDEP1BOvOXkyZ/10uc4
 ckwqFCHCB1wyMUrZqoWsszJs1TmcH18M26WGbi3s9iEVJJ0bulifuuehT51G3XAlAht5
 8zpA==
X-Gm-Message-State: AOAM533ZJv2MI2tF3KCMOJR6o3Vid74i2RrsFlDt39tR5zik1Vfj9co9
 ZwkfHCzaErwe+u9Eu/XtOWfe2t55x9IAbC3q5X6l/w==
X-Google-Smtp-Source: ABdhPJyk4HyZZcnu7E233puNxgMJ3TX4LD6d+a/RN/+Gh5/K+LPRHVkshJy2ck1e3TKMLuVZdSM8SnsIPQJuc3sCiH0=
X-Received: by 2002:a67:e119:: with SMTP id d25mr4747759vsl.16.1613226902062; 
 Sat, 13 Feb 2021 06:35:02 -0800 (PST)
MIME-Version: 1.0
References: <20210208014221.196584-1-jitao.shi@mediatek.com>
 <20210208014221.196584-2-jitao.shi@mediatek.com>
In-Reply-To: <20210208014221.196584-2-jitao.shi@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Sat, 13 Feb 2021 22:34:51 +0800
Message-ID: <CANMq1KD7upJarxXJsX0ue4doT3=P_n+tcTyS7o6E-XvXGyRe1A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/mediatek: mtk_dpi: Add check for max clock
 rate in mode_valid
To: Jitao Shi <jitao.shi@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_093508_108440_BAE46CF7 
X-CRM114-Status: GOOD (  20.01  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, shuijing.li@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

+Pi-Hsun Shih

On Mon, Feb 8, 2021 at 9:42 AM Jitao Shi <jitao.shi@mediatek.com> wrote:
>
> Add per-platform max clock rate check in mtk_dpi_bridge_mode_valid.
>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

I believe this patch (and the following) were actually authored by
Pi-Hsun: https://crrev.com/c/2628812 . Would be best to keep the
author information (unless I'm missing something of course).


> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 52f11a63a330..ffa4a0f1989f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -118,6 +118,7 @@ struct mtk_dpi_yc_limit {
>  struct mtk_dpi_conf {
>         unsigned int (*cal_factor)(int clock);
>         u32 reg_h_fre_con;
> +       u32 max_clock_khz;
>         bool edge_sel_en;
>  };
>
> @@ -555,9 +556,22 @@ static void mtk_dpi_bridge_enable(struct drm_bridge *bridge)
>         mtk_dpi_set_display_mode(dpi, &dpi->mode);
>  }
>
> +static enum drm_mode_status
> +mtk_dpi_bridge_mode_valid(struct drm_bridge *bridge,
> +                         const struct drm_display_mode *mode)
> +{
> +       struct mtk_dpi *dpi = bridge_to_dpi(bridge);
> +
> +       if (dpi->conf->max_clock_khz && mode->clock > dpi->conf->max_clock_khz)
> +               return MODE_CLOCK_HIGH;
> +
> +       return MODE_OK;
> +}
> +
>  static const struct drm_bridge_funcs mtk_dpi_bridge_funcs = {
>         .attach = mtk_dpi_bridge_attach,
>         .mode_set = mtk_dpi_bridge_mode_set,
> +       .mode_valid = mtk_dpi_bridge_mode_valid,
>         .disable = mtk_dpi_bridge_disable,
>         .enable = mtk_dpi_bridge_enable,
>  };
> @@ -673,17 +687,20 @@ static unsigned int mt8183_calculate_factor(int clock)
>  static const struct mtk_dpi_conf mt8173_conf = {
>         .cal_factor = mt8173_calculate_factor,
>         .reg_h_fre_con = 0xe0,
> +       .max_clock_khz = 300000,
>  };
>
>  static const struct mtk_dpi_conf mt2701_conf = {
>         .cal_factor = mt2701_calculate_factor,
>         .reg_h_fre_con = 0xb0,
>         .edge_sel_en = true,
> +       .max_clock_khz = 150000,
>  };
>
>  static const struct mtk_dpi_conf mt8183_conf = {
>         .cal_factor = mt8183_calculate_factor,
>         .reg_h_fre_con = 0xe0,
> +       .max_clock_khz = 100000,
>  };
>
>  static int mtk_dpi_probe(struct platform_device *pdev)
> --
> 2.25.1
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
