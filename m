Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F20BC25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 16:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYdkjdSXyiR/ZuFtGlShz00ja3BWPAVDGFZYZYgXGZM=; b=hpFbIXnLNakczMWw6sbwG97HIg
	6fCtk3uK6cIktOtjqo/EJvy0yRYIb+FlHCqyV4V0Iuzpvq67TGIjZSnVtR8Jtsl4jl95Plx8igXGc
	UvcnnMvS7xHZKhR6B7i4DGf+8k6+tXJiP/Ze1IXwU6Jv/y1zLy32OLHp6O7OiBe+ODRxT6CZG5Pag
	1PaTx1nCfhTFi20JXU6TGYxzZO/GiaS0DUoTCi9E9ZEwm5ytzWxJttzRxMbQNBhi82/MSOmnCl8XC
	tc5dI5zQI2A4V4jr+t9BbDpHZLhTE3dQrDMmWHJ8KdmDXqfF/d+WYcQcwD7X529+1KwoyaqBD+Bot
	LHeVpX9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCMDC-00000004vjt-0EFM;
	Wed, 29 May 2024 16:31:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCMD2-00000004veO-3OuU;
	Wed, 29 May 2024 16:31:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2572961628;
	Wed, 29 May 2024 16:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952BAC113CC;
	Wed, 29 May 2024 16:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717000284;
	bh=DYdkjdSXyiR/ZuFtGlShz00ja3BWPAVDGFZYZYgXGZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oarz3zGYrcFhmGFxAxtWHp33tjXeN69LQudYBG60n+rh1l2pkYbgtEK+xYHBimFlV
	 y7Muq0Dh41NXlZVlNBAWLtia9YcQYxv9U6e/8tZ2LT0vBeJfalZrBy4LIG5m7v0faD
	 yVEqH3qQcrlOM5BoYDXmCuhOGUVoYhsF+VPINk+x544p8Z3zrnT9YLwpo6p5cMD76Z
	 VlyoavgBcESVxi2WjFegdLdd1LcNwBB6mSOH5rLgdopYH79EGYv47Tv5HYXxB2Ooe2
	 UOjRbkznRC3uq/Gt3+h6luVjIytft7UrpQiWAzS+LyuhOw2M4Z1k4hJ3npQHq+ZhhE
	 +L43CgUqCGqBQ==
Date: Wed, 29 May 2024 17:31:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Julien Panis <jpanis@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Nicolas Pitre <npitre@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v6 1/6] dt-bindings: thermal: mediatek: Fix thermal zone
 definition for MT8186
Message-ID: <20240529-projector-murkiness-43cdc28ef8db@spud>
References: <20240529-mtk-thermal-mt818x-dtsi-v6-0-0c71478a9c37@baylibre.com>
 <20240529-mtk-thermal-mt818x-dtsi-v6-1-0c71478a9c37@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FB5kYnsTwm49RHjJ"
Content-Disposition: inline
In-Reply-To: <20240529-mtk-thermal-mt818x-dtsi-v6-1-0c71478a9c37@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_093129_204823_5E0B2F92 
X-CRM114-Status: GOOD (  14.66  )
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


--FB5kYnsTwm49RHjJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 07:57:56AM +0200, Julien Panis wrote:
> Fix a thermal zone name for consistency with the other SoCs:
> MFG contains GPU, the latter is more specific and must be used here.
>=20
> The naming must be fixed "atomically" so compilation does not break.
> As a result, the change is made in the dt-bindings and in the LVTS
> driver within a single commit, despite the checkpatch warning.
>=20
> The definition can be modified safely here because it is used only
> in the LVTS driver, which is modified accordingly.
>=20
> Fixes: a2ca202350f9 ("dt-bindings: thermal: mediatek: Add LVTS thermal co=
ntroller definition for MT8186")
> Signed-off-by: Julien Panis <jpanis@baylibre.com>

Same comment on the commit message here. Otherwise,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--FB5kYnsTwm49RHjJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZldYVwAKCRB4tDGHoIJi
0jNgAP9t834oweQiI/O+4bJjB1Kzupjg2kkDDNhblETX3ni5LAEAktvJnAzd9hrE
qQYWhY0/mj24Z48k98MFMTttMrJ3SQI=
=b+YI
-----END PGP SIGNATURE-----

--FB5kYnsTwm49RHjJ--

