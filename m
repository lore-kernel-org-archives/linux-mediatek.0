Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A228C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 01:18:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30DB460FF2
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 01:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30DB460FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uLB3wJOYeBuVpQD18/hjnw9sQaOMsYQAevVOcVf1s+k=; b=NfSuluSJ6iCygc
	EJXPO/Eb+f/5lTjxcRK3DtYTT99S8roJWt2ExfmkoZnyx69xTMVcd9HT0n9XvRf4D+smhgxknzkq+
	+/jDM2yOmclmjmhpv+TwvkfOgvVErtoSIr9rSaxDBxLKgtojlgc7RuTmkoONFgGHthq7R3P1wUb5q
	K8CIo6sWuzgxy+Z9kA6FTvzEpgAk/58aK0ZvRPnT1FDPFORSJ/jCR09A7iW8/YviEsVWTkPOBIchX
	6uwz8sQin45LfU00M6YfrZKNg2QDIi30UWaC5XOyVDTOFFtnQuZaAbGyt/pKT9+ODFw1v8AR7InSg
	y0Id0ObJOj4Bt1qO+d5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgGXT-009Sbv-FD; Fri, 29 Oct 2021 01:18:35 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgGXP-009San-HK
 for linux-mediatek@lists.infradead.org; Fri, 29 Oct 2021 01:18:33 +0000
Received: by mail-qt1-x835.google.com with SMTP id w8so7661684qts.4
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Oct 2021 18:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mu/6E1Gb4IJRb+WeEyiPtjUmXE4aloGGeWjE9ddkbas=;
 b=Cs/j1OmUp7xDwjhlwi6DW7TNNHLL+GBpjCWNNe5A1SsuFnQTLZg024ZnPqlh+UcTKF
 id5SJaK5rWz4XhnuhwLcAwAyVIt1P/n/t/SzdiVwcnj1cT8LYtQINSIYOIVr9yX6B0M5
 OHAdz511eX2UXvuG+hy8gAm+jWJ/8bsud0x6/QYxf9S1dY59gjbWU5N6fBVvqWUjlyVq
 yLALTzXGxoCUINnPkVHn+Gi0Md4nDBTsKwTkN8Ft59j93eTpebGQtIOZGw+UFRHUWR0j
 RUUrFGvzWgNOiGcmWlEwzRVqpiPCGUu+w065lmtOUEaVzVfHQzvmu5niyfKChI3+/QY7
 O5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mu/6E1Gb4IJRb+WeEyiPtjUmXE4aloGGeWjE9ddkbas=;
 b=WGTruH1YiPWbbnX5RWFRKHKT+z2QhX6aqdk+jKtVdnJVelIbP2Ll4lwp6P00jlFNXw
 pEF+5GOj3mwSTSAuiWYeu7cJZ1J9TCYn0vr5q5pE90nvBeSeufGq8JQVa+JKXVhbnzXJ
 +I42LoXkeSSPVSiB1IiBjNBUAU6iP/EAW01h3hL6RabSuv+OUPxFGnHFEAKkooMpepvU
 Z/zGXFtgWA19KvPfi5oW9izZ5Kum6OiLLKaEfzv22dl/9i8Vi/O0eC8v+Cu2XkRMf2yG
 YDnyx4+lAQEiEGw2dDgYNbuwDLLux2A6vXEjLf5COyp36szAlREHPSovCPpjIQ9Yq0vh
 UCjQ==
X-Gm-Message-State: AOAM532vjjw7VJjEd9eHR/tU1sfeIEvOcCdqupp/EJ9E0phtnGH6anlu
 CWuIIAV28mId/y6ZAIbRxGSgjA==
X-Google-Smtp-Source: ABdhPJzv7Nuh1RaA1Zwicn6X81TwzX4pOlziV0+J+/ypmpJsE0STMlP368k4x2E6QiEbpvO1JbFanA==
X-Received: by 2002:ac8:7dcb:: with SMTP id c11mr8534774qte.12.1635470309774; 
 Thu, 28 Oct 2021 18:18:29 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id d9sm3236453qtd.76.2021.10.28.18.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 18:18:29 -0700 (PDT)
Date: Thu, 28 Oct 2021 21:18:27 -0400
From: Sean Paul <sean@poorly.run>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: seanpaul@chromium.org, pmenzel@molgen.mpg.de,
 Mark Yacoub <markyacoub@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [Intel-gfx] [PATCH v3 2/3] drm: Add Gamma and Degamma LUT sizes
 props to drm_crtc to validate.
Message-ID: <20211029011827.GB10475@art_vandelay>
References: <20211026192104.1860504-1-markyacoub@chromium.org>
 <20211026192104.1860504-2-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211026192104.1860504-2-markyacoub@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_181831_619775_5F669409 
X-CRM114-Status: GOOD (  38.34  )
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

On Tue, Oct 26, 2021 at 03:21:01PM -0400, Mark Yacoub wrote:
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
> Tested on Zork(amdgpu) and Jacuzzi(mediatek), volteer(TGL)
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
>  drivers/gpu/drm/drm_atomic_helper.c        | 56 ++++++++++++++++++++++
>  drivers/gpu/drm/drm_color_mgmt.c           |  2 +
>  drivers/gpu/drm/i915/display/intel_color.c | 39 ++++++++-------
>  include/drm/drm_atomic_helper.h            |  1 +
>  include/drm/drm_color_mgmt.h               | 13 +++++
>  include/drm/drm_crtc.h                     | 11 +++++
>  6 files changed, 102 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index bc3487964fb5e..c565b3516cce9 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -929,6 +929,58 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
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
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *new_crtc_state;
> +	int i;
> +
> +	for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
> +		if (new_crtc_state->color_mgmt_changed &&
> +		    new_crtc_state->gamma_lut) {
> +			if (drm_check_lut_size(new_crtc_state->gamma_lut,
> +					       crtc->gamma_lut_size) ||
> +			    drm_check_lut_size(new_crtc_state->gamma_lut,
> +					       crtc->gamma_size)) {

I think you could save a level of indentation by re-organizing the conditionals:

                if (!new_crtc_state->color_mgmt_changed)
                        continue;

                if (drm_check_lut_size(new_crtc_state->gamma_lut,
                                        crtc->gamma_lut_size) ||
                     drm_check_lut_size(new_crtc_state->gamma_lut,
                                        crtc->gamma_size)) {
                        drm_dbg_state(...);
                        return -EINVAL;
                }

                if (drm_check_lut_size(new_crtc_state->degamma_lut,
                                       crtc->degamma_lut_size)) {
                        drm_dbg_state(...);
                        return -EINVAL;
                }

> +				drm_dbg_state(
> +					state->dev,
> +					"Invalid Gamma LUT size. Should be %u (or %u for legacy) but got %u.\n",

With the indent lower, you could also make this message a bit more terse to
fit in 80 chars:

"Invalid gamma lut size. Expected %u/%u, got %u\n"
                      

> +					crtc->gamma_lut_size, crtc->gamma_size,
> +					drm_color_lut_size(
> +						new_crtc_state->gamma_lut));
> +				return -EINVAL;
> +			}
> +		}
> +
> +		if (new_crtc_state->color_mgmt_changed &&
> +		    new_crtc_state->degamma_lut) {
> +			if (drm_check_lut_size(new_crtc_state->degamma_lut,
> +					       crtc->degamma_lut_size)) {
> +				drm_dbg_state(
> +					state->dev,
> +					"Invalid DeGamma LUT size. Should be %u but got %u.\n",
> +					crtc->degamma_lut_size,
> +					drm_color_lut_size(
> +						new_crtc_state->degamma_lut));
> +				return -EINVAL;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_atomic_helper_check_crtcs);
> +
>  /**
>   * drm_atomic_helper_check - validate state object
>   * @dev: DRM device
> @@ -974,6 +1026,10 @@ int drm_atomic_helper_check(struct drm_device *dev,
>  	if (ret)
>  		return ret;
>  
> +	ret = drm_atomic_helper_check_crtcs(state);
> +	if (ret)
> +		return ret;
> +
>  	if (state->legacy_cursor_update)
>  		state->async_update = !drm_atomic_helper_async_check(dev, state);
>  
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index 6f4e04746d90f..6bb59645a75bc 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -166,6 +166,7 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
>  	struct drm_mode_config *config = &dev->mode_config;
>  
>  	if (degamma_lut_size) {
> +		crtc->degamma_lut_size = degamma_lut_size;
>  		drm_object_attach_property(&crtc->base,
>  					   config->degamma_lut_property, 0);
>  		drm_object_attach_property(&crtc->base,
> @@ -178,6 +179,7 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
>  					   config->ctm_property, 0);
>  
>  	if (gamma_lut_size) {
> +		crtc->gamma_lut_size = gamma_lut_size;
>  		drm_object_attach_property(&crtc->base,
>  					   config->gamma_lut_property, 0);
>  		drm_object_attach_property(&crtc->base,
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> index 4bb1bc76c4de9..888886d2936f8 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -1262,23 +1262,6 @@ intel_color_add_affected_planes(struct intel_crtc_state *new_crtc_state)
>  	return 0;
>  }
>  
> -static int check_lut_size(const struct drm_property_blob *lut, int expected)
> -{
> -	int len;
> -
> -	if (!lut)
> -		return 0;
> -
> -	len = drm_color_lut_size(lut);
> -	if (len != expected) {
> -		DRM_DEBUG_KMS("Invalid LUT size; got %d, expected %d\n",
> -			      len, expected);
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
>  static int check_luts(const struct intel_crtc_state *crtc_state)
>  {
>  	struct drm_i915_private *dev_priv = to_i915(crtc_state->uapi.crtc->dev);
> @@ -1303,9 +1286,25 @@ static int check_luts(const struct intel_crtc_state *crtc_state)
>  	degamma_channels_tests = INTEL_INFO(dev_priv)->color.degamma_lut_tests;
>  	gamma_channels_tests = INTEL_INFO(dev_priv)->color.gamma_lut_tests;
>  
> -	if (check_lut_size(degamma_lut, degamma_length) ||
> -	    check_lut_size(gamma_lut, gamma_length))
> -		return -EINVAL;
> +	if (degamma_lut) {
> +		if (drm_check_lut_size(degamma_lut, degamma_length)) {
> +			drm_dbg_state(
> +				&dev_priv->drm,
> +				"Invalid DeGamma LUT size. Should be %u but got %u.\n",
> +				degamma_length,
> +				drm_color_lut_size(degamma_lut));
> +			return -EINVAL;
> +		}
> +	}
> +	if (gamma_lut) {
> +		if (drm_check_lut_size(gamma_lut, degamma_length)) {
> +			drm_dbg_state(
> +				&dev_priv->drm,
> +				"Invalid Gamma LUT size. Should be %u but got %u.\n",
> +				degamma_length, drm_color_lut_size(gamma_lut));
> +			return -EINVAL;
> +		}
> +	}
>  
>  	if (drm_color_lut_channels_check(degamma_lut, degamma_channels_tests) ||
>  	    drm_color_lut_channels_check(gamma_lut, gamma_channels_tests))
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
>  				struct drm_atomic_state *state);
>  int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
> index cb1bf361ad3e3..c214812d1b7a5 100644
> --- a/include/drm/drm_color_mgmt.h
> +++ b/include/drm/drm_color_mgmt.h
> @@ -74,6 +74,19 @@ static inline int drm_color_lut_size(const struct drm_property_blob *blob)
>  	return blob->length / sizeof(struct drm_color_lut);
>  }
>  
> +/**
> + * drm_check_lut_size - Checks if LUT size matches the driver expected size.
> + * @lut: blob containing the LUT
> + * @expected_size: driver expected LUT size
> + *
> + * Returns -EINVAL on mismatch, 0 on match.
> + */
> +static inline int drm_check_lut_size(const struct drm_property_blob *lut,
> +				     uint64_t expected_size)
> +{

If you add back in the check for !lut which existed in the intel version, you
can remove all the NULL checks which precede this call above and this function
will be less of a toy.

I'd probably just lift the intel function into drm_color_mgmt.c with the
improved docbook and export it.

> +	return drm_color_lut_size(lut) != expected_size ? -EINVAL : 0;
> +}
> +
>  enum drm_color_encoding {
>  	DRM_COLOR_YCBCR_BT601,
>  	DRM_COLOR_YCBCR_BT709,
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 2deb15d7e1610..cabd3ef1a6e32 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -1072,6 +1072,17 @@ struct drm_crtc {
>  	/** @funcs: CRTC control functions */
>  	const struct drm_crtc_funcs *funcs;
>  
> +	/**
> +	 * @degamma_lut_size: Size of degamma LUT.
> +	 */
> +	uint32_t degamma_lut_size;
> +
> +	/**
> +	 * @gamma_lut_size: Size of Gamma LUT. Not used by legacy userspace such as
> +	 * X, which doesn't support large lut sizes.
> +	 */
> +	uint32_t gamma_lut_size;
> +
>  	/**
>  	 * @gamma_size: Size of legacy gamma ramp reported to userspace. Set up
>  	 * by calling drm_mode_crtc_set_gamma_size().
> -- 
> 2.33.0.1079.g6e70778dc9-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
