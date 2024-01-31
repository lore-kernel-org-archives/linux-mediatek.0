Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F854C47258
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 11:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqhHWwD0G4uA9KZYS4hbxluQXzkwr0OlBUL6FsGhiWg=; b=GYiz7NwwO1dkP+EVXPlrsAdTXw
	Bn9YuAwTUYhdPhM9iMXQerWiEd1NdvCY15Iou7fkERnn26g0evimNOde4BgX7ga0gkFKfqOD/UL2G
	jZoNzVrCfoqMqHP86x1DgXR+f35yZ90Tjn4LyfCFANITFohsjP7za/XdxmzqfUWv8HxE2+JzbnGGY
	qAaqDqfSMSWznlG4HWapHA/B46nHhBS3lgJUU8+tjcHktbAu0qzNMl95d/of+48WnHN/k5VYVmk6N
	cREJYgos0yh1ZqBGCGSwQlCQSf4svKBBv6Ids+9bAl7CQn7RjY104KneiLggidwUAKKwA3RaTjPcT
	/dNgdKWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8mB-000000035xX-0qDj;
	Wed, 31 Jan 2024 11:29:07 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8m8-000000035ud-3BH7
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jan 2024 11:29:06 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a352d9c0f9dso148925766b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Jan 2024 03:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1706700542; x=1707305342; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UqhHWwD0G4uA9KZYS4hbxluQXzkwr0OlBUL6FsGhiWg=;
        b=K4VOh0xT/tPh9o49QZc0pLC8egWL1K+3zWkcK6ztuP/75ACG2bXOVylOz/4gUWcaAS
         +9yOcfWXsrKrmE3wBIhKJxs7NYn9JvH5IPePbOh0jmP5MdNs8ySwAK5ryCcXHFdX50ps
         XzWCvYwoiCCDTjoFziuWbyUtOBYqg7Koe5LVY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706700542; x=1707305342;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqhHWwD0G4uA9KZYS4hbxluQXzkwr0OlBUL6FsGhiWg=;
        b=ZEbBFBidAT7YzjQrFp0mlK6MXsA25ouY1NEF9RU5zsq0mY84UI2ePD/0C5mspYq/4V
         nR3/0tx1Kwo5XgAf9c4Lyvc2vsUNoofRYotLRbk286tBkiv8CDNYBWPg+1yEX8VhfI6R
         sJi9Q6ZfDJeP+2BMXvu+OlmDibEEZu1SoPaneJ4FoStIAWsiAqBEHhWnLvg/9B7QFgi1
         2PMU1VUygxgNwl3AmrQKK948UdO5JAdFXixAy2TqZl8oOCZ3Gblxj5xC0Z7LjvWr6YY9
         32uHidv911qD5PmQBpKNDAxTeyJ61OsNCzjcJCYnlIFwNY4tJkGDeR1r4DE2+bmEUatm
         9b1A==
X-Gm-Message-State: AOJu0YwZ209mUAbYXVeoFsVY4/OKZONz8cyKMKn2DrEGJhf4USN2Puye
	pZ0Y3ZQkxBBv9pNglmRKLmlL/tMp4h/mtk5HqtnKRvwLZOhUAXfnxX3UAWFEmis=
X-Google-Smtp-Source: AGHT+IEF59TprIa6Ram1HS7MhbdsWEwmnMxvdors8usQrdNdBa4tbbMATy8t9TnYJpReIzZrvsqyxg==
X-Received: by 2002:a17:906:4f0e:b0:a31:410a:18e4 with SMTP id t14-20020a1709064f0e00b00a31410a18e4mr886491eju.4.1706700541914;
        Wed, 31 Jan 2024 03:29:01 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVQg6OreM8PpU4kdOWR1ROcpBxhI0KOFi8yuDak8zGiFs/4kT7V4Qx4VBX/FFBu06AKIYEyB4sPazzAizbPK7O49rHn8RS/gfXPjPGlI3SFOKCnewgu9bTfvPiRy6rb+7LNEfNKSpT6Vc+zIXkx+2GSyurNfiDgq+2Y8DUIVVbNs5hpmZUiJ7vP7IZIW6yi+ANAiZgRLbTvGIDj5lqe+H+EGj3nX0xTDTbLhK8RB/PcVIzZhollLovJA8MDvLVfWYtYkxkOHRaznsXa1zX+pye0pO6eo0Srsd/DxM7Wu48P0Uvw0P6fCWrt/e6HFJ5nCo7N+Uv2CyCjx/6EMAdAysp+TrNle4NeRcLeHJTmHpdwN51QAAwHxFA3Fy7Fa45Pw0ssb5xa8FHH2LToB1fH3So/24Og/rzhAcI8XqHSNDAE9FAfkNR5BNI1a1WHZkvjey8uCi/YS08UxRgAhWWlqZiapxLMvqhv8ktKBxnrwPPi0ODL0lQAtuR7ZJ/F//zYx27zFTZd93HtkeSz+4CBuqU38t6OkyKkvrdRihf2ZivOvEA/30EzLmdN0byBwyCYgHWWm5DuYUX+GktDiCwHpC1Lm4xji1nifQ70uncJBkhW66Fnl2jdnrNSR0GWmqNpAgljJJYHDK2SNh8TU+4IGIzAXARHIpXsBy4BcEWb32RXcjeKxR2R46J7lshdAGBdhqIEBFu+1nni32ojt5Oh1nl6hjS34D8kg9cJErcDZtFFUDQaVvxp2IhtZu6HCsJ7G4nDB4Xh4Y9nNCPrhxBek+wPmXtL2CovnAVDzoqNGxnFF7zBrh8+ZKH/mXm0lFcKxxwDnApqwzgi6HQCtEfeoW1mtH5yfXvbHUMOYioIJwMVDISp2In+OG8lWcLrQ4kC86M5MZN1HsJRbgO7AfUb/2VoqTsCgXlGygKgR3CDBZHY4uMQPgqRW/B+7FPFDz4u4bBDTF
 PCe9piEndN99AfqgZO/Yg+q1HbZ/V1e02L7iL1fV+VfhrVr2bovvCzuOfP5ry4VQ==
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id p6-20020a170906784600b00a30e1f233b4sm6064491ejm.128.2024.01.31.03.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 03:29:01 -0800 (PST)
Date: Wed, 31 Jan 2024 12:28:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <Zbou-y7eNhQTMpKo@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"michel@daenzer.net" <michel@daenzer.net>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"mikita.lipski@amd.com" <mikita.lipski@amd.com>,
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
 <ZboOp7JOp5teV1Cs@phenom.ffwll.local>
 <CAA8EJpqAU=RvqJUPmPO2LCJ+6KMOT8Pi2WrkPq8YHzhyRVxHeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJpqAU=RvqJUPmPO2LCJ+6KMOT8Pi2WrkPq8YHzhyRVxHeg@mail.gmail.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_032904_829474_0293B23F 
X-CRM114-Status: GOOD (  44.09  )
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "daniel.vetter@intel.com" <daniel.vetter@intel.com>, Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "jani.nikula@intel.com" <jani.nikula@intel.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "michel@daenzer.net" <michel@daenzer.net>, "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>, "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "maxime@cerno.tech" <maxime@cerno.tech>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mikita.lipski@amd.com" <mikita.lipski@amd.com>, "sean@poorly.run" <sean@poorly.run>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>, "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>, "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 31, 2024 at 12:26:45PM +0200, Dmitry Baryshkov wrote:
> On Wed, 31 Jan 2024 at 11:11, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Jan 31, 2024 at 05:17:08AM +0000, Jason-JH Lin (林睿祥) wrote:
> > > On Thu, 2024-01-25 at 19:17 +0100, Daniel Vetter wrote:
> > > >
> > > > External email : Please do not click links or open attachments until
> > > > you have verified the sender or the content.
> > > >  On Tue, Jan 23, 2024 at 06:09:05AM +0000, Jason-JH Lin (林睿祥) wrote:
> > > > > Hi Maxime, Daniel,
> > > > >
> > > > > We encountered similar issue with mediatek SoCs.
> > > > >
> > > > > We have found that in drm_atomic_helper_commit_rpm(), when
> > > > disabling
> > > > > the cursor plane, the old_state->legacy_cursor_update in
> > > > > drm_atomic_wait_for_vblank() is set to true.
> > > > > As the result, we are not actually waiting for a vlbank to wait for
> > > > our
> > > > > hardware to close the cursor plane. Subsequently, the execution
> > > > > proceeds to drm_atomic_helper_cleanup_planes() to  free the cursor
> > > > > buffer. This can lead to use-after-free issues with our hardware.
> > > > >
> > > > > Could you please apply this patch to fix our problem?
> > > > > Or are there any considerations for not applying this patch?
> > > >
> > > > Mostly it needs someone to collect a pile of acks/tested-by and then
> > > > land
> > > > it.
> > > >
> > >
> > > Got it. I would add tested-by tag for mediatek SoC.
> > >
> > > > I'd be _very_ happy if someone else can take care of that ...
> > > >
> > > > There's also the potential issue that it might slow down some of the
> > > > legacy X11 use-cases that really needed a non-blocking cursor, but I
> > > > think
> > > > all the drivers where this matters have switched over to the async
> > > > plane
> > > > update stuff meanwhile. So hopefully that's good.
> > > >
> > >
> > > I think all the drivers should have switched to async plane update.
> > >
> > > Can we add the checking condition to see if atomic_async_update/check
> > > function are implemented?
> >
> > Pretty sure not all have done that, so really it boils down to whether we
> > break a real user's use-case. Which pretty much can only be checked by
> > merging the patch (hence the requirement to get as many acks as possible
> > from display drivers) and then being willing to handle any fallout that's
> > reported as regressions for a specific driver.
> >
> > It's a pile of work, at least when it goes south, that's why I'm looking
> > for volunteers.
> 
> I can check this on all sensible msm generations, including mdp4, but
> it will be next week, after the FOSDEM.
> 
> BTW, for technical reasons one of the msm platforms still has the
> legacy cursor implementation might it be related?

Yeah, msm is one of the drivers I had to change with some hacks to avoid
really bad fallout. It should still work like before, but that's one that
definitely needs testing.
-Sima

> 
> >
> > Note that handling the fallout doesn't mean you have to fix that specific
> > driver, the only realistic option might be to reinstate the legacy cursor
> > behaviour, but as an explicit opt-in that only that specific driver
> > enables.
> >
> > So maybe for next round of that patch it might be good to have a 2nd patch
> > which implements this fallback plan in the shared atomic modeset code?
> >
> > Cheers, Sima
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

