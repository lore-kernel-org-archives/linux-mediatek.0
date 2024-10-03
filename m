Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D5C6CF34B6
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 15:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2NXDuG5BkkZuBBX1kYfPh1qTZEgllKeKRyyOYEcj6M=; b=Lo1+tNPtWXr9fJIRwvtwwZwNjY
	BJDDe509aRCmFZvXtvpr8k2sTaVeKsHNzMDZ+7e7NNen5SUxZ/6KDX6h1occrtRVb9clU60ZUJwkZ
	oB+JTpZ/sx0OVxMCFv3PpdJR1yo/5acebNdWp3BhreRYALV54EhjuEjljuoKsBHF3602qIFfnrzqU
	/SKaep92BsDuIKSPrXv4vb5xTyY7dqdkLnVUtmn57A+6Kju4BJruNNEnVrLFYkP8/J9MppuHXeX6/
	8Dg8MS/skY3exthyiLXhZQfZyFgQU+5Swyrgp651pLqaw9v0eDmrk07K9GUrWwfO5Qn0FLQr2eaZX
	UHoOy0Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swNle-00000009b5P-0P17;
	Thu, 03 Oct 2024 15:29:26 +0000
Received: from mgamail.intel.com ([192.198.163.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swNlb-00000009b2E-14Yt;
	Thu, 03 Oct 2024 15:29:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727969363; x=1759505363;
  h=date:from:to:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=YvquIwwg5/j4zuorAq7NmB4oxpw4k5D2MxcNq7+7jVA=;
  b=f9tqEh7DX5gqmodG0Fd2Z47pnNQSrIT7ahjbarJmCziDTeQ9RBHEUlln
   kKYdrHWCNHuL0zDy2X9sGOmt2tfftlqQlU3+8a5zd7Omlug7UgPrAEN+V
   HZNT5EFlWZRpdm6g0ohrgKCJldE6P+Olnn4ptoOwmvNRWxDCA1ZIfkqCS
   rtQrmKED6vmcadUimPF2ek77ZosYjb2R6VZFYhR3DlR2Tuurca3fojdTs
   SMSXWEiePV95z3T5It1vnPqnJqDLbid3M5K+ko2sJlL5ysO50+8c/JfYs
   BHIgCY8yBBF87b6oqEgTi5TRWPTR7My2U/RG+61oDkW5hOQzNP+0U52NW
   w==;
X-CSE-ConnectionGUID: UUJ6apwQQraiYu8oyZ7mgQ==
X-CSE-MsgGUID: ZwsVvwwGQKiki7i88T8PZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="26680403"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="26680403"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 08:29:18 -0700
X-CSE-ConnectionGUID: R4ZdAm2cSWCWdcBvo+HW5w==
X-CSE-MsgGUID: Rg93cpzSR3e/8YcpWOq3jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74496623"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
  by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 08:29:11 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 03 Oct 2024 18:29:10 +0300
Date: Thu, 3 Oct 2024 18:29:10 +0300
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
Message-ID: <Zv64RktMPv2rpCZf@intel.com>
References: <20241002182200.15363-1-ville.syrjala@linux.intel.com>
 <20241002182200.15363-3-ville.syrjala@linux.intel.com>
 <Zv6QF2EmIcogtlLA@louis-chauvet-laptop>
 <Zv6gSGMXZZARf3oV@intel.com>
 <Zv6zN7Go_XG44P2-@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zv6zN7Go_XG44P2-@louis-chauvet-laptop>
X-Patchwork-Hint: comment
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_082923_402184_90CA5346 
X-CRM114-Status: GOOD (  22.82  )
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

On Thu, Oct 03, 2024 at 05:07:35PM +0200, Louis Chauvet wrote:
> 
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > index a40295c18b48..780681ea77e4 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> > > > @@ -64,7 +64,7 @@ static int vkms_enable_vblank(struct drm_crtc *crtc)
> > > >  	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
> > > >  	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
> > > >  
> > > > -	drm_calc_timestamping_constants(crtc, &crtc->mode);
> > > > +	drm_calc_timestamping_constants(crtc, &crtc->legacy.mode);
> > > 
> > > 	drm_calc_timestamping_constants(crtc, &crtc->state->mode);
> > 
> > This one doesn't look safe. You want to call that during your atomic
> > commit already.
> > 
> 
> This was already not safe with the previous implementation? Or it is only 
> unsafe because now I use state->mode instead of legacy.mode?

Yeah, if you want to look at obj->state then you need the corresponding
lock.

obj->state is also not necessarily the correct state you want because
a parallel commit could have already swapped in a new state but the
hardware is still on the old state.

Basically 99.9% of code should never even look at obj->state, and
instead should always use the for_each_new_<obj>_in_state()
and drm_atomic_get_new_<obj>_state() stuff. Currently that is a
pipe dream though because a lot of drivers haven't been fixed to
do things properly. If we ever manage to fix everything then we
could remove the stall hacks from drm_atomic_helper_swap_state()
and allow a commit pipeline of arbitrary length.

> 
> After inspecting the code, I think I don't need to call it as:
> 
> In `vkms_atomic_commit_tail` (used in 
> `@vkms_mode_config_helpers.atomic_commit_tail`), we call 
> `drm_atomic_helper_commit_modeset_disables`, which call 
> `drm_atomic_helper_calc_timestamping_constants` which call 
> `drm_calc_timestamping_constants` for every CRTC.

Slightly odd place for it, but I think that's just because it was
originally part of drm_atomic_helper_update_legacy_modeset_state()
and I didn't bother looking for a better home for it when I split
it out. But seems like it should work fine as is.

> 
> I tested kms_vblank, all of them are SUCCESS/SKIP, do you know other tests 
> that can trigger bugs?

You would explicitly have to race commits against vblank_enable.
Could of course sprinkle sleep()s around to widen the race window
if you're really keen to hit it.

-- 
Ville Syrjälä
Intel

