Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462D1C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czQWpKjgJU/ptaXUhAAxu1A7j9DtQA2l8Ttg4DhaZ+U=; b=FCGfnJRCgjfoHbp9q8nQDbdYxR
	10tXN9chTlpnytYV24Qk0zv02igHu4puAVuV9cskcha7V4dqCOtu8s+djXbtbz6zkhBmEtuDhAVMy
	1pNLY6RryWb/W1JHisM+jwARiT9jw5MkzcJc9c7eocYyQSAaetKJgjoBRUJ3rkekdQgkY7xbNrVMw
	AEx7+8NwvGvDpsCWgWS5L0xlsyUZ3/Ax78ZEqoJ0kB3k5Sm9AQ3ska8PH5n8cnQDMm912hmEGgzoO
	s95Y14o8m+ln3e492EAcD55x1jk8loBxvOHsa7b3KOmrGtJTPggITyReXLDcPss/nUQeTTiavmVnu
	UZMPp3Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKOm-00000005mOT-3LsT;
	Thu, 20 Jun 2024 16:12:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKKOj-00000005mNM-2h92;
	Thu, 20 Jun 2024 16:12:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 15274621EF;
	Thu, 20 Jun 2024 16:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1F4C2BD10;
	Thu, 20 Jun 2024 16:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718899948;
	bh=czQWpKjgJU/ptaXUhAAxu1A7j9DtQA2l8Ttg4DhaZ+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cYJ47wSD1eTPnOZtFjs4yJYKQ/Rz3C5L+hQQc+5WWuW/8iH+CbE/JvFMJIufgD/la
	 WXoOYDRjgquQ22FzoADILDwY0y+50G23wThJ7w5rdushm+viOq/cKihjDAX6ahgBCV
	 j7gtbeP/nJC1+UiVAx4/3OWObwDmErmmXWwfHfjWEhd5AQv5uiU3pnc0yzMdTszM3S
	 mxRHM0n3HqOTMr49WwtltP4bv2FHIxsAsT0/LaZrxTDwInuEibXIoZ7OCoiBaEMcwl
	 nXHxiNll+fwRctS0Q9vRoeozScxoK9jl74oqHnnieqENjA3uRN7678baOAmWee0D0G
	 rkzU0QRU37Sqg==
Date: Thu, 20 Jun 2024 17:12:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: regulator: mt6315: Document MT6319 PMIC
Message-ID: <20240620-opal-reopen-f2aeffc9b041@spud>
References: <20240620094746.2404753-1-wenst@chromium.org>
 <20240620094746.2404753-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w4lZ/5tY0n345UFW"
Content-Disposition: inline
In-Reply-To: <20240620094746.2404753-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_091229_747467_E0F62556 
X-CRM114-Status: GOOD (  12.24  )
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


--w4lZ/5tY0n345UFW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 05:47:36PM +0800, Chen-Yu Tsai wrote:
> The MT6319 is a pin-compatible drop-in replacement for MT6315 with
> slightly better electrical characteristics.
>=20
> It's unclear whether there are any differences, since the downstream
> implementation doesn't describe the MT6319 separately. Neither does the
> implementation check chip IDs, even though those are available.
>=20
> Add a new compatible for the MT6319 just in case differences are
> discovered later and fall back to the MT6315 compatible.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--w4lZ/5tY0n345UFW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnRU6AAKCRB4tDGHoIJi
0gLJAQCl0SjtBohHCsfZ30bxNNke2MgW+12GqK/R+y85NhloxAD5AWXCXO73HtXu
6i5ZD1ohpDU4ZkzCYIdvfAad4Okivw4=
=0rwv
-----END PGP SIGNATURE-----

--w4lZ/5tY0n345UFW--

