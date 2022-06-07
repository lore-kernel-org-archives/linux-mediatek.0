Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F841C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 03:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KThMO+nZVCbRrh81fVLlSd/S0aHIOv18gPG+VKVXHHE=; b=ZzdfAQc6vuVurB
	hIgqLHo1mNxFeFFuaNTERsNp+90Des9W4OzsfBp/mzgNFb5LPx8TfNxqjs8DqOMuMhZxzwh5WaLD2
	pSiQf9w4uLya5m1/kBXmY+mKUPnQWbZ1sZPEZp7V+8YDv7vWMhvQPlPnvvUQbKSvSUSKJWdsRj5vx
	iDhSQI8Zj2FtdEuqEedgqN12cGAlVl0K/xP4FXuDQM9WdWehMiwO/SSxFLtQDgI3K3diynXMGCgmm
	rhTD7Vlcs1rH/FxuOj9PuJZrX/aVZ9X9rXHfr5XdTF08ed03hFs1gvoHsSLf64EoQBJPl/E6Fn5F1
	GF2FVY4VH/L6VmJ2YbMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyQJI-004YUW-PZ; Tue, 07 Jun 2022 03:55:16 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyQJF-004YSL-VX
	for linux-mediatek@lists.infradead.org; Tue, 07 Jun 2022 03:55:15 +0000
Received: by mail-ed1-x530.google.com with SMTP id o10so21258317edi.1
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 20:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+rF3WnKoDiq9d0J5JTo2dbHB29qndpGa9NLM7gHMjks=;
        b=dOTd7bOssfnug98baEiau/IHu9iQgmO17eKfDY/Bah2lZ9CfdHsZQVDOuAxtfFOjt6
         OfMgThkcO291HJnaSUEMg8Th8FQnPhCGiKp27GaI/cmwZ2T3IA2Pv/VH1MCx4C5srtdM
         KSQa6JTtjCr3JKGym2k92cRDgRRlctuhUe8L8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+rF3WnKoDiq9d0J5JTo2dbHB29qndpGa9NLM7gHMjks=;
        b=7vRElBgbXxA3F+Pa1TjyT7HBJBldL79mwJFU2w885OhNIEiwajHcix6YauRRlzvTWt
         XdtJo6bDfadFT5jjjTqE4VVPfdSonoZMc8XQhRzRflYrc8Q1o3a8gJQWd0AnbDct6w3T
         pbEyE7SefcPrrc7lF+DLPxW8YrTG3I5aCQZnoY7OPffLo4Q0BElEv+ISqZJWxlEHemrZ
         PeSYJ9y4tNt2DDmOZRlGG+er8j0Z8Jkggk8LUO47ANmiHBtF9g+jlUGj3BDogz3zIZmw
         lPY7qv7gd6UZmYkire730iAbbQgTyIvv8fv40PZ3oXJGiucLwfAanfBR4XzTK6NA7QAY
         FFxA==
X-Gm-Message-State: AOAM5308sSoTHZm4FlVMEAKGUn6Awp03mi3AMlO5tMBISgynowuEEMjH
	JcHzMoBG0l0RXfrDRhOcLYPPOMhf3Zaqa6obxFPEHw==
X-Google-Smtp-Source: ABdhPJxseST/bQW8I4wOtFU0k3sfPx8cJKe63oJ9hcqGlssDuTJQdN8hOFSR1H0gQ/VzLuzmJyaFXgWaoQDXWguxXK8=
X-Received: by 2002:a05:6402:84a:b0:423:fe99:8c53 with SMTP id
 b10-20020a056402084a00b00423fe998c53mr30452834edz.195.1654574109792; Mon, 06
 Jun 2022 20:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220606152431.1889185-1-hsinyi@chromium.org> <20220606152431.1889185-6-hsinyi@chromium.org>
 <Yp5Ul/ODUB/sQ0Jf@ravnborg.org>
In-Reply-To: <Yp5Ul/ODUB/sQ0Jf@ravnborg.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 7 Jun 2022 11:54:43 +0800
Message-ID: <CAJMQK-huAnvamC318FhHoBSTTnMB489PWsH6tZu3r9Ah990Gzw@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] drm/panel: panel-simple: Implement
 .get_orientation callback
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Thierry Reding <thierry.reding@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, Rob Clark <robdclark@chromium.org>, 
	Stephen Boyd <swboyd@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
	Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_205514_057982_6AE7AA6E 
X-CRM114-Status: GOOD (  31.94  )
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

On Tue, Jun 7, 2022 at 3:25 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Hsin-Yi,
>
> On Mon, Jun 06, 2022 at 11:24:28PM +0800, Hsin-Yi Wang wrote:
> > To return the orientation property to drm/kms driver.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >  drivers/gpu/drm/panel/panel-simple.c | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> > index 4a2e580a2f7b..f232b8cf4075 100644
> > --- a/drivers/gpu/drm/panel/panel-simple.c
> > +++ b/drivers/gpu/drm/panel/panel-simple.c
> > @@ -411,7 +411,12 @@ static int panel_simple_get_modes(struct drm_panel *panel,
> >       /* add hard-coded panel modes */
> >       num += panel_simple_get_non_edid_modes(p, connector);
> >
> > -     /* set up connector's "panel orientation" property */
> > +     /*
> > +      * drm drivers are expected to call drm_panel_get_orientation() to get
> > +      * panel's orientation then drm_connector_set_panel_orientation() to
> > +      * set the property before drm_dev_register(). Otherwise there will be
> > +      * a WARN_ON if orientation is set after drm is registered.
> > +      */
>
> This comment is not really relevant here. If we need to explain this
> then put it in drm_panel.c/h - as this applies for all panels and not
> just the panel_simple.
> Keep in mind, this is the source new panels often use a inspiration and
> no need to have this copied around.
>
Will update this.

> >       drm_connector_set_panel_orientation(connector, p->orientation);
> >
> >       return num;
> > @@ -434,6 +439,14 @@ static int panel_simple_get_timings(struct drm_panel *panel,
> >       return p->desc->num_timings;
> >  }
> >
> > +static enum drm_panel_orientation panel_simple_get_orientation(struct drm_panel *panel)
> > +{
> > +       struct panel_simple *p = to_panel_simple(panel);
> > +
> > +       return p->orientation;
> > +}
> > +
> > +
> >  static const struct drm_panel_funcs panel_simple_funcs = {
> >       .disable = panel_simple_disable,
> >       .unprepare = panel_simple_unprepare,
> > @@ -441,6 +454,7 @@ static const struct drm_panel_funcs panel_simple_funcs = {
> >       .enable = panel_simple_enable,
> >       .get_modes = panel_simple_get_modes,
> >       .get_timings = panel_simple_get_timings,
> > +     .get_orientation = panel_simple_get_orientation,
>
> I like the order in this list to match the order in the .h file.
> So my OCD would like you to move it up right after get_modes,
> but feel free to ignore this.
>
Sure.

> With the suggested changes:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>
> >  };
> >
> >  static struct panel_desc panel_dpi;
> > --
> > 2.36.1.255.ge46751e96f-goog

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
