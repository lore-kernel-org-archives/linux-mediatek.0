Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52759C52D7C
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Aug 2024 14:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkaVp9/7b85zta0lkJW69+zAX7pFAzGLa6k+mD2zv68=; b=zOpZzGY3Y109aKuBnm4tnuS4qc
	LD7p/Juav8E2jvZ/HyDQz3HIweLcuCCsyBEJ+QhAfMxRxsHOrzb8KYXP2k0cJ0oqUF1k64RuB5NsB
	umEk5PHfLmccJDoFAk/Nl3m88Nw8hv4RCSlkhU9i+eJRImaU4RJIuQ3JSsnEMUX3X77P/L/uMQTiN
	SMcE3Hy89Rf/KkwApDVIFq8rdsGTZppR3BJ7EUmunXrqGeET4GCBwYxOwgqPOsZxT2GhaqLkk/rd+
	fmhhKKYz638qE3JEdwd7RXZBXzvbFhscBCgIpc3nLZpVDHmhDjvNP/n/UAZE8iqzplzbdAVPydwia
	hGq1fuVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfgo9-0000000Ggk1-49mP;
	Sun, 18 Aug 2024 14:23:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfgnT-0000000GghU-13g8;
	Sun, 18 Aug 2024 14:22:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 27144CE016A;
	Sun, 18 Aug 2024 14:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB2BC32786;
	Sun, 18 Aug 2024 14:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723990936;
	bh=bS8ze1d0ffQtXAWwdn7UmuJx/sv0gAVsbFsxPJ/9qWY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pMyeaN6K0vCXdW3b0EH79I/mIztfWQTpDdTc5VASsqSnCn2xrY1DKct9HJ6o2WEv0
	 tRaT+ih1+YeoklkXoaRxK1NRbX+ZU8H9Y2yl6DDitLFiQHc6byM8QdCMNEMFNwW0jS
	 VooXAVt52TBsttcw5xHOiXE29u85iIF5P+9nuqvbcyzRHgtxo9hCdsnXVntAQV6uRf
	 SFUuvjpM7LBEVwY9BSwzqkJ06Q2NZ472yunGidodW8oPGoz89xHtLKEMkCABMz35dZ
	 f2+UL5dkFSs8xFp/I/ditoN2guTc3p5uDEfNyDENgBuoxlAm0O+QM3k2TLocn0QEyx
	 WbLcOd8nO8pEA==
Date: Sun, 18 Aug 2024 16:22:10 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org, sean.wang@kernel.org,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com, conor+dt@kernel.org,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: airoha: Add EN7581 pinctrl
 controller
Message-ID: <ZsIDkg0qWb9tXNqt@lore-rh-laptop>
References: <cover.1723392444.git.lorenzo@kernel.org>
 <0d537e88b64847bc4e49756b249b2efdcf489b92.1723392444.git.lorenzo@kernel.org>
 <22144671-fc7c-4cb2-8bb6-ee7d3fbfcb0e@kernel.org>
 <c8a74be4-be63-477d-9460-1d5ef5e3d84a@genexis.eu>
 <20240816225257.GA2411475-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="slFC9PSxrwsRPZ5Z"
Content-Disposition: inline
In-Reply-To: <20240816225257.GA2411475-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240818_072220_150901_F20D7F75 
X-CRM114-Status: GOOD (  17.42  )
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


--slFC9PSxrwsRPZ5Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, Aug 13, 2024 at 10:06:41AM +0200, Benjamin Larsson wrote:
> > On 2024-08-12 08:48, Krzysztof Kozlowski wrote:
> > > > +      pio: pinctrl@1fa20214 {
> > > > +        compatible =3D "airoha,en7581-pinctrl";
> > > > +        reg =3D <0x0 0x1fa20214 0x0 0x30>,
> > > > +              <0x0 0x1fa2027c 0x0 0x8>,
> > > > +              <0x0 0x1fbf0234 0x0 0x4>,
> > > > +              <0x0 0x1fbf0268 0x0 0x4>,
> > > > +              <0x0 0x1fa2001c 0x0 0x50>,
> > > > +              <0x0 0x1fa2018c 0x0 0x4>,
> > > > +              <0x0 0x1fbf0204 0x0 0x4>,
> > > > +              <0x0 0x1fbf0270 0x0 0x4>,
> > > > +              <0x0 0x1fbf0200 0x0 0x4>,
> > > > +              <0x0 0x1fbf0220 0x0 0x4>,
> > > > +              <0x0 0x1fbf0260 0x0 0x4>,
> > > > +              <0x0 0x1fbf0264 0x0 0x4>,
> > > > +              <0x0 0x1fbf0214 0x0 0x4>,
> > > > +              <0x0 0x1fbf0278 0x0 0x4>,
> > > > +              <0x0 0x1fbf0208 0x0 0x4>,
> > > > +              <0x0 0x1fbf027c 0x0 0x4>,
> > > > +              <0x0 0x1fbf0210 0x0 0x4>,
> > > > +              <0x0 0x1fbf028c 0x0 0x4>,
> > > > +              <0x0 0x1fbf0290 0x0 0x4>,
> > > > +              <0x0 0x1fbf0294 0x0 0x4>,
> > > > +              <0x0 0x1fbf020c 0x0 0x4>,
> > > > +              <0x0 0x1fbf0280 0x0 0x4>,
> > > > +              <0x0 0x1fbf0284 0x0 0x4>,
> > > > +              <0x0 0x1fbf0288 0x0 0x4>;
> > > Why are you mapping individual registers? At least half of these are
> > > continuous.
> >=20
> > Hi, this is by design because of the register placement in the gpio blo=
ck
> > and the fact that the pwm functionality is intermixed in there also. As
> > example the following registers are all GPIOCTRL:
> >=20
> > <0x0 0x1fbf0200 0x0 0x4>,
> > <0x0 0x1fbf0220 0x0 0x4>,
> > <0x0 0x1fbf0260 0x0 0x4>,
> > <0x0 0x1fbf0264 0x0 0x4>,
> >=20
> > To simplify the driver code logic the complexity is moved to the dts be=
cause
> > of that.
>=20
> DT to OS is an ABI. Don't put the complexity there. The driver is easy=20
> to change.
>=20
> Lot's of h/w blocks are just bit soup. This is not special. If a few=20
> regions is helpful, then that would be fine.

ack, I guess we can try to move the complexity in the driver, at least for
gpio-irq controllers, merging regs whenever possible. I will work on it.

Regards,
Lorenzo

>=20
> Rob

--slFC9PSxrwsRPZ5Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZsIDjwAKCRA6cBh0uS2t
rKwDAPwLD5UGwPDlmvE5WXgaS68NnJV73UgsZQXE/EfO79rNjgEAyvez/nIMzjtu
hVwwFHOPnVs4z/vLiJ+SiZsG/lMGdQM=
=jtGx
-----END PGP SIGNATURE-----

--slFC9PSxrwsRPZ5Z--

