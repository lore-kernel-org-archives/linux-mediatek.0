Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F777CCF9EE
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Oct 2025 16:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFhFn8+YqOP959WuEQxNYNWaORbGiOqWcenVkBVo0cw=; b=GlMaDLO2MSkqztEf/CGQY6MhSJ
	xEsU/fo028wFx662JwqlxfKPHn8Iybe8YJXvh8oJ3knO++2H2Q/hav13/Gisu1TW72RqoyP43NBO0
	+4XXlLhsvsQFUGe2xnLvT6LFpWcnA4mYXuA3BI49/MZLYCxZYKJN7+En1HYNx1VlnpIMfNkmjYxz7
	3WaKxHzLKToSNnNCy0BBcIOIgTINYDMP2e18+lZTrCEGkAr+TLf28o2+VzzNvNoUu3wOkumSZhci6
	CDrpPnFHIY0PIfz1Hpjwz1RMCiY4I733QyPTDzmqUQycx0hmhd1yxXbxJkFnss9KYJnnc/0gfKW/L
	TblqBOyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQJq-0000000EM3p-3nuo;
	Mon, 27 Oct 2025 16:43:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQJp-0000000EM2z-149W;
	Mon, 27 Oct 2025 16:43:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0D28440B9;
	Mon, 27 Oct 2025 16:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE11C4CEF1;
	Mon, 27 Oct 2025 16:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761583420;
	bh=qFhFn8+YqOP959WuEQxNYNWaORbGiOqWcenVkBVo0cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LGqLiySmE7AZKyT5XiEEksJdfc4/P6ZrYQinCiweFORc06kwdBZufqa4Vgkhnl/jZ
	 koHzPI1P3GTvj4kf9xJKoHnNadezmUUlWjsNaAlS8xemfP9D1VvlOjEs1j+3QrSX/1
	 E4X6MmUeA/MWumAPuPzrLzw1jdsKOx1fNux0gQWaofh6ekFi9xrGsGqx1Wa4pq+0zb
	 3o1OLq1jSkbrb+Qqcmk7crK3mpvXZsXeSEp/2HpwPAtCOZ9Ay228NUfK+zupVtobey
	 F6wTRRafdJTfCMie9oCSH4+4l6snL5seSW/rZRAmtc0H5riHF0JzehWvDWF6MLiIKG
	 h8rhantcxWRSg==
Date: Mon, 27 Oct 2025 16:43:35 +0000
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org,
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v11 1/9] dt-bindings: regulator: Document MediaTek MT6316
 PMIC Regulators
Message-ID: <20251027-swirl-backtalk-7a4c456c6b55@spud>
References: <20251027110527.21002-1-angelogioacchino.delregno@collabora.com>
 <20251027110527.21002-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YUnqGUl9BxDmKz8j"
Content-Disposition: inline
In-Reply-To: <20251027110527.21002-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_094341_313224_A082A1C0 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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


--YUnqGUl9BxDmKz8j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 12:05:19PM +0100, AngeloGioacchino Del Regno wrote:
> Add bindings for the regulators found in the MediaTek MT6316 PMIC,
> usually found in board designs using the MT6991 Dimensity 9400 and
> on MT8196 Kompanio SoC for Chromebooks.
>=20
> This chip is fully controlled by SPMI and has multiple variants
> providing different phase configurations.
>=20
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--YUnqGUl9BxDmKz8j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaP+hNwAKCRB4tDGHoIJi
0lUDAP0WtLoUfhkx8dU7bCtSgXO7e8/K3Fa3iB9P0XeKf11FMAEApZ7sIqQkFKPk
0QLNEhetIA5+lVhTly2bu1Ut1PSRTwo=
=r/Dw
-----END PGP SIGNATURE-----

--YUnqGUl9BxDmKz8j--

