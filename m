Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEB7C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xumFkzh9dOhqQuxWQPzQ0UOI+crU8zGpXe3IKeAJiLo=; b=bgJRqBEJc3v101FVo5OQ7wfhZx
	1LKjNYsbJ8vxgOAeT5n3Fojl1ASUUx7izQowabsNFJfAoEap+ris/8tHqiCTC6eQFkxC4JKWpUpZ7
	yC1OqiCIrVMl3PwD6P/mNcICnsZHg4GnY28hHXcsbg/UaJJ87mcmBA7bY6G2erjcNujcTMuw9MoxK
	UJVHMmrN8l4J3Lq74w372++xoZB44Dc3f246vqKCzWhX7GfQuC8/wbITCe8PD2f1RVckQGA7S0ubo
	Po9UTQUml7KeVAystHeZyesb2/neG5fRCn13I9XZ1Frl9RdxBg4vtgefpe60wOvd5m2SjAWRpwDaW
	aGinr0ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNF9c-008sH1-23;
	Tue, 09 Jan 2024 16:40:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNF9Y-008sFx-2Q;
	Tue, 09 Jan 2024 16:40:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DD18D614BD;
	Tue,  9 Jan 2024 16:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22925C433C7;
	Tue,  9 Jan 2024 16:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704818435;
	bh=xumFkzh9dOhqQuxWQPzQ0UOI+crU8zGpXe3IKeAJiLo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mS6hffrM8lke09V6OI+rr+zWeUuXVm+yeEU3pex4lAnkO+QzbfFKtZWS6RNtOfBVA
	 OXxdShG6OWUaVqBcepdY/kNTyzMMux9hWwpIfT7glq08vpVWPk3rkXSwBOOczEpx1b
	 5pr4Qd4QM/S8EAeiLqRne6LSZ26SOHa8XR8taeUy/aobdgDP28leKB5rK21zF8f7UC
	 pt1i/Ex4Iz3Rncmy6J3HMrdl6ZqvjDNIw5Bg5qUnGksuQcVyiDUgrx61b7EJCK5KcW
	 xxGWa/gsx+kaUpbyWXMbgJxTXbt8ECq4NEHX0IOwMQ72xTcW4QIXD9lV7FB4Qt4D/a
	 8x83Ov3qSVoaw==
Date: Tue, 9 Jan 2024 16:40:29 +0000
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?iso-8859-1?Q?N=EDcolas_F_=2E_R_=2E_A_=2E?= Prado <nfraprado@collabora.com>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>,
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] dt-bindings: arm64: mediatek: Add MT7988A and BPI-R4
Message-ID: <20240109-perennial-darkroom-953f86a05adb@spud>
References: <20240102205941.29654-1-zajec5@gmail.com>
 <20240108-helium-retriever-043ed3e1dbe0@spud>
 <1a9d7f5b-4a00-4026-81b8-7af3031c6656@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Bl2E85BvxztBLFCl"
Content-Disposition: inline
In-Reply-To: <1a9d7f5b-4a00-4026-81b8-7af3031c6656@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_084036_854306_AF003A5D 
X-CRM114-Status: GOOD (  11.62  )
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


--Bl2E85BvxztBLFCl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 09, 2024 at 07:12:35AM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> Hi Conor,
>=20
> On 8.01.2024 18:38, Conor Dooley wrote:
> > On Tue, Jan 02, 2024 at 09:59:40PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
> > > From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> > >=20
> > > MT7988A is another MediaTek's SoC with just 1 device available right
> > > now: Banana Pi BPI-R4.
> >=20
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> I sent V2 meanwhile, could you reply to below PATCH instead, please?
>=20
> [PATCH V2 1/3] dt-bindings: arm64: mediatek: Add MT7988A and BPI-R4

In the future, just give me the message-id in these cases.

--Bl2E85BvxztBLFCl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ12/QAKCRB4tDGHoIJi
0pSZAQCakbEDbpyJU1zZrJrksXPLUy1QLurql1JT2lp+rbNL5QD+MXaybdojog9v
8C36eHKqtqb6uPGDATzIRYl+BUuRRQU=
=mce9
-----END PGP SIGNATURE-----

--Bl2E85BvxztBLFCl--

