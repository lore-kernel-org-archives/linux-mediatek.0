Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0CBC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Mar 2022 15:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TPl2vU3NiCPMeGMYfPMnARNbYIF4EBlcIPSOZGg5ATo=; b=RWWAFZt/5OdQiN
	4GWMysDGuiYRE03atA3VXcJ4nhp1vQbAn55+XrbUYzR5w7YVAWK2PxTvUxCtQmLb4Zs5TgTGXaaRG
	IKSpqzxjsxrozYN/+CaP2H6TW52fQRS7gLyXnFAKevUlzgMIaBKZ4zKUfwHGNaNCau4tYacyvABt0
	ndzdCVDhI7hgfVpi20073JrW+uoKZb3ugg4Ht3a2jSOPR4Yx6iXPfZenL5qaC0vSy5l/5LSac7YpU
	FEb5fk/sZDwhP95dQNH2Y5ltVnyvKP+QYqTuE0kEH3ROTCe9QYzH1V385itU7DjRBePZce+oco90+
	xp54Ba3p3mjOt4pSjkgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXlnp-002Rew-0k; Fri, 25 Mar 2022 15:24:37 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXlnd-002RbD-Fw; Fri, 25 Mar 2022 15:24:26 +0000
Received: by mail-qv1-xf36.google.com with SMTP id f3so6439385qvz.10;
 Fri, 25 Mar 2022 08:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=enC4Cm+VFbMXJ8ZY/YefPUBsSjow27Oy9HPQpG1Rb48=;
 b=ACrIBionqSd/X6CKhpsW/3KWWBv+AQcW1cxaymUjdMARjWL8SmgP0GEnEsBCNL5RVC
 fMNUcitspAP6r5FV360aMEy5nPmT2FucG1cYyQcolMW/nCLo4gI/DnmzNQN8Exjfe3gg
 IPiP98sy+i44dBw6flJIZ8DaTJKgRYAEHSGFfuY0qNf2yatCdMgpSjhHbcJrvZYEFM5r
 WoTkoW0z4Q8YPwsv+7qOFhLDaus5BHshWUuMra/JzT2QWAsr7Ge4zlFOtIvXUxexue9P
 dhMsBIrznUZuk7MLHrK1wtBs7MpBCx1vN+URf3+muTPXIypmxlExuR3e/6V0q3EfrN/z
 4uMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=enC4Cm+VFbMXJ8ZY/YefPUBsSjow27Oy9HPQpG1Rb48=;
 b=R64g1C0le8GldSflaBWiFVjZ4o2fbM50a5IN6wvgjjsL6I75UiX8nDWw8/A4KW6duF
 OB7POGBq42aTpO1W7tpTL2zuc8a6ufcSOWhAd/T8vGPht+mPbCIqa2IDsbIGz5nkyLRM
 MLVcIZsec1jtkLj9xQwg7mj9ExNx/BI+NARrK9gXfiSBvt+uO5sRchHfNQ4iC+rsvXnm
 GpX1ItBwb/ZgWsiudS3uwRDO2Ja79TJGdMaeq01uLRTeVr8a1XoMhyoYsFuKzYuGJxEe
 okWyiTxykY+0/WbEjU63Ydbkj51MLmrSZigzBL7ijdCrgylgCVlbTLpxhvdokigYWo7P
 DKMg==
X-Gm-Message-State: AOAM530mgBxZuvV1sxWsnCqsVQYOvKJM3EhTJxFymOwc2LqarfFMXQOO
 2joZ7CxoOj1JxQEMp8ygyRPD2Fm+/1rtCw==
X-Google-Smtp-Source: ABdhPJwcFW7IuU2aDnnWZG2xVtc3QsgNnIq+THxh/PTZSZpAQDxVb1uGYe++SdRidNjxvcwGmijVMw==
X-Received: by 2002:a05:6214:20a5:b0:440:f648:997d with SMTP id
 5-20020a05621420a500b00440f648997dmr9582604qvd.130.1648221864117; 
 Fri, 25 Mar 2022 08:24:24 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 k1-20020ac85fc1000000b002e1c6420790sm5742466qta.40.2022.03.25.08.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Mar 2022 08:24:23 -0700 (PDT)
Message-ID: <019b1a59-7531-75cf-3b86-d2798ca9823a@gmail.com>
Date: Fri, 25 Mar 2022 16:24:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 17/22] arm64: dts: mt8192: Add dpi node
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
 <20220318144534.17996-18-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220318144534.17996-18-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220325_082425_580344_7F791792 
X-CRM114-Status: GOOD (  14.75  )
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
> Add dpi node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 71ad3adeed51..a77d405dd508 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1236,6 +1236,17 @@
>   			power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
>   		};
>   
> +		dpi0: dpi@14016000 {
> +			compatible = "mediatek,mt8192-dpi";
> +			reg = <0 0x14016000 0 0x1000>;
> +			interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&mmsys CLK_MM_DPI_DPI0>,
> +				 <&mmsys CLK_MM_DISP_DPI0>,
> +				 <&apmixedsys CLK_APMIXED_TVDPLL>;
> +			clock-names = "pixel", "engine", "pll";
> +			status = "disabled";

We are missing the output port node here.

Regards,
Matthias

> +		};
> +
>   		iommu0: m4u@1401d000 {
>   			compatible = "mediatek,mt8192-m4u";
>   			reg = <0 0x1401d000 0 0x1000>;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
