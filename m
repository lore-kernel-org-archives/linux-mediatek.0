Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EC4C10DC1
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 17:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqR5Pu1vfX8Tzb7oABBG5dDwHFoYt6PPvTFmyYLcOos=; b=obea5JIAgZh2YDtwDdy6TjG1sU
	5u+4BfHBPPucRnkmeKdoSvPwavD8RJR3fMe1mC55msmmJUgIf2bdyJW3xokZVqoxQ8CbXghg5PKva
	rLTzqLebfw9orN2mSaFAv0XFS/OcMr4aTlf2M/S6ATK2HMuMd7PP0rxH5agB2m5KhUt4a3Jj/gGsi
	EK0+5pii9b1GmnDEPntbM0CmA+0bafZF16OpjA/t3cBiYFZvqUCXboWvm1msj+YdEL6oiLJgGNjBW
	+gV8tQXhlhOucL+eU2T26HPHktzMcmE6yQsSLQKm3OzgDgeTR4FqCmZfQ1HM1hC3pPJicm6HH2E5h
	MtEVyPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rACpB-005Cet-2C;
	Mon, 04 Dec 2023 17:33:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rACp6-005Cbm-1k;
	Mon, 04 Dec 2023 17:33:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 961B061295;
	Mon,  4 Dec 2023 17:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1E1C43391;
	Mon,  4 Dec 2023 17:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701711215;
	bh=pqR5Pu1vfX8Tzb7oABBG5dDwHFoYt6PPvTFmyYLcOos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M+ipHTBhZNzq3PIkeoJnv1jX3zSD4kJ0NCAcc2Gt7OsXABhjElEba84C21u0h5v01
	 KingCMNjsYCFZBg3Uaspz+xPl8mupbs7O+q+T7BE0fUaUd10QGwozJP5wxaXXCJujJ
	 cIlo9c9felXEI7/VsyiUGYny+qAapBmJYYPdsihfxBiJCtoSXiFPclT2GuOPKUk1ru
	 XZbewudY/x5oyNryAvQQL9GVMT7tQykspabY/F1kPq16jP9rMz2qdW4xXSQlOjGu3i
	 XC7kvUPAi3GeG4V0VDRRvu9RoAspqrI+mBG/UKiXOV8e0bqgp1A8YoGXrScCrdJefn
	 0HvJMXkXdIz9Q==
Date: Mon, 4 Dec 2023 17:33:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>,
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4] docs: dt-bindings: add DTS Coding Style document
Message-ID: <20231204-ladder-walnut-795fedf363d1@spud>
References: <20231203174622.18402-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="l/ugqpDYRk1oTs3I"
Content-Disposition: inline
In-Reply-To: <20231203174622.18402-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_093336_664391_767ABA22 
X-CRM114-Status: GOOD (  11.33  )
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


--l/ugqpDYRk1oTs3I
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 03, 2023 at 06:46:22PM +0100, Krzysztof Kozlowski wrote:
> Document preferred coding style for Devicetree sources (DTS and DTSI),
> to bring consistency among all (sub)architectures and ease in reviews.
>=20
> Cc: Andrew Davis <afd@ti.com>
> cc: Andrew Lunn <andrew@lunn.ch>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Chen-Yu Tsai <wens@kernel.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Konrad Dybcio <konradybcio@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

The advice here seems pretty reasonable, and it is nice to have
something written. Thanks for working on it.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--l/ugqpDYRk1oTs3I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZW4NZgAKCRB4tDGHoIJi
0hplAP4/bWQVjb7IgU8BmI66aGxhgllxfGZ+i/pqPIywcayRXAEAw27WdWDY1IxZ
uTKhjEBZBea8K/Y7CKAXSIgVBdJqAAw=
=6IFD
-----END PGP SIGNATURE-----

--l/ugqpDYRk1oTs3I--

