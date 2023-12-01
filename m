Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2288C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 15:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaKgDUJ8WyZ2UaU8XOUlrLn3XeW/PotJJKOLnttrI+k=; b=HiLN+nTe854UO6eSY0omyiO+In
	z110nUFFtqIUpu3p5oo8f4q11G5LqHABEkjWIA++bnVWpop2yX6wwt0qLd5nZg2of3l37kqUQnb9W
	1J6zxz4ie8seZaSyGseDUIxd442gLgMZs9QmJ+K4IjQ7XmFPf6ySEkXnfZaWqgHkIefdHGAqDQIt3
	VaLLjjvJlWJQ6bi7FIjo89uKK4hLGWRfdxFRzEdRyf9p3xIyu87SxIguybXmCStcqtJJD5t2zNI0o
	Yfj3R0UPrHMXwn/rY7zIF4UXChl4NipWOMJQrttPgoXua3tHgTPX4cDpKLEeONGMqjPkLlH15OQVs
	pYL/wYJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r95VI-00E3Hx-2K;
	Fri, 01 Dec 2023 15:32:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r95VF-00E3F8-0Y;
	Fri, 01 Dec 2023 15:32:30 +0000
Received: from [100.94.55.57] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 88F3E660739A;
	Fri,  1 Dec 2023 15:32:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701444744;
	bh=tNdSmYTDgv9TDc5k/n3GNbFZ1OQJA3GgTmeWeu7A4x8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z6E7zwKeTZgTXBpUwQV/3AUvSEy1KeCPkbw/7VMdxJN+uykpCdyaS7JAE3NAbRzc7
	 4B7RFcXoUvZ2F9iSURyGjptLaVmDAB+WyuMU4HVGGm8n8l55h7Vj/TarpfWrIw9RLz
	 9KuUkSv8DFdG5HneVf3pMH0cpGqNFe4CXdCPdVb+C0eNRrvacsCyEikKkNGKTEI4ek
	 SVRo049kcwUsPKEDPhSrFmC81NXpCACgb9SvTvvuyQj9T3UaHmNsjdbiPzvCuDRUYb
	 n2T/JbRCXRndQMECr5Ms4kiAidVeAjVb+25aLwWQ466vbvNkGifv7hECjgnETjcsQv
	 SauXuJyjmAeoQ==
Message-ID: <525f20de-4eb8-4786-84b5-64eb989bdc4c@collabora.com>
Date: Fri, 1 Dec 2023 17:32:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] arm64: dts: mediatek: Add MT8186 Krabby platform
 based Tentacruel / Tentacool
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20231012230237.2676469-1-wenst@chromium.org>
 <20231012230237.2676469-7-wenst@chromium.org>
 <60beb523-292b-4c77-9030-1bfdfd73c140@collabora.com>
 <CAGXv+5GmjZbzLbxADoNXDiF8dTAwnxva29vuM0FG8vY-6wTJcQ@mail.gmail.com>
 <4c15c9a4-bf04-492d-9e02-d630092b6caa@collabora.com>
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <4c15c9a4-bf04-492d-9e02-d630092b6caa@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_073229_533203_11D81BD5 
X-CRM114-Status: GOOD (  16.60  )
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

On 11/27/23 15:05, AngeloGioacchino Del Regno wrote:
> Il 27/11/23 05:00, Chen-Yu Tsai ha scritto:
>> On Mon, Oct 23, 2023 at 5:05 PM Eugen Hristev
>> <eugen.hristev@collabora.com> wrote:
>>>
>>> On 10/13/23 02:02, Chen-Yu Tsai wrote:
>>>> Tentacruel and Tentacool are MT8186 based Chromebooks based on the
>>>> Krabby design.
>>>>
>>>> Tentacruel, also known as the ASUS Chromebook CM14 Flip CM1402F, is a
>>>> convertible device with touchscreen and stylus.
>>>>
>>>> Tentacool, also known as the ASUS Chromebook CM14 CM1402C, is a laptop
>>>> device. It does not have a touchscreen or stylus.
>>>>
>>>> The two devices both have two variants. The difference is a second
>>>> source touchpad controller that shares the same address as the original,
>>>> but is incompatible.
>>>>
>>>> The extra SKU IDs for the Tentacruel devices map to different sensor
>>>> components attached to the Embedded Controller. These are not visible
>>>> to the main processor.
>>>>
>>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>>> ---
>>>>    arch/arm64/boot/dts/mediatek/Makefile         |    4 +
>>>>    .../dts/mediatek/mt8186-corsola-krabby.dtsi   |  130 ++
>>>>    .../mt8186-corsola-tentacool-sku327681.dts    |   49 +
>>>>    .../mt8186-corsola-tentacool-sku327683.dts    |   26 +
>>>>    .../mt8186-corsola-tentacruel-sku262144.dts   |   44 +
>>>>    .../mt8186-corsola-tentacruel-sku262148.dts   |   28 +
>>>>    .../boot/dts/mediatek/mt8186-corsola.dtsi     | 1704 +++++++++++++++++
>>>>    7 files changed, 1985 insertions(+)
>>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-krabby.dtsi
>>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327681.dts
>>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacool-sku327683.dts
>>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262144.dts
>>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-tentacruel-sku262148.dts
>>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
>>>>
>>
>> [...]
>>
>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
>>>> new file mode 100644
>>>> index 000000000000..42ebab1bafeb
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
>>>> @@ -0,0 +1,1704 @@
>>
>> [...]
>>
>>>
>>> Hi Chen-Yu,
>>>
>>> These two aud_gpio_tdm empty entries cause this message to be printed:
>>>
>>> [   12.949519] mt8186_mt6366_rt1019_rt5682s sound: there is not valid
>>> maps for state aud_gpio_tdm_off
>>> [   12.959025] mt8186_mt6366_rt1019_rt5682s sound: there is not valid
>>> maps for state aud_gpio_tdm_on
>>
>> I guess we need to teach the sound driver to ignore empty pinmux states?
> 
> ...and we need to teach to the bindings that the aud_gpio_tdm_{off,on} are
> optional states and can be omitted.

Hello Angelo,

The binding does not appear to specify any required states. Am I getting this
wrong? Hence, we can just remove these states from the DT node.


Hello Chen-Yu,

The error message comes from the pinctrl, from dt_to_map_one_config() .
I believe we can safely just remove these two if corsola device does not use TDM.
From my perspective it is pointless to have two empty pinctrl states just for the
sake of it if there are no pins involved.
Please correct me if you have more knowledge about it.

Thanks,
Eugen

> 
> Cheers,
> Angelo
> 
>>
>> ChenYu
> 
> 
> 


