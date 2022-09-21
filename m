Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B59C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 08:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2MCRZwnAPTEqYODMkj3+PTJcU+ncclCIozA5x11uMM=; b=stqrm0SBMWp7m+S9yaM6NiQjIZ
	3w7yhy7a6XjrA8dioVIjHmBuP/EA5irPg16bHUB9hx4HYKCuZ4Rt7dz2c7Cg9g9ZMrTUcCjdDuqAt
	o50b9z7FMLuZW+xwEWQxceMv7a9sEoNgWVf28Pc1awhsMhLb+0TJxCX5vk8+bBj4FoCetpY7wWlIu
	bmxH190T47uQjEFW9oW/Jyeg6pdGpu4yCBkTfb2Z5shPMU/q78EcyKFRW9o6Ib3R7HSOEl33G5kAH
	nnQPIj5GJxt3+RHAxptYBSpizxj98QUs23dGter/kHGFEA6uRNjad3t98HXQ7wE4rQO06Ed/OhBM3
	8grraewg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavEA-00A13T-TY; Wed, 21 Sep 2022 08:37:06 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oav1c-009vTG-Kg
	for linux-mediatek@lists.infradead.org; Wed, 21 Sep 2022 08:24:10 +0000
Received: by mail-lj1-x236.google.com with SMTP id p5so5994416ljc.13
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Sep 2022 01:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=z2MCRZwnAPTEqYODMkj3+PTJcU+ncclCIozA5x11uMM=;
        b=BB35Aku2zGsCqnMGpK7NKQd1UICT5YpQwu7ZrKCddceP/5xfHPurL1Q69YMIhyIPV3
         21F4kSBCktfqX1gUFg9zlBxj4KdIPaUvjAM2SScf1baXqUD9KdA8lXcu4Dt5c6B6yjKR
         fkFgPLvX52svpOmU9DWoH8liK0fB4jhojs3RrOBP3I/QzX0s5Df5cBQlAtHyj02rkz35
         QvZcqpr+GSqJ23HKKrkaYLXtReanYgkneApheeoHjepuw+4IyRAIjZsHM+a439lPAJnG
         YM42xgEhu6fv9Ez9jizLriJeTLfG+TL0P7lWbeqp9gU8jx6ed+qqBToUCNVE+MQ2H37t
         gVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=z2MCRZwnAPTEqYODMkj3+PTJcU+ncclCIozA5x11uMM=;
        b=Vw27o/9Li632zo55S8ZEoTSP3xdXSUn+me2psoGi+w3FMRbB81aSYlUi/Z+GFvUldP
         D3RgoDt9Sfj0mbefPbRAc2LTagRevqxDYDpF6E53SGvOQ8E1QVLq/xSjKCAn/fBS5ZH1
         0DT77wORa2Eb2BdI/LNtME0cG9vVOgGOFpFxy0vgHmLjF3xEOo0xa+I5Zrd1p3rDg4Vc
         7v2HrAfsqsrfBS0ALD0xSpaJUgm2wQdFkPbVFrap23hkYaxEsh4XemXZZUqGfsNxh4u9
         AMX8dp63rdAtsoBLVxy2S0iGFXVgVpXtHJIfZIABDdoduHexwmCvypF1KNwFpwVvQ/Cv
         S7+A==
X-Gm-Message-State: ACrzQf0Jcwmxlj9kQE2RECsgDEPVJbAoJqehwiv4As8Ams3HvdLQnVEa
	gxYDSrAn6fazSJ2il6ZyHe3j8A==
X-Google-Smtp-Source: AMsMyM6Io3BmRoigc9CnsetOFpauZCLrMtETpU3n2CWPkIA90UfIJN1GhK1zG57LSt5VssYM+AN+vg==
X-Received: by 2002:a2e:2f07:0:b0:26c:59d3:4a26 with SMTP id v7-20020a2e2f07000000b0026c59d34a26mr3021933ljv.471.1663748646667;
        Wed, 21 Sep 2022 01:24:06 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d25-20020ac25459000000b0048af4dc964asm337998lfn.73.2022.09.21.01.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 01:24:06 -0700 (PDT)
Message-ID: <bd460cfd-7114-b200-ab99-16fa3e2cff50@linaro.org>
Date: Wed, 21 Sep 2022 10:24:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 2/2] dt-bindings: net: snps,dwmac: add clk_csr property
Content-Language: en-US
To: Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220921070721.19516-1-jianguo.zhang@mediatek.com>
 <20220921070721.19516-3-jianguo.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921070721.19516-3-jianguo.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_012408_783700_3B50BEAB 
X-CRM114-Status: GOOD (  14.12  )
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

On 21/09/2022 09:07, Jianguo Zhang wrote:
> Add clk_csr property for snps,dwmac
> 
> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 491597c02edf..8cff30a8125d 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -288,6 +288,11 @@ properties:
>        is supported. For example, this is used in case of SGMII and
>        MAC2MAC connection.
>  
> +  clk_csr:

No underscores in node names. Missing vendor prefix.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Frequency division factor for MDC clock.

Can't common clock framework do the job? What is the MDC clock?

Best regards,
Krzysztof

