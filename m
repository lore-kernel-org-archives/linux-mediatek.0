Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506C0C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 21:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqsL2fu3OvVG2mbH6Q7pzKx+U8+i7MHA1r69TmMusvk=; b=g79EmSpp+nYFuw/bMlzl6etrbG
	Brrrg8UDNhV7xNktb28AlPk0Lfe8CjSzHQcuI4BBRpkgDmoE6GKb4zKCoMk/GYEFRYxaPekMxXsoN
	CcRRptvGimD9uoWNi47lSm0FyBQZte/Y84g/t8dvihVKuQ7lUHKmyN3kvY1l5s2WlUjCAXM2fham4
	HL3Rb0ntnJAzMEd+N6g6RrVElFSXO/2bKhbm6TtjIaAea/6tKAI/Q3+WUrW3SXGZm+edVEjQ8wAo9
	V1Sn2WHgjr9OleBB03AfI84cXX0cjchEvuG3xvrmf7/hELnLiyguR3y8AXGuMqGCuoCsGFc8zcVIv
	3oYhyOCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMyA8-009PDk-1N; Tue, 31 Jan 2023 21:27:32 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMyA5-009PCf-LR
	for linux-mediatek@lists.infradead.org; Tue, 31 Jan 2023 21:27:31 +0000
Received: by mail-ej1-x62b.google.com with SMTP id me3so45622882ejb.7
        for <linux-mediatek@lists.infradead.org>; Tue, 31 Jan 2023 13:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SqsL2fu3OvVG2mbH6Q7pzKx+U8+i7MHA1r69TmMusvk=;
        b=XFg1jmIWcA6fJIRfBvtrzs1WvKg8bHYjhIABmhN0A5Umzk8z8e3rL1YMY/yli0cUXO
         NUk1j/QkCE0WWlmdNvvDZ/XlpBV2k0Djw5gPGv3toIhWfUxGotQ94jCtAJJKN+L/SlmZ
         LLXLdmK8tb8RNGFptB3Bjns7CrNmIzW5TTjjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SqsL2fu3OvVG2mbH6Q7pzKx+U8+i7MHA1r69TmMusvk=;
        b=JmUQArFK5zT0AxkXImglth5JTD+Tl7qlzzYZTackh9cdIvsOVR8jLdVC9yBc1fqT7k
         rQ13fx18K4/KpfbwypX3LQ4Z4YRza17dhjulR1+ntexvSALlSeyNSZLr5wxbaFGuVdKk
         rQQyp8CHeJVSrCJxdR6HMjXXeQNHQXziTv55SWASyBusqspGxfi6CfH6JQSUVUtuy4ja
         U+OiS7ELiNgukW9zPfKE1bNpO/L7AO7i1x+umdd1kostJs91H3faSDebnWfTW17M+Mn0
         20qz1mTsgzxLAUcd488UNVdbBf/pjxG1nMxSYEJIGz5538K602XiODyqCw1pErDW8SEs
         bpJQ==
X-Gm-Message-State: AO0yUKUy8ic/Oio2dIx8XmKnq8d79fSBypYmhkRzDG+18ZJRundvtrjx
	u4FlYe6B8X4pVHX0ptqMtpeTu5VAPQFLFLXD63M=
X-Google-Smtp-Source: AK7set/bjgAyu6tFxrRitv3Df3Y3hOnGkvZKnvDq2z8HQo4oA6K6IKHdj80PmrFCrFQVqWHndv1ZlA==
X-Received: by 2002:a17:907:7642:b0:888:b471:8e46 with SMTP id kj2-20020a170907764200b00888b4718e46mr9073118ejc.50.1675200445097;
        Tue, 31 Jan 2023 13:27:25 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id t4-20020a170906948400b0084c4b87aa18sm8869356ejx.37.2023.01.31.13.27.24
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 13:27:24 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id m14so15037444wrg.13
        for <linux-mediatek@lists.infradead.org>; Tue, 31 Jan 2023 13:27:24 -0800 (PST)
X-Received: by 2002:adf:e90a:0:b0:2bf:e6b6:c6b0 with SMTP id
 f10-20020adfe90a000000b002bfe6b6c6b0mr18542wrm.405.1675200443775; Tue, 31 Jan
 2023 13:27:23 -0800 (PST)
MIME-Version: 1.0
References: <20230106030108.2542081-1-swboyd@chromium.org> <CAD=FV=U0Bwx4HzCSL8EE-+ngGLZ-NqpbC+J9jby84FKBOB_ddQ@mail.gmail.com>
 <CAD=FV=VMebqPd2ozLzY65Kba9snLKQ-KKd684O0cGQzyP0kcwQ@mail.gmail.com>
In-Reply-To: <CAD=FV=VMebqPd2ozLzY65Kba9snLKQ-KKd684O0cGQzyP0kcwQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 31 Jan 2023 13:27:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UJOf7X-Jk0seB=Krt53Mzm6NztjP_KdT265zz=EsKp2A@mail.gmail.com>
Message-ID: <CAD=FV=UJOf7X-Jk0seB=Krt53Mzm6NztjP_KdT265zz=EsKp2A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230131_132729_754301_3023924D 
X-CRM114-Status: GOOD (  50.32  )
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

On Thu, Jan 26, 2023 at 4:52 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Jan 18, 2023 at 1:34 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Thu, Jan 5, 2023 at 7:01 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > The unprepare sequence has started to fail after moving to panel bridge
> > > code in the msm drm driver (commit 007ac0262b0d ("drm/msm/dsi: switch to
> > > DRM_PANEL_BRIDGE")). You'll see messages like this in the kernel logs:
> > >
> > >    panel-boe-tv101wum-nl6 ae94000.dsi.0: failed to set panel off: -22
> > >
> > > This is because boe_panel_enter_sleep_mode() needs an operating DSI link
> > > to set the panel into sleep mode. Performing those writes in the
> > > unprepare phase of bridge ops is too late, because the link has already
> > > been torn down by the DSI controller in post_disable, i.e. the PHY has
> > > been disabled, etc. See dsi_mgr_bridge_post_disable() for more details
> > > on the DSI .
> > >
> > > Split the unprepare function into a disable part and an unprepare part.
> > > For now, just the DSI writes to enter sleep mode are put in the disable
> > > function. This fixes the panel off routine and keeps the panel happy.
> > >
> > > My Wormdingler has an integrated touchscreen that stops responding to
> > > touch if the panel is only half disabled too. This patch fixes it. And
> > > finally, this saves power when the screen is off because without this
> > > fix the regulators for the panel are left enabled when nothing is being
> > > displayed on the screen.
> > >
> > > Fixes: 007ac0262b0d ("drm/msm/dsi: switch to DRM_PANEL_BRIDGE")
> > > Fixes: a869b9db7adf ("drm/panel: support for boe tv101wum-nl6 wuxga dsi video mode panel")
> > > Cc: yangcong <yangcong5@huaqin.corp-partner.google.com>
> > > Cc: Douglas Anderson <dianders@chromium.org>
> > > Cc: Jitao Shi <jitao.shi@mediatek.com>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Rob Clark <robdclark@chromium.org>
> > > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > > ---
> > >  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 16 ++++++++++++----
> > >  1 file changed, 12 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> > > index 857a2f0420d7..c924f1124ebc 100644
> > > --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> > > +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> > > @@ -1193,14 +1193,11 @@ static int boe_panel_enter_sleep_mode(struct boe_panel *boe)
> > >         return 0;
> > >  }
> > >
> > > -static int boe_panel_unprepare(struct drm_panel *panel)
> > > +static int boe_panel_disable(struct drm_panel *panel)
> > >  {
> > >         struct boe_panel *boe = to_boe_panel(panel);
> > >         int ret;
> > >
> > > -       if (!boe->prepared)
> > > -               return 0;
> > > -
> > >         ret = boe_panel_enter_sleep_mode(boe);
> > >         if (ret < 0) {
> > >                 dev_err(panel->dev, "failed to set panel off: %d\n", ret);
> > > @@ -1209,6 +1206,16 @@ static int boe_panel_unprepare(struct drm_panel *panel)
> > >
> > >         msleep(150);
> > >
> > > +       return 0;
> > > +}
> > > +
> > > +static int boe_panel_unprepare(struct drm_panel *panel)
> > > +{
> > > +       struct boe_panel *boe = to_boe_panel(panel);
> > > +
> > > +       if (!boe->prepared)
> > > +               return 0;
> > > +
> > >         if (boe->desc->discharge_on_disable) {
> > >                 regulator_disable(boe->avee);
> > >                 regulator_disable(boe->avdd);
> > > @@ -1528,6 +1535,7 @@ static enum drm_panel_orientation boe_panel_get_orientation(struct drm_panel *pa
> > >  }
> > >
> > >  static const struct drm_panel_funcs boe_panel_funcs = {
> > > +       .disable = boe_panel_disable,
> > >         .unprepare = boe_panel_unprepare,
> > >         .prepare = boe_panel_prepare,
> > >         .enable = boe_panel_enable,
> >
> > As mentioned by Stephen, my initial reaction was that this felt
> > asymmetric. We were moving some stuff from unprepare() to disable()
> > and it felt like that would mean we would also need to move something
> > from prepare() to enable. Initially I thought maybe that "something"
> > was all of boe_panel_init_dcs_cmd() but I guess that didn't work.
> >
> > I don't truly have a reason that this _has_ to be symmetric. I was
> > initially worried that there might be some place where we call
> > pre_enable(), then never call enable() / disable(), and then call
> > post_disable(). That could have us in a bad state because we'd never
> > enter sleep mode / turn the display off. However (as I think I've
> > discovered before and just forgot), I don't think this is possible
> > because we always call pre-enable() and enable() together. Also, as
> > mentioned by Sam, we're about to fully shut the panel's power off so
> > (unless it's on a shared rail) it probably doesn't really matter.
> >
> > Thus, I'd be OK with:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'm also happy to land this (adding Cc: stable) to drm-misc-fixes if
> > nobody has any objections (also happy if someone else wants to land
> > it). I guess the one worry I have is that somehow this could break
> > something for one of the other 8 panels that this driver supports (or
> > it could have bad interactions with the display controller used on a
> > board with one of these panels?). Maybe we should have "Cc: stable"
> > off just to give it extra bake time? ...and maybe even push to
> > drm-misc-next instead of -fixes again to give extra bake time?
>
> This thread has gone silent. I'll plan to land the patch in
> drm-misc-next early next week, maybe Monday, _without_ Ccing stable,
> so we have the longest possible bake time. If anyone has objections,
> please yell.

Pushed to drm-misc-next:

c913cd548993 drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed
during disable

