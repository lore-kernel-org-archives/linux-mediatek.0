Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EDDCF34B0
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 15:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KEG391uPbET+smFrjuUd3Gbf+SfD/X5R0PGVdaNVyDQ=; b=UszcOwyZ+XJdtWNd1eCnQ+6Ad0
	PL/Jk4BhgwW20bfhDhdZDG+iutp6IwrcZJ9Uu4sfg76DMAIbF2ifhGt6Skh3DUBB71XdlvlFOz66n
	3j/9swXwmqtrAqNz7U/+cQes/E89ZxbNiiwuIoV9c5ma+UQCnqskxsJn/DUZJKDOW26u55Fn7sJFx
	xP1/juUo9uI043eJM9SCHYuXe1En+gxE51HT8+W3r5BfiOT3b/KuALHfzGC/o63LJgmQi/VB8pRSl
	iyrkJxTe8+88RzUzdDojdgkaqC2NAjEkl6DJQ2rERL4ADYR7vjLKSv5ToHndBuRssSBgsijeEM+3w
	1GX5pMXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swO14-00000009fJs-1BhV;
	Thu, 03 Oct 2024 15:45:22 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swO10-00000009fHH-1OE3;
	Thu, 03 Oct 2024 15:45:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6E6A6E0002;
	Thu,  3 Oct 2024 15:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727970315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KEG391uPbET+smFrjuUd3Gbf+SfD/X5R0PGVdaNVyDQ=;
	b=TICrwrFPqNQr0FkllJojskNhDNyxJBBjJ7p1KfIigSpe1yz5eAAGd2ZrO2BidvC6/A+Qom
	NZAd/9RJSz1RiDd3lLdtADp5nqX9bQyWNoBMaYmxSJhOSDe0T0fZ3BzR0Se1uCIXgHLatP
	0EnPqF616SrgdCpZaDlShmBrP13ZbIXW9Bj7Oi5IuZvb8HSqOh6m1SReSPJmtquU99Yk9c
	wA7Vpopy8iwsQYMzzsZgtNT4idP5iRQdLFv3pdXkbJyEmdQQR3dqplUNNyYzH1sATd/MpW
	BCY3lPJp+f+t7R9s2mNyuYyLKxVcwMtVAupvHPO8B9IX4HLM2IwIi9MsvKSHrQ==
Date: Thu, 3 Oct 2024 17:45:10 +0200
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
Message-ID: <Zv68Bj8UTNvRSmFj@louis-chauvet-laptop>
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
 <Zv6zN7Go_XG44P2-@louis-chauvet-laptop>
 <Zv64RktMPv2rpCZf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zv64RktMPv2rpCZf@intel.com>
X-GND-Sasl: louis.chauvet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_084518_663393_CCFE7E2E 
X-CRM114-Status: GOOD (  30.92  )
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

Le 03/10/24 - 18:29, Ville Syrjälä a écrit :
> On Thu, Oct 03, 2024 at 05:07:35PM +0200, Louis Chauvet wrote:
> > 
> > > > > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > > index a40295c18b48..780681ea77e4 100644
> > > > > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > > @@ -64,7 +64,7 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
> > > > >  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> > > > >  	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> > > > >  
> > > > > -	drm_calc_timestamping_constants(crtc, &crtc->mode);
> > > > > +	drm_calc_timestamping_constants(crtc, &crtc->legacy.mode);
> > > > 
> > > > 	drm_calc_timestamping_constants(crtc, &crtc->state->mode);
> > > 
> > > This one doesn't look safe. You want to call that during your atomic
> > > commit already.
> > > 
> > 
> > This was already not safe with the previous implementation? Or it is only 
> > unsafe because now I use state->mode instead of legacy.mode?
> 
> Yeah, if you want to look at obj->state then you need the corresponding
> lock.
> 
> obj->state is also not necessarily the correct state you want because
> a parallel commit could have already swapped in a new state but the
> hardware is still on the old state.
> 
> Basically 99.9% of code should never even look at obj->state, and
> instead should always use the for_each_new_<obj>_in_state()
> and drm_atomic_get_new_<obj>_state() stuff. Currently that is a
> pipe dream though because a lot of drivers haven't been fixed to
> do things properly. If we ever manage to fix everything then we
> could remove the stall hacks from drm_atomic_helper_swap_state()
> and allow a commit pipeline of arbitrary length.
>
> > 
> > After inspecting the code, I think I don't need to call it as:
> > 
> > In `vkms_atomic_commit_tail` (used in 
> > `@vkms_mode_config_helpers.atomic_commit_tail`), we call 
> > `drm_atomic_helper_commit_modeset_disables`, which call 
> > `drm_atomic_helper_calc_timestamping_constants` which call 
> > `drm_calc_timestamping_constants` for every CRTC.
> 
> Slightly odd place for it, but I think that's just because it was
> originally part of drm_atomic_helper_update_legacy_modeset_state()
> and I didn't bother looking for a better home for it when I split
> it out. But seems like it should work fine as is.

I just send a patch for this! Thanks for your help!

[1]:https://lore.kernel.org/all/20241003-remove-legacy-v1-1-0b7db1f1a1a6@bootlin.com/
 
> > 
> > I tested kms_vblank, all of them are SUCCESS/SKIP, do you know other tests 
> > that can trigger bugs?
> 
> You would explicitly have to race commits against vblank_enable.
> Could of course sprinkle sleep()s around to widen the race window
> if you're really keen to hit it.
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

