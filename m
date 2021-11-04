Return-Path: <SRS0=FoZt=PX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2FBC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 21:16:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1B4960E90
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 21:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1B4960E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alum.mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJMzHKHHCxqCWrbZmT1x0YhGMVGTvbAma8b1e/UY/cg=; b=1bNDQcec0SqLkJ
	EYTh3GHyGkrkniFZRGy5morn6gx8jqYolmnQNVYhKoN/MK0Nkl6O06zT0+x02gs+3QSkCY0E6SA6M
	cVe/JTWivdNE9fTsD8nJ0cl4dSl2RToTzKbTnhKurf16yKVsDXLDsQKJKmpvbLAlgOJRdBPDey8Y1
	VKWn4i8psRMlDlbWLjy5znU3zTTPJSMwyey/0GoUEt7gdJmfnZOoBGyLghHIEKMHY342fnd4JJOwT
	/8BlkcpHaOFeBM004jxyYxRQmFH8GU2I1Zgy5di3Zk/7OqdxLS6IcV4ofne1Li6FExkcAtQ7SVnQ7
	cZxAy0u6/ie3n3qfufEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mik5Z-009zBG-35; Thu, 04 Nov 2021 21:16:01 +0000
Received: from mail-io1-f47.google.com ([209.85.166.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mik5U-009zAK-3e; Thu, 04 Nov 2021 21:15:58 +0000
Received: by mail-io1-f47.google.com with SMTP id d70so7555329iof.7;
 Thu, 04 Nov 2021 14:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rir9YdN+/psplWSTAq2adWSxInvkdj3Vqnr1G/woK4k=;
 b=E0lXQGkELx8VEqyfBpgBf5zD30yT1Yl0paJtm3Tif2mfnE0BlBhyUfYjBu7cTKhY8Q
 PJKDVH24K+FlXVyiSJAZDzF97PbY7At8Vei4EJeTbmg/DCm8fIJ+dTuCZPgyKQNIkBwt
 rO8DBWTZOgwqWoRbMD/Aic5BGIo6rcHTRLOCUtngdN/V4d2qAsmN4BcSOwcl7BSPihj7
 6gWGUEoLB492eRNHx7/t5BdfK7XQuWTIdV27JRBIgHUlyHgk1R3e6mP35+oy296ZLfbn
 iF4VsoKRmqdet1zR2KF1mxPw7jnr/r7roH4J3EZA7ozm6z6/OUmc0VngltVzUpJdtMn6
 KyQw==
X-Gm-Message-State: AOAM530OBZ6jj9WSNQ2qyE5wUXVpAZW1qiH1VRW0ZAm/YhnkqP61jq/c
 XGzkRrgXbtXd0wXgrh/4OmimEhERZcFZXRyQqd4=
X-Google-Smtp-Source: ABdhPJzyKH3g3jJOSoda9M2VRJGM2M2jDs7vyspnCIwQ29KrnbEUj6uC5/Ax/jjM4skmQkr2841efbxNq6yddXDO3Bg=
X-Received: by 2002:a02:a311:: with SMTP id q17mr5872111jai.15.1636060554693; 
 Thu, 04 Nov 2021 14:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211104200255.63499-1-markyacoub@chromium.org>
 <20211104200255.63499-2-markyacoub@chromium.org>
In-Reply-To: <20211104200255.63499-2-markyacoub@chromium.org>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 4 Nov 2021 17:15:43 -0400
Message-ID: <CAKb7UvhEH4bwhGr=82zBT5dnHRFsK+pFafHWoS+j+PAE3a9x4Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] drm: Add Gamma and Degamma LUT sizes props to
 drm_crtc to validate.
To: Mark Yacoub <markyacoub@chromium.org>
Cc: pmenzel@molgen.mpg.de, David Airlie <airlied@linux.ie>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-mediatek@lists.infradead.org, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-arm-kernel@lists.infradead.org, Mark Yacoub <markyacoub@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_141556_183349_D4E92C13 
X-CRM114-Status: GOOD (  31.78  )
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

On Thu, Nov 4, 2021 at 4:03 PM Mark Yacoub <markyacoub@chromium.org> wrote:
>
> From: Mark Yacoub <markyacoub@google.com>
>
> [Why]
> 1. drm_atomic_helper_check doesn't check for the LUT sizes of either Gamma
> or Degamma props in the new CRTC state, allowing any invalid size to
> be passed on.
> 2. Each driver has its own LUT size, which could also be different for
> legacy users.
>
> [How]
> 1. Create |degamma_lut_size| and |gamma_lut_size| to save the LUT sizes
> assigned by the driver when it's initializing its color and CTM
> management.
> 2. Create drm_atomic_helper_check_crtc which is called by
> drm_atomic_helper_check to check the LUT sizes saved in drm_crtc that
> they match the sizes in the new CRTC state.
> 3. As the LUT size check now happens in drm_atomic_helper_check, remove
> the lut check in intel_color.c
>
> Resolves: igt@kms_color@pipe-A-invalid-gamma-lut-sizes on MTK
> Tested on Zork (amdgpu) and Jacuzzi (mediatek), volteer (TGL)
>
> v3:
> 1. Check for lut pointer inside drm_check_lut_size.
>
> v2:
> 1. Remove the rename to a parent commit.
> 2. Create a drm drm_check_lut_size instead of intel only function.
>
> v1:
> 1. Fix typos
> 2. Remove the LUT size check from intel driver
> 3. Rename old LUT check to indicate it's a channel change
>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c        | 52 ++++++++++++++++++++++
>  drivers/gpu/drm/drm_color_mgmt.c           | 19 ++++++++
>  drivers/gpu/drm/i915/display/intel_color.c | 32 ++++++-------
>  include/drm/drm_atomic_helper.h            |  1 +
>  include/drm/drm_color_mgmt.h               |  3 ++
>  include/drm/drm_crtc.h                     | 11 +++++
>  6 files changed, 99 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index bc3487964fb5e..548e5d8221fb4 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -929,6 +929,54 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_check_planes);
>
> +/**
> + * drm_atomic_helper_check_crtcs - validate state object for CRTC changes
> + * @state: the driver state object
> + *
> + * Check the CRTC state object such as the Gamma/Degamma LUT sizes if the new
> + * state holds them.
> + *
> + * RETURNS:
> + * Zero for success or -errno
> + */
> +int drm_atomic_helper_check_crtcs(struct drm_atomic_state *state)
> +{
> +       struct drm_crtc *crtc;
> +       struct drm_crtc_state *new_crtc_state;
> +       int i;
> +
> +       for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
> +               if (!new_crtc_state->color_mgmt_changed)
> +                       continue;
> +
> +               if (drm_check_lut_size(new_crtc_state->gamma_lut,
> +                                      crtc->gamma_lut_size) ||
> +                   drm_check_lut_size(new_crtc_state->gamma_lut,
> +                                      crtc->gamma_size)) {
> +                       drm_dbg_state(
> +                               state->dev,
> +                               "Invalid Gamma LUT size. Expected %u/%u, got %u.\n",
> +                               crtc->gamma_lut_size, crtc->gamma_size,
> +                               drm_color_lut_size(new_crtc_state->gamma_lut));
> +                       return -EINVAL;
> +               }
> +
> +               if (drm_check_lut_size(new_crtc_state->degamma_lut,
> +                                      crtc->degamma_lut_size)) {
> +                       drm_dbg_state(
> +                               state->dev,
> +                               "Invalid Degamma LUT size. Expected %u, got %u.\n",
> +                               crtc->degamma_lut_size,
> +                               drm_color_lut_size(
> +                                       new_crtc_state->degamma_lut));
> +                       return -EINVAL;
> +               }
> +       }
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_check_crtcs);
> +
>  /**
>   * drm_atomic_helper_check - validate state object
>   * @dev: DRM device
> @@ -974,6 +1022,10 @@ int drm_atomic_helper_check(struct drm_device *dev,
>         if (ret)
>                 return ret;
>
> +       ret = drm_atomic_helper_check_crtcs(state);
> +       if (ret)
> +               return ret;
> +
>         if (state->legacy_cursor_update)
>                 state->async_update = !drm_atomic_helper_async_check(dev, state);
>
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index 16a07f84948f3..c85094223b535 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -166,6 +166,7 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
>         struct drm_mode_config *config = &dev->mode_config;
>
>         if (degamma_lut_size) {
> +               crtc->degamma_lut_size = degamma_lut_size;
>                 drm_object_attach_property(&crtc->base,
>                                            config->degamma_lut_property, 0);
>                 drm_object_attach_property(&crtc->base,
> @@ -178,6 +179,7 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
>                                            config->ctm_property, 0);
>
>         if (gamma_lut_size) {
> +               crtc->gamma_lut_size = gamma_lut_size;
>                 drm_object_attach_property(&crtc->base,
>                                            config->gamma_lut_property, 0);
>                 drm_object_attach_property(&crtc->base,
> @@ -506,6 +508,23 @@ const char *drm_get_color_range_name(enum drm_color_range range)
>         return color_range_name[range];
>  }
>
> +/**
> + * drm_check_lut_size - Checks if LUT size matches the driver expected size.
> + * @lut: blob containing the LUT
> + * @expected_size: driver expected LUT size
> + *
> + * Returns -EINVAL on mismatch, 0 on match.
> + */
> +int drm_check_lut_size(const struct drm_property_blob *lut,
> +                      uint32_t expected_size)
> +{
> +       if (!lut)
> +               return 0;
> +
> +       return drm_color_lut_size(lut) != expected_size ? -EINVAL : 0;
> +}
> +EXPORT_SYMBOL(drm_check_lut_size);
> +
>  /**
>   * drm_plane_create_color_properties - color encoding related plane properties
>   * @plane: plane object
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> index 1469871d21ff9..0fe4b2359812a 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -1262,23 +1262,6 @@ intel_color_add_affected_planes(struct intel_crtc_state *new_crtc_state)
>         return 0;
>  }
>
> -static int check_lut_size(const struct drm_property_blob *lut, int expected)
> -{
> -       int len;
> -
> -       if (!lut)
> -               return 0;
> -
> -       len = drm_color_lut_size(lut);
> -       if (len != expected) {
> -               DRM_DEBUG_KMS("Invalid LUT size; got %d, expected %d\n",
> -                             len, expected);
> -               return -EINVAL;
> -       }
> -
> -       return 0;
> -}
> -
>  static int test_luts(const struct drm_property_blob *lut, u32 tests)
>  {
>         const struct drm_color_lut *entry;
> @@ -1336,9 +1319,20 @@ static int check_luts(const struct intel_crtc_state *crtc_state)
>         degamma_channels_tests = INTEL_INFO(dev_priv)->color.degamma_lut_tests;
>         gamma_channels_tests = INTEL_INFO(dev_priv)->color.gamma_lut_tests;
>
> -       if (check_lut_size(degamma_lut, degamma_length) ||
> -           check_lut_size(gamma_lut, gamma_length))
> +       if (drm_check_lut_size(degamma_lut, degamma_length)) {
> +               drm_dbg_state(
> +                       &dev_priv->drm,
> +                       "Invalid Degamma LUT size. Expected %u, got %u.\n",
> +                       degamma_length, drm_color_lut_size(degamma_lut));
>                 return -EINVAL;
> +       }
> +
> +       if (drm_check_lut_size(gamma_lut, gamma_length)) {
> +               drm_dbg_state(&dev_priv->drm,
> +                             "Invalid Gamma LUT size. Expected %u, got %u.\n",
> +                             degamma_length, drm_color_lut_size(gamma_lut));
> +               return -EINVAL;
> +       }
>
>         if (test_luts(degamma_lut, degamma_channels_tests) ||
>             test_luts(gamma_lut, gamma_channels_tests))
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
> index 4045e2507e11c..a22d32a7a8719 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -38,6 +38,7 @@ struct drm_atomic_state;
>  struct drm_private_obj;
>  struct drm_private_state;
>
> +int drm_atomic_helper_check_crtcs(struct drm_atomic_state *state);
>  int drm_atomic_helper_check_modeset(struct drm_device *dev,
>                                 struct drm_atomic_state *state);
>  int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> index 3537f3eeb3872..cb2d74719f2d5 100644
> --- a/include/drm/drm_color_mgmt.h
> +++ b/include/drm/drm_color_mgmt.h
> @@ -74,6 +74,9 @@ static inline int drm_color_lut_size(const struct drm_property_blob *blob)
>         return blob->length / sizeof(struct drm_color_lut);
>  }
>
> +int drm_check_lut_size(const struct drm_property_blob *lut,
> +                      uint32_t expected_size);
> +
>  enum drm_color_encoding {
>         DRM_COLOR_YCBCR_BT601,
>         DRM_COLOR_YCBCR_BT709,
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 2deb15d7e1610..4fd1c9a4bbba8 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -1072,6 +1072,17 @@ struct drm_crtc {
>         /** @funcs: CRTC control functions */
>         const struct drm_crtc_funcs *funcs;
>
> +       /**
> +        * @degamma_lut_size: Size of degamma LUT.
> +        */
> +       size_t degamma_lut_size;
> +
> +       /**
> +        * @gamma_lut_size: Size of Gamma LUT. Not used by legacy userspace such as
> +        * X, which doesn't support large lut sizes.
> +        */
> +       size_t gamma_lut_size;
> +

On NVIDIA hardware, multiple LUT sizes are supported. We do this check in e.g.

drivers/gpu/drm/nouveau/dispnv50/base907c.c:base907c_ilut

So I don't think a single sizes at the CRTC level makes sense.

Cheers,

  -ilia

>         /**
>          * @gamma_size: Size of legacy gamma ramp reported to userspace. Set up
>          * by calling drm_mode_crtc_set_gamma_size().
> --
> 2.34.0.rc0.344.g81b53c2807-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
