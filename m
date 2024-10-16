Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45425D2A52F
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 16:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kr7rIycrQNv+7/aCXXtLO3K0Lzcz8kTMlFvA5SaaB3I=; b=rJqjQwrinYY3EIviTNDvKlW7dd
	JBTN3Q2HjC6K1FEyV2LozpDDpyJ1lsLp6LqDyuY6VQNI4J2NGhYGIMmMCe3Jsa2r1KcsiJv5IC5CC
	DGjEvYXDcoIjkIakCuQCVylrHZx90eXCYqz7qokp+cCyi0CDbFXpYrMTBMwxNVX+Zvt3rGK2Tp0Or
	LaP4JB4DabiaMgw/Ru50UZjnRvpLFxaP3x3MHo7jTF97xgAevkVEjqPR0lohQ7jytlWBj0qd+oIn6
	1XAjLY5payMba1PUXrIXf2RqrKjHJIqn4qom1PTUF6ckDc1IhCRtkiiTDCROCPEZFM+HpVXnq26CH
	BHUU9LBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t16Z5-0000000CMSf-01IT;
	Wed, 16 Oct 2024 16:07:59 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t16Yf-0000000CMNf-1GZo;
	Wed, 16 Oct 2024 16:07:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1729094836; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AW33EU2mROFqz8gJGT9DEjsYHa6VTR4uKPZls9h6YaDHN3u3egb3b2iRAD9YlXgzbRb7x7YLUx1/28Qj1V7nl6U6xERC9pHIkprncuRy65RdAA12O5ehcArZGKAfVPpPOyx7BYfiOveOeZ+tKkkqXqv/004bXZ5wHS5WJlLyR2o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1729094836; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Kr7rIycrQNv+7/aCXXtLO3K0Lzcz8kTMlFvA5SaaB3I=; 
	b=W6Y2LmvatyAsB1rCg4h6dyWg+slJO722R03JwGEsZsiVnyrSA1WUkkTwlsaK8Vzwz3aiOF5i8+wHkwljz3CqGFDaS/Otb6P3Xbt+6xUubjSOjKZm3uhcsoCUTRvdqPVMhDQGlEouV2VeaKhUMUovIYyMw9hjJNTeORv29+GyRyk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1729094835;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=Kr7rIycrQNv+7/aCXXtLO3K0Lzcz8kTMlFvA5SaaB3I=;
	b=T0PwhF4zBOxc0Feo2lU3E3y8JOWmbbtVhmy7t71xKvfpRE90OthssrtowwFmna4P
	FdpqVKnY9LTuuL3dAUSAPKzfu5ruLcMEgok46oHleaivTuu2281O2bSQBjz0VWwpPRw
	TXkSV6wwJU2srhgrjVFmlE3XbMXxv0vfeADOHshI=
Received: by mx.zohomail.com with SMTPS id 1729094834938486.39137892805354;
	Wed, 16 Oct 2024 09:07:14 -0700 (PDT)
Received: by mercury (Postfix, from userid 1000)
	id 3E82C106044F; Wed, 16 Oct 2024 18:07:09 +0200 (CEST)
Date: Wed, 16 Oct 2024 18:07:09 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, kernel@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Provide devm_clk_bulk_get_all_enabled() helper
Message-ID: <bi7pxgkf6qylkcfa6x2uerfe6zyctbidwravqb4okefjctlvuu@fxmi4pt3fktu>
References: <20240926-clk_bulk_ena_fix-v2-0-9c767510fbb5@collabora.com>
 <9ca2a9dc-b643-40ce-8177-68533d0733d1@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="re7lds35svwv2quv"
Content-Disposition: inline
In-Reply-To: <9ca2a9dc-b643-40ce-8177-68533d0733d1@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/228.222.7
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_090733_402880_FFF0470C 
X-CRM114-Status: GOOD (  27.40  )
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


--re7lds35svwv2quv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/4] Provide devm_clk_bulk_get_all_enabled() helper
MIME-Version: 1.0

Hi,

On Wed, Oct 16, 2024 at 12:28:37PM +0300, Cristian Ciocaltea wrote:
> On 9/26/24 1:43 PM, Cristian Ciocaltea wrote:
> > Commit 265b07df758a ("clk: Provide managed helper to get and enable bulk
> > clocks") added devm_clk_bulk_get_all_enable() function, but missed to
> > return the number of clocks stored in the clk_bulk_data table referenced
> > by the clks argument.
> >=20
> > That is required in case there is a need to iterate these clocks later,
> > therefore I couldn't see any use case of this parameter and should have
> > been simply removed from the function declaration.
> >=20
> > The first patch in the series provides devm_clk_bulk_get_all_enabled()
> > variant, which is consistent with devm_clk_bulk_get_all() in terms of
> > the returned value:
> >=20
> >  > 0 if one or more clocks have been stored
> >  =3D 0 if there are no clocks
> >  < 0 if an error occurred
> >=20
> > Moreover, the naming is consistent with devm_clk_get_enabled(), i.e. use
> > the past form of 'enable'.
> >=20
> > The next two patches switch existing users of devm_clk_get_enable() to
> > the new helper - there were only two, as of next-20240913.
> >=20
> > The last patch drops the now obsolete devm_clk_bulk_get_all_enable()
> > helper.
> >=20
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
> > Changes in v2:
> > - Dropped references to 'broken' API in commit descriptions, per Mani's
> >   suggestion
> > - Added R-b tags from Angelo and Mani
> > - Link to v1:
> >   https://lore.kernel.org/r/20240914-clk_bulk_ena_fix-v1-0-ce3537585c06=
@collabora.com
>=20
> [...]
>=20
> This still applies cleanly on next-20241016 and there are no new users
> of devm_clk_bulk_get_all_enable(), hence I wonder if anything else is
> missing to get it merged.

FWIW another potential user for the new function is just being added
to the kernel:

https://lore.kernel.org/linux-rockchip/20241011065140.19999-1-frawang.cn@gm=
ail.com/

Greetings,

-- Sebastian

--re7lds35svwv2quv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmcP5KUACgkQ2O7X88g7
+pqNIA//eIgyPRPVGxCRGq0n6vayNEPD4IlGMAx1j6M7fmkBgwz/xQvRomNBkwib
r3o3EYdHbjrcpaSr5mt28GusSOdNrv1Q3OvjHA39mft6dd2vxFkYNxJ5sZ9q0Eo6
aUO3vkIrt1n0a+HWY7te6uMhs8n9OCs536CcLJ15p2ZsLuEpezFvbb4NU5Ydu1qs
LdQev0ZSsMQwgUY6HCN8jL2n+pZBEv1epp/ZtHv5W4lnsKghDZMwoPLt2amZER/0
WgnGswUGQuTPjVrJE16Uq9EI7xS5ueE8oZ3tT3ysJmWSBYvbYApM19Ud2k3Md5xr
H8DvI99FajZa6t7DCYzv9gCOFz+59pmpJp8+H3pzkkyT9XAPHzHA/039DRY6fmIp
WrC7EWuilOtOLYn6u5/Vqc1xwvrJETZLCmEnBPXc0IFFh/WR9ujOwevpt/JLB+yJ
htvchSWQvmbss1Uyjep/Ou0qCtXkBfs5vRwuSBMsaxafaPSoOSkWKRQVhLEvUkXD
QYktMUFf7ER0Fe2gqkalUqoS1YZijRisdHawJ9rDmqQGfIhxaCWNa+EnPZBwh8Y3
ZzcBFiB4axozX9By+UtBRoCiQEbwj1+zzH6ALDSGhlWD8YUiyFUr8DlLAbMvbRvX
3M0dA9Y/vuaxeWbIJSm5t+aMccuTWUuEtFAyHqNKykjQ5FdCOqs=
=xIQC
-----END PGP SIGNATURE-----

--re7lds35svwv2quv--

