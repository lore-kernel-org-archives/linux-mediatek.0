Return-Path: <SRS0=FZAz=HY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66890C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Feb 2021 05:31:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E07FC64E12
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Feb 2021 05:31:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E07FC64E12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D6zwdf2+vUjqEg1IQcxCNcuYz5vkaSWiM+uraTySXlM=; b=Sc1zEZTaSvzu6wX/lCfmcob9W
	qUWJYvVQfUNgevR6GmrjpusTAP70wiESsPmr5CQafvhecNkRn/nNhHSbqPjXDK5aAVT3HM7Q4Rl5z
	W9bmGB4b0xy+GIPlcczMl/P6ygAwMjARUxqecx6ZV89WX0IjBVv+vQ5mfiEPPGfSuMbFJqkhZbNHH
	hxdp1mkGAum48toJs6n1EjKzPzzTred+EMveLaOZMwC6sziNCaDqTlXYLF1Lcg+LSUbg7WsynVOtS
	vu8Oqxk1bgPC2TcilT+4KUqlzy2ZFlmqShjWUhl1+rTO40119/ULKw7IwUSo7ybQpaNCJmybZ8kPT
	wBdBgAV0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lE3ol-0007hl-RP; Mon, 22 Feb 2021 05:31:35 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE3og-0007fw-Jm
 for linux-mediatek@lists.infradead.org; Mon, 22 Feb 2021 05:31:31 +0000
Received: by mail-ua1-x933.google.com with SMTP id a31so3944436uae.11
 for <linux-mediatek@lists.infradead.org>; Sun, 21 Feb 2021 21:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gu/fKr3GRAQ+ErLkQJBUlVQcwe14YTdgKKhXg0Cv4l4=;
 b=nKDy+b2+V7fS2f7mnoG/Ss5+uvRYBQnercKoIeTycpfWKJxx6kOPPx2ZeMe5ucP5Iv
 50sS1bwNYdUpsm04AudIWrPnD+CNDRIBtKgv/9JUPjkbQlh1RAybhdP7pPk7uV3lZTxy
 I4/U2OZz5f4aafI7BWCv88whwJWIfvn83D3IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gu/fKr3GRAQ+ErLkQJBUlVQcwe14YTdgKKhXg0Cv4l4=;
 b=aVkbJakbxItQ9Kr8nglRedXIfoyuK3i/2MCahsNlFZ2EFlxtI11o4VOVGRBHnFirjH
 na6QM04dsuTI57NyfjsEjEAcC46BIB4JPAZhasidJoNqp0ZXXPYYjuw4Usq2RW9/iE7P
 0ygiHWzqXZ5audXM4mJlOxEfMTwVJX6HOkIiOPGUXFHLf8fS67zy19PRK3Px1JUCzUFt
 rlyQgKRcoDinzCbgujdN0SLCXfNN8m/XkxjDlU3BZDiHkZ+dMk7NhR7trUywNL9oyZP/
 bX1E/6KhAO38WFgT2zL8CAKrT9/rl4GSQtbWD8SlkylQjUTrB6NphMkj5mBEzIy9kIbv
 1M0g==
X-Gm-Message-State: AOAM532MwpulGB6Ulx9jFJ/m0fi//oSdxHOaFZ4jPWwUIWmHnB+AyJgd
 UskljnoO8rlSEd87jylJdWB9kL/nsu20WVMptR31sg==
X-Google-Smtp-Source: ABdhPJys5c+rCVxUlnAkJ7c+Jss6rAjW1MoFOcoVaCF3S96QpX3HiNwsT/MLRIitrpXf+DKZerK3D3cbUQdqljXKnGs=
X-Received: by 2002:ab0:1052:: with SMTP id g18mr3262401uab.74.1613971888653; 
 Sun, 21 Feb 2021 21:31:28 -0800 (PST)
MIME-Version: 1.0
References: <20210211113309.1.I629b2366a6591410359c7fcf6d385b474b705ca2@changeid>
 <YDKvm1QmdJtJbaN6@pendragon.ideasonboard.com>
In-Reply-To: <YDKvm1QmdJtJbaN6@pendragon.ideasonboard.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 22 Feb 2021 13:31:17 +0800
Message-ID: <CANMq1KALq+C2GD2uRohKpwvkDC05-fHyo=_WoHwnsKNjgcSfEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/dsi: Add _NO_ to MIPI_DSI_* flags disabling features
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_003130_773920_DAFF835B 
X-CRM114-Status: GOOD (  26.09  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Rob Clark <robdclark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 Xin Ji <xji@analogixsemi.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, lkml <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 22, 2021 at 3:08 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Nicolas,
>
> Thank you for the patch.
>
> On Thu, Feb 11, 2021 at 11:33:55AM +0800, Nicolas Boichat wrote:
> > Many of the DSI flags have names opposite to their actual effects,
> > e.g. MIPI_DSI_MODE_EOT_PACKET means that EoT packets will actually
> > be disabled. Fix this by including _NO_ in the flag names, e.g.
> > MIPI_DSI_MODE_NO_EOT_PACKET.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
>
> This looks good to me, it increases readability.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Please however see the end of the mail for a comment.
>
> > ---
> > I considered adding _DISABLE_ instead, but that'd make the
> > flag names a big too long.
> >
> > Generated with:
> > flag=MIPI_DSI_MODE_VIDEO_HFP; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HFP/" {}
> > flag=MIPI_DSI_MODE_VIDEO_HBP; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HBP/" {}
> > flag=MIPI_DSI_MODE_VIDEO_HSA; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_VIDEO_NO_HSA/" {}
> > flag=MIPI_DSI_MODE_EOT_PACKET; git grep $flag | cut -f1 -d':' | \
> >   xargs -I{} sed -i -e "s/$flag/MIPI_DSI_MODE_NO_EOT_PACKET/" {}
> > (then minor format changes)
>
> Ever tried coccinelle ? :-)

Fun project for next time ,-)

>
> >  drivers/gpu/drm/bridge/adv7511/adv7533.c             | 2 +-
> >  drivers/gpu/drm/bridge/analogix/anx7625.c            | 2 +-
> >  drivers/gpu/drm/bridge/cdns-dsi.c                    | 4 ++--
> >  drivers/gpu/drm/bridge/tc358768.c                    | 2 +-
> >  drivers/gpu/drm/exynos/exynos_drm_dsi.c              | 8 ++++----
> >  drivers/gpu/drm/mcde/mcde_dsi.c                      | 2 +-
> >  drivers/gpu/drm/mediatek/mtk_dsi.c                   | 2 +-
> >  drivers/gpu/drm/msm/dsi/dsi_host.c                   | 8 ++++----
> >  drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 2 +-
> >  drivers/gpu/drm/panel/panel-dsi-cm.c                 | 2 +-
> >  drivers/gpu/drm/panel/panel-elida-kd35t133.c         | 2 +-
> >  drivers/gpu/drm/panel/panel-khadas-ts050.c           | 2 +-
> >  drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c   | 2 +-
> >  drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c   | 2 +-
> >  drivers/gpu/drm/panel/panel-novatek-nt35510.c        | 2 +-
> >  drivers/gpu/drm/panel/panel-osd-osd101t2587-53ts.c   | 2 +-
> >  drivers/gpu/drm/panel/panel-samsung-s6d16d0.c        | 2 +-
> >  drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c     | 2 +-
> >  drivers/gpu/drm/panel/panel-samsung-s6e63m0-dsi.c    | 2 +-
> >  drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c        | 4 ++--
> >  drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c      | 2 +-
> >  drivers/gpu/drm/panel/panel-simple.c                 | 2 +-
> >  drivers/gpu/drm/panel/panel-sony-acx424akp.c         | 2 +-
> >  drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c     | 2 +-
> >  include/drm/drm_mipi_dsi.h                           | 8 ++++----
> >  25 files changed, 36 insertions(+), 36 deletions(-)
> >
> > []
> > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > index 360e6377e84b..ba91cf22af51 100644
> > --- a/include/drm/drm_mipi_dsi.h
> > +++ b/include/drm/drm_mipi_dsi.h
> > @@ -119,15 +119,15 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
> >  /* enable hsync-end packets in vsync-pulse and v-porch area */
> >  #define MIPI_DSI_MODE_VIDEO_HSE              BIT(4)
>
> We're mixing bits that enable a feature and bits that disable a feature.
> Are these bits defined in the DSI spec, or internal to DRM ? In the
> latter case, would it make sense to standardize on one "polarity" ? That
> would be a more intrusive change in drivers though.

Yes, that'd require auditing every single code path and reverse the
logic as needed. I'm not volunteering for that ,-P (hopefully the
current change is still an improvement).

Hopefully real DSI experts can comment (Andrzej?), I think the default
are sensible settings?


>
> >  /* disable hfront-porch area */
> > -#define MIPI_DSI_MODE_VIDEO_HFP              BIT(5)
> > +#define MIPI_DSI_MODE_VIDEO_NO_HFP   BIT(5)
> >  /* disable hback-porch area */
> > -#define MIPI_DSI_MODE_VIDEO_HBP              BIT(6)
> > +#define MIPI_DSI_MODE_VIDEO_NO_HBP   BIT(6)
> >  /* disable hsync-active area */
> > -#define MIPI_DSI_MODE_VIDEO_HSA              BIT(7)
> > +#define MIPI_DSI_MODE_VIDEO_NO_HSA   BIT(7)
> >  /* flush display FIFO on vsync pulse */
> >  #define MIPI_DSI_MODE_VSYNC_FLUSH    BIT(8)
> >  /* disable EoT packets in HS mode */
> > -#define MIPI_DSI_MODE_EOT_PACKET     BIT(9)
> > +#define MIPI_DSI_MODE_NO_EOT_PACKET  BIT(9)
> >  /* device supports non-continuous clock behavior (DSI spec 5.6.1) */
> >  #define MIPI_DSI_CLOCK_NON_CONTINUOUS        BIT(10)
> >  /* transmit data in low power */
>
> --
> Regards,
>
> Laurent Pinchart

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
