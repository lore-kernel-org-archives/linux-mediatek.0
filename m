Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6905C47DDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 17:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCYhCGCtLx/Jyo1j6/LXONR0VkamWENNT6rk6KXghPs=; b=C0lHvG0ylLVNBkoH7Qsy3p9HFU
	2ElEByIbU6rXiifLtc6/leAqE554aEayeCQw05YDlsDvS9NniFnhJccopBHjlBz6v4j5JKpFZjwqA
	TB9C5UmfEki4hOIR6Pm/mHCkJeth6kDbYt7vxNKP+0uVBpk/wpAbOnD/NrohH+vca0xYGkHk/vL1l
	pvEqyLTSwuAxhF3Wa85vYNUVgdjjZO/py8eyJL0899m9kjhDQrLEw4PUt4zrodjHLgSmcj+hTL0Uo
	5PD5rLGOOjeB+WzwpMktDpTIPKpAn8VSK6ItkaybpnEO24Auzo1WPn8f3Tq6WHd8fd1aYBA4p0dTm
	R34gH5vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSKMF-00HSiv-1V;
	Tue, 23 Jan 2024 17:14:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSKMC-00HShS-0N;
	Tue, 23 Jan 2024 17:14:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 33AAECE0905;
	Tue, 23 Jan 2024 17:14:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50A3C43390;
	Tue, 23 Jan 2024 17:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706030077;
	bh=VCYhCGCtLx/Jyo1j6/LXONR0VkamWENNT6rk6KXghPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M1ByY1vfZIGPwnhFUO61nlYWKDPVjRsVMHAbF21f3ov4WV0oGLNuAROs6NF7ZQ0mW
	 zUcLEvz0SgQ0x9X58ziLybT2gjt88WTjgnwoK6CtsJtUBQPXDw+/4w7bcHNlisqYS8
	 +gwvxCcjOGuxt1D2DDp3oDUyvA6GJ8kFLYRCU8EjJWyqnLGzSXh1SLiKn7YWA1VZgl
	 5AKg4fRGp/rsrxPVF4UeVdjyBuCML2Eqe92IgrzYZnjDYNSXY4k+vF8RlcYePA001c
	 otnw5/VZizMeyEX3gT+5fmw6jiVZmUgNMb6BTmfUtkbR6yT9TgWJkPiGpwazy+8c2U
	 vlndxs9XEHZiA==
Date: Tue, 23 Jan 2024 17:14:32 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com, linux@roeck-us.net,
	heikki.krogerus@linux.intel.com, cy_huang@richtek.com,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: mt6360-tcpc: Drop
 interrupt-names
Message-ID: <20240123-procurer-jumbo-ebbec485505d@spud>
References: <20240119094105.98312-1-angelogioacchino.delregno@collabora.com>
 <20240119-eldest-discharge-e2d3812be0a9@spud>
 <12b7b339-498b-45c1-bc5e-05e07660aefa@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v/T4NYLhZdUREOS8"
Content-Disposition: inline
In-Reply-To: <12b7b339-498b-45c1-bc5e-05e07660aefa@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_091440_328679_029C34C4 
X-CRM114-Status: GOOD (  20.76  )
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


--v/T4NYLhZdUREOS8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 11:32:30AM +0100, AngeloGioacchino Del Regno wrote:
> Il 19/01/24 17:32, Conor Dooley ha scritto:
> > On Fri, Jan 19, 2024 at 10:41:04AM +0100, AngeloGioacchino Del Regno wr=
ote:
> > > This IP has only one interrupt, hence interrupt-names is not necessary
> > > to have.
> > > Since there is no user yet, simply remove interrupt-names.
> >=20
> > I'm a bit confused chief. Patch 2 in this series removes a user of this
> > property from a driver, so can you explain how this statement is true?
> >=20
> > Maybe I need to drink a few cans of Monster and revisit this patchset?
> >=20
>=20
> What I mean with "there is no user" is that there's no device tree with a=
ny
> mt6360-tcpc node upstream yet, so there is no meaningful ABI breakage.
> Different story would be if there was a device tree using this already, in
> which case, you can make a required property optional but not remove it.

Not every devicetree lives within the kernel.. If the driver is using
it, I'm not inclined to agree that it should be removed.

--v/T4NYLhZdUREOS8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZa/z+AAKCRB4tDGHoIJi
0lIGAQDy+QnvesimA/OIHScQAKviK34M6BooBy+5efXbpLxirgEAsWPYDApgg5q7
5GO9YGhChTlvElCUHbl0NhBDEWtLsgY=
=kCYX
-----END PGP SIGNATURE-----

--v/T4NYLhZdUREOS8--

