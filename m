Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B9DC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 18:19:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C89B761154
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 18:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C89B761154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VpN6tdsVWf4J8K/BoFZwcQqxR4/SnOa92qzWRI1hn1w=; b=OuBWO08ROlnRhA
	sN8fGvJ6eqc8p7qdP1fDbVuMnwy7DSJrvVd2suFyxu7cOH9VT8EHz/fHfysS23R1aj89D0S7N31b/
	Qy251AkSpMCwFozBVtYxrea/TAoqc6xPUhQbJdtlz2AvHYIKo9wxRRRDQmsir6XW361MN8KB587IP
	OzxgahSOt82As697Ykl+jxXmbg8kW0XNUXHaaiBXi/DhjLmvW/hxmPE5sNBBgtYhEL2iAVfiRvP3p
	8KYHlShx+b5N0e5mpI3fLs/0LixTMJBMpxaQn+fRWIpAuA9pQkaYYyawegnpRC7KwiDaZW2dznjAX
	LONAfIMlapiT4gwEcR3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maiq7-000HTG-He; Wed, 13 Oct 2021 18:18:55 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maiq4-000HSm-Jz
 for linux-mediatek@lists.infradead.org; Wed, 13 Oct 2021 18:18:54 +0000
Received: by mail-lf1-x136.google.com with SMTP id p16so15841812lfa.2
 for <linux-mediatek@lists.infradead.org>; Wed, 13 Oct 2021 11:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sNgBMY1EYvAR4tAnZyZ3ch4hUWrBZvBwo5YqamtcXbc=;
 b=FLFFNc84r4BMCEfdbEVcu+vA1YqaU1yTAF3MB3CyIi2oAF4K35vmpoLfydHizp5GtW
 XsmUKpfWI+o9cK2VOWCTmeolIxGgR+keIoZxSQ9+GmZFRC/AngIkBnOmo2/uuoY2VXGP
 T4dzUVDYE0CltRxbXI/P9x0/NFPSKOiFTYkmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sNgBMY1EYvAR4tAnZyZ3ch4hUWrBZvBwo5YqamtcXbc=;
 b=xcHwVSuhMeugQ2ptz8FtjFnJ62qs9h+h6hKsNHjiR/K4jPERqFxjH9cs+ooSDdXICC
 fvGorovfWcf7n6Zkq9D7Ki9ighV4Mcg6j2rBCABRLMFuyJGENI2H8LjyOscOByXlh4AW
 CLcvGdgRKFgAMdebZRO9/0VNdKDvsQ1HZw9esIXKHUapnuqQJzBJ/MMNP15VZF2/Dy1B
 rVnUJmJJkjQe2z4Rz7/qlACUhe3HI7oQjr/A0hNVrBnpnghFLt64DjtOg+SkFHYpRZD8
 Gw5RpF+lJ1bVf+VSQoUzU10L3+V2eetq38SPHz5TsxChJ7q1MOhRG4eHIM4L7ciV4BEH
 gBIw==
X-Gm-Message-State: AOAM530t2y8AnNw5W0dz1EdmpZXEps7OTCuwGwi/eLOxSQeYlrZaBIvW
 +/oJ2chQeInXUAgfck2Wz3hNEZv+LIf6w+N9g8+hOQ==
X-Google-Smtp-Source: ABdhPJwoX+C04YhsDhO8yVn8Dr+86X4h0AQku4VB7IDCxSx/48LOe1M/zOnFx8J4gSxpHrsZxH05TDajeJhGuoz0T0U=
X-Received: by 2002:a05:6512:1024:: with SMTP id
 r4mr519678lfr.369.1634149130936; 
 Wed, 13 Oct 2021 11:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210929194012.3433306-1-markyacoub@chromium.org>
 <20211001203434.GY2515@art_vandelay>
In-Reply-To: <20211001203434.GY2515@art_vandelay>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 13 Oct 2021 14:18:40 -0400
Message-ID: <CAJUqKUqCkYffX2Pr5sT1OTB2NOHPbz5g9udQRSGV_BoSyr=u9A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: Add Gamma and Degamma LUT sizes props to
 drm_crtc to validate.
To: Sean Paul <sean@poorly.run>
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 Anson Jacob <anson.jacob@amd.com>, Mark Yacoub <markyacoub@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_111852_711353_9331F171 
X-CRM114-Status: GOOD (  46.08  )
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

On Fri, Oct 1, 2021 at 4:34 PM Sean Paul <sean@poorly.run> wrote:
>
> On Wed, Sep 29, 2021 at 03:39:25PM -0400, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@google.com>
> >
> > [Why]
> > 1. drm_atomic_helper_check doesn't check for the LUT sizes of either Gamma
> > or Degamma props in the new CRTC state, allowing any invalid size to
> > be passed on.
> > 2. Each driver has its own LUT size, which could also be different for
> > legacy users.
> >
> > [How]
> > 1. Create |degamma_lut_size| and |gamma_lut_size| to save the LUT sizes
> > assigned by the driver when it's initializing its color and CTM
> > management.
> > 2. Create drm_atomic_helper_check_crtc which is called by
> > drm_atomic_helper_check to check the LUT sizes saved in drm_crtc that
> > they match the sizes in the new CRTC state.
> >
>
> Did you consider extending drm_color_lut_check() with the size checks?
renamed it to be specific to channels. It's HW specific so i thought
of keeping it a separate check if the driver chooses to check it.
Removed the LUT size check that intel uses though.
>
> > Fixes: igt@kms_color@pipe-A-invalid-gamma-lut-sizes on MTK
> > Tested on Zork(amdgpu) and Jacuzzi(mediatek)
> >
> > Signed-off-by: Mark Yacoub<markyacoub@chromium.org>
>
> nit: missing a space between name and email
>
>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 56 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/drm_color_mgmt.c    |  2 ++
> >  include/drm/drm_atomic_helper.h     |  1 +
> >  include/drm/drm_crtc.h              | 11 ++++++
> >  4 files changed, 70 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index 2c0c6ec928200..265b9747250d1 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -930,6 +930,58 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_check_planes);
> >
> > +/**
> > + * drm_atomic_helper_check_planes - validate state object for CRTC changes
>
> Ctrl+c/Ctrl+v error here
>
> > + * @state: the driver state object
> > + *
> > + * Check the CRTC state object such as the Gamma/Degamma LUT sizes if the new
>
> Are there missing words between "object" and "such"?
>
not really. I was thinking of how to reword it without being too
verbose and nothing sounded good.
I mean I'm checking the object, such as the LUT which is part of this object.
> > + * state holds them.
> > + *
> > + * RETURNS:
> > + * Zero for success or -errno
> > + */
> > +int drm_atomic_helper_check_crtc(struct drm_atomic_state *state)
>
> drm_atomic_helper_check_crtcs to be consistent with
> drm_atomic_helper_check_planes
>
> > +{
> > +     struct drm_crtc *crtc;
> > +     struct drm_crtc_state *new_crtc_state;
> > +     int i;
> > +
> > +     for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
>
> no space before (
>
> > +             if (new_crtc_state->gamma_lut) {
>
> Perhaps gate these with a check of state->color_mgmt_changed first?
done .  did it for each check so you can easily expand in the future
and squeeze in more things around those checks as it loops the CRTC
states.
>
> > +                     uint64_t supported_lut_size = crtc->gamma_lut_size;
> > +                     uint32_t supported_legacy_lut_size = crtc->gamma_size;
> > +                     uint32_t new_state_lut_size =
> > +                             drm_color_lut_size(new_crtc_state->gamma_lut);
>
> nit: new_state_lut_size and supported_lut_size can be pulled out to top level scope
> to avoid re-instantiation on each iteration
>
CRTC is an iterator, so it changes within the loop.
> > +
> > +                     if (new_state_lut_size != supported_lut_size &&
> > +                         new_state_lut_size != supported_legacy_lut_size) {
>
> According to the docbook, "If drivers support multiple LUT sizes then they
> should publish the largest size, and sub-sample smaller sized LUTs". So
> should this check be > instead of != ?
>
so IGT tests see it differently, they check for a very specific size,
rather than a range. so if the legacy size is 256 and regular is 1024,
1000 isn't a valid size.
> > +                             DRM_DEBUG_DRIVER(
>
> drm_dbg_state() is probably more appropriate
>
> > +                                     "Invalid Gamma LUT size. Should be %u (or %u for legacy) but got %u.\n",
> > +                                     supported_lut_size,
> > +                                     supported_legacy_lut_size,
> > +                                     new_state_lut_size);
> > +                             return -EINVAL;
> > +                     }
> > +             }
> > +
> > +             if (new_crtc_state->degamma_lut) {
> > +                     uint32_t new_state_lut_size =
> > +                             drm_color_lut_size(new_crtc_state->degamma_lut);
> > +                     uint64_t supported_lut_size = crtc->degamma_lut_size;
> > +
> > +                     if (new_state_lut_size != supported_lut_size) {
> > +                             DRM_DEBUG_DRIVER(
>
> drm_dbg_state()
>
> > +                                     "Invalid Degamma LUT size. Should be %u but got %u.\n",
> > +                                     supported_lut_size, new_state_lut_size);
> > +                             return -EINVAL;
> > +                     }
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL(drm_atomic_helper_check_crtc);
> > +
> >  /**
> >   * drm_atomic_helper_check - validate state object
> >   * @dev: DRM device
> > @@ -975,6 +1027,10 @@ int drm_atomic_helper_check(struct drm_device *dev,
> >       if (ret)
> >               return ret;
> >
> > +     ret = drm_atomic_helper_check_crtc(state);
> > +     if (ret)
> > +             return ret;
> > +
> >       if (state->legacy_cursor_update)
> >               state->async_update = !drm_atomic_helper_async_check(dev, state);
> >
> > diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> > index bb14f488c8f6c..72a1b628e7cdd 100644
> > --- a/drivers/gpu/drm/drm_color_mgmt.c
> > +++ b/drivers/gpu/drm/drm_color_mgmt.c
> > @@ -166,6 +166,7 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
> >       struct drm_mode_config *config = &dev->mode_config;
> >
> >       if (degamma_lut_size) {
> > +             crtc->degamma_lut_size = degamma_lut_size;
> >               drm_object_attach_property(&crtc->base,
> >                                          config->degamma_lut_property, 0);
> >               drm_object_attach_property(&crtc->base,
> > @@ -178,6 +179,7 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
> >                                          config->ctm_property, 0);
> >
> >       if (gamma_lut_size) {
> > +             crtc->gamma_lut_size = gamma_lut_size;
> >               drm_object_attach_property(&crtc->base,
> >                                          config->gamma_lut_property, 0);
> >               drm_object_attach_property(&crtc->base,
> > diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> > index 4045e2507e11c..3eda13622ca1e 100644
> > --- a/include/drm/drm_atomic_helper.h
> > +++ b/include/drm/drm_atomic_helper.h
> > @@ -38,6 +38,7 @@ struct drm_atomic_state;
> >  struct drm_private_obj;
> >  struct drm_private_state;
> >
> > +int drm_atomic_helper_check_crtc(struct drm_atomic_state *state);
> >  int drm_atomic_helper_check_modeset(struct drm_device *dev,
> >                               struct drm_atomic_state *state);
> >  int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> > index 13eeba2a750af..c602be2cafca9 100644
> > --- a/include/drm/drm_crtc.h
> > +++ b/include/drm/drm_crtc.h
> > @@ -1072,6 +1072,17 @@ struct drm_crtc {
> >       /** @funcs: CRTC control functions */
> >       const struct drm_crtc_funcs *funcs;
> >
> > +     /**
> > +      * @degamma_lut_size: Size of degamma LUT.
> > +      */
> > +     uint32_t degamma_lut_size;
> > +
> > +     /**
> > +      * @gamma_lut_size: Size of Gamma LUT. Not used by legacy userspace such as
> > +      * X, which doesn't support large lut sizes.
> > +      */
> > +     uint32_t gamma_lut_size;
> > +
>
> Above, you're checking
>
> if (new_state_lut_size != gamma_size && new_state_lut_size != gamma_lut_size)
>         fail;
>
> doesn't that imply that gamma_size and gamma_lut_size must always be equal? If
> so, perhaps turf this new state and rename degamma_lut_size to degamma_size to
> be consistent.
>
> De-duping this and initializing crtc->gamma_size in the initialization would
> mean the if (crtc->gamma_size) check in drm_crtc_supports_legacy_check() is no
> longer useful (and possibly other similar checks), so some care will need to be
> taken to avoid regression. I think the effort is worthwhile to avoid introducing
> new state.
>
>
>
> >       /**
> >        * @gamma_size: Size of legacy gamma ramp reported to userspace. Set up
> >        * by calling drm_mode_crtc_set_gamma_size().
> > --
> > 2.33.0.685.g46640cef36-goog
> >
>
> --
> Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
