Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D2EC47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 13:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FoF3/1EhxgPYFSqWOaW3RRmCeI4xCUfE4gr4+e7ZtxI=; b=fnYncf/iuWcVYsWKoToh9YzehM
	U9WjlyGAsdYJWbljDCG9cR6ZsmCufZfqZwxg/tnA3Zrb6cMEJg7TTjrxNUWF1rmy9ado1KQOrvAdC
	z87+kcfxc60+eCswISvMUDK42KcZVwxi+ZCi6UEmxCPBjAchRDqjQKPVsNfBKmkV8tlLYgpEBH1d5
	w479/4QoA98kbNHN/z857EFQT1bO/Prr0f9pKzG3JYV0f79txCKyVtmWjGLdoibheS4IT6qrGW4wl
	3w6W/gVagdJ55OVGbZj60NiJLXgul3eoiE/+ciNoRdng/XzHdXNtJuJSTjJslGNFN2PKTiHbztgxW
	o4oSPnIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT06w-000000007oh-1tRf;
	Thu, 25 Jan 2024 13:49:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT06t-000000007nf-3ObV;
	Thu, 25 Jan 2024 13:49:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FoF3/1EhxgPYFSqWOaW3RRmCeI4xCUfE4gr4+e7ZtxI=; b=qproZzJ3iHNpgWS2+uoDYXt4e0
	X4mnBjtIvXRxmG/pxWoVTZtgT+ebRh3l7774jub4GXlqpNGg7X1N5Qfs7nqmdVK5FqJmGS1+HInKw
	q/oImGd2ofJ8U0dD+5aoL8t5a29eeValuM9PNXqN7frWkYTOnUpoE+HUIEy8G+t0ecERSj2A1kUlc
	NtTDA9pDgWH9qxBZ3xJlbS/C8YQt+CHFk10ZSUbp+z5S3t2WwTvJ9XUJdv4Th5Z1+q/p7mh+Nsi+e
	51JtlR/SlZenL0yvceUBq86Oxwnsy4j4+IREDDSHR6m+dVcN9f2/ebQ9qVBNJJrOumDQG3eIEdSH1
	KiSNNsTQ==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSy64-00000005DOi-0thi;
	Thu, 25 Jan 2024 11:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706182779;
	bh=uuLQcn67ndZcZcBwuCqbGXWUe0vDASxm3uUwFtizmbE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=envjQJ8ceoZeoRYHWBr+w/i6IBO3d6F57Se1tosc9GNzMCx3O9LxVW0JZBA9sCPC2
	 iMH6KmKwKTvnL0dT3TNrdEtI92faSsuTBg7+HOmEoZlJiWoK6jcvWHJaFYSI4QiuwQ
	 jJ2s31+gFHe0a91WJYw/6A3qHT7bbtEbonwyQUSt4dVNkb3jOlbDVW9iXplPqTpclF
	 Ff8mckuU7EsSsfGuA0T5LR4/prZZSCvM+/g06rqPViRaG4o62nmHB8aPwcyje0D87p
	 iVDNUw1w4WzY9QXJ8VE/EIy09iyMrtrgE5uqNAPNzygW6gilTLMQyF0Kp9unItGGVr
	 4yLjsoIAr+DQQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7D1F33781182;
	Thu, 25 Jan 2024 11:39:38 +0000 (UTC)
Message-ID: <68249675-4081-48d9-abbb-1b2e49894fae@collabora.com>
Date: Thu, 25 Jan 2024 12:39:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S
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
References: <20240125095240.2308340-1-wenst@chromium.org>
 <20240125095240.2308340-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240125095240.2308340-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_114040_420029_D0D2C08C 
X-CRM114-Status: GOOD (  23.37  )
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

Il 25/01/24 10:52, Chen-Yu Tsai ha scritto:
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
> ---
>   .../bluetooth/mediatek,mt7921s-bluetooth.yaml | 49 +++++++++++++++++++
>   MAINTAINERS                                   |  1 +
>   2 files changed, 50 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
> new file mode 100644
> index 000000000000..bbe240e7cc40
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/bluetooth/mediatek,mt7921s-bluetooth.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT7921S Bluetooth
> +

title:

maintainers:

description:

... and then, you missed

allOf:
   - $ref: bluetooth-controller.yaml#

Everything else looks good.

Cheers,
Angelo

> +description:

MT7921S is a (dual?) SDIO-attached dual-radio WiFi+Bluetooth combo chip;
this chip has two dedicated reset lines, one of which is used to reset
the Bluetooth core.
The WiFi part of this chip is described in ....where? :-)

> +  This binding describes the Bluetooth side of the SDIO-attached MT7921S
> +  WiFi+Bluetooth combo chips. These chips are dual-radio chips supporting
> +  WiFi and Bluetooth. Bluetooth works over SDIO just like WiFi. Bluetooth
> +  has its own reset line, separate from WiFi, which can be used to reset
> +  the Bluetooth core.
> +
> +maintainers:
> +  - Sean Wang <sean.wang@mediatek.com>
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
> +    description: A GPIO line connected to the Bluetooth subsystem reset line.
> +      Typically the W_DISABLE2# pin on M.2 E-key modules. If present this
> +      shall be flagged as active low.

description:
   An active-low reset line connected for the Bluetooth core;
   on typical M.2 Key-E modules this is the W_DISABLE2# pin.

Cheers,
Angelo

> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
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


