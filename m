Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E05C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 11:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Mime-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3vJkoh0Y88E8xelvHUeCB5ZFGBjLcpHSC6lZET6ARl0=; b=MtYGAYRvHf8ooIuLnzI+G8LItm
	C9RNvf0BK1r7wztpOQnrSvspOp2KAHCT+VjQRHjc0Yt+1iK7yaNNsPEXZErDcbTxL/6lk805e/UDz
	qoWI8Jrm+yYNAwzzStK1+cl3D24VduJ4/AnM2rDCfbTlqo3uxVnc9RWWGRBHYE4Rlh9K6vru+NYSS
	8H3ex1xpQ/nWS4wvbpuJFD7Rq5IUuUuFFLEDYrr8NliV30YsaxkwbWo+jokrHjW5nf/Tzy10CLpJu
	S4L8bpVCoiuCq5vB1hV/l9ZmsTA7jvAovO3OaG/eojwvF/wC90UoxRjMocCJ63Kd1OON5CtQY9gL0
	F21Xa4dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxmQA-00000005SVQ-3HNU;
	Fri, 19 Apr 2024 11:28:46 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxmQ7-00000005SUB-0DU2;
	Fri, 19 Apr 2024 11:28:44 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a51a7d4466bso203844566b.2;
        Fri, 19 Apr 2024 04:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713526120; x=1714130920; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3vJkoh0Y88E8xelvHUeCB5ZFGBjLcpHSC6lZET6ARl0=;
        b=XMnF+0mBt5CHT5ruf0j0EIlO0quMMBNuEd5jVSlKB/vdJxw1ftE/67deSCpXU2SodT
         Q1IEc4vH3+TpcM4p5cJNxmuY59NrBPyJr5miTBhtYoN2/51kHXNklgU74GETpxtBPF2w
         h1xssYV3Qw0kWKo0HwOi9VGjFZ0T2q1VVCRlQx+WDnSNt1ysjvHggW7CjzExuOtmh+Dl
         3q7iaobqftY+k/usgtYPPwSu2wKFIM3iycX9P9HUmsaQUeTzsKTF9+1gEwsgCRRgKsBp
         T1X4rElD4jElXoY4tXeiXGgubi2Jlr8DEgHBXvtgIjQDvKdcfTlsm2NVzrS4/rrbMM4D
         YHbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713526120; x=1714130920;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3vJkoh0Y88E8xelvHUeCB5ZFGBjLcpHSC6lZET6ARl0=;
        b=N5t/55k84ecuJddo4hVXYh9GDhNwxtJWWLY0D4a2iL31812LC1+cvC9rmx0IGQ/Mzh
         Q3mOHtJkJkO55KXjYNLAPaDNkjHmnPgmUNhZDSXt1jAcPra5BctT+qECLtMLa7oVLnKl
         yW/lBbhNPr+bcLnSiXst1JUx7WS41+ZDw+DhZFpz2ZIB7lg+PfUWd6Q7/dYbO3rHHf7O
         AkX6VMW3puxVlOMUWHfWd7Ebvs2b7BhXFmQNb6rYjxQFFk8jKZ7yzAjfVbLPJLdnZpDW
         WavQSk6QGHxh1KMS2izoHc3VYE1uRa8yS4022boxgORCha8Cbp6qXdMaNMcl+oR3OKqi
         aSuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWI0IoZriY7RzkRxp4ZjZJUhwJyK88VoIyd9h7EnelVwzOdTSjdnT8WpXpxZ/0JwIqoP8Iv+JWxbSYyOYTEE1hFfG5NiaJpK7sFj6o13rZzzvEDeFEFU70PnY/TnBkDPJFxzfF4ruGlE+enDNl1C+b89mBe6eVquRo=
X-Gm-Message-State: AOJu0YxK0TiM4deD1LMQxLSviA0wteupzBcHpl3JIgKqTaL9fa2vIRTM
	X5o80CxT91+XBzd8C+haU3L1vcrfL0q2sCUwo7KSNu9xiIlD8JAV
X-Google-Smtp-Source: AGHT+IFKiwmp4FLKAWcTXgidfN19IfMXqqvkx3T/mYwog55rvnWpsnKvb8Yadb5rRXuT3dRv4qU4Xg==
X-Received: by 2002:a17:906:2a4b:b0:a52:1770:965 with SMTP id k11-20020a1709062a4b00b00a5217700965mr1248210eje.42.1713526119786;
        Fri, 19 Apr 2024 04:28:39 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id bi14-20020a170907368e00b00a5588ed8fa2sm552797ejc.113.2024.04.19.04.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Apr 2024 04:28:39 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=cd669ce6bdd8f9700a6a46cb06d3d090071a64c757641859cb60bdf1475c;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Fri, 19 Apr 2024 13:28:38 +0200
Message-Id: <D0O2BBOL89ME.QEWHYL0GV4MY@gmail.com>
From: "Thierry Reding" <thierry.reding@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>
Cc: "Frank Binns" <frank.binns@imgtec.com>, "Matt Coster"
 <matt.coster@imgtec.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Chun-Kuang Hu" <chunkuang.hu@kernel.org>, "Philipp Zabel"
 <p.zabel@pengutronix.de>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, "Mikko Perttunen"
 <mperttunen@nvidia.com>, <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 0/4] gpu: Convert to platform remove callback returning
 void
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <cover.1712681770.git.u.kleine-koenig@pengutronix.de>
 <xqwcrxfrg3ogplh35c5etl6nbzw6zueilm4h6euh7bnpszyir4@6dtn5qdvijv3>
In-Reply-To: <xqwcrxfrg3ogplh35c5etl6nbzw6zueilm4h6euh7bnpszyir4@6dtn5qdvijv3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_042843_131808_A00AAA4E 
X-CRM114-Status: GOOD (  21.21  )
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

--cd669ce6bdd8f9700a6a46cb06d3d090071a64c757641859cb60bdf1475c
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Apr 19, 2024 at 9:20 AM CEST, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>
> On Tue, Apr 09, 2024 at 07:02:47PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > with some patches sent earlier[1], this series converts all platform
> > drivers below drivers/gpu to not use struct platform_device::remove()
> > any more.
> >=20
> > See commit 5c5a7680e67b ("platform: Provide a remove callback that
> > returns no value") for an extended explanation and the eventual goal.
> >=20
> > All conversations are trivial, because the driver's .remove() callbacks
> > returned zero unconditionally.
> >=20
> > There are no interdependencies between these patches. This is merge
> > window material.
>
> I wonder how this series will make it in. While I would prefer these
> patches to go in together (that I can consider this thread completed in
> one go), I think with how drm maintenace works, it's best if the patches
> are picked up by their individual maintainers. I guess that's:
>
>  - Frank Binns + Matt Coster for imagination
>
>  - Chun-Kuang Hu + Philipp Zabel for mediatek
>
>  - Thierry Reding + Mikko Perttunen for the host1x driver
>    (Note there is another patch for this driver set at
>     20240409165043.105137-2-u.kleine-koenig@pengutronix.de that is
>     relevant for the same quest.)
>
>  - Philipp Zabel for ipu-v3
>
> I plan to send a patch changing struct platform_driver::remove after the
> end of the merge window leading to 6.10-rc1 for inclusion in next via
> Greg's driver core. So please either care the patches land in 6.10-rc1
> or ack that I include them in the submission to Greg.

I think the latter would make more sense. I'll go ack those patches.

Thierry

--cd669ce6bdd8f9700a6a46cb06d3d090071a64c757641859cb60bdf1475c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmYiVWcACgkQ3SOs138+
s6EMWxAAuBhTV9ovczgI1JfXW9dVlwEMXj4ZN4Wo303HNjKbzE/U9v17jp2EZP+t
s35e09Yav10cM7qTAnoTkHG/O7TbJ1j1eFN0dYuog+C28+u3a7FKYFzjxrDdohFD
nWXufe9EklSmTeDiA9LVY/hQgiebLT6zHLh4QxIPwhE2HpnZcT9JOq5Q95w9HYY+
wMSiJ0eQCGLCWgtDGZoWtCPNkp39ViRF59soniQuEHhm5pXc5eFfYbUOP940CJ44
8UWu69np3LlX7Gx0TMaqIuzlBWaG+MfU7vBI7hnyA5VgSjcuT0iEJwFW6lZAeBgm
I4h1xdDIMbrHoVIXqj81dZWFTCO6FILwyb7X1sEKAWqN/axoa6C/PPt4UrURzPfD
mMiWc006q+mYajFqk2S31q/WBfssrmC4F4boDphofmJHmsKT0z9Oj8jCpPM8+RHP
lpATu13Rq+zzNIGeqpodAvPEQrX8QGpE9xxncQwWPiXJ7PnG1UdZoiERW5hdE8zN
XcaZB7crWn1A0NbseWFFAb09WoPQmvR2JIO8gzsQ1a9CKs0UK4O8UNlfwnJp7suo
TkG+kqH5kUunGRVpvJbF9sS7raVtB0HRN28xWCY/jFpd0nmfi1tcfxcLBJhDBLRS
KtLx+oMwRhWxpalupIX1hLGY+QmcLxEi4tjYfCd/vHRoAShnV0Y=
=abck
-----END PGP SIGNATURE-----

--cd669ce6bdd8f9700a6a46cb06d3d090071a64c757641859cb60bdf1475c--

