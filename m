Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E180C25B7E
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 14:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTBRkgXOI2cSvM6NfPA0aB0deUzO1EPx7YPaiQUSb7Y=; b=nq/Lfa921JtvPtRsjgTBqhRqbH
	udy+8WH4BMAIlZjs5r8NcuqWzFnEUGdSX1HsOr+ZuQdXaIDLyjICUnr6RC3+RsAFksCt/+7gJVfpV
	fVhT12Kjgo676EVolZdLboEkesVm6ggUi4+AWjhux3Bw2/sSNE+yDqFDpo3L2sWAN6a0W9iAd91fw
	wIfUoF4vfqNa2xRUZjePvPtNOwwiu7jhwuQq+YbU5LeaXDxG/53wdoj0QTm32kB/M/Ev5nqTAuQ1b
	v1siqzPoGTFCDLCJ7KcAdBA78jI+wUsP82HL//J19rAsMAGbfStx/1H/eUudo8htryyNLTRZTjAky
	+j1udwGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD3iT-0000000AaWH-489O;
	Fri, 31 May 2024 14:58:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD3iG-0000000AaPx-2uPn;
	Fri, 31 May 2024 14:58:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 85C54CE18D9;
	Fri, 31 May 2024 14:58:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50720C116B1;
	Fri, 31 May 2024 14:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717167511;
	bh=g1eGXHdN0kkF++pfgnz1WIShz96T3A5ZcHkmqtw/Loc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmMz+4zslnz3CoeqQnw4R6MTFsDQPLnEs6swHFG8QQF9SYpF/35igdu+dIagmM9yN
	 4A2Vkpnbrn+D8A9ONTwmM/yxSAtY+fB3+4wYewAn2xHme9a+bWLxYIb9ICJC7X+Q6s
	 g/hBxxws2HElAZ5XTmy93gd0tFHDbycLSa4KrBHw7AUDGnLsGelmqYvdICYQyGkT0w
	 UHtXY3hwlsppDvSryW6PhXu0rMyPGWmoOhnLjgboATs4lqNqACr2u9nMU+NTzMyzhS
	 80r0loHtgrlHoxZbJ2b4co1qT7uj27CurSX70Lf/7mds00sRKp3Hv2BHX0n6CWe0nh
	 i9ikqd5rw7bBA==
Date: Fri, 31 May 2024 15:58:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: mediatek: Add mt8173 mfgtop
Message-ID: <20240531-rubbing-gala-4104e3051425@spud>
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-2-wenst@chromium.org>
 <20240530-revisit-profanity-889f1bcae21a@spud>
 <CAGXv+5F=AEE7t=YQ0hNGtV9rbVBm75D=ftJdZKwD_JmUW9gQWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ys2BwcK/uLhX00G4"
Content-Disposition: inline
In-Reply-To: <CAGXv+5F=AEE7t=YQ0hNGtV9rbVBm75D=ftJdZKwD_JmUW9gQWQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_075837_241734_C7A81D90 
X-CRM114-Status: GOOD (  12.10  )
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


--Ys2BwcK/uLhX00G4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 03:29:06PM +0800, Chen-Yu Tsai wrote:
> On Thu, May 30, 2024 at 11:43=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Thu, May 30, 2024 at 04:35:00PM +0800, Chen-Yu Tsai wrote:
> > > +        #include <dt-bindings/clock/mt8173-clk.h>
> > > +        #include <dt-bindings/power/mt8173-power.h>
> > > +
> > > +        mfgtop: clock-controller@13fff000 {
> >
> > The label here is used, so drop it.
>=20
> Assume you mean _not_ used. Dropping. :D

Correct :D

--Ys2BwcK/uLhX00G4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlnlkQAKCRB4tDGHoIJi
0giRAP94G90Cq94R7lpitEm0sZWkvKgob2eHruL8ul6FkP4EuwEAnm88tB8IKALh
7teTfUoOYj4sOcrhC/d5sE1XgPb58g8=
=BRoX
-----END PGP SIGNATURE-----

--Ys2BwcK/uLhX00G4--

