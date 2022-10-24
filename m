Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E9BECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 19:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vqLHNCC4h3WefblPd4YUovHfNe5etB8EwtpDxyh2rNg=; b=0zugvVjWeCqUMeW3mk4FE0TXxW
	Bzvs9XXqXvynspb2+CcXNb4X9z0X8CS7Qww2CfeRgaf+n9y/K3XiKOhm87aP4PRx2bojCllH3kxUn
	TzACZ6Gvk6o4FmYPA6sEQivfCRGhphzRuqH0vfrBwNw1YJJStNtp4Vfm/9fa8+Q1ZKOu1Q8VLtZaQ
	RcIEL+W66jN3VEcniz8VuPDoaBkuLzHjGS5XkNxC9aef9RudlfRxQ4R8ZBhMRIN7avBIdTN1ptT56
	yl58xvdUCfgOIM/Vf4fQV2KpXQu00nrirhIxmwiz3FJwdfMNbVkri9RRPwZ5bjP2fETxzdwvSFmfl
	5lVhoWrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on32f-002lp3-02; Mon, 24 Oct 2022 19:23:21 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on32d-002lnc-2i; Mon, 24 Oct 2022 19:23:20 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-13ba86b5ac0so4391439fac.1;
        Mon, 24 Oct 2022 12:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vqLHNCC4h3WefblPd4YUovHfNe5etB8EwtpDxyh2rNg=;
        b=xWrJ1jNe5Ub5uTwBdaPH/GL4qPNEIAAFSRzcWGF2iSxfNd4ZcrrNumr1Ty6vgCn8nX
         VU3CHJ9v2I3C9keaxZr1PD81iciVU5slAbMusUbTk5QZZpcwMCQe3KzeKxRNWBMK5NAv
         2C1QJ6xQviwSG98qMwFdEK4WiiMDnChAiNDlkenbX+OM40QLDlFcAYqsJcwZjVHtKRef
         vL8uGP0CkHJeEoS2IkkESuJk1KI4zoUudOEa2RvEDqBn8JBf1QPuiz44JWkwqv5furB1
         yoILd1FOy42enVxs529b08wZAu0q1fRL6tHBVSnc0RzQYFFnjYm67WSWorTDvdqQVosS
         S0pQ==
X-Gm-Message-State: ACrzQf25dCgKiZLCEDTa5frI81A3dOHBcYaQLEj3vr+be5s4PGHDY/2C
	QV6KwE9ODMZE/EPj4GB86QSy/eSbwg==
X-Google-Smtp-Source: AMsMyM5ai7TBx2hq9Yw2a73b9Dx0NsSpGKlCAqRK1rsVAwL1TyUeCKFTJoiykMmsw8LzRorV6iZ2tQ==
X-Received: by 2002:a05:6870:2054:b0:132:d1fb:ddf0 with SMTP id l20-20020a056870205400b00132d1fbddf0mr39306295oad.283.1666639392419;
        Mon, 24 Oct 2022 12:23:12 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u4-20020a4ac984000000b004768f725b7csm332279ooq.23.2022.10.24.12.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 12:23:11 -0700 (PDT)
Received: (nullmailer pid 2071537 invoked by uid 1000);
	Mon, 24 Oct 2022 19:23:13 -0000
Date: Mon, 24 Oct 2022 14:23:13 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH 3/3] dt-bindings: PCI: mediatek-gen3: add mt7986 clock
 config
Message-ID: <20221024192313.GA2069519-robh@kernel.org>
References: <20221023170234.83621-1-linux@fw-web.de>
 <20221023170234.83621-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221023170234.83621-4-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_122319_137146_57D16DB8 
X-CRM114-Status: GOOD (  14.91  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, Steven Liu <steven.liu@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Oct 23, 2022 at 07:02:34PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> MT7986 needs 4 clocks for PCIe, define them in binding.

Patch 2 is incomplete without this one. Therefore, patch 2 and 3 should 
be 1 patch.

> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml         | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 3662422b38ea..e6020e684c00 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -79,9 +79,11 @@ properties:
>        - const: mac
>  
>    clocks:
> +    minItems: 4
>      maxItems: 6
>  
>    clock-names:
> +    minItems: 4
>      maxItems: 6
>  
>    assigned-clocks:
> @@ -162,6 +164,20 @@ allOf:
>              - const: tl_32k
>              - const: peri_26m
>              - const: peri_mem
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt7986-pcie
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: pl_250m
> +            - const: tl_26m
> +            - const: peri_26m
> +            - const: top_133m
>  
>  unevaluatedProperties: false
>  
> -- 
> 2.34.1
> 
> 

