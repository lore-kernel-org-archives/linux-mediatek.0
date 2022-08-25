Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055A7C65C0D
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 13:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1UpxoiRuNt3oUSMcF8VYdjioVIlJJnIPZzUkRCOFOs=; b=w8BiLfvxAJ096xd4pAMns5xETz
	dByQJMVTXt/qoFFoYaxUUawcuRXbbak6B+PUls7uALbtOXDxhXTdgtlC0k8vNOz0QInp71HJfM1HU
	LrKkj7E5NjXUoQRPvaheBB2CIh8e498a32R5cNXwZv0L8mgYcxU6ZDDsO5XYtoKY3bDD8rZtux5Wc
	yvX+DupCPWzMjiGIZQQr6bX1tU3ugazoDoLr3p1JUBFaOy9HV+5XVoWhkAz1g54sEYquUJ1LJg/Rw
	qPSgC/y7XQ/nDsruyowM5fEWGscNK+tmqCGOnlNHacr8PS9pgDzO6sbNxZyrhRr/yCIsWd3MDsbOg
	AN5VobQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRD2I-00EsoG-6f; Thu, 25 Aug 2022 13:36:42 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRD21-00EsYA-7a; Thu, 25 Aug 2022 13:36:26 +0000
Received: by mail-wr1-x430.google.com with SMTP id h5so23852065wru.7;
        Thu, 25 Aug 2022 06:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=o1UpxoiRuNt3oUSMcF8VYdjioVIlJJnIPZzUkRCOFOs=;
        b=BAPDeOCpMKXOQRMSoIMiS+mUnKLVXfABtBKM/70xGPTvsTNCwiOL8aeiF6qIitDeKf
         2ps6ylszW3YeCgmYj/rF/rrQo5dqhFryE0AHN/LYZEZub/FFrtyHX/hf+Oj1DkCZg7rp
         4Tu3cAcrILV64LGxaFkYK0r3POMb6MgrYmqbBZlZ0S3oLpV3LE1wJt0FhNUuwLZ66LVG
         NNECmr2MIWVXOnYMalYzU6czysgigZayP3xMrNN8WOMSrrGTQTiFqp4MAjOAynmzszr0
         N6YD6gjJKCDUAmq46OuRK+WI4e8V8LNNTNixMWXVHmBDvzA1EdKyJPjiw+7INrmhgV15
         kWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=o1UpxoiRuNt3oUSMcF8VYdjioVIlJJnIPZzUkRCOFOs=;
        b=BOh5jz9cXJldTXkOVFylrWcW5d6pu/G7ygOSm5XrWKZ3wE3VVVW6vIpfLE1c1sVEvL
         /aOHJkRBab1Vng6OL3kfXYtAfaUoNoWNZUjG7wflZmMx9EHnDGYO594zQoPya+gP/2cf
         w2AqK0y8oFrDKa/dk9hen51kT+xQyTm2znygga3nGzNcSNpnZYqp0ljGr9QO4/AJKI97
         dTveDvErcF+2PeTknN6R1pep3YOHeU2O5+5mo9OgxptK6Zi8HnSwTODZxqFBx3jFxPol
         5nP+43TrR3l40uyf1BrTlJjl7NhAslvHxcU0OMMycEZyLNEGB0pcMKSYd5OFjpVAfOhf
         nBug==
X-Gm-Message-State: ACgBeo3UaEH/yfN+OH6gC3hAxaO1GL4NLHZEBNcVpjyfWpfuH1IxALuE
	GWYSw0P65VcvdNmX2VU0RAY=
X-Google-Smtp-Source: AA6agR51DTr6LrwquXxqYW/bTahA+91PGJ3st7kartiD0AdFt0Nd5Iv4F33QY1hXXicmBdatc+1D0w==
X-Received: by 2002:adf:f881:0:b0:225:4f49:55dc with SMTP id u1-20020adff881000000b002254f4955dcmr2437885wrp.414.1661434581558;
        Thu, 25 Aug 2022 06:36:21 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id y8-20020a5d4ac8000000b0021f73c66198sm19385965wrs.1.2022.08.25.06.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 06:36:20 -0700 (PDT)
Message-ID: <b96810d6-df43-1599-b3cc-83e97b9faf2c@gmail.com>
Date: Thu, 25 Aug 2022 15:36:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v4 05/20] dt-bindings: power: mediatek: Update maintainer
 list
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220729063208.16799-1-tinghan.shen@mediatek.com>
 <20220729063208.16799-6-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220729063208.16799-6-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_063625_361139_2605AF94 
X-CRM114-Status: GOOD (  14.88  )
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



On 29/07/2022 08:31, Tinghan Shen wrote:
> Update the maintainer list of power controller binding.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied, thanks

> ---
>   .../devicetree/bindings/power/mediatek,power-controller.yaml    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 2d6afc0909473..03b7f6aa591d4 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   title: Mediatek Power Domains Controller
>   
>   maintainers:
> -  - Weiyi Lu <weiyi.lu@mediatek.com>
> +  - MandyJH Liu <mandyjh.liu@mediatek.com>
>     - Matthias Brugger <mbrugger@suse.com>
>   
>   description: |

