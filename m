Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A037C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 12:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mi+BuuGKy8rKYD6M3PLz1W9srqwGM4QMCHMldOwciKg=; b=ABHrxEfqucxD2h
	WvFFuiqwFeCPSGyCT97RAAFAYEXeLoQwMApxVVqlxuLuXjRglmAzDWVO980qJb3LRth80DuTMGhWm
	8hp9poum5yv1GEUvtdo362Hqpa2eAZgKIATw0t3Hw4CH+TrihqGSlCNLE6NhZTD6eCOUi4cPuvuhw
	3kUQ71xbseejP2WQAgEaToN/wxgWiMcJcu1/Oddya+CPn/oRsQDc+BOMrL7c/vh1WlUcW57weUvWj
	onfD1impZkcUPplxSeE49dBKTThzIG+59XJwObuavvJtd4kBkCSkPDAK75o4Ml8uLIrjcEDjZQ71o
	Zng8qnassXEUR7jHL8HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZtVV-0027kB-O5; Thu, 31 Mar 2022 12:02:29 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZtVI-0027ed-FO; Thu, 31 Mar 2022 12:02:17 +0000
Received: by mail-wr1-x430.google.com with SMTP id i4so14642843wrb.5;
 Thu, 31 Mar 2022 05:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=A4Zjm/xBLp9YxmFT/DNtR5IxUCWdPvGVNi6dsCwjlvs=;
 b=hs1mRpoxuE6ZpUUnB6ufTgWOqqKRMlwZk7UDkYvnKGNfNaFa5kiy2kivZyhLrqXN+M
 iLOmA6pRfoJPDsUf+L9H95Xeuta15xztQkd5PxNID2AvHYeyyMv1+wwW3Ki/AdU6rWcQ
 orKBN+Jv70ZNVgEoCHvXATcpAbHpggbrtJmj4ZxX8Uk8YqJ76WlPyDodhGFbgTsFMUf+
 ozqSH5sd2hMaFTclgBsW8y9A4uYFYLZ9qSM0do8pJlrCcowHx1LDo1925nd/cFiTuWci
 x+pIBkfqWBSnFCPCAZCoT3ZYwCOhLWBoo3Xe/de4TTJUj/gFHDuXfWK9B9qn+53yL7FZ
 Nt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A4Zjm/xBLp9YxmFT/DNtR5IxUCWdPvGVNi6dsCwjlvs=;
 b=kPOm84zBe0lM3gZl/MCTQwAZqBcDDc652eqpGf+H2Oy2WVVHFMG5SbZvPV2LMNmTsQ
 BlkKyz1Ue8NF25+dTvsFUYSclPGXQYeutMZOGOSDq72ME0EDfJbhxRrnpsaUNOJv3MAH
 QE6IPKp2nP1HSQmoYYWrKrYQ44/ZVuvA5YIjZIBXeytj+OGjse1POVnJKehaZL3Nfcoe
 8cI4pUxiMU56fQZ6wOl97bG+3KeIpXjA2drL+0jMwXC/w4ouScpH8EDGCmUVsI67kdke
 1SI5uUk5Xpk1HPUMOpiFO05RkVLHk9yo4If3T4gwjmaD+8lqJvpktQxBemt+CQgKoJ5J
 q7Ww==
X-Gm-Message-State: AOAM533+Vcze/zGJYRMvBvlVvZ367Uyqirj2R34ThaO9oQKrpIRGJkMa
 Y5zcaBPz6RhZR0c7BKgcnIg=
X-Google-Smtp-Source: ABdhPJy1pwWwEsM0zqdfSBXpyPAD0/x0pcEIXNpZNqEniEbmMNwfmK6IiIHr/hlxLOMYZdRzHxD8rw==
X-Received: by 2002:a05:6000:1:b0:205:e7cd:2a5 with SMTP id
 h1-20020a056000000100b00205e7cd02a5mr2498122wrx.485.1648728132726; 
 Thu, 31 Mar 2022 05:02:12 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1cf608000000b0038c8fdc93d6sm6881237wmc.28.2022.03.31.05.02.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 05:02:12 -0700 (PDT)
Message-ID: <4cd1c5fa-0982-0355-d5b6-7025b82174a4@gmail.com>
Date: Thu, 31 Mar 2022 14:02:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 2/4] arm64: dts: mt8192: Add mmc device nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220330133816.30806-1-allen-kh.cheng@mediatek.com>
 <20220330133816.30806-3-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220330133816.30806-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_050216_564954_354D1378 
X-CRM114-Status: GOOD (  15.65  )
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



On 30/03/2022 15:38, Allen-KH Cheng wrote:
> Add mmc nodes for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

You forgot to disable the msdc clock node, which I understood we agreed on in in 
v4. I would consider this change as an substantial one, so in this case please 
delete the reviewed-by tags.

Regards,
Matthias

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 32 ++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 69e8d1934d53..c1057878e2c6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -991,6 +991,38 @@
>   			#clock-cells = <1>;
>   		};
>   
> +		mmc0: mmc@11f60000 {
> +			compatible = "mediatek,mt8192-mmc", "mediatek,mt8183-mmc";
> +			reg = <0 0x11f60000 0 0x1000>, <0 0x11f50000 0 0x1000>;
> +			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&topckgen CLK_TOP_MSDC50_0_SEL>,
> +				 <&msdc_top CLK_MSDC_TOP_H_MST_0P>,
> +				 <&msdc_top CLK_MSDC_TOP_SRC_0P>,
> +				 <&msdc_top CLK_MSDC_TOP_P_CFG>,
> +				 <&msdc_top CLK_MSDC_TOP_P_MSDC0>,
> +				 <&msdc_top CLK_MSDC_TOP_AXI>,
> +				 <&msdc_top CLK_MSDC_TOP_AHB2AXI_BRG_AXI>;
> +			clock-names = "source", "hclk", "source_cg", "sys_cg",
> +				      "pclk_cg", "axi_cg", "ahb_cg";
> +			status = "disabled";
> +		};
> +
> +		mmc1: mmc@11f70000 {
> +			compatible = "mediatek,mt8192-mmc", "mediatek,mt8183-mmc";
> +			reg = <0 0x11f70000 0 0x1000>, <0 0x11c70000 0 0x1000>;
> +			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&topckgen CLK_TOP_MSDC30_1_SEL>,
> +				 <&msdc_top CLK_MSDC_TOP_H_MST_1P>,
> +				 <&msdc_top CLK_MSDC_TOP_SRC_1P>,
> +				 <&msdc_top CLK_MSDC_TOP_P_CFG>,
> +				 <&msdc_top CLK_MSDC_TOP_P_MSDC1>,
> +				 <&msdc_top CLK_MSDC_TOP_AXI>,
> +				 <&msdc_top CLK_MSDC_TOP_AHB2AXI_BRG_AXI>;
> +			clock-names = "source", "hclk", "source_cg", "sys_cg",
> +				      "pclk_cg", "axi_cg", "ahb_cg";
> +			status = "disabled";
> +		};
> +
>   		mfgcfg: clock-controller@13fbf000 {
>   			compatible = "mediatek,mt8192-mfgcfg";
>   			reg = <0 0x13fbf000 0 0x1000>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
