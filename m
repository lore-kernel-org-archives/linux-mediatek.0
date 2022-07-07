Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B060C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zB98bE99TWpQmWntZaNoL4upEKygyq+84KXNA7Ndxg=; b=pmUg1aITN2zcZxiZ3GmxQ2/QIo
	oXZQ1wSMmFJZgX8hzi1kD/hJ01IOa1vWUC8N7KdBgkpAe+EuJzYCiUw2zR9tim92reKajjvN3o1wR
	z7xt3AE6/V+1qascDz/FMMNDLNHvdUWy37cI7SXClKyv4Oc6EVHS1yOWlouGLeqJ+l71qKQQngjdh
	TETZnlsBa2JIyUWR4GnUIY9eE2p2hB8TN9IBKwrhDqgQxfYSF8rOQHjJ02wzaHaZEoqDObM/V1Ft6
	FdwB1MhBkT6pkdGUuZS0P6deYG9qPL7lG2lfeatROc0zO8QBxjWpZWzhsRXQzYEzxOvnHysHr0tP/
	zlj/8BdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9SjY-00GYjQ-3q; Thu, 07 Jul 2022 14:44:00 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9SjJ-00GYaV-TD; Thu, 07 Jul 2022 14:43:47 +0000
Received: by mail-wr1-x42f.google.com with SMTP id bk26so11575359wrb.11;
        Thu, 07 Jul 2022 07:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7zB98bE99TWpQmWntZaNoL4upEKygyq+84KXNA7Ndxg=;
        b=lmEPdC/BP3rLuGsEFqwbhkQSrZXQSMy1hAHabWq/q5z6rud561BSLIXnt2SeGcmjXs
         3b1CRRK56UM0VRWQZld5EPJfrvTXMJBgjY12MZUG3n4Widm6figX5vxB6YtVFS31C8Fg
         pvVZfcpv1BNCOi3simlg1B7FHULlojFXG6IHoqeSiGuWaX69tW7sdBB62OZKO86GapXa
         TCAkK97Uyz+8OUfzo0LeVF/nt1XPItN6iEPdDjbmOi+8q/mkyB8QvgvjkvEeBPduSic9
         giLlhicb1fcw2IBVfdrGUGMHyZKSu6kVq0KKsSCjyNUfiKK0mlChvRrqkjd8MG6M0UaK
         T8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7zB98bE99TWpQmWntZaNoL4upEKygyq+84KXNA7Ndxg=;
        b=ofXaCFVRAaGTGaXe0azYPF3zNLmYLVgBdGfmdsvruXwHT00j8vnFHOq7YNvLGOatYn
         5sLceZ9vfvHEy/P2PpIuN4f+SE+ZuNU8OZJWoheJys52iLHsbJw+2/86L83yDc3hPrxk
         sqswwbYpFG7kQ91xegiSPSbbJRfMHX2dHDPg7tImRBizZVjAE/M9A9e+azr0gN+bevXa
         99vBMBMWBRzM/KnICDCcvJ7EramcWWN+t/Xf9sdHJ5VUKRzCElK6uFax/7zrz3SjLiDp
         LhjVsp/k7DmzZjVtO/oBMxx5rV/zLxcCA7As8Gs5vb7Kr7D1yfzou3A9wlQP07AeLqH8
         HGPw==
X-Gm-Message-State: AJIora9VQ3nfSaIu8oyB9jwZM4gGISMyhZhQREhV/VUiDiPozLVpFW4X
	/U7ant9bXXUZO9puaMuV7s8=
X-Google-Smtp-Source: AGRyM1vd3p8horCjkhzOZE22jq24Fc4VcQFDE+KNDBYFXZdgJnYoUBJxiMzjuTvWG3Nk+dC/p4eXaA==
X-Received: by 2002:a05:6000:104c:b0:21d:87bf:63a2 with SMTP id c12-20020a056000104c00b0021d87bf63a2mr2885660wrx.461.1657205022637;
        Thu, 07 Jul 2022 07:43:42 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n5-20020a1ca405000000b0039c587342d8sm24719301wme.3.2022.07.07.07.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 07:43:41 -0700 (PDT)
Message-ID: <24bf3c0f-7070-0bcd-2fae-9fe086d146b2@gmail.com>
Date: Thu, 7 Jul 2022 16:43:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] arm64: dts: mt8173: Fix nor_flash node
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, bin.zhang@mediatek.com,
 benliang.zhao@mediatek.com, linux-mediatek@lists.infradead.org
References: <20220630090157.29486-1-xiangsheng.hou@mediatek.com>
 <20220630090157.29486-2-xiangsheng.hou@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220630090157.29486-2-xiangsheng.hou@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_074345_975360_EC937D22 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 30/06/2022 11:01, Xiangsheng Hou wrote:
> Add axi clock since the driver change to DMA mode which need
> to enable axi clock. And change spi clock to 26MHz as default.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 40d7b47fc52e..e603170100af 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -790,9 +790,12 @@ thermal: thermal@1100b000 {
>   		nor_flash: spi@1100d000 {
>   			compatible = "mediatek,mt8173-nor";
>   			reg = <0 0x1100d000 0 0xe0>;
> +			assigned-clocks = <&topckgen CLK_TOP_SPI_SEL>;
> +			assigned-clock-parents = <&clk26m>;
>   			clocks = <&pericfg CLK_PERI_SPI>,
> -				 <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> -			clock-names = "spi", "sf";
> +				 <&topckgen CLK_TOP_SPINFI_IFR_SEL>,
> +				 <&pericfg CLK_PERI_NFI>;
> +			clock-names = "spi", "sf", "axi";
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   			status = "disabled";

