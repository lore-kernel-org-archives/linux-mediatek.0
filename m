Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE43C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 16:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKUY8wMvlf3ThsuzneW8FzSUg+Hx3yIePwtgnbnY2vA=; b=r+7IeT1iaAe7ZaYy82NlN7eA/R
	yGq2wYvy8WmMRzm/2I+TnlaNZeCBUNmKDVbiIkzX/uOIxx8ULugOFMBcQ+1JaBJQEPipXcdhc7Z8C
	4dvErgQpRNwAcyo5zWym3moHTWT7s/9daHl/yobnNwrCbVA3h7FI5l5m3XucKkKCF1UJlaBVpYQEc
	iDbJezznA1aZ6GB0si+1UePXMBO6MGJAkJP3Jtss4qbiE1/Pkco2O7dYGNNp2VvtCcmNh94J4RT64
	+3gH0mWihIG7V5PE+xZ42W+oxi73I3toAWdpnwV+vcL+wnoxIkuSPRQzoQu03dyGYM4aafByYuVYe
	jyv1NaMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD5iZ-00CEdr-0d;
	Tue, 12 Dec 2023 16:34:47 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD5iU-00CEbq-36;
	Tue, 12 Dec 2023 16:34:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 13C97CE1B13;
	Tue, 12 Dec 2023 16:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D525C433C7;
	Tue, 12 Dec 2023 16:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702398880;
	bh=g2a56e62f1QR0Jl7KNZYJTND0ori66RuqZzkYc6oMlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gFmCRVTwPW/8FgmP7cYdIf0PGDjGM/re2ld590en2DBn4UYcNh9iw+22jKNVRcor5
	 Gi3+cL050zhrp1mi8HCTQInUcrUxLfAyzfpZRv415+TskrRtNde+gl/hcLQcg+HPdi
	 XP+nb8XkQXpBYFuOnOL0W/cXWAcZeGwXXDRhoN0X9OobPo5KfgNJg24e3Zel/bEQtl
	 qiUR6tove+QGmVFyNZnD3BSzZLZH+ZiP1fCI/WdDxhRWb/HkJtcexsuQoiYORedSF9
	 eYJOOcmkr4+ZecZpvzJj0VFuDb2JMN+JfeNak80+B9zCnQq0keO2FmJoqeq/pERblV
	 MRhzIu+jZaxZw==
Date: Tue, 12 Dec 2023 16:34:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexander Couzens <lynxis@fe80.eu>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH net-next v3 7/8] dt-bindings: net: mediatek,net: fix
 and complete mt7988-eth binding
Message-ID: <20231212-unlinked-audio-94132ec03663@spud>
References: <cover.1702352117.git.daniel@makrotopia.org>
 <ac6a7277fc534f610386bc51b2ff87beade03be8.1702352117.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8FGijifStTHJdg+0"
Content-Disposition: inline
In-Reply-To: <ac6a7277fc534f610386bc51b2ff87beade03be8.1702352117.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_083443_661154_67408D1C 
X-CRM114-Status: GOOD (  19.72  )
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


--8FGijifStTHJdg+0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 03:51:01AM +0000, Daniel Golle wrote:
> Complete support for MT7988 which comes with 3 MACs, SRAM for DMA
> descriptors and uses a dedicated PCS for the SerDes units.

The commit message here seems a bit incomplete, mostly a lack of an
explanation for why the model was initially incorrect.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> Fixes: c94a9aabec36 ("dt-bindings: net: mediatek,net: add mt7988-eth bind=
ing")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml | 148 +++++++++++++++++-
>  1 file changed, 146 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Do=
cumentation/devicetree/bindings/net/mediatek,net.yaml
> index 030d106bc7d3f..ca0667c51c1c2 100644
> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> @@ -28,7 +28,10 @@ properties:
>        - ralink,rt5350-eth
> =20
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Base of registers used to program the ethernet cont=
roller
> +      - description: SRAM region used for DMA descriptors
> =20
>    clocks: true
>    clock-names: true
> @@ -115,6 +118,9 @@ allOf:
>                - mediatek,mt7623-eth
>      then:
>        properties:
> +        reg:
> +          maxItems: 1
> +
>          interrupts:
>            maxItems: 3
> =20
> @@ -149,6 +155,9 @@ allOf:
>                - mediatek,mt7621-eth
>      then:
>        properties:
> +        reg:
> +          maxItems: 1
> +
>          interrupts:
>            maxItems: 1
> =20
> @@ -174,6 +183,9 @@ allOf:
>              const: mediatek,mt7622-eth
>      then:
>        properties:
> +        reg:
> +          maxItems: 1
> +
>          interrupts:
>            maxItems: 3
> =20
> @@ -215,6 +227,9 @@ allOf:
>              const: mediatek,mt7629-eth
>      then:
>        properties:
> +        reg:
> +          maxItems: 1
> +
>          interrupts:
>            maxItems: 3
> =20
> @@ -257,6 +272,9 @@ allOf:
>              const: mediatek,mt7981-eth
>      then:
>        properties:
> +        reg:
> +          maxItems: 1
> +
>          interrupts:
>            minItems: 4
> =20
> @@ -295,6 +313,9 @@ allOf:
>              const: mediatek,mt7986-eth
>      then:
>        properties:
> +        reg:
> +          maxItems: 1
> +
>          interrupts:
>            minItems: 4
> =20
> @@ -333,8 +354,12 @@ allOf:
>              const: mediatek,mt7988-eth
>      then:
>        properties:
> +        reg:
> +          minItems: 2
> +
>          interrupts:
>            minItems: 4
> +          maxItems: 4
> =20
>          clocks:
>            minItems: 24
> @@ -368,7 +393,7 @@ allOf:
>              - const: top_netsys_warp_sel
> =20
>  patternProperties:
> -  "^mac@[0-1]$":
> +  "^mac@[0-2]$":
>      type: object
>      unevaluatedProperties: false
>      allOf:
> @@ -382,6 +407,9 @@ patternProperties:
>        reg:
>          maxItems: 1
> =20
> +      phys:
> +        maxItems: 1
> +
>      required:
>        - reg
>        - compatible
> @@ -559,3 +587,118 @@ examples:
>          };
>        };
>      };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/mediatek,mt7988-clk.h>
> +
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      ethernet@15100000 {
> +        compatible =3D "mediatek,mt7988-eth";
> +        reg =3D <0 0x15100000 0 0x80000>, <0 0x15400000 0 0x380000>;
> +        interrupts =3D <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        clocks =3D <&ethsys CLK_ETHDMA_XGP1_EN>,
> +                 <&ethsys CLK_ETHDMA_XGP2_EN>,
> +                 <&ethsys CLK_ETHDMA_XGP3_EN>,
> +                 <&ethsys CLK_ETHDMA_FE_EN>,
> +                 <&ethsys CLK_ETHDMA_GP2_EN>,
> +                 <&ethsys CLK_ETHDMA_GP1_EN>,
> +                 <&ethsys CLK_ETHDMA_GP3_EN>,
> +                 <&ethsys CLK_ETHDMA_ESW_EN>,
> +                 <&ethsys CLK_ETHDMA_CRYPT0_EN>,
> +                 <&ethwarp CLK_ETHWARP_WOCPU2_EN>,
> +                 <&ethwarp CLK_ETHWARP_WOCPU1_EN>,
> +                 <&ethwarp CLK_ETHWARP_WOCPU0_EN>,
> +                 <&topckgen CLK_TOP_ETH_GMII_SEL>,
> +                 <&topckgen CLK_TOP_ETH_REFCK_50M_SEL>,
> +                 <&topckgen CLK_TOP_ETH_SYS_200M_SEL>,
> +                 <&topckgen CLK_TOP_ETH_SYS_SEL>,
> +                 <&topckgen CLK_TOP_ETH_XGMII_SEL>,
> +                 <&topckgen CLK_TOP_ETH_MII_SEL>,
> +                 <&topckgen CLK_TOP_NETSYS_SEL>,
> +                 <&topckgen CLK_TOP_NETSYS_500M_SEL>,
> +                 <&topckgen CLK_TOP_NETSYS_PAO_2X_SEL>,
> +                 <&topckgen CLK_TOP_NETSYS_SYNC_250M_SEL>,
> +                 <&topckgen CLK_TOP_NETSYS_PPEFB_250M_SEL>,
> +                 <&topckgen CLK_TOP_NETSYS_WARP_SEL>;
> +
> +        clock-names =3D "xgp1", "xgp2", "xgp3", "fe", "gp2", "gp1",
> +                      "gp3", "esw", "crypto",
> +                      "ethwarp_wocpu2", "ethwarp_wocpu1",
> +                      "ethwarp_wocpu0", "top_eth_gmii_sel",
> +                      "top_eth_refck_50m_sel", "top_eth_sys_200m_sel",
> +                      "top_eth_sys_sel", "top_eth_xgmii_sel",
> +                      "top_eth_mii_sel", "top_netsys_sel",
> +                      "top_netsys_500m_sel", "top_netsys_pao_2x_sel",
> +                      "top_netsys_sync_250m_sel",
> +                      "top_netsys_ppefb_250m_sel",
> +                      "top_netsys_warp_sel";
> +        assigned-clocks =3D <&topckgen CLK_TOP_NETSYS_2X_SEL>,
> +                          <&topckgen CLK_TOP_NETSYS_GSW_SEL>,
> +                          <&topckgen CLK_TOP_USXGMII_SBUS_0_SEL>,
> +                          <&topckgen CLK_TOP_USXGMII_SBUS_1_SEL>,
> +                          <&topckgen CLK_TOP_SGM_0_SEL>,
> +                          <&topckgen CLK_TOP_SGM_1_SEL>;
> +        assigned-clock-parents =3D <&apmixedsys CLK_APMIXED_NET2PLL>,
> +                                 <&topckgen CLK_TOP_NET1PLL_D4>,
> +                                 <&topckgen CLK_TOP_NET1PLL_D8_D4>,
> +                                 <&topckgen CLK_TOP_NET1PLL_D8_D4>,
> +                                 <&apmixedsys CLK_APMIXED_SGMPLL>,
> +                                 <&apmixedsys CLK_APMIXED_SGMPLL>;
> +        mediatek,ethsys =3D <&ethsys>;
> +        mediatek,infracfg =3D <&topmisc>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        mac@0 {
> +          compatible =3D "mediatek,eth-mac";
> +          reg =3D <0>;
> +          phy-mode =3D "internal"; /* CPU port of built-in 1GE switch */
> +
> +          fixed-link {
> +            speed =3D <10000>;
> +            full-duplex;
> +            pause;
> +          };
> +        };
> +
> +        mac@1 {
> +          compatible =3D "mediatek,eth-mac";
> +          reg =3D <1>;
> +          phy-handle =3D <&int_2p5g_phy>;
> +        };
> +
> +        mac@2 {
> +          compatible =3D "mediatek,eth-mac";
> +          reg =3D <2>;
> +          pcs-handle =3D <&usxgmiisys0>, <&sgmii0>;
> +          phys =3D <&pextp0>;
> +        };
> +
> +        mdio_bus: mdio-bus {
> +          #address-cells =3D <1>;
> +          #size-cells =3D <0>;
> +
> +          /* external PHY */
> +          phy0: ethernet-phy@0 {
> +            reg =3D <0>;
> +            compatible =3D "ethernet-phy-ieee802.3-c45";
> +          };
> +
> +          /* internal 2.5G PHY */
> +          int_2p5g_phy: ethernet-phy@15 {
> +            reg =3D <15>;
> +            compatible =3D "ethernet-phy-ieee802.3-c45";
> +            phy-mode =3D "internal";
> +          };
> +        };
> +      };
> +    };
> --=20
> 2.43.0

--8FGijifStTHJdg+0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXiLmAAKCRB4tDGHoIJi
0gKhAP0cowuWKOEDUrNq/7GVx1mPlrZE+DmnToliFSL5YQENwQEAmjtvITQ66Vld
+gvLnpUy+BZwmvAFqpcz9Ugxp9jGVQ8=
=M8e+
-----END PGP SIGNATURE-----

--8FGijifStTHJdg+0--

