Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD91C001DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 15:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxuljz+as8AT+zpeXq/iy/DqqC73aBdecpgf/sdIuMM=; b=fyTjNS4Ny2/7zytApt6H6WADI9
	Amr0zS9tIdXQRnA9WwgNfaL0XnLDFyHq6iN239qBTujlZ64XZA6URc91A/C1BN3WPWraNlk/L9WWv
	RgmIzjOPoywagLkEoXRPwmNu6Y6SwsobcVIPjf0WQfwOWJZxQof0pepJPXUu/64sngxpP1T4VV3nz
	2J/irk8gPrWFd4bC4gnOUERTaectwL0x2XFybDqU6zvhsnDJR8u+SyAZd4mayvdRMFsnZAUf+1czQ
	L/ujXryav1ovyO57Z0oo/g942bzPW707koG0sOd59Pp2UZ0jyNWtIl0uRl39HLnJUY5Y3ArrsaVKW
	55OnfZ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRwlj-00CiLu-3B;
	Fri, 04 Aug 2023 15:31:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRwlh-00CiL9-0M;
	Fri, 04 Aug 2023 15:31:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8B3B96207A;
	Fri,  4 Aug 2023 15:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AF8DC433C8;
	Fri,  4 Aug 2023 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691163068;
	bh=hxuljz+as8AT+zpeXq/iy/DqqC73aBdecpgf/sdIuMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=klEPnspdL15FMXZhCDx9iQmDWkYwf4YOiftzjqB8LoOt3N4xjvt/LAz8gFZehM7NZ
	 Jn8JHgs2gckOC3Gc3G84j3/CTLpecGfKOm8WWg2StOrQQJUhtm4CTGv5eu6CATD5u3
	 YJhnzoKI4fxtmlYyLS+M89XUQCyhHCi79fZUsV/0XKcNrtT6AR9G9Rq2ob0zhJk/3o
	 Viz1YMWyAdzB4vqoW2jDOxQyqgFeGP2hubLzCeghgr0uow5VgQjYx7c+jN/6KfPvvN
	 7EmEAhIFplW+ozamyBQQtfHPrxLUJEPRolbJt6LJGGMJ8+BiArM9bJe65Aap7aca9x
	 9LDfhR+siUd5Q==
Date: Fri, 4 Aug 2023 16:31:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/9] dt-bindings: mfd: mt6397: Split out compatible for
 MediaTek MT6366 PMIC
Message-ID: <20230804-rift-unvented-1194b51744f4@spud>
References: <20230803074249.3065586-1-wenst@chromium.org>
 <20230803074249.3065586-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7uwcHrcVztFuPIhA"
Content-Disposition: inline
In-Reply-To: <20230803074249.3065586-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_083109_192745_393A7B58 
X-CRM114-Status: GOOD (  12.76  )
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


--7uwcHrcVztFuPIhA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 03:42:39PM +0800, Chen-Yu Tsai wrote:
> The MT6366 PMIC is mostly, but not fully, compatible with MT6358. It has
> a different set of regulators. Specifically, it lacks the camera related
> VCAM* LDOs, but has additional VM18, VMDDR, and VSRAM_CORE LDOs.
>=20
> Add a separate compatible for the MT6366 PMIC.
>=20
> Fixes: 49be16305587 ("dt-bindings: mfd: Add compatible for the MediaTek M=
T6366 PMIC")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--7uwcHrcVztFuPIhA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZM0ZtgAKCRB4tDGHoIJi
0qDyAPsHuwCui775ZKeH0xfMeYOmy3RU0RV5Fv5KqB7imiFqfwEA19FJcLsJ+INy
AR2LebWepVlpr+2xxBBkGWmxwLNzPwY=
=47nj
-----END PGP SIGNATURE-----

--7uwcHrcVztFuPIhA--

