Return-Path: <SRS0=kfxU=PO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4786EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 01:26:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06ED061039
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Oct 2021 01:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06ED061039
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L2aoX3shWJeepvTbvIopOnGuJOBgF6dZI+1e1zgxQgM=; b=FdrVb4bd1mIKKJ
	Q6PF92PRSM6QDcGUjuWzMwMKy2gdYnmtvwiTcnjddXproDbEF9VZpzmY+78YBM6MEDPK1/LZFzWO6
	AhQTjWLrHG5hQ3UkBssV7RkZ1hjscQ6dESQTdZQ3zs+/In10EL7nLvt57CneEZarcTsLZ+T9Z1JUN
	zZErHv6c1cSz+bHr6i6jX63bXNGoFxGsNMGHi0hUza1ewmnLeQnYFWj20sVqpNqSzWGjkJgJ/lool
	fwuU1gQ7mV41LR3Pv3PCcBAkn8IhTo2Sgg8YgAAF6oLwWt9+dDzTP6XWxG8A4yK9blGEeSh2+7bXa
	MAU4xbrsu7trP27OTwLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfBEY-000Qj3-A3; Tue, 26 Oct 2021 01:26:34 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfBEV-000QiG-Jx
 for linux-mediatek@lists.infradead.org; Tue, 26 Oct 2021 01:26:33 +0000
Received: by mail-qv1-xf30.google.com with SMTP id d6so8472496qvb.3
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Oct 2021 18:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Nn1Wjss0vzcfTJGi8NzfPBJCUt6mL+HkqTVX3naL7nA=;
 b=AW6QQyGIg7oeZuK2YFdEuKdHSmq5Zec9kyquvOaDnlQh4ozzRrQhWG2BruLAGIxgzA
 IwOC5g2YYUY4oRpC/E42MEyWEje+h+wxZlV5ocXo+X8oxJWmUiVpAkgW4Ic0z4bD3GFA
 UFQRooGiJ8CgVhpmP2mAUGY+ydYdJS6JyHQqYvRvHXv2INi1PRMjh5jRPPWBB5LA4gRg
 9/LtNKWRPo5Zab078TwTJV2kFJC+aZkdmyRKbkIf2F/YIg6G64fNzPVmJ8YEW0nLn8Ha
 jJvCZeeJOKBclUIQ+ieh3W8hmI4sIj2Cs+aAfUmgrt9YKnZtrkdQV2Xq02Fb+FQ23SRC
 frSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Nn1Wjss0vzcfTJGi8NzfPBJCUt6mL+HkqTVX3naL7nA=;
 b=WSGkF13F/0H+Wt7CDHuOhb9I3+LgzSLrpggl88YoaVMRqzQSDlfuQ7SEoR6gljg21O
 29vAS2tX+3HaVHf0ixbXeWF2BO10GFwDeVLxoYTmvPgw9uEZPAKxij6uW6pxeVpCxONq
 /5zwMJ3GPQwAloBTX0Zi9/u3hY/j/P9hl9QYhfRV9wDm8NbFNcp8L52kIhuU+Kf5CJqI
 U4+JflDa/M856aKIvgLrMFwlg2pCulAVfj/VLmz3CPT6zcdO6PSX1ttLjWJo3xICy6x6
 74Y3cyjAkSkQAtD1wi76FSwuaiSMeM1BK8fJhuMB3qTJcXxFGnLsl7Twx+L6A9PFFw3e
 dHHw==
X-Gm-Message-State: AOAM531tGNod9s1SwQahzf+a6YVBDf5gme2mwUrVVWpCz69/rVpqwjKb
 n53Qxtu/ozfqw7dU7kJ0MRb+bw==
X-Google-Smtp-Source: ABdhPJwjaQAko9nwFzR7dxkL767qpA3clHeIGQvxiPM3bYgvcFM2WG9y9hOEgchctOJT6NO0zgxEow==
X-Received: by 2002:a05:6214:2aae:: with SMTP id
 js14mr5248017qvb.27.1635211590371; 
 Mon, 25 Oct 2021 18:26:30 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id g19sm10257019qtg.78.2021.10.25.18.26.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 Oct 2021 18:26:29 -0700 (PDT)
Date: Mon, 25 Oct 2021 21:26:28 -0400
From: Sean Paul <sean@poorly.run>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 harry.wentland@amd.com, Mark Yacoub <markyacoub@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [Intel-gfx] [PATCH 1/2] drm: Add Gamma and Degamma LUT sizes
 props to drm_crtc to validate.
Message-ID: <20211026012628.GG2515@art_vandelay>
References: <20210929194012.3433306-1-markyacoub@chromium.org>
 <20211013181228.1578201-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013181228.1578201-1-markyacoub@chromium.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_182631_696337_22D41734 
X-CRM114-Status: GOOD (  40.17  )
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

On Wed, Oct 13, 2021 at 02:12:20PM -0400, Mark Yacoub wrote:
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
> 3. Rename older lut checks that test for the color channels to indicate
> it's a channel check. It's not included in drm_atomic_helper_check_crtc
> as it's hardware specific and is to be called by the driver.
> 4. As the LUT size check now happens in drm_atomic_helper_check, remove
> the lut check in intel_color.c

I'd probably split the rename out from the crtc check since they're only
tangentially related.

> 
> Fixes: igt@kms_color@pipe-A-invalid-gamma-lut-sizes on MTK
> Tested on Zork(amdgpu) and Jacuzzi(mediatek), volteer(TGL)
> 
> v1:
> 1. Fix typos
> 2. Remove the LUT size check from intel driver
> 3. Rename old LUT check to indicate it's a channel change
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c        | 60 ++++++++++++++++++++++
>  drivers/gpu/drm/drm_color_mgmt.c           | 14 ++---
>  drivers/gpu/drm/i915/display/intel_color.c | 14 ++---
>  include/drm/drm_atomic_helper.h            |  1 +
>  include/drm/drm_color_mgmt.h               |  7 +--
>  include/drm/drm_crtc.h                     | 11 ++++
>  6 files changed, 89 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index bc3487964fb5e..5feb2ad0209c3 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -929,6 +929,62 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
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
> +			uint64_t supported_lut_size = crtc->gamma_lut_size;
> +			uint32_t supported_legacy_lut_size = crtc->gamma_size;
> +			uint32_t new_state_lut_size =
> +				drm_color_lut_size(new_crtc_state->gamma_lut);
> +
> +			if (new_state_lut_size != supported_lut_size &&
> +			    new_state_lut_size != supported_legacy_lut_size) {
> +				drm_dbg_state(
> +					state->dev,
> +					"Invalid Gamma LUT size. Should be %u (or %u for legacy) but got %u.\n",
> +					supported_lut_size,
> +					supported_legacy_lut_size,
> +					new_state_lut_size);
> +				return -EINVAL;
> +			}
> +		}
> +
> +		if (new_crtc_state->color_mgmt_changed &&
> +		    new_crtc_state->degamma_lut) {
> +			uint32_t new_state_lut_size =
> +				drm_color_lut_size(new_crtc_state->degamma_lut);
> +			uint64_t supported_lut_size = crtc->degamma_lut_size;
> +
> +			if (new_state_lut_size != supported_lut_size) {
> +				drm_dbg_state(
> +					state->dev,
> +					"Invalid Degamma LUT size. Should be %u but got %u.\n",
> +					supported_lut_size, new_state_lut_size);
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
> @@ -974,6 +1030,10 @@ int drm_atomic_helper_check(struct drm_device *dev,
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
> index bb14f488c8f6c..e5b820ce823bf 100644
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
> @@ -585,17 +587,17 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
>  EXPORT_SYMBOL(drm_plane_create_color_properties);
>  
>  /**
> - * drm_color_lut_check - check validity of lookup table
> + * drm_color_lut_channels_check - check validity of the channels in the lookup table
>   * @lut: property blob containing LUT to check
>   * @tests: bitmask of tests to run
>   *
> - * Helper to check whether a userspace-provided lookup table is valid and
> - * satisfies hardware requirements.  Drivers pass a bitmask indicating which of
> - * the tests in &drm_color_lut_tests should be performed.
> + * Helper to check whether each color channel of userspace-provided lookup table is valid and
> + * satisfies hardware requirements. Drivers pass a bitmask indicating which of in 
> + * &drm_color_lut_channels_tests should be performed.
>   *
>   * Returns 0 on success, -EINVAL on failure.
>   */
> -int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
> +int drm_color_lut_channels_check(const struct drm_property_blob *lut, u32 tests)
>  {
>  	const struct drm_color_lut *entry;
>  	int i;
> @@ -625,4 +627,4 @@ int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests)
>  
>  	return 0;
>  }
> -EXPORT_SYMBOL(drm_color_lut_check);
> +EXPORT_SYMBOL(drm_color_lut_channels_check);
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> index dab892d2251ba..a308fe52746ac 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -1285,7 +1285,7 @@ static int check_luts(const struct intel_crtc_state *crtc_state)
>  	const struct drm_property_blob *gamma_lut = crtc_state->hw.gamma_lut;
>  	const struct drm_property_blob *degamma_lut = crtc_state->hw.degamma_lut;
>  	int gamma_length, degamma_length;
> -	u32 gamma_tests, degamma_tests;
> +	u32 gamma_channels_tests, degamma_channels_tests;
>  
>  	/* Always allow legacy gamma LUT with no further checking. */
>  	if (crtc_state_is_legacy_gamma(crtc_state))
> @@ -1300,15 +1300,11 @@ static int check_luts(const struct intel_crtc_state *crtc_state)
>  
>  	degamma_length = INTEL_INFO(dev_priv)->color.degamma_lut_size;
>  	gamma_length = INTEL_INFO(dev_priv)->color.gamma_lut_size;
> -	degamma_tests = INTEL_INFO(dev_priv)->color.degamma_lut_tests;
> -	gamma_tests = INTEL_INFO(dev_priv)->color.gamma_lut_tests;
> +	degamma_channels_tests = INTEL_INFO(dev_priv)->color.degamma_lut_tests;
> +	gamma_channels_tests = INTEL_INFO(dev_priv)->color.gamma_lut_tests;
>  
> -	if (check_lut_size(degamma_lut, degamma_length) ||
> -	    check_lut_size(gamma_lut, gamma_length))
> -		return -EINVAL;

Can you remove check_lut_size() now?

> -
> -	if (drm_color_lut_check(degamma_lut, degamma_tests) ||
> -	    drm_color_lut_check(gamma_lut, gamma_tests))
> +	if (drm_color_lut_channels_check(degamma_lut, degamma_channels_tests) ||
> +	    drm_color_lut_channels_check(gamma_lut, gamma_channels_tests))
>  		return -EINVAL;
>  
>  	return 0;
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
> index 81c298488b0c8..cb1bf361ad3e3 100644
> --- a/include/drm/drm_color_mgmt.h
> +++ b/include/drm/drm_color_mgmt.h
> @@ -94,12 +94,12 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
>  				      enum drm_color_range default_range);
>  
>  /**
> - * enum drm_color_lut_tests - hw-specific LUT tests to perform
> + * enum drm_color_lut_channels_tests - hw-specific LUT tests to perform
>   *
>   * The drm_color_lut_check() function takes a bitmask of the values here to
>   * determine which tests to apply to a userspace-provided LUT.
>   */
> -enum drm_color_lut_tests {
> +enum drm_color_lut_channels_tests {
>  	/**
>  	 * @DRM_COLOR_LUT_EQUAL_CHANNELS:
>  	 *
> @@ -119,5 +119,6 @@ enum drm_color_lut_tests {
>  	DRM_COLOR_LUT_NON_DECREASING = BIT(1),
>  };
>  
> -int drm_color_lut_check(const struct drm_property_blob *lut, u32 tests);
> +int drm_color_lut_channels_check(const struct drm_property_blob *lut,
> +				 u32 tests);
>  #endif
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
> 2.33.0.882.g93a45727a2-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
