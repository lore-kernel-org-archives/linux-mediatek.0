Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834A0C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 15:59:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43B3E23884
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 15:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43B3E23884
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uJPMZrUfPJBOY+yvBZdf+lqW4AjSclJO820zc9Il9NY=; b=zhXJJp4B2vU/i/Wz/akKk1Rir
	r8pSlMntx8WqMpCu/oB8ULzZEG2Qf3wpU1WwyV38VkNFxKpyhHJOiiM9ylyXXO2uBoU26PY487Ro7
	5z6csw67wjs60MGYNX+Ec5JTl0x/HnDU/PL5ZiUSXOnpHedWyDZBBs/ksG0mriVN3kpWUJXdSB3DY
	4y2yP3hkRl1YLo0v8fDq6e7k4aKJ/rgN42vcFqMrGdaqdHlOFix3CRVboKL9VDTiu9vKifHgoQ/3o
	QUhrH8l4Kfph3iJ1JgaUNGOC/Ev2Q2V0/E8EoroOB0gnUyMj5ub5ADEEQUFR2tT/CleInbtxvJPJz
	24BFkqxxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxuAB-0000lh-LQ; Fri, 08 Jan 2021 15:58:55 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxu9l-0000dF-8j; Fri, 08 Jan 2021 15:58:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA76331B;
 Fri,  8 Jan 2021 07:58:26 -0800 (PST)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C6F83F70D;
 Fri,  8 Jan 2021 07:58:25 -0800 (PST)
Subject: Re: [PATCH v2 2/2] arm64: dts: mt8192: Add node for the Mali GPU
To: Nick Fan <Nick.Fan@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20210105053632.5476-1-Nick.Fan@mediatek.com>
 <20210105053632.5476-2-Nick.Fan@mediatek.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <3d3bf91a-92b0-385c-b7c1-35af7732f05f@arm.com>
Date: Fri, 8 Jan 2021 15:58:24 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210105053632.5476-2-Nick.Fan@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_105829_471756_627374DA 
X-CRM114-Status: GOOD (  19.49  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 05/01/2021 05:36, Nick Fan wrote:
> Add a basic GPU node for mt8192.
> 
> Signed-off-by: Nick Fan <Nick.Fan@mediatek.com>
> ---
> This patch depends on Mediatek power and regulator support.
> 
> Listed as following.
> 
> [1]https://lore.kernel.org/patchwork/patch/1336293/
> [2]https://patchwork.kernel.org/project/linux-mediatek/list/?series=374013
> [3]https://lore.kernel.org/patchwork/patch/1356037/
> [4]https://patchwork.kernel.org/project/linux-mediatek/list/?series=405777
> [5]https://lore.kernel.org/patchwork/patch/1356175/
> [6]https://patchwork.kernel.org/project/linux-mediatek/patch/1605700894-32699-6-git-send-email-hsin-hsiung.wang@mediatek.com/
> [7]https://patchwork.kernel.org/project/linux-mediatek/patch/1608104827-7937-10-git-send-email-hsin-hsiung.wang@mediatek.com/
> ---
> ---
>   arch/arm64/boot/dts/mediatek/mt8192-evb.dts |   7 +
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi    | 176 ++++++++++++++++++++
>   2 files changed, 183 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
> index 6c1e2b3e8a60..48c0e240dd92 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
> @@ -5,6 +5,7 @@
>    */
>   /dts-v1/;
>   #include "mt8192.dtsi"
> +#include "mt6359.dtsi"
>   
>   / {
>   	model = "MediaTek MT8192 evaluation board";
> @@ -70,6 +71,12 @@
>   	};
>   };
>   
> +&gpu {
> +	supply-names = "mali","sram";
> +	mali-supply = <&mt6315_7_vbuck1>;
> +	sram-supply = <&mt6359_vsram_others_ldo_reg>;
> +};
> +
>   &uart0 {
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index d6a4ad242a33..de166ea750af 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -822,6 +822,182 @@
>   			#clock-cells = <1>;
>   		};
>   
> +		gpu: mali@13000000 {
> +			compatible = "mediatek,mt8192-mali", "arm,mali-valhall";
> +			reg = <0 0x13000000 0 0x4000>;
> +			interrupts =
> +				<GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH 0>,
> +				<GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH 0>,
> +				<GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH 0>,
> +				<GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH 0>,
> +				<GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names =
> +				"GPU",
> +				"MMU",
> +				"JOB",
> +				"EVENT",
> +				"PWR";

These interrupt names don't match the binding you've posted (GPU, MMU, 
JOB are upper case here, lower case in the binding). Also EVENT and PWR 
are not mentioned in the binding - should they be?

I know there are differences here between kbase's requirements and the 
existing upstream bindings (case specifically), but I haven't seen a 
binding containing EVENT and PWR before.

Steve

> +
> +			clocks =
> +				<&apmixedsys CLK_APMIXED_MFGPLL>,
> +				<&topckgen CLK_TOP_MFG_PLL_SEL>,
> +				<&topckgen CLK_TOP_MFG_REF_SEL>,
> +				<&mfgcfg CLK_MFG_BG3D>;
> +			clock-names =
> +				"clk_main_parent",
> +				"clk_mux",
> +				"clk_sub_parent",
> +				"subsys_mfg_cg";
> +
> +			power-domains =
> +				<&scpsys MT8192_POWER_DOMAIN_MFG2>,
> +				<&scpsys MT8192_POWER_DOMAIN_MFG3>,
> +				<&scpsys MT8192_POWER_DOMAIN_MFG4>,
> +				<&scpsys MT8192_POWER_DOMAIN_MFG5>,
> +				<&scpsys MT8192_POWER_DOMAIN_MFG6>;
> +			power-domain-names = "core0",
> +					     "core1",
> +					     "core2",
> +					     "core3",
> +					     "core4";
> +
> +			operating-points-v2 = <&gpu_opp_table>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		gpu_opp_table: opp_table0 {
> +			compatible = "operating-points-v2";
> +			opp-shared;
> +
> +			opp-358000000 {
> +				opp-hz = /bits/ 64 <358000000>;
> +				opp-hz-real = /bits/ 64 <358000000>,
> +					      /bits/ 64 <358000000>;
> +				opp-microvolt = <606250>,
> +						<750000>;
> +			};
> +
> +			opp-399000000 {
> +				opp-hz = /bits/ 64 <399000000>;
> +				opp-hz-real = /bits/ 64 <399000000>,
> +					      /bits/ 64 <399000000>;
> +				opp-microvolt = <618750>,
> +						<750000>;
> +			};
> +
> +			opp-440000000 {
> +				opp-hz = /bits/ 64 <440000000>;
> +				opp-hz-real = /bits/ 64 <440000000>,
> +					      /bits/ 64 <440000000>;
> +				opp-microvolt = <631250>,
> +						<750000>;
> +			};
> +
> +			opp-482000000 {
> +				opp-hz = /bits/ 64 <482000000>;
> +				opp-hz-real = /bits/ 64 <482000000>,
> +					      /bits/ 64 <482000000>;
> +				opp-microvolt = <643750>,
> +						<750000>;
> +			};
> +
> +			opp-523000000 {
> +				opp-hz = /bits/ 64 <523000000>;
> +				opp-hz-real = /bits/ 64 <523000000>,
> +					      /bits/ 64 <523000000>;
> +				opp-microvolt = <656250>,
> +						<750000>;
> +			};
> +
> +			opp-564000000 {
> +				opp-hz = /bits/ 64 <564000000>;
> +				opp-hz-real = /bits/ 64 <564000000>,
> +					      /bits/ 64 <564000000>;
> +				opp-microvolt = <668750>,
> +						<750000>;
> +			};
> +
> +			opp-605000000 {
> +				opp-hz = /bits/ 64 <605000000>;
> +				opp-hz-real = /bits/ 64 <605000000>,
> +					      /bits/ 64 <605000000>;
> +				opp-microvolt = <681250>,
> +						<750000>;
> +			};
> +
> +			opp-647000000 {
> +				opp-hz = /bits/ 64 <647000000>;
> +				opp-hz-real = /bits/ 64 <647000000>,
> +					      /bits/ 64 <647000000>;
> +				opp-microvolt = <693750>,
> +						<750000>;
> +			};
> +
> +			opp-688000000 {
> +				opp-hz = /bits/ 64 <688000000>;
> +				opp-hz-real = /bits/ 64 <688000000>,
> +					      /bits/ 64 <688000000>;
> +				opp-microvolt = <706250>,
> +						<750000>;
> +			};
> +
> +			opp-724000000 {
> +				opp-hz = /bits/ 64 <724000000>;
> +				opp-hz-real = /bits/ 64 <724000000>,
> +					      /bits/ 64 <724000000>;
> +				opp-microvolt = <725000>,
> +						<750000>;
> +			};
> +
> +			opp-760000000 {
> +				opp-hz = /bits/ 64 <760000000>;
> +				opp-hz-real = /bits/ 64 <760000000>,
> +					      /bits/ 64 <760000000>;
> +				opp-microvolt = <743750>,
> +						<750000>;
> +			};
> +
> +			opp-795000000 {
> +				opp-hz = /bits/ 64 <795000000>;
> +				opp-hz-real = /bits/ 64 <795000000>,
> +					      /bits/ 64 <795000000>;
> +				opp-microvolt = <762500>,
> +						<762500>;
> +			};
> +
> +			opp-831000000 {
> +				opp-hz = /bits/ 64 <831000000>;
> +				opp-hz-real = /bits/ 64 <831000000>,
> +					      /bits/ 64 <831000000>;
> +				opp-microvolt = <781250>,
> +						<781250>;
> +			};
> +
> +			opp-855000000 {
> +				opp-hz = /bits/ 64 <855000000>;
> +				opp-hz-real = /bits/ 64 <855000000>,
> +					      /bits/ 64 <855000000>;
> +				opp-microvolt = <793750>,
> +						<793750>;
> +			};
> +
> +			opp-902000000 {
> +				opp-hz = /bits/ 64 <902000000>;
> +				opp-hz-real = /bits/ 64 <902000000>,
> +					      /bits/ 64 <902000000>;
> +				opp-microvolt = <818750>,
> +						<818750>;
> +			};
> +
> +			opp-950000000 {
> +				opp-hz = /bits/ 64 <950000000>;
> +				opp-hz-real = /bits/ 64 <950000000>,
> +					      /bits/ 64 <950000000>;
> +				opp-microvolt = <843750>,
> +						<843750>;
> +			};
> +		};
> +
>   		mfgcfg: syscon@13fbf000 {
>   			compatible = "mediatek,mt8192-mfgcfg", "syscon";
>   			reg = <0 0x13fbf000 0 0x1000>;
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
