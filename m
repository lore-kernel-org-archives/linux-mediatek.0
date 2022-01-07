Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43679C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 14:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAyz04k/2WnSOVxCT9bGQum+LAVFCBQRKiytu1RyWQg=; b=OhjIfWZnfbqexoGJLKNmcq+WOb
	SRmJdjUsJJRu1UWcyCrFRvqEPkbf7jIa+abutIPZL90qhEDxqHhJ+/r3MQY3OwsC/mGpbl0xNJ56J
	HaE1FEf1M2vqyTmcnP8V+H5E2PSPdaJPDwrJwJ3emYSjB7EtY2bVvV0a629lhgf5CizN+LOeHlP79
	EHZAci0bOS4ORlx4EjWV6G8K0k0dv5rFzFZsvV9tF4nmAzlzl2z1A9xulCS1B9Et7uS6Av1e6lv7f
	tjU0jyzX38g61MG/NgiLxX2Bfzd6V52/yZjvXqTpg5J9FyPEhjMqlTyJnDzbrxYWDK8Hx60d8VwP9
	py2INB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5qKI-004D8b-Dh; Fri, 07 Jan 2022 14:34:42 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5qJW-004Ced-Df; Fri, 07 Jan 2022 14:33:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 408B91F41A85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641566033;
 bh=S6g2QtSzI5+1r67tBCkX1p6hf9aRQncVydbE/K0CvFE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FiZyESksESvLJVJb31IPZiU8saE3D5wey8Tkw0hgSqxnZLlHXC9d0CLvICOOGHNk1
 4rLTTumsxrOIzSXyOZIoVTqUJHhRj2PEU6Ro5SteSJ/Xpr1sSin0/THxxHPVW6nzEP
 SuEWH1/nUw4RiPF8zadC1QS9sfhkwDZI+I1/18WsjMcErmSBQCILbEkVeUPaSiY9Dd
 dCqA4iX7Iw/Imb09nkq2oZWEMrva7noxD0eDc0sRyyJgM5jDyXuEs/cIEvhwO1umpX
 iUPtjUHRaiR3rzs+JNYCBa8su1nGx5+Qbh6FMm77tT6dCQME73NK6B82f9auX/u4wC
 lTRc0KScgey4A==
Subject: Re: [PATCH v21 7/8] arm64: dts: mt8192: add svs device information
To: Roger Lu <roger.lu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Guenter Roeck <linux@roeck-us.net>
References: <20220107095200.4389-1-roger.lu@mediatek.com>
 <20220107095200.4389-8-roger.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <010f9b6a-d6bf-b27a-cb2d-c5fd181c3ac7@collabora.com>
Date: Fri, 7 Jan 2022 15:33:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220107095200.4389-8-roger.lu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_063354_696261_D6532E75 
X-CRM114-Status: GOOD (  18.41  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 07/01/22 10:51, Roger Lu ha scritto:
> Add compitable/reg/irq/clock/efuse/reset setting in svs node.

Typo: compitable => compatible
.. also, you're not only adding the svs node, but also efuse: please add that
information in the commit description.

> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>

This patch seems to not apply on top of the current linux-next, can you please
rebase it? That would resolve issues with this series and would be picked sooner.

Apart from that...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 39 ++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index c7c7d4e017ae..c111e26489dd 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -9,6 +9,8 @@
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/pinctrl/mt8192-pinfunc.h>
> +#include <dt-bindings/reset/ti-syscon.h>
> +
>   
>   / {
>   	compatible = "mediatek,mt8192";
> @@ -268,6 +270,14 @@
>   			compatible = "mediatek,mt8192-infracfg", "syscon";
>   			reg = <0 0x10001000 0 0x1000>;
>   			#clock-cells = <1>;
> +
> +			infracfg_rst: reset-controller {
> +				compatible = "mediatek,infra-reset", "ti,syscon-reset";
> +				#reset-cells = <1>;
> +				ti,reset-bits = <
> +					0x150 5 0x154 5 0 0     (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 0: svs */
> +				>;
> +			};
>   		};
>   
>   		pericfg: syscon@10003000 {
> @@ -362,6 +372,20 @@
>   			status = "disabled";
>   		};
>   
> +		svs: svs@1100b000 {
> +			compatible = "mediatek,mt8192-svs";
> +			reg = <0 0x1100b000 0 0x1000>;
> +			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg CLK_INFRA_THERM>;
> +			clock-names = "main";
> +			nvmem-cells = <&svs_calibration>,
> +				      <&lvts_e_data1>;
> +			nvmem-cell-names = "svs-calibration-data",
> +					   "t-calibration-data";
> +			resets = <&infracfg_rst 0>;
> +			reset-names = "svs_rst";
> +		};
> +
>   		spi1: spi@11010000 {
>   			compatible = "mediatek,mt8192-spi",
>   				     "mediatek,mt6765-spi";
> @@ -479,6 +503,21 @@
>   			#clock-cells = <1>;
>   		};
>   
> +		efuse: efuse@11c10000 {
> +			compatible = "mediatek,efuse";
> +			reg = <0 0x11c10000 0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			lvts_e_data1: data1@1c0 {
> +				reg = <0x1c0 0x58>;
> +			};
> +
> +			svs_calibration: calib@580 {
> +				reg = <0x580 0x68>;
> +			};
> +		};
> +
>   		i2c3: i2c3@11cb0000 {
>   			compatible = "mediatek,mt8192-i2c";
>   			reg = <0 0x11cb0000 0 0x1000>,
> 


-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
