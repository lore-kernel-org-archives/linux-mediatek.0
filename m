Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6364C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 10:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJMx+4pK3OJ2ucAOzWeuUtcaBt5+6iN/qsxN/+AUhn4=; b=ESF8szmDdmsRbO
	PRAICHTZLt8huTTqHLrsNfF9eGzBU0XSnrctfsU0ThN9DSyUOTQx1DKj4R3jgMCmUOzVctRboa58G
	TcUQdO3BTBH3X7aS4ebIel175BcNeA9GwzAUULcCuGPF8A9HX/JX2DmG2q6ACIUjTyJ4oO6W/vSJ+
	tvI12bWr9KCOl9m5BskkBclyo/pxAOlx6ax0L9Qp0uHXrmnkA/OMc9tCRCF+H60GFfKh73/RQa2n7
	l1iV+wY+Z/9i0gNOGyoR5P8dQ73nZ3Wca7fCgkrT/Dc5p9r2/Eu2Q1FtZ4Uokk+Z0mkUF1Ym00t/v
	bRVKyJ+xTiq53c4EfRgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSGTn-00CWex-D2; Thu, 10 Mar 2022 10:57:11 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSGPs-00CUMv-KJ; Thu, 10 Mar 2022 10:53:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 70CF21F454C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646909587;
 bh=/gNWVadDfDGHqNyl7lJyNQZh6ChwEINYUFyIGatCL1M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AGV3VigDWxu0PfehGZ2acLaX+HM0VeKT3xlJoPRA6pxisHTKZUbrEmzSW9Jrzwfqk
 cVncWHKPaXKR/u9m9paG+QZxjyyCe67geLsp3EgoZ0dd06LCTfzKJC4d7yviicTnzE
 JthQlmrJNZBZjaXDV486nsWQeXnt20hA+EgwmbPEq2INHfNox7yS5uBDSR7XrfI028
 eWCBlBdYnyFZANqf8VzT+xBDf7lVW3TpUscXIDxEWSr/UI1CwFp5EjvPjxr/DWPizN
 VCLLsM4JmYf8XCMQucjmDVQbpHTpU6/N8wlClJEy33dotHvE10bnC2H9OwQ8EYjNL7
 ZXbABZYumsrxQ==
Message-ID: <b9404776-b5c7-7321-f352-1995dafa1565@collabora.com>
Date: Thu, 10 Mar 2022 11:53:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v14 22/22] arm64: dts: mt8195: add display node for vdosys1
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220310035515.16881-1-nancy.lin@mediatek.com>
 <20220310035515.16881-23-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220310035515.16881-23-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_025308_846406_5693FA66 
X-CRM114-Status: GOOD (  13.82  )
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

Il 10/03/22 04:55, Nancy.Lin ha scritto:
> Add display node for vdosys1.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 223 +++++++++++++++++++++++
>   1 file changed, 223 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index dbca699bba05..e650ec759235 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi


..snip..

> +
> +		ethdr0: ethdr@1c114000 {
> +			compatible = "mediatek,mt8195-disp-ethdr";
> +			reg = <0 0x1c114000 0 0x1000>,
> +			      <0 0x1c115000 0 0x1000>,
> +			      <0 0x1c117000 0 0x1000>,
> +			      <0 0x1c119000 0 0x1000>,
> +			      <0 0x1c11A000 0 0x1000>,
> +			      <0 0x1c11B000 0 0x1000>,
> +			      <0 0x1c11C000 0 0x1000>;

Hello Nancy,
looks like you partially forgot to use lower-case hex here...

0x1c11a000 0x1c11b000 0x1c11c000

> +			reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
> +				    "vdo_be", "adl_ds";
> +			mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x4000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0x5000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0x7000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0x9000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0xA000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0xB000 0x1000>,
> +						  <&gce0 SUBSYS_1c11XXXX 0xC000 0x1000>;

...and here too: 0xa000 0xb000 0xc000

Please fix that, after which, you can add my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

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
> +		};
> +
>   	};
>   };


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
