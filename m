Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355F8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 07:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rbp+dB26b/5mjCyHAe5EVigbRtTJCJekRnPyNGGxElk=; b=sZFvrzucpvCVv9
	4+u6yTiau86kklXcF1TjRfCfhgt65MtkLiC9qCLyAflGjwzavU9tEnMkwfh2WacMdjDqvWISuyg/m
	JVOZOiWuy7RSOHqbXIULUHTxkOfDKL0pm3k/gfEiFnBCULrmRVzfACEfY20aMxK7DX4Jth3JxG0ol
	BDnWMhT1L4Eh1DGGoY0wc9zdbvUywWMceY1/oUq/yJOPe5gTemz3wbpQ06yisd7Myky2N4XgHpQJ2
	YiS2iVkwNIeNPQd6c8kZOt623j7s6UHcPsVTEiDFqLkrXM/sgf2DMwxj4UXO/R9fO7SIX4tz87V7g
	8k/i2b1aT1DINdI2QeHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyU5w-005eD9-J2; Tue, 07 Jun 2022 07:57:44 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyU2M-005cTP-5F
	for linux-mediatek@lists.infradead.org; Tue, 07 Jun 2022 07:54:04 +0000
Received: by mail-ed1-x52e.google.com with SMTP id b8so5172053edj.11
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jun 2022 00:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bTcKUvKBFqx0lJtGawmW30NCfuDMQMt7XlkJoMiwP40=;
        b=BRcrqvdcJ8xhPPgG0bBbVBAiVx5+b1kxVRYTF+auAqOwaNxiSEJIGoWo2Vw1NSQv+g
         m+QFnkk9OCc0qPYzLEDDAl6JIeZKI2nmJ3WKE52P77RWJopLhG0nlii3OGBErGC4aljv
         V5z+8qwkVzCJGQbsGoFZmWoLE7owrtk67FYI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bTcKUvKBFqx0lJtGawmW30NCfuDMQMt7XlkJoMiwP40=;
        b=giHSqUDBMR/FnuJpFX67lfaC8Fft1MIKvjJgKpAWD1V8bUX3utOFCxeQ3JFDMy+VlM
         HtmMYbeDhNavR62nEM2pRkJ6K6yJgACCi9RGT4GNAclJ2SlPAk6Nw9smDjMOJ++LMuiD
         7rzGbAIHGZ1/WcNxzpuPSq/lguwciC/L2/LIQb6hki/O0lE/uRD7/7qEuZj4F6RNi8EA
         StBhZEyeDwUi4/19nswvt93mG3zdi+GGgSI8icjuAtHAJz5eNWGazc/foBfOSZwkOhxu
         dirm0Z0QF/sugBdJNbnv3LcJhXtvDTqXJbXWwcXFnjRwD0elFmE15MzqYvfcryvWFkIV
         ZoKA==
X-Gm-Message-State: AOAM533kUAQF3GeVnna1djovgOaScsnSFHzNp0iMbVZ1uMwU5Fn+1hF9
	tKnhJFCOhBkFV/UW2/igulONGOFbnrQWmWyKgcMjCQ==
X-Google-Smtp-Source: ABdhPJxwDZlNTB+YxaMW6ZNNbb9evKtxWWCIjvCP63mUZOd90Ckf8Jn8me1MaQylI36w6ArAMzXiudnaT/5dtDqKCfQ=
X-Received: by 2002:a05:6402:1941:b0:413:2b5f:9074 with SMTP id
 f1-20020a056402194100b004132b5f9074mr32019311edz.414.1654588437586; Tue, 07
 Jun 2022 00:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220606152431.1889185-1-hsinyi@chromium.org> <20220606152431.1889185-2-hsinyi@chromium.org>
 <CAE-0n52mzczUdtwUgfdNOC_V7kBGhzFWHRT=QHDoH4kN+yCMGA@mail.gmail.com>
In-Reply-To: <CAE-0n52mzczUdtwUgfdNOC_V7kBGhzFWHRT=QHDoH4kN+yCMGA@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 7 Jun 2022 15:53:31 +0800
Message-ID: <CAJMQK-joqHaJeTNurzecmXcZ_eiK+24Tc0ok2zcFdUNXz3TQmQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] drm/panel: Add an API drm_panel_get_orientation()
 to return panel orientation
To: Stephen Boyd <swboyd@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, Rob Clark <robdclark@chromium.org>, 
	Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_005402_218587_37DAD898 
X-CRM114-Status: GOOD (  14.05  )
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

On Tue, Jun 7, 2022 at 3:06 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Hsin-Yi Wang (2022-06-06 08:24:24)
> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > index f634371c717a..e12056cfeca8 100644
> > --- a/drivers/gpu/drm/drm_panel.c
> > +++ b/drivers/gpu/drm/drm_panel.c
> > @@ -223,6 +223,15 @@ int drm_panel_get_modes(struct drm_panel *panel,
> >  }
> >  EXPORT_SYMBOL(drm_panel_get_modes);
> >
> > +enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel)
>
> Should 'panel' be marked const to indicate that it can't be modified?
>

But .get_orientation() will need to call to_XXX_panel, eg.
static inline struct boe_panel *to_boe_panel(struct drm_panel *panel)

==> .get_modes(panel) <-- can't be const.
==> drm_panel_get_orientation(panel) <-- can't be const.

We can definitely cast it in the functions, or make to_XXX_panel()
accept const, but I think this will lose the meaning of using const
anyway.

> > +{
> > +       if (panel && panel->funcs && panel->funcs->get_orientation)
> > +               return panel->funcs->get_orientation(panel);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
