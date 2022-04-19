Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF55C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 15:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2DaOD0bIsKnPOwkA86Ekysq0n/nG+XnJXTCzJ2nm7k=; b=bNobE9gQljw0Ae
	N+RjABFj0k9wScDkWmN7gt80dtvNB66ADE1DERpiTufsGNnKYJX7u7eWfex1Vta2jBwWtlGCRtWan
	xeqvACJFIdT9urfjXjlsGHpN4Jjtds4i1o4FuOemIM7/zEwYcLF8QdPbNoVD3BS6f7cM8nASwaPHY
	el3hRfunRDgkjE5FeR3eSOhqIkV7jpHvOCXkg+i6IvF2MUnDzYk7aNFcEsC7RkqGC0ppuNIo6c0i0
	9oeDYsMpQL60bu4r60Z3r1SE+hPjy53yYEL4d0JQa0ZfZjmMza2W5AGhRjDcyQwfauareheF7ZFFM
	30Erk2uxjhJvYa1E8XRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngpr1-004grR-Jb; Tue, 19 Apr 2022 15:33:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngpJP-004Sns-FC; Tue, 19 Apr 2022 14:58:45 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso1671453wmz.4; 
 Tue, 19 Apr 2022 07:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7ghNXW0NodixkgL8T98CLlpDZH/0jSgrfBNvM5ej23s=;
 b=hlZSGMyqcDPTQx6RmtGj1koskcBFnvovRkA/NkQQc1kdKfUCK/xvxNwK2/QMga//vt
 gvgPCxHQlSAHj+yHIujC+BRmhj1gLP7ekLjV7ZD7NrecJ3BdrZHOw6YBvn/B6cItuKKf
 MdBYEq0rFmbIYogIZIjdsOO2THvp40Dfj3qsPVPkMBNI2i35smPdCI7UEoXt/JwhcW9Q
 gx7Jeu3EnBQWxS746ict9bmJuk74OzwMEBkyzbwQJSY3huu8lXCtxwI5vk9YhVDeGMl8
 YXCw7i4742XSHTgAlzm+90dybKw5PvgRAAqbic2G3krhErrfckVz+/ESYOyynHb2tL31
 7WQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7ghNXW0NodixkgL8T98CLlpDZH/0jSgrfBNvM5ej23s=;
 b=DZ0adDG/73yjeJIvYOPMSOyXwtzZzXSUDUgSsVFI4lQj01x6P4IwDCoBr3ljDAZf5q
 m0F4HFUISUJ9bP1bmk66UujVPeyYSMogqlBSUEkcShfmkI+fLpq/9t2sh3qNFa7OFeew
 gsQDbHB7+AU1RMQkJ7pbmACc42fFj/8BJEICYjOn5rAtV6OobIxYaqD9a3xo9fuMywMV
 HmiOcg/IP48MLP67vp2rgkqNzwwxQmQdYaUA4zhyQ02JUvjdVooahMyWTzSDZmAvC3Ki
 aUl0EiOG+n0DcZKOiA5d2QLyXPtG+mMyOtvIm93WzsgNQqKSXd67tOLbR1jtbvzJJwSg
 rwNQ==
X-Gm-Message-State: AOAM5302QwY45NUhwExjLKu0g2l2VL080ngnKM1heI9Gr5Lskt3jPj1S
 Z+IZG9ZLja7+XV6Fvyi6sKE=
X-Google-Smtp-Source: ABdhPJybiVLTSTP7L0aETG6uMJhUECVA5p62Vy3/QCjle5pk3JlVskw99zgtPeLU158U++lWgJMu7w==
X-Received: by 2002:a05:600c:3785:b0:38e:bca8:f0c1 with SMTP id
 o5-20020a05600c378500b0038ebca8f0c1mr19958744wmr.56.1650380314825; 
 Tue, 19 Apr 2022 07:58:34 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a5d59a3000000b0020a9132d1fbsm6605119wrr.37.2022.04.19.07.58.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 07:58:34 -0700 (PDT)
Message-ID: <83a7f222-f62c-fa47-9370-f9b709c3110e@gmail.com>
Date: Tue, 19 Apr 2022 16:54:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/5] dt-bindings: arm: mediatek: mmsys: add power and gce
 properties
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de
Cc: airlied@linux.ie, angelogioacchino.delregno@collabora.com,
 jason-jh.lin@mediatek.com, nancy.lin@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220419033237.23405-1-rex-bc.chen@mediatek.com>
 <20220419033237.23405-2-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220419033237.23405-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_075839_543427_AD36DCAF 
X-CRM114-Status: GOOD (  20.20  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 19/04/2022 05:32, Rex-BC Chen wrote:
> From: "jason-jh.lin" <jason-jh.lin@mediatek.com>
> 
> Power:
> 1. Add description for power-domains property.
> 
> GCE:
> 1. Add description for mboxes property.
> 2. Add description for mediatek,gce-client-reg property.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Applied, thanks.

Matthias

> ---
>   .../bindings/arm/mediatek/mediatek,mmsys.yaml | 31 +++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index b31d90dc9eb4..6c2c3edcd443 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -41,6 +41,30 @@ properties:
>     reg:
>       maxItems: 1
>   
> +  power-domains:
> +    description:
> +      A phandle and PM domain specifier as defined by bindings
> +      of the power controller specified by phandle. See
> +      Documentation/devicetree/bindings/power/power-domain.yaml for details.
> +
> +  mboxes:
> +    description:
> +      Using mailbox to communicate with GCE, it should have this
> +      property and list of phandle, mailbox specifiers. See
> +      Documentation/devicetree/bindings/mailbox/mtk-gce.txt for details.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +  mediatek,gce-client-reg:
> +    description:
> +      The register of client driver can be configured by gce with 4 arguments
> +      defined in this property, such as phandle of gce, subsys id,
> +      register offset and size.
> +      Each subsys id is mapping to a base address of display function blocks
> +      register which is defined in the gce header
> +      include/dt-bindings/gce/<chip>-gce.h.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    maxItems: 1
> +
>     "#clock-cells":
>       const: 1
>   
> @@ -56,9 +80,16 @@ additionalProperties: false
>   
>   examples:
>     - |
> +    #include <dt-bindings/power/mt8173-power.h>
> +    #include <dt-bindings/gce/mt8173-gce.h>
> +
>       mmsys: syscon@14000000 {
>           compatible = "mediatek,mt8173-mmsys", "syscon";
>           reg = <0x14000000 0x1000>;
> +        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>           #clock-cells = <1>;
>           #reset-cells = <1>;
> +        mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
> +                 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
> +        mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
>       };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
