Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F30CF6D3A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 15:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7kLFuygurNTZStrxyi8w+svXqV/AYfhA0SakSKKL+gc=; b=KRyL68yswSs0uGpncK72qK54kB
	9Wg/8jRx/juH9hIGXAHue2QSn7KPSemSmVYrlUrbosttpoVXO3i3+rUA2X2UVBsgvGwfMUmeyiOeo
	9fHUwbNkUGGLwPAnD5YjwJ6RDKCTdvqMonqlfcC9zRpnNbODWeS9yjjAlsF7yt8drKuHBkNWHv536
	frPEu/bE8S9gdtyw0xcZoZO2USgTmFmze9BJANERb+htnL4ipXU2WxXqyaeM6t95AF2XlUNlD1KO2
	jbQ/Du851bd9uMsu+zbzf/u979PBXVk8JmmT+ZMnyO9BbDZSaqhft2pMC8aFCER2HTnjKi0/5NaDx
	Rlo24qRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1Tb-00000006iwx-2NVC;
	Wed, 02 Oct 2024 15:41:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1Pn-00000006hl3-20ey;
	Wed, 02 Oct 2024 15:37:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD8635C3E58;
	Wed,  2 Oct 2024 15:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7E8C4CEC2;
	Wed,  2 Oct 2024 15:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727883442;
	bh=MT4X6dcUBubM7lv3hZ3oqvwfLote9SJ8fD8+SCx2gBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U4xcgL3GFikjK83sb/zEk3muR672O4FB+EWjIvN1EEV0kUm4SyD2xrOJXtA2aT5p9
	 rQVMEm0ENcfjYKOVo3/gQs/7/tPnRY5rOKXeGjyaAJMHtu4nXx4hHN2lXeZgxoT81L
	 R+p/DzvgaPRn8dUhkxF7L5OkWXR9Zu0IQgIOMc2VE72/mczuJFLeFvpnUnqERk1v4K
	 fyvqSnq3TBG1MYWD+YQl+fXtsnjlPDomZTi5spljfD9e7k7ZdzZ4vLrcjFFvsh++OD
	 f2RoU6509kT+8jhnpFaI0S4rthE0CS5eLXeBVbvpbgNshz4xzUaQcOzzAXPEy1oJF4
	 7XwOUUSsFmSZA==
Date: Wed, 2 Oct 2024 17:37:20 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lee Jones <lee@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	ansuelsmth@gmail.com, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v5 4/5] pinctrl: airoha: Add support for EN7581 SoC
Message-ID: <Zv1osANiy8n8Um6y@lore-desk>
References: <20241001-en7581-pinctrl-v5-0-dc1ce542b6c6@kernel.org>
 <20241001-en7581-pinctrl-v5-4-dc1ce542b6c6@kernel.org>
 <CACRpkdZMWKb1h0-sWECCY0E3CxxMyLwCr4M3k6vrY9aAfpzMVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WN0rmCbHDTHdyjt5"
Content-Disposition: inline
In-Reply-To: <CACRpkdZMWKb1h0-sWECCY0E3CxxMyLwCr4M3k6vrY9aAfpzMVg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_083723_583178_58BABCAA 
X-CRM114-Status: GOOD (  14.93  )
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


--WN0rmCbHDTHdyjt5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Oct 02, Linus Walleij wrote:
> On Tue, Oct 1, 2024 at 7:30=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.o=
rg> wrote:
>=20
> > Introduce pinctrl driver for EN7581 SoC. Current EN7581 pinctrl driver
> > supports the following functionalities:
> > - pin multiplexing
> > - pin pull-up, pull-down, open-drain, current strength,
> >   {input,output}_enable, output_{low,high}
> > - gpio controller
> > - irq controller
> >
> > Tested-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> > Co-developed-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> > Signed-off-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> I missed that there was a v5 out and responded more to v4.
>=20
> Anyway, I think the last comments on v4 still need to be
> adressed:
> https://lore.kernel.org/linux-gpio/CACRpkdbXWMU+wq6DvviCQPQ0EzKUm9oOnyFh3=
4Bm=3DY8K-HmT0Q@mail.gmail.com/

ack, I will do in v6.

Regards,
Lorenzo

>=20
> Yours,
> Linus Walleij

--WN0rmCbHDTHdyjt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZv1orwAKCRA6cBh0uS2t
rK7xAP93gThE4rrEfzNcqrw85E3kcerWOJOqVnoTi+WpWW2JEQD5AeuJvNtGZp6n
HH4wNjZ7Z5fXcCBfgVML15h4HOZWowg=
=eXGw
-----END PGP SIGNATURE-----

--WN0rmCbHDTHdyjt5--

