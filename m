Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B4FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 15:30:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E58C461374
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 15:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E58C461374
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RzG0j0Sx//lvsEyCbyULtVlYgFRKhwbJKO5o3jLho9M=; b=scpIl7sR/0M+RheT6c8AOIyQlh
	5q4SBQnk74SHJIPa/DpLXYcDbMI70ho6IRYQGUaEOyxoOvn4wxpLrbL8eSHY+JJze7gseQWOW7z9O
	6hPZLf4IctWpK0+o1LFLmLIrRT/bJ396NalfmcM0UzJbhhDj20ENDTXQzzku6BcL+ToS3+IrY8Xrp
	R7gxaWqZpAQBC3JQ5z6U7EjzF+INxEGvLtvtyjWoOUREx+zh45T0Ke3rJb1TXl++Q5dpD9q3PBiUK
	oZzCHbsum6t/8fy33r5GkkG3Y9836638E1FwGO8yliBPkjQxMpw+qkpwsn0gHDtWYuxycJ7ksAFfY
	Tw362w+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdDXM-0052Dp-TB; Wed, 20 Oct 2021 15:29:52 +0000
Received: from relay06.th.seeweb.it ([5.144.164.167])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdDK5-004wzC-AC
 for linux-mediatek@lists.infradead.org; Wed, 20 Oct 2021 15:16:11 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id AA9903F36D;
 Wed, 20 Oct 2021 17:16:00 +0200 (CEST)
Subject: Re: [PATCH v16 6/7] arm64: dts: mt8192: add svs device information
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
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210428065440.3704-1-roger.lu@mediatek.com>
 <20210428065440.3704-7-roger.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Message-ID: <855e004b-b128-70f7-b1d2-9fe957c94e08@somainline.org>
Date: Wed, 20 Oct 2021 17:16:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210428065440.3704-7-roger.lu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_081609_582590_28EA3C88 
X-CRM114-Status: GOOD (  17.70  )
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

Il 28/04/21 08:54, Roger Lu ha scritto:
> add compitable/reg/irq/clock/efuse/reset setting in svs node
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 34 ++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 

Hello Roger,
thanks for this series! However, there is an issue with this patch:

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index fe24cc66ff7a..e9816a56d87b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -270,6 +270,14 @@
>   			compatible = "mediatek,mt8192-infracfg", "syscon";
>   			reg = <0 0x10001000 0 0x1000>;
>   			#clock-cells = <1>;
> +
> +			infracfg_rst: reset-controller {
> +				compatible = "mediatek,infra-reset", "ti,syscon-reset";
> +				#reset-cells = <1>;
> +				ti,reset-bits = <
> +					0x150 5 0x154 5 0 0     (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 0: svs */

You are using macros here, which are defined in dt-bindings/reset/ti-syscon.h
hovever, you are not including this header in this devicetree, so it's not
compiling.

Please fix it.

> +				>;
> +			};
>   		};
>   
>   		pericfg: syscon@10003000 {
> @@ -564,6 +572,20 @@
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
> @@ -681,6 +703,18 @@
>   			#clock-cells = <1>;
>   		};
>   
> +		efuse: efuse@11c10000 {
> +			compatible = "mediatek,efuse";
> +			reg = <0 0x11c10000 0 0x1000>;
> +

arch/arm64/boot/dts/mediatek/mt8192.dtsi:510.5-24: Warning (reg_format): 
/soc/efuse@11c10000/data1:reg: property has invalid length (8 bytes) 
(#address-cells == 2, #size-cells == 1)

arch/arm64/boot/dts/mediatek/mt8192.dtsi:513.5-24: Warning (reg_format): 
/soc/efuse@11c10000/calib@580:reg: property has invalid length (8 bytes) 
(#address-cells == 2, #size-cells == 1)


In short, you should add here:
			#address-cells = <1>;
			#size-cells = <1>;

> +			lvts_e_data1: data1 {
> +				reg = <0x1C0 0x58>;
> +			};
> +			svs_calibration: calib@580 {
> +				reg = <0x580 0x68>;
> +			};
> +		};
> +
>   		i2c3: i2c3@11cb0000 {
>   			compatible = "mediatek,mt8192-i2c";
>   			reg = <0 0x11cb0000 0 0x1000>,
> 

Regards,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
