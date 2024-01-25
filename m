Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89522C47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 18:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LX2Biyswi3lcTJguDEv72aHM8YWWcEZE57McfhSqDfM=; b=i/hzuFnyUmZJwZu1pzl03nkbMb
	fasU5tn3mHR8thMJjCXqvl5vhYHoboLudlRyto5IVv8zQrXXRQHngDYAH6+m42QUcNDyOveqxmN7D
	DJbZxF98w5gjwSlXppWzvRmTw8tSsJ8S4dFgvOdw+c21c1I7+eNcPnC68f4LUBwa21ePIZwaArLoe
	rbqz0Iw18QuBrtK27MICI9DqFkHEuex8hEp+DwTvQCXuUB/dWCg5o9EnqLDfUzCZWVCPnNIgk1JiG
	Hc1KoSwXMU4/6gmWw+bG72SY9fO7KMEvamlqljkM/ERlid8Zha70RcOmFkDgXHcB3JkotwzWO2XBZ
	twUN7YzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT4I4-00000001I64-09nN;
	Thu, 25 Jan 2024 18:17:28 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT4I1-00000001I4g-1XNC
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jan 2024 18:17:26 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a27e7b70152so186490866b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jan 2024 10:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1706206644; x=1706811444; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LX2Biyswi3lcTJguDEv72aHM8YWWcEZE57McfhSqDfM=;
        b=XX6eOu9FXnsw7DxiotJ/d4CM6e6eEWe0Ld20L6Av5ugu+1wAnFFIUcgANxWnOJP7Wn
         9IpfgM/GKz0/Fb0qu4pkiii7h5YTHrQFA1l0J6Rkvt7zNpaTv6quBOqYKTtYoXLB+GZG
         2rSXIDuIZuoevisPr2hojQo7T2zEzC7Z0OZRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706206644; x=1706811444;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LX2Biyswi3lcTJguDEv72aHM8YWWcEZE57McfhSqDfM=;
        b=wnYkGOLL8qWHGmt7CxfH0k1paCeiocNNe1icuXkIOUjoGnDRwwkmX59XsXjWWiuOnK
         8YpOWyA5nSZhaggKwIByoW4tsmlMr+GEud088c3cyB4NWxmycAlSXgQ+2PAG+vsHIkMJ
         s6roH9H87Ba4FPH7fE18xaTzPqmoBeSL7XLxHlAWkZtGsEbzHHIUgrb7/6pN4sNBB/Fi
         4ez29Uc4VdvrlmQkTVnLsEmOKBUpf2dxLk+G7MdebpZwelk8/Wi8Umcc8UCSoK5B+Oug
         xpD0I2Fqo3399GAxLp3oHydZgtZdnPwHVqLbzKDBetwRkkTM+FHkyYLRgabUNLuOHfUV
         5otQ==
X-Gm-Message-State: AOJu0YzD7I68Q1ZpcFbIS5xXg2voeuOb1kVT7ji2u/CjvJiTp640Af86
	mpCrQ4H0g2g9rCIvVeJGNHv1pxNd5yykO5+YZfKBicY9/IFUHNe8804QXdCRP44=
X-Google-Smtp-Source: AGHT+IFFgR3FnuKNaxcbSF/D45iFGEkVO7DwIYkEGMWwJWTauy+SOrnz8WOVHQePtLtXFKX663PQaQ==
X-Received: by 2002:a17:906:a2d6:b0:a31:7e9c:60bf with SMTP id by22-20020a170906a2d600b00a317e9c60bfmr23085ejb.0.1706206643807;
        Thu, 25 Jan 2024 10:17:23 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id tl15-20020a170907c30f00b00a3186c2c254sm765083ejc.213.2024.01.25.10.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 10:17:23 -0800 (PST)
Date: Thu, 25 Jan 2024 19:17:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <ZbKlsTEvGPiGtzS3@phenom.ffwll.local>
Mail-Followup-To: Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
	"maxime@cerno.tech" <maxime@cerno.tech>,
	"manasi.d.navare@intel.com" <manasi.d.navare@intel.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"michel@daenzer.net" <michel@daenzer.net>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"mikita.lipski@amd.com" <mikita.lipski@amd.com>,
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>,
	"daniel.vetter@intel.com" <daniel.vetter@intel.com>,
	"nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>,
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aac416742920953999a9ce230ac68139bf5b9790.camel@mediatek.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_101725_456225_24B3BBE7 
X-CRM114-Status: GOOD (  31.84  )
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "daniel.vetter@intel.com" <daniel.vetter@intel.com>, Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "jani.nikula@intel.com" <jani.nikula@intel.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "michel@daenzer.net" <michel@daenzer.net>, "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>, "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "maxime@cerno.tech" <maxime@cerno.tech>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mikita.lipski@amd.com" <mikita.lipski@amd.com>, "sean@poorly.run" <sean@poorly.run>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>, "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>, "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 23, 2024 at 06:09:05AM +0000, Jason-JH Lin (林睿祥) wrote:
> Hi Maxime, Daniel,
> 
> We encountered similar issue with mediatek SoCs.
> 
> We have found that in drm_atomic_helper_commit_rpm(), when disabling
> the cursor plane, the old_state->legacy_cursor_update in
> drm_atomic_wait_for_vblank() is set to true.
> As the result, we are not actually waiting for a vlbank to wait for our
> hardware to close the cursor plane. Subsequently, the execution
> proceeds to drm_atomic_helper_cleanup_planes() to  free the cursor
> buffer. This can lead to use-after-free issues with our hardware.
> 
> Could you please apply this patch to fix our problem?
> Or are there any considerations for not applying this patch?

Mostly it needs someone to collect a pile of acks/tested-by and then land
it.

I'd be _very_ happy if someone else can take care of that ...

There's also the potential issue that it might slow down some of the
legacy X11 use-cases that really needed a non-blocking cursor, but I think
all the drivers where this matters have switched over to the async plane
update stuff meanwhile. So hopefully that's good.

Cheers, Sima
> 
> Regards,
> Jason-JH.Lin
> 
> On Tue, 2023-03-07 at 15:56 +0100, Maxime Ripard wrote:
> > Hi,
> > 
> > On Thu, Feb 16, 2023 at 12:12:13PM +0100, Daniel Vetter wrote:
> > > The stuff never really worked, and leads to lots of fun because it
> > > out-of-order frees atomic states. Which upsets KASAN, among other
> > > things.
> > > 
> > > For async updates we now have a more solid solution with the
> > > ->atomic_async_check and ->atomic_async_commit hooks. Support for
> > > that
> > > for msm and vc4 landed. nouveau and i915 have their own commit
> > > routines, doing something similar.
> > > 
> > > For everyone else it's probably better to remove the use-after-free
> > > bug, and encourage folks to use the async support instead. The
> > > affected drivers which register a legacy cursor plane and don't
> > > either
> > > use the new async stuff or their own commit routine are: amdgpu,
> > > atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and
> > > vmwgfx.
> > > 
> > > Inspired by an amdgpu bug report.
> > 
> > Thanks for submitting that patch. It's been in the downstream RPi
> > tree
> > for a while, so I'd really like it to be merged eventually :)
> > 
> > Acked-by: Maxime Ripard <maxime@cerno.tech>
> > 
> > Maxime

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

