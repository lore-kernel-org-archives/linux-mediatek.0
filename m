Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7197DC76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 10:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3J+3+QpiG0rZpOXhX+ZLI6+BIv55R5IPb8nvts5K8P4=; b=O2ZCnV2FBXGZvbFJDTwQBnOnYz
	qkOCl0/hvhArNt5D6Qmp9QKDbsq9lLQbL1BjhxqWiA0Dtp36SmfMjm+7le5aP9DKpE+8pxMH+KrVC
	p8CzPcTjghhSo90LKCLUeKQzAFgXEvFxOR4oPpcsrHVjVymZmVT4gCpQ4ajFCHW86fK7RECyEjK3V
	RNcrSHTg2X3vhi9Awofun3yFw6zr5UIRk1Q+jG4/D+8pcTvGJZpfejx6EbXXHNXmgT1twJqUGGrbo
	ZKQ6pJ/ChzxC9EEcDPYmTdcXndP+La8jXy7dRLKnsoBbg7esBj+RtC/USeIOBo7xplMVKTQxGQGJh
	/1+ibd/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piCOX-0070OB-1v;
	Fri, 31 Mar 2023 10:54:09 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piCOU-0070MG-1D
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 10:54:07 +0000
Received: by mail-wm1-x333.google.com with SMTP id v6-20020a05600c470600b003f034269c96so3339799wmo.4
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 03:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680260040;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3J+3+QpiG0rZpOXhX+ZLI6+BIv55R5IPb8nvts5K8P4=;
        b=DIb00x/wP2+VNwtse4AjeksMmJYcP/m3kkgofcXigSzJbtsa8dp4dAO21pZFD7qQUU
         15qFAwsU+bZkjUqKIh4QmamsHAqhlpNn8EnTq0aOcnxQO1dC3p5x2P5dIJFuEDxirDrj
         nMVEnclZDcNibiIh1V24XwNVjSIzq6Yifjq2o6lVNaJe4i+UADRgncqdhM2i9ivNJ+/I
         FjujLjbEGo8OMQSOQJBKWbQBTvzLG7tMkh5PsvQFvauSGA4Q3eMQSqDweHbsVM9M6cCW
         93vkolzYF1L0Tdxate2IKdw+vcQiHtO4wQvD85QFVhLTBSwP4OtIs/WJpny77DbsfMFU
         xHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680260040;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3J+3+QpiG0rZpOXhX+ZLI6+BIv55R5IPb8nvts5K8P4=;
        b=KCUlVL0TobEmlzKh0LElyRpaEKzxjlASdK5xfx67YtHPjTqCJcHn4hnDlqFc+ZU5jR
         8wil3tC3JjPkbNTw9bU04oZ4G1JMOARzqbXEX1PBKSiqF/wSErU/qanUaIwlIYtA+7L8
         eN9TRTxHtHTPj43wYt/LE3QqbG6bFK4EdmZrgx/nK+SEFVWsKF12+nzCRCQc7SKTbTda
         PhKHQ0i7+a/a1cyL+/rp1pD6v0cQ6Mtgd2/snRl2FSa8wB6Qg2JS+AZoc9zlBwjJ171h
         cskNpNQxKZ+bdmiy2uWtdjB5w++U2ByjNi1SdTvDh6l56uQto/a2+up8XQWvj32c61b8
         34bA==
X-Gm-Message-State: AO0yUKUOIHAZLSo56v0sYzc0exTw1KKjjKp6n8K3vSbGwe+bgVZt8fBL
	zzlmRAEqHn2LwTnaVgwgeyU=
X-Google-Smtp-Source: AK7set/6UKDxNUN/UAOYCRqLFd1+/gfqy+fFYklR/RihAmzcjc7b7iRIySxIy8jSOxMBFSTH9pG8Eg==
X-Received: by 2002:a1c:7911:0:b0:3ee:5754:f14b with SMTP id l17-20020a1c7911000000b003ee5754f14bmr20711685wme.3.1680260040071;
        Fri, 31 Mar 2023 03:54:00 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l24-20020a1c7918000000b003e203681b26sm2273068wme.29.2023.03.31.03.53.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 03:53:59 -0700 (PDT)
Message-ID: <5defb636-1f0f-6a6c-3c10-e8960b7d4399@gmail.com>
Date: Fri, 31 Mar 2023 12:53:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH net-next 04/10] arm64: dts: mt7986: move cpuboot in a
 dedicated node
Content-Language: en-US
To: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linux-mediatek@lists.infradead.org, nbd@nbd.name,
 john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo.bianconi@redhat.com, daniel@makrotopia.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
References: <cover.1679330630.git.lorenzo@kernel.org>
 <61e2445f79d8642e7749dac409e2b93b96667610.1679330630.git.lorenzo@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <61e2445f79d8642e7749dac409e2b93b96667610.1679330630.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_035406_437207_7744D8A9 
X-CRM114-Status: GOOD (  14.16  )
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



On 20/03/2023 17:57, Lorenzo Bianconi wrote:
> Since the cpuboot memory region is not part of the RAM SoC, move cpuboot
> in a deidicated syscon node.
> This patch helps to keep backward-compatibility with older version of
> uboot codebase where we have a limit of 8 reserved-memory dts child
> nodes.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index 51944690e790..668b6cfa6a3d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -113,12 +113,6 @@ wo_dlm1: wo-dlm@151f8000 {
>   			reg = <0 0x151f8000 0 0x2000>;
>   			no-map;
>   		};
> -
> -		wo_boot: wo-boot@15194000 {
> -			reg = <0 0x15194000 0 0x1000>;
> -			no-map;
> -		};
> -
>   	};
>   
>   	timer {
> @@ -461,10 +455,11 @@ wed0: wed@15010000 {
>   			interrupt-parent = <&gic>;
>   			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
>   			memory-region = <&wo_emi0>, <&wo_ilm0>, <&wo_dlm0>,
> -					<&wo_data>, <&wo_boot>;
> +					<&wo_data>;
>   			memory-region-names = "wo-emi", "wo-ilm", "wo-dlm",
> -					      "wo-data", "wo-boot";
> +					      "wo-data";
>   			mediatek,wo-ccif = <&wo_ccif0>;
> +			mediatek,wo-cpuboot = <&wo_cpuboot>;
>   		};
>   
>   		wed1: wed@15011000 {
> @@ -474,10 +469,11 @@ wed1: wed@15011000 {
>   			interrupt-parent = <&gic>;
>   			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
>   			memory-region = <&wo_emi1>, <&wo_ilm1>, <&wo_dlm1>,
> -					<&wo_data>, <&wo_boot>;
> +					<&wo_data>;
>   			memory-region-names = "wo-emi", "wo-ilm", "wo-dlm",
> -					      "wo-data", "wo-boot";
> +					      "wo-data";
>   			mediatek,wo-ccif = <&wo_ccif1>;
> +			mediatek,wo-cpuboot = <&wo_cpuboot>;
>   		};
>   
>   		wo_ccif0: syscon@151a5000 {
> @@ -494,6 +490,11 @@ wo_ccif1: syscon@151ad000 {
>   			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
>   		};
>   
> +		wo_cpuboot: syscon@15194000 {
> +			compatible = "mediatek,mt7986-wo-cpuboot", "syscon";
> +			reg = <0 0x15194000 0 0x1000>;
> +		};
> +
>   		eth: ethernet@15100000 {
>   			compatible = "mediatek,mt7986-eth";
>   			reg = <0 0x15100000 0 0x80000>;

