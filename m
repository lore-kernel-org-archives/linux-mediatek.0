Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16F1C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 08:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KaMcBLsoVyqtu03uWUf8qFf/NtXFui3YcFfaHhghhcg=; b=huYWjuXUE/eeyv
	05BuKheHqKQcnPdMdbu3fIbjSQUn+rgNuLk0GK7tYgiuwezJZ1DkIdLVaFjloscmVcU0vQzvDrCN7
	vJlziywiiEk1r8uwlZVZ6x47VLGpXkBLQYZ1OuywHPf19+mrU5JfkTpdyqyiilpBEW2QmY6gyq5xr
	rFLxd6XQ35uM1eCnoPNTxMlToY4maxXc/7uAhOa4ZSjyiMvEh5td6AV/dH1UWf45aT93CLLk9uSrK
	j07ZZE0Vut9IcK7iYPCdNGsotq8GOZ6OnNQSicGJOFVirq5ftK6UmLYvkYQahs37YFTJRVXXmgXDu
	O6SnewMWw4ggTTBZblcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPqV-00EPGF-EE; Fri, 11 Nov 2022 08:57:07 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPqS-00EPAJ-0d; Fri, 11 Nov 2022 08:57:05 +0000
Received: by mail-wr1-x431.google.com with SMTP id cl5so5571013wrb.9;
        Fri, 11 Nov 2022 00:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KaMcBLsoVyqtu03uWUf8qFf/NtXFui3YcFfaHhghhcg=;
        b=dcUIec17fXShU0D22Ke0SSuSdFN+k+3iWRH8dz53i8WclFqju4JkG3PwJpCH+pnNrb
         IEvbY0q8xwL2Vys7UlnRa+zXwyy+63UIkmfmd26FAdfebzmAmc5bRO+6FKjwvBJaH/0u
         Xr3R2QNGt+JAQnqQajFyZU6jJOdDYf1Q+dty4/dlksaSHmm18+5Tks5yGne3Gc0z3KYY
         N+1V4sZsWV+V3TJ4M8LMG8UTDcr5JLk2gHdCmREptMv28bLEkustBhNA4qofg5wUwaKz
         VW+sgXmPESSIR9EwbeEpAC6aNinw8pcBx3j7Y88H+3DuZaoMXx0fKzJrMSiB+fg1S/ja
         zp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KaMcBLsoVyqtu03uWUf8qFf/NtXFui3YcFfaHhghhcg=;
        b=hdRhQGQx0geP4iZSntFwoKjGhLFCK1Dwp1ceJOm5z0YUpYz0wBHtwohvFoen+/tYVT
         cv2JQG5kB1d+0ZmKnC4VgE0IcxCxJqEDXctSFtA/qbpkNXE8ABA7HjDFX5BUzbkcpb/D
         7uyvN1nngTWwGdHj0x4c83sh0PLTDUbYCxpU/vbq3L/SV7vH6oZb21T7wwLaYgWeZdIq
         K5a0cpQ6Yl7dlQu0RZ3XJvUxo6HpkxrV3LWhGPWHwPxtpxxD4yvZjUwqqSzQFA2rcP6y
         xKutrfO0k1hTb/AsyFIIz47jYSz1nmunbJ+ESM6RbmkHNDoXgNvWgR2oC9eeqXPa/xtd
         Pdtw==
X-Gm-Message-State: ANoB5pm0EIV11M0rBDUQmO7mxg47qNMBzQYT4VeZXnMYZX9ZrvscYpRC
	xsc950iPU0rgmnv1d5Y5Qqk=
X-Google-Smtp-Source: AA0mqf4N7yuM8IdQE3lXSfvVQUBKrjMvD2Eg5wiPoWiejd00raH0z2svf3porYC6FthSfggv3GyuAg==
X-Received: by 2002:a5d:558b:0:b0:236:7670:68b5 with SMTP id i11-20020a5d558b000000b00236767068b5mr605179wrv.149.1668157020392;
        Fri, 11 Nov 2022 00:57:00 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id d8-20020a1c7308000000b003cf7928e731sm2223476wmb.9.2022.11.11.00.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 00:56:58 -0800 (PST)
Message-ID: <1925e515-1a0b-f1bf-0f99-47a45de10d06@gmail.com>
Date: Fri, 11 Nov 2022 09:56:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC v3 04/11] arm64: dts: mt7986: add crypto related device
 nodes
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221106085034.12582-1-linux@fw-web.de>
 <20221106085034.12582-5-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221106085034.12582-5-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_005704_106016_F86D7552 
X-CRM114-Status: GOOD (  15.00  )
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
Cc: devicetree@vger.kernel.org, Vic Wu <vic.wu@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 06/11/2022 09:50, Frank Wunderlich wrote:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> This patch adds crypto engine support for MT7986.
> 
> Signed-off-by: Vic Wu <vic.wu@mediatek.com>
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts |  4 ++++
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 15 +++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts |  4 ++++
>   3 files changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> index de5d771e5251..2b5d7ea31b4d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> @@ -43,6 +43,10 @@ reg_5v: regulator-5v {
>   	};
>   };
>   
> +&crypto {
> +	status = "okay";
> +};
> +
>   &eth {
>   	status = "okay";
>   
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index 58bbecfbab98..1c7a973c28ca 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -205,6 +205,21 @@ trng: rng@1020f000 {
>   			status = "disabled";
>   		};
>   
> +		crypto: crypto@10320000 {
> +			compatible = "inside-secure,safexcel-eip97";
> +			reg = <0 0x10320000 0 0x40000>;
> +			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "ring0", "ring1", "ring2", "ring3";
> +			clocks = <&infracfg CLK_INFRA_EIP97_CK>;
> +			clock-names = "infra_eip97_ck";
> +			assigned-clocks = <&topckgen CLK_TOP_EIP_B_SEL>;
> +			assigned-clock-parents = <&apmixedsys CLK_APMIXED_NET2PLL>;
> +			status = "disabled";
> +		};
> +
>   		uart0: serial@11002000 {
>   			compatible = "mediatek,mt7986-uart",
>   				     "mediatek,mt6577-uart";
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> index cd1763fa7f19..a98025112b5a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> @@ -43,6 +43,10 @@ reg_5v: regulator-5v {
>   	};
>   };
>   
> +&crypto {
> +	status = "okay";
> +};
> +
>   &eth {
>   	status = "okay";
>   

