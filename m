Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01177D6ACCE
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2024 13:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vciVWpHJW5bpmP5BXzA/2bkcrSlG4/wKFXn/vygYTjQ=; b=NQdy0LCo945ps+
	w0nB4Wxn/gYvvhUJdxv1aWAGxYtxaQPYTRUX8/MWSRfqGRCel/1psuW7Dx9mQFTtkj6Oxd9NdCy5G
	9uOTz3dc4vlT+CKAwJH59ijp+0YWbx7mqEAOM2O4fDfD9monp3bIKCkEGeKe2AgS6Jat469yapVt1
	I5vA2SO7PVLPMTwk9gROuMIz/QG0hC/gdhLCH0/xvvIZO2Hmu+IC/HLMLU04Q5nsvzYIjnK1s4K3z
	DQDdy+jMKKB7oB9HSyBpa1LUYI7z7ZNtqHfy9OhHMyRJidXOA6NgxcNquBgNGhAluO+PJAC0PDVBf
	3S/sG7kwHF7aGX6PrYow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIDp-0000000DFnu-0XZB;
	Wed, 27 Nov 2024 13:36:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIBt-0000000DFMV-0No2;
	Wed, 27 Nov 2024 13:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732714487;
	bh=O5oYtOeSE4rI0DjNjJKhJIfR3k7dbcgXA3hmMsI7WCM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g4z+tzqWqcWJhUP9AcGj0/fS1Om5bDHKaAIoWhb1WVhTla7N1+Dsxubp2x09mrslt
	 /q8eTuAOnJMTozWOrZIPD1BVqUE3adTUg9R4DtrJ0beOjFvE8zNjBWlk1asvdGclJ8
	 2U1xUDQBwX7NV4w6V6hivvtYbn9ZBRlFfUPX58l/HDWOzdMW5cZHHRVrL1R0D0D9zL
	 oSV83Q3SWPEs2/YGhK+EqOaoKaf24prwNu74spAKjIQKIbdTPJF5aJUwl/QYvsTLd2
	 f74+VtnsdZNQClWS/PxXwnPZ7WA10QzPKBkNiYFns4vlsxk5vWttJFhShQ6gBbefht
	 4avz03QcKj46A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C3B517E3700;
	Wed, 27 Nov 2024 14:34:46 +0100 (CET)
Message-ID: <6660a681-c02a-443a-a1f2-14af5b4477eb@collabora.com>
Date: Wed, 27 Nov 2024 14:34:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 14/14] arm64: dts: mediatek: mt7988: add operating-points
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <20241029103937.45852-1-linux@fw-web.de>
 <20241029103937.45852-15-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241029103937.45852-15-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_053449_288010_549D78F9 
X-CRM114-Status: GOOD (  12.40  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 29/10/24 11:39, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add operating points defining frequency/voltages of cpu cores.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 45 +++++++++++++++++++++--
>   1 file changed, 41 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> index e037854666c1..25669d498617 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> @@ -16,32 +16,69 @@ cpus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   
> -		cpu@0 {
> +		cpu0: cpu@0 {

Where are those cpuX labels used? I don't see any usage.

>   			compatible = "arm,cortex-a73";
>   			reg = <0x0>;
>   			device_type = "cpu";
>   			enable-method = "psci";
> +			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
> +				 <&topckgen CLK_TOP_XTAL>;
> +			clock-names = "cpu", "intermediate";
> +			operating-points-v2 = <&cluster0_opp>;
>   		};
>   
> -		cpu@1 {
> +		cpu1: cpu@1 {
>   			compatible = "arm,cortex-a73";
>   			reg = <0x1>;
>   			device_type = "cpu";
>   			enable-method = "psci";
> +			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
> +				 <&topckgen CLK_TOP_XTAL>;
> +			clock-names = "cpu", "intermediate";
> +			operating-points-v2 = <&cluster0_opp>;
>   		};
>   
> -		cpu@2 {
> +		cpu2: cpu@2 {
>   			compatible = "arm,cortex-a73";
>   			reg = <0x2>;
>   			device_type = "cpu";
>   			enable-method = "psci";
> +			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
> +				 <&topckgen CLK_TOP_XTAL>;
> +			clock-names = "cpu", "intermediate";
> +			operating-points-v2 = <&cluster0_opp>;
>   		};
>   
> -		cpu@3 {
> +		cpu3: cpu@3 {
>   			compatible = "arm,cortex-a73";
>   			reg = <0x3>;
>   			device_type = "cpu";
>   			enable-method = "psci";
> +			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
> +				 <&topckgen CLK_TOP_XTAL>;
> +			clock-names = "cpu", "intermediate";
> +			operating-points-v2 = <&cluster0_opp>;
> +		};
> +
> +		cluster0_opp: opp-table-0 {
> +			compatible = "operating-points-v2";
> +			opp-shared;
> +			opp00 {

...But you can also be consistent with other devicetrees and follow the pattern
for the node names of the OPP entries.

opp-800000000
opp-1100000000
...etc

Cheers,
Angelo

> +				opp-hz = /bits/ 64 <800000000>;
> +				opp-microvolt = <850000>;
> +			};
> +			opp01 {
> +				opp-hz = /bits/ 64 <1100000000>;
> +				opp-microvolt = <850000>;
> +			};
> +			opp02 {
> +				opp-hz = /bits/ 64 <1500000000>;
> +				opp-microvolt = <850000>;
> +			};
> +			opp03 {
> +				opp-hz = /bits/ 64 <1800000000>;
> +				opp-microvolt = <900000>;
> +			};
>   		};
>   	};
>   



