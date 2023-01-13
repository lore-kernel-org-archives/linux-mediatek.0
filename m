Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7523C54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 08:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ow5pZFQZCEYCIqWOTwm6DkLVewzWxSQ2hqbyfaIYUMw=; b=vJktd6M+wOlJ2O6Xepyj8oY4hy
	dFzfJ7jGxxd/kPRJ5WRAdEsyImC71fAWK/d3v+y2ZVgjLSCOKrN6dxIOtLGKw63d7xRwhEs2yAEAF
	zP4ay+zYrBwPyQGVGQ55w8JUi/l+2G5Pu7w3Io9KlO0X2KTdYaztRdBISp0dYZkJSxaD9FCKoB7AR
	kZVoZ/LC7X+14jn62DCZdx5QddbRqlLBtYjalYOg2C5XcHk0K60mMf4augMxE/8iSC/BXt+Pvheqb
	GpIpEi0q05FvN/UoNnToXn9jhTN715LHfm1KJ2ttiOBdjBcSIdLdWSdXJPCMfoX3iUeZp/7mq7mLW
	ZG6QTMwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFOD-001DfH-AO; Fri, 13 Jan 2023 08:26:17 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGFNz-001Dbc-PF
	for linux-mediatek@lists.infradead.org; Fri, 13 Jan 2023 08:26:06 +0000
Received: by mail-ej1-x62a.google.com with SMTP id v6so7555615ejg.6
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Jan 2023 00:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ow5pZFQZCEYCIqWOTwm6DkLVewzWxSQ2hqbyfaIYUMw=;
        b=AC8rsonIaKcS2a/AKPnyvkOrD5LKOz/E/kypsJqKNj44ntLKk+BZQq0pJYwlExETvH
         MqJQIHgjIl49HUPLbLmq7kDUTnHbIYva0FXIOZYmPbaGDh1Y3/SLNQhcvvcQV33S6Oqw
         LWzMeZPhLmbEJ+aXOMPimAuZu0ot1TeNjbfPtLhZcajjKLL2xYNnr7xK62Hq/ECXivB9
         KR9q2u4MqGg6UDBTgMDMZg2zfotH7Eda07Tz57yWnykG44VGzeLan0+FW6jaHQbJKUpW
         MQYKFwWhW943wKe9d3rdjA0Vn9dJG//JCfFDTLFLqNrNa34NXsm30uhRzZqVFR3dtRYL
         oPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ow5pZFQZCEYCIqWOTwm6DkLVewzWxSQ2hqbyfaIYUMw=;
        b=4BrQ9bwFLsztggnvHCH1dgJAEf618cy95hh01TWQLtNYLjjDmaG+v2vTJffF6lUb63
         5KT+SomAzZmBClOvOkSx0zGhMnfaU9rAnqaQnUbMcQ/wR7XWsUDqIFRhd2J2p67KBuPS
         843s/5vDaWeFdsjWxSeH+3/McLA/NuknlSwPrslC5rxfjrsuzlycqGBtPnqRUE8a1dtC
         VkEomEcJ3kZkZ6qTW3IiLLqI805xJSNYThTeUsLTRzC9a9PkuoyQLuH9yP35XksckOxE
         6olay/OwXKb9V6AK1hkAFOUk9IzWvgFPCECjfQqrkujnc+g661ssL+YpCbigxlJURXSw
         jX3Q==
X-Gm-Message-State: AFqh2kqEGjMDGelXv3Js/42UaiB6+tr/2TtfcYTZUckP4lq08HgVIWNV
	GIZDyMrYdtpIAIR9WcIzmo4e3w==
X-Google-Smtp-Source: AMrXdXvtfAJKfd+dEPUQgGjDwVPJIsdk/au7/BL5yCsi6a/MUx3IfCt5RfR2t5rlFGwdCkF3RMDP/g==
X-Received: by 2002:a17:907:2587:b0:7c0:ac4b:8b9 with SMTP id ad7-20020a170907258700b007c0ac4b08b9mr56938493ejc.14.1673598361438;
        Fri, 13 Jan 2023 00:26:01 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id hq15-20020a1709073f0f00b0084c4b87a69csm8258399ejc.153.2023.01.13.00.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 00:26:00 -0800 (PST)
Message-ID: <07ecf7cf-4a68-0f80-0452-3737b7d7922d@linaro.org>
Date: Fri, 13 Jan 2023 09:25:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 01/10] dt-bindings: media: mediatek,vcodec: Remove
 dma-ranges property
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, nfraprado@collabora.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, libo.kang@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>
References: <20230113060133.9394-1-yong.wu@mediatek.com>
 <20230113060133.9394-2-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113060133.9394-2-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_002603_854515_E0BDA154 
X-CRM114-Status: GOOD (  17.25  )
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

On 13/01/2023 07:01, Yong Wu wrote:
> MediaTek iommu has already controlled the masters' iova ranges by the
> master's larb/port id. then the dma-ranges property is unnecessary for

Sentences in English always start with a capital letter, however also
they do not start with "Then". Make it a proper a proper sentence.

> the master's node. the master is vcodec here.

Unnecessary or invalid? Don't you depend now on some feature of driver
added for example recently?

> 
> Cc: Tiffany Lin <tiffany.lin@mediatek.com>
> Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>
> Cc: Yunfei Dong <yunfei.dong@mediatek.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>

There is little point in storing output of get_maintainers.pl forever in
the git log. If you need it for some reason, please keep it after ---.

> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../devicetree/bindings/media/mediatek,vcodec-decoder.yaml | 5 -----
>  .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml | 5 -----
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml     | 7 -------
>  3 files changed, 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> index aa55ca65d6ed..fad59b486d5d 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> @@ -56,11 +56,6 @@ properties:
>        List of the hardware port in respective IOMMU block for current Socs.
>        Refer to bindings/iommu/mediatek,iommu.yaml.
>  
> -  dma-ranges:
> -    maxItems: 1
> -    description: |
> -      Describes the physical address space of IOMMU maps to memory.
> -
>    mediatek,vpu:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> index 0f2ea8d9a10c..a2051b31fa29 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> @@ -49,11 +49,6 @@ properties:
>        List of the hardware port in respective IOMMU block for current Socs.
>        Refer to bindings/iommu/mediatek,iommu.yaml.
>  
> -  dma-ranges:
> -    maxItems: 1
> -    description: |
> -      Describes the physical address space of IOMMU maps to memory.
> -
>    mediatek,vpu:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> index c4f20acdc1f8..290594bc91cc 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
> @@ -76,11 +76,6 @@ properties:
>        The node of system control processor (SCP), using
>        the remoteproc & rpmsg framework.
>  
> -  dma-ranges:
> -    maxItems: 1
> -    description: |
> -      Describes the physical address space of IOMMU maps to memory.
> -
>    "#address-cells":
>      const: 2
>  
> @@ -203,7 +198,6 @@ required:
>    - reg
>    - iommus
>    - mediatek,scp
> -  - dma-ranges
>    - ranges
>  
>  if:
> @@ -236,7 +230,6 @@ examples:
>              compatible = "mediatek,mt8192-vcodec-dec";
>              mediatek,scp = <&scp>;
>              iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> -            dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
>              #address-cells = <2>;
>              #size-cells = <2>;
>              ranges = <0 0 0 0x16000000 0 0x40000>;

Best regards,
Krzysztof


