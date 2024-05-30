Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8C2C27C44
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 15:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euUKL3giV/ho/PPa2wLumzm+nzQsUuxb34Rbrl9xhq4=; b=KbFCw055U+cuHKlZ/Ryw5s7VqI
	we0TR/szbo4UrjG5+gq225QCbcIOzT1jQ86Jz6AA2qe2pFrUVsqC/fYXEfy44yVrQ6FZssQNbwGEA
	1W0gdQaWY9Kmy8dOGrp2D6qkPw77URbpUkX67FOwY4Iz6bS0XSlx60kaMKyHAEPiN4ocChh0OvuKD
	FA/Y5US9vyIhAEuaG30jzXk81UkHmII9ZSj8JVN1o7RnMdxIzCyt+hgNcTuzh6SclySP/bM4AANQP
	vf25NM+GKili4kx2ZRRTxzXkZGF+FUsGLmOevpVkdE/UYnuRvw8AUFqL2zdFFrPphotmFxhh9wEWt
	zLWMV/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sChro-00000007k36-0xWs;
	Thu, 30 May 2024 15:39:00 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sChrk-00000007k1j-1ENi;
	Thu, 30 May 2024 15:38:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E4D66CE1AC3;
	Thu, 30 May 2024 15:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDDCC2BBFC;
	Thu, 30 May 2024 15:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717083529;
	bh=euUKL3giV/ho/PPa2wLumzm+nzQsUuxb34Rbrl9xhq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bTA3S5kn8ZlDjfTHAJ2im+bwNbQ1fjIQ6OiYCMdv8ybz9xvAoNcDz5vXlakFzfcZs
	 zHC/+M8zb/rCdvbDJh5gjPenw0N90iz3U3UxXH0BCllvkroQC9wY5Gs8KTgQwx0Ap2
	 JGwR4/e00D0nYeHNcyuSCmLP3rn43yFocmV308q+/RBjIWASDzyZLOMjbzcsVDeIkr
	 JMAgaPyGXD9tAOejZl8wwWRyXzD8qSV/qrqMxzr5rhOHaTTCTgsgwF07SKuJ6H+l79
	 6KTxARwkFXBaOSsDu3vQcpPBJv6LMWuqdMqNdjS4+UYmGvSOd9j+XascoQ4e7q6AcY
	 NHvo6eobGTuDA==
Date: Thu, 30 May 2024 16:38:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: gpu: powervr-rogue: Add MediaTek MT8173
 GPU
Message-ID: <20240530-reptilian-revolver-a8cb1f2af8ba@spud>
References: <20240530083513.4135052-1-wenst@chromium.org>
 <20240530083513.4135052-4-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u4tlLkr2QYvGk/ip"
Content-Disposition: inline
In-Reply-To: <20240530083513.4135052-4-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_083856_645156_8A8FEEF2 
X-CRM114-Status: GOOD (  13.18  )
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


--u4tlLkr2QYvGk/ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2024 at 04:35:02PM +0800, Chen-Yu Tsai wrote:
> The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is one
> of the Series6XT GPUs, another sub-family of the Rogue family.
>=20
> This was part of the very first few versions of the PowerVR submission,
> but was later dropped. The compatible string has been updated to follow
> the new naming scheme adopted for the AXE series.
>=20
> In a previous iteration of the PowerVR binding submission [1], the
> number of clocks required for the 6XT family was mentioned to be
> always 3. This is also reflected here.
>=20
> [1] https://lore.kernel.org/dri-devel/6eeccb26e09aad67fb30ffcd523c793a43c=
79c2a.camel@imgtec.com/
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--u4tlLkr2QYvGk/ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlidgwAKCRB4tDGHoIJi
0jEUAP9dytPUMftkwmUYeOy5IxYQ34BgC+UeoK8voSx1buveXgEA3if/Ue6idDKS
pCr8yS7NaLjlC7pujPpYExaUI9Mb/gk=
=y4xH
-----END PGP SIGNATURE-----

--u4tlLkr2QYvGk/ip--

