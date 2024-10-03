Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A422CF34B0
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 15:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZElLwQ5mHYReOaSmSvT7278JqqhnnyULQk+/1+1kJk=; b=vo0Ycun1MLIAfZzLcBoVarLlsY
	ajPLKdOazOgCN4lZeO1Iu0N9kj+mIzXY2BtS2xaazGVqjaQl8Up4u/4yO0gGkG4pKCeQFoFlJyJyP
	04/CnB5MKg8LLQlbPK+dfvWthsqbFzay27wu5FMEZihftuDRo2kVAecC0dsGoTwYzV2UE0nHxmky3
	gU7Fhld31pkHny86SWX6uddsplSdY30GZNIgG5AdoWsHbGN1H+YmOdjugzPmmTbnyQwXImGf/vqtC
	bB4L8PIuhH8nHqUmteeJooIvwbj8gwY4vphcdmDQmwWwzaYzazIyX4gDM1vax6HSskpCJvAbCjgac
	nuGUAz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swNQu-00000009WH5-0GDJ;
	Thu, 03 Oct 2024 15:08:00 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swNQf-00000009WCv-1N9n;
	Thu, 03 Oct 2024 15:07:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11E6024000C;
	Thu,  3 Oct 2024 15:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727968061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YZElLwQ5mHYReOaSmSvT7278JqqhnnyULQk+/1+1kJk=;
	b=YEH2YnPwiMskls9hd/gfzbIgYfC1qkcLesGnJNkrsmHEe3zu8VFZWm6BdgmnrnZ2Qgf6Mu
	rl3svRb/4mCMycfcmpARRBvji7+Ry/w2vzIC3T393ERmy9UbpVYnNhM87rfFxR4CxUfMDQ
	ksrKmVA99rcw5b1jA2ZNxjOLpTc24XkDfONA9tFeR45nmPl6UkQuJxTG6VYt19wt2k0OWd
	ly5GPToqHmZiL+uWVlGQozyWeIO9rxeLv5puwAjVLmo/Jys8TaMxMe0xWkBxg30yo2dr0e
	+qHYoE0Ir3I/BslTW53FebEDYX6GCccBs1oOkCfEqWwDeCFPtxDgi2SkeFavmA==
Date: Thu, 3 Oct 2024 17:07:35 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
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
Message-ID: <Zv6zN7Go_XG44P2-@louis-chauvet-laptop>
Mail-Followup-To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
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
 <Zv6QF2EmIcogtlLA@louis-chauvet-laptop>
 <Zv6gSGMXZZARf3oV@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zv6gSGMXZZARf3oV@intel.com>
X-GND-Sasl: louis.chauvet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_080746_182046_DC47F349 
X-CRM114-Status: GOOD (  11.18  )
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


> > > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > index a40295c18b48..780681ea77e4 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > @@ -64,7 +64,7 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
> > >  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> > >  	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> > >  
> > > -	drm_calc_timestamping_constants(crtc, &crtc->mode);
> > > +	drm_calc_timestamping_constants(crtc, &crtc->legacy.mode);
> > 
> > 	drm_calc_timestamping_constants(crtc, &crtc->state->mode);
> 
> This one doesn't look safe. You want to call that during your atomic
> commit already.
> 

This was already not safe with the previous implementation? Or it is only 
unsafe because now I use state->mode instead of legacy.mode?

After inspecting the code, I think I don't need to call it as:

In `vkms_atomic_commit_tail` (used in 
`@vkms_mode_config_helpers.atomic_commit_tail`), we call 
`drm_atomic_helper_commit_modeset_disables`, which call 
`drm_atomic_helper_calc_timestamping_constants` which call 
`drm_calc_timestamping_constants` for every CRTC.

I tested kms_vblank, all of them are SUCCESS/SKIP, do you know other tests 
that can trigger bugs?

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

