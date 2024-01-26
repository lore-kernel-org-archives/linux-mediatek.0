Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8082FC47DDB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 09:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tra6Xkw77GZuuufPbt2n/TJ5biGZ8HqsDj9UJzWmLRA=; b=IK7ijrHm8jbL7q1nY4Ei5VREuq
	wuGmF6EtjrutY4gaAJon9LpTobRIg/8cPAtHHu9/FNY8t2PGRi2vOhzU1JHeHJ3dSKI+UWENkTfgy
	bXaaGJYvh6iDX8c6i5wHKMuvj9pUl4NC9so44fpRClelBM8ilH0Lch6Ibyyz5Fy/VSGqRJSEp6FfB
	V9DkdouKYVzabJIDzBpkT9pd5o0eOpir9Vypm16QIQemCJl7WkMFpLvJ7L+ScRo218SBeoijETXn5
	EH36y9CgEF8V4ebo9PQmb7gdzYTOeoHR7uQAHG8l+mcTigs79ztwtFlyp3vjKO/T90TBNoZnXu/FF
	ClOeiRYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIHS-00000003bLX-0QcT;
	Fri, 26 Jan 2024 09:13:46 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIHO-00000003bKH-1KCm;
	Fri, 26 Jan 2024 09:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706260421;
	bh=ixHA4ByvJdYwI4VG4upsmomgkVlzfaNWXloCbrP7WpE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uBTAk+9PlPa/wc0i6kX1JN/PCLrIrGXTAg4pE6Yb8HZ841bcL1/8hVSbFpjUzDrNS
	 Xdz97p6c9l6hSg01dkMz8HYQhvP9hSBtrYOcoJFiRP2DJtHKU2sOR9o9Ku+yrdfFAt
	 tHo7bZnc2fAkzgIu1DBJKIP2x4CU9uzjvjdvwcjRE4criuNib1zB/MXOawjUo+JMke
	 wujOIMXPvYxOQtweBNYBOVSvMet1rUIotg/0ro6h0IJTkZOCOKWYSVPd3zBUH5Khib
	 hkH7op4BoBDZ6mgXJx3inkYmJFew32r2Ba7R65I+fDD4iiQmTr2c2ynXx7SQkNWOSU
	 kwJR5SQa7Wydg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 528853782072;
	Fri, 26 Jan 2024 09:13:40 +0000 (UTC)
Message-ID: <69af3310-3e6f-4730-bebc-44d5e29498b6@collabora.com>
Date: Fri, 26 Jan 2024 10:13:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S
 SDIO Bluetooth
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240126063500.2684087-1-wenst@chromium.org>
 <20240126063500.2684087-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240126063500.2684087-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_011342_519152_2A66A4C9 
X-CRM114-Status: GOOD (  21.60  )
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

Il 26/01/24 07:34, Chen-Yu Tsai ha scritto:
> The MediaTek MT7921S is a WiFi/Bluetooth combo chip that works over
> SDIO. While the Bluetooth function is fully discoverable, the chip
> has a pin that can reset just the Bluetooth side, as opposed to the
> full chip. This needs to be described in the device tree.
> 
> Add a device tree binding for MT7921S Bluetooth over SDIO specifically
> ot document the reset line.
> 
> Cc: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Changes since v1:
> - Reworded descriptions
> - Moved binding maintainer section before description
> - Added missing reference to bluetooth-controller.yaml
> - Added missing GPIO header to example
> 
>   .../bluetooth/mediatek,mt7921s-bluetooth.yaml | 53 +++++++++++++++++++
>   MAINTAINERS                                   |  1 +
>   2 files changed, 54 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
> new file mode 100644
> index 000000000000..ff11c95c816c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/bluetooth/mediatek,mt7921s-bluetooth.yaml#
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
> +  This binding only covers the Bluetooth part of the chip.
> +
> +allOf:
> +  - $ref: bluetooth-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt7921s-bluetooth
> +  reg:
> +    const: 2
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      An active-low reset line for the Bluetooth core; on typical M.2
> +      key E modules this is the W_DISABLE2# pin.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    mmc {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        bluetooth@2 {
> +            compatible = "mediatek,mt7921s-bluetooth";
> +            reg = <2>;
> +            reset-gpios = <&pio 8 GPIO_ACTIVE_LOW>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b64a64ca7916..662957146852 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13657,6 +13657,7 @@ M:	Sean Wang <sean.wang@mediatek.com>
>   L:	linux-bluetooth@vger.kernel.org
>   L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>   S:	Maintained
> +F:	Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
>   F:	Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
>   F:	drivers/bluetooth/btmtkuart.c
>   




