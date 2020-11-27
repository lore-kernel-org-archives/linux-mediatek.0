Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 401B5C63777
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 11:20:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9E1D20B80
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 11:20:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SLL4tIHt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oMcX1SSP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9E1D20B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4P1MICwv/gjc103kxF6kNTu8uAUZ0gOf9eJeOhBOOEM=; b=SLL4tIHt18qdznPTZtC/vkDBf
	RDFrtYf2fYzQ6ssY26SC85EgMZU7uqn68kGewERnIB8ulA8Td3d5+El6+XGynfv+AXR7F20NtZKON
	9XxKoubPqnr9GTpRKRxvIaNiBL1glsxCZLdafYFOQzsxNWiapLQ5UXg3dg51pjqvkEPUKgvktu66g
	YT9rct1rV5R4/Gd1AdhV5anEb+J9deYQBoYuHUi4qgWx/taGl8t4A4yjlKJqp0MddN2TtU0ARHJwJ
	kpgV+3qQJ2It5fFlsPL4FGAnBr1v4wvfha4CoZyiwvjsVpDtzNnEO3fC2ZNZiShycm8FtzoDgxP/y
	yoUNJLljA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kibns-00071Q-Su; Fri, 27 Nov 2020 11:20:40 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kibnr-00070q-7y; Fri, 27 Nov 2020 11:20:40 +0000
Received: by mail-wr1-x441.google.com with SMTP id i2so5196060wrs.4;
 Fri, 27 Nov 2020 03:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cxB5L4+nF4sAICEXNlH6T+45cqgn3iHBYM/XseYVDT0=;
 b=oMcX1SSPuZ7WZNlcfoLpo5kUKsjOQsj7bbxQ+lSji6KOD5rEscQ/FDo0JAKzLmYlfS
 NZuaij9DXI5uOth4VRJ7/pkSVEQ0Ay5D3gIEI9AXJzfAnnNM9hFz4l/IaxhUJuzzNws8
 tIfhOuGPV7vS1wfaOYCMw23AKZ1Yjp0DK0Z7p7g6AQzZz86cJT42EmpKwoYRChRV0mG7
 JmJ5U7H84XyU+eDGQxjYdOy1CMxgjuIABGf7lYGTiR+T0P+Nv0lhUsr5CiKbkxE7Vm7v
 VypW2u4Qziv8rhqzkGAwhh3Mt+Fu8JcAN2RY7bRIRPMKf/tsK1+rWf72nX9vLpdKdw2w
 /SOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cxB5L4+nF4sAICEXNlH6T+45cqgn3iHBYM/XseYVDT0=;
 b=VIXX6i6YpdaHI3E2UuqbqYLVp5sbLkPoV3kYitA8arJK65jkw6XC1DVULGo+nrK+dB
 ZPEksfxBNGw6FIrqTI+khMrzEN4zgaONkXtZK6L7AMcL9xHw4U2rSBZtk8D+ifs/kQGb
 iQX2Cx1kww/at8947btk1B1dsHOhHM0XqqhTbS7xgqrn4X6rhgSMYke83jwrwIztl/jC
 S0/+pPbrNUMLnea/tonr2Z2+OUIX1ieLxBzg1oTxkIIcn1o5i94I+Zu87LHWnV/d0tn+
 Yu0Eyg0xRVs7c1t6NXgua8oeMOx0VKRGw3A0f065RRzNcVXh8jjv8enuRpEEyUKxHymR
 PuJA==
X-Gm-Message-State: AOAM530yE82D+OfQQ5WWlwMPRvJEkqTdESSGDxBZIapADBS3cLi6fW+L
 r+GmhnGalUtwGb9barUK4O+zkiYzz99EKw==
X-Google-Smtp-Source: ABdhPJwrYIqMkKez+ccJKOv7rpRAHruS5C1aifhxSJlqY+fgx0LKeQ89hHcgT/0TXhf2e0s2uxvG8w==
X-Received: by 2002:adf:b78d:: with SMTP id s13mr9631926wre.383.1606476037970; 
 Fri, 27 Nov 2020 03:20:37 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id 189sm13678368wmb.18.2020.11.27.03.20.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 03:20:37 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: mt8183: Add pwm and backlight node
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, linux-kernel@vger.kernel.org
References: <20201124041253.4181273-1-hsinyi@chromium.org>
 <8484ec3b-14aa-f0de-28d6-f360c491515b@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <acb813d6-8643-5b9a-2ae1-bc03f2a37ffa@gmail.com>
Date: Fri, 27 Nov 2020 12:20:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <8484ec3b-14aa-f0de-28d6-f360c491515b@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_062039_329146_24E18316 
X-CRM114-Status: GOOD (  20.01  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 25/11/2020 11:24, Enric Balletbo i Serra wrote:
> Hi Hsin-Yi,
> 
> Thank you for your patch.
> 
> On 24/11/20 5:12, Hsin-Yi Wang wrote:
>> Add pwm to mt8183 and backlight to mt8183-kukui.
>>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> ---
> 
> Picked the patch and checked that pwm for the backlight is working as expected
> on my Lenovo Ideapad Duet.
> 
> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> 

Applied to v5.10-next/dts64

Thanks!

>>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 28 +++++++++++++++++++
>>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 10 +++++++
>>   2 files changed, 38 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> index 85f7c33ba4461..bf2ad1294dd30 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> @@ -19,6 +19,17 @@ chosen {
>>   		stdout-path = "serial0:115200n8";
>>   	};
>>   
>> +	backlight_lcd0: backlight_lcd0 {
>> +		compatible = "pwm-backlight";
>> +		pwms = <&pwm0 0 500000>;
>> +		power-supply = <&bl_pp5000>;
>> +		enable-gpios = <&pio 176 0>;
>> +		brightness-levels = <0 1023>;
>> +		num-interpolated-steps = <1023>;
>> +		default-brightness-level = <576>;
>> +		status = "okay";
>> +	};
>> +
>>   	memory@40000000 {
>>   		device_type = "memory";
>>   		reg = <0 0x40000000 0 0x80000000>;
>> @@ -536,6 +547,17 @@ pins_clk {
>>   		};
>>   	};
>>   
>> +	pwm0_pin_default: pwm0_pin_default {
>> +		pins1 {
>> +			pinmux = <PINMUX_GPIO176__FUNC_GPIO176>;
>> +			output-high;
>> +			bias-pull-up;
>> +		};
>> +		pins2 {
>> +			pinmux = <PINMUX_GPIO43__FUNC_DISP_PWM>;
>> +		};
>> +	};
>> +
>>   	scp_pins: scp {
>>   		pins_scp_uart {
>>   			pinmux = <PINMUX_GPIO110__FUNC_TP_URXD1_AO>,
>> @@ -670,6 +692,12 @@ pins_wifi_wakeup {
>>   	};
>>   };
>>   
>> +&pwm0 {
>> +	status = "okay";
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pwm0_pin_default>;
>> +};
>> +
>>   &scp {
>>   	status = "okay";
>>   	pinctrl-names = "default";
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> index 08a914d3a6435..a974bad899365 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>> @@ -479,6 +479,16 @@ spi0: spi@1100a000 {
>>   			status = "disabled";
>>   		};
>>   
>> +		pwm0: pwm@1100e000 {
>> +			compatible = "mediatek,mt8183-disp-pwm";
>> +			reg = <0 0x1100e000 0 0x1000>;
>> +			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_LOW>;
>> +			#pwm-cells = <2>;
>> +			clocks = <&topckgen CLK_TOP_MUX_DISP_PWM>,
>> +					<&infracfg CLK_INFRA_DISP_PWM>;
>> +			clock-names = "main", "mm";
>> +		};
>> +
>>   		i2c3: i2c@1100f000 {
>>   			compatible = "mediatek,mt8183-i2c";
>>   			reg = <0 0x1100f000 0 0x1000>,
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
