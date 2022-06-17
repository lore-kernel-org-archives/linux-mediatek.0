Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2D1C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 08:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1z5xMg7Bxc7h4S4BHi9usNXj+Js+8iNVIXmak/bgfM=; b=TPgPamJHqT961CfkXtkhd2XOCs
	abHVdlVfPYP6BoFZBevHndc7wRljWGAr0H1jRrPYMD4+bWkR4gKnJpSvyFgFgUTInYmtR2sVSr/gE
	qR4kJPU7yWeEXXjC/8xmbkOBXonsmZ72gGc/UAM/lwhzfoMyP+h36YitxIvUf3dtYRVKo0Lx/CzMZ
	PRWdO+dPqoQBMyfsYSHcaGWoujWTq8ZTxOw7PpgCf2GoopjSRLvYEEpxlsyFsgg2d2asgb9fha0Wv
	opdi6eu4Mjn+Eoq1/BUMtrNA/iML10e2lkc3WFGHXKj6R5ecnmfDGK+HpZ76LF5W9zs2M1Ig21PS3
	Iv7duWJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27o9-006X7X-P2; Fri, 17 Jun 2022 08:58:25 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o27lA-006VRc-0T; Fri, 17 Jun 2022 08:55:21 +0000
Received: by mail-wr1-x42f.google.com with SMTP id x17so4870155wrg.6;
        Fri, 17 Jun 2022 01:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=l1z5xMg7Bxc7h4S4BHi9usNXj+Js+8iNVIXmak/bgfM=;
        b=RKJ1YvdJYubxI1dhPY/OQUYcZNWvwsR3hSMnW3DhjtzNLWCCUqePpnEVUmin4CQfti
         DHgIXWxq/oSzN4P2yukrmn7h/76ydybVyQtkBMrIfEjY5Cuhv9r8vXhGkaNqmPp/cMgl
         lbprEc8QkvX0HO5e55gVYsEbhcvsmkUr3AsDXveZ7znPCDaGWyAwvdq7Pyle8L74Zeb7
         Btz/hBqxHorw71Si78l1S9BTHji1t+zhn5iRX2mquy1ZUYTZ+II2CTLlV9frl3YPEBR1
         p8ZNg70hEKNCAL8Rdz6a/uyzunLIhbUD/bx3vo/ily6rQDnOZKtvhVRVS7MYL4XBHPnY
         9Xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=l1z5xMg7Bxc7h4S4BHi9usNXj+Js+8iNVIXmak/bgfM=;
        b=CTGF471vnIeHHzd5sp3Ahv8fHKzneLmOME4m9sfkUuzsPZBMHv+2777QIHTgFattsZ
         uLSWdxyVZdAEzq6xpMq2IRvp6504RDz1aYwWIuSzLkbHiysiRPILD6u6q7BgX6/w0vgh
         YNSuK9RKYAXKesHgiTdWBqYlUUcMtQJVZd7HETWiJkl5Xqgql8g+l3vxAI4nZrhfCrsN
         oTkPPWDlesVmOrjwsDxq0xeg5R8IYmaEdUg15uTE84v+62C9SRyNNzPG5TDMYpZeBO96
         rrnkpJdUJowSOXbMIbs7CbE+XGMXNbqRp1u8cgyAvW/n7USGwwA/8jQP+BEJJQD88R3n
         tfdQ==
X-Gm-Message-State: AJIora/KExjfSUUeMAmntHK0w4rjRuGFNCCzJgNDi3sYfYdyAvY9SeVq
	7Y91lDaAFVa7vcsZaDt5U1U=
X-Google-Smtp-Source: AGRyM1sTqhhfw1OBLLlglJklCS+Ig6NucsZXKW2fUndS2h0EKP0isqvDTqr404xZJVJ0pDiCuLZL4w==
X-Received: by 2002:adf:f446:0:b0:21b:821f:a916 with SMTP id f6-20020adff446000000b0021b821fa916mr321884wrp.11.1655456117655;
        Fri, 17 Jun 2022 01:55:17 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id n125-20020a1c2783000000b003974cb37a94sm8397306wmn.22.2022.06.17.01.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 01:55:16 -0700 (PDT)
Message-ID: <a4d832b4-e850-5e48-39e0-ba3e61bea89f@gmail.com>
Date: Fri, 17 Jun 2022 10:55:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 1/2] arm64: dts: mediatek: mt8195: add efuse node and
 cells
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220617072344.21461-1-chunfeng.yun@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220617072344.21461-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_015520_104363_AAB7F8E7 
X-CRM114-Status: GOOD (  15.05  )
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

Series applied, thanks!

On 17/06/2022 09:23, Chunfeng Yun wrote:
> Add efuse node and cells used by t-phy to fix the bit shift issue
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v4: no changes
> 
> v3:
>    add reviewed-by and tested-by;
>    fix duplicated unit-address warning;
> 
> NOTE:
>    based on v5.18-next/dts64 of matthias.bgg's branch;
> 
> v2: no changes, just based on new mt8195.dtsi
> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 55 ++++++++++++++++++++++++
>   1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index b57e620c2c72..d5bc4cf5f4ac 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -691,6 +691,53 @@
>   			status = "disabled";
>   		};
>   
> +		efuse: efuse@11c10000 {
> +			compatible = "mediatek,mt8195-efuse", "mediatek,efuse";
> +			reg = <0 0x11c10000 0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			u3_tx_imp_p0: usb3-tx-imp@184,1 {
> +				reg = <0x184 0x1>;
> +				bits = <0 5>;
> +			};
> +			u3_rx_imp_p0: usb3-rx-imp@184,2 {
> +				reg = <0x184 0x2>;
> +				bits = <5 5>;
> +			};
> +			u3_intr_p0: usb3-intr@185 {
> +				reg = <0x185 0x1>;
> +				bits = <2 6>;
> +			};
> +			comb_tx_imp_p1: usb3-tx-imp@186,1 {
> +				reg = <0x186 0x1>;
> +				bits = <0 5>;
> +			};
> +			comb_rx_imp_p1: usb3-rx-imp@186,2 {
> +				reg = <0x186 0x2>;
> +				bits = <5 5>;
> +			};
> +			comb_intr_p1: usb3-intr@187 {
> +				reg = <0x187 0x1>;
> +				bits = <2 6>;
> +			};
> +			u2_intr_p0: usb2-intr-p0@188,1 {
> +				reg = <0x188 0x1>;
> +				bits = <0 5>;
> +			};
> +			u2_intr_p1: usb2-intr-p1@188,2 {
> +				reg = <0x188 0x2>;
> +				bits = <5 5>;
> +			};
> +			u2_intr_p2: usb2-intr-p2@189,1 {
> +				reg = <0x189 0x1>;
> +				bits = <2 5>;
> +			};
> +			u2_intr_p3: usb2-intr-p3@189,2 {
> +				reg = <0x189 0x2>;
> +				bits = <7 5>;
> +			};
> +		};
> +
>   		u3phy2: t-phy@11c40000 {
>   			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v3";
>   			#address-cells = <1>;
> @@ -873,6 +920,10 @@
>   				clocks = <&apmixedsys CLK_APMIXED_PLL_SSUSB26M>,
>   					 <&topckgen CLK_TOP_SSUSB_PHY_P1_REF>;
>   				clock-names = "ref", "da_ref";
> +				nvmem-cells = <&comb_intr_p1>,
> +					      <&comb_rx_imp_p1>,
> +					      <&comb_tx_imp_p1>;
> +				nvmem-cell-names = "intr", "rx_imp", "tx_imp";
>   				#phy-cells = <1>;
>   			};
>   		};
> @@ -897,6 +948,10 @@
>   				clocks = <&apmixedsys CLK_APMIXED_PLL_SSUSB26M>,
>   					 <&topckgen CLK_TOP_SSUSB_PHY_REF>;
>   				clock-names = "ref", "da_ref";
> +				nvmem-cells = <&u3_intr_p0>,
> +					      <&u3_rx_imp_p0>,
> +					      <&u3_tx_imp_p0>;
> +				nvmem-cell-names = "intr", "rx_imp", "tx_imp";
>   				#phy-cells = <1>;
>   			};
>   		};

