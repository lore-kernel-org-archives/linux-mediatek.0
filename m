Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105CEC7618E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 08:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xPrZaOurunCZkN/2TvmjCQYHKqLyJqrrjIlvNq4VWq0=; b=WHMqN7k2O517j40JQANwvvM5XM
	e09P5OBlPVcrAiJ0XT6mrzfHbUnLxTy2URsVvU/Vc9bSzBtJ2vOegmxOQP8SosoexzLoO29tsTP92
	aR3oTnRf9yiyMg3zyKeTQB3B/dCWlzMWAua8O3h33RyCLbFmu7961dL2r4g30T0gBksyGuTrHSf5H
	Ahf4K9ZeVog4Xis1q8wKOkgmKTawj7aHYVu4QCeM8JAPTaw/IesOynkJgutRmehuj6XA81foXLFJe
	XY5iO4gkSLz0AVWd5qlB1kcC5VvVGWy3XtbzoBPdwlRhJwvNamwcqr9jJKYW2qSd1FHuV0GdyZaan
	1lVs0j7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pranl-003C4n-0z;
	Wed, 26 Apr 2023 08:47:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prang-003C3g-3D;
	Wed, 26 Apr 2023 08:46:58 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 813D166032A7;
	Wed, 26 Apr 2023 09:46:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682498812;
	bh=MIvypk/ABXRS6CkQmUf5Gqt/bwzeB1sNeZv/ERfJSDU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ALh0W156IH1Nx33oly0SGgoCItZYpLTyGen+40TGR2AL+WKyNGa7tuWkft6Wmzbg+
	 X9VRSMsRc1u7z2xGEFL8cRQeHfq33j6l1LK3WatZ71b4vtmZyhnYUTIUtsb0YgtFG1
	 5Q2/w6wiqZtB7q2p58mdWekJqBruEBiA0o0710VpP7wyHyPgKKUY/kAXxxfAN9qYvv
	 hHdap9S0gBEU8rtNr9cl0eNM1ti3BkrtC2CS5wqvfNfSsitXffHa6Qjj4PILsWkwwn
	 J0FW8hW/9jgXUw5HVNnCXsVKPLPSsExCF7/UYmw4f5HkdzkJp65kpzIvL7CoYhxOQo
	 vrptfWDWLfmHg==
Message-ID: <f7a2c3f7-5a25-07ed-0c77-e87e40a7d88a@collabora.com>
Date: Wed, 26 Apr 2023 10:46:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 3/4] arm64: dts: mediatek: cherry: Configure eDP and
 internal display
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20230424112523.1436926-1-angelogioacchino.delregno@collabora.com>
 <20230424112523.1436926-4-angelogioacchino.delregno@collabora.com>
 <CAGXv+5EHAGMYE7Z-n6Wtss-sXXa0Rvv=jkse2sqyTOtGYpqR-A@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5EHAGMYE7Z-n6Wtss-sXXa0Rvv=jkse2sqyTOtGYpqR-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_014657_178326_DFEE19E4 
X-CRM114-Status: GOOD (  15.59  )
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

Il 25/04/23 10:24, Chen-Yu Tsai ha scritto:
> On Mon, Apr 24, 2023 at 7:25 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Add the required nodes to enable the DisplayPort interface, connected
>> to the Embedded DisplayPort port, where we have an internal display.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../boot/dts/mediatek/mt8195-cherry.dtsi      | 32 +++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>> index 4229f4f7dc2f..adbda4dccdd5 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
>> @@ -47,6 +47,18 @@ memory@40000000 {
>>                  reg = <0 0x40000000 0 0x80000000>;
>>          };
>>
>> +       pp3300_disp_x: regulator-pp3300-disp-x {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "pp3300_disp_x";
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +               enable-active-high;
>> +               gpio = <&pio 55 GPIO_ACTIVE_HIGH>;
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&panel_fixed_pins>;
>> +               regulator-always-on;
> 
> I think you missed my comment on v1 about this regulator's supplier and
> enable delay.
> 

Sorry, it wasn't my intention to ignore that. Will check that out and
push a v3 asap.

> ChenYu
> 
>> +       };
>> +
>>          /* system wide LDO 3.3V power rail */
>>          pp3300_z5: regulator-pp3300-ldo-z5 {
>>                  compatible = "regulator-fixed";
>> @@ -288,6 +300,20 @@ port@1 {
>>                          reg = <1>;
>>                          edp_out: endpoint {
>>                                  data-lanes = <0 1 2 3>;
>> +                               remote-endpoint = <&panel_in>;
>> +                       };
>> +               };
>> +       };
>> +
>> +       aux-bus {
>> +               panel {
>> +                       compatible = "edp-panel";
>> +                       power-supply = <&pp3300_disp_x>;
>> +                       backlight = <&backlight_lcd0>;
>> +                       port {
>> +                               panel_in: endpoint {
>> +                                       remote-endpoint = <&edp_out>;
>> +                               };
>>                          };
>>                  };
>>          };
>> @@ -927,6 +953,12 @@ pins-cs {
>>                  };
>>          };
>>
>> +       panel_fixed_pins: panel-pwr-default-pins {
>> +               pins-vreg-en {
>> +                       pinmux = <PINMUX_GPIO55__FUNC_GPIO55>;
>> +               };
>> +       };
>> +
>>          pio_default: pio-default-pins {
>>                  pins-wifi-enable {
>>                          pinmux = <PINMUX_GPIO58__FUNC_GPIO58>;
>> --
>> 2.40.0
>>
>>


