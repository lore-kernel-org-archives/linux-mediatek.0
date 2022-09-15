Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541C3ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 08:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=km31OSbUfFBioUbRD/QFi2mJZTseFM44jVvN7vKxJPM=; b=4xndwYUgEXM9kgGqVU518+qAoS
	e4Uq+1DY18PEtOx9BHWwa9HdF+PbhVRkF/7HiWXwhRU3L4I4nD5JSic8OzYisM6jPM1V2/L2eJRZJ
	0Ij176xDbr3giJBot8kGHiit8HwipwVnfH/NETHdlzo3Ol+P9XlWQrN82yEduUUryLAaLIna4pCIj
	FWLj5sWOuRtyr9D20/eOO/JIMUEsZTL/IvwBzeOQAoCX1D8V5T/y4xLqZ24AdKUxJRRona9JKUwdD
	G2sgqzLoSZOofg728iyA5K4PgDuLsST3N7pcfiSpZb7CDS7vH3y4d88ZYhiynQ/EkRmVSY4Q4jWf7
	4mStoOvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYk1L-003Svq-OI; Thu, 15 Sep 2022 08:14:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYk0U-003RZ7-H8; Thu, 15 Sep 2022 08:14:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C652E6601F69;
	Thu, 15 Sep 2022 09:13:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663229637;
	bh=I2xs6D1zEs3I3lvxfGXdbPUnS9e6puW/jlv8hQFnZrc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m6ZneEwjAzPFamedYARR4FTTD7womy74xDRCDKKKrFVrX3HseABHMCDEO2KK5qZK7
	 l4KsmoQds+/Di91g1qWa2yY2EgkBHfYpZFEqeM9jtvX0jsT0E9Zadsyxpo4ctUrB9j
	 EMCZ89PuRJPhE7q6zXVtuFtO5ksPIn8gHjC4mGCnYjz0vUxLB3pjbGRur0+uD69d12
	 vxhB3in6wB1lXQnfhuz4hZF6GpFwU4XEREwKvq1XlQO6mAgmT/f4u3JrhMYyaO9weH
	 KbGBum4oPvClVyVNv7dRz/WFF5DWk9Zcy9Q02N0NBlpsUC2tj0XGMOZhAqniSR04kz
	 kpACVNR4x7ATw==
Message-ID: <f882ab40-b9bf-3f38-d62e-c175135383c3@collabora.com>
Date: Thu, 15 Sep 2022 10:13:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/4] arm64: dts: mt8195: Add dp-intf nodes
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220915075849.1920-1-rex-bc.chen@mediatek.com>
 <20220915075849.1920-2-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220915075849.1920-2-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_011358_764875_4FC2BD3D 
X-CRM114-Status: GOOD (  13.47  )
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

Il 15/09/22 09:58, Bo-Chen Chen ha scritto:
> Add dp-intf0 and dp-intf1 nodes for MT8195.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 905d1a90b406..93e6a106a9b8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -2155,5 +2155,28 @@
>   			clock-names = "apb", "smi", "gals";
>   			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
>   		};
> +
> +		dp_intf0: dp-intf@1c015000 {

Please keep the devicetree nodes ordered by mmio.
dp_intf0 goes between mutex@1c016000 and larb@1c018000.


> +			status = "disabled";

status = "disabled" across the entire mt8195.dtsi nodes is always at the end.
Please keep consistency.

> +			compatible = "mediatek,mt8195-dp-intf";
> +			reg = <0 0x1c015000 0 0x1000>;
> +			interrupts = <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys0  CLK_VDO0_DP_INTF0>,
> +				 <&vdosys0 CLK_VDO0_DP_INTF0_DP_INTF>,
> +				 <&apmixedsys CLK_APMIXED_TVDPLL1>;
> +			clock-names = "engine", "pixel", "pll";
> +		};
> +
> +		dp_intf1: dp-intf@1c113000 {
> +			compatible = "mediatek,mt8195-dp-intf";
> +			reg = <0 0x1c113000 0 0x1000>;
> +			interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			clocks = <&vdosys1 CLK_VDO1_DP_INTF0_MM>,
> +				 <&vdosys1 CLK_VDO1_DPINTF>,
> +				 <&apmixedsys CLK_APMIXED_TVDPLL2>;
> +			clock-names = "engine", "pixel", "pll";
> +			status = "disabled";
> +		};
>   	};
>   };



