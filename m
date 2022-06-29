Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E98C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 13:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q1g+p1MIZtpJB967AE+BY3MPfEruDh/Ni4FXuHLk3m8=; b=WcFAhCDkEAKfqCigRqPKARWRlk
	qAYU3Wf9or7ThR2VZqXDqarR2SrPLYm1JQSoS9YeTpqIvTW2/0T/WQg/n+TG3L8QZ/EWjYtqQ5Qt+
	xAXDSVqUV3OpmVHkfP50iKV3u73z24bWVI8aj0Mn2iIvkP0F46pxFJP8dKdQ4WdNHiVgqpYHlwMLH
	Bamv/jA5/7eZneF9IbrTS96KfVgB1u1bipT942zV1uN3Q7nW3YhENfnxAHG8R5l1FNwJ74+W0+rMR
	EiCBAoVxk3MrGVxfJYTiveehyLzSlLZ5CxKNLzITRigDhDx3bofPCVvMYTwMmkpfHAOV7kuaon1PH
	FoZirctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Xy9-00CHlk-MB; Wed, 29 Jun 2022 13:43:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Xxy-00CHge-L8; Wed, 29 Jun 2022 13:42:52 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3AA3C66018E6;
	Wed, 29 Jun 2022 14:42:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656510165;
	bh=yZfjVxY6+YXqMfBxFuUmxRr5cT0DDLUiTsXg6Wh0k2g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZjsqCrRocInx8/7JVJzW/PWjNnbzcMcStAQJbMxb34J/jG+0YN1VArupFBp05E5EP
	 6BrWQJ3/gecrZof+ZCYEXiLg8v2ZZhsvuQoddMAirjRawu+qfW2qOCmroViDaXb/GJ
	 LxxZs6hoCe3gKNVfQb9qeN2Xj/MFuOyqf4w9HGrWWeK//DDiOI9XCgEOy3fwrp7IhI
	 w4WVANEauc6olby+Ftsnim/FoMDj5lpbLax40AevKHdfOcQRhDV9tlUlb9FMltELcn
	 asGqEYBHtoyeKgLdZ4gHWnyGySIcxZdKKU0UuYx+DhVwQEIVpLdxzxxbkk/OwQM0Vt
	 Jlt95gJ5Bi5Fw==
Message-ID: <730f334e-c10d-8f8b-94e6-b66a56e03320@collabora.com>
Date: Wed, 29 Jun 2022 15:42:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/5] arm64: dts: mt8192: Add dsi node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20220629121358.19458-1-allen-kh.cheng@mediatek.com>
 <20220629121358.19458-5-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220629121358.19458-5-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_064250_872405_9A05002C 
X-CRM114-Status: GOOD (  14.38  )
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

Il 29/06/22 14:13, Allen-KH Cheng ha scritto:
> Add dsi ndoe for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 26d01544b4ea..72af328126de 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1334,6 +1334,24 @@
>   			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
>   		};
>   
> +		dsi0: dsi@14010000 {
> +			compatible = "mediatek,mt8183-dsi";
> +			reg = <0 0x14010000 0 0x1000>;
> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
> +			mediatek,syscon-dsi = <&mmsys 0x140>;
> +			clocks = <&mmsys CLK_MM_DSI0>,
> +				 <&mmsys CLK_MM_DSI_DSI0>,
> +				 <&mipi_tx0>;
> +			clock-names = "engine", "digital", "hs";
> +			phys = <&mipi_tx0>;
> +			phy-names = "dphy";

resets = <&mmsys MT8192_MMSYS_SW0_RST_B_DISP_DSI0>;

^^^ This is missing, please add it and resend :-)

> +			status = "disabled";
> +
> +			port {
> +				dsi_out: endpoint { };
> +			};
> +		};
> +
>   		ovl_2l2: ovl@14014000 {
>   			compatible = "mediatek,mt8192-disp-ovl-2l";
>   			reg = <0 0x14014000 0 0x1000>;



