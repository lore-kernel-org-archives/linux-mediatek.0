Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4310FC00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PcC7y3FS+HA6LTR16Kak4eGsTRhnH7QRvBCszT9C5U=; b=BVO2PYM8PTAcbgMSHpeVEw+5l0
	HzsNB7BlHiKgw6ItO3lJGns3ZUuPnRDNsehvsWYCbf1NUAmfWHk1rDd8yNpUQHNvAMCZRX9lhMooL
	dYlFbNrIXjQnsMy0F+7kSax9NqX8S94YXYJRwR4Qfc1UxE75KnHj3k4TCKSVqd2C9jke5Nitmhr+9
	Qrj5T02u96PXZRAkjliNgYH8r42TigRTBaJnA/l4DId4RgIdPDoP490G2MUP8xCzr7cZd0D39plqO
	H511ikraCrFsVVjYI9msos4nNomLxmREKc+PQ0fxd41yizAM3eF3y7i/c7gjO9Tzq0w5kupovWXXj
	3oay7mtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXis-005xCp-6n; Thu, 19 Jan 2023 16:25:07 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXhc-005wYw-RP; Thu, 19 Jan 2023 16:23:51 +0000
Received: by mail-wr1-x42a.google.com with SMTP id e3so2358540wru.13;
        Thu, 19 Jan 2023 08:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+PcC7y3FS+HA6LTR16Kak4eGsTRhnH7QRvBCszT9C5U=;
        b=OWsZGZ11elP4SzbvFuPicIoLtQvQgdqjQHT0EUCq9YSbAvdwb9nvSo63kZNE5WYSMb
         m3bYZzWWZkK2BFpF7AI1la1QPxmBW5+32EJ6oMNgNGbtLQuhMW2srvFFT4yNQKmcCT+a
         1WKMbYW2N3hrUWZfoPBhHCUW/l0AHVY5YVa28nF+GHGTFYlx286xt3wzPq6YYUtC0cM/
         thGP4Mgb8c19/HobPxN1HeBnO3RDu+oLrGGCnPhlkj2DXA9O2wa49uO8sf/45240GSof
         YBXM7bXnJndVD1ceuTWCkL1u5eAbfyMuhx2ZmZwlxs9cfmodBlu1zkyJnGZU1iqX3jmw
         ctqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PcC7y3FS+HA6LTR16Kak4eGsTRhnH7QRvBCszT9C5U=;
        b=UEczleiXn7+p+nJThuSu201nPyvhaQWB8MbZuAln7iAkg58ojrHt0MpR8ikqvTAvW+
         waamLqtUr1abCW5bpFcbunrxGnRrgNnsivfV9x8ScaS11PUXOK4AqP+Dxr5+PORY6pwM
         TGn64DK7s31NY7+n7naR3fqDjCUdM+P5tKbwj6cnymiiqepCt8iU4U3N4xy0t06+kE2L
         Of9tQDR4/InuICH8yeWMeQXI4G87HMeBVyCWY364bTlcIGtj8NXQtkC76ZkAlvM34aDN
         zGqR21414g7mF4J8h9igCJAsmtHclFy9e3NYKp8NKWsB/MVt0HnHnCAFct0Cde1+IgNq
         5AvA==
X-Gm-Message-State: AFqh2kozJ/R+lDlz+43Epzat4vsEG8FEgtmbxHutHNC0iYW4m1Fq1/O6
	3zrpaqf99s8M+IJ/Pbay3YM=
X-Google-Smtp-Source: AMrXdXtIzYjj/CzYqkow+WPiYOG8ccH53zjNKZrQ2FyPIsv67Z3n3uwh+vn0p8V5ULjrCdWWyoakDg==
X-Received: by 2002:adf:f18e:0:b0:2bd:e8bd:79ce with SMTP id h14-20020adff18e000000b002bde8bd79cemr9683654wro.20.1674145424906;
        Thu, 19 Jan 2023 08:23:44 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id b10-20020adfe64a000000b00287da7ee033sm34552910wrn.46.2023.01.19.08.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 08:23:44 -0800 (PST)
Message-ID: <b9f20fce-9091-27ab-11c3-0670835ce0e7@gmail.com>
Date: Thu, 19 Jan 2023 17:23:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] dt-bindings: dma: drop unneeded quotes
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Olivier Dautricourt <olivierdautricourt@gmail.com>, Stefan Roese
 <sr@denx.de>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Green Wan <green.wan@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?77+9ZXI=?=
 <povik+lin@cutebit.org>, Peng Fan <peng.fan@nxp.com>,
 Paul Cercueil <paul@crapouillou.net>, - <chuanhua.lei@intel.com>,
 Long Cheng <long.cheng@mediatek.com>, Rajesh Gumasta <rgumasta@nvidia.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Palmer Debbelt
 <palmer@sifive.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org
References: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230118180144.364756-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_082349_124971_6707D798 
X-CRM114-Status: GOOD (  12.41  )
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



On 18/01/2023 19:01, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../devicetree/bindings/dma/allwinner,sun4i-a10-dma.yaml        | 2 +-
>   .../devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml       | 2 +-
>   .../devicetree/bindings/dma/allwinner,sun6i-a31-dma.yaml        | 2 +-
>   Documentation/devicetree/bindings/dma/altr,msgdma.yaml          | 2 +-
>   Documentation/devicetree/bindings/dma/apple,admac.yaml          | 2 +-
>   Documentation/devicetree/bindings/dma/arm-pl08x.yaml            | 2 +-
>   Documentation/devicetree/bindings/dma/dma-controller.yaml       | 2 +-
>   Documentation/devicetree/bindings/dma/dma-router.yaml           | 2 +-
>   Documentation/devicetree/bindings/dma/fsl,edma.yaml             | 2 +-
>   Documentation/devicetree/bindings/dma/ingenic,dma.yaml          | 2 +-
>   Documentation/devicetree/bindings/dma/intel,ldma.yaml           | 2 +-
>   Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml    | 2 +-

[...]

> diff --git a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
> index 9ab4d81ead35..dab468a88942 100644
> --- a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
> @@ -14,7 +14,7 @@ description: |
>     for the UART peripheral bus.
>   
>   allOf:
> -  - $ref: "dma-controller.yaml#"
> +  - $ref: dma-controller.yaml#
>   
>   properties:
>     compatible:

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

