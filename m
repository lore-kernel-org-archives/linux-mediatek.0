Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE36BC54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 14:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYXw+AOPwLHoksA7Df9XhHVSAEgssnhp/xg1dUt6Rjk=; b=O3PNyPTvQ/5JD2k9evnF+G1QML
	XYAjasx1WrVWCG+aXDRwvRSuAWpN9iojhmSlQ1LU6ISSeX8Qu8DPjT6PXupH2L+8uaz9tnncpEcJr
	Vsee/eJm+0CWJEhq/2nc6Md/n2aSaVMuGNEi8qC7+3QDJgVHmzGef1MDU2s31SXQIPxHbW+uX3l0Q
	97B1ZBcxE/gvsibT5aO0AKQPxrQedU1lVehwN2mbNH7WvOUN8o8THYaGrRidKCUL08w7K/b/taFWE
	OfBxhuRa9UShL7/yfxw7PhSP3qiSPMd/WfmYPzlYQgcTcI9gnrzF9RVuOq2cWH4lvKBS3yoKnH9DN
	yEKLETCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgpV-007Yd0-1I; Wed, 25 Jan 2023 14:32:49 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgpJ-007YZj-1t; Wed, 25 Jan 2023 14:32:38 +0000
Received: by mail-wr1-x434.google.com with SMTP id h16so17229705wrz.12;
        Wed, 25 Jan 2023 06:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AYXw+AOPwLHoksA7Df9XhHVSAEgssnhp/xg1dUt6Rjk=;
        b=GHWgJ+c0TSTRESaqEAwTU+5yoPgI+ytcXnZCX0h+e8p01oUDKdNXbNh2cupxWWKQaM
         cSW6mlKwZPksBJrJ8y8ABz8nd2c/APnXLkjsJ4zYFAALKKtHVCrcbUNOeUgj7gyESWfD
         tk8cpWYegvvNzJVSWWZBV8U1FnBFHkQU8Zoe6fDFfMmI1rj7VisvbLDXA/ngSw3jRrvC
         lhWACWx78W1sGREkjmCSV2b7oBoNrEOddTdpaHABIkJVi2vD2676z62WeV7g1r1R8mOW
         o8sJ83vAJSn/Is5bYmliqlsDNT4vYCicEDpJRcVz0psbTStiOMf5uf8XwgsMVRrol26H
         AGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AYXw+AOPwLHoksA7Df9XhHVSAEgssnhp/xg1dUt6Rjk=;
        b=Iz4yOrXUwv1QzpFOPAvyUX3Sf8Yjid8lHOs5HJLCXrO+nhn/lBV2GtBjQzbhn2EiUZ
         OlhCKne/L4sCrYRLNyut1WSnOwEqrxtGqwNzD9fMQaetl7E3U9Y2HONMqfbuFL3cyPRR
         H+iaSd5WaOyvxalGxE4bOiujosXUqBdfOrvU4sebPzDP8v6gfVHNuk1xYviuI45jTncA
         NrSZzaxi7+JNxCYwOZ/DSKXI50BrsuzxBAqSuPc7C2ks53Alg3Zl3H3U3HakQukOQ+Nj
         mlrlqQ0Z1VVbJr19/GSu63XzczsUrtp3H9U/+0s2lyGenb4gSzkWHH9m5KZr78DhF2mu
         aGuw==
X-Gm-Message-State: AFqh2kpygU5UEm1g0wP+N4+fNq68o9soEh/yNiXufmA/ED/kf7qc1Q/r
	iRypJ5iw+KD8t8oxQ6LaX/CK+GrAGUc=
X-Google-Smtp-Source: AMrXdXvf88ZGka2HcScPY6lOi/9ubPa5qOr1CJ68XaLkNAIMhzQF5oG/o5Vp75Duyi7BfDhyBItWzQ==
X-Received: by 2002:adf:eacd:0:b0:2bb:f4bf:e763 with SMTP id o13-20020adfeacd000000b002bbf4bfe763mr38736300wrn.51.1674657153146;
        Wed, 25 Jan 2023 06:32:33 -0800 (PST)
Received: from [192.168.1.135] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id o10-20020adfeaca000000b002b57bae7174sm4767577wrn.5.2023.01.25.06.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 06:32:32 -0800 (PST)
Message-ID: <b143d52a-0a03-9576-ac32-61591d347e54@gmail.com>
Date: Wed, 25 Jan 2023 15:32:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt7622: drop serial clock-names
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230123151634.370011-1-krzysztof.kozlowski@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230123151634.370011-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_063237_125179_B0D19F70 
X-CRM114-Status: GOOD (  14.73  )
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



On 23/01/2023 16:16, Krzysztof Kozlowski wrote:
> The serial node does not use clock-names:
> 
>    mt7622-bananapi-bpi-r64.dtb: serial@1100c000: Unevaluated properties are not allowed ('clock-names' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Both applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt7622.dtsi | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> index 146e18b5b1f4..62487a3c4db1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -526,7 +526,6 @@ btif: serial@1100c000 {
>   		reg = <0 0x1100c000 0 0x1000>;
>   		interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_LOW>;
>   		clocks = <&pericfg CLK_PERI_BTIF_PD>;
> -		clock-names = "main";
>   		reg-shift = <2>;
>   		reg-io-width = <4>;
>   		status = "disabled";

