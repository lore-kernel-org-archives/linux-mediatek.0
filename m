Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C7DC3DA5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 15:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zu9yMQqQ0FfE3j8YQDbHH7dfw3pFNqcztVae4m5POgU=; b=CjJ1nyeGyHKCbb
	Eoj0wPaFaJ0gf4awwLQj3aSek698V7jSuWaeUTQiCV/QZE8kNdeXHHICXRW09DAszbUB5bip2Er+T
	OtFc47tl+ojoYl1VdFadSDqlf3KBhAfH+WLLTX1zeDGRN8xXS30r+StToRGJnFT/MCHjs5EjI4TFj
	QyY8Ax+IVehV4CI17igTBvChNnXN4DrbqIvycqV8qMRs282v98CEQ/ipe8dNC8AyYp7GOMHAOmdic
	/eZI/I6EWMa+PFjVVQKaP1qx8f9lq7RD3L4xvBd5wzR9a8PvDWaLPDtSqKQZiO3EJu8K7inKruSQm
	Due7UB9YarXv3qZGf5Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVukE-00000009uDC-2X59;
	Mon, 22 Jul 2024 15:14:34 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVujq-00000009u7y-17Sa;
	Mon, 22 Jul 2024 15:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721661248;
	bh=nBplABP7eOfFn5jv0FYWlCypm74Gue3s6LT4wXx/6ik=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S9FWagLhiDAxT9N8sm2LrgsV3ZNAMV0yT/44qgAfDzT1a4BARQNDFAApfWjRvpB+R
	 1SQbNAAMKYRdA2Vi9ItSS9sHZnjZqgpi+UWQEP+vxYakdG8YxS18ohqDmxIlSSWz/R
	 jniWJsw54o5bYB/v8zOvfB3+g8SGDHevjKO1TrEwk3LsAjO3o5GE9wvMdPuf1Je5Vg
	 +JtJ3LNl5w1mVOcJFTcvfVe0J1VOLx8LlBndZgsEYdY/K4ul4N1IO2mT+vrrBTVraI
	 DJm1Y0AdbExB9nxU3DJy/w4sZNEg8rdZdUqqiwex04PS2PO2jcOxAZIpcLlUJGhGkD
	 +Qi1voRcO52Fg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D5B09378001E;
	Mon, 22 Jul 2024 15:14:07 +0000 (UTC)
Message-ID: <89f6381b-8572-4d58-a8a9-0a3596efc627@collabora.com>
Date: Mon, 22 Jul 2024 17:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: mediatek: mt7988: add labels for different
 nodes
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240709081614.19993-1-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240709081614.19993-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_081410_481055_365635F6 
X-CRM114-Status: GOOD (  14.61  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 09/07/24 10:16, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Current devicetree-nodes missing a label which allows to add aproperties
> or phandles to them, so add them.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Fixes: 660c230bf302 ("arm64: dts: mediatek: mt7988: add I2C controllers")
> Fixes: 09ff2216a035 ("arm64: dts: mediatek: mt7988: add PWM controller")
> Fixes: 09346afaba0a ("arm64: dts: mediatek: mt7988: add XHCI controllers")
> Fixes: b616b403cbff ("arm64: dts: mediatek: mt7988: add clock controllers")
> Fixes: 6c1d134a103f ("arm64: dts: mediatek: Add initial MT7988A and BPI-R4")

You're just only adding node labels, what does this actually fix?!?

Besides, I could tell you to remove the Fixes tags, but then, there's still nothing
using those node labels - so there's nothing justifying this addition, at all.

I guess that you want to use those (bar the cpu[0-3] labels, which you're adding
because... uhh.. why?) from some board DT... so please just do that: send a commit
adding your board DT and adding the required node label(s) here as a consequence.

Cheers,
Angelo

> ---
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 32 +++++++++++------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index aa728331e876..9ced005b1595 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> @@ -14,28 +14,28 @@ cpus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   
> -		cpu@0 {
> +		cpu0: cpu@0 {
>   			compatible = "arm,cortex-a73";
>   			reg = <0x0>;
>   			device_type = "cpu";
>   			enable-method = "psci";
>   		};
>   
> -		cpu@1 {
> +		cpu1: cpu@1 {
>   			compatible = "arm,cortex-a73";
>   			reg = <0x1>;
>   			device_type = "cpu";
>   			enable-method = "psci";
>   		};
>   
> -		cpu@2 {
> +		cpu2: cpu@2 {
>   			compatible = "arm,cortex-a73";
>   			reg = <0x2>;
>   			device_type = "cpu";
>   			enable-method = "psci";
>   		};
>   
> -		cpu@3 {
> +		cpu3: cpu@3 {
>   			compatible = "arm,cortex-a73";
>   			reg = <0x3>;
>   			device_type = "cpu";
> @@ -43,7 +43,7 @@ cpu@3 {
>   		};
>   	};
>   
> -	oscillator-40m {
> +	system_clk: oscillator-40m {
>   		compatible = "fixed-clock";
>   		clock-frequency = <40000000>;
>   		#clock-cells = <0>;
> @@ -86,7 +86,7 @@ infracfg: clock-controller@10001000 {
>   			#clock-cells = <1>;
>   		};
>   
> -		clock-controller@1001b000 {
> +		topckgen: clock-controller@1001b000 {
>   			compatible = "mediatek,mt7988-topckgen", "syscon";
>   			reg = <0 0x1001b000 0 0x1000>;
>   			#clock-cells = <1>;
> @@ -99,13 +99,13 @@ watchdog: watchdog@1001c000 {
>   			#reset-cells = <1>;
>   		};
>   
> -		clock-controller@1001e000 {
> +		apmixedsys: clock-controller@1001e000 {
>   			compatible = "mediatek,mt7988-apmixedsys";
>   			reg = <0 0x1001e000 0 0x1000>;
>   			#clock-cells = <1>;
>   		};
>   
> -		pwm@10048000 {
> +		pwm: pwm@10048000 {
>   			compatible = "mediatek,mt7988-pwm";
>   			reg = <0 0x10048000 0 0x1000>;
>   			clocks = <&infracfg CLK_INFRA_66M_PWM_BCK>,
> @@ -124,7 +124,7 @@ pwm@10048000 {
>   			status = "disabled";
>   		};
>   
> -		i2c@11003000 {
> +		i2c0: i2c@11003000 {
>   			compatible = "mediatek,mt7981-i2c";
>   			reg = <0 0x11003000 0 0x1000>,
>   			      <0 0x10217080 0 0x80>;
> @@ -137,7 +137,7 @@ i2c@11003000 {
>   			status = "disabled";
>   		};
>   
> -		i2c@11004000 {
> +		i2c1: i2c@11004000 {
>   			compatible = "mediatek,mt7981-i2c";
>   			reg = <0 0x11004000 0 0x1000>,
>   			      <0 0x10217100 0 0x80>;
> @@ -150,7 +150,7 @@ i2c@11004000 {
>   			status = "disabled";
>   		};
>   
> -		i2c@11005000 {
> +		i2c2: i2c@11005000 {
>   			compatible = "mediatek,mt7981-i2c";
>   			reg = <0 0x11005000 0 0x1000>,
>   			      <0 0x10217180 0 0x80>;
> @@ -163,7 +163,7 @@ i2c@11005000 {
>   			status = "disabled";
>   		};
>   
> -		usb@11190000 {
> +		ssusb0: usb@11190000 {
>   			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
>   			reg = <0 0x11190000 0 0x2e00>,
>   			      <0 0x11193e00 0 0x0100>;
> @@ -177,7 +177,7 @@ usb@11190000 {
>   			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
>   		};
>   
> -		usb@11200000 {
> +		ssusb1: usb@11200000 {
>   			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
>   			reg = <0 0x11200000 0 0x2e00>,
>   			      <0 0x11203e00 0 0x0100>;
> @@ -191,21 +191,21 @@ usb@11200000 {
>   			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
>   		};
>   
> -		clock-controller@11f40000 {
> +		xfi_pll: clock-controller@11f40000 {
>   			compatible = "mediatek,mt7988-xfi-pll";
>   			reg = <0 0x11f40000 0 0x1000>;
>   			resets = <&watchdog 16>;
>   			#clock-cells = <1>;
>   		};
>   
> -		clock-controller@15000000 {
> +		ethsys: clock-controller@15000000 {
>   			compatible = "mediatek,mt7988-ethsys", "syscon";
>   			reg = <0 0x15000000 0 0x1000>;
>   			#clock-cells = <1>;
>   			#reset-cells = <1>;
>   		};
>   
> -		clock-controller@15031000 {
> +		ethwarp: clock-controller@15031000 {
>   			compatible = "mediatek,mt7988-ethwarp";
>   			reg = <0 0x15031000 0 0x1000>;
>   			#clock-cells = <1>;



