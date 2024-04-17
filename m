Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F076CC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 00:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVAp4IOd+ftXbliGWV6sMKzUBLNAQxl+/AiTbHPv/7U=; b=2JJCneMlhAaw/62s3H0GMQyeSs
	eMs8mZ1gJJ+QbchjeBBeiZ8NRwazK87ifqlMtzMhDm6TDZ7cPUx6/JfpWotH7uKmcJnobx6DQdjRl
	PJt1Cwm1bpcwowGHlhHV2a+FAYR6nSjh2xveiFfpV42fb5dmkaYLjNAycWAosThNW3Yc8mIFo+MUH
	wqOvXTym88Ii/yLlPFL6KW/xubQ9DCRTPVkiqQGd9jkhBbFOQ+7P3SDreqfjtnftZX0fE3aO3Rg22
	ooCJjOq0OrdCyNLCaJhLXtY1LpwrjvSmaceUSCKkcH4YhpVdQr//75K/KGp6L3m5I1FpzxBqz7Bai
	VjqmSjAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwtXh-0000000EKiF-19rV;
	Wed, 17 Apr 2024 00:52:53 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwtXb-0000000EKh3-2kNH;
	Wed, 17 Apr 2024 00:52:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DBF3FCE1232;
	Wed, 17 Apr 2024 00:52:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1D6C113CE;
	Wed, 17 Apr 2024 00:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713315164;
	bh=YVAp4IOd+ftXbliGWV6sMKzUBLNAQxl+/AiTbHPv/7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eYx9gupWYdoBX48zuNmRYqbVMANTV4V5eoBnl0zec5YHRT5vP3OS/snMGTUITWR6v
	 UwNhFLOpi1owo/qPKqdAN12YSjIO+DY6Giu1LUUlc5Djo18W/050eEaHV+CtzAQgnF
	 /MiiWPfD8sQQBKHdxwSioWzPJS7d9M2QM0V0XDocEW6dhHPosDxPWRcbt69rarTom1
	 Dcl5ItCAYOMs5rnWplVDZVpbX5IxENDBJeC/8NSSi9XKcMSsMBoTsbBpvMbZuCz6T3
	 9rdR8dVwHTrZyXSN1hUs3hXllTbxRp8KTkeBMu3MBhy7QKt8xkCIXB5nC5G95NE/VQ
	 pQY4eIHZOBIeQ==
Date: Wed, 17 Apr 2024 09:52:41 +0900
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: djakov@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
	keescook@chromium.org, gustavoars@kernel.org,
	henryc.chen@mediatek.com, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com,
	wenst@chromium.org, amergnat@baylibre.com
Subject: Re: [PATCH v1 5/6] regulator: mtk-dvfsrc-regulator: Refactor and add
 MT8192/MT8195 vregs
Message-ID: <Zh8dWdE8V8-GhNlF@finisterre.sirena.org.uk>
References: <20240416153805.431118-1-angelogioacchino.delregno@collabora.com>
 <20240416153805.431118-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="whh3nrJglfd7igwd"
Content-Disposition: inline
In-Reply-To: <20240416153805.431118-6-angelogioacchino.delregno@collabora.com>
X-Cookie: TANSTAAFL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_175247_973118_99A76D84 
X-CRM114-Status: GOOD (  11.60  )
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


--whh3nrJglfd7igwd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 05:38:04PM +0200, AngeloGioacchino Del Regno wrote:
> This driver never worked, and never got even compiled, because it was
> missing the DVFSRC driver entirely, including headers it relies on!
>=20
> Perform a full (or nearly full) refactoring of the MediaTek DVFSRC
> controlled Regulators driver: this retains support for the MT6873,
> MT8183 and MT8192 SoCs, and adds MT8195.
>=20
> As part of the refactoring, this driver is now probed using its own
> devicetree compatible, as this is a child of the main DVFSRC driver
> and gets probed as a subnode of that.

Given what you're doing this would probably be easier to review as
two commits, one removing the existing driver and another adding the new
code.

--whh3nrJglfd7igwd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYfHVgACgkQJNaLcl1U
h9DwsQgAgK6OWXJu6ieNWkutjauhJjUe5+l5WxV0KrzASn7I8CFbXNeSgxtx8AZ/
Wv1MYw70APANEtgwkVwwwzu9dxHg+NCPglVwkhmhCevxOvAx8klLFChvsfzjCvmq
pvke+sh5Y/A+8ryIisIA7btD1obFfxLXFQm17W4JggKi47e+QDiah3sQqVzpfDPr
G17pX6KxNc/S+YzkT/BmWcT9uGKucU10R082NScoBU5lsdrAyGnowwhJVNcL5N4J
tUJJXB1VnSi1Q4fOXB4wpxihXwGDZnwb2kgLp2hgRAMXaQv2BbCfk0IAy8DE69yr
lEi56TB4d1sxHrvVO/RTnarkSfcfMQ==
=+F1c
-----END PGP SIGNATURE-----

--whh3nrJglfd7igwd--

