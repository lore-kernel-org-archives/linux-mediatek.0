Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44447C47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 09:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORBEpQ5F08UVhnCzKa+jzZ+oJJNJsZKWbQ0DCuxPaWc=; b=w1gquk26sBu88eaQD+cPdGH0kr
	AhUXXfi26D0sHBAq90dXLpcBr9GvaftTGHTxDTKrrM4dk6YsHnz9i38/OWphGCyow0rMqvPlSqq4E
	LlYIHPdW9oL8+9v2AKuP8vmJAEgmKB6ENjX5JvRXVNdqhWSndh06K0EVpXIkM90mDrV5Havh19TvO
	1kP5z8VYgR9IB6nA0DYeD9bjfYmAFeTog0RXnBV+iOQR86EFYsuVWmvo9uIrz1LxQiqzd+nrTCBtN
	vgheJY/8M0ztnFhOLLX90YUuhsnnUXBQs5VWSE6LY/ydmxdLoSZXkaTFxRMKNtSRhP59Zi4O/ZiFc
	xeUeoFXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV6cs-00000002MNP-3EJs;
	Wed, 31 Jan 2024 09:11:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV6cr-00000002MMY-05VC
	for linux-mediatek@bombadil.infradead.org;
	Wed, 31 Jan 2024 09:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ORBEpQ5F08UVhnCzKa+jzZ+oJJNJsZKWbQ0DCuxPaWc=; b=mA6I604RDH6LSNpbKY5F2S56AU
	rbEA9xIth6VIcK0F/khqc54nK2BcqhKP0yzyCOGP3J47DuRx7XrB/HV6s9l7iMGjy92u3OJNra8ta
	mdDJTaOhcXuS47OR14WMyTLaT3QYK6J16KEgpblwiYHhxsft1HC9G7yRBMSXJZVzjrIT1cOCXA5Zc
	/sdzHuAbjMwXfDrDt89P/IKOgDRSnBusD1GQCGFtYJE/tN7sMArybpPRt2EZYn8K+ZMGrGKh7hhY1
	UAuwMDEnPbomlGO7sGpTxbNlPWwXZMgsWkGHTGlXibIPL1JSmh4Dphk4fovDdVcShUZIxCg3tIRLz
	/+OFi/Yg==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV6ch-00000008tNu-1PWR
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jan 2024 09:11:16 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a2e633c5365so184026166b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Jan 2024 01:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1706692267; x=1707297067; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ORBEpQ5F08UVhnCzKa+jzZ+oJJNJsZKWbQ0DCuxPaWc=;
        b=RoOYCRxN2gHTsE51nPOGFEaE5MpWluSDzPRDJpYQyVamKzfTbCbWKqXTFGgXDUOcn3
         1cfrqcqW7JqAOavJjbWEZaM+6ToatOslGjbu/y4o4dbtjbrubZpwYUqFruJGtGwGwqzh
         Yo7DY/rWctA5AZXi6ZGsVBd5ESTth638XWXWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706692267; x=1707297067;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ORBEpQ5F08UVhnCzKa+jzZ+oJJNJsZKWbQ0DCuxPaWc=;
        b=ssFF4TnvyQf7UDzZeEyAqESWnSJ7yDXuRkAI1b9R0gXbTUyS8kUu3d/qWE60GO6hL5
         WegVyCpvp7A/i4lBoO1TO+/dXyDG4+bHL7RtCGVtXWBXZty8Ikr4Q87jiJ/HKvU97WCz
         D6nknCiu3lNF7t9/7cjnTZ2wFoNRsS07KhPvNgpoaC1PU+C3jg3m4Gx+HKzXxkGa9Sff
         M/4MC7RhkBtCstuxpgV17mQByQ5+zZ2LAyj89jn1zvDze6oo5y7OyR7yj+1QJVcmIy1e
         5kujbqVX7h5r8b52hUHdRyAnjXRdCQ1NNE2yrSGKUQbxH4JR5/8bCxPgypRtP7T8CDjM
         rKIA==
X-Gm-Message-State: AOJu0YygEg7ol4dxzaAYPY8B09WAmbRVx6Jp+r+FAsYCHrfh2fvD5L4X
	q8rL/7uFSzPE9U7hqT9Xl/+aBICqb+o7XQI/56uROYNyNbDRP5GSk5hTbNZ33QM=
X-Google-Smtp-Source: AGHT+IHHkRoncH5TZwJ2KO/1SVucsjdiD6pGPJaM5NKeKM2EzUdubU6eh2uy4dvG7OzWu32QgOh+eg==
X-Received: by 2002:a17:906:4a52:b0:a35:b6a1:712d with SMTP id a18-20020a1709064a5200b00a35b6a1712dmr697445ejv.2.1706692266392;
        Wed, 31 Jan 2024 01:11:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id j9-20020a170906254900b00a311685890csm5987876ejb.22.2024.01.31.01.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 01:11:05 -0800 (PST)
Date: Wed, 31 Jan 2024 10:11:03 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <ZboOp7JOp5teV1Cs@phenom.ffwll.local>
Mail-Followup-To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"michel@daenzer.net" <michel@daenzer.net>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"mikita.lipski@amd.com" <mikita.lipski@amd.com>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>,
	"maxime@cerno.tech" <maxime@cerno.tech>,
	"daniel.vetter@intel.com" <daniel.vetter@intel.com>,
	"nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"manasi.d.navare@intel.com" <manasi.d.navare@intel.com>,
	"lucas.demarchi@intel.com" <lucas.demarchi@intel.com>,
	"sean@poorly.run" <sean@poorly.run>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
	"fshao@chromium.org" <fshao@chromium.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"jani.nikula@intel.com" <jani.nikula@intel.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
References: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
 <20230307145613.xvhru3fpcudlpazt@houat>
 <aac416742920953999a9ce230ac68139bf5b9790.camel@mediatek.com>
 <ZbKlsTEvGPiGtzS3@phenom.ffwll.local>
 <1349365de499bae53a8c868738c7270fc16813d5.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1349365de499bae53a8c868738c7270fc16813d5.camel@mediatek.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_091112_578338_4409B5F1 
X-CRM114-Status: GOOD (  44.95  )
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "daniel.vetter@intel.com" <daniel.vetter@intel.com>, Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "jani.nikula@intel.com" <jani.nikula@intel.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "michel@daenzer.net" <michel@daenzer.net>, "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>, "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "maxime@cerno.tech" <maxime@cerno.tech>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mikita.lipski@amd.com" <mikita.lipski@amd.com>, "sean@poorly.run" <sean@poorly.run>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>, "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>, "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 31, 2024 at 05:17:08AM +0000, Jason-JH Lin (林睿祥) wrote:
> On Thu, 2024-01-25 at 19:17 +0100, Daniel Vetter wrote:
> >  	 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On Tue, Jan 23, 2024 at 06:09:05AM +0000, Jason-JH Lin (林睿祥) wrote:
> > > Hi Maxime, Daniel,
> > > 
> > > We encountered similar issue with mediatek SoCs.
> > > 
> > > We have found that in drm_atomic_helper_commit_rpm(), when
> > disabling
> > > the cursor plane, the old_state->legacy_cursor_update in
> > > drm_atomic_wait_for_vblank() is set to true.
> > > As the result, we are not actually waiting for a vlbank to wait for
> > our
> > > hardware to close the cursor plane. Subsequently, the execution
> > > proceeds to drm_atomic_helper_cleanup_planes() to  free the cursor
> > > buffer. This can lead to use-after-free issues with our hardware.
> > > 
> > > Could you please apply this patch to fix our problem?
> > > Or are there any considerations for not applying this patch?
> > 
> > Mostly it needs someone to collect a pile of acks/tested-by and then
> > land
> > it.
> > 
> 
> Got it. I would add tested-by tag for mediatek SoC.
> 
> > I'd be _very_ happy if someone else can take care of that ...
> > 
> > There's also the potential issue that it might slow down some of the
> > legacy X11 use-cases that really needed a non-blocking cursor, but I
> > think
> > all the drivers where this matters have switched over to the async
> > plane
> > update stuff meanwhile. So hopefully that's good.
> > 
> 
> I think all the drivers should have switched to async plane update.
> 
> Can we add the checking condition to see if atomic_async_update/check
> function are implemented?

Pretty sure not all have done that, so really it boils down to whether we
break a real user's use-case. Which pretty much can only be checked by
merging the patch (hence the requirement to get as many acks as possible
from display drivers) and then being willing to handle any fallout that's
reported as regressions for a specific driver.

It's a pile of work, at least when it goes south, that's why I'm looking
for volunteers.

Note that handling the fallout doesn't mean you have to fix that specific
driver, the only realistic option might be to reinstate the legacy cursor
behaviour, but as an explicit opt-in that only that specific driver
enables.

So maybe for next round of that patch it might be good to have a 2nd patch
which implements this fallback plan in the shared atomic modeset code?

Cheers, Sima

> 
> Regards,
> Jason-JH.Lin
> 
> > Cheers, Sima
> > > 
> > > Regards,
> > > Jason-JH.Lin
> > > 
> > > On Tue, 2023-03-07 at 15:56 +0100, Maxime Ripard wrote:
> > > > Hi,
> > > > 
> > > > On Thu, Feb 16, 2023 at 12:12:13PM +0100, Daniel Vetter wrote:
> > > > > The stuff never really worked, and leads to lots of fun because
> > it
> > > > > out-of-order frees atomic states. Which upsets KASAN, among
> > other
> > > > > things.
> > > > > 
> > > > > For async updates we now have a more solid solution with the
> > > > > ->atomic_async_check and ->atomic_async_commit hooks. Support
> > for
> > > > > that
> > > > > for msm and vc4 landed. nouveau and i915 have their own commit
> > > > > routines, doing something similar.
> > > > > 
> > > > > For everyone else it's probably better to remove the use-after-
> > free
> > > > > bug, and encourage folks to use the async support instead. The
> > > > > affected drivers which register a legacy cursor plane and don't
> > > > > either
> > > > > use the new async stuff or their own commit routine are:
> > amdgpu,
> > > > > atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and
> > > > > vmwgfx.
> > > > > 
> > > > > Inspired by an amdgpu bug report.
> > > > 
> > > > Thanks for submitting that patch. It's been in the downstream RPi
> > > > tree
> > > > for a while, so I'd really like it to be merged eventually :)
> > > > 
> > > > Acked-by: Maxime Ripard <maxime@cerno.tech>
> > > > 
> > > > Maxime
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

