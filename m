Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3F5C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 18:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euvcKpX30ZVsmfkaXJTTyAJfHCgabkUtlIpVB4OOtdk=; b=ewcbAq8Cn5eLnOnl6yp2X4cfxp
	shd17Ivdz61zzbZOf5hMAVKh3bJoYq/kgIi53BfKR2JuSGZ41yrL6fBPlTZSe5uMCcE/xcGyKZfRV
	ciJXEBPJqBIZNBu6MHwMjCrcmD0XVKE5BVX1BmsQS739SXJHblPpunSkLY3FLzOUy/zQNdMRHn+xn
	3gNRgyI0y4ZVoWWy164Qe6Xtn0CR/7J2xwN7zHAKPcyP9AbQelQOQ/43aHF+aUme5dDqxNPCuDjCn
	GDKrmll+BLIglTssPIJXT+j0MYVTCiwbbRGevksSRvPwdZf+i66zHJmqFC4qy1Y/BNZX+MFo45ySs
	XgcALAhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r835s-0066wR-0i;
	Tue, 28 Nov 2023 18:46:00 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r821n-005y8i-14
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Nov 2023 17:37:44 +0000
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6d8147d3072so2087535a34.1
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Nov 2023 09:37:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701193057; x=1701797857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=euvcKpX30ZVsmfkaXJTTyAJfHCgabkUtlIpVB4OOtdk=;
        b=v1824S4uixhl84KTbEq2aytsx6f+s5uOyoLNWjNaDroyg3SSpEnbckni56830wBmQN
         lM7wQoxq2VaO0Itix6T86tTN6zcCkEkxBgHpvFRcKHU8gHTJpXfyrSO2w48h9X0MuMWt
         i9kGbj8I3SnnR6AZmTayuaxaDqIlDTn1TZTeAoXzaRFHdom6uzf/N6h0DbhMl6XNsD49
         UAaJ8lhQZFRZ8KLQBLSKwTf3u7udOxT+XUxt3mxlzaH18j7H14r1cdfnSbOICYCAjE4J
         tUkJQjeaVNeg3fC8Bhh+Svy0RX55JACOFsnImJb5ON5qtidaXcz45GXN8hiqKP4M82dj
         0GRw==
X-Gm-Message-State: AOJu0YxwXNfkaveLPonfPHNj5l8FxaD3v61WKAv2DQTMZak5Wwoy+xiN
	AeaeWbsYcyM0DvUax4WQVG9P68xXSA==
X-Google-Smtp-Source: AGHT+IFqYYn9X2TZT97zZ6qFLfge2tyuoZxVF9rjnkiko+nm/6218G7n1xYaCVZdrESr/DQLfEbS8w==
X-Received: by 2002:a05:6870:d3cb:b0:1b0:2f63:4ff6 with SMTP id l11-20020a056870d3cb00b001b02f634ff6mr22471768oag.1.1701193057389;
        Tue, 28 Nov 2023 09:37:37 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id wx20-20020a0568707e1400b001fa38903b92sm1518933oab.15.2023.11.28.09.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 09:37:36 -0800 (PST)
Received: (nullmailer pid 3544147 invoked by uid 1000);
	Tue, 28 Nov 2023 17:37:35 -0000
Date: Tue, 28 Nov 2023 11:37:35 -0600
From: Rob Herring <robh@kernel.org>
To: Peter Chiu <chui-hao.chiu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: wireless: mt76: add interrupts
 description for MT7986
Message-ID: <20231128173735.GA3537931-robh@kernel.org>
References: <20231128035723.5217-1-chui-hao.chiu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128035723.5217-1-chui-hao.chiu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_093743_368343_87AF4F94 
X-CRM114-Status: GOOD (  16.46  )
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

On Tue, Nov 28, 2023 at 11:57:23AM +0800, Peter Chiu wrote:
> The mt7986 can support four interrupts to distribute the interrupts
> to different CPUs.
> 
> Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
> ---
>  .../bindings/net/wireless/mediatek,mt76.yaml  | 24 +++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> index 252207adbc54..20f5f2ead265 100644
> --- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> @@ -19,9 +19,6 @@ description: |
>    Alternatively, it can specify the wireless part of the MT7628/MT7688
>    or MT7622/MT7986 SoC.
>  
> -allOf:
> -  - $ref: ieee80211.yaml#
> -
>  properties:
>    compatible:
>      enum:
> @@ -38,7 +35,8 @@ properties:
>        MT7986 should contain 3 regions consys, dcm, and sku, in this order.
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 4
>  
>    power-domains:
>      maxItems: 1
> @@ -219,6 +217,24 @@ required:
>  
>  unevaluatedProperties: false
>  
> +allOf:
> +  - $ref: ieee80211.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt7986-wmac
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 1
> +          items:
> +            - description: major interrupt for rings
> +            - description: addditional interrupt for ring 19
> +            - description: addditional interrupt for ring 4
> +            - description: addditional interrupt for ring 5

This list belongs in the top level. The if/then schema needs to set 
'maxItems: 1' for the cases with only 1 interrupt and 'minItems: 4' for 
the cases with 4 interrupts.

Rob

