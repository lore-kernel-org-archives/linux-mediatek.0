Return-Path: <SRS0=6vjs=OW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1900CC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Oct 2021 14:28:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8B0761B1F
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Oct 2021 14:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C8B0761B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJrBRNMWXQkc4vOsy4K2hJoY72YtSy34ayLTSz1PiXc=; b=UUE2QIy92G1Tfq
	9ibSlp0k6zwU/aiYZKS9o9s94daS2RWkz4UnP+0vy3u0KbGIi8VTNI5AQdHDME3OQAnWF2YHPmyuZ
	ZZZbZBx6d5e6UA6bULIeOQpTquzw0e+9xJLWpPW1UXD9EiEzgVMSwYfwEfdG3dA5sn2dM4WqFSrP1
	7JOk0+FmKMnpnKL2ExFaUbjbKwy7EgEeG6R+gOKn+dKzb/PAIT3/Jk6exJ7/dnbNrr8uzH+CuIHEe
	cLinyZCppC6VPiROFjFyg8OOpiwszvuyIqTrFZlFMBge6u4DMpMkaEqnv6eDc+lBBvDX4ObQDxtP7
	LybtIjmlK3OZ8XGeWU6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWg08-002Jf0-UF; Sat, 02 Oct 2021 14:28:32 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWg03-002Jed-OE
 for linux-mediatek@lists.infradead.org; Sat, 02 Oct 2021 14:28:29 +0000
Received: by mail-qt1-x82c.google.com with SMTP id l13so11809385qtv.3
 for <linux-mediatek@lists.infradead.org>; Sat, 02 Oct 2021 07:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wEzqs645xmRwJp4mRemHk76RcaEvYgrjojFh4Zf4bX4=;
 b=HXfkDjyGdfTom0BYeHTu+FgJNf3b9p7yDDiXDTdLpSfZerQw84QoJamSgGiq4gaX8g
 lxGoH0r6eVJaw9E8XTOKwTO0Giqb5zkJf5iikVyYkd0LKuXDzp1+m7D/jicd1pPpLGZx
 B09k85S3XR6qWLW/f4Io1aaqfNHaxawlyGkq74FvA6svIaqlNcqHDllEugswMHduCdfS
 PvCbW+BU6X/G9uWvty+ecdpMffszdEvmLdxCmi5Vijl0K3/UPjQOB08mb9IMAyES3b95
 ckWOvEfYAUssTYaLZR/yQbzf3AHbOEnvOOc/sqmKAWvPvaSUSW/wgODQsCIuXyyrMngB
 l0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wEzqs645xmRwJp4mRemHk76RcaEvYgrjojFh4Zf4bX4=;
 b=G1XiJ0pXHxJ/9k/5Sh49lO4zm3WIktewYZw6t/8KHymDmaUocjJQdAbteVo8YrJneq
 IbX0rv/Dq5lHY3N7Pt3gucDh9vhLmrfEDM0dt7eSFctVMqc/ZjkN6IC0ELA0ISwb6ShN
 bB/4Upa/4AE8bw5o5B3aKgoLeTVV8WthnoLjMdoJmgrTJfxOWx9LU7loks0lagRIpW8N
 OHe4CjliVaoe9855c96Db96YtVnaQ3a1SCJCZUwqJZivHsMTboahUq8/bN7ZE5uarBFC
 YwPmVzvD1AiC/gdvHcMLfoL4i8FshPCWKYYa3o9SK4+mmNH3kR3kdGDfnpZ0Ia8pPJ+i
 uegw==
X-Gm-Message-State: AOAM531OzWKIPywXezYadF7J1Of9QC1HfPrlpdKuhSGgilXpY1FDHDzO
 mdvvTA3MoU+3wSR+mFjodX79sw==
X-Google-Smtp-Source: ABdhPJxuPaeVXo0Ga7lKs/++Uv0MVqMrdVwTt2AYDgj7zqmtyoxkSX3F6FsEQ1KpUXTxP/BrChIYUQ==
X-Received: by 2002:ac8:4e92:: with SMTP id 18mr3780735qtp.323.1633184905392; 
 Sat, 02 Oct 2021 07:28:25 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id u4sm5227228qtq.31.2021.10.02.07.28.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 02 Oct 2021 07:28:24 -0700 (PDT)
Date: Sat, 2 Oct 2021 10:28:23 -0400
From: Sean Paul <sean@poorly.run>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 seanpaul@chromium.org, Rodrigo.Siqueira@amd.com,
 anson.jacob@amd.com, Mark Yacoub <markyacoub@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] drm: Add Gamma and Degamma LUT sizes props to
 drm_crtc to validate.
Message-ID: <20211002142823.GB2515@art_vandelay>
References: <20210929194012.3433306-1-markyacoub@chromium.org>
 <20211001203434.GY2515@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211001203434.GY2515@art_vandelay>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211002_072827_868604_99195A4C 
X-CRM114-Status: GOOD (  43.38  )
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

On Fri, Oct 01, 2021 at 04:34:34PM -0400, Sean Paul wrote:
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
> > +	struct drm_crtc *crtc;
> > +	struct drm_crtc_state *new_crtc_state;
> > +	int i;
> > +
> > +	for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
> 
> no space before (

Ignore this, parsing error on my behalf.

> 
> > +		if (new_crtc_state->gamma_lut) {
> 
> Perhaps gate these with a check of state->color_mgmt_changed first?
> 
> > +			uint64_t supported_lut_size = crtc->gamma_lut_size;
> > +			uint32_t supported_legacy_lut_size = crtc->gamma_size;
> > +			uint32_t new_state_lut_size =
> > +				drm_color_lut_size(new_crtc_state->gamma_lut);
> 
> nit: new_state_lut_size and supported_lut_size can be pulled out to top level scope
> to avoid re-instantiation on each iteration
> 
> > +
> > +			if (new_state_lut_size != supported_lut_size &&
> > +			    new_state_lut_size != supported_legacy_lut_size) {
> 
> According to the docbook, "If drivers support multiple LUT sizes then they
> should publish the largest size, and sub-sample smaller sized LUTs". So
> should this check be > instead of != ?
> 
> > +				DRM_DEBUG_DRIVER(
> 
> drm_dbg_state() is probably more appropriate
> 
> > +					"Invalid Gamma LUT size. Should be %u (or %u for legacy) but got %u.\n",
> > +					supported_lut_size,
> > +					supported_legacy_lut_size,
> > +					new_state_lut_size);
> > +				return -EINVAL;
> > +			}
> > +		}
> > +
> > +		if (new_crtc_state->degamma_lut) {
> > +			uint32_t new_state_lut_size =
> > +				drm_color_lut_size(new_crtc_state->degamma_lut);
> > +			uint64_t supported_lut_size = crtc->degamma_lut_size;
> > +
> > +			if (new_state_lut_size != supported_lut_size) {
> > +				DRM_DEBUG_DRIVER(
> 
> drm_dbg_state()
> 
> > +					"Invalid Degamma LUT size. Should be %u but got %u.\n",
> > +					supported_lut_size, new_state_lut_size);
> > +				return -EINVAL;
> > +			}
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(drm_atomic_helper_check_crtc);
> > +
> >  /**
> >   * drm_atomic_helper_check - validate state object
> >   * @dev: DRM device
> > @@ -975,6 +1027,10 @@ int drm_atomic_helper_check(struct drm_device *dev,
> >  	if (ret)
> >  		return ret;
> >  
> > +	ret = drm_atomic_helper_check_crtc(state);
> > +	if (ret)
> > +		return ret;
> > +
> >  	if (state->legacy_cursor_update)
> >  		state->async_update = !drm_atomic_helper_async_check(dev, state);
> >  
> > diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> > index bb14f488c8f6c..72a1b628e7cdd 100644
> > --- a/drivers/gpu/drm/drm_color_mgmt.c
> > +++ b/drivers/gpu/drm/drm_color_mgmt.c
> > @@ -166,6 +166,7 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
> >  	struct drm_mode_config *config = &dev->mode_config;
> >  
> >  	if (degamma_lut_size) {
> > +		crtc->degamma_lut_size = degamma_lut_size;
> >  		drm_object_attach_property(&crtc->base,
> >  					   config->degamma_lut_property, 0);
> >  		drm_object_attach_property(&crtc->base,
> > @@ -178,6 +179,7 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
> >  					   config->ctm_property, 0);
> >  
> >  	if (gamma_lut_size) {
> > +		crtc->gamma_lut_size = gamma_lut_size;
> >  		drm_object_attach_property(&crtc->base,
> >  					   config->gamma_lut_property, 0);
> >  		drm_object_attach_property(&crtc->base,
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
> >  				struct drm_atomic_state *state);
> >  int drm_atomic_helper_check_plane_state(struct drm_plane_state *plane_state,
> > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> > index 13eeba2a750af..c602be2cafca9 100644
> > --- a/include/drm/drm_crtc.h
> > +++ b/include/drm/drm_crtc.h
> > @@ -1072,6 +1072,17 @@ struct drm_crtc {
> >  	/** @funcs: CRTC control functions */
> >  	const struct drm_crtc_funcs *funcs;
> >  
> > +	/**
> > +	 * @degamma_lut_size: Size of degamma LUT.
> > +	 */
> > +	uint32_t degamma_lut_size;
> > +
> > +	/**
> > +	 * @gamma_lut_size: Size of Gamma LUT. Not used by legacy userspace such as
> > +	 * X, which doesn't support large lut sizes.
> > +	 */
> > +	uint32_t gamma_lut_size;
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

Yeah... so not sure what I was thinking when I wrote this, but my brain decided
to remind me this was wrong last night while I was trying to fall asleep (thanks
for checking in, brain). I still think perhaps the naming could be improved here
to more clearly delineate legacy from current.

Apologies for the churn.

> 
> De-duping this and initializing crtc->gamma_size in the initialization would
> mean the if (crtc->gamma_size) check in drm_crtc_supports_legacy_check() is no
> longer useful (and possibly other similar checks), so some care will need to be
> taken to avoid regression. I think the effort is worthwhile to avoid introducing
> new state.
> 
> 
> 
> >  	/**
> >  	 * @gamma_size: Size of legacy gamma ramp reported to userspace. Set up
> >  	 * by calling drm_mode_crtc_set_gamma_size().
> > -- 
> > 2.33.0.685.g46640cef36-goog
> > 
> 
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS

-- 
Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
