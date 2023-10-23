Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045B7C25B48
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 17:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxvjN6Xo1PD2ezzFm9+/m+//hSvdbfwH37CWSmbFOFU=; b=XVBW5+OTphPIgME+7k+H7y4d73
	T4HmRU2787yotTGxgf++Y009zdCllTKOvgIWbUrdmLW4cfUhdvE2CBtWZL8XbT+USRUCSmZFmuAcA
	YuEuntTGMVOo8Q8auuoLSVnKCRVf0WmfM0z++OwITZArpKgClLkDINbo8U+B+stu454amG53KoXjt
	g+a1HbdJJ0RR2GMw4EB9j5P9r8CUGOVQSOFy+nnfV+eufx6NEq9OZb1kYO2mjf0bTHPSswhf1fKMw
	qED3efg2WawTNUppq0rQHx8/pPQG94rZqI+v+LtHszdSly8oGOUR/tt1G/PoOV6/SFdH3FPlO22GM
	8/z9Vg+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quypv-007yAH-2u;
	Mon, 23 Oct 2023 17:35:31 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quyps-007y9B-1w;
	Mon, 23 Oct 2023 17:35:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A4EDDCE2720;
	Mon, 23 Oct 2023 17:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968CBC433C8;
	Mon, 23 Oct 2023 17:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698082525;
	bh=BPsE2TYkM2613e3ORqfh9B9Y3/8Ij1mb26ewDxwWDzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TdQC8FTfR0s1jwG1/q5nVOQFCWzWe9Atplf8qpSMQZxZVWLeV1XzpLOsKzwbxb1Gl
	 ZKSiSTpcUdU1cUOBeWKa7HEuE0osGLTKai3sxwHpQCIn9Jkrj72mpZCmGibX/1buPX
	 ftxAOwWqbOb7WCnICbONephB/gX1F9xxrd9DfN/VUKeWYFcfex1utcHsZRpXINPr/q
	 aWmFOTD+4w/ae2LmYNOof7fLzppHYjFIvr3g3/4iRri7GBvkVOkSFWfnTlhPjyLKlw
	 lEME9aGhAeCxFVyyIjixvS6z2Ya1dlzYt1epCdts9EM30NiS2Y7T53zosjjQQsuTvj
	 5a37zQa5EzrJw==
Date: Mon, 23 Oct 2023 18:35:19 +0100
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
Subject: Re: [PATCH 12/18] dt-bindings: pwm: add binding for mt8365 SoC
Message-ID: <20231023-punch-gurgle-80608ba40e7d@spud>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-12-5c860ed5c33b@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9wFKPiotZ+nS4D8K"
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v1-12-5c860ed5c33b@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_103528_817958_6F2DF0D3 
X-CRM114-Status: GOOD (  14.98  )
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


--9wFKPiotZ+nS4D8K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 23, 2023 at 04:40:12PM +0200, Alexandre Mergnat wrote:
> Display PWM for MT8365 is compatible with MT8183. Then, add MT8365 binding
> along with MT8183 SoC.


Additionally here, for the subject,
"dt-bindings: pwm: mediatek,pwm-disp: add compatible for mt8365 SoC"

Cheers
Conor.

>=20
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml=
 b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> index efe0cacf55b7..e4069bcbf8d5 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -32,6 +32,7 @@ properties:
>                - mediatek,mt8188-disp-pwm
>                - mediatek,mt8192-disp-pwm
>                - mediatek,mt8195-disp-pwm
> +              - mediatek,mt8365-disp-pwm
>            - const: mediatek,mt8183-disp-pwm
> =20
>    reg:
>=20
> --=20
> 2.25.1
>=20

--9wFKPiotZ+nS4D8K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTau1wAKCRB4tDGHoIJi
0n6KAP401YOndtWBYtrAA9j00NQ1rbaxsQ12/nOOlOHoIE47sgD/dyHbi8nYdivw
3A9/hktb+hRamMtGYKFeqUMDkK7ByAY=
=vkEz
-----END PGP SIGNATURE-----

--9wFKPiotZ+nS4D8K--

