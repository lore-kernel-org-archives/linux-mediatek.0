Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2A5CD4F54
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2026 07:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHb/oFJuYkkTXytA5kRGkj7lGPcsOEW8fs36CkvCs2c=; b=EjI+zcF0feNvPKT5IT8lw3TcZc
	AEZ3f8+H0Vy61Im0wDLVzovWpOspWITYqeGkl640kujUvrarRJSxGTVr7FFgBbbPULG7G9QWipDOh
	JNPMIoEfP/Fddq2teK+CmAF1OvfwLNDF9RaXq2TWvw9RCjseF8dxHhrD34lkJCbTo5aEu3iB/lb9C
	rSxn1Uy7SO2OS8VGasElxKM5ItW9qWDplhixedXLlTY4CLjEhndGxK35s1wVytOIJ6/HG5uGUSTRh
	tyK7t4ZDXIsZPoo3YivokvdSQvVYgzpFtn/TkRpOz6/EB5OmXoeA1RGBlJveBkStQg79Pa17ocKHp
	BmszrFjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS8d8-00000003SPB-2gng;
	Wed, 27 May 2026 07:24:42 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS8d6-00000003SOD-0QYd
	for linux-mediatek@lists.infradead.org;
	Wed, 27 May 2026 07:24:41 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-bd2d8bb1068so2112836566b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2026 00:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779866678; cv=none;
        d=google.com; s=arc-20240605;
        b=Zi33lcK3d1drf6MTJCMwp6KlSXGvvPeTbcOKgYLN0il2XVVJNip4D4E3TW6qjATc8W
         RmcEVkDANUs0rCvo1sWTKye5wn94fbIkJH9XiloHRK0P5tH51bVZDJ0EYvzA4O89oZ73
         hw5JLobzMGpGwGxY9NY/K84/rcajTD3sglgY7eIvv9Za1pud/tYWJddvLIu3Ogi82KK7
         iAA3YApc6Gpahrx6NEdWu4wF0AbOijYC3RQJ2/ztBCHchQomRf2xVXdGVTa+E/VL918v
         OqgWZAWzuol66BnSFwYxqr8UzsDQjSuPqAsyjoC+/reZtm6Yn6DxV43RVQddsUjZtqux
         y2ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UHb/oFJuYkkTXytA5kRGkj7lGPcsOEW8fs36CkvCs2c=;
        fh=UqqWQKRufbeOwuKy1uGu+cFRnDoQbDsHOEQ1KVcgOE0=;
        b=hAy+TNzLeYTVADaSs0mTfB6VtskLocvgaxCSVtW/GAa4beu0e+8LjSzOfbra6Lgwzj
         yhzfP3MNw/NmNeeGIBr6WMCwc1qGjrBGD5Ze/pcnu20gZT23SxavfM49DjAyfOcHrl8x
         5zAUkeYjkJokMAqtQ9ChztM7s6/DvNtvGCZKu9x7cAvZK3KbUek8+M0MBGKG4/AZa3UB
         7e24obrt2jNK2UkRBDMDJZ3GQmziQk4+jlom+xW9jPHMVIJilvHiioP1iTe40/hBCMJK
         h/yoz2ZyHdl72lcZTPKSe9cM/YU9/tvn2RzwzCUEqaPZjfeI1DJxDBUVDAHURIJoXcbt
         taFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779866678; x=1780471478; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHb/oFJuYkkTXytA5kRGkj7lGPcsOEW8fs36CkvCs2c=;
        b=BA5RNH9S0TtH9v8OfIev4em2i4GtPyDTbcfdy/6s+6fpnJw2at64o5s/iHRlWTAQIS
         kzPRTwBEkgjJN104xnoNssbLZ082WTgmDUYsyerz0NJa5q79hW2mXHWpUjG+O3dvyaNo
         IyF1Q78vfyp2/QwxjbX9X2aVSwLV4qIzEwSmY6lHjoauURkpw/Hokv5hlgKVtF2ccaIo
         c6dv8k2bPi0oBFuBK2mN3MvKapS1GVEIdwPIszJbqZyiobQfKTiIIkmIHiOioFFW1MDv
         tUockRWqkpCKXBXc1nttTG0CLqceZ+XEpEIrNFU+v0hjHDoBgxLAZaHZoI/7wDnteU48
         FvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779866678; x=1780471478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UHb/oFJuYkkTXytA5kRGkj7lGPcsOEW8fs36CkvCs2c=;
        b=Z9mswE7m2fFB9yqyB8XmQlXvz0Qm3QXtyJ6PtfuVBebdgu/WtR2QQyUf7CRrvI1E4t
         jEVqGNFYReM/1ewalgXr+p6SYL4aZT5n1FBwuNtP0Qj4qnOsa+NajQqN+klxLMwfJSwP
         VgRJdVajSsxSO1PnMhfq82leOAepUGd8jm8Jqa6k+AHFVHaJpAvX9tMoYJmtfrm2uV6s
         UXbXHzPgQ7+i8a1zcZdvLM//Lyql5PJEtQwm6yfNzdS91OTj4CUhX2be0NaxMRBoV68f
         C+RLKJ1S4i/qFBfG32bH3iYLdu3hEthBKU4G6LuOK3e9FtfoW8i+HiNNR3+KV8XJaukP
         vGRA==
X-Forwarded-Encrypted: i=1; AFNElJ/xHoQNJ4OwfYTi7nDGiRRs5pSP9L/7TyulNqN0hGKO72iW5Jx0hdDlpJ8DLRJ89Ni9f9lBKt44Fv8K7BTVIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgm9FHvJYwuaPkzvlT0Vs7Ck7rYKMpZuuO9dpPb/oMfbHiGwJq
	rZF2jl6S7LY61qu3mHMZhrfPtVqWRgWAIIeJ4qVzRu+5uFZ53VF98ZgVCGIKt9OUUxp/qfp23/g
	RwH8EqiHfqdYU4JrYka1F8TnVTrrs72GampxAt+2/
X-Gm-Gg: Acq92OEe9bCWuzAX4PcQnqERMzyQpIYDjAXufHGOTwDr0DN4V5HkxvEgfmgMmZqsgVU
	DKqYAQGad2JkEHadMTkjft72M/VQHHiYPj6lYA8O+7b2/9DaU13vqzeRbRiHY0dvwpaD9Knm/If
	andd1Hg/E8Y4Wp4UvRtHmJ0dDZ60NP9W98Zoh04DRudi37V+W1XxesPQF01jsyxyiyHolVX5/mx
	Jzl+NtcoL5wjpmB6qMug3EG8rzRDOvEnWZETxcs7QxzkXoQm5e/PI0b8NuikYTlXsOTGVUfgPSo
	0lNt2JkMNbe9qpuUjxsMgdHjta+grCYmAjpDwzedOra2LM43N2wV9bCdE8cCZPd79EbcortpKL6
	03EZpIYFm8Q6n6Pl4
X-Received: by 2002:a17:907:b59a:b0:bd3:893c:c44f with SMTP id
 a640c23a62f3a-bdd25fd111amr982141566b.19.1779866677452; Wed, 27 May 2026
 00:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260409-feat_link_cap-v1-0-7069e8199ce2@bootlin.com>
 <adgNxaFhbQaxC5E_@intel.com> <u4ononk4cpccx77gvlywtfen5rmyslvr72v7olkhdrjf65aqce@xo777vofhcan>
 <20260413141000.0e190dcc@kmaincent-XPS-13-7390> <3698b69f20481ff9c6fb1002b46f9862a1fdd03d@intel.com>
In-Reply-To: <3698b69f20481ff9c6fb1002b46f9862a1fdd03d@intel.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Wed, 27 May 2026 00:24:25 -0700
X-Gm-Features: AVHnY4JySRBm-2P_CbFmaw_WGo2zCHSC-tgnDBB7us3VQxRDYsfxZLlA23v6OE0
Message-ID: <CAMNLLoQmwW-QkuiSyageGWBeuUDUVZWmWyXRD-vkAGZbg1kTzw@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] Add support for DisplayPort link training
 information report
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dave Airlie <airlied@redhat.com>, 
	Jesse Barnes <jbarnes@virtuousgeek.org>, Eric Anholt <eric@anholt.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chris Wilson <chris@chris-wilson.co.uk>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Mark Yacoub <markyacoub@google.com>, Sean Paul <seanpaul@google.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_002440_180640_CCCE6E9B 
X-CRM114-Status: GOOD (  44.77  )
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

Thank you Jani and Ville and others for your feedback on this approach.
I think adding the current negotiated link rate , lane count and DSC
status as part of a connector property is a great
way to standardize this instead of every driver adding a debugfs for
this same information.

Please find my comments for why OS would use this information as below:


On Mon, Apr 13, 2026 at 6:30=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Mon, 13 Apr 2026, Kory Maincent <kory.maincent@bootlin.com> wrote:
> > On Fri, 10 Apr 2026 00:36:09 +0300
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> >> On Thu, Apr 09, 2026 at 11:36:21PM +0300, Ville Syrj=C3=A4l=C3=A4 wrot=
e:
> >> > On Thu, Apr 09, 2026 at 07:08:16PM +0200, Kory Maincent wrote:
> >> > > DisplayPort link training negotiates the physical-layer parameters=
 needed
> >> > > for a reliable connection: lane count, link rate, voltage swing,
> >> > > pre-emphasis, and optionally Display Stream Compression (DSC). Cur=
rently,
> >> > > each driver exposes this state in its own way, often through
> >> > > driver-specific debugfs entries, with no standard interface for us=
erspace
> >> > > diagnostic and monitoring tools.
> >> > >
> >> > > This series introduces a generic, DRM-managed framework for exposi=
ng DP
> >> > > link training state as standard connector properties, modeled afte=
r the
> >> > > existing HDMI helper drmm_connector_hdmi_init().
> >> > >
> >> > > The new drmm_connector_dp_init() helper initializes a DP connector=
 and
> >> > > registers the following connector properties to expose the negotia=
ted link
> >> > > state to userspace:
> >> > >
> >> > > - num_lanes:      negotiated lane count (1, 2 or 4)
> >> > > - link_rate:      negotiated link rate
> >> > > - dsc_en:         whether Display Stream Compression is active
> >> > > - voltage_swingN: per-lane voltage swing level (lanes 0-3)
> >> > > - pre_emphasisN:  per-lane pre-emphasis level (lanes 0-3)
> >> >
> >> > I don't see why any real userspace would be interested in those (apa=
rt
> >> > from maybe DSC). If this is just for diagnostics and whatnot then I
> >> > think sysfs/debugfs could be a better fit.
> >>
> >> I'd agree here. Please consider implementing it as a debugfs interface=
,
> >> possibly reusing the Intel's format.
> >
> > Sorry, I completely forgot to include a paragraph explaining the ration=
ale
> > behind using DRM properties.
> >
> > This DisplayPort link information report was requested by OSes to allow=
 them to
> > assess the capabilities of each DisplayPort connector on the system, an=
d to
> > guide users from the most to least capable ones. It will also enable th=
e OS to
> > warn the user when a cable is too long or experiencing noise (indicated=
 by high
> > voltage swing and pre-emphasis levels).
>
> The selection of the number of lanes or link rate are at the discretion
> of the driver, or link policy manager in DP spec terms. It does not
> really convey the capabilities of the *connectors* but rather the
> current *link*. Ditto for enabling DSC.

I agree that it would be up to each driver to have a policy
on choosing link rate/lane count and when to enable DSC and then if it fail=
s
fallback to lower link rate/lane count as per the VESA spec.

Currently this information is only available through a debugfs and not stan=
dard
across the drivers. However adding it as part of the connector property wou=
ld
be useful for the userspace, such as DRM HWC to use this information along
with the link status property to understand the reason for reduced
resolutions/modes
exposed to userspace.  This can be used to provide better diagnostics and u=
seful
information up to the end user.
DSC being enabled or not or what was the final negotiated link rate
and lane count
could be used to take smarter mode configuration handling choices in
the usersapce
For example for MST, if usersapce can know the negotiated link parameters
usersapce can be smarter in choosing resolutions on each of the downstream =
sinks
based on the total link bandwidth between source and the hub.

At the end it just helps the OSs to provide better control to the user
in certain scenarios.
I agree that Voltage swing and pre emphasis values can be removed and we
can focus on adding property for link rate, lane count and dsc info
like enabled/disabled, compressed bpp etc.

Regards
Manasi



>
> I don't think the voltage swing and pre-emphasis are really diagnostic
> measures either, but a response to measuring and adapting to the
> link. And if the link training failed, the driver may have already
> reduced the number of lanes and link rate to compensate. So you could
> appear to have the perfect link only because it was so bad at high link
> rate that it was reduced already.
>
> The policies may also vary from driver to driver, and possibly depending
> on what makes sense for the hardware (e.g. power consumption with or
> without DSC).
>
> I think "link information report ... requested by OSs" is vague, and I
> don't think the concept has been completely thought through. I can't see
> how you could present reliable and actionable information to the user
> with what the patch at hand provides. Or how it could work in a generic
> manner across drivers.
>
> Overall sounds like an XY problem [1]. We should focus on what you're
> trying to achieve first, in userspace, and only then think about what
> the appropriate kernel mechanism should be.
>
> I don't think this is it.
>
>
> BR,
> Jani.
>
>
> [1] https://en.wikipedia.org/wiki/XY_problem
>
>
> >
> > Since this is information that OSes will consume on a regular basis, ex=
posing
> > it directly as DRM properties seems the most appropriate approach.
>
>
>
>
>
> --
> Jani Nikula, Intel

