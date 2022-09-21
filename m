Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FF5C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 13:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IM+abnlrzob2F4j7blFLd/3Hj8IvblbtEqyUMNxag9s=; b=e9N8ix4QON5ycwAaA4Ugjk/NEm
	AUOGd+kpEuZkLcHBpAa/pqWtZIQ8zfyXuXRpUAEBJRX/9l92hQDQplwUmhIndOfJTaF9/iyxaoRTt
	syTcPfBYhwb27WhNhpyt+eSyCihKqScyMtjAKsBMZmesWkWKt30izDfs+NeWL/ut0iGbafy7/fhPX
	bpa69SfFfE68n5Ds4ZzmCXGINA0ZsmksdqXpYELV7iQCBI1rU6R62rUKVL5tv8QCpstNp3zhnGdeh
	N1hgBs8pgqEAX44y9G0RhE5OxFlM44HALm2KF1PBDrAPQyO9EOiL0uJdLWW8gZgLGjzuXoDccwa+l
	kB0SomyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob0Fn-00BUVW-Mp; Wed, 21 Sep 2022 13:59:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob0Fb-00BURb-Nz; Wed, 21 Sep 2022 13:58:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 737D66602028;
	Wed, 21 Sep 2022 14:58:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663768732;
	bh=aNktZ6lpJ/y23RAV97OZGsJSTK5UAMeGZw4X2ENLfXE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T3VNbt4RhdWVEG6k5a4izsy7xNSaxwmrgPuw+yNBQbmiV7LMdn2gGoozlgFPVs6Qk
	 dDUh9Xz8y/e/k1HiSgJqOHrVmJkjbRlQw9nf9uN2qu/5YoIqexOOSlK5AYM8ievFJm
	 +3iXSW4TDXCRmggad4XxjypL7iYgRTqqUtwc/rwpkPmG2xRHNi9Q1PbMutBCADmdAL
	 ON4ncaLWMPlbSY9niPdU4O32AAkCWX8ca7NJxMHzrq3CSpYyRMoAXQCGN+TpuP+UyC
	 FA9KUxfdqEdkpRgiN0MyMqy1FdBS/f8zun+0+Q6fo7dEIsO1PPJCHTjpn5bjE+dcpp
	 xX1l6cjLk+Dpw==
Message-ID: <9234e731-8c2f-b599-39b1-bf5115a16931@collabora.com>
Date: Wed, 21 Sep 2022 15:58:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: asurada: Add display regulators
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220908171153.670762-1-nfraprado@collabora.com>
 <20220908171153.670762-2-nfraprado@collabora.com>
 <ab2027b9-17e8-4fe8-3847-84c54d6f9d58@collabora.com>
 <20220921134806.lbg5meuy4fn6pifm@notapiano>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220921134806.lbg5meuy4fn6pifm@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_065855_929071_570B6C17 
X-CRM114-Status: GOOD (  23.60  )
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

Il 21/09/22 15:48, Nícolas F. R. A. Prado ha scritto:
> On Fri, Sep 09, 2022 at 09:46:33AM +0200, AngeloGioacchino Del Regno wrote:
>> Il 08/09/22 19:11, Nícolas F. R. A. Prado ha scritto:
>>> Add the regulators present on the Asurada platform that are used to
>>> power the internal and external displays.
>>>
>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>>
>>> ---
>>>
>>>    .../boot/dts/mediatek/mt8192-asurada.dtsi     | 114 ++++++++++++++++++
>>>    1 file changed, 114 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>>> index 4b314435f8fd..1d99e470ea1a 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
>>
>> ..snip..
>>
>>> @@ -56,6 +116,18 @@ pp3300_ldo_z: regulator-3v3-z {
>>>    		vin-supply = <&ppvar_sys>;
>>>    	};
>>
>> Can you please add a comment here advertising that this regulator
>> will not only provide power to the MIPI bridge, but *also* to the
>> display panel itself?
>>
>> This is to make sure that everyone understands what's going on, and
>> also that we ourselves don't forget about that.
>>
>> Probably something like:
>> /* pp3300_mipibrdg also enables pp3300_panel */
>>
>> I would then propose to add a "regulator-fixed" that has no GPIO
>> but with vin-supply as this one.
>>
>> pp3300_panel: regulator-3v3-panel {
>> 	compatible = "regulator-fixed";
>> 	regulator-name = "pp3300_panel";
>> 	regulator-min-microvolt = <3300000>;
>> 	regulator-max-microvolt = <3300000>;
>>
>> 	vin-supply = <&pp3300_mipibrdg>;
>> };
>>
>> I would also test assigning this regulator to the panel node, as this
>> will make sure to cover future corner cases (think about PM suspend/resume).
>>
>> P.S.: If you add the pp3300_panel regulator-fixed with that vin-supply,
>>        maybe the proposed comment would become a bit overkill. Your choice!
> 
> Hi Angelo,
> 
> thanks for the feedback.
> 
> I think the current layout makes more sense based on my understanding of the
> power routing here: a single power line output by the pp3300_mipibrdg regulator
> powers both the ANX chip as well as the panel. So I'm going to keep it the way
> it is for now. If there are any other concerns please let me know.
> 

As we discussed, I agree on this decision. Please go on.

Cheers!

> Thanks,
> Nícolas
> 
>>
>> Cheers,
>> Angelo
>>
>>> +	pp3300_mipibrdg: regulator-3v3-mipibrdg {
>>> +		compatible = "regulator-fixed";
>>> +		regulator-name = "pp3300_mipibrdg";
>>> +		pinctrl-names = "default";
>>> +		pinctrl-0 = <&pp3300_mipibrdg_en_pins>;
>>> +		regulator-min-microvolt = <3300000>;
>>> +		regulator-max-microvolt = <3300000>;
>>> +		enable-active-high;
>>> +		regulator-boot-on;
>>> +		gpio = <&pio 127 GPIO_ACTIVE_HIGH>;
>>> +	};
>>> +
>>>    	/* separately switched 3.3V power rail */
>>>    	pp3300_u: regulator-3v3-u {
>>>    		compatible = "regulator-fixed";
>>

