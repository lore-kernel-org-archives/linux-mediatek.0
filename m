Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4F4C7618E
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 06:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ck3AGiziQJw39JsNtbvqAQj6+eoiQqKu0iEFKrQLspg=; b=OnaXmcuaKTzoEM8CpQMCcV57tZ
	zLaTKymt7ReQVIqv7cpfQeEW1om5JPh2hDTPYE2VRF2Y7S1OIdZeOWBDlOEKKgMQT2VY8fK/KNNAS
	5QzLetPWthyZTFQ99kKc3LYnDs3al/to/c9setlXk9U95A8+RG9g/4iJ71cTM7c824JKkA7but9Po
	AEHkhptXRjtPcbKLM3ltB6AqtqUvhJD52FuZ4NznqpEgQQSJy2yGbKbubpB/c8a/MIgdF7Ke4Ue5F
	HCCpt/kq0oRjizX7kINP1CsFX/41uReD6a6wgtyN7S1m5ua08SxS2g3TJWANo26SlErp4lRkEvwTF
	y/oEFodQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pqpji-00FU3y-1T;
	Mon, 24 Apr 2023 06:31:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pqpje-00FU2o-1K;
	Mon, 24 Apr 2023 06:31:40 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6E7EE66031C8;
	Mon, 24 Apr 2023 07:31:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682317892;
	bh=vIqjAc8DZsZDeVQlMULvMNIqSJP7b867eLICQqs065g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PbySQiJiDaNUV2KctH1jYGqojThlZ6RjbdDBAuQNdrCRcek2a7wcEH7uIKjfKQuBX
	 OhFZKS3nBydSNjXth5A5MxzqzqOuXukkB7LFMaHiu6meaw6EN/BiaggqlmEw3JVcZE
	 ItPAzKggU/hTJXhMT3H7D4LWYrEbFf0xjGnTBmjKkOKFQay7koU+g4arLO77YiIRXE
	 hws3VGE1uX/p6IDm0aZhUv6hUWJGHOya2FFwbWXQRENOcDpmIZHRVdND1KR/DC9EoK
	 62GRlbEZmjIhm9XlATEXCgygbUa1TpJvoZq+0jE9A/PWDdzsgJEdM7ViQEmdUvlig8
	 7RoU96ljkdBRA==
Message-ID: <097d60ba-5604-a2c9-c6d2-121db2d55e36@collabora.com>
Date: Mon, 24 Apr 2023 08:31:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/5] arm64: dts: mediatek: cherry: Add platform thermal
 configuration
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com>
 <20230420094433.42794-2-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GuEQMxYTKrnia1ipYHLt_B2h6By7EejE7MjCypfavnFg@mail.gmail.com>
 <5ede9421-54d6-4dda-91af-2acbf46c2d3e@notapiano>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <5ede9421-54d6-4dda-91af-2acbf46c2d3e@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230423_233138_740840_C60A2404 
X-CRM114-Status: GOOD (  17.77  )
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

Il 21/04/23 22:53, Nícolas F. R. A. Prado ha scritto:
> On Fri, Apr 21, 2023 at 03:37:52PM +0800, Chen-Yu Tsai wrote:
>> On Thu, Apr 20, 2023 at 5:45 PM AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com> wrote:
>>>
>>> This platform has three auxiliary NTC thermistors, connected to the
>>> SoC's ADC pins. Enable the auxadc in order to be able to read the
>>> ADC values, add a generic-adc-thermal LUT for each and finally assign
>>> them to the SoC's thermal zones.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   .../boot/dts/mediatek/mt8195-cherry.dtsi      | 105 ++++++++++++++++++
>>>   1 file changed, 105 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>>> index 8ac80a136c37..0820e9ba3829 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>>> @@ -114,6 +114,77 @@ ppvar_sys: regulator-ppvar-sys {
>>>                  regulator-boot-on;
>>>          };
>>>
>>> +       /* Murata NCP03WF104F05RL */
>>> +       tboard_thermistor1: thermal-sensor-t1 {
>>> +               compatible = "generic-adc-thermal";
>>> +               #thermal-sensor-cells = <0>;
>>> +               io-channels = <&auxadc 0>;
>>> +               io-channel-names = "sensor-channel";
>>> +               temperature-lookup-table = <    (-10000) 1553
>>> +                                               (-5000) 1485
>>> +                                               0 1406
>>> +                                               5000 1317
>>> +                                               10000 1219
>>> +                                               15000 1115
>>> +                                               20000 1007
>>> +                                               25000 900
>>> +                                               30000 796
>>> +                                               35000 697
>>> +                                               40000 605
>>> +                                               45000 523
>>> +                                               50000 449
>>> +                                               55000 384
>>> +                                               60000 327
>>> +                                               65000 279
>>> +                                               70000 237
>>> +                                               75000 202
>>> +                                               80000 172
>>> +                                               85000 147
>>> +                                               90000 125
>>> +                                               95000 107
>>> +                                               100000 92
>>> +                                               105000 79
>>> +                                               110000 68
>>> +                                               115000 59
>>> +                                               120000 51
>>> +                                               125000 44>;
>>> +       };
>>> +
>>> +       tboard_thermistor2: thermal-sensor-t2 {
>>> +               compatible = "generic-adc-thermal";
>>> +               #thermal-sensor-cells = <0>;
>>> +               io-channels = <&auxadc 1>;
>>> +               io-channel-names = "sensor-channel";
>>> +               temperature-lookup-table = <    (-10000) 1553
>>> +                                               (-5000) 1485
>>> +                                               0 1406
>>> +                                               5000 1317
>>> +                                               10000 1219
>>> +                                               15000 1115
>>> +                                               20000 1007
>>> +                                               25000 900
>>> +                                               30000 796
>>> +                                               35000 697
>>> +                                               40000 605
>>> +                                               45000 523
>>> +                                               50000 449
>>> +                                               55000 384
>>> +                                               60000 327
>>> +                                               65000 279
>>> +                                               70000 237
>>> +                                               75000 202
>>> +                                               80000 172
>>> +                                               85000 147
>>> +                                               90000 125
>>> +                                               95000 107
>>> +                                               100000 92
>>> +                                               105000 79
>>> +                                               110000 68
>>> +                                               115000 59
>>> +                                               120000 51
>>> +                                               125000 44>;
>>> +       };
>>> +
>>>          usb_vbus: regulator-5v0-usb-vbus {
>>>                  compatible = "regulator-fixed";
>>>                  regulator-name = "usb-vbus";
>>> @@ -260,6 +331,10 @@ &gpu {
>>>          mali-supply = <&mt6315_7_vbuck1>;
>>>   };
>>>
>>> +&auxadc {
>>> +       status = "okay";
>>> +};
>>> +
>>>   &i2c0 {
>>>          status = "okay";
>>>
>>> @@ -1098,6 +1173,36 @@ mt6315_7_vbuck1: vbuck1 {
>>>          };
>>>   };
>>>
>>> +&thermal_zones {
>>> +       soc_area_ntc {
> 
> Not sure if that's what's causing the issue, but the thermal zone name should
> end with -thermal as per the binding. Also note that it needs to be under 20
> characters otherwise it will fail to be registered with -22 like below.
> (Also, node names shouldn't contain underscore)
> 
> Thanks,
> Nícolas
> 
>>> +               polling-delay = <1000>;
>>> +               polling-delay-passive = <250>;
>>> +               thermal-sensors = <&tboard_thermistor1>;
>>> +
>>> +               trips {
>>> +                       trip-crit {
>>> +                               temperature = <95000>;
>>> +                               hysteresis = <2000>;
>>> +                               type = "critical";
>>> +                       };
>>> +               };
>>> +       };
>>> +
>>> +       pmic_area_ntc {
>>> +               polling-delay = <1000>;
>>> +               polling-delay-passive = <0>;
>>> +               thermal-sensors = <&tboard_thermistor2>;
>>> +
>>> +               trips {
>>> +                       trip-crit {
>>> +                               temperature = <95000>;
>>> +                               hysteresis = <2000>;
>>> +                               type = "critical";
>>> +                       };
>>> +               };
>>> +       };
>>
>> I'm still getting:
>>
>> thermal_sys: Failed to find 'trips' node
>> thermal_sys: Failed to find trip points for thermal-sensor-t1 id=0
>> generic-adc-thermal thermal-sensor-t1: Thermal zone sensor register failed: -22
>> generic-adc-thermal: probe of thermal-sensor-t1 failed with error -22
>> thermal_sys: Failed to find 'trips' node
>> thermal_sys: Failed to find trip points for thermal-sensor-t2 id=0
>> generic-adc-thermal thermal-sensor-t2: Thermal zone sensor register failed: -22
>> generic-adc-thermal: probe of thermal-sensor-t2 failed with error -22
>> thermal_sys: Failed to find 'trips' node
>> thermal_sys: Failed to find trip points for thermal-sensor-t3 id=0
>> generic-adc-thermal thermal-sensor-t3: Thermal zone sensor register failed: -22
>> generic-adc-thermal: probe of thermal-sensor-t3 failed with error -22
>>

I think you have something wrong locally - there's no thermal-sensor-t3 in this
devicetree...

Cheers,
Angelo


