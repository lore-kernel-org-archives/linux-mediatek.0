Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC555C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 23:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+Tv9auK/7vAekxstLA6CiyrsM0cHn+PlMvvzgxYpEI=; b=vlYXnvU/bjYxfaVqyRcHYaI7jV
	Rc4a7M5V9DpkDRsCXKTCcS0YeHqJ+ytNmrh286wQ6ukxWYREJsJaPbXk29EhF8HhUjUGS1UKoRhmF
	x8CFFGISwkKic7RXmN4DCFI13dYam8AiSbWiiaYVmiJo1qSLj7971fSdf3jDnfHPYGlUWwVoFC3Km
	N2kAYf90YYyhpPlIue56m22u1Oo+8m8umbI7rYzfp2LTdq2mSzSgHZQKdMvHoXwzBj7A6bV2MVqP/
	UgHr/udbSJ+8AfDNmxgo5P1M8r/b1ATXS13m4jK2N/qNbuS/U9/kLw3HrEKDdNYJI3LCoslYlfU5A
	4sLEdm+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxEKH-00000000GKv-10hD;
	Wed, 17 Apr 2024 23:04:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxEKD-00000000GIS-3eVj;
	Wed, 17 Apr 2024 23:04:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A8A561737;
	Wed, 17 Apr 2024 23:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A934C32781;
	Wed, 17 Apr 2024 23:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713395056;
	bh=DleZPmzIjopdcwuK5ScXde4KztmrAG+BSDTdahj4F34=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KUvqalSFcV7qWl7RPj4p2dAkP/ZOE6htLrjxrb2m0xtesPjAe9AGjsdAf/e8gdlh9
	 2n+mYf8ezjDn8uv/EPeEQBJv07PBMJdceCeuoRZSpYO9oRHNdk9YD+jF5WMgdKkaVK
	 M1ckHynpWJhOrhmQ2gZL22DrtoGLRrt3e5sDPXG/8trJnobsdOl8ybkWTfdeiC6iMI
	 U0u1isSfwpqkWSpy/4+KGRsQv2SA4nYmIKChisqswmIqB00MPbzA/8Jl/vlXmOw8qp
	 qa6z+ljwKUoQf7Y0efhRhv0mP1YBFpxmW/8BmeiIIPhafgKyF9NiiyJV1pdoq4Cw4/
	 l1KZ78OyuGztA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5191b84d6d7so38206e87.3;
        Wed, 17 Apr 2024 16:04:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9F3Npv3YMoNlxFb85HF9h1hiytOyUia3VHLVDxH3cZvBe1h+LCicUgd9vn+PCl12PycnIc7OXmoOo5O9dVsqpgJjZFL0RvqpR6gSKSd5P7cbNonqCnx9yPaTuy8SwzzvsXAGFxF6CmQRmDzakegjux14NPRmZnes=
X-Gm-Message-State: AOJu0YxaME32dRM+qq0AlwqGZMWtrq7PPDMRl9SMOdLjQp5LQJealh6e
	ANvxHi/G9GQLjf4LImvOz0+RizRG43vqqoyp9+71ODgQzPoDyMSL2yQJUybVEkp9+AyV31Id6XP
	AHEUGnkjNSPmpVJDx9Pq0fr6IMJc=
X-Google-Smtp-Source: AGHT+IFynaJ23hI7LhBWah3AipQ/kHcj/2JC6nvWkyzyNtZt6uqnI9CxfUUV/FX4nKwOeNmYWCU+4a78uhTwgWEFRTk=
X-Received: by 2002:ac2:51bc:0:b0:519:592d:adcd with SMTP id
 f28-20020ac251bc000000b00519592dadcdmr335876lfk.3.1713395054395; Wed, 17 Apr
 2024 16:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240412073046.1192744-1-wenst@chromium.org> <20240412073046.1192744-2-wenst@chromium.org>
In-Reply-To: <20240412073046.1192744-2-wenst@chromium.org>
From: Sean Wang <sean.wang@kernel.org>
Date: Wed, 17 Apr 2024 16:04:02 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzp=MKNYc70ZeGCAEgWfFVPOAOZQQ86BXukk+EQQM_C+OA@mail.gmail.com>
Message-ID: <CAGp9Lzp=MKNYc70ZeGCAEgWfFVPOAOZQQ86BXukk+EQQM_C+OA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S
 SDIO Bluetooth
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_160422_078558_AA66C99D 
X-CRM114-Status: GOOD (  31.48  )
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

Hi Chen-Yu,

On Fri, Apr 12, 2024 at 12:31=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> The MediaTek MT7921S is a WiFi/Bluetooth combo chip that works over
> SDIO. WiFi and Bluetooth are separate SDIO functions within the chip.
> While the Bluetooth SDIO function is fully discoverable, the chip has
> a pin that can reset just the Bluetooth core, as opposed to the full
> chip. This should be described in the device tree.
>
> Add a device tree binding for the Bluetooth SDIO function of the MT7921S
> specifically to document the reset line. This binding is based on the MMC
> controller binding, which specifies one device node per SDIO function.
>
> Cc: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v2:
> - Expand description and commit message to clearly state that WiFi and
>   Bluetooth are separate SDIO functions, and that each function should
>   be a separate device node, as specified by the MMC binding.
> - Change 'additionalProperties' to 'unevaluatedProperties'
> - Add missing separating new line
> - s/ot/to/
>
> Angelo's reviewed-by was not picked up due to the above changes.
>
> Changes since v1:
> - Reworded descriptions
> - Moved binding maintainer section before description
> - Added missing reference to bluetooth-controller.yaml
> - Added missing GPIO header to example
> ---
>  .../bluetooth/mediatek,mt7921s-bluetooth.yaml | 55 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/bluetooth/media=
tek,mt7921s-bluetooth.yaml
>
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7=
921s-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/media=
tek,mt7921s-bluetooth.yaml
> new file mode 100644
> index 000000000000..67ff7caad599
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bl=
uetooth.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/bluetooth/mediatek,mt7921s-blueto=
oth.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT7921S Bluetooth
> +
> +maintainers:
> +  - Sean Wang <sean.wang@mediatek.com>
> +
> +description:
> +  MT7921S is an SDIO-attached dual-radio WiFi+Bluetooth Combo chip; each
> +  function is its own SDIO function on a shared SDIO interface. The chip
> +  has two dedicated reset lines, one for each function core.
> +  This binding only covers the Bluetooth SDIO function, with one device
> +  node describing only this SDIO function.
> +
> +allOf:
> +  - $ref: bluetooth-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt7921s-bluetooth
> +
> +  reg:
> +    const: 2
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      An active-low reset line for the Bluetooth core; on typical M.2
> +      key E modules this is the W_DISABLE2# pin.
> +

Thanks for adding the new setup for the MT7921S devices. They look good to =
me.
Sometimes, the MT7921S might be set up to wake up the host when it's
asleep using a sideband signal.
This might need an extra pin called "wakeup" to make it happen. Can
you help add this pin to the settings in the same update, or should I
do it later?

> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    mmc {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        bluetooth@2 {
> +            compatible =3D "mediatek,mt7921s-bluetooth";
> +            reg =3D <2>;
> +            reset-gpios =3D <&pio 8 GPIO_ACTIVE_LOW>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 88981d9f3958..218bc2a21207 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13818,6 +13818,7 @@ M:      Sean Wang <sean.wang@mediatek.com>
>  L:     linux-bluetooth@vger.kernel.org
>  L:     linux-mediatek@lists.infradead.org (moderated for non-subscribers=
)
>  S:     Maintained
> +F:     Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-=
bluetooth.yaml
>  F:     Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
>  F:     drivers/bluetooth/btmtkuart.c
>
> --
> 2.44.0.683.g7961c838ac-goog
>
>

