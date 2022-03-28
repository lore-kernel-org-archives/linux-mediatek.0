Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB09FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 15:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UNfc36KxNJ0id1nhnzHutxOd4DVMzbSWk97vJ8y8YJA=; b=ukryBfRT6G1qVv
	qKD9AS64XzfY1piT0b+xG44ykD/LmjkmcFzufhuPffLV7rTmC0lIpgKWEN9Q5Cim+ei4r3PIbnf7B
	BEHgmkfCu8eY0V8F31OKg/fwlz8pI+l1ilKmN72x6hC2oXZTp4NrtptJrdW/3avziNzq0zv7EuJeI
	YOEq3KueYzCeaw/PLnKyBdGrKDWfyNPn/RhWMtIeRwC1t1Lt0UDWYrhtiTYkxcY+u/qEjJf2+vgCR
	LtpjdvemOsNFoj3B7Iu449p2hkwM8ehcPDm4ixU5ZwSfy0ZvDXBWmfh5CHuHfKc/EONVRTkJmUfP5
	6/mGhwvh+EsNFUTtFrgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYqtn-009CS9-Cm; Mon, 28 Mar 2022 15:03:15 +0000
Received: from mail-wm1-f45.google.com ([209.85.128.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYqtZ-009COw-IF; Mon, 28 Mar 2022 15:03:03 +0000
Received: by mail-wm1-f45.google.com with SMTP id
 i131-20020a1c3b89000000b0038ce25c870dso284797wma.1; 
 Mon, 28 Mar 2022 08:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZrgiKCrxWRZyk32G1TmboPczQSoLsqVVgxz7YTO8i5k=;
 b=bnZ5fB6mWlU0qrYPlHQEa3w8hqGYGjA66ckmJbNCKXW6YgBnuo8aXwAhcPqbgL+Xya
 UlJDMnJ+u5Dl6WDjrfNWfavwC6/Jo7b/nBE2RnGb3UIw/WtuHBbGM08DzAEE+/vyMftS
 OJh9kfinr1A4cQ1UWQKtCZkbdyTYutnnxTouXZdHuIIA8GFbL6ZrPVrobefWS9ki3mJo
 YV447PiiU07yAjwSZIwtvyFfLCqLE1iBA7ow+dLz0ieHRmBAv15IXzvBZdj3rhTkDPrc
 Kch8jHTm2wziX1JsQ6wVhQU8F6TVOc9PasuXKe+7+dOT4qzNeB0CgtEoKVyjmLiNbXkC
 g9OQ==
X-Gm-Message-State: AOAM5314vaTw2Dz3yJfh1YUDnutcqBLvUbV9Y/2SiNEO2FcDmYkH8Put
 NBN9haHVGYUgktcIhtIQSmJMwnq85BaEVg==
X-Google-Smtp-Source: ABdhPJywupQH4SLAOIVaFYSgWXt+32QtCxN7pfRTFCK+LtCkmyy4u4ZTBg9yk9tY4OCAa0YsiEG1Lg==
X-Received: by 2002:a1c:2744:0:b0:382:a9b7:1c8a with SMTP id
 n65-20020a1c2744000000b00382a9b71c8amr26485495wmn.187.1648479779943; 
 Mon, 28 Mar 2022 08:02:59 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 y7-20020a5d4ac7000000b00203e4c8bdf1sm12587975wrs.93.2022.03.28.08.02.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 08:02:59 -0700 (PDT)
Message-ID: <e0ace708-3754-d7af-35ee-c73e7b15a443@kernel.org>
Date: Mon, 28 Mar 2022 17:02:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/4] arm64: dts: mediatek: Add device-tree for MT8195
 Demo board
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220327200312.3090515-1-fparent@baylibre.com>
 <20220327200312.3090515-3-fparent@baylibre.com>
 <94d231cf-ce4c-22f5-b9af-41ae68f1e659@collabora.com>
 <20220328144107.ed4xwzuiezzixqrx@radium>
 <0b042c71-4d07-76a6-53bb-94bbd4bad6c0@collabora.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <0b042c71-4d07-76a6-53bb-94bbd4bad6c0@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_080301_652114_19AAFD07 
X-CRM114-Status: GOOD (  25.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 28/03/2022 16:50, AngeloGioacchino Del Regno wrote:
> Il 28/03/22 16:41, Fabien Parent ha scritto:
>> On Mon, Mar 28, 2022 at 03:47:09PM +0200, AngeloGioacchino Del Regno wrote:
>>> Il 27/03/22 22:03, Fabien Parent ha scritto:
>>>> Add basic device-tree for the MT8195 Demo board. The
>>>> Demo board is made by MediaTek and has a MT8195 SoC,
>>>> associated with the MT6359 and MT6360 PMICs, and
>>>> the MT7921 connectivity chip.
>>>>
>>>> The IOs available on that board are:
>>>> * 1 USB Type-C connector with DP aux mode support
>>>> * 1 USB Type-A connector
>>>> * 1 full size HDMI RX and 1 full size HDMI TX connector
>>>> * 1 uSD slot
>>>> * 40 pins header
>>>> * SPI interface header
>>>> * 1 M.2 slot
>>>> * 1 audio jack
>>>> * 1 micro-USB port for serial debug
>>>> * 2 connectors for DSI displays
>>>> * 3 connectors for CSI cameras
>>>> * 1 connector for a eDP panel
>>>> * 1 MMC storage
>>>>
>>>> This commit adds basic support in order to be able to boot.
>>>>
>>>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>>>> ---
>>>> v2:
>>>>    * remove empty i2c nodes
>>>>    * remove empty spi node
>>>>    * remove unused pcie pinctrls
>>>>    * fixup node nodes to not contains underscore
>>>>    * rename mt6360 pmic node
>>>>    * move mmc1 node right after mmc0 node
>>>>    * use generic node name for gpio-keys
>>>>    * uniformize pinctrl node names
>>>>
>>>>    arch/arm64/boot/dts/mediatek/Makefile        |   1 +
>>>>    arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 447 +++++++++++++++++++
>>>>    2 files changed, 448 insertions(+)
>>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>>>>
>>>
>>> ..snip..
>>>
>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>>>> new file mode 100644
>>>> index 000000000000..d94b4e01159a
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>>>> @@ -0,0 +1,447 @@
>>>
>>> ..snip..
>>>
>>>> +
>>>> +	gpio-keys {
>>>> +		compatible = "gpio-keys";
>>>> +		input-name = "gpio-keys";
>>>> +		pinctrl-names = "default";
>>>> +		pinctrl-0 = <&gpio_keys_pins>;
>>>> +
>>>> +		key-0 {
>>>
>>> key-volup is more descriptive, can you please change that?
>>
>> Which review should I follow, yours or the one from Krzysztof? Because both reviews are contradictory
>>
> 
> There are a lot of "vol-down", "vol-up" (etc) instances, lots of which are on
> Qualcomm device-trees... so I guess this is just about personal preference...
> 
> Honestly, before sending my review I forgot to check Krzysztof's one (sorry!!),
> but I think that this kind of node names is highly subjective... at least, I am
> not aware of any rule about having to use "generic" names.

Node names should be generic, not descriptive. See Devicetree specification:
"The name of a node should be somewhat generic, reflecting the function
of the device and not its precise programming
 model. If appropriate, the name should be one of the following choices:
...
- keyboard

- key

- keys
"

I prefer key-0 but "volup-key" or "key-volup" could work too (but these
are still specific, not generic).

Using other DTS as examples is wrong, because most of submissions are
wrong and almost half of my bindings and DTS reviews include that
comment - generic node names. To be fair, most of my DTS contributions
also contained specific node names till I learnt that rule...

Anyway, it's not that important. :)

Thanks for other changes in the DTS.

> 
> Check Documentation/devicetree/bindings/input/gpio-keys.yaml - in the example,
> you can find "specific" node names, like:
> 
>          up {
> 
>              label = "GPIO Key UP";
> 
> In any case, as I said, it's my personal preference to have it named as something
> like "key-volup" or "vol-up" or .. a name that is describing the key, but, as a
> personal preference, it is nothing mandatory, not even from my side.
> 
> If anyone else has reasons to disagree, shrug, it's fine :))


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
