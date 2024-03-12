Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA22FC54E66
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Mar 2024 08:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LR2nwwqmgN2QbjgHc3Koo0qVoLVq9J7DOCiQPH0RGMA=; b=rzxtJPmzr3BK9BU/lYqvqe3kSC
	cc1FdRRpMJEL4TG10BvQwLxK9+GySAMQ9IhMQOe4Tq8IpWtwcHggAdy8CeqHo0puyeHmTtLoavuAQ
	pgak/xnF+6XLZ+FxMq4OgJB+CBP4vAdBQ0rPDJqj1GeFbLxmsnQ/btW3lIH8PjmfSRYlRCunuBDu/
	XZaFFfL/VHjlPd+H23jS1botgnPnJLToGApOh3QRy5CwizqIW0frC5Zp8ScFjoBHTp4sYHoRW62V2
	O3lnmdrgyUcrU6f3/0W2gco83PP34aOIMwP18mcjEG59avJlVMnEJRLw9O6N9HBRfp3f/JpbfuSW+
	HHCs4oZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxei-00000004v4t-1ttE;
	Tue, 12 Mar 2024 08:38:40 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxee-00000004v1t-0V97;
	Tue, 12 Mar 2024 08:38:38 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id B5A651C006B; Tue, 12 Mar 2024 09:38:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1710232706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LR2nwwqmgN2QbjgHc3Koo0qVoLVq9J7DOCiQPH0RGMA=;
	b=eAkPn0EOGw/osV4V95LaZ/AYDfXEWT0hpGgcikEcoVVy9btE2li73UchXhO44I2/SETQsz
	KKnKF/aJqRm+Nt0L4wj1lpU4tEu97pX4Rg2qSV5JO/4Pl+fh6YvCFjsJVilkwN0jWkCAyH
	viJd2lwZGjHsu+GuxK09lvW+p6+PmZQ=
Date: Tue, 12 Mar 2024 09:38:25 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Rob Herring <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Chanho Min <chanho.min@lge.com>, Arnd Bergmann <arnd@arndb.de>,
	tsahee@annapurnalabs.com, atenart@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	rjui@broadcom.com, sbranden@broadcom.com, andrew@lunn.ch,
	gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
	matthias.bgg@gmail.com, magnus.damm@gmail.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.1 12/12] arm64: dts: Fix dtc interrupt_provider
 warnings
Message-ID: <ZfAUgYj0ksDmGuhN@amd.ucw.cz>
References: <20240229204039.2861519-1-sashal@kernel.org>
 <20240229204039.2861519-12-sashal@kernel.org>
 <Ze9x6qqGYdRiWy3h@duo.ucw.cz>
 <CAMuHMdX-ht_Vetq7+Xh0TqWOcnCdi=3d0VvfgXBF4ExtzGcRDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q9rn6aD/S92U1E3N"
Content-Disposition: inline
In-Reply-To: <CAMuHMdX-ht_Vetq7+Xh0TqWOcnCdi=3d0VvfgXBF4ExtzGcRDg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_013836_624892_3921C2D5 
X-CRM114-Status: GOOD (  14.62  )
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


--Q9rn6aD/S92U1E3N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > From: Rob Herring <robh@kernel.org>
> > >
> > > [ Upstream commit 91adecf911e5df78ea3e8f866e69db2c33416a5c ]
> > >
> > > The dtc interrupt_provider warning is off by default. Fix all the war=
nings
> > > so it can be enabled.
> >
> > We don't have that warning in 6.1 and likely won't enable it, so we
> > should not need this.
>=20
> Still, this fixes issues in DTS that were not noticed before because
> the checks were disabled.

Is this patch known to fix user-visible behaviour?

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--Q9rn6aD/S92U1E3N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZfAUgQAKCRAw5/Bqldv6
8l6HAJ48NTNe0sjM5dmXZJpgVt2yUt0QewCgusqrfmeYba20Wbn4F2DCto9qrKQ=
=NHYi
-----END PGP SIGNATURE-----

--Q9rn6aD/S92U1E3N--

