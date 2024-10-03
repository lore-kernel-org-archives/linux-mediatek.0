Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A0CCF34AD
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 13:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/jI97Cj5PQ+yO0FNRtcIM7xf6Gzju54P4B43zQy4hU=; b=29UE3XLxX8b0FTcUOVP5kmDPvw
	JxxeQOL00/oHe+XFYttSY9+BtyIDSZxKipVkXUnQAFgwsiIY/FsL3AfejOj8+SLeuJr1iJf61K8Zt
	53M4+ENt+oKfFz5PCL5/vzEyVvONNbNA3bB5M7gCmBCftPfJCwUsm4RqQNqq+2xUTvq6nTzxLCYsb
	Wr3WIqaWfKi/R9oyNMwMXeDOI9fIrzq0hL7H4Q4P+MFMk7lHWAV1BYi9BfBNPmt+tcPwxKwYQygAZ
	gptQJk3wo5m7lcIU4Q+QGo+pioVslB9NshXSQ7u3wocGby/5wAbMfapEDytf8/AmTxM78K2HFg95v
	Vc/FavGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swMAW-00000009GA7-3JeG;
	Thu, 03 Oct 2024 13:47:00 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swMAT-00000009G8y-1Zi4;
	Thu, 03 Oct 2024 13:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727963218; x=1759499218;
  h=date:from:to:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=n5OHn3QUdpat2aC/O/iKVjfoE6iGTaPoN/6J8frtUYg=;
  b=PFx87JVcHbtBMugsLlnwhy6Mom+9wzwxr5npoFNCvmgZ/kvM0Dg/H1N5
   QWmCSHAmk91E6XD6rSlzkmNSYHqxZYjCVKZJMeaxiKuIwd9vhZ/MORgkQ
   noU0kmVc2b5QRkRO+YpnulQUK8wCdSmTwnKmdTbAAgingPhB/w97I8Fma
   v81GEpE7m5U62jYfrO+7TWZIoo1VCH8e0UezF9jU5/m2dc6FRz9S82QWk
   bK47RGrsu//u8hEAMln7ZNigU+N9GhSBWDOMGkGxmflHMAKFWiVWImF97
   6km10fRqmOwxPIHgngUxLxgTzcIEmscjYXh7EJBmlzWXvrOA4SdO68182
   A==;
X-CSE-ConnectionGUID: MQ6LMKGETeaGcw98H+l1hA==
X-CSE-MsgGUID: QHB9TdZ6QOWjycDWabg17Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27286662"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="27286662"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 06:46:56 -0700
X-CSE-ConnectionGUID: H7+f/vSCTa27grfFf3KfqQ==
X-CSE-MsgGUID: dSiUo7Y0SbyaiImM3Q2NMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74451391"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 06:46:50 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 03 Oct 2024 16:46:48 +0300
Date: Thu, 3 Oct 2024 16:46:48 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
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
Message-ID: <Zv6gSGMXZZARf3oV@intel.com>
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
 <20241002182200.15363-3-ville.syrjala@linux.intel.com>
 <Zv6QF2EmIcogtlLA@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zv6QF2EmIcogtlLA@louis-chauvet-laptop>
X-Patchwork-Hint: comment
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_064657_919898_DE4555D1 
X-CRM114-Status: GOOD (  27.01  )
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

On Thu, Oct 03, 2024 at 02:38:35PM +0200, Louis Chauvet wrote:
> Le 02/10/24 - 21:22, Ville Syrjala a écrit :
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > Atomic drivers shouldn't be using the legacy state stored
> > directly under drm_crtc. Move that junk into a 'legacy' sub
> > structure to highlight the offenders, of which there are
> > quite a few unfortunately.
> 
> Hi,
> 
> Do we need to do something particular in an atomic driver except using
> state content?
> 
> I proposed some modifications for VKMS bellow. If you think this is good,
> I can send a patch to avoid being an offender :-) I just tested it, and it
> seems to work.
> 
> > I'm hoping we could get all these fixed and then declare
> > the legacy state off limits for atomic drivers (which is
> > what did long ago for plane->fb/etc). And maybe eventually
> > turn crtc->legacy into a pointer and only allocate it on
> > legacy drivers.
> > 
> > TODO: hwmode should probably go there too but it probably
> >       needs a closer look, maybe other stuff too...
> 
> [...]
> 
> > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
> > index 57a5769fc994..a7f8b1da6e85 100644
> > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > @@ -187,7 +187,7 @@ static void blend(struct vkms_writeback_job *wb,
> >  
> >  	const struct pixel_argb_u16 background_color = { .a = 0xffff };
> >  
> > -	size_t crtc_y_limit = crtc_state->base.crtc->mode.vdisplay;
> > +	size_t crtc_y_limit = crtc_state->base.crtc->legacy.mode.vdisplay;
> 
> 	size_t crtc_y_limit = crtc_state->base.mode.vdisplay;
> 
> >  	/*
> >  	 * The planes are composed line-by-line to avoid heavy memory usage. It is a necessary
> > @@ -270,7 +270,7 @@ static int compose_active_planes(struct vkms_writeback_job *active_wb,
> >  	if (WARN_ON(check_format_funcs(crtc_state, active_wb)))
> >  		return -EINVAL;
> >  
> > -	line_width = crtc_state->base.crtc->mode.hdisplay;
> > +	line_width = crtc_state->base.crtc->legacy.mode.hdisplay;
> 
> 	line_width = crtc_state->base.mode.hdisplay;
> 
> >  	stage_buffer.n_pixels = line_width;
> >  	output_buffer.n_pixels = line_width;
> >  
> > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > index a40295c18b48..780681ea77e4 100644
> > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > @@ -64,7 +64,7 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
> >  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> >  	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> >  
> > -	drm_calc_timestamping_constants(crtc, &crtc->mode);
> > +	drm_calc_timestamping_constants(crtc, &crtc->legacy.mode);
> 
> 	drm_calc_timestamping_constants(crtc, &crtc->state->mode);

This one doesn't look safe. You want to call that during your atomic
commit already.

The rest look reasonable.

> 
> >  	hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
> >  	out->vblank_hrtimer.function = &vkms_vblank_simulate;
> > diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
> > index bc724cbd5e3a..27164cddb94d 100644
> > --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> > +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> > @@ -131,8 +131,8 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
> >  	struct drm_connector_state *conn_state = wb_conn->base.state;
> >  	struct vkms_crtc_state *crtc_state = output->composer_state;
> >  	struct drm_framebuffer *fb = connector_state->writeback_job->fb;
> > -	u16 crtc_height = crtc_state->base.crtc->mode.vdisplay;
> > -	u16 crtc_width = crtc_state->base.crtc->mode.hdisplay;
> > +	u16 crtc_height = crtc_state->base.crtc->legacy.mode.vdisplay;
> > +	u16 crtc_width = crtc_state->base.crtc->legacy.mode.hdisplay;
> 
> 	u16 crtc_height = crtc_state->base.mode.vdisplay;
> 	u16 crtc_width = crtc_state->base.mode.hdisplay;
> 
> >  	struct vkms_writeback_job *active_wb;
> >  	struct vkms_frame_info *wb_frame_info;
> >  	u32 wb_format = fb->format->format;
> 
> [...]
> 
> -- 
> Louis Chauvet, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Ville Syrjälä
Intel

