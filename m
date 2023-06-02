Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8903EC7EE29
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 17:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTXPopgHyEmhEAnBO2qY56Uwx+qlhlFJL9zBNYf1Gu0=; b=zt5H/xDuoDt5EeovGHa1doFZ9+
	fgc9/tFI1dTSdVyD29qtuYOaCuADLR4f0YSWZ05ByULNpTIs3soCvmcavduIm5V7fOBD+iHljMK5A
	AanpMNMar21DWBL/F52+Oh8+Ld2PwPSmF3T9qHbBpB9fxy51Ohp2HR+bud3u7Orj99hKG7XJn4tMS
	UsQ/CTkXlWVaz95MMGhHUKGYxTOmSE6rcBwMiwR5z16r+NyE8n4DwKPMfBzw+dbuGsd3mi/YVHoSB
	fVcA6FpKWIK91DjieiUg0QubwVoJUNGoSlSWU4ytyaJRMJdQcbwG53cMA0WY5TFf/GcSoytdw78aG
	yyX7dcLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q58y3-007Zn9-1W;
	Fri, 02 Jun 2023 17:53:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q58xz-007ZmY-0k;
	Fri, 02 Jun 2023 17:53:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C7D6C60DCB;
	Fri,  2 Jun 2023 17:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F5FBC433D2;
	Fri,  2 Jun 2023 17:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685728414;
	bh=b9kqJeL7cB8BeNqJEwvKkD/C4WuuGR4Ka56IkoyPdZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uZ6mOuJVbaEs4cQyr4LZnHZh/yUVRjDOlp1Ioa6RC71KmCQfxKDLraKbbwMGGZj0z
	 G5gtS5y/vq3pkIMIB++bB6fGpe1G5liOJzZj61Z7hSbOPcGZ3MCU+6uA9DlRWzR862
	 MR9umtnYTtIEJcF4A3oaYPPspc2d0ECbtXY46ih2us0zG/LzK32MYl32FjSnW45u8Z
	 MTLQi7K7uQNo9Jq/63FaI6K793namWs0XsMqjCj5dhupydAhKBQ9GCqGukNhOx0Nf5
	 zLWRP+cUJwaG/mUcsKmalR75rd9L+Yp4yijOhZnUwdK8k0ygBp2VCMkQFqdl9YIL+3
	 wrhZUnL4IiOFw==
Date: Fri, 2 Jun 2023 18:53:28 +0100
From: Conor Dooley <conor@kernel.org>
To: matthias.bgg@kernel.org
Cc: rafael@kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: thermal: mediatek: Move auxdac
 binding to yaml
Message-ID: <20230602-pacify-dares-0989f2c759b2@spud>
References: <20230601134425.29499-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/PBB13aRPpKxOFCF"
Content-Disposition: inline
In-Reply-To: <20230601134425.29499-1-matthias.bgg@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_105335_351143_EBB82957 
X-CRM114-Status: GOOD (  28.97  )
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


--/PBB13aRPpKxOFCF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 01, 2023 at 03:44:24PM +0200, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
>=20
> Convert the older binding to yaml syntax.
> The thermal IP has several sensors, to reflect that
> thermal-sensors-cells is set to '1'. Apart optional regulator
> for bank supply wasn't part of the old binding description,
> this patch adds them.
>=20
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>=20
> ---
>=20
> Changes in v2:
> - drop auxadc and apmixedsys nodes
> - maxItems for clocks
> - drop obvious description of reset
> - mention optional regulators in commit message
> - mention thermal-sensors-cells change in commit message
>=20
>  .../bindings/thermal/mediatek,thermal.yaml    | 152 ++++++++++++++++++
>  .../bindings/thermal/mediatek-thermal.txt     |  52 ------
>  2 files changed, 152 insertions(+), 52 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,th=
ermal.yaml
>  delete mode 100644 Documentation/devicetree/bindings/thermal/mediatek-th=
ermal.txt
>=20
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,thermal.y=
aml b/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
> new file mode 100644
> index 000000000000..bbc9c2935da0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,thermal.yaml
> @@ -0,0 +1,152 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Thermal Sensor
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +description: |
                ^
You don't need this btw, unless you have formatting to preserve.

> +  The MediaTek thermal controller measures the on-SoC temperatures.
> +  This device does not have its own ADC, instead it directly controls
> +  the AUXADC via AHB bus accesses. For this reason this device needs
> +  phandles to the AUXADC. Also it controls a mux in the apmixedsys
> +  register space via AHB bus accesses, so a phandle to the APMIXEDSYS
> +  is also needed.

> +  reset-names:
> +    items:
> +      - const: therm

> +  nvmem-cell-names:
> +    items:
> +      - const: calibration-data

You don't need the "items: - const:", "const:" alone is sufficient.

> +
> +  mediatek,auxadc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the AUXADC which the thermal controller uses...
=2E..to read the on-SoC temperatures as it does not have its own ADC.

Moving the information out of the description down here seems like it
would be better than what the original text binding does. Sorry for not
point that out last time around.

> +
> +  mediatek,apmixedsys:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the APMIXEDSYS controller...

Ideally the information about the purpose of the mux would go here, but
I don't know the purpose of it :)

> +  "#thermal-sensor-cells":
> +    const: 1
> +
> +  bank0-supply:
> +    description: Regulator supplying voltage to the first bank

Since I am an eejit, first bank of what? Sensors?

Otherwise, LGTM.

Cheers,
Conor.


--/PBB13aRPpKxOFCF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHosmAAKCRB4tDGHoIJi
0i3eAQDTiUYAwX9JPVS3gO5Z7cj7YBFJT4ql+2b/vG0SvLN9PwEAmPXWtqSLISGI
EH42+4j4s+1DWnLiQj/R9cdkpYNLeQE=
=LSEq
-----END PGP SIGNATURE-----

--/PBB13aRPpKxOFCF--

