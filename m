Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D74C7EE29
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 15:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjV+qtzWnYDSApuIZdG6k60da0iyvrETpppNOJS7QhA=; b=Tdxj311uuUetbM
	1Lit7gFii6LeqA7a7YlHBikYwR/klgIKWpExNGjyoojdgpJIOtblyUAg4JpyaG4HsSV07a6WQPGrv
	4mfLxTSqT+oCkFOtlahtf5o9s1hnjSrFH6FceCT/Rnw68gvLw9g25LcCOsMF6zwzFO7R67cLbmcIH
	fzgumtd17azntaDdXkxb1VtmUVM87eBBcy3UWjeaQoXA6KQg58I7e6tXhjZk6X3qD0syxz6y5WtkA
	pzD+OkbIpemLwCDbjh6utirpBN/okfvTe26HBxLNaSZex9EHfH7aS4qy4I7hiySrMmbwWg/7E/vNf
	oLbvkGDmlHAgNXAIayTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fGN-00B1KY-1A;
	Mon, 29 May 2023 15:58:27 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fGK-00B1IP-2V;
	Mon, 29 May 2023 15:58:26 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f6094cb2d2so35464365e9.2;
        Mon, 29 May 2023 08:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685375903; x=1687967903;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kjV+qtzWnYDSApuIZdG6k60da0iyvrETpppNOJS7QhA=;
        b=leIrk3+YeN3O5gT0SiqrdKlm8hRwbjXVUPzrUbTvKtNHpXLi9kF1LnJ2T00hZkDFD9
         feQolja6wM71xhsg2GIE9+9UkEf50wO/KeNUyMOgsB8+5WOT/AblVKwm5+byas+hrW7R
         UYDkajejLeYdBxZtJ1Wmrkr+0GwMw4bZ7Fr+YE9YTQmRyXcWzuFMc8spSIVSfPtHBL2Z
         pDY+ugMtzo1vu8Bxy98yZOeNFAK3mLSOV6l0PkpWjhA0E3kWrcsjEuJLdo7gdfd5LV7y
         k1AxLpynxLdzftCdiq5ot65HBN1Cf6icKbZZtXVIZkewTIX72bXfIAHUEoptZsYHtG5f
         TbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685375903; x=1687967903;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kjV+qtzWnYDSApuIZdG6k60da0iyvrETpppNOJS7QhA=;
        b=AqaIWVp3ppBic19oT7njFkhFO4IYUsvjam/uX3qye0YZkI8gdu/QJxLYfDSfWGMyPL
         idJJncnDVPEGZSkexnIM69iDkXcQnhZ7B3QGLF0beVzCYJ2lq0B8y0guOoXEcrNqe0Um
         UsoUUU4/NMOzat+aka4vwJLbRNzvit/H4Y9s0B6EusLHQPdknvDNSlOpUg/rEbgMQYrk
         LU6JykvRdP5sSCxT6gLCVQVHfLNm+SZzAwCsze27NWthB2nci0qLA3yack1B9FTufJbT
         WWdUSfz5vhhPPWStdYPHeukZRdyQ0SjMkRaPr5/h8OzN8IVMPTkRuLDR2SoQUAHc4nci
         KEcg==
X-Gm-Message-State: AC+VfDz6yzRhdRlUe39Ji1VZvCl9zK1pulGOpn7KMLrDy8j5mbkdLZ7B
	SHsyigFNAK4Dn3ZyF/0tHXw=
X-Google-Smtp-Source: ACHHUZ5WAiz6002gv+g3zk45cDtlIbfdv4jSfPBjDN5+0vxgVtYnOKe1uuzF73n649/FcsDdWL8lMQ==
X-Received: by 2002:a7b:cc93:0:b0:3f6:9634:c8d6 with SMTP id p19-20020a7bcc93000000b003f69634c8d6mr8977486wma.18.1685375902833;
        Mon, 29 May 2023 08:58:22 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n5-20020adffe05000000b00307bc4e39e5sm318049wrr.117.2023.05.29.08.58.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 08:58:21 -0700 (PDT)
Message-ID: <bba52e30-47ef-540b-1683-44e19dc8aa8b@gmail.com>
Date: Mon, 29 May 2023 17:58:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 4/7] arm64: dts: mt7986: add PWM
Content-Language: en-US, ca-ES, es-ES
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230421132047.42166-1-linux@fw-web.de>
 <20230421132047.42166-5-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230421132047.42166-5-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_085824_810985_BF97442D 
X-CRM114-Status: GOOD (  15.15  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lars-Peter Clausen <lars@metafoo.de>, Lala Lin <lala.lin@mediatek.com>, linux-iio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, "Hui.Liu" <hui.liu@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonathan Cameron <jic23@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 21/04/2023 15:20, Frank Wunderlich wrote:
> From: Daniel Golle <daniel@makrotopia.org>
> 
> This adds pwm node to mt7986.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index a38965e23825..a409d5e845c2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -240,6 +240,20 @@ crypto: crypto@10320000 {
>   			status = "disabled";
>   		};
>   
> +		pwm: pwm@10048000 {
> +			compatible = "mediatek,mt7986-pwm";
> +			reg = <0 0x10048000 0 0x1000>;
> +			#clock-cells = <1>;
> +			#pwm-cells = <2>;
> +			interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&topckgen CLK_TOP_PWM_SEL>,
> +				 <&infracfg CLK_INFRA_PWM_STA>,
> +				 <&infracfg CLK_INFRA_PWM1_CK>,
> +				 <&infracfg CLK_INFRA_PWM2_CK>;
> +			clock-names = "top", "main", "pwm1", "pwm2";
> +			status = "disabled";
> +		};
> +
>   		uart0: serial@11002000 {
>   			compatible = "mediatek,mt7986-uart",
>   				     "mediatek,mt6577-uart";

