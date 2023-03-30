Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A267C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 07:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aI4j5ztkqLBhCp3bYO3/wwrImYQZqwwiL5XggiON6DI=; b=bsmmhDukeyP/1jHSQLxs8ZI0A5
	l7TEg8etqGxluy4WZH3s5kVIckoUdThokGNmLns0SzbwXiPpma65nz/MFFoTPrylH7HsFiMUu2jsE
	YDVFKNPw+splWJu22t4jnhRFi1oVYuOr8T+d1ydQgfrN+E2frt2tuS2/zmG07lx8qEp/I74hesjbF
	YUD+y9GsrCofZFFrw+MGHib9vhuaFUqTYlccY/Pdewv9I7K4Xw+WhgHSQRXR++R0/4YRuoROobxt7
	48MTF8Kj7vh2aFEpH3rSCjNsmjdU+kXYw2/yeKAi7H+ouWjXzFqpzfW7aEMdnFFCEhbQJaKN/MnRe
	6eaIu8ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phn4E-002yw0-1Q;
	Thu, 30 Mar 2023 07:51:30 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phn4A-002yuN-06;
	Thu, 30 Mar 2023 07:51:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id n19so10325190wms.0;
        Thu, 30 Mar 2023 00:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680162684;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aI4j5ztkqLBhCp3bYO3/wwrImYQZqwwiL5XggiON6DI=;
        b=mEc0GqzUQKjevr3PARRB3q0Wmax+H5Xd1Sg4sswXw/xYvmGN2x73w83ysTF8OI7xk2
         xVSB5y5eml9nWrB6Z+yOKA+LAHzd7rTWOUnTJ8JLDwuNGD/BVxA91wnSrzRinLDAio4+
         4OeO3gnB840BUev/0zbKy32yTU4N0bWcY68g9QJzD0LhAclcgEMBD1kxQAtCH3T7eBYg
         6yxcnwhATBrTY12O0Z4GVRfiF0Qjyd9xSX06VKL4G4UPh07yp1xfkC5mOmAzK+YmZ1zu
         BX1fwjdYX/Tykq+0TBnUnrN8LZ3uSBKUkQC4swENvRGFApbmMMk9Q2lZi5vQauVQRVbR
         9now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680162684;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aI4j5ztkqLBhCp3bYO3/wwrImYQZqwwiL5XggiON6DI=;
        b=BPIuE1PgOtSv49MT3wjcRDi6P5H4u854awl64lE9FpyrxLRizxDoqCpgEk78v0cml9
         AymM2Q791QQzZ3AAOBrsby6qSaGCM8YvFFg45OSA0Co1Y2XcnU0HdtR6JT9UDfd9Ctok
         vDExLc4nKUXlEPoFOL0poprt57F1r7FYL0MWHbXPLN9byetKolnmqO4RQPX9uOXullNi
         EJD6JdP/rqoXOmFSWLe7kfzpxg+qA+1/jfJNDFFY86FcH9DMwem32yOH0f5UyuGBTdDm
         t77rl4A/fgbkk2k23tfm8/WDlEmfpZE8fmgGJTpqFVS3HTxmaU3k3gCOm+oOxAbchOgO
         LzgA==
X-Gm-Message-State: AO0yUKVYLCiugWe1QM1t6KWMjG2zK7Yvw19AQ/9otxajcnX+hW1sXZMM
	1w+7FKslRNaVYO0EKFQG9YA=
X-Google-Smtp-Source: AK7set/5oT977f6935CqU17EtcAX7yZLLf7u9TeyOEdA/XQ7cFaUr57AMaAx3Of+niFlAoGadbwbfw==
X-Received: by 2002:a05:600c:b54:b0:3ee:36f:3485 with SMTP id k20-20020a05600c0b5400b003ee036f3485mr17231271wmr.8.1680162683929;
        Thu, 30 Mar 2023 00:51:23 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l10-20020a1ced0a000000b003ee1acdb036sm4895867wmh.17.2023.03.30.00.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 00:51:22 -0700 (PDT)
Message-ID: <71ce5c9c-7bf0-ab17-d1f2-4798d9073f01@gmail.com>
Date: Thu, 30 Mar 2023 09:51:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] arm64: dts: mt8195: add display node for vdosys1
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, singo.chang@mediatek.com
References: <20230323013730.1378-1-nancy.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230323013730.1378-1-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_005126_076105_6048723D 
X-CRM114-Status: GOOD (  18.91  )
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



On 23/03/2023 02:37, Nancy.Lin wrote:
> Add display node for vdosys1.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!

> ---
> 1. The dts patch is separated from the following patch:
>   - [v21,25/25] arm64: dts: mt8195: add display node for vdosys1
>     20220512053128.31415-26-nancy.lin@mediatek.com
> 
> 2. This patch is based on the following series:
>   - Add MediaTek SoC DRM (vdosys1) support for mt8195
>     20230321121859.2355-1-nancy.lin@mediatek.com
> ---
> Change in v2
>   - fix mutex node name
> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 223 +++++++++++++++++++++++
>   1 file changed, 223 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 8fc527570791..28881cc45040 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -24,6 +24,22 @@
>   	aliases {
>   		gce0 = &gce0;
>   		gce1 = &gce1;
> +		ethdr0 = &ethdr0;
> +		mutex0 = &mutex;
> +		mutex1 = &mutex1;
> +		merge1 = &merge1;
> +		merge2 = &merge2;
> +		merge3 = &merge3;
> +		merge4 = &merge4;
> +		merge5 = &merge5;
> +		vdo1-rdma0 = &vdo1_rdma0;
> +		vdo1-rdma1 = &vdo1_rdma1;
> +		vdo1-rdma2 = &vdo1_rdma2;
> +		vdo1-rdma3 = &vdo1_rdma3;
> +		vdo1-rdma4 = &vdo1_rdma4;
> +		vdo1-rdma5 = &vdo1_rdma5;
> +		vdo1-rdma6 = &vdo1_rdma6;
> +		vdo1-rdma7 = &vdo1_rdma7;
>   	};
>   
>   	cpus {
> @@ -2575,7 +2591,10 @@
>   		vdosys1: syscon@1c100000 {
>   			compatible = "mediatek,mt8195-vdosys1", "syscon";
>   			reg = <0 0x1c100000 0 0x1000>;
> +			mboxes = <&gce0 1 CMDQ_THR_PRIO_4>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x0000 0x1000>;
>   			#clock-cells = <1>;
> +			#reset-cells = <1>;
>   		};
>   
>   		smi_common_vdo: smi@1c01b000 {
> @@ -2604,6 +2623,17 @@
>   			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
>   		};
>   
> +		mutex1: mutex@1c101000 {
> +			compatible = "mediatek,mt8195-disp-mutex";
> +			reg = <0 0x1c101000 0 0x1000>;
> +			reg-names = "vdo1_mutex";
> +			interrupts = <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			clocks = <&vdosys1 CLK_VDO1_DISP_MUTEX>;
> +			clock-names = "vdo1_mutex";
> +			mediatek,gce-events = <CMDQ_EVENT_VDO1_STREAM_DONE_ENG_0>;
> +		};
> +
>   		larb2: larb@1c102000 {
>   			compatible = "mediatek,mt8195-smi-larb";
>   			reg = <0 0x1c102000 0 0x1000>;
> @@ -2628,6 +2658,151 @@
>   			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
>   		};
>   
> +		vdo1_rdma0: rdma@1c104000 {
> +			compatible = "mediatek,mt8195-vdo1-rdma";
> +			reg = <0 0x1c104000 0 0x1000>;
> +			interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x4000 0x1000>;
> +		};
> +
> +		vdo1_rdma1: rdma@1c105000 {
> +			compatible = "mediatek,mt8195-vdo1-rdma";
> +			reg = <0 0x1c105000 0 0x1000>;
> +			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA1>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA1>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x5000 0x1000>;
> +		};
> +
> +		vdo1_rdma2: rdma@1c106000 {
> +			compatible = "mediatek,mt8195-vdo1-rdma";
> +			reg = <0 0x1c106000 0 0x1000>;
> +			interrupts = <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA2>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA2>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x6000 0x1000>;
> +		};
> +
> +		vdo1_rdma3: rdma@1c107000 {
> +			compatible = "mediatek,mt8195-vdo1-rdma";
> +			reg = <0 0x1c107000 0 0x1000>;
> +			interrupts = <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA3>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA3>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x7000 0x1000>;
> +		};
> +
> +		vdo1_rdma4: rdma@1c108000 {
> +			compatible = "mediatek,mt8195-vdo1-rdma";
> +			reg = <0 0x1c108000 0 0x1000>;
> +			interrupts = <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA4>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA4>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x8000 0x1000>;
> +		};
> +
> +		vdo1_rdma5: rdma@1c109000 {
> +			compatible = "mediatek,mt8195-vdo1-rdma";
> +			reg = <0 0x1c109000 0 0x1000>;
> +			interrupts = <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA5>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA5>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x9000 0x1000>;
> +		};
> +
> +		vdo1_rdma6: rdma@1c10a000 {
> +			compatible = "mediatek,mt8195-vdo1-rdma";
> +			reg = <0 0x1c10a000 0 0x1000>;
> +			interrupts = <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA6>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA6>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xa000 0x1000>;
> +		};
> +
> +		vdo1_rdma7: rdma@1c10b000 {
> +			compatible = "mediatek,mt8195-vdo1-rdma";
> +			reg = <0 0x1c10b000 0 0x1000>;
> +			interrupts = <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA7>;
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA7>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xb000 0x1000>;
> +		};
> +
> +		merge1: vpp-merge@1c10c000 {
> +			compatible = "mediatek,mt8195-disp-merge";
> +			reg = <0 0x1c10c000 0 0x1000>;
> +			interrupts = <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE0>,
> +				 <&vdosys1 CLK_VDO1_MERGE0_DL_ASYNC>;
> +			clock-names = "merge","merge_async";
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xc000 0x1000>;
> +			mediatek,merge-mute = <1>;
> +			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE0_DL_ASYNC>;
> +		};
> +
> +		merge2: vpp-merge@1c10d000 {
> +			compatible = "mediatek,mt8195-disp-merge";
> +			reg = <0 0x1c10d000 0 0x1000>;
> +			interrupts = <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE1>,
> +				 <&vdosys1 CLK_VDO1_MERGE1_DL_ASYNC>;
> +			clock-names = "merge","merge_async";
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xd000 0x1000>;
> +			mediatek,merge-mute = <1>;
> +			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE1_DL_ASYNC>;
> +		};
> +
> +		merge3: vpp-merge@1c10e000 {
> +			compatible = "mediatek,mt8195-disp-merge";
> +			reg = <0 0x1c10e000 0 0x1000>;
> +			interrupts = <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE2>,
> +				 <&vdosys1 CLK_VDO1_MERGE2_DL_ASYNC>;
> +			clock-names = "merge","merge_async";
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xe000 0x1000>;
> +			mediatek,merge-mute = <1>;
> +			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE2_DL_ASYNC>;
> +		};
> +
> +		merge4: vpp-merge@1c10f000 {
> +			compatible = "mediatek,mt8195-disp-merge";
> +			reg = <0 0x1c10f000 0 0x1000>;
> +			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE3>,
> +				 <&vdosys1 CLK_VDO1_MERGE3_DL_ASYNC>;
> +			clock-names = "merge","merge_async";
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xf000 0x1000>;
> +			mediatek,merge-mute = <1>;
> +			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE3_DL_ASYNC>;
> +		};
> +
> +		merge5: vpp-merge@1c110000 {
> +			compatible = "mediatek,mt8195-disp-merge";
> +			reg = <0 0x1c110000 0 0x1000>;
> +			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE4>,
> +				 <&vdosys1 CLK_VDO1_MERGE4_DL_ASYNC>;
> +			clock-names = "merge","merge_async";
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x0000 0x1000>;
> +			mediatek,merge-fifo-en = <1>;
> +			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC>;
> +		};
> +
>   		dp_intf1: dp-intf@1c113000 {
>   			compatible = "mediatek,mt8195-dp-intf";
>   			reg = <0 0x1c113000 0 0x1000>;
> @@ -2640,6 +2815,54 @@
>   			status = "disabled";
>   		};
>   
> +		ethdr0: hdr-engine@1c114000 {
> +			compatible = "mediatek,mt8195-disp-ethdr";
> +			reg = <0 0x1c114000 0 0x1000>,
> +			      <0 0x1c115000 0 0x1000>,
> +			      <0 0x1c117000 0 0x1000>,
> +			      <0 0x1c119000 0 0x1000>,
> +			      <0 0x1c11a000 0 0x1000>,
> +			      <0 0x1c11b000 0 0x1000>,
> +			      <0 0x1c11c000 0 0x1000>;
> +			reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
> +				    "vdo_be", "adl_ds";
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x4000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0x5000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0x7000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0x9000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0xa000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0xb000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0xc000 0x1000>;
> +			clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
> +				 <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
> +				 <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
> +				 <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
> +				 <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
> +				 <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
> +				 <&vdosys1 CLK_VDO1_26M_SLOW>,
> +				 <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
> +				 <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
> +				 <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
> +				 <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
> +				 <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
> +				 <&topckgen CLK_TOP_ETHDR>;
> +			clock-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
> +				      "vdo_be", "adl_ds", "vdo_fe0_async", "vdo_fe1_async",
> +				      "gfx_fe0_async", "gfx_fe1_async","vdo_be_async",
> +				      "ethdr_top";
> +			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +			iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
> +				 <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
> +			interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /* disp mixer */
> +			resets = <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
> +				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
> +				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
> +				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
> +				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
> +			reset-names = "vdo_fe0_async", "vdo_fe1_async", "gfx_fe0_async",
> +				      "gfx_fe1_async", "vdo_be_async";
> +		};
> +
>   		edp_tx: edp-tx@1c500000 {
>   			compatible = "mediatek,mt8195-edp-tx";
>   			reg = <0 0x1c500000 0 0x8000>;

