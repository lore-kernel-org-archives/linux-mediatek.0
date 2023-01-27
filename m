Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C767C61DA7
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 00:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJOlXvxt/36mhDoKKtTcHi3UscUgi/2yAxB/faYJnd8=; b=syufsUbDM2zO2xRSGKHmKnJ3oc
	vFCoionELG4BlsdHfW46d2AOrH3wc+G7HztdhwdmkkX2OACkTaiQemU0yZAwx+lVDQHZ1KeilCdiP
	YA3Z78Q3m2B9qE8ezFqwNvkHzr7NEtmpdkI8AJUm4qvzMLjY4I+TbBfdR0/DDeuqnFprtiT2bxxSk
	CIZVOlu4haqGcXU/JKFYqgL6e3nZ4uMjvTAWeicHGPI/6w6ZPozynmx8VN8Go/XgRwPZOCe8W1Nzg
	lOMLaxHAFqRL8upBRKa1f0ez3Nx+8R6hpaK4Mqvu/4V7MKezoo/Obh42usJq/aUwT4OHmIMuNjLJ3
	K9Hq8JYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLCyv-00D1rK-9m; Fri, 27 Jan 2023 00:52:41 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLCyi-00D1of-0C
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 00:52:29 +0000
Received: by mail-ej1-x62a.google.com with SMTP id bk15so9714879ejb.9
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Jan 2023 16:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dJOlXvxt/36mhDoKKtTcHi3UscUgi/2yAxB/faYJnd8=;
        b=LkPFurpLYoghBa1anakoas3K/Xd+PMO4YCNxlwlFkjlHpZoCrVo2DNlQtVX0C7DK/l
         ft/CJnbtQE9CLr++LczeysWQqWviHeRu0HRnzdj6fOdekOWhu+CyXaHhiip/8vcR/5Cx
         /XRfyTqJf/TVOMsIWwkfmXXRNZjBQHXTxab4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJOlXvxt/36mhDoKKtTcHi3UscUgi/2yAxB/faYJnd8=;
        b=eym2dnpy7WuMWUaeJk/yQeI/A19fvNOfjPWKa48x+6yR7vJX1BoWE4Q8F9LZoxQ+Pf
         oOAgTuKv3c62wbMpQbDjdWF1jDToTXBEmPkijAlJGJIxkV5FoUSUTJ500chlJyTtCDkO
         8Do53liITmYV580Nl8PAMBgZfvJ+tyssQpsOaMDKvvZgezWGxf4YIDa9S2+0wmT8a6Eb
         uQyzyfHcQNwrvOHJTapA96oU2+6al0JTMbfoSTB4Xes+Gcn5xJUcOQ1G5EYmbRbvaFpD
         /lSiYVBZv2IW8M4UgK8xJhcPmQWTI2VWoYS4LEA8M0n9JYqCZC6uuE1Jiz7ZYEkf9t5e
         Eh2Q==
X-Gm-Message-State: AO0yUKUwKV2ZqWJTQw+QlqvCLj/QRQDohoguwBbvesD8Uq0wx482ozFg
	WIpoMtM/kt04lDdKE0yK+rYdNXE6J1hgMmGpHo8=
X-Google-Smtp-Source: AK7set8c6XrpBdoS112BOc2+CsL9DV3XgbppYSEiZEbWGwk7iV7h8i8IQ7pUFA5T7rSOwuYK0Zv12Q==
X-Received: by 2002:a17:906:491:b0:878:7530:5303 with SMTP id f17-20020a170906049100b0087875305303mr3198994eja.5.1674780745570;
        Thu, 26 Jan 2023 16:52:25 -0800 (PST)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id r5-20020a1709064d0500b00872eb47f46dsm1371496eju.19.2023.01.26.16.52.23
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 16:52:23 -0800 (PST)
Received: by mail-wm1-f53.google.com with SMTP id o17-20020a05600c511100b003db021ef437so2371801wms.4
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Jan 2023 16:52:23 -0800 (PST)
X-Received: by 2002:a7b:c38d:0:b0:3da:fd7c:98c2 with SMTP id
 s13-20020a7bc38d000000b003dafd7c98c2mr1635847wmj.93.1674780742639; Thu, 26
 Jan 2023 16:52:22 -0800 (PST)
MIME-Version: 1.0
References: <20230106030108.2542081-1-swboyd@chromium.org> <CAD=FV=U0Bwx4HzCSL8EE-+ngGLZ-NqpbC+J9jby84FKBOB_ddQ@mail.gmail.com>
In-Reply-To: <CAD=FV=U0Bwx4HzCSL8EE-+ngGLZ-NqpbC+J9jby84FKBOB_ddQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 Jan 2023 16:52:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VMebqPd2ozLzY65Kba9snLKQ-KKd684O0cGQzyP0kcwQ@mail.gmail.com>
Message-ID: <CAD=FV=VMebqPd2ozLzY65Kba9snLKQ-KKd684O0cGQzyP0kcwQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed
 during disable
To: Stephen Boyd <swboyd@chromium.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	yangcong <yangcong5@huaqin.corp-partner.google.com>, 
	Jitao Shi <jitao.shi@mediatek.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Rob Clark <robdclark@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_165228_052367_D2838C11 
X-CRM114-Status: GOOD (  46.45  )
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

On Wed, Jan 18, 2023 at 1:34 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Jan 5, 2023 at 7:01 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > The unprepare sequence has started to fail after moving to panel bridge
> > code in the msm drm driver (commit 007ac0262b0d ("drm/msm/dsi: switch to
> > DRM_PANEL_BRIDGE")). You'll see messages like this in the kernel logs:
> >
> >    panel-boe-tv101wum-nl6 ae94000.dsi.0: failed to set panel off: -22
> >
> > This is because boe_panel_enter_sleep_mode() needs an operating DSI link
> > to set the panel into sleep mode. Performing those writes in the
> > unprepare phase of bridge ops is too late, because the link has already
> > been torn down by the DSI controller in post_disable, i.e. the PHY has
> > been disabled, etc. See dsi_mgr_bridge_post_disable() for more details
> > on the DSI .
> >
> > Split the unprepare function into a disable part and an unprepare part.
> > For now, just the DSI writes to enter sleep mode are put in the disable
> > function. This fixes the panel off routine and keeps the panel happy.
> >
> > My Wormdingler has an integrated touchscreen that stops responding to
> > touch if the panel is only half disabled too. This patch fixes it. And
> > finally, this saves power when the screen is off because without this
> > fix the regulators for the panel are left enabled when nothing is being
> > displayed on the screen.
> >
> > Fixes: 007ac0262b0d ("drm/msm/dsi: switch to DRM_PANEL_BRIDGE")
> > Fixes: a869b9db7adf ("drm/panel: support for boe tv101wum-nl6 wuxga dsi video mode panel")
> > Cc: yangcong <yangcong5@huaqin.corp-partner.google.com>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Cc: Jitao Shi <jitao.shi@mediatek.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Rob Clark <robdclark@chromium.org>
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 16 ++++++++++++----
> >  1 file changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> > index 857a2f0420d7..c924f1124ebc 100644
> > --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> > +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> > @@ -1193,14 +1193,11 @@ static int boe_panel_enter_sleep_mode(struct boe_panel *boe)
> >         return 0;
> >  }
> >
> > -static int boe_panel_unprepare(struct drm_panel *panel)
> > +static int boe_panel_disable(struct drm_panel *panel)
> >  {
> >         struct boe_panel *boe = to_boe_panel(panel);
> >         int ret;
> >
> > -       if (!boe->prepared)
> > -               return 0;
> > -
> >         ret = boe_panel_enter_sleep_mode(boe);
> >         if (ret < 0) {
> >                 dev_err(panel->dev, "failed to set panel off: %d\n", ret);
> > @@ -1209,6 +1206,16 @@ static int boe_panel_unprepare(struct drm_panel *panel)
> >
> >         msleep(150);
> >
> > +       return 0;
> > +}
> > +
> > +static int boe_panel_unprepare(struct drm_panel *panel)
> > +{
> > +       struct boe_panel *boe = to_boe_panel(panel);
> > +
> > +       if (!boe->prepared)
> > +               return 0;
> > +
> >         if (boe->desc->discharge_on_disable) {
> >                 regulator_disable(boe->avee);
> >                 regulator_disable(boe->avdd);
> > @@ -1528,6 +1535,7 @@ static enum drm_panel_orientation boe_panel_get_orientation(struct drm_panel *pa
> >  }
> >
> >  static const struct drm_panel_funcs boe_panel_funcs = {
> > +       .disable = boe_panel_disable,
> >         .unprepare = boe_panel_unprepare,
> >         .prepare = boe_panel_prepare,
> >         .enable = boe_panel_enable,
>
> As mentioned by Stephen, my initial reaction was that this felt
> asymmetric. We were moving some stuff from unprepare() to disable()
> and it felt like that would mean we would also need to move something
> from prepare() to enable. Initially I thought maybe that "something"
> was all of boe_panel_init_dcs_cmd() but I guess that didn't work.
>
> I don't truly have a reason that this _has_ to be symmetric. I was
> initially worried that there might be some place where we call
> pre_enable(), then never call enable() / disable(), and then call
> post_disable(). That could have us in a bad state because we'd never
> enter sleep mode / turn the display off. However (as I think I've
> discovered before and just forgot), I don't think this is possible
> because we always call pre-enable() and enable() together. Also, as
> mentioned by Sam, we're about to fully shut the panel's power off so
> (unless it's on a shared rail) it probably doesn't really matter.
>
> Thus, I'd be OK with:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> I'm also happy to land this (adding Cc: stable) to drm-misc-fixes if
> nobody has any objections (also happy if someone else wants to land
> it). I guess the one worry I have is that somehow this could break
> something for one of the other 8 panels that this driver supports (or
> it could have bad interactions with the display controller used on a
> board with one of these panels?). Maybe we should have "Cc: stable"
> off just to give it extra bake time? ...and maybe even push to
> drm-misc-next instead of -fixes again to give extra bake time?

This thread has gone silent. I'll plan to land the patch in
drm-misc-next early next week, maybe Monday, _without_ Ccing stable,
so we have the longest possible bake time. If anyone has objections,
please yell.

-Doug

