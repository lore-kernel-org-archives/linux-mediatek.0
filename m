Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A24DC6377A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 02:53:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C62C6127C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 02:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C62C6127C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AX3z+sFUYlbrh5QzkjJQ5PrSk0ymzh2voc0bmlTRelA=; b=bYJ1rLD6bNRtE0
	0MPPe7YhSLSvS0kAVlmIwMefzr3qskcaz3AIxP1NewXWnhAQHDSxIxlhD4CzEohqxI3C++OhxZ02+
	2rGpqi+paeEbsUbEaaSLv6zle8ObxGRZJreYkCU4Gn0CjAuiU0ggs4eJDd+tLBSLG9hwcUL52ohVl
	r4JQS+Uqb7A0Yc5WZoIzZ9ai+iVvZk+NT+chh9W/6T3r1LMl9oL6JoAhinsuH24ppPV7UoAblXQuv
	anpniBsCOeDe21WKaun+/7VNxXYz58KEw+++kPglx7TzmTsd7ZbyrKEeT0gXNERbLYo81+7DwW+7k
	nsTIfJR86W8QLNbiq9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Opf-000498-Tl; Thu, 22 Jul 2021 02:53:07 +0000
Received: from mail-il1-f175.google.com ([209.85.166.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Opd-00047a-3u; Thu, 22 Jul 2021 02:53:06 +0000
Received: by mail-il1-f175.google.com with SMTP id e13so4136612ilc.1;
 Wed, 21 Jul 2021 19:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=82O9pxHs2phuaInzl9cox8me6UL28Nm2JehOPgfRTdU=;
 b=n4wPKzc5EnQLIm7vP7wqPa/vgUfO4ha0YfhLyki/2sjg00UENLXJrE8YYm112sYqDA
 TyaDmel6aYRwQTC/opUlWlpgsjZOPlikT1irI6TvQpLwGGKLUy0RgxXsa1xnu4e8KbuP
 QvdTCcAYrz2jbpAINPpcbc8UNveG+vrmPW157MWehEYvG9rCFveuWE01oCXcXlh7XLWC
 X5sNq7gZCRDVFql2mBwsC9bly6IOEHShWBQNQTOM88Xn7qOgHrXlFnVS4gnLSxXn1FsC
 xxyh7hZX/To4zU434dH0i5+aT7jUuSX96QiVVwNOhq0AmzHQvY2cPWqIw1nXP0zgW+qJ
 wJIQ==
X-Gm-Message-State: AOAM532jzZb9qNKRp49iowTuKZJCnWcPjr/MPeBSvyzgWAeSYRPXXLBp
 X3T26eemgc/46XHeCNGfKQ==
X-Google-Smtp-Source: ABdhPJyn11/pSzoHtQk9aFg6OthLDc/3e1S3UHr3amy1RP5ecpQGjtAMSWqcQHWLLIfasZwcFAYIZQ==
X-Received: by 2002:a92:c805:: with SMTP id v5mr24196570iln.293.1626922384270; 
 Wed, 21 Jul 2021 19:53:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id i5sm14559011ilc.16.2021.07.21.19.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 19:53:03 -0700 (PDT)
Received: (nullmailer pid 3205958 invoked by uid 1000);
 Thu, 22 Jul 2021 02:53:01 -0000
Date: Wed, 21 Jul 2021 20:53:01 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
 anthony.huang@mediatek.com
Subject: Re: [PATCH v2 02/11] dt-bindings: memory: mediatek: Add mt8195 smi
 sub common
Message-ID: <20210722025301.GA3204448@robh.at.kernel.org>
References: <20210715121209.31024-1-yong.wu@mediatek.com>
 <20210715121209.31024-3-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210715121209.31024-3-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_195305_191255_3279CAD8 
X-CRM114-Status: GOOD (  23.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 15, 2021 at 08:12:00PM +0800, Yong Wu wrote:
> Add the binding for smi-sub-common. The SMI block diagram like this:
> 
>         IOMMU
>          |  |
>       smi-common
>   ------------------
>   |      ....      |
>  larb0           larb7   <-max is 8
> 
> The smi-common connects with smi-larb and IOMMU. The maximum larbs number
> that connects with a smi-common is 8. If the engines number is over 8,
> sometimes we use a smi-sub-common which is nearly same with smi-common.
> It supports up to 8 input and 1 output(smi-common has 2 output)
> 
> Something like:
> 
>         IOMMU
>          |  |
>       smi-common
>   ---------------------
>   |      |          ...
> larb0  sub-common   ...   <-max is 8
>       -----------
>        |    |    ...   <-max is 8 too.
>      larb2 larb5
> 
> We don't need extra SW setting for smi-sub-common, only the sub-common has
> special clocks need to enable when the engines access dram.
> 
> If it is sub-common, it should have a "mediatek,smi" phandle to point to
> its smi-common. meanwhile, the sub-common only has one gals clock.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../mediatek,smi-common.yaml                  | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> index 602592b6c3f5..f79d99ebc440 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> @@ -38,6 +38,7 @@ properties:
>            - mediatek,mt8192-smi-common
>            - mediatek,mt8195-smi-common-vdo
>            - mediatek,mt8195-smi-common-vpp
> +          - mediatek,mt8195-smi-sub-common
>  
>        - description: for mt7623
>          items:
> @@ -67,6 +68,10 @@ properties:
>      minItems: 2
>      maxItems: 4
>  
> +  mediatek,smi:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array

If only a phandle, then s/phandle-array/phandle/

> +    description: a phandle to the smi-common node above. Only for sub-common.
> +
>  required:
>    - compatible
>    - reg
> @@ -93,6 +98,26 @@ allOf:
>              - const: smi
>              - const: async
>  
> +  - if:  # only for sub common
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8195-smi-sub-common
> +    then:
> +      required:
> +        - mediatek,smi
> +      properties:
> +        clock:
> +          items:
> +            minItems: 3
> +            maxItems: 3
> +        clock-names:
> +          items:
> +            - const: apb
> +            - const: smi
> +            - const: gals0
> +
>    - if:  # for gen2 HW that have gals
>        properties:
>          compatible:
> -- 
> 2.18.0
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
