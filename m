Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC89ACA0FFB
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Aug 2025 15:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z3y4v46ZF7X8g5ThZrHBlGjNn21i+MtQxtbp82F3kG8=; b=hTqojENT1YKgeKjolJtLqodu6U
	aNNPevt9eBg4D/h9GXT1gcnmRsGHVsTWizePl5UKtbbar21qqc3ry5TsW2IjwAdQG9D7HpuVdM7t7
	A4lLf1ysJFwPkbxd8HpEzMaioxyev7zX6UNtGftc9umxhnxIACTdbB+7hpnVjGlRpvlZIChBXfIoT
	hj4cIB4FMazOFzzZIlDYNjz+UhFf3DJYK2455Iv+fD1Z9uEdumvKtuH5LrLxOQhXn8M2+w1L2Xo52
	xEz1Mhv3j71OJqEDbMv/U4DI0IBrzA4RIgoyLFQ1z4wvb/UvRqKG9ZpHT6Yx97QT7cV5p1ZR8O/y/
	3EpZ9yVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIOd-0000000FyDu-3Hi7;
	Wed, 27 Aug 2025 15:49:11 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEOj-0000000FHLO-2geU
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Aug 2025 11:33:04 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7f84c17078fso26521085a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Aug 2025 04:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756294380; x=1756899180; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3y4v46ZF7X8g5ThZrHBlGjNn21i+MtQxtbp82F3kG8=;
        b=GkE7Dpsl4vr1hDlHn/niIKUvJaFnqcP/G6axC1q3Ww/enhpiZ+h12Zg8Wx3jBBRp3m
         LcvRo6dJyXyL5wro25msKbddDPBfwHt9/wRY3NN1PMWDVYO6Q920lrvFI2hvTxwDfFyQ
         +TBhY4qffTiDQsmjB64TLm0RVUwqkD8POG7dPe42B7YkG3plYqiEZqO6Bsg4Y9gmnRY2
         wXunvoTKXbY9Y0Te4cOPADuNi4Zj2kepQmp8oLOvxanDxV9Ll0kSaTahZiR57g5BmiBR
         VduRV7aw3K8erB8SVkzONyJLqSDKw2Rh2aM/OX2U9sa+vUWGibpjv04Gj+nDLqr226IB
         MCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756294380; x=1756899180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3y4v46ZF7X8g5ThZrHBlGjNn21i+MtQxtbp82F3kG8=;
        b=hMELpYla7Am4gaje8Oxc0JiT2ntfquAxwrqseMvJOnRet0blJ8xKnjFUHt87Bd8eH7
         +f2wInRwk3s0msEWYyxDP8qRQ4efTfWZZVzGEj10vCf1LSKZNnlt64thwr7qBavbzhT2
         neug8jz698rFQhehihc/paBRctdve4pthEkyJ/C644FX1c/cWYseGy80JC2KHI/I9z1d
         8+R6XogIXXYZ3vzpD/OhpnNoBcguMnWOGJhuuFtCd++/ZqqXdhU0Y5Yw4c9cAJ6+zp+4
         S0MF+dysKAb0WYeQhw3qRH3kyFZAGGBZK8FIxM6r64s5mDGlF2dUywIqFN3x9/P0x0bY
         NJOg==
X-Forwarded-Encrypted: i=1; AJvYcCVpbU/goatK7nq2diCdvBMXMFAT0aXmR/Wb3GReo+hNajtVvV6WIbDPwijo0LzuaK9CAFFgokexK6VjdThocw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQfYcfeZxBJBt8I6YCJJOcm5iGGStwvYjr9TLr23Gz1OcfTbGt
	ZlZkjMVaSoynZkzIy6xS8hvui8c/DW1OBz0Sjj0lkvAT68KYaFqPSzTcO/8OeIe8K0IfDuc/Ota
	D61i0045ceBwMguAg3CLSmZRBpzPAF0BOTxPNTaisYw==
X-Gm-Gg: ASbGncuT6u2SjQ2p5BeAET1Eo/ppEik5ivMQUuFh1J36p5GBOVPDaiNLCOXWXBO2Iqa
	PeXaW5MmbfeyeqllJFuAzqy8hxX2GpE8hfNhFscTRAM/4WQfFhUlrGnPwI9QPf4kNSu5GjyI0Lo
	vgwVJFgoOU9r2wmMW5653ryABBc283BD29HO/RQmk57NhlwucBZaCZOUz9YtIosMdGZrrVYvOvp
	5PdCRHm1QaEF3S0
X-Google-Smtp-Source: AGHT+IGmmuxWMn1RQng0MqU7LfWDmGXD9wRFwAweLJvIB7bsSHwPntqlQ+JKaDysNEyaOvC876Q504deR3IuVc5pgao=
X-Received: by 2002:a05:620a:2804:b0:7e8:1718:daf4 with SMTP id
 af79cd13be357-7ea10fc7a07mr2104471485a.16.1756294379779; Wed, 27 Aug 2025
 04:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com> <DCD62EFHFCEB.XEOPUPKZQ5XW@redhat.com>
In-Reply-To: <DCD62EFHFCEB.XEOPUPKZQ5XW@redhat.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 27 Aug 2025 12:32:48 +0100
X-Gm-Features: Ac12FXz3D5zUTg3Df1XjwtCpaINdk3SCVFUs0YESiGpt04Vrw7Xa6CeoI-p4LK4
Message-ID: <CAPj87rMDvaj28+h9fHkH+bZYH43N-dS_XHu9eomDphjXmPqArA@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Alex Hung <alex.hung@amd.com>, 
	wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
	ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, 
	contact@emersion.fr, mwen@igalia.com, jadahl@redhat.com, 
	shashank.sharma@amd.com, agoins@nvidia.com, joshua@froggi.es, 
	mdaenzer@redhat.com, aleixpol@kde.org, xaver.hugl@gmail.com, 
	victoria@system76.com, uma.shankar@intel.com, quic_naseer@quicinc.com, 
	quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st, 
	Liviu.Dudau@arm.com, sashamcintosh@google.com, 
	chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, mcanal@igalia.com, 
	kernel@collabora.com, daniels@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_043301_708348_217BA7D3 
X-CRM114-Status: GOOD (  20.14  )
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

Hey,

On Wed, 27 Aug 2025 at 12:17, Sebastian Wick <sebastian.wick@redhat.com> wr=
ote:
> On Fri Aug 22, 2025 at 8:36 PM CEST, N=C3=ADcolas F. R. A. Prado wrote:
> > Introduce support for a post-blend color pipeline API analogous to the
> > pre-blend color pipeline API. While the pre-blend color pipeline was
> > configured through a COLOR_PIPELINE property attached to a drm_plane,
> > the post-blend color pipeline is configured through a COLOR_PIPELINE
> > property on the drm_crtc.
> >
> > Since colorops can now be attached to either a drm_plane or a drm_crtc,
> > rework the helpers to account for both cases.
> >
> > Also introduce a new cap, DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE, to
> > enable support for post-blend color pipelines, and prevent the now
> > legacy GAMMA_LUT, DEGAMMA_LUT, GAMMA_LUT_SIZE and CTM properties from
> > being exposed.
>
> Please note that you'll also have to deprecate the semi-standard
> Broadcast RGB property. It serves two purposes at once: it changes the
> values between the color range (similar to COLOR_RANGE but at the other
> end) and informats the sink of the range as well.
>
> So the post blending color pipeline will need something like an inverse
> COLOR_RANGE op.
>
> We will also need a new connector property where user space can select
> the color range, which does not change the pixel values, and only
> exposes options that can be achieved (default sink behavior, full range
> infoframe, limited range infoframe).

As a note to others, the follow-up is on the 'pixel_encoding' property
thread here:
https://lore.kernel.org/all/DCD5VIFRKFB9.1KHIZI3ASID2I@redhat.com/

I think we should keep discussion of those properties there. :)

Also strongly related is the proposal to add range/encoding properties
to writeback connectors; analagous to the inbound properties:
https://lore.kernel.org/all/20250813170542.331206-1-robert.mader@collabora.=
com/

I've talked myself around into thinking that the writeback-connector
property is better than trying to use colorops to do the transform. On
the hardware I've seen, whilst the CRTC output pipeline does have
colour-transform properties, the final yard of the encoding (YUV/RGB,
full/limited range, primaries, etc) is in fact a per-connector
property, so I think it makes more sense there, as that allows
usecases like RGB display output whilst streaming to YUV writeback so
you can push it directly into an encoder without an intermediate
RGB->YUV conversion step. But again, I think conversation about that
would be better on that thread rather than here.

Thanks!

Cheers,
Daniel

