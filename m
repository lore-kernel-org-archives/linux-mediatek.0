Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2C3C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 23:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMDue3AGTZDcvOF0FYfPIZ59G4hgPL35BLPYRBugHdw=; b=l7F9fcYCGbCNgh
	tmiCPuO/5/YiqthK0HJY9y+T49gYCUtGj7Se+nqq7ULZe/olQvRFd1s6ktzGf+b9zx8Pumqg7y953
	b2DCB6HvImrn6FdsVqsgL32NcPswtnan2CiBnTBUcRqxditukqfOW0VQlESjz2RY2vxV8O4JEaSQj
	Nko6dq5x5B6sEFQ99NQCJuniLhY6kxN/8HTcC9PpEWex/duprvQ1qA1mYhEk8NkNP0BLLOKnUwZ5M
	GqieRUcOA5uyG0rlXs9pxUA13jEm6Obq/9BIkcgCwDp5HTrtmOqWUYpFQ5eUcGaxRCDtAKA8WOfKh
	npu+L2j/A8I4SQu2b21A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRMzy-001ztx-Ou; Mon, 07 Mar 2022 23:42:42 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRMzm-001zrY-A0; Mon, 07 Mar 2022 23:42:31 +0000
Received: by mail-oi1-f170.google.com with SMTP id z7so17107879oid.4;
 Mon, 07 Mar 2022 15:42:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EsKRRIoThK3MQ1H0laF62b7WY6ong2NDteh+bOwJmMY=;
 b=Q/jYqyPPh8mE+O+mOis/JUTDuKPeNdh5d0yILWPPVFdCKUs2TGoSPTlRIalUcr4Aqf
 2VsCmHANh5atFvV2aOuG41BTnlq8Z5sCpgZPD3aHTUl4I3BEgmRgFEHwlBLL5/nixica
 HBFUYxvRFolZuErMRfwjKfPLQ2ImcG1n2cQLmd0Gpv+nLkA3c5uZBxmJgn3p/IOKSbFW
 8QkCVnfiE0RG30WC9IyopU+KSIKuXEvqa/H7SyBl34z1Ec+/VVmEh5Bf69+ukL96mKS4
 F/nuEbDkvUwKJA0UQMFwAVSgAZayGAU/XCg4RpaGwcp7gu+DHpg62qeySLKXsG1BPyQa
 dgvg==
X-Gm-Message-State: AOAM5329g2q93hOanAZxdeRuK6yE421vDxYcTmUXWC1HOxUUdR3e8ISd
 52zCCOlOciyPamfO5PVKRw==
X-Google-Smtp-Source: ABdhPJwirVFf7NgTIaWCdemavUPZ6EK5UqamWYmsiMJjOCqd6t3G8W+ppN3LvgLKqKkNIV99E6Sjxg==
X-Received: by 2002:a05:6808:14cc:b0:2d9:a01a:48ac with SMTP id
 f12-20020a05680814cc00b002d9a01a48acmr946191oiw.247.1646696545606; 
 Mon, 07 Mar 2022 15:42:25 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w4-20020a4adec4000000b0032109de628esm1060794oou.6.2022.03.07.15.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 15:42:24 -0800 (PST)
Received: (nullmailer pid 3487473 invoked by uid 1000);
 Mon, 07 Mar 2022 23:42:23 -0000
Date: Mon, 7 Mar 2022 17:42:23 -0600
From: Rob Herring <robh@kernel.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH V3 6/7] dt-bindings: spi: support spi-hclk
Message-ID: <YiaYXwj0C8NeWjzz@robh.at.kernel.org>
References: <20220307065230.12655-1-leilk.liu@mediatek.com>
 <20220307065230.12655-7-leilk.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220307065230.12655-7-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_154230_357903_56A5A827 
X-CRM114-Status: GOOD (  15.93  )
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

On Mon, Mar 07, 2022 at 02:52:29PM +0800, Leilk Liu wrote:
> this patch support spi-hclk.
> 
> Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
> ---
>  .../devicetree/bindings/spi/mediatek,spi-mt65xx.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> index a8a15a9a6c46..195793aa79b7 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> @@ -51,16 +51,20 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 3
>      items:
>        - description: clock used for the parent clock
>        - description: clock used for the muxes clock
>        - description: clock used for the clock gate
> +      - description: clock used for the AHB bus, this clock is optional
>  
>    clock-names:
> +    minItems: 3
>      items:
>        - const: parent-clk
>        - const: sel-clk
>        - const: spi-clk
> +      - const: spi-hclk

'spi' is redundant. Just 'hclk'.

>  
>    mediatek,pad-select:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
> -- 
> 2.25.1
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
