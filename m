Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 120D8C30658
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 13:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lt9CFtU6VQjl5rQikn0RMmEwksOG2DhuVbtC+FM5Dq8=; b=Ep630iBZywv3FU+om8aNCsZhoO
	jLApvvfhUrzE0L3dcKj/iP0jUFamsHkdLBAXxAlUZmla25Dp5M8whlO973XAehuljUy/sTgTXAFrI
	Sah1CrwcGR75hgCJSrxtix6xFd9GNnohz4sZSr/nmvayZaZE5K8Mn5MMPps3aLyOhcahJFbT1fUQc
	H7Rww42UEPWSt383RxvgkNttA1/4Pt4SISq/kYR+i22og/HZzqdOD+EsnpjhrbqHBfXQ3Ea/g6/59
	XIrxiFnGrbOigHDgNcDZIrNqjPcSkz5YmlxdHDXJNkHGeNiP/MlqNn5b58nB0IWgLismxrgZKgasg
	yAj61LxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNC6w-0000000DtMS-1TMN;
	Fri, 28 Jun 2024 13:57:58 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNC6s-0000000DtL1-2l3K;
	Fri, 28 Jun 2024 13:57:56 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-52cdb0d8107so794800e87.1;
        Fri, 28 Jun 2024 06:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719583073; x=1720187873; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lt9CFtU6VQjl5rQikn0RMmEwksOG2DhuVbtC+FM5Dq8=;
        b=PaVofOwbjfMThL9Wa957x3QtBJOnKZsONd6ysRmrmaH62QYSlEris7l/MGLieDujfO
         iDYIdJhVFY2A1XHZXZp20ljuZn3d+9DH/KLRN+6VWwlG26Pv3dA8CSjKGCy7Ha5jccmZ
         hjFCew8+/Dh8uxXw5SbNWtbb4pzPKKhGza7Mv8n/8O5/f4aO6dTvazwCk58LAtmXkN8j
         KeSsPQaRMp3TQEqhJBKLFXkk71krNNbjwaoasERNv+7tezPKGC8O6AeXpaNITSgjaj4X
         OaRyg0KLaSDnhlFfRIa6zQLAP8QeVbwA34OHMefFA8kzoSZ7OmXspsomtX8cbDRIG7/3
         2yBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719583073; x=1720187873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lt9CFtU6VQjl5rQikn0RMmEwksOG2DhuVbtC+FM5Dq8=;
        b=TCuQBGb28oB0YOAlPqcu7TMHb61xyNlZjchvSD+GrZZtvc2hVMSKt1tjPUebrfrWDK
         cNOn2sCDCC9UAjClr6+RDRUoj4OnVniqbQpC/VEEGdSpnPeoZsQGCszmCsJ43+Bh61d5
         ZSkHZz+sr/k0mVYlTY18IZFgF+xF2ocsgr6jT4M7aKS4DTz90IwU2YrcG4ra32xo7ruE
         MXX/zLprUzVQ4O5T6B03z8Lev0dzPsxsZESDmqTncnMSDHIMpzGsVU/HpEoTx/Agy4Mo
         Wg+Ev9s9pgymKtYPacTxZlUNvoEj5zr4XgVeTpMtYQG9p8KQAJjJs+Vmd0Af3lAGKxn6
         CieQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyTb9/dnyPPsNd7EIxSe/ytPj2FDsoalW7GvxPxEn88HYM/mYc27PMPB9L4itXY4hhkw1fSsNwEkasQ71dUJqIpE+wmvg690P0g2JaPI2d/bKf1oOlZUc/FXjWmcqNwNiwOFYzmR0DyQDVNfB5uAlaHq5A97fVrro=
X-Gm-Message-State: AOJu0YzgtgownbQBA8NxZHBPM28+sZccwho0iOA18c5Upzj1bSNmLtVA
	QnDSdRBDIs+2XPQucrbwhJ6atx23KI11vrRRLKZYU2BLm//CkdYDLHKn8g==
X-Google-Smtp-Source: AGHT+IF/NqMEU+y8hWP3NpUQFYLF4+7Vv+2H8/MUU3lKxcXQyxo//MvGoCXc6K8zeKDidYtxCSRYXQ==
X-Received: by 2002:a05:6512:1304:b0:52c:fd49:d42 with SMTP id 2adb3069b0e04-52cfd490d9emr7491193e87.14.1719583072185;
        Fri, 28 Jun 2024 06:57:52 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd784sm2435261f8f.7.2024.06.28.06.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 06:57:51 -0700 (PDT)
Date: Fri, 28 Jun 2024 15:57:49 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: "mripard@kernel.org" <mripard@kernel.org>, 
	Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
	"quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "jkardatzke@google.com" <jkardatzke@google.com>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "joakim.bech@linaro.org" <joakim.bech@linaro.org>, 
	Youlin Pei =?utf-8?B?KOijtOWPi+aelyk=?= <youlin.pei@mediatek.com>, "logang@deltatee.com" <logang@deltatee.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	Kuohong Wang =?utf-8?B?KOeOi+Wci+m0uyk=?= <kuohong.wang@mediatek.com>, 
	Jianjiao Zeng =?utf-8?B?KOabvuWBpeWnoyk=?= <Jianjiao.Zeng@mediatek.com>, "contact@emersion.fr" <contact@emersion.fr>, 
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "willy@infradead.org" <willy@infradead.org>, 
	"pavel@ucw.cz" <pavel@ucw.cz>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"tjmercier@google.com" <tjmercier@google.com>, "jstultz@google.com" <jstultz@google.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "robin.murphy@arm.com" <robin.murphy@arm.com>, 
	Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"ppaalanen@gmail.com" <ppaalanen@gmail.com>
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
Message-ID: <fh37zowioui7hcabzrco7xqxttze2lufijq67wbzylah3e3ry6@ahwnr2rspt3l>
References: <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
 <ZnxWWtdShekGSUif@phenom.ffwll.local>
 <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
 <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
 <20240627-impetuous-aboriginal-cougar-cdcbbf@houat>
 <w3xcvakoytubud6dw4wxr6ntbe6uvfrldihnd26vai6uyyto6j@vcq7gizxolag>
 <c96f82e3-bbd6-407e-a71b-3a794a56585b@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="reicrtljkywsfrhv"
Content-Disposition: inline
In-Reply-To: <c96f82e3-bbd6-407e-a71b-3a794a56585b@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_065754_714614_2F9AD94B 
X-CRM114-Status: GOOD (  49.34  )
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


--reicrtljkywsfrhv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 02:34:24PM GMT, Christian K=C3=B6nig wrote:
> Am 28.06.24 um 13:47 schrieb Thierry Reding:
> > [SNIP]
> > > > The reason I ask is that encryption here looks just like another pa=
rameter
> > > > for the buffer, e.g. like format, stride, tilling etc..
> > > >=20
> > > > So instead of this during buffer import:
> > > >=20
> > > > mtk_gem->secure =3D (!strncmp(attach->dmabuf->exp_name, "restricted=
", 10));
> > > > mtk_gem->dma_addr =3D sg_dma_address(sg->sgl);
> > > > mtk_gem->size =3D attach->dmabuf->size;
> > > > mtk_gem->sg =3D sg;
> > > >=20
> > > > You can trivially say during use hey this buffer is encrypted.
> > > >=20
> > > > At least that's my 10 mile high view, maybe I'm missing some extens=
ive key
> > > > exchange or something like that.
> > > That doesn't work in all cases, unfortunately.
> > >=20
> > > If you're doing secure video playback, the firmware is typically in
> > > charge of the frame decryption/decoding, and you'd get dma-buf back t=
hat
> > > aren't accessible by the CPU (or at least, not at the execution level
> > > Linux runs with).
> > Can you clarify which firmware you're talking about? Is this secure
> > firmware, or firmware running on the video decoding hardware?
> >=20
> > > So nobody can map that buffer, and the firmware driver is the one who
> > > knows that this buffer cannot be accessed by anyone. Putting this on =
the
> > > userspace to know would be pretty weird, and wouldn't solve the case
> > > where the kernel would try to map it.
> > Doesn't userspace need to know from the start whether it's trying to do
> > secure playback or not? Typically this involves more than just the
> > decoding part. You'd typically set up things like HDCP as part of the
> > process, so userspace probably already does know that the buffers being
> > passed around are protected.
> >=20
> > Also, the kernel shouldn't really be mapping these buffers unless
> > explicitly told to. In most cases you also wouldn't want the kernel to
> > map these kinds of buffers, right? Are there any specific cases where
> > you expect the kernel to need to map these?
> >=20
> > I've been looking at this on the Tegra side recently and the way it
> > works on these chips is that you basically get an opaque carveout region
> > that has been locked down by secure firmware or early bootloaders, so
> > only certain hardware blocks can access it. We can allocate from that
> > carveout and then pass the buffers around.
> >=20
> > It may be possible to use these protected carveout regions exclusively
> > from the DRM/KMS driver and share them with multimedia engines via DMA-
> > BUF, but I've also been looking into perhaps using DMA-BUF heaps to
> > expose the carveout, which would make this a bit more flexible and allow
> > either userspace to allocate the buffers or have multiple kernel drivers
> > share the carveout via the DMA-BUF heap. Though the latter would require
> > that there be in-kernel APIs for heaps, so not too sure about that yet.
>=20
> Yeah as far as I can see that would be a perfectly valid use case for
> DMA-Buf heaps.
>=20
> One question here: How does the HDCP setup work on Tegra? From your comme=
nt
> I guess you pass most of the information through userspace as well.

Well, we don't currently support HDCP at all. I do have proof-of-concept
patches from a long time ago and, yes, judging by that we'd need to
control all of this from userspace. The way I imagine that this would
work is that userspace needs to first set the "Content Protection" and
"HDCP Content Type" properties and wait for the state change. Once that
has happened it can go and allocate the protected memory and start
decoding into it and then scan out from these buffers.

> Or is there any info inside the DMA-buf for this? In other words would you
> also need to know if a buffer is then allocated from this special carveou=
t?

I don't think so. It's possible to scan out an unprotected buffer with
HDCP enabled. It may also be possible to scan out a protected buffer
even if HDCP wasn't enabled, though you would obviously want to prevent
that somehow. Not sure if there's a common way to do this, but I guess
in end-user devices you'd need a fully trusted boot chain to do that in
a compliant way.

It's been a long time since I looked at this, but I seem to recall that
at the time all software that could do DRM-protected playback on Linux
was proprietary for reasons like these.

Thierry

--reicrtljkywsfrhv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ+wVoACgkQ3SOs138+
s6FYRg//ZUUMosKJeOf/03Cgop+FIjgV4O7IqRtSAfEN/qoxOIEVEe0GYmr4XT07
XmvxGHLuPu+uMb/mJneL/1i/GUcgJCas5qtVNZvMTieifqhIl4CzoCIu+HLNgotN
HmEAxVC84SG/nLpogfy5FRz2qnP1vZb7G+8pJADjqqmCj//6p+/xFEZM04iaM5aQ
RAX47cvOq8t/d83lphT3oexDkBmVA5yOnTptGf0+TCyjDp3mrFqECDMSNKDysqqc
t2HrGUIsG+hpoAXxDrMSRSPwWaFXJwHqXOzoCRWY5eFpL6+3aVeYag00D3rhHaF5
E3J6HOq0UXftdkH9sb2dnqJhWb8zi8GVx0EsVhH2j6xXC0d6Afd+y8JxhWebkjp1
yuASrgIzvoh3PAsXWDs54MA+0q/QEDFwX3ePC4XKTVhR7XD3h7TkQ/i8dRH6mu89
tY7FUN2p/Yr3EIviljnSkwqgEe/3aH3rgHyTCHjSYOY1coQgSf8c5gs/J95G5FYD
Y7ccQGGfiAYxvHlxkZSRVNpGLyrKeQYr2GvWE1fPnEtEGINdXa3UNXM+N01CoUlv
ch2icB9764M1/Eh1Tso3ymqdwVRq7bfoE15/efyLBb5bW+UChZTs9f1F6PSGb0sJ
pppVGYLhBLuMSb2NSRud/tly7J6Wz8gcD8V0FnbJ03hjIRRTR3w=
=Ib2U
-----END PGP SIGNATURE-----

--reicrtljkywsfrhv--

