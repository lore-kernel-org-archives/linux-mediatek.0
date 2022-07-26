Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B3AC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 08:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4SYVCRpm2icORohoMCa6IZnq0jr4RV8pAdwhYtFisgU=; b=kSOo1peAw9vkt7WSpIylWkh5dQ
	pltFRGvP4KAB3jQ+OdT3cyQ3myNQyO365D+8hox+sCqpF2k6Dz4IJC9VUyhIMhymuScmSNiHJbqI4
	FpHsksXt6TkvET/d4sAiKKXnmR0KM7E0uMC+y8SEQ5rFUkGs7SbbGaYNOO2lT2tUJNc4cJDDPqlz7
	hUTWnrdcPApUyPGHIdlincCK2L4WCIorgnZ5NLGdVdTjUx4BQ/Y3hhS4Yql1PB7kWmtVgtMC/yAnF
	EGQL0SPZu5oZ0hWbwjrqOSAaebUPcBnbx1uhd/vzBniWLo5gN0a9bFED5ZxPwMtQTYslplL8zG+fX
	+OuFkVZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFhO-009z2D-SG; Tue, 26 Jul 2022 08:13:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFfR-009xOk-OW; Tue, 26 Jul 2022 08:11:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1CA406601596;
	Tue, 26 Jul 2022 09:11:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658823106;
	bh=dAET0aJ9O9CxvAJfCeQORiWmh5LRUFbf9om4jQFdjY4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZjmkO9Cn8oeBIVweESZI6SC07GIY7x7cS4W52UqDgn69x85kP/lIrwfXAYWqiCf5M
	 rn8ZnmU9ODb+8q4TNoSx5fPkPjz7fkiRRFV692mQL9AfTzwdh8bcblyhFUNcCmyOjM
	 WO3jl2RsJxt6ZeNI0ZMHjeYMuRHJCHMrlUI83HkYD07BMwbuGkdaKT3raK1tHdxcH5
	 7PsL7c1ka4DQqoE+d+vQJGK55JiFuVO8HHMFr9qku45vRP1+7rgiKFHnnFcuN5N50x
	 FLN3Tp7ADiAgauA9+kHZlqSqlFP/bA6568qODWXXMtD62+h4c8CzgwrrM6mAzEHLTx
	 jZbOmXia3+ZNw==
Message-ID: <5d8690e4-a4ec-4ee9-4bed-bc6bf32ae80b@collabora.com>
Date: Tue, 26 Jul 2022 10:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/8] arm64: dts: mediatek: cherry: Enable secondary
 SD/MMC controller
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220721145017.918102-1-angelogioacchino.delregno@collabora.com>
 <20220721145017.918102-5-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FutJb_MRwSVgjV7tByBvfq3AFsSxs6ETUZaNzrfpywgg@mail.gmail.com>
 <781f6d3e-412e-1553-c2c2-23c9a897626b@collabora.com>
 <CAGXv+5Gdwcj1n0q8e8ReoUOZX18pbtbxV7oof06Q2_nJMNY-cw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Gdwcj1n0q8e8ReoUOZX18pbtbxV7oof06Q2_nJMNY-cw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_011150_116767_3514B76D 
X-CRM114-Status: GOOD (  22.33  )
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

Il 26/07/22 06:04, Chen-Yu Tsai ha scritto:
> On Mon, Jul 25, 2022 at 6:20 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 25/07/22 10:54, Chen-Yu Tsai ha scritto:
>>> On Thu, Jul 21, 2022 at 10:51 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> As of now, all of the boards based on the cherry platform have a
>>>> usable secondary SD/MMC controller, usually for SD cards: enable
>>>> it to allow both booting from it and generally accessing external
>>>> storage.
>>>>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    .../boot/dts/mediatek/mt8195-cherry.dtsi      | 62 +++++++++++++++++++
>>>>    1 file changed, 62 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>>>> index 2853f7f76c90..8859957c7b27 100644
>>>> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>>>> @@ -17,6 +17,7 @@ aliases {
>>>>                   i2c5 = &i2c5;
>>>>                   i2c7 = &i2c7;
>>>>                   mmc0 = &mmc0;
>>>> +               mmc1 = &mmc1;
>>>>                   serial0 = &uart0;
>>>>           };
>>>>
>>>> @@ -227,6 +228,24 @@ &mmc0 {
>>>>           vqmmc-supply = <&mt6359_vufs_ldo_reg>;
>>>>    };
>>>>
>>>> +&mmc1 {
>>>> +       status = "okay";
>>>> +
>>>> +       bus-width = <4>;
>>>> +       cap-sd-highspeed;
>>>> +       cd-gpios = <&pio 54 GPIO_ACTIVE_LOW>;
>>>> +       max-frequency = <200000000>;
>>>> +       no-mmc;
>>>> +       no-sdio;
>>>> +       pinctrl-names = "default", "state_uhs";
>>>> +       pinctrl-0 = <&mmc1_pins_default>;
>>>> +       pinctrl-1 = <&mmc1_pins_uhs>;
>>>> +       sd-uhs-sdr50;
>>>> +       sd-uhs-sdr104;
>>>> +       vmmc-supply = <&mt_pmic_vmch_ldo_reg>;
>>>> +       vqmmc-supply = <&mt_pmic_vmc_ldo_reg>;
>>>> +};
>>>> +
>>>>    /* for CPU-L */
>>>>    &mt6359_vcore_buck_reg {
>>>>           regulator-always-on;
>>>> @@ -575,6 +594,49 @@ pins-rst {
>>>>                   };
>>>>           };
>>>>
>>>> +       mmc1_pins_default: mmc1-default-pins {
>>>> +               pins-cmd-dat {
>>>> +                       pinmux = <PINMUX_GPIO110__FUNC_MSDC1_CMD>,
>>>> +                                <PINMUX_GPIO112__FUNC_MSDC1_DAT0>,
>>>> +                                <PINMUX_GPIO113__FUNC_MSDC1_DAT1>,
>>>> +                                <PINMUX_GPIO114__FUNC_MSDC1_DAT2>,
>>>> +                                <PINMUX_GPIO115__FUNC_MSDC1_DAT3>;
>>>> +                       input-enable;
>>>> +                       drive-strength = <8>;
>>>> +                       bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
>>>> +               };
>>>> +
>>>> +               pins-clk {
>>>> +                       pinmux = <PINMUX_GPIO111__FUNC_MSDC1_CLK>;
>>>> +                       drive-strength = <8>;
>>>> +                       bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>>>> +               };
>>>> +
>>>> +               pins-insert {
>>>> +                       pinmux = <PINMUX_GPIO54__FUNC_GPIO54>;
>>>> +                       bias-pull-up;
>>>> +               };
>>>> +       };
>>>> +
>>>> +       mmc1_pins_uhs: mmc1-uhs-pins {
>>>> +               pins-cmd-dat {
>>>> +                       pinmux = <PINMUX_GPIO110__FUNC_MSDC1_CMD>,
>>>> +                                <PINMUX_GPIO112__FUNC_MSDC1_DAT0>,
>>>> +                                <PINMUX_GPIO113__FUNC_MSDC1_DAT1>,
>>>> +                                <PINMUX_GPIO114__FUNC_MSDC1_DAT2>,
>>>> +                                <PINMUX_GPIO115__FUNC_MSDC1_DAT3>;
>>>> +                       input-enable;
>>>> +                       drive-strength = <8>;
>>>> +                       bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
>>>> +               };
>>>> +
>>>> +               pins-clk {
>>>> +                       pinmux = <PINMUX_GPIO111__FUNC_MSDC1_CLK>;
>>>> +                       drive-strength = <8>;
>>>> +                       bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
>>>> +               };
>>>
>>> I wonder if pins-insert should be duplicated here. And there's no
>>> difference between the standard and UHS pinconfigs. One would expect
>>> higher drive strength on the UHS set, if two sets were required.
>>> So maybe we should just have one set, and use that one for both
>>> the default and uhs states.
>>>
>>
>> I don't think that it would really make a lot of sense to duplicate the
>> insertion pin setup in the UHS-specific pinctrl set...
>>
>> Whenever you remove the uSD card, the controller goes back to default,
>> as the first steps in card initialization are always happening at low
>> speed and only after that we can switch to UHS speeds... so we do expect
>> that the first-ever state is always `default` (by spec!), which means
>> that we are also ensuring that the insertion pin setup is always done.
> 
> Right. What I wanted to say was that, besides the insertion pin, there's
> no difference between the default and uhs states here. So why have two
> copies instead of one that is referenced twice? (the uhs state is required
> by the binding).
> 

OH!!!! Right. Yes I definitely agree with you on that one.

Let's split the pins-insert in `mmc1_pins_det: mmc1-detect-pins` and add
a reference to it in the default pinctrl, that's a sensible option.

I'll do that for v3!

> ChenYu
> 
>> Cheers,
>> Angelo
>>
>>> Otherwise,
>>>
>>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>>> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>>>
>>>> +       };
>>>> +
>>>>           nor_pins_default: nor-default-pins {
>>>>                   pins-ck-io {
>>>>                           pinmux = <PINMUX_GPIO142__FUNC_SPINOR_IO0>,
>>>> --
>>>> 2.35.1
>>>>
>>>>
>>


-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

