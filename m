Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A66C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 20:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqLfFJGdvrKUW1fmZt9ValV02p3rXb0EIAq0v1cNES8=; b=0SLxS3uQHQgbKogFB1kB6Lv7Gr
	gD3MnAkEErmJ6xRQKxhaVt+CpisCptVtnw5Ir8ZV+EzxyvgQPYX6QbUcgy5c/I92RKtz6E2u0kGi9
	ZvFvL+Fd1JcG9SrKjacNYi7nP+2EOUY/TK/0OqDveN2xSJIz4y1mhcZljRvEfgfqxVn6K/kFVI4lr
	Qevt9vX9bhdbUqwC6/Y/P4+kG0MpsMW/Fj1H5WG3axyQvjN1P82sQ3IGLeCUqWT9iZ6J+2oRl7CM9
	TwVGWCqUjmsL9DXUCtF43JL8pn23plUGD9gTLXQub4ICuc+HCNUNXd5gxfAEKYUAfY92j1xVRPvN7
	1QlG4dmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDX4j-000gGF-LG; Mon, 18 Jul 2022 20:10:41 +0000
Received: from mail-il1-f180.google.com ([209.85.166.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDX4W-000g7a-1r; Mon, 18 Jul 2022 20:10:29 +0000
Received: by mail-il1-f180.google.com with SMTP id v1so2988576ilg.4;
        Mon, 18 Jul 2022 13:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QqLfFJGdvrKUW1fmZt9ValV02p3rXb0EIAq0v1cNES8=;
        b=zp2V28MJUhKWXs4D4jhIQQdKcsQHgsvCVQ59smWTaob6Wsv29/3slGpkeOjlZxyVQM
         pSoFJ4ZC+4jUKro299vavoGO6oyBH7TStSdxbnPCXYMZy6YRrHhy+sqEXDpSj3MKQlxc
         /FKCuTA70TknCTQ7CbPc5rEEin6pi+QpLEy8+XR18NDhNFYAq6PXfeEAMeVMxSSb/PyF
         4c3Dv+hD+XnU5Q9zKsnmmC0GzHpI4R6MicbyJhGXO6styjrV22FR+DhH45RpLMQcZNST
         yAfaeI3UmSqF+vq+0P33yWpfcaWCavcbuWsf8fEbgEVtG8cFrqe8OEQK+yaMJxOcVqNE
         37Ow==
X-Gm-Message-State: AJIora95SgA3a2ZDnjcP5rqsZdJgOT2Qi2/EBuCXT5l9Ra9zirm5qkmK
	awiEHK7l6RFxDNZdETaPkQ==
X-Google-Smtp-Source: AGRyM1vIK3KywiBRGl3M+VsgE1D2GxpaHCm/sub2KfIH9kA0N1m3Epw0wvneMsVhfP/2VtUlWvQIIg==
X-Received: by 2002:a92:6c05:0:b0:2da:b9e8:24df with SMTP id h5-20020a926c05000000b002dab9e824dfmr14653836ilc.99.1658175021933;
        Mon, 18 Jul 2022 13:10:21 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id u75-20020a02234e000000b0033f4a1114a6sm5741039jau.178.2022.07.18.13.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 13:10:21 -0700 (PDT)
Received: (nullmailer pid 3464461 invoked by uid 1000);
	Mon, 18 Jul 2022 20:10:19 -0000
Date: Mon, 18 Jul 2022 14:10:19 -0600
From: Rob Herring <robh@kernel.org>
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bin.zhang@mediatek.com, benliang.zhao@mediatek.com, linux-mediatek@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V4] dt-bindings: mediatek: Add axi clock in mt8173 dts
 example
Message-ID: <20220718201019.GA3461716-robh@kernel.org>
References: <20220712111106.31089-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712111106.31089-1-xiangsheng.hou@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_131028_130568_1A4B995B 
X-CRM114-Status: GOOD (  17.62  )
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

On Tue, Jul 12, 2022 at 07:11:07PM +0800, Xiangsheng Hou wrote:
> For mt8173, it is needed to add the axi clock for dma mode.

Needs to be sent to Mark Brown and linux-spi list. Use 
get_maintainers.pl.

> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> ---
> Changes from v3:
> - fix number of column characters
> 
> Changes from v2:
> - remove assigned clocks and parents in dt-binding
> 
> Changes from v1:
> - none
> ---
>  .../devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml        | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> index 41e60fe4b09f..d3d7ed4b497b 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-nor.yaml
> @@ -82,8 +82,9 @@ examples:
>          compatible = "mediatek,mt8173-nor";
>          reg = <0 0x1100d000 0 0xe0>;
>          interrupts = <1>;
> -        clocks = <&pericfg CLK_PERI_SPI>, <&topckgen CLK_TOP_SPINFI_IFR_SEL>;
> -        clock-names = "spi", "sf";
> +        clocks = <&pericfg CLK_PERI_SPI>, <&topckgen CLK_TOP_SPINFI_IFR_SEL>,
> +                 <&pericfg CLK_PERI_NFI>;
> +        clock-names = "spi", "sf", "axi";
>          #address-cells = <1>;
>          #size-cells = <0>;
>  
> -- 
> 2.25.1
> 
> 

