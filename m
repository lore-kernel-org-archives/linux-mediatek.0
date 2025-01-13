Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1569E7719E
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2025 09:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVmv06UiciOif9n0zEXjWMnBVceV6C66Mfpmv3QehtQ=; b=YV+xY+F+37w1ggXoIu+3t/Fn23
	ER3JhV01fp+8ekM9Uci8x28TsPs9//fZ4BGAn+EcXTIOjmb+Ic5DUn1w5L7ErVuMeYnF3rJ0eLxyS
	6n3QvzvsdnJzIaB6JG6OupyDWQAcA5HruWKOzdbWp8bClpHB/Ji8ipnV+F3bzxjcidjCDfiZWxZR5
	yRcbGgwBJCUSaUhYjXJL4uxKaz0xpoAXYf6ADLz86TU0VfBf0cqLmXqB2mKIFujc4j6ahjUHE5vzp
	rcLss/IUclQ0fwHuIHPKdiS3K3a6oIBKG2c2OsDbN13afX+7x34T4l4eyoLb/qf5I5Gg2thpsp0Ix
	v0M2FSkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGV4-00000004YWj-2LWL;
	Mon, 13 Jan 2025 09:12:46 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXGK5-00000004W9c-1Czv
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Jan 2025 09:01:26 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-540254357c8so3678777e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Jan 2025 01:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736758883; x=1737363683; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gVmv06UiciOif9n0zEXjWMnBVceV6C66Mfpmv3QehtQ=;
        b=Z6CDI2TMxUj4g+zyv3MC3DKRmY3yb8rFxUlfMitamOcl412PJpEX6GY6d3kykm8SfD
         OpwAVRjAq0TgDRdAvLsFr67pF+PWR24VB1BBBN9szjahzlGF6x7VTCHQFFRBfeUMEDoG
         CZpkTsacwy4wYjgmb9m3b4ZxMDnadIgvp64USuP6S10+l7S7UaEOEi7KBdsmJ+g5VhRj
         EAJjnh36WnSjHMJVZX+0700VFbLexrC/0H61ekgNkcCYO/u9PENQXaLlzX06atxfqY5z
         JqbYzatEu3AVbEZZmY9oAx+xK3g/lKBXh1XKOY/3n3u1i2mjj8I2H39nnURqhXch0oCV
         7N3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736758883; x=1737363683;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gVmv06UiciOif9n0zEXjWMnBVceV6C66Mfpmv3QehtQ=;
        b=RBZTyclUEx8JsKwwEz7T/meRtIZ89I+2cD0p+lo3Kd4PoESJ4Ux3CNWHnqTUtNdjOx
         12mW8OC4ZCNDAR7PsHr92DSpWwd7E+KRmDoPNeGmwFViyn80zM4ogQJvTtgMr5IsYlX5
         vnR8lNCM/r1pDKtRhpbzKa0gGM8xRghLhS+l0x5uhqtxNreVRxj1HGvzvUxC2fBr5uiS
         J1ZJ1Jd/vXjqCGv0tz87oZ5DJ4pfpSq/q6Z2EVriIF5ES02K2QIKPQLk3njF0VZwtjNk
         tpvnasJLRkBi57gJygX0sxkL2kOv+XL++ciJlbyYAlk4k8zo8UGbYNKCT0fl87VZI3RZ
         iHWw==
X-Forwarded-Encrypted: i=1; AJvYcCUaPs8v3rkvUTejMRWDvRaPx1DJXIxPpB/0E+2eTv4R0kaCz7UJlo/+cu6bZQq7PoubPa6V3I/f7q6kax4iSA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/+Ik9Htw1LjWr4rsRJB2t2/hL2OWxsodSjkJKzUVWsrPo0jLc
	0qEB6YEGsU3T+yrpeeDwHn0VKjfewFgObl7HK8tqgnl+ZW+l5YQKJ9PCYR6m7+I=
X-Gm-Gg: ASbGncsymnui62NxZ+CeiTOrbxy29EYZFN99b5jmdM3NJZGLetrsBL0iDml+tUgmPtd
	HRH/FlYD4HMp3QbiHHS49BUFJF4425uMByf2G8toa0QEeS1VOfFagt1xvCidllK44nBp3EojdY7
	bUmIZ5TvpVEZW8KIk0/U/mvZhrhX+Ywar31m6XeuQOJxOFUqm91mtmphCtvFrNSFFj8X4kgqYUW
	bAoxJBfkoU131HKsK2VRv1L7Xak95DAPTG/ipF0rfpxiO5ChOwqvzl6PR8dogDdPafxNP22DzUp
	AcGBgOICh6Smfx/5V85xs9UuzIIzTL+Onuep
X-Google-Smtp-Source: AGHT+IGcTFUXjIwHW9lpVqJAyyIcRCFXMgiGOEb3ziE970UiReLi1TBQykdVRRw2foBrKdh4TrGJCQ==
X-Received: by 2002:a05:6512:2214:b0:542:29e5:731c with SMTP id 2adb3069b0e04-542844f649cmr6246866e87.11.1736758883364;
        Mon, 13 Jan 2025 01:01:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49d7esm1279018e87.19.2025.01.13.01.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 01:01:22 -0800 (PST)
Date: Mon, 13 Jan 2025 11:01:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "maxime@cerno.tech" <maxime@cerno.tech>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <4getu2xtlxudcy53emipvtfxjnxg2mrupwfcekdjizjdtbk3k7@nlii76skfuh4>
References: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
 <20230307145613.xvhru3fpcudlpazt@houat>
 <aac416742920953999a9ce230ac68139bf5b9790.camel@mediatek.com>
 <ZbKlsTEvGPiGtzS3@phenom.ffwll.local>
 <1349365de499bae53a8c868738c7270fc16813d5.camel@mediatek.com>
 <ZboOp7JOp5teV1Cs@phenom.ffwll.local>
 <CAA8EJpqAU=RvqJUPmPO2LCJ+6KMOT8Pi2WrkPq8YHzhyRVxHeg@mail.gmail.com>
 <Zbou-y7eNhQTMpKo@phenom.ffwll.local>
 <20250113-melodic-cuckoo-of-experience-bb6ac7@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250113-melodic-cuckoo-of-experience-bb6ac7@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_010125_347464_FDC74A46 
X-CRM114-Status: GOOD (  41.36  )
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "daniel.vetter@intel.com" <daniel.vetter@intel.com>, Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "jani.nikula@intel.com" <jani.nikula@intel.com>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, "michel@daenzer.net" <michel@daenzer.net>, "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>, "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mikita.lipski@amd.com" <mikita.lipski@amd.com>, "sean@poorly.run" <sean@poorly.run>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>, "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>, "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 13, 2025 at 09:28:36AM +0100, maxime@cerno.tech wrote:
> Hi Dmitry,
> 
> On Wed, Jan 31, 2024 at 12:28:59PM +0100, Daniel Vetter wrote:
> > On Wed, Jan 31, 2024 at 12:26:45PM +0200, Dmitry Baryshkov wrote:
> > > On Wed, 31 Jan 2024 at 11:11, Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Wed, Jan 31, 2024 at 05:17:08AM +0000, Jason-JH Lin (林睿祥) wrote:
> > > > > On Thu, 2024-01-25 at 19:17 +0100, Daniel Vetter wrote:
> > > > > >
> > > > > > External email : Please do not click links or open attachments until
> > > > > > you have verified the sender or the content.
> > > > > >  On Tue, Jan 23, 2024 at 06:09:05AM +0000, Jason-JH Lin (林睿祥) wrote:
> > > > > > > Hi Maxime, Daniel,
> > > > > > >
> > > > > > > We encountered similar issue with mediatek SoCs.
> > > > > > >
> > > > > > > We have found that in drm_atomic_helper_commit_rpm(), when
> > > > > > disabling
> > > > > > > the cursor plane, the old_state->legacy_cursor_update in
> > > > > > > drm_atomic_wait_for_vblank() is set to true.
> > > > > > > As the result, we are not actually waiting for a vlbank to wait for
> > > > > > our
> > > > > > > hardware to close the cursor plane. Subsequently, the execution
> > > > > > > proceeds to drm_atomic_helper_cleanup_planes() to  free the cursor
> > > > > > > buffer. This can lead to use-after-free issues with our hardware.
> > > > > > >
> > > > > > > Could you please apply this patch to fix our problem?
> > > > > > > Or are there any considerations for not applying this patch?
> > > > > >
> > > > > > Mostly it needs someone to collect a pile of acks/tested-by and then
> > > > > > land
> > > > > > it.
> > > > > >
> > > > >
> > > > > Got it. I would add tested-by tag for mediatek SoC.
> > > > >
> > > > > > I'd be _very_ happy if someone else can take care of that ...
> > > > > >
> > > > > > There's also the potential issue that it might slow down some of the
> > > > > > legacy X11 use-cases that really needed a non-blocking cursor, but I
> > > > > > think
> > > > > > all the drivers where this matters have switched over to the async
> > > > > > plane
> > > > > > update stuff meanwhile. So hopefully that's good.
> > > > > >
> > > > >
> > > > > I think all the drivers should have switched to async plane update.
> > > > >
> > > > > Can we add the checking condition to see if atomic_async_update/check
> > > > > function are implemented?
> > > >
> > > > Pretty sure not all have done that, so really it boils down to whether we
> > > > break a real user's use-case. Which pretty much can only be checked by
> > > > merging the patch (hence the requirement to get as many acks as possible
> > > > from display drivers) and then being willing to handle any fallout that's
> > > > reported as regressions for a specific driver.
> > > >
> > > > It's a pile of work, at least when it goes south, that's why I'm looking
> > > > for volunteers.
> > > 
> > > I can check this on all sensible msm generations, including mdp4, but
> > > it will be next week, after the FOSDEM.
> > > 
> > > BTW, for technical reasons one of the msm platforms still has the
> > > legacy cursor implementation might it be related?
> > 
> > Yeah, msm is one of the drivers I had to change with some hacks to avoid
> > really bad fallout. It should still work like before, but that's one that
> > definitely needs testing.
> 
> Since it looks like you're in a mood to deal with kms reworks vs msm, we
> still have this one to address too :)

And of course this has falled of my radar into the memory blackhole. I
will take a look in one of the forcoming weeks, thanks for the reminder.

-- 
With best wishes
Dmitry

