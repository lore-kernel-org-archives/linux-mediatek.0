Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B544C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 09:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zo+YV+F0mXIRLunGJD055SnguaY1mRhUgomTE1GBJV0=; b=KfVukURn5vow3lD7MnIKGG3SXo
	ZW6vza/bI6oJh7L6kBYTehjd1TV6GduhRyvJ8qrm7YxpRf32HU+bGhSgOjoGFaHCEHGc7vrn5zUQp
	p6kMVFgjiNUyaOXSwR7NhOt5bG15yb5sXG9+y0L8yLqW35P1yFMJ9zHS+w4xbabaccj6C3pqs5HsS
	sk0p0ms52SokUw+exjJEiy87STDqHMe8tH/q1Ot+ur47rIjbmKVGHcTAoFX2DNog+6lP4sIiQpDbW
	OfGaiZZvGhVYHYiJsb7mDprmgeyWZEypdhL/ZS26RXIOVztd2D9w9zBEgW1Rz4ORMTDq5HNe2BuYA
	asmZ4p4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2r33-00GXpx-A2; Wed, 07 Dec 2022 09:49:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2r2p-00GXQV-3I; Wed, 07 Dec 2022 09:48:52 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F4686602BC8;
	Wed,  7 Dec 2022 09:48:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670406528;
	bh=qNEpnM8ClbrtXrZA6HU6eUiqyAOy4w4SGFwvj+Zg7ZU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gYO5sj0NeKHGQdOIykdzKDXaUMR4eTpN/Gf5vQW9433/FCKI5EhWReF8ANjQZz+9T
	 W0yfMuhK2NpiNeriKtbQdjar477D0D4bftjuQv1UBwHpISOf+a2P8QSaLSV2CTAPpX
	 PVWvv2MgZF2bo4rBeATogcd6pXZX+O9TJeFqHAVOHIsz7DLGPcq0peRCGaCNeCCozj
	 ycUDIRukQFQmbdZRm495QMNSBFSreFa60eyKqlABw8OS+8W6i2+OZX1ZwEZ5cO+mGD
	 SyagMVmgnx4+tBSYfZkiyNLcqotoE5Qfh3RJxuktLwks9Chjnni+BLLfg4ECF7LEHz
	 U779io82HGe+w==
Message-ID: <b877af37-462e-c923-41c0-09c370062700@collabora.com>
Date: Wed, 7 Dec 2022 10:48:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 7/9] dt-bindings: spi: mtk-snfi: Add read latch latency
 property
To: =?UTF-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
 <Xiangsheng.Hou@mediatek.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "gch981213@gmail.com" <gch981213@gmail.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
 <Benliang.Zhao@mediatek.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?QmluIFpoYW5nICjnq6Dmlowp?= <bin.zhang@mediatek.com>
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
 <20221205065756.26875-8-xiangsheng.hou@mediatek.com>
 <ce449a0c-efcc-0ac1-fb8e-c2b4148a5bc1@collabora.com>
 <a8f706b37f5decf91bfa9a9ac8cf04be4346dd85.camel@mediatek.com>
 <9992c9a5-059a-9396-32ce-7ed63cd12a96@collabora.com>
 <e2ccf42f94152ccacad3a2eaec234ae0566474ec.camel@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <e2ccf42f94152ccacad3a2eaec234ae0566474ec.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_014851_383581_5B0D3D17 
X-CRM114-Status: GOOD (  16.84  )
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

Il 07/12/22 03:00, Xiangsheng Hou (侯祥胜) ha scritto:
> Hi Angelo,
> 
> On Tue, 2022-12-06 at 13:19 +0100, AngeloGioacchino Del Regno wrote:
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/spi/mediatek,spi-
>>>>> mtk-snfi.yaml
>>>>> b/Documentation/devicetree/bindings/spi/mediatek,spi-
>>>>> mtk-snfi.yaml
>>>>> index bab23f1b11fd..6e6ff8d73fcd 100644
>>>>> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-
>>>>> snfi.yaml
>>>>> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-
>>>>> snfi.yaml
>>>>> @@ -45,6 +45,13 @@ properties:
>>>>>         description: device-tree node of the accompanying ECC
>>>>> engine.
>>>>>         $ref: /schemas/types.yaml#/definitions/phandle
>>>>>     
>>>>> +  mediatek,rx-latch-latency:
>>>>> +    description: Rx delay to sample data with this value, the
>>>>> value
>>>>> +                 unit is clock cycle.
>>>>
>>>> Can't we use nanoseconds or microseconds as a unit here, instead
>>>> of
>>>> clock cycles?
>>>
>>> The clock cycle will be various with MediaTek SPI NAND controller
>>> which
>>> clock frequency can support 26/52/68/81/104MHz...
>>> It`s may be easy to configure and understand with clock cycle in
>>> unit.
>>>
>>
>> Yes, but whatever clock frequency we use, the target is to always
>> wait for
>> X nanoseconds, right?
>>
>> Waiting for 5 clock cycles at 104MHz is obviously not the same as
>> waiting
>> for the same 5 clock cycles at 26MHz: in that case, expressing the
>> value
>> in nanoseconds or microseconds would make that independent from the
>> controller's clock frequency as the calculation from `time` to
>> `cycles`
>> would be performed inside of the driver.
> 
> There have two rx related timing properties in spi-peripheral-props.
> The rx-sample-delay-ns have been used in Mediatek snfi driver to adjust
> controller sample delay.
> However another spi-rx-delay-us is in microseconds. Take 52MHz for
> example, the clock cycle will be 19.23ns which lower than 1us. This may
> not easy to by one clock cycle.
> 

I agree, but nothing prevents you from adding your own property for that.

I propose "mediatek,rx-latch-latency-ns" or "mediatek,rx-latency-ns", so that
we can specify the delay in nanoseconds: in that case, when we specify 19ns,
the driver will safely round that resulting in 52MHz == 19.23ns => 19ns valid.

Regards,
Angelo


