Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915FCC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 16:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmPobFKZyITksVEmr0RpHO8f4ZoHaixNr6Aoqa2HXzE=; b=OlrK8dllM7z/MkjVUhnWgpppUM
	yCh/36CdSTTArjdonzqaytVleP4GbIysrGsQ9lKfNZs5pK+QC6uvdSmDjy6AUMojR1IU/kxrdJlz2
	hBF3Jx530fGaGe+AR6q7G0RgPu4iAtJn2PXvJS416TaN1GawxZMUsLRgFQWHgos6XznmgfUl5zdbm
	CyAVKM8PyzaVKCCXovE8zEmtnBD0iSXYk/UFTx8g1o9AcHx+g2HvIJjmcIEV8xET2Zv5o6fss09Bq
	SJaF8v33/FIiu2Z9hzk4nKDSmHEeSA3CNpgxpemFgp5h4jqolUjytoolLs9SdH9DHElcIDqvSDG7O
	XkrL3KjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oafoY-0055PB-42; Tue, 20 Sep 2022 16:09:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oafo3-0055A4-Hu; Tue, 20 Sep 2022 16:09:11 +0000
Received: from mercury (dyndsl-091-096-056-222.ewe-ip-backbone.de [91.96.56.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6A81C660036C;
	Tue, 20 Sep 2022 17:08:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663690139;
	bh=U4MKHkfmJTO9JVdcD4fx4hWzMziGhHQzIgsluqhPYqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=giHCaviJ3ZXY7p6hA6RH72pU4MNDFjEt787CjL4I/zAeDUKaFDTNQQ7ahcllvt3Zg
	 53pJmkHK78HEJsq5x+eWUQJaji5LCfRpY7RXO29FMn4z0EkFV86z387dKdR/I/U+Kr
	 EBRO+S8PpEnlMOzxi/lNyqgSHPTCvRmZu2kvwT5KK4+bMAqnz1EMiMleWSeau6HH2W
	 QbrBZM0ICXDeNSAgzbUm8ScyhU3CtUJg3Lu9SNj6NfIxGVZlADeo1AoLd3HQk+NG6n
	 jGtpPSgj1LmTkI9cjmUkuhs0bdrYFYmZ7GMYxcB0fa0on+ipNPZQzoCgasQYxub/17
	 bNQRwYFv198kg==
Received: by mercury (Postfix, from userid 1000)
	id 7C66D10607CF; Tue, 20 Sep 2022 18:08:57 +0200 (CEST)
Date: Tue, 20 Sep 2022 18:08:57 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, jic23@kernel.org, lars@metafoo.de,
	broonie@kernel.org, mazziesaccount@gmail.com,
	andriy.shevchenko@linux.intel.com, chiaen_wu@richtek.com,
	alice_chen@richtek.com, cy_huang@richtek.com,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
	szunichen@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v11 1/8] dt-bindings: power: supply: Add MediaTek MT6370
 Charger
Message-ID: <20220920160857.6qfi66gtmgwesq7g@mercury.elektranox.org>
References: <cover.1663254344.git.chiaen_wu@richtek.com>
 <9382254831bb6ed8c228398a68896b0e8e61c7c4.1663254344.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lvjs3fe3c77xkyzo"
Content-Disposition: inline
In-Reply-To: <9382254831bb6ed8c228398a68896b0e8e61c7c4.1663254344.git.chiaen_wu@richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_090909_491687_DF47C835 
X-CRM114-Status: GOOD (  26.22  )
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


--lvjs3fe3c77xkyzo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 15, 2022 at 05:47:29PM +0800, ChiaEn Wu wrote:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
>=20
> Add MediaTek MT6370 Charger binding documentation.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
> v11
> - Add more detailed description of irqs.
> - Adujust the order of irqs
> ---

Thanks, queued.

-- Sebastian

>  .../power/supply/mediatek,mt6370-charger.yaml      | 96 ++++++++++++++++=
++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/supply/mediat=
ek,mt6370-charger.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt63=
70-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek,m=
t6370-charger.yaml
> new file mode 100644
> index 0000000..fd491c5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-char=
ger.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charger.=
yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6370 Battery Charger
> +
> +maintainers:
> +  - ChiaEn Wu <chiaen_wu@richtek.com>
> +
> +description: |
> +  This module is part of the MT6370 MFD device.
> +  Provides Battery Charger, Boost for OTG devices and BC1.2 detection.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6370-charger
> +
> +  interrupts:
> +    description: |
> +      Specify what irqs are needed to be handled by MT6370 Charger drive=
r.
> +      We need to use the IRQ "MT6370_IRQ_OVPCTRL_UVP_D" to know when USB
> +      is plugged in, and then the driver will enable BC1.2 detection.
> +      After the hardware of MT6370 completes the BC1.2 detection,
> +      IRQ "MT6370_IRQ_ATTACH" will be triggered, and the driver will know
> +      the result of BC1.2 detection.
> +      When the IRQ "MT6370_IRQ_CHG_MIVR" is triggered, it means that the
> +      hardware enters the "Minimum Input Voltage Regulation loop" and
> +      a workaround needs to be applied at this time.
> +      In summary, "MT6370_IRQ_OVPCTRL_UVP_D", "MT6370_IRQ_ATTACH" and
> +      "MT6370_IRQ_CHG_MIVR" are required in this charger driver.
> +    items:
> +      - description: irq of "USB is plugged in"
> +      - description: irq of "BC1.2 is done"
> +      - description: irq of "Minimum Input Voltage Regulation loop is ac=
tive"
> +
> +  interrupt-names:
> +    items:
> +      - const: uvp_d_evt
> +      - const: attach_i
> +      - const: mivr
> +
> +  io-channels:
> +    description: |
> +      Use ADC channel to read VBUS, IBUS, IBAT, etc., info.
> +    minItems: 1
> +    items:
> +      - description: |
> +          VBUS voltage with lower accuracy (+-75mV) but higher measure
> +          range (1~22V)
> +      - description: |
> +          VBUS voltage with higher accuracy (+-30mV) but lower measure
> +          range (1~9.76V)
> +      - description: the main system input voltage
> +      - description: battery voltage
> +      - description: battery temperature-sense input voltage
> +      - description: IBUS current (required)
> +      - description: battery current
> +      - description: |
> +          regulated output voltage to supply for the PWM low-side gate d=
river
> +          and the bootstrap capacitor
> +      - description: IC junction temperature
> +
> +  io-channel-names:
> +    minItems: 1
> +    items:
> +      - const: vbusdiv5
> +      - const: vbusdiv2
> +      - const: vsys
> +      - const: vbat
> +      - const: ts_bat
> +      - const: ibus
> +      - const: ibat
> +      - const: chg_vddp
> +      - const: temp_jc
> +
> +  usb-otg-vbus-regulator:
> +    type: object
> +    description: OTG boost regulator.
> +    unevaluatedProperties: false
> +    $ref: /schemas/regulator/regulator.yaml#
> +
> +    properties:
> +      enable-gpios:
> +        maxItems: 1
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - interrupt-names
> +  - io-channels
> +
> +additionalProperties: false
> +
> +...
> --=20
> 2.7.4
>=20

--lvjs3fe3c77xkyzo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmMp5YoACgkQ2O7X88g7
+po+exAAjROzmdoA45Q3bZM+ZLlt2yyMZ84hAR7M1vXnsFLzjftqxdNOu+P+lYX6
j+wUyf8+mINcJP4utRTyxk+O/H1R+fCC6H5Jt/IHMtPD9RcfOgDD6FDdeYVApNch
canxbBi9AKM9HrntaLu8OVWVuvmj15YwsSjXyTKJiRaVdqvcAwToToNkxeZRD1/p
LBufMpBnVIvtWIkamOa3p0iEpuAg5p2AHHeTOVdO9xDTOiAFE3y+k2bkt57WE8ye
s0Ah8LRl/ekhaQjTbDvX4ycHtyw16wUtT8mVu7ZezA8JnSoNrCJm3DAY6qvBc6dL
IKLzd0gZ5hq4xQzmbUJ3KiP3nwtFaOnOzDXE2aAs3X2m0CQc6nC9o2ZcQVBm12gF
namJgZ+/YWCQm3KDvc/ipL8hpkf7jti+TWhRs6WWJza6Rghr+NIcET/GmGHYff8G
HWtp/oOaNwr6Rw8HCxkGD1ew0TUTOrpt6iWhaCcVjKhMsbLvjqYmIR0DSIlOEErT
quIppiPo9YId/JfDENIGuUJXFyd6ZQsjC8tuCcWYTQJOFG42LSjRW9/mUHCHn1Rz
6sE/gyCUN5OOfcPWm0j1nHG9Ob/iVHupmWwjfgBJcD/QwV/v7ePz5BxJxgLLCILd
jnEnmxLe0Rpcdu25YT11/s4lPrf1lPUqCBIsjPlQ5HLvDNTekzQ=
=TGYa
-----END PGP SIGNATURE-----

--lvjs3fe3c77xkyzo--

