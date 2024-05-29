Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD09C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 16:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Co2qg+TJJwG1cdw7waSP5z0AV55HwS75OlD+VmDcEE4=; b=zzizFipoBYbBcpX9z1fHMeiudi
	cDg3YebmkTRxEkZLS4CTcNIZ688XSKKTy57PavNK2tZ7zkfTUtaHFyWLYBPSd8SmXrYSAeKJQvdSP
	TKgklhJzbMJAKESpHmVeNnSbC+0IyoCLrQ5bgm3lBYpN/mloBWFyoa0ySROxugqRVKYKgO+v31SEa
	gTpKFf0hF4HOqKXuGd6hdMoZ61y80g3W7a0wRhrnExnPFw0PbVnNaThdioloo+1a5htB6xmhyj3Qk
	XEK30WePhSCvuJQS9Y9cl4tpoDR21jnsz7y08688aobBRGi1/NFR695jB+AQe6s+lz5/QY/twao8C
	6V0RyS3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCMCR-00000004vS4-0S7y;
	Wed, 29 May 2024 16:30:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCMCA-00000004vLO-2t5O;
	Wed, 29 May 2024 16:30:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5AF4360DB9;
	Wed, 29 May 2024 16:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4675C32782;
	Wed, 29 May 2024 16:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717000233;
	bh=Co2qg+TJJwG1cdw7waSP5z0AV55HwS75OlD+VmDcEE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZGPXSqFbjYUCcjbFL5GWTiK7Vm/SwPwOVtfBCFoRAkvuj+pLlv3SGFdyP34Rzlh9E
	 leuoNBwKYvcJO2ssAOejaWPwmIztoVOq7IN/ME402JYUkjNaiY6wfqIBY//9Ia0bTG
	 4MuyTRJVVp1GxutBVQyr9DamSmHkgkfhEHHurNcS/JVzlm5Y5apfpXGJx8NnVxYjEn
	 IwGmowN9PMxFE2NkXM0wmJCNrxd6A1oKH1V5GyrwTEuJbETMghSwkxpvfWmVYiYnno
	 m0hqbk6e/G2ZUeoMs+raMHZf8SDj7FTBM2Rg1a7F/z/LNRyaBY2s9q/7JgC5i88rJ6
	 AhrRgAp+a/pog==
Date: Wed, 29 May 2024 17:30:27 +0100
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
Subject: Re: [PATCH v6 2/6] dt-bindings: thermal: mediatek: Fix thermal zone
 definitions for MT8188
Message-ID: <20240529-decline-dispose-317d2424dd79@spud>
References: <20240529-mtk-thermal-mt818x-dtsi-v6-0-0c71478a9c37@baylibre.com>
 <20240529-mtk-thermal-mt818x-dtsi-v6-2-0c71478a9c37@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wbng8XqgGFHQpAGV"
Content-Disposition: inline
In-Reply-To: <20240529-mtk-thermal-mt818x-dtsi-v6-2-0c71478a9c37@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_093035_138328_80D819FB 
X-CRM114-Status: GOOD (  15.02  )
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


--Wbng8XqgGFHQpAGV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 07:57:57AM +0200, Julien Panis wrote:
> Fix thermal zone names for consistency with the other SoCs:
> - GPU0 must be used as the first GPU item.
> - SOCx deal with audio DSP, video, and infra subsystems.
>=20
> The naming must be fixed "atomically" so compilation does not break.
> As a result, the change is made in the dt-bindings and in the LVTS
> driver within a single commit, despite the checkpatch warning.
>=20
> The definitions can be modified safely here because they are used only
> in the LVTS driver

"and have not yet made it into a released kernel"

If they had, use by only one driver would not be relevant.

>, which is modified accordingly.
>=20
> Fixes: 78c88534e5e1 ("dt-bindings: thermal: mediatek: Add LVTS thermal co=
ntroller definition for MT8188")
> Signed-off-by: Julien Panis <jpanis@baylibre.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--Wbng8XqgGFHQpAGV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZldYIwAKCRB4tDGHoIJi
0qGzAQDZhJyCgPNEJHIJ7mXbbcYVHRlMNBgAb4Tq2p+X+qWTmgEA3nONB2IL0yxf
RuC6BgPITxiOsShcvlqhbRuUc4kzmAc=
=sTBt
-----END PGP SIGNATURE-----

--Wbng8XqgGFHQpAGV--

