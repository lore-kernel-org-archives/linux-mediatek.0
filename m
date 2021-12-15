Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8069BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 13:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZn6NVF2HkrmvrH5BvTA0MP+d/3Al6itsyl/x8aE4oY=; b=c2zjsbhlAEk68G
	wbjnZIBKDCSvl+0fAXqwsMqFee8r/oiQMbGJJ8EixZW286VAxFfsKcHfEPgNLdRiOO5hvRxcSmBDN
	l9JiP3VQC/rzS3ssA52jeLLjTAveHniVX6oLmy0TYOB2hbKSt9fEHUS5lHRfSCrWXWhhGm/dOdbxy
	I0hjvS61DOpqeENS7Cs0KEG3t3QbM/CbWjEXgYFWUOburEU6nzaFaE+bilOdSr/jY81gewAvFLzHs
	3WmPOA2TjRXGAM0rq5V5Qmx2T1biOX0svGdCk8RspIC2YJeQFQ03Hk9HN5UgvtARpm2uay6kIeU20
	o0CL4UaSrWvFYkk5E4lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxUm4-000zXs-Fq; Wed, 15 Dec 2021 13:56:52 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxUm0-000zW5-VY
 for linux-mediatek@lists.infradead.org; Wed, 15 Dec 2021 13:56:51 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 35-20020a9d08a6000000b00579cd5e605eso25065352otf.0
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Dec 2021 05:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=M6j9hwTZmADnSfWaurTAQggHTqHGDGAa0M5rDiFAOho=;
 b=vU8K7qkTSSZ06CE/fefEWyKnsRXiJLlkp7YM5DiBN3h885TMUwRU64eceuisXus8DC
 IvN+bZn6DKihhsf8twYGvrDXkoqlcKrYqtCi7YiWEMbKZ8omTlfuI2rmhXjbCJ67tKol
 5W4KjvFqtQvbFXyizzshpEnvg3A+9shfiBFO9JMtqbNeh7JqvHk0V4l/nJ1blHTe04H6
 pnlOoSlqClNTyiVRu/FB2ENduxZSRY5IiUCeAdETG1JH9WvsXzHOO2snbahquGr2dGD/
 1wdu+osd202SSm9a1zPYo3zBhtCntFybwBv6qqGZpUjlpvbXWpVLQ0dM1EjVn4thKxR8
 Zp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=M6j9hwTZmADnSfWaurTAQggHTqHGDGAa0M5rDiFAOho=;
 b=pzKRR7Z1jShMUwdkGb+zMxKfnr4cLcZ9M+V7FdkWMUmoXhATgUayp1ojYOqtCibcA7
 u3negwnxX6ycmmqscXm/lJPxEwj75oWpY1IXTeZJjacr9XN2xXyWpVpQXD/YIJppdQiS
 UbUe79OU+t1dcaZRTgjf3VKzIVoJ2lGfBsc3hQLibePGq3LE8JBcBCh2PugQWeKvGa5B
 ZPi69EMiUja4QUw8XiKbAuL2SH81Y0U8dwCNF5qos0leVR6Nnh5p53A8rZ0Itc99G47s
 CyUG46//YFDX4BgfNGD5/d2Q49yxDO1heA2nA98bf6KWiteySU6N12o+UDU9LjZJwr0s
 BQcw==
X-Gm-Message-State: AOAM533eou0aC27H48uUzU66HPlPj8qyDGf0zEIeWy77SErb4fqZCbGg
 KOga78wjJpgiRRf3mjudqJ+CZufypjQD8vA9h/sOfg==
X-Google-Smtp-Source: ABdhPJz6k/y1XdmARoYBhmoL4faqs4b6EkaRNTG2VXEP5cLBplgJmHpeQGBuN65kQTb4Ae2ykOvi1JN8NvW5Yd0+nyo=
X-Received: by 2002:a05:6830:200d:: with SMTP id
 e13mr9174519otp.109.1639576607244; 
 Wed, 15 Dec 2021 05:56:47 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Dec 2021 07:56:43 -0600
MIME-Version: 1.0
In-Reply-To: <b307d567-774b-ca9e-d7d7-09846782c988@collabora.com>
References: <20211110130623.20553-1-granquet@baylibre.com>
 <20211110130623.20553-8-granquet@baylibre.com>
 <b307d567-774b-ca9e-d7d7-09846782c988@collabora.com>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Wed, 15 Dec 2021 07:56:43 -0600
Message-ID: <CABnWg9sNOWJ_RgnvSdEtAVQrfELzJr8aj-FTB=oj6hQJScFCVA@mail.gmail.com>
Subject: Re: [PATCH v6 7/7] drm/mediatek: Add mt8195 DisplayPort driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
 kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_055649_089042_566B7B75 
X-CRM114-Status: GOOD (  31.75  )
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

Hi Angelo,

Quoting AngeloGioacchino Del Regno (2021-12-10 11:17:44)
> Il 10/11/21 14:06, Guillaume Ranquet ha scritto:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> >
> > This patch adds a DisplayPort driver for the Mediatek mt8195 SoC and a
> > according phy driver mediatek-dp-phy.
> >
> > It supports both functional units on the mt8195, the embedded
> > DisplayPort as well as the external DisplayPort units. It offers
> > hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with up
> > to 4 lanes.
> >
> > The driver creates a child device for the phy. The child device will
> > never exist without the parent being active. As they are sharing a
> > register range, the parent passes a regmap pointer to the child so that
> > both can work with the same register range. The phy driver sets device
> > data that is read by the parent to get the phy device that can be used
> > to control the phy properties.
> >
> > This driver is based on an initial version by
> > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> >
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > Reported-by: kernel test robot <lkp@intel.com>
>
> Hello Markus, Guillaume,
>
> there is a critical issue with this patch. Please check below.
>
> > ---
> >   drivers/gpu/drm/drm_edid.c              |    2 +-
> >   drivers/gpu/drm/mediatek/Kconfig        |    7 +
> >   drivers/gpu/drm/mediatek/Makefile       |    2 +
> >   drivers/gpu/drm/mediatek/mtk_dp.c       | 3094 +++++++++++++++++++++++
> >   drivers/gpu/drm/mediatek/mtk_dp_reg.h   |  568 +++++
> >   drivers/gpu/drm/mediatek/mtk_dpi.c      |  111 +-
> >   drivers/gpu/drm/mediatek/mtk_dpi_regs.h |   26 +
> >   drivers/gpu/drm/mediatek/mtk_drm_drv.c  |    1 +
> >   drivers/gpu/drm/mediatek/mtk_drm_drv.h  |    1 +
> >   9 files changed, 3799 insertions(+), 13 deletions(-)
> >   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
> >   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> >
>
> <snip>
>
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 384074f69111b..e6e88e3cd811d 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>
> <snip>
>
> > @@ -979,6 +1051,16 @@ static int mtk_dpi_probe(struct platform_device *pdev)
> >               return ret;
> >       }
> >
> > +     dpi->dpi_ck_cg = devm_clk_get(dev, "ck_cg");
>
> mtk_dpi is used on MT2701, MT7183, MT8183, MT8192, but these platforms haven't
> got any "ck_cg" clock defined in their device-trees (regardless of whether these
> can support adding this clock or not, any code change shall be retro-compatible
> hence not breaking compatibility/functionality with older device-trees).
>
> Reminding that:
> - mediatek-drm uses the component framework
> - mtk_drm_drv is the component master
> - mtk_drm_drv bind() won't be called unless all of the components added with
>    match aren't calling component_add()
>
> ... this change not only breaks DisplayPort support for *all* of the
> aforementioned SoCs, but also makes the entire mediatek-drm to not finish
> probing, producing a global breakage that also includes DSI and the entire
> stack of components of that master (so, no display on all of them).
>
> To avoid breaking any SoC that's not MT8195, please use devm_clk_get_optional()
> here in the next version.
>
> Thanks,
> - Angelo
>

This is a good catch, I will update for v7.

Thank you very much for your review.

Thx,
Guillaume.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
