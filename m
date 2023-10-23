Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38389C25B46
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 17:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LeEK8YK/Qmt8aW/nVau7BtSeeGLKHMBHQNZXUYZ8jNo=; b=UloX32e6DArtfISd/M9qaXqsAu
	xmLefpiM80mS86MtIF2+lSUIZJ07Lo4hMhJAvQ/XcGP5K+fr+C4mu/z2IVGXIIprmqxaBsjaiCnk6
	zfeW6qEFQ5Shx4RnjRnShsTQGV8f1fyoPoge0cESHsu/MoRv5nmxKusmsJykPjySLr8+EA710M4Q4
	tLDfAEzMWtYsG7wT3vN2Wh7sZSW4+Bj+YXTdD3DuW0xD118to67RNC3+W1UZUMVzGDk3DsRXthe0j
	y5dRKpy3x6fLcIyUfTKiSfFM2ouaYFk4UeVTb1PiKoGXhuXr3UTuAyF6IWpJniP2LIxHdFVaIrmen
	uBAwYQOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quyLZ-007tBv-2c;
	Mon, 23 Oct 2023 17:04:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quyLW-007tAb-0V;
	Mon, 23 Oct 2023 17:04:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8B053B81A71;
	Mon, 23 Oct 2023 17:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92865C433C7;
	Mon, 23 Oct 2023 17:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698080643;
	bh=Z9iY3lsaZZ0k2Yw6281j4HRYsuuLhnj+PAotK0K3VDc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PDyPGJr3cK+jKb5Cq6EVOd3FAvj4jLd1F5V5I2zaSliCU4SDbKApT9Rn3rgvbcB/e
	 h96zO1DsiEGno/PSW6UhjDGACMyFRcts7xpOnFhKLV24YqpawYWsdPdFRBT571oEMZ
	 IrPmsb6HRdJTq6n+Uo836v53fH/5gKP0iIFMPA07msGpOWiK8AWIQCoUZlyWW3uKZU
	 a4I1A3mdePhDk5Lb5DHLzXBL4tTlGwxyfeeKf4eIfCyNzdv/xppPOA4Ij+9U3pc+Dt
	 +ISwR95IHhxVQJQntGzb62eA2io51O2nTyxGhxyj6gJbmUC38uTS0jCnBdxWs2kRa0
	 TizIz5NDcMF+w==
Date: Mon, 23 Oct 2023 18:03:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Xinlei Lee <xinlei.lee@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 01/18] dt-bindings: display: mediatek: aal: add binding
 for MT8365 SoC
Message-ID: <20231023-sharpness-uplifting-634566c6b4ff@spud>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-1-5c860ed5c33b@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PbLYAkV5QGg0voCF"
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v1-1-5c860ed5c33b@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_100406_591389_A5DA2EF9 
X-CRM114-Status: GOOD (  14.52  )
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


--PbLYAkV5QGg0voCF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 04:40:01PM +0200, Alexandre Mergnat wrote:
> Display Adaptive Ambient Light for MT8365 is compatible with another SoC.

> Then, add MT8365 binding along with MT8183 SoC.

s/binding/compatible/, here and in the subject.

Cheers,
Conor.

>=20
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml | 1=
 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.=
yaml
> index 7fd42c8fdc32..840b48a878ca 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
> @@ -35,6 +35,7 @@ properties:
>                - mediatek,mt8188-disp-aal
>                - mediatek,mt8192-disp-aal
>                - mediatek,mt8195-disp-aal
> +              - mediatek,mt8365-disp-aal
>            - const: mediatek,mt8183-disp-aal
> =20
>    reg:
>=20
> --=20
> 2.25.1
>=20

--PbLYAkV5QGg0voCF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTanfQAKCRB4tDGHoIJi
0tPUAP9cTTvfIBq9I7y7WjmhtsRZbhjBWhdUzs8mmYekmW17xAEAnCJCpDVwVruG
ZkQOxyU76MLSecahlFO14YNh1wBwEAk=
=wX+W
-----END PGP SIGNATURE-----

--PbLYAkV5QGg0voCF--

