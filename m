Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6A3C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 15:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cQMpSSqnV7P4eh5TsABWi5m2Rcu/4qpmQJWCeL0NuwE=; b=szCqe5A0y632/t
	/73jCO2yUPOLGGF73xcvxb/dfHlPiccoNqEQeohnHlVXhhP8iY3lExlpxkJ+9v3iz5SrSveiGfxaz
	a4iRQ14qMOiasOMXpJXWhQpSzrdc/8S/s74USD8R+qLItiNjpJ22o3u8nemCJWzqPvGu2VsDN78dJ
	Pagn0igYACC3S1HgJVeF9aRMD5swRGpYvrrYVICyp1D0NyazLT0Znx2cc0zZ9NMPcWFXUTgnJlckH
	121Ig190kbZyONRXmCqDTvFITSP4/32jMwnj3wRvcTVaiJdsebGn1hwmAbuUbj5aEGD1N5HIWiO2q
	KGcxB4oiRXGO5lJxmwMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEgW-001pLq-KW; Mon, 06 Jun 2022 15:30:28 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEcd-001nKo-I7
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 15:26:29 +0000
Received: by mail-ej1-x62c.google.com with SMTP id me5so29128132ejb.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 08:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g0CfqZDZnQGiX6/HBvu3FZf3i9OJ+2C0+13cUpQYRZM=;
        b=fLRQ3/QA1wNcb4MXDUqS4aU+HWo7LVK33bo5FNY/J5Vg95iJWBLdAyFukFxriEzpwA
         jjcSJ6rwdgTWTIyuUdKJrao/n19sdCT5gry7LauyyQwURqAJr2MEeE+aJDVRB1g8mNuJ
         gLH9M5JMHkqEzr4X3juuMpuGvpbhqKX7daMNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g0CfqZDZnQGiX6/HBvu3FZf3i9OJ+2C0+13cUpQYRZM=;
        b=ilNBf4K3qGEpDpNfQgQydVZ/1toSB3g2Mo+Hia4Hno3H7LaoAjN+OFbgLMkv/38439
         5kSxZJuUFHWMypXsNoX/bDTEVg11HFqLavHcMqjcmxi0NXI098T13kQLyviP9xEAQeaL
         QByaN0tFico5W5c4nqm4wSK6SlWB+rd4/wBIAh6JJqwARtpkUXP9G6ufnt4l7ruE1Tio
         0ZUF6NX74DwEhekj4WXJsvkpl0bLw2ljpokr0jxkALHfiQkLtwE99RN9zgFpQ8MIesRT
         gEs6+pULao5xpJTZU2j0+G8IYvf6POlajub4S+CjJT0MGJznkTQDXE4J38H3ZLGhQ5/i
         RDCw==
X-Gm-Message-State: AOAM532oKAd99XiyBmI1uDQYQ9Yi08w3oaoGPWyyOj1l6/2HgFJZ7ON9
	shisjlZByEJ0cqAbyeXj+7kNrdW9VHOwa0yWtUJK9Q==
X-Google-Smtp-Source: ABdhPJwoDpT6S3WSY8htZrD/zFlYO0O4+g2JDXZf4OQeXUukmweb7201Svj1Dc8HJysdoeWK939TEdsLvzykBknOAiY=
X-Received: by 2002:a17:906:9b46:b0:711:1f7e:36f8 with SMTP id
 ep6-20020a1709069b4600b007111f7e36f8mr10222093ejc.746.1654529183491; Mon, 06
 Jun 2022 08:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220606044720.945964-1-hsinyi@chromium.org> <20220606044720.945964-2-hsinyi@chromium.org>
 <CAD=FV=V7FmkJyyXr4C6jy9-hOhnzgoo=g5tx_3z3rnCCC40Exg@mail.gmail.com>
In-Reply-To: <CAD=FV=V7FmkJyyXr4C6jy9-hOhnzgoo=g5tx_3z3rnCCC40Exg@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 6 Jun 2022 23:25:57 +0800
Message-ID: <CAJMQK-ic2fGfyEaJp5By1dNRJYy7Qwes4gQWADD5Sf=Z5zgafg@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] drm/panel: Add an API drm_panel_get_orientation()
 to return panel orientation
To: Doug Anderson <dianders@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Rob Clark <robdclark@chromium.org>, 
	Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_082627_671833_773ED682 
X-CRM114-Status: GOOD (  23.43  )
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

On Mon, Jun 6, 2022 at 10:21 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Sun, Jun 5, 2022 at 9:47 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > Panels usually call drm_connector_set_panel_orientation(), which is
> > later than drm/kms driver calling drm_dev_register(). This leads to a
> > WARN().
> >
> > The orientation property is known earlier. For example, some panels
> > parse the property through device tree during probe.
> >
> > Add an API to return the property from panel to drm/kms driver, so the
> > drivers are able to call drm_connector_set_panel_orientation() before
> > drm_dev_register().
> >
> > Suggested-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> > v2->v3: no change
> > ---
> >  drivers/gpu/drm/drm_panel.c |  8 ++++++++
> >  include/drm/drm_panel.h     | 10 ++++++++++
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > index f634371c717a..4a512ca80673 100644
> > --- a/drivers/gpu/drm/drm_panel.c
> > +++ b/drivers/gpu/drm/drm_panel.c
> > @@ -223,6 +223,14 @@ int drm_panel_get_modes(struct drm_panel *panel,
> >  }
> >  EXPORT_SYMBOL(drm_panel_get_modes);
> >
> > +enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel)
> > +{
> > +       if (panel && panel->funcs && panel->funcs->get_orientation)
> > +               return panel->funcs->get_orientation(panel);
> > +
> > +       return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
> > +}
> > +EXPORT_SYMBOL(drm_panel_get_orientation);
> >  #ifdef CONFIG_OF
>
> nit: there used to be a blank line before the #ifdef but there no
> longer is after your patch.
>
Added in v4.
> Other than that...
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
