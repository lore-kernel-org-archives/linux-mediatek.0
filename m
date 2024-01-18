Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9CDC47DAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jan 2024 16:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJkMgqC2S76lVQNPn8rjVOH4uxu12G8efLlMhMUYfVY=; b=mEGjhMC0Dovavk0Cy6ZdoNplPB
	f0PaHQO3c8poUyK4flih5/I6a+1sd8ZPFF/+cfERuuQay9FjECUNePKG7ELmqMgtVkHA10OhzKlSQ
	7DRYGXpipeYZhm7VTk7vMpZwWH7GAiHaSGy/DIhy5BXZB+3NaN5amuusjj9ughPQmBhY8kFUqfE6q
	vKNDqKlw9iBvlt6F8ZzgOJv1Dh/hNxLImE3rQP1QnExtdUmOR9gZILBNpZYlA0L0XN2m8GHl5+k9b
	0PLp3a2GPh/6k7DWHNt/fa8p0Br6dzZKiRWsYPqe/WztmvGkacVxVP9KYhkjPxWNjKVuogtrUx52F
	T/OHcofA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQVav-003Iuy-1e;
	Thu, 18 Jan 2024 16:50:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQVat-003Itv-0U;
	Thu, 18 Jan 2024 16:50:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 85FCB60BAC;
	Thu, 18 Jan 2024 16:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEFBC433F1;
	Thu, 18 Jan 2024 16:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705596588;
	bh=MmpcWhyIPObWHmbC8YPoipa9VKgkAwrIBlWa7uylkp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q3vXm7SFr0bHK742KROSU3mZNu/ipoJkrRUYZdE9v/B8A4eQcxj0bH+2NZ7yu0gka
	 CtFjOo46awOM97n1UuvP2HR0bcIlcIAb0+OfUyqouaIS4rAtE4AUZV+t/ULg8xJmg4
	 agjSDcxmcQBkk3gcy+l8fzQOWNBfAwKg8rEBMIGFgyWlbl73CFFj2dwfia/83Kqe1p
	 9+sRB6ZtYQQnzmPfHlQPpeRBylbD0LFtMgaonEk3ALiQ6RbZgnFl7t1yQUI4q3DoR+
	 k6ttFX4k6EnGjZwyfOkZaZJQwzgm43hN2PB4J7lwqqIySUdFuZFIHQFkbq6qyCS0Er
	 U0DZKz3IqLltg==
Date: Thu, 18 Jan 2024 16:49:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v3 1/2] dt-bindings: reset: mediatek: add MT7988 reset IDs
Message-ID: <20240118-calcium-krypton-3c787b8d1912@spud>
References: <20240117184111.62371-1-linux@fw-web.de>
 <20240117184111.62371-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yEppIa8A0Tn1qUHg"
Content-Disposition: inline
In-Reply-To: <20240117184111.62371-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_085019_233739_507DE3BA 
X-CRM114-Status: GOOD (  18.13  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Michael Turquette <mturquette@baylibre.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--yEppIa8A0Tn1qUHg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 07:41:10PM +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
>=20
> Add reset constants for using as index in driver and dts.
>=20
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v3:
> - add pcie reset id as suggested by angelo
>=20
> v2:
>  - add missing commit message and SoB
>  - change value of infrareset to 0
> ---
>  include/dt-bindings/reset/mediatek,mt7988-resets.h | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/include/dt-bindings/reset/mediatek,mt7988-resets.h b/include=
/dt-bindings/reset/mediatek,mt7988-resets.h
> index 493301971367..0eb152889a89 100644
> --- a/include/dt-bindings/reset/mediatek,mt7988-resets.h
> +++ b/include/dt-bindings/reset/mediatek,mt7988-resets.h
> @@ -10,4 +10,10 @@
>  /* ETHWARP resets */
>  #define MT7988_ETHWARP_RST_SWITCH		0
> =20
> +/* INFRA resets */
> +#define MT7988_INFRA_RST0_PEXTP_MAC_SWRST	0
> +#define MT7988_INFRA_RST1_THERM_CTRL_SWRST	1

These are just "random" numbers, why not continue the numbering from the
ETHWARP?

> +
> +
>  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT7988 */
> +
> --=20
> 2.34.1
>=20

--yEppIa8A0Tn1qUHg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZalWpgAKCRB4tDGHoIJi
0sGUAPsEUtGzFKYVgmTkwZMghZncVYo5cXy3chdsCl1amnypDwEA8ABvcU3y0QS+
LMESXclQSuODjX0VsQAx1cAjuWDNawE=
=092l
-----END PGP SIGNATURE-----

--yEppIa8A0Tn1qUHg--

