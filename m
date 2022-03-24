Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAF9C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 17:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRIPVnhWGHVW2pTZCHOlqPTa86IoMWHSkT3x9kG1FeQ=; b=lmvY86+17inQYz
	F+B1cTl4sfW8oUYbIB4qfSTgL/kZcTo7n8NdaJkkkWk65OEYmyKgSRZXNQI5ikYHpA4iF0/8zPjgj
	EwrQnJ3jY6tVR0TAF6g1MKGZAt5Gd8zIqMCooT1KqDepnfOqTxds4WDGCOmJXnmg301IHpQfA0qY+
	rtiitmijWkrQ4z/PGIuvdmA3RH3lPQcT/Vw95Nmey1MrLZ177sl+0iBOh88UEafkcZnmGL56HS2Ti
	TP9M/9vACYi1gEloGr+l0Ifi6ZYTSsT1qhumQNVEmmWlkIFK+mq0BvRS8fCMIs1rxUGZ7fRvclsTC
	dFh3/GjFBG3Rs8L515sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXRfQ-00HSs1-Mk; Thu, 24 Mar 2022 17:54:36 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXRel-00HSfa-BW; Thu, 24 Mar 2022 17:53:57 +0000
Received: by mail-wm1-x32b.google.com with SMTP id h16so3210293wmd.0;
 Thu, 24 Mar 2022 10:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TfVnUyN/hXuaNJUfYCszqrcV/Y41SovVpMRK9OnsasU=;
 b=IfV7WXPL3p6XHd58K5LzFWiySP6JIds58NsWE+OjifmBanhApG5VNoHIjRg3EiZ6oE
 q55n0/UVLf6fVQSeRo+NALJSfJCMDDf2fJKooTmVEYiOwQZNVxNl7WiQhH2ehRTmniD2
 KDb1fot0vbkdM/AH8tLvzyGI5hoGS2fOg9evQ3RbcQXRUdYog3vC88TdYOKRw1719H0A
 qWBde+evig3AheBAc7oNnF833Cx6d98Zp+j73DzmdXgGooo2GMf9RUUDKznvIpB4uz+O
 BsjLnIfjxhY71YXJYFtdGKhpXQu8k1oY7pIrHvs5zTPMrInUhcEveJLVOwSKQqm8qqO+
 eVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TfVnUyN/hXuaNJUfYCszqrcV/Y41SovVpMRK9OnsasU=;
 b=ipWF964mdPF8VQarYWCoJS/JENxmMPV9uLCKdEUvNb5U8NorNzIk0sEA9viAHotdOq
 s6Eu1OzjeYfjkw5WJkawG6MGl59PqD0VTDUp/kgv772wmh3fGjHrfDmsFwhpA/Lu+G7p
 qp7G2QRvA5hPkT15fuOxxzWDo3TKwrTr3Q1jPMfeSZDs7kpXSwPi6qSbyWzrgEEThhUv
 7W37KhPBopWfjAY0d9vzbUzkMUMeMwNAjYXBYmqZotCNjdGx7W6wkgIbswVIJraAVnIG
 Pe1k9Ll/4NspoExgJCXkrsqDDihrBJ488YEhGX+oXD/c1bOoYd76WRdV4gQbwO/rNeTM
 L/Lw==
X-Gm-Message-State: AOAM532+ix3XzQ7f6Uf/45oNROeXJfwce8S89dDx6lzsHX8ASdbvWxto
 QcgfZ2IRU5UiexXjGnALBGk=
X-Google-Smtp-Source: ABdhPJzFPTRXE56MSVLFfNGawg1yKq8+gZO3tliSVtZMhxzNCWb901NYb1XcroBFlWZ8yFguR6GipQ==
X-Received: by 2002:a05:600c:3b02:b0:38c:9148:70dc with SMTP id
 m2-20020a05600c3b0200b0038c914870dcmr5811612wms.104.1648144433529; 
 Thu, 24 Mar 2022 10:53:53 -0700 (PDT)
Received: from [192.168.0.32] ([137.101.87.65])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a7bcb54000000b0037fa63db8aasm6803998wmj.5.2022.03.24.10.53.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 10:53:53 -0700 (PDT)
Message-ID: <90324c6f-e3ef-5b18-8779-8a11ca67039b@gmail.com>
Date: Thu, 24 Mar 2022 18:53:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 12/22] arm64: dts: mt8192: Add mmc device nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-13-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220318144534.17996-13-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_105355_470036_90D9ED5B 
X-CRM114-Status: GOOD (  16.94  )
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
> Add mmc nodes for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 34 +++++++++++++++++++++---
>   1 file changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 6220d6962f58..2648f2847993 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1150,10 +1150,36 @@
>   			#clock-cells = <1>;
>   		};
>   
> -		msdc: clock-controller@11f60000 {
> -			compatible = "mediatek,mt8192-msdc";
> -			reg = <0 0x11f60000 0 0x1000>;
> -			#clock-cells = <1>;

We don't need the msdc_axi_wrap clock and that's why we delete the node, 
correct? In that case we could only disable the node, as DTS should describe the 
HW as it is. Please also add a line in the commit message explaining that.

Regards,
Matthias

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
>   		};
>   
>   		mfgcfg: clock-controller@13fbf000 {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
