Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA84C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 13:48:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6BB1207D3
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 13:48:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e6Wqoss9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4k39ZFa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6BB1207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=koNo9RRi9GWxTx3rYQv4wzJ5HuRXEE98HD0bGcYjB98=; b=e6Wqoss9wNeenpsXHggH4C4uI
	4/ImJgFqe7UzCTQjoRJTgkoIhht8N2+kUmotZvJmkBkEJgtbMWjjkraBCuZueX0vVQCXACASOqCfg
	FBv6zD8k2xcjQOHVg0SAD4NUUo/sLW+KN/J0aM+4EmH4g0QzhHuLHkYMfVZ0hKvVMGUx/4qKrdChA
	Vd1xfVdp7RuKAXZBA9plaaHQunFWA+yalHJNamDQOarYGeiV/ufYkPc4Euzc3J7bvG96szCY6ATUD
	jjY1vQRmB9dCJtLEhpLtiWfqJRSp6+rxsYt/yXXR60QINSFVTpPFcNTiCuSVask+YHNg4DwPWtzzg
	0R3F6jKaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeItS-0007Wm-Ot; Thu, 28 May 2020 13:48:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeItB-0007KC-L2; Thu, 28 May 2020 13:48:06 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 900B4207D3;
 Thu, 28 May 2020 13:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590673685;
 bh=hCc/4WkpOoMnYzAs7vLH2tpFPjfk82hCbKAhbeXkNI0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y4k39ZFaQ41ExRlY1FpyEQJR61aEW8XCAqj3dq0dkZ3PCbvGQ8q/L0EwtUR+BdXqt
 b+coz6x9QHt1uSD8fvSAyy9Ku/2ke4nRaAGrNDGhCFHwPI7+CSialN6cbAZJ9geC2r
 dKuhxH11yqWoiaq+GxLW8DRut8Peg/xIRNbM6Fpw=
Date: Thu, 28 May 2020 14:48:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/2] regmap: provide helpers for simple bit operations
Message-ID: <20200528134802.GE3606@sirena.org.uk>
References: <20200528123459.21168-1-brgl@bgdev.pl>
 <20200528123459.21168-2-brgl@bgdev.pl>
 <20200528132938.GC3606@sirena.org.uk>
 <CAMRc=MejeXv6vd5iRW_EB3XqBtdCWDcV=4BOCDDFd4D0-y9LUA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMRc=MejeXv6vd5iRW_EB3XqBtdCWDcV=4BOCDDFd4D0-y9LUA@mail.gmail.com>
X-Cookie: Small is beautiful.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_064805_710725_6D446DC5 
X-CRM114-Status: GOOD (  10.75  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============4982957733865228606=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4982957733865228606==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ns7jmDPpOpCD+GE/"
Content-Disposition: inline


--Ns7jmDPpOpCD+GE/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2020 at 03:32:40PM +0200, Bartosz Golaszewski wrote:
> czw., 28 maj 2020 o 15:29 Mark Brown <broonie@kernel.org> napisa=C5=82(a):

> > Why macros and not static inlines?

> The existing regmap_update_bits_*() helpers are macros too, so I tried
> to stay consistent. Any reason why they are macros and not static
> inlines? If there's none, then why not convert them too? Otherwise
> we'd have a static inline expanding a macro which in turn is calling a
> function (regmap_update_bits_base()).

Not really, I think it was just that they're argument tables.  It'd be
good to convert them.

--Ns7jmDPpOpCD+GE/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7PwREACgkQJNaLcl1U
h9BZlQf/Rnk3QvRXUU9UWRrY62o3tOtAkM+YDOn1qkCahCNlR3xn6spu/jZ2xpm8
wtG0/ml9T9EeXbWZU0n2vWYQowTecwv3zFcQgHRtEaN+Q0F1pZeBoGo7Hazyp47Y
2UI0x5pTwKgEs6xwxQ9hDWy9KhGgLODt7MWUQv8T8m7XxDRmoCh9MbMAiEm2GPLb
Vt5FGW0iBTVJh/h0J84HpA1BY1bXPFBwICbqISunBPso9Gj7D5YzmK9iKvz4qW+g
eCfgV0eYbRbMCcL7UG9jOWOZxuznG+BfLNmzOLl/eydOppXcHVWhah9Q8Q8xsdqG
+R17K+lbB6MGwp7pU0Fr2sp98g43Cw==
=Zc21
-----END PGP SIGNATURE-----

--Ns7jmDPpOpCD+GE/--


--===============4982957733865228606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4982957733865228606==--

