Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B70C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 15:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+03acjpEQ5p7bsrDhNc23KzK+zgL9W7XGmhgITrc3mI=; b=JAL9JlVj0gOojw
	kOmpkBjJRJpN9zHCOCYRag1dd0kCw7PW3Vojva15ur118H6Y7PGl9E9jF/Dx6l3WayeTRRTiHSbWi
	aOo+i035GnSYkDHHnEDTPE6GJvE64k+vH5JPS50ShsrzGQId3QPhMsEjBjqUOMBN5m+R3U2G8He0X
	gF9D9Q0okzs7C6lDHCk9BaXSDKs0tJrr2t8N1Zr5+3mK6bJv9AjCRJqmThHSutSpzpIZgodXDs0oQ
	xAXWql8CAAP4rIKXwF5YlZnSpebtdvJ4T1FzWwPnTIB0QXrjZOojWVDCdQ3BOFN9WKnY0rV02lHwa
	I2jsPzn4nPbmCPFfQjTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXmAO-002Y3a-Eu; Fri, 25 Mar 2022 15:47:56 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXmA8-002Xy7-AP; Fri, 25 Mar 2022 15:47:41 +0000
Received: by mail-wr1-x433.google.com with SMTP id h4so11402373wrc.13;
 Fri, 25 Mar 2022 08:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=I0UNyg7SfBu7IB1Z/cqaLgfxg/zRvB23e6ickTd/N9Y=;
 b=JTtWFtj/0KLA/PTK/TZYRCNDaXJche2t4L3ZOXbW/ASrtI0gMPSIgluwBd7+xGt+2x
 uwYq4/keJ3jHhn3eS7NiBtlNNmcj0KTEl/7+GCRHRKYMCqEK/9lfLNbXhjGyxRtlnPGD
 Pv3eHAoIUewOFQHVYlo/P79AqwCh4rZwFQu7C6x5PyuwAqtluq6sVq0HJpOkJqtzR7l+
 sqbuHjfxnEa/6RlVWvfqUPq1reL0T+2MyGNcH7BEmixjJFpkZ3ts6prhiJvoDOWa+st9
 7rJ3/zxFXTS9XGET1yRuZrIwH1u8nNghL9KkJYaAEaSotDo/qYfhVunHhnURGQRw2c7p
 qNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=I0UNyg7SfBu7IB1Z/cqaLgfxg/zRvB23e6ickTd/N9Y=;
 b=8OjeURO4wTGQQAxdTFzmdyTj7Wt09QLdBB4eG6fpx18doaVlTs+c/uDh5FuOYcr5w1
 V+K30bZcLHem7V8+VsenoNxeWEp7xaFiHKTTbzQ9kY7tTc8CrsB+UKiiBceF9U1C38yw
 as6F4Q/oKKvh98LqcD5HiyEuBeT1EkplJQM5koHEool77Emf9ZZUtxu5ZSC5pbCdPeNh
 An4nJSf8inb8OlzznPwgdAvcE/qx6HIedoCno7oFEAca4yaZ9v1YTOlZcMWc7fKmFFaq
 3C6Chw6l9IfowCqUvJNLXUNbHvOj/e8FuG9QKOdCuWQ8BbxGMeG6yqugjIFF2bViXejx
 FeHw==
X-Gm-Message-State: AOAM532UNuDHiGHqMCFgFyoWKbdLgxD2DLTcg776LZ0Fwk+W2ArY0CWW
 LenuQugyP/Qb7KX49m7E7/7awcE18cYGwA==
X-Google-Smtp-Source: ABdhPJwlWs6hYo1HdTyCT7cOb+sHkPRysj8SXKISJJLWLFm5ARhQ9NWiMthV08TCaO5RdTX5ZL7tKg==
X-Received: by 2002:adf:f28d:0:b0:203:f161:55ac with SMTP id
 k13-20020adff28d000000b00203f16155acmr9718468wro.209.1648223258190; 
 Fri, 25 Mar 2022 08:47:38 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c35c400b0038cbd8c41e9sm7504769wmq.12.2022.03.25.08.47.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 08:47:37 -0700 (PDT)
Message-ID: <09b8c4d2-6cdd-b41b-4913-f9f2f7f4d7c7@gmail.com>
Date: Fri, 25 Mar 2022 16:47:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-19-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 18/22] arm64: dts: mt8192: Add display nodes
In-Reply-To: <20220318144534.17996-19-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_084740_403775_DB986714 
X-CRM114-Status: GOOD (  16.98  )
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



On 18/03/2022 15:45, Allen-KH Cheng wrote:
> Add display nodes for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 111 +++++++++++++++++++++++
>   1 file changed, 111 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index a77d405dd508..59183fb6c80b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1205,6 +1205,13 @@
>   			#clock-cells = <1>;
>   		};
>   
> +		mutex: mutex@14001000 {
> +			compatible = "mediatek,mt8192-disp-mutex";
> +			reg = <0 0x14001000 0 0x1000>;
> +			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&mmsys CLK_MM_DISP_MUTEX0>;

We are missing power-domains property.

> +		};
> +
>   		smi_common: smi@14002000 {
>   			compatible = "mediatek,mt8192-smi-common";
>   			reg = <0 0x14002000 0 0x1000>;
> @@ -1236,6 +1243,110 @@
>   			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
>   		};
>   
> +		ovl0: ovl@14005000 {
> +			compatible = "mediatek,mt8192-disp-ovl";
> +			reg = <0 0x14005000 0 0x1000>;
> +			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&mmsys CLK_MM_DISP_OVL0>;
> +			iommus = <&iommu0 M4U_PORT_L0_OVL_RDMA0>,
> +				 <&iommu0 M4U_PORT_L0_OVL_RDMA0_HDR>;
> +			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
> +		};
> +
> +		ovl_2l0: ovl@14006000 {
> +			compatible = "mediatek,mt8192-disp-ovl-2l";
> +			reg = <0 0x14006000 0 0x1000>;
> +			interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
> +			iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0>,
> +				 <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0_HDR>;

olv and ovl-2l binding mention that the node should be a sibling of mmsys, but 
this does not hold anymore, correct? Chun-Kuang can you help to fix the binding 
description?

> +		};
> +
> +		rdma0: rdma@14007000 {
> +			compatible = "mediatek,mt8192-disp-rdma";
> +			reg = <0 0x14007000 0 0x1000>;
> +			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
> +			iommus = <&iommu0 M4U_PORT_L0_DISP_RDMA0>;
> +			mediatek,larb = <&larb0>;
> +			mediatek,rdma-fifo-size = <5120>;
> +			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;

Same here, bindings says it should be a sibling of mmsys. Apart from that the 
maximal rdma-fifo-size isn't specified for all SoCs including mt1892.

> +		};
> +
> +		color0: color@14009000 {
> +			compatible = "mediatek,mt8192-disp-color",
> +				     "mediatek,mt8173-disp-color";
> +			reg = <0 0x14009000 0 0x1000>;
> +			interrupts = <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
> +		};

Same here, binding description needs fixed, please check for other bindings as 
well. The node here looks good.

> +
> +		ccorr0: ccorr@1400a000 {
> +			compatible = "mediatek,mt8192-disp-ccorr";
> +			reg = <0 0x1400a000 0 0x1000>;
> +			interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
> +		};
> +
> +		aal0: aal@1400b000 {
> +			compatible = "mediatek,mt8192-disp-aal",
> +				     "mediatek,mt8193-disp-aal";
> +			reg = <0 0x1400b000 0 0x1000>;
> +			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_AAL0>;
> +		};
> +
> +		gamma0: gamma@1400c000 {
> +			compatible = "mediatek,mt8192-disp-gamma",
> +				     "mediatek,mt8183-disp-gamma";
> +			reg = <0 0x1400c000 0 0x1000>;
> +			interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
> +		};
> +
> +		postmask0: postmask@1400d000 {
> +			compatible = "mediatek,mt8192-disp-postmask";
> +			reg = <0 0x1400d000 0 0x1000>;
> +			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_POSTMASK0>;
> +			iommus = <&iommu0 M4U_PORT_L0_DISP_POSTMASK0>;

No iommus mentioned in binding description.

Regards,
Matthias

> +		};
> +
> +		dither0: dither@1400e000 {
> +			compatible = "mediatek,mt8192-disp-dither",
> +				     "mediatek,mt8183-disp-dither";
> +			reg = <0 0x1400e000 0 0x1000>;
> +			interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
> +		};
> +
> +		ovl_2l2: ovl@14014000 {
> +			compatible = "mediatek,mt8192-disp-ovl-2l";
> +			reg = <0 0x14014000 0 0x1000>;
> +			interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_OVL2_2L>;
> +			iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2>,
> +				 <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2_HDR>;
> +		};
> +
> +		rdma4: rdma@14015000 {
> +			compatible = "mediatek,mt8192-disp-rdma";
> +			reg = <0 0x14015000 0 0x1000>;
> +			interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH 0>;
> +			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
> +			clocks = <&mmsys CLK_MM_DISP_RDMA4>;
> +			iommus = <&iommu0 M4U_PORT_L1_DISP_RDMA4>;
> +			mediatek,rdma-fifo-size = <2048>;
> +		};
> +
>   		dpi0: dpi@14016000 {
>   			compatible = "mediatek,mt8192-dpi";
>   			reg = <0 0x14016000 0 0x1000>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
