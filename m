Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB7ACF34A2
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 12:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1WWqv8PxjeMLKflSPYmbUe7DeomMcAnSm/A8iMPhzI=; b=45pknwVm1BMb2TH1oVZKER484f
	iHtTHPKbYv8DU8culQq0SfLqVDmjc3kY39NP6C6X/nVSGPsze+B8UJLn/YuyLoI90SZl7OaiekONU
	pUivgFTkPfc9qGSnHW4Y9QQuzWvs9VZtuCtM5kErvu1KCTF3tMP8T6gsq2m1PHcGtux/EaRlN+S98
	2+nibcZqML9o/IT2lZz6CbDUHuV2CqN7Yd15zXlWH79VrkA4aQS5KNzzPphPKPnH9qFe+Yjxqd7up
	r0Z+uww8Kj4kReoyEw2fn1xV6K7mZe9gJ+3SOumpIDJE4liwx3RqQBhUK374sEL5WL7zbH/JBdGcC
	vFeVE9bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swL7A-000000092IE-09W6;
	Thu, 03 Oct 2024 12:39:28 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swL6S-000000092Dj-1Z3k;
	Thu, 03 Oct 2024 12:38:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1429220003;
	Thu,  3 Oct 2024 12:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727959119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G1WWqv8PxjeMLKflSPYmbUe7DeomMcAnSm/A8iMPhzI=;
	b=jaIPWC0Xu79mrXEmZMnQsiXzA9Wr3uoH8MULWQT5IUuNp55G4sX5QevmhszIPLVwNB8KAr
	O3AkPLtQl5yloTMbuyNDdO+X5TRPKMqYEvSTrAQoGgw5IuBAjgFtNYLiG0d10jUZ4bA3FH
	m1e4s8kFAAe17/+QzeW38cun4KUy2aCMbNTrAFDwf/82DfLhx3fqZMuDYE4KWwrNFUQiLe
	EpyU5sN7nS1+Zc1hdPjgaFvbZTVp4v512I9O9Hvnt/yMn7PWEyyffcB8w/4zGq889GcVPI
	rtotQp17FYcj62LrbVAqrFIRzZevDuIvYg4y31zSeUiM6gR48lVIIrxWlvKtpw==
Date: Thu, 3 Oct 2024 14:38:35 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	Liviu Dudau <liviu.dudau@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Inki Dae <inki.dae@samsung.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Sandy Huang <hjc@rock-chips.com>, Jyri Sarha <jyri.sarha@iki.fi>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Zack Rusin <zack.rusin@broadcom.com>, amd-gfx@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] drm: Move crtc->{x, y, mode, enabled} to legacy
 sub-structure
Message-ID: <Zv6QF2EmIcogtlLA@louis-chauvet-laptop>
Mail-Followup-To: Ville Syrjala <ville.syrjala@linux.intel.com>,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	Liviu Dudau <liviu.dudau@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Inki Dae <inki.dae@samsung.com>,
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Sandy Huang <hjc@rock-chips.com>, Jyri Sarha <jyri.sarha@iki.fi>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Zack Rusin <zack.rusin@broadcom.com>, amd-gfx@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
 <20241002182200.15363-3-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241002182200.15363-3-ville.syrjala@linux.intel.com>
X-GND-Sasl: louis.chauvet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_053844_741391_30D8A3D5 
X-CRM114-Status: GOOD (  20.35  )
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

Le 02/10/24 - 21:22, Ville Syrjala a écrit :
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Atomic drivers shouldn't be using the legacy state stored
> directly under drm_crtc. Move that junk into a 'legacy' sub
> structure to highlight the offenders, of which there are
> quite a few unfortunately.

Hi,

Do we need to do something particular in an atomic driver except using
state content?

I proposed some modifications for VKMS bellow. If you think this is good,
I can send a patch to avoid being an offender :-) I just tested it, and it
seems to work.

> I'm hoping we could get all these fixed and then declare
> the legacy state off limits for atomic drivers (which is
> what did long ago for plane->fb/etc). And maybe eventually
> turn crtc->legacy into a pointer and only allocate it on
> legacy drivers.
> 
> TODO: hwmode should probably go there too but it probably
>       needs a closer look, maybe other stuff too...

[...]

> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> index 57a5769fc994..a7f8b1da6e85 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -187,7 +187,7 @@ static void blend(struct vkms_writeback_job *wb,
>  
>  	const struct pixel_argb_u16 background_color = { .a = 0xffff };
>  
> -	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
> +	size_t crtc_y_limit = crtc_state->base.crtc->legacy.mode.vdisplay;

	size_t crtc_y_limit = crtc_state->base.mode.vdisplay;

>  	/*
>  	 * The planes are composed line-by-line to avoid heavy memory usage. It is a necessary
> @@ -270,7 +270,7 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
>  	if (WARN_ON(check_format_funcs(crtc_state, active_wb)))
>  		return -EINVAL;
>  
> -	line_width = crtc_state->base.crtc->mode.hdisplay;
> +	line_width = crtc_state->base.crtc->legacy.mode.hdisplay;

	line_width = crtc_state->base.mode.hdisplay;

>  	stage_buffer.n_pixels = line_width;
>  	output_buffer.n_pixels = line_width;
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> index a40295c18b48..780681ea77e4 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -64,7 +64,7 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
>  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
>  	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
>  
> -	drm_calc_timestamping_constants(crtc, &crtc->mode);
> +	drm_calc_timestamping_constants(crtc, &crtc->legacy.mode);

	drm_calc_timestamping_constants(crtc, &crtc->state->mode);

>  	hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>  	out->vblank_hrtimer.function = &vkms_vblank_simulate;
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> index bc724cbd5e3a..27164cddb94d 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -131,8 +131,8 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
>  	struct drm_connector_state *conn_state = wb_conn->base.state;
>  	struct vkms_crtc_state *crtc_state = output->composer_state;
>  	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
> -	u16 crtc_height = crtc_state->base.crtc->mode.vdisplay;
> -	u16 crtc_width = crtc_state->base.crtc->mode.hdisplay;
> +	u16 crtc_height = crtc_state->base.crtc->legacy.mode.vdisplay;
> +	u16 crtc_width = crtc_state->base.crtc->legacy.mode.hdisplay;

	u16 crtc_height = crtc_state->base.mode.vdisplay;
	u16 crtc_width = crtc_state->base.mode.hdisplay;

>  	struct vkms_writeback_job *active_wb;
>  	struct vkms_frame_info *wb_frame_info;
>  	u32 wb_format = fb->format->format;

[...]

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

