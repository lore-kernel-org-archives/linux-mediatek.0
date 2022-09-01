Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C454ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 08:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCMA0D9QJ9+gznYf6HXIABOQYxv6ToNZjCmsfbOOWD8=; b=Ioxv9tsJp2nIUCZUMSZZS5yRlM
	zr5zPu77ofhcMsWNm6M5Xr6qbC4S0L6YNIMEoLwQz6UBiAfe+LXaDb55+ulRmhKdZxMd9sbSc9/FL
	HedfcjxX5/W+tvrJQXZIlcgpUrXPd1zpwEVlfCoETJJr8GlTvgb8Yk7f2evQmxkGbn7r1AjZqq9Y6
	5xkzR4qny1/oz+tzsJ0IrDv8MbaxIxBJVgpJzJ8ARiDVx3gaGoRrR9os0JvWY2bBUNBK6LIjVUS2K
	DbOy4Tk7+xZPohbGvuYbMpn7unWNysoIjRT6G02FB8er2gZiwt2pNzn42R+zzDKTvhJtN1pRWQR7n
	O6zYJT3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTfKQ-00AXUF-4E; Thu, 01 Sep 2022 08:13:34 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTfKE-00AXJl-Pe; Thu, 01 Sep 2022 08:13:24 +0000
Received: by mail-wr1-x42f.google.com with SMTP id b16so13629194wru.7;
        Thu, 01 Sep 2022 01:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date;
        bh=gCMA0D9QJ9+gznYf6HXIABOQYxv6ToNZjCmsfbOOWD8=;
        b=F6OllOWZFEwGs7Le2foMXv++xH5Snpp4D2PnVkrcaHssMMk72qQBDLqWIkWNVAEHB1
         D3EvEWzoMXDJg8qdw6PK7J//gbrL4A3mO5CksK7d43kRI13ktQfy/e4ik50vP0cGLh0w
         Q4FVy0L57H2c8M0QOO8IVUyYD78XfvLYMiVc5KUk9gT6xhEefISnudJ3+1VkC/gmgJCX
         FGpfDwQ9jCIX1bklq3aMkjaTRXmHeJlWO1NHzzf1JHBhd5FKQmsLoA/YQWtv0mrUrU9m
         wNZNk683dAZoRRB7LXHn+5MYzwXbJOZPUk8fhjCo2rwkz9di/0J4rNpvXH2M8ol1yy/F
         l++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:content-language
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=gCMA0D9QJ9+gznYf6HXIABOQYxv6ToNZjCmsfbOOWD8=;
        b=wbKFQ7rd+T6hb5/NQbHohPk28oAMwPTUVX7tn5GFKC9PnfnQF5EG9Gfgbe0xZh6nEM
         363EORdIJKZ4C25y8USuE6Dap4QWSYgSYqEWQB5lycImNLTcqtgP6yTzpK5jcwIKq3yx
         BHRCEOpbTfya3mRu38mI1p5swszIdoxgqsVwU4aqWU9nmziqxW6uc5t2pKzem6r5Zk+A
         BJOu6xcro+5G4G/PBHxt8AJnGrn6WXJ3dCOBxpnmScXj66W80JwTudr/yEpCIrH+AEWz
         jSiJPMkKrTvHF/Bq33A5F0EVmEiDE2kXAIDJ9X8M0j24v78ChzXz1vYztddXTbCcYrhr
         G9/g==
X-Gm-Message-State: ACgBeo2FnQ/PwzXvvXa4qvJwsXOEw6mFE5konVvnpsh+wCb+b51sdmmB
	yrgo/62wHiEBR6dPoxCPPj4=
X-Google-Smtp-Source: AA6agR5JswT6QrU+Vp+hd4JSyR34T9yBfhZDurv6ezZAgtf/4iv1d7oWZtNzPcK5nnDGCtIW3YWHsg==
X-Received: by 2002:a5d:6d4f:0:b0:225:63aa:27b2 with SMTP id k15-20020a5d6d4f000000b0022563aa27b2mr14471366wri.599.1662020000843;
        Thu, 01 Sep 2022 01:13:20 -0700 (PDT)
Received: from [192.168.0.30] ([47.62.125.55])
        by smtp.gmail.com with ESMTPSA id e18-20020adff352000000b002252d897876sm13668290wrp.32.2022.09.01.01.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 01:13:19 -0700 (PDT)
Message-ID: <079c023c-fa2d-1a5a-41ec-6d364067eb7d@gmail.com>
Date: Thu, 1 Sep 2022 10:13:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
To: Peter Chiu <chui-hao.chiu@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.Lee@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220630094909.8014-1-chui-hao.chiu@mediatek.com>
 <b6524da2-34d6-cb7b-c8bf-19809e8932ed@gmail.com>
 <deb84c968ba615201619e5c4ef0445f09de6fc7e.camel@mediatek.com>
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4] arm64: dts: mt7986: add built-in Wi-Fi device nodes
In-Reply-To: <deb84c968ba615201619e5c4ef0445f09de6fc7e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_011322_885226_89BDBDFE 
X-CRM114-Status: GOOD (  20.53  )
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



On 01/09/2022 05:47, Peter Chiu wrote:
> On Tue, 2022-08-30 at 10:43 +0200, Matthias Brugger wrote:
>>
>> On 30/06/2022 11:49, Peter Chiu wrote:
>>> This enables built-in 802.11ax Wi-Fi support.
>>>
>>> Reviewed-by: Sam Shih <sam.shih@mediatek.com>
>>> Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
>>> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
>>> ---
>>> v2: add clocks and clock-names.
>>> v3: rename wmac to wifi and change underscores to dash in node
>>> names.
>>> v4: rebase to the latest codebase.
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 41
>>> +++++++++++++++++++
>>>    arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 23 +++++++++++
>>>    arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts | 43
>>> ++++++++++++++++++++
>>>    3 files changed, 107 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
>>> b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
>>> index 882277a..28cd168 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
>>> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
>>> @@ -115,6 +115,13 @@ &uart2 {
>>>    	status = "okay";
>>>    };
>>>    
>>> +&wifi {
>>> +	status = "okay";
>>> +	pinctrl-names = "default", "dbdc";
>>> +	pinctrl-0 = <&wf_2g_5g_pins>;
>>> +	pinctrl-1 = <&wf_dbdc_pins>;
>>> +};
>>> +
>>>    &pio {
>>>    	uart1_pins: uart1-pins {
>>>    		mux {
>>> @@ -129,4 +136,38 @@ mux {
>>>    			groups = "uart2";
>>>    		};
>>>    	};
>>> +
>>> +	wf_2g_5g_pins: wf-2g-5g-pins {
>>> +		mux {
>>> +			function = "wifi";
>>> +			groups = "wf_2g", "wf_5g";
>>
>> yaml says:
>>            - if:
>>                 properties:
>>                   function:
>>                     const: wifi
>>               then:
>>                 properties:
>>                   groups:
>>                     enum: [wf_2g, wf_5g, wf_dbdc]
>>
>>
>> Did you run the binding checker against this DTS?
> The binding checker showed the groups setting is too long. We will send
> a patch to fix yaml by setting groups as string-array.
> 

Wait, does this mean the binding was wrong in the first place, as you can't set 
all three groups in one node?

>> Why can't we just merge wf_2g_5g_pins with wf_dbdc_pins?
> Since they use different pinmux settings on the same pin, we need to
> distinguish them.
> 

wf-2g-5g-pins and wf-dbdc-pins set the same drive-strength to the very same 
group of pins. What do you mean exactly? Sorry I'm not an expert on the pinctrl 
infrastructure.

Regards,
Matthias


> Best Regards,
> Peter Chiu
>>
>> Regards,
>> Matthias
>>
>>> +		};
>>> +		conf {
>>> +			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3",
>>> "WF0_HB4",
>>> +			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5",
>>> "WF0_HB6",
>>> +			       "WF0_HB7", "WF0_HB8", "WF0_HB9",
>>> "WF0_HB10",
>>> +			       "WF0_TOP_CLK", "WF0_TOP_DATA",
>>> "WF1_HB1",
>>> +			       "WF1_HB2", "WF1_HB3", "WF1_HB4",
>>> "WF1_HB0",
>>> +			       "WF1_HB5", "WF1_HB6", "WF1_HB7",
>>> "WF1_HB8",
>>> +			       "WF1_TOP_CLK", "WF1_TOP_DATA";
>>> +			drive-strength = <4>;
>>> +		};
>>> +	};
>>> +
>>> +	wf_dbdc_pins: wf-dbdc-pins {
>>> +		mux {
>>> +			function = "wifi";
>>> +			groups = "wf_dbdc";
>>> +		};
>>> +		conf {
>>> +			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3",
>>> "WF0_HB4",
>>> +			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5",
>>> "WF0_HB6",
>>> +			       "WF0_HB7", "WF0_HB8", "WF0_HB9",
>>> "WF0_HB10",
>>> +			       "WF0_TOP_CLK", "WF0_TOP_DATA",
>>> "WF1_HB1",
>>> +			       "WF1_HB2", "WF1_HB3", "WF1_HB4",
>>> "WF1_HB0",
>>> +			       "WF1_HB5", "WF1_HB6", "WF1_HB7",
>>> "WF1_HB8",
>>> +			       "WF1_TOP_CLK", "WF1_TOP_DATA";
>>> +			drive-strength = <4>;
>>> +		};
>>> +	};
>>>    };
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
>>> b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
>>> index e3a407d..890ded0 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
>>> @@ -7,6 +7,7 @@
>>>    #include <dt-bindings/interrupt-controller/irq.h>
>>>    #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>    #include <dt-bindings/clock/mt7986-clk.h>
>>> +#include <dt-bindings/reset/mt7986-resets.h>
>>>    
>>>    / {
>>>    	interrupt-parent = <&gic>;
>>> @@ -70,6 +71,11 @@ secmon_reserved: secmon@43000000 {
>>>    			reg = <0 0x43000000 0 0x30000>;
>>>    			no-map;
>>>    		};
>>> +
>>> +		wmcpu_emi: wmcpu-reserved@4fc00000 {
>>> +			no-map;
>>> +			reg = <0 0x4fc00000 0 0x00100000>;
>>> +		};
>>>    	};
>>>    
>>>    	timer {
>>> @@ -261,6 +267,23 @@ eth: ethernet@15100000 {
>>>    			#size-cells = <0>;
>>>    			status = "disabled";
>>>    		};
>>> +
>>> +		wifi: wifi@18000000 {
>>> +			compatible = "mediatek,mt7986-wmac";
>>> +			resets = <&watchdog
>>> MT7986_TOPRGU_CONSYS_SW_RST>;
>>> +			reset-names = "consys";
>>> +			clocks = <&topckgen CLK_TOP_CONN_MCUSYS_SEL>,
>>> +				 <&topckgen CLK_TOP_AP2CNN_HOST_SEL>;
>>> +			clock-names = "mcu", "ap2conn";
>>> +			reg = <0 0x18000000 0 0x1000000>,
>>> +			      <0 0x10003000 0 0x1000>,
>>> +			      <0 0x11d10000 0 0x1000>;
>>> +			interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>,
>>> +				     <GIC_SPI 216 IRQ_TYPE_LEVEL_HIGH>;
>>> +			memory-region = <&wmcpu_emi>;
>>> +		};
>>>    	};
>>>    
>>>    };
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
>>> b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
>>> index 0f49d57..7f21b10 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
>>> +++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
>>> @@ -98,3 +98,46 @@ fixed-link {
>>>    		};
>>>    	};
>>>    };
>>> +
>>> +&wifi {
>>> +	status = "okay";
>>> +	pinctrl-names = "default", "dbdc";
>>> +	pinctrl-0 = <&wf_2g_5g_pins>;
>>> +	pinctrl-1 = <&wf_dbdc_pins>;
>>> +};
>>> +
>>> +&pio {
>>> +	wf_2g_5g_pins: wf-2g-5g-pins {
>>> +		mux {
>>> +			function = "wifi";
>>> +			groups = "wf_2g", "wf_5g";
>>> +		};
>>> +		conf {
>>> +			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3",
>>> "WF0_HB4",
>>> +			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5",
>>> "WF0_HB6",
>>> +			       "WF0_HB7", "WF0_HB8", "WF0_HB9",
>>> "WF0_HB10",
>>> +			       "WF0_TOP_CLK", "WF0_TOP_DATA",
>>> "WF1_HB1",
>>> +			       "WF1_HB2", "WF1_HB3", "WF1_HB4",
>>> "WF1_HB0",
>>> +			       "WF1_HB5", "WF1_HB6", "WF1_HB7",
>>> "WF1_HB8",
>>> +			       "WF1_TOP_CLK", "WF1_TOP_DATA";
>>> +			drive-strength = <4>;
>>> +		};
>>> +	};
>>> +
>>> +	wf_dbdc_pins: wf-dbdc-pins {
>>> +		mux {
>>> +			function = "wifi";
>>> +			groups = "wf_dbdc";
>>> +		};
>>> +		conf {
>>> +			pins = "WF0_HB1", "WF0_HB2", "WF0_HB3",
>>> "WF0_HB4",
>>> +			       "WF0_HB0", "WF0_HB0_B", "WF0_HB5",
>>> "WF0_HB6",
>>> +			       "WF0_HB7", "WF0_HB8", "WF0_HB9",
>>> "WF0_HB10",
>>> +			       "WF0_TOP_CLK", "WF0_TOP_DATA",
>>> "WF1_HB1",
>>> +			       "WF1_HB2", "WF1_HB3", "WF1_HB4",
>>> "WF1_HB0",
>>> +			       "WF1_HB5", "WF1_HB6", "WF1_HB7",
>>> "WF1_HB8",
>>> +			       "WF1_TOP_CLK", "WF1_TOP_DATA";
>>> +			drive-strength = <4>;
>>> +		};
>>> +	};
>>> +};
> 

