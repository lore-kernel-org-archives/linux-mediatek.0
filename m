Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75724C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 11:00:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EC8361055
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 11:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EC8361055
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/e367FgWhPuqV68pWFMF5cTy8gpVmUzenwPcVervC5E=; b=eiKh/A5MLNTkWsX4KdwKuJszn
	gIrAhBWp4HKITJvrwyJoTXiEbGA43ikCY40OaRMFxA/w8pqsJ7Q3CVyjxKu2Woyd4HheWr8kJDE4/
	UbOtWK19vT0KiWZqYhnIKAMqwOsSyGuWqlvmT4UaN7VW0pC4bLQumkPOp+4ZxmGF93i53RhteFViq
	3ZRB6aA7mgDrOxixVQEjRjPAbiHu5ePrJZNOOW45z/s0pmdNrc4NdvPV5JMEw1F0bslP3aOBXk+93
	u4AP7we4xFcf1yThsaeDto/OV6/4ob1Xqn4hF8CsB9E/bJ4ByJVqTNJJGDiMzb81soeeEY/qMx/80
	KsNJrd3dg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTjRT-002Fy0-9C; Tue, 06 Apr 2021 11:00:19 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTjRD-002FtX-Tc; Tue, 06 Apr 2021 11:00:05 +0000
Received: by mail-pj1-x102b.google.com with SMTP id s21so7722705pjq.1;
 Tue, 06 Apr 2021 04:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uAfHURTLSwkVlAhOdumUV/peFHBBPWxoa4MMAdiyslg=;
 b=WaZTnSHwiOhUV40kXOg1zlC6O1HgGEvjnzGK6Mk3vdlneD7+ZwALwOWfVjoBZ+J/cl
 sfAXoEcYofIJsEQAUqK66xm0qTSpBd9tjJabOhJo21NwaI8SfPvKaFDFtYblLk9r6Fmk
 GzohY/tcvY2K6/f7/GOeKkSn/f20zYhM10/NUwO92bPhBlNDZbCsExt8HTHip/mx3KAZ
 n6OM30M6mFH72tUcXXLHBSyF2w9jFvj3PnWr7P6AksR5tEyfErtToQWqUQGbzb81MUJw
 mo/kSXVtdNDzHHEc/XkGkrTnOQS5dOYpDfvksOpv5vFfjcJDJ+jw0oDKpLT9W2qxaUt/
 QtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uAfHURTLSwkVlAhOdumUV/peFHBBPWxoa4MMAdiyslg=;
 b=pkoo8KT3OziFzYLuhG3DqHv7V48JNNogFBSNtNiiG7Kpu7z4sYdAiTND+y29zBose3
 4OSkeGJ6Nylxkn5hjg0WDjZJTuvLz5oOmLn2jnX4z/GRWgF98xTFQlc1frdQ4EiCYyLj
 kLWUgzSPPB7NxKhYUGcFkoD69EMQI66A5r9tCUdhXsTngDuM+Dm9atjiQui7fZbKS27B
 u3+Yjhg4i28wlhUfsCV1duAunpEyQoO3CmVvFWu+27lZ2HYChbuWDIc8JfRCwF7icrya
 yTWc4V2joI4FHzgPRHvXXhEM8SVOSOBLpUjYBb4cvuq2EGtxDhQyEMWH7HS/lGD1DUVg
 dOUg==
X-Gm-Message-State: AOAM5303jwa+aQly0Wd9lXJL489dkKODhweOTOJntvvc6JugNMLqjFK1
 wox2caQXa/IV8bS6mHJDySE=
X-Google-Smtp-Source: ABdhPJyyrYIPTkV8Iim1aaWdrWukRhx3MarZcSFNSq21hNpifBFgLBmRi/z2FOk1ZAh2qBm8JMVW+w==
X-Received: by 2002:a17:902:aa8a:b029:e6:64bd:e29d with SMTP id
 d10-20020a170902aa8ab02900e664bde29dmr28523527plr.24.1617706802339; 
 Tue, 06 Apr 2021 04:00:02 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id v8sm18128204pfm.128.2021.04.06.03.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 04:00:01 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: mediatek: mt8167: add power domains
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: mkorpershoek@baylibre.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210405172836.2038526-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <7e8532e1-710c-3239-4384-cbb10348c4b4@gmail.com>
Date: Tue, 6 Apr 2021 12:59:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210405172836.2038526-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_120004_078591_D02D5F22 
X-CRM114-Status: GOOD (  17.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 05/04/2021 19:28, Fabien Parent wrote:
> Add support for the MT8167 power domains.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Applied to v5.12-next/dts64-2

Thanks

> ---
>  arch/arm64/boot/dts/mediatek/mt8167.dtsi | 68 ++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> index 1c5639ead622..156fbdad01fb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> @@ -7,6 +7,7 @@
>  
>  #include <dt-bindings/clock/mt8167-clk.h>
>  #include <dt-bindings/memory/mt8167-larb-port.h>
> +#include <dt-bindings/power/mt8167-power.h>
>  
>  #include "mt8167-pinfunc.h"
>  
> @@ -34,6 +35,73 @@ apmixedsys: apmixedsys@10018000 {
>  			#clock-cells = <1>;
>  		};
>  
> +		scpsys: syscon@10006000 {
> +			compatible = "syscon", "simple-mfd";
> +			reg = <0 0x10006000 0 0x1000>;
> +			#power-domain-cells = <1>;
> +
> +			spm: power-controller {
> +				compatible = "mediatek,mt8167-power-controller";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				#power-domain-cells = <1>;
> +
> +				/* power domains of the SoC */
> +				power-domain@MT8167_POWER_DOMAIN_MM {
> +					reg = <MT8167_POWER_DOMAIN_MM>;
> +					clocks = <&topckgen CLK_TOP_SMI_MM>;
> +					clock-names = "mm";
> +					#power-domain-cells = <0>;
> +					mediatek,infracfg = <&infracfg>;
> +				};
> +
> +				power-domain@MT8167_POWER_DOMAIN_VDEC {
> +					reg = <MT8167_POWER_DOMAIN_VDEC>;
> +					clocks = <&topckgen CLK_TOP_SMI_MM>,
> +						 <&topckgen CLK_TOP_RG_VDEC>;
> +					clock-names = "mm", "vdec";
> +					#power-domain-cells = <0>;
> +				};
> +
> +				power-domain@MT8167_POWER_DOMAIN_ISP {
> +					reg = <MT8167_POWER_DOMAIN_ISP>;
> +					clocks = <&topckgen CLK_TOP_SMI_MM>;
> +					clock-names = "mm";
> +					#power-domain-cells = <0>;
> +				};
> +
> +				power-domain@MT8167_POWER_DOMAIN_MFG_ASYNC {
> +					reg = <MT8167_POWER_DOMAIN_MFG_ASYNC>;
> +					clocks = <&topckgen CLK_TOP_RG_AXI_MFG>,
> +						 <&topckgen CLK_TOP_RG_SLOW_MFG>;
> +					clock-names = "axi_mfg", "mfg";
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					#power-domain-cells = <1>;
> +					mediatek,infracfg = <&infracfg>;
> +
> +					power-domain@MT8167_POWER_DOMAIN_MFG_2D {
> +						reg = <MT8167_POWER_DOMAIN_MFG_2D>;
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +						#power-domain-cells = <1>;
> +
> +						power-domain@MT8167_POWER_DOMAIN_MFG {
> +							reg = <MT8167_POWER_DOMAIN_MFG>;
> +							#power-domain-cells = <0>;
> +							mediatek,infracfg = <&infracfg>;
> +						};
> +					};
> +				};
> +
> +				power-domain@MT8167_POWER_DOMAIN_CONN {
> +					reg = <MT8167_POWER_DOMAIN_CONN>;
> +					#power-domain-cells = <0>;
> +					mediatek,infracfg = <&infracfg>;
> +				};
> +			};
> +		};
> +
>  		imgsys: syscon@15000000 {
>  			compatible = "mediatek,mt8167-imgsys", "syscon";
>  			reg = <0 0x15000000 0 0x1000>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
