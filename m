Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2ACFCF9C71
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 21:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhVIkYYam35mTCNvxD8+iXXElx/rv7x57VwyLUJ2qQc=; b=ywiNAZjYFVf0jEqbNSoyz/Tj2H
	LxPLqgg7cUCg8uFgIZMTRO5G3/K+swl3IonbpLtXlEhcfiOASFf06bZHzgsIudq3qHIGlvdYEQeZa
	gLhN+6pWHa3jD9HdBBDFeFILzE3IWnTEj08qZrNNXt7ZqNrF4kk5yD6op6fePCWQtOMQnDFvZ9AVS
	rTb5+quoHuqPW0HkX/x53kASoMavtESmKf5ApV8lAB2ty4GItZXti55UpCEGvlTIAehLbfzMNgsM3
	knuevrTif9eHhTxXMRZe/Zj+CDPyRJDzf/KKHzI3ufNDwKOjiEIwESz+pkEoQbR1yycokmRkRV0f/
	hKGNP+Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssqW6-00000000VO4-0Vvj;
	Mon, 23 Sep 2024 21:22:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssqUx-00000000VGT-1GWJ;
	Mon, 23 Sep 2024 21:21:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32BA05C4768;
	Mon, 23 Sep 2024 21:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C01C4CEC4;
	Mon, 23 Sep 2024 21:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727126493;
	bh=PhVIkYYam35mTCNvxD8+iXXElx/rv7x57VwyLUJ2qQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=scMkj888oGGRxDs0fVHaWnf/HGRoWyuAPBbbyzGE8fB+Fpuj+QN931FnQS8yuGdo7
	 wufD/ODhnCFAZJZrJS9DaEoZsDWh1KQ/GRbWb9+LvSYpgEohlYJHikwCBeYKMe1a4I
	 NhcV6wUEEFSIcEHSer70MrIM2UWWDFbIARXiUGWDYuEWzuZ7Q/QWC/VZC8pcCmpBmA
	 JUbcRZKOzEY8joj9X/YRWMlC+Gh9vOrk5D2VyLXoCoA7IApQ1/AqSBdprsp06WbAEy
	 Y2hBhUDx30GpM16oqMkmGlsXIBanox+toKqnSqEHVGZA8401dK1ONqG65q/kS2F8Ty
	 xQtuvbzExBoMg==
Date: Mon, 23 Sep 2024 22:21:28 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	eddie.huang@mediatek.com, sean.wang@mediatek.com,
	alexandre.belloni@bootlin.com, sen.chu@mediatek.com,
	macpaul.lin@mediatek.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 1/3] dt-bindings: mfd: mediatek: mt6397: Add
 start-year property to RTC
Message-ID: <20240923-breeching-trusting-6dc59af2dba0@spud>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
 <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uOMUhhLvLeNabVr3"
Content-Disposition: inline
In-Reply-To: <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_142135_428823_FC20EDF3 
X-CRM114-Status: UNSURE (   8.74  )
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


--uOMUhhLvLeNabVr3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 12:00:08PM +0200, AngeloGioacchino Del Regno wrote:
> Enable evaluating the start-year property to allow shifting the
> RTC's HW range.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--uOMUhhLvLeNabVr3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvHb2AAKCRB4tDGHoIJi
0nj7AP9LIRHDUXGKaJRyhWfKcV4KwbtbqVNur2OIJ/OgAOmC6AD/cy/Ivoq02P8w
1UtX0rheLn5Y9M9UzaqtpEjhgfMWbwA=
=ncCH
-----END PGP SIGNATURE-----

--uOMUhhLvLeNabVr3--

