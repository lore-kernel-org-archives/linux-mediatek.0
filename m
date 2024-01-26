Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B1BC47422
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 09:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPAizvU1ah1PUaK8T4h6z91/Fua1H84LjZlmTTaRgLA=; b=GmX6nXTx7lsPSbOL2RuqCwPXzJ
	f9cKlpZSlF+qrWCZOIH1zfxgGoJ0pjrgof7PeSqjsCFDBqCK6UzOG9eDOqvahHuWB5KkL+WYyKixR
	njBKknIJM5kTuobzTng3/XVR3IBKayz3khdqXvZYBrt7zUdVKVrDalOAo86TL8YzYw99zkv3Aa5Qx
	7+GXmg0l/b0qymi8jyiIsU/R+FCYC9MagdkSvnt79y2/Y1MaBxj6L8N6SYy8t/YX53HZaHgRKVmN5
	fwd4qCgwbdCJ9nfdJRVuFIO5CBExFFo5EcCqvG+qlLAOcLO3rm2ggAMnPNOaBQdOhA63sp7FGtNCi
	HiRENtxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIGf-00000003b4s-13Qf;
	Fri, 26 Jan 2024 09:13:02 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIGZ-00000003b2t-2urU;
	Fri, 26 Jan 2024 09:12:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706260370;
	bh=ZoRSJvoWqKga1SG2FFzE2w6OD+wWH46tFmixAACobBI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CFE0E9XXR9BWxs45HlGn7FRIOAj7TxaAi78vLgkJJbntjVkegYxIJ2ZIByVPlrRCM
	 8UGtochIV68ovE5QoG+zzAS0OIzy5Kbj86EiqA3NgXQL8Bt9hjnLyPzg0o7Cin8+ot
	 VNWTOx9qO16+aPEHIFL0TJ+vwHh2wqdSGeS9SbNWL+hGZbR1n1E5nHZyKl11AVd7zZ
	 hadui7C8Gv4rcFkeidmOzxTqKO3asz/XZUm2zjYqpguY5Cr5UYMCcl8voFmLn9G6CE
	 GEn/BBbP/HhwypxMtQPK+qtDEHfPos50OH1vm3tHZGt4VnqiQK0oqol4voiNP6yGQF
	 ExZYWNJedohGQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7EB853782072;
	Fri, 26 Jan 2024 09:12:49 +0000 (UTC)
Message-ID: <dc6f77bd-6671-43eb-8658-626b2591415d@collabora.com>
Date: Fri, 26 Jan 2024 10:12:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S
 SDIO Bluetooth
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240125095240.2308340-1-wenst@chromium.org>
 <20240125095240.2308340-2-wenst@chromium.org>
 <68249675-4081-48d9-abbb-1b2e49894fae@collabora.com>
 <CAGXv+5GG+Ko4nZKCvpQ2TnjeHDKWi5qS_SWAgLcrZ6fn_ySiug@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5GG+Ko4nZKCvpQ2TnjeHDKWi5qS_SWAgLcrZ6fn_ySiug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_011251_884145_AA08AFE6 
X-CRM114-Status: GOOD (  26.58  )
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

Il 26/01/24 04:26, Chen-Yu Tsai ha scritto:
> On Thu, Jan 25, 2024 at 7:39 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 25/01/24 10:52, Chen-Yu Tsai ha scritto:
>>> The MediaTek MT7921S is a WiFi/Bluetooth combo chip that works over
>>> SDIO. While the Bluetooth function is fully discoverable, the chip
>>> has a pin that can reset just the Bluetooth side, as opposed to the
>>> full chip. This needs to be described in the device tree.
>>>
>>> Add a device tree binding for MT7921S Bluetooth over SDIO specifically
>>> ot document the reset line.
>>>
>>> Cc: Sean Wang <sean.wang@mediatek.com>
>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>> ---
>>>    .../bluetooth/mediatek,mt7921s-bluetooth.yaml | 49 +++++++++++++++++++
>>>    MAINTAINERS                                   |  1 +
>>>    2 files changed, 50 insertions(+)
>>>    create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
>>> new file mode 100644
>>> index 000000000000..bbe240e7cc40
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
>>> @@ -0,0 +1,49 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/net/bluetooth/mediatek,mt7921s-bluetooth.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek MT7921S Bluetooth
>>> +
>>
>> title:
>>
>> maintainers:
>>
>> description:
>>
>> ... and then, you missed
>>
>> allOf:
>>     - $ref: bluetooth-controller.yaml#
> 
> (facepalm)
> 
>> Everything else looks good.
>>
>> Cheers,
>> Angelo
>>
>>> +description:
>>
>> MT7921S is a (dual?) SDIO-attached dual-radio WiFi+Bluetooth combo chip;
>> this chip has two dedicated reset lines, one of which is used to reset
>> the Bluetooth core.
>> The WiFi part of this chip is described in ....where? :-)
> 
> The function itself is fully probable and the implementation doesn't make
> use of the WiFi's reset line, so I don't see any reason to describe it?
> I don't actually know what the reset line does in the chip hardware.
> This patch is just described what is already used.
> 
>>> +  This binding describes the Bluetooth side of the SDIO-attached MT7921S
>>> +  WiFi+Bluetooth combo chips. These chips are dual-radio chips supporting
>>> +  WiFi and Bluetooth. Bluetooth works over SDIO just like WiFi. Bluetooth
>>> +  has its own reset line, separate from WiFi, which can be used to reset
>>> +  the Bluetooth core.
>>> +
>>> +maintainers:
>>> +  - Sean Wang <sean.wang@mediatek.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - mediatek,mt7921s-bluetooth
>>> +  reg:
>>> +    const: 2
>>> +
>>> +  reset-gpios:
>>> +    maxItems: 1
>>> +    description: A GPIO line connected to the Bluetooth subsystem reset line.
>>> +      Typically the W_DISABLE2# pin on M.2 E-key modules. If present this
>>> +      shall be flagged as active low.
>>
>> description:
>>     An active-low reset line connected for the Bluetooth core;
> 
> connected to?

Eh yes, sorry - I edited that statement multiple times and that "for" stuck
there for reasons :-)

> 
>>     on typical M.2 Key-E modules this is the W_DISABLE2# pin.
> 
> Otherwise this looks better. Thanks.

You're welcome!

Cheers!

> 
> 
> ChenYu
> 
>> Cheers,
>> Angelo
>>
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    mmc {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +
>>> +        bluetooth@2 {
>>> +            compatible = "mediatek,mt7921s-bluetooth";
>>> +            reg = <2>;
>>> +            reset-gpios = <&pio 8 GPIO_ACTIVE_LOW>;
>>> +        };
>>> +    };
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index b64a64ca7916..662957146852 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -13657,6 +13657,7 @@ M:    Sean Wang <sean.wang@mediatek.com>
>>>    L:  linux-bluetooth@vger.kernel.org
>>>    L:  linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>>>    S:  Maintained
>>> +F:   Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7921s-bluetooth.yaml
>>>    F:  Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
>>>    F:  drivers/bluetooth/btmtkuart.c
>>>
>>



