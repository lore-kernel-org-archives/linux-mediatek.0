Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9677C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 18:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XLx27BevMMYggeW95Kf6PqEo7TObURqeNS6YT6uRbI=; b=tkFBCxRznq6RUXSAfrEgda5fwX
	cuQJIFdhtZkz600KwMXPRUVj8t1LLZBFmMkv3sr2FSVA4lYlboMeSCOcVeZ38kUvuuEGtbS8MCSpI
	oRfYM9gPr+PrVriwmnT+OVpAH15kUPN4qR3r1cwKAWVW8QqS6aLTaDYixi+X8HQKxrfV1eLW8dcBF
	SgvPKof+VUWzlcWhyBu4rUhj4SydbF2KGEtcQu+/TWUEQ5sH6FAcbr9P9XF+n4Bl4DJudIoGGMDEx
	BAq5flI1NoOyDmTqPcdvtpvlFqwiiU3FW3rr1np21P8dQt7oXis8/U3tvpNP6NdDRCMV5p30Ezqsq
	BAv1Al8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDV9E-00HStl-1L; Mon, 18 Jul 2022 18:07:12 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDV90-00HSmb-GH; Mon, 18 Jul 2022 18:07:00 +0000
Received: by mail-io1-f52.google.com with SMTP id z132so9951419iof.0;
        Mon, 18 Jul 2022 11:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2XLx27BevMMYggeW95Kf6PqEo7TObURqeNS6YT6uRbI=;
        b=rGfGKhibtUEEiStaRGkgpNBFh1Hm20edKJwh9m6C6A+GtpFENV+93OzP+erwlQ1kx0
         jg8HABtWj9VMMxiMNJIQw9pBtJh+y7msou6lVzQ8FI1lqKDE/l03l+XCjEJzJjEeSdo6
         Ix6C7Kv8KBNOvn5wlB6nm+OPBQyFHpuMl48unHZ05NkceGeVc5pXf5DCV7gVZ+9QLD1T
         8i1d+CMw+U2kCsS3Rlf2zWIuR2jpdvwU3Ov+M4iBZ7SjAuY2phQ+yYooKCBYC3GANb6d
         nOXD4QgNhxnXOfbpn4ctZEadnPh4x3U1ViCFdCixMGNQpiTmJtF1Gwy+3e30G4H/Jiv9
         9E9g==
X-Gm-Message-State: AJIora/lSSls2wbTXbdeHVDDUlIwB+W8N1xkYrw+xlJ6ycI1wGQ4KrRa
	6QJxqYDgYDDUl0zocZxmrw==
X-Google-Smtp-Source: AGRyM1vBi5nYgBxBwYhVAQ7Lyykz76T6YG04KzUoCurovhRE7LNmZwdfqXQIWdN5VoZD4+YmGpR/Xg==
X-Received: by 2002:a05:6638:411f:b0:33f:8c3d:c4d9 with SMTP id ay31-20020a056638411f00b0033f8c3dc4d9mr13525413jab.259.1658167616369;
        Mon, 18 Jul 2022 11:06:56 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id l1-20020a922801000000b002dc2b20e9cfsm4993358ilf.1.2022.07.18.11.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 11:06:56 -0700 (PDT)
Received: (nullmailer pid 3266350 invoked by uid 1000);
	Mon, 18 Jul 2022 18:06:54 -0000
Date: Mon, 18 Jul 2022 12:06:54 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, mbrugger@suse.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com, nfraprado@collabora.com
Subject: Re: [PATCH 2/3] dt-bindings: power: mediatek: Update example to use
 phandle to syscon
Message-ID: <20220718180654.GA3260460-robh@kernel.org>
References: <20220711122503.286743-1-angelogioacchino.delregno@collabora.com>
 <20220711122503.286743-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711122503.286743-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_110658_566601_8B46EBFC 
X-CRM114-Status: GOOD (  17.48  )
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

On Mon, Jul 11, 2022 at 02:25:02PM +0200, AngeloGioacchino Del Regno wrote:
> The preferred way of declaring this node is by using a phandle to
> syscon: update the example to reflect that.

Preferred by who? Not me. 
 
What problem are you trying to solve? Better be a good reason for 
breaking compatibility.


> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../power/mediatek,power-controller.yaml      | 125 +++++++++---------
>  1 file changed, 63 insertions(+), 62 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> index 848fdff7c9d8..bed059e4401d 100644
> --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> @@ -237,76 +237,77 @@ examples:
>          scpsys: syscon@10006000 {
>              compatible = "syscon", "simple-mfd";

Only generic compatibles is certainly not preferred.

>              reg = <0 0x10006000 0 0x1000>;
> +        };
> +    };
>  
> -            spm: power-controller {
> -                compatible = "mediatek,mt8173-power-controller";
> +    spm: power-controller {
> +        compatible = "mediatek,mt8173-power-controller";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        #power-domain-cells = <1>;
> +        syscon = <&scpsys>;
> +
> +        /* power domains of the SoC */
> +        power-domain@MT8173_POWER_DOMAIN_VDEC {
> +            reg = <MT8173_POWER_DOMAIN_VDEC>;
> +            clocks = <&topckgen CLK_TOP_MM_SEL>;
> +            clock-names = "mm";
> +            #power-domain-cells = <0>;
> +        };
> +        power-domain@MT8173_POWER_DOMAIN_VENC {
> +            reg = <MT8173_POWER_DOMAIN_VENC>;
> +            clocks = <&topckgen CLK_TOP_MM_SEL>,
> +                     <&topckgen CLK_TOP_VENC_SEL>;
> +            clock-names = "mm", "venc";
> +            #power-domain-cells = <0>;
> +        };
> +        power-domain@MT8173_POWER_DOMAIN_ISP {
> +            reg = <MT8173_POWER_DOMAIN_ISP>;
> +            clocks = <&topckgen CLK_TOP_MM_SEL>;
> +            clock-names = "mm";
> +            #power-domain-cells = <0>;
> +        };
> +        power-domain@MT8173_POWER_DOMAIN_MM {
> +            reg = <MT8173_POWER_DOMAIN_MM>;
> +            clocks = <&topckgen CLK_TOP_MM_SEL>;
> +            clock-names = "mm";
> +            #power-domain-cells = <0>;
> +            mediatek,infracfg = <&infracfg>;
> +        };
> +        power-domain@MT8173_POWER_DOMAIN_VENC_LT {
> +            reg = <MT8173_POWER_DOMAIN_VENC_LT>;
> +            clocks = <&topckgen CLK_TOP_MM_SEL>,
> +                     <&topckgen CLK_TOP_VENC_LT_SEL>;
> +            clock-names = "mm", "venclt";
> +            #power-domain-cells = <0>;
> +        };
> +        power-domain@MT8173_POWER_DOMAIN_AUDIO {
> +            reg = <MT8173_POWER_DOMAIN_AUDIO>;
> +            #power-domain-cells = <0>;
> +        };
> +        power-domain@MT8173_POWER_DOMAIN_USB {
> +            reg = <MT8173_POWER_DOMAIN_USB>;
> +            #power-domain-cells = <0>;
> +        };
> +        power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
> +            reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
> +            clocks = <&clk26m>;
> +            clock-names = "mfg";
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            #power-domain-cells = <1>;
> +
> +            power-domain@MT8173_POWER_DOMAIN_MFG_2D {
> +                reg = <MT8173_POWER_DOMAIN_MFG_2D>;
>                  #address-cells = <1>;
>                  #size-cells = <0>;
>                  #power-domain-cells = <1>;
>  
> -                /* power domains of the SoC */
> -                power-domain@MT8173_POWER_DOMAIN_VDEC {
> -                    reg = <MT8173_POWER_DOMAIN_VDEC>;
> -                    clocks = <&topckgen CLK_TOP_MM_SEL>;
> -                    clock-names = "mm";
> -                    #power-domain-cells = <0>;
> -                };
> -                power-domain@MT8173_POWER_DOMAIN_VENC {
> -                    reg = <MT8173_POWER_DOMAIN_VENC>;
> -                    clocks = <&topckgen CLK_TOP_MM_SEL>,
> -                             <&topckgen CLK_TOP_VENC_SEL>;
> -                    clock-names = "mm", "venc";
> -                    #power-domain-cells = <0>;
> -                };
> -                power-domain@MT8173_POWER_DOMAIN_ISP {
> -                    reg = <MT8173_POWER_DOMAIN_ISP>;
> -                    clocks = <&topckgen CLK_TOP_MM_SEL>;
> -                    clock-names = "mm";
> -                    #power-domain-cells = <0>;
> -                };
> -                power-domain@MT8173_POWER_DOMAIN_MM {
> -                    reg = <MT8173_POWER_DOMAIN_MM>;
> -                    clocks = <&topckgen CLK_TOP_MM_SEL>;
> -                    clock-names = "mm";
> +                power-domain@MT8173_POWER_DOMAIN_MFG {
> +                    reg = <MT8173_POWER_DOMAIN_MFG>;
>                      #power-domain-cells = <0>;
>                      mediatek,infracfg = <&infracfg>;
>                  };
> -                power-domain@MT8173_POWER_DOMAIN_VENC_LT {
> -                    reg = <MT8173_POWER_DOMAIN_VENC_LT>;
> -                    clocks = <&topckgen CLK_TOP_MM_SEL>,
> -                             <&topckgen CLK_TOP_VENC_LT_SEL>;
> -                    clock-names = "mm", "venclt";
> -                    #power-domain-cells = <0>;
> -                };
> -                power-domain@MT8173_POWER_DOMAIN_AUDIO {
> -                    reg = <MT8173_POWER_DOMAIN_AUDIO>;
> -                    #power-domain-cells = <0>;
> -                };
> -                power-domain@MT8173_POWER_DOMAIN_USB {
> -                    reg = <MT8173_POWER_DOMAIN_USB>;
> -                    #power-domain-cells = <0>;
> -                };
> -                power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
> -                    reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
> -                    clocks = <&clk26m>;
> -                    clock-names = "mfg";
> -                    #address-cells = <1>;
> -                    #size-cells = <0>;
> -                    #power-domain-cells = <1>;
> -
> -                    power-domain@MT8173_POWER_DOMAIN_MFG_2D {
> -                        reg = <MT8173_POWER_DOMAIN_MFG_2D>;
> -                        #address-cells = <1>;
> -                        #size-cells = <0>;
> -                        #power-domain-cells = <1>;
> -
> -                        power-domain@MT8173_POWER_DOMAIN_MFG {
> -                            reg = <MT8173_POWER_DOMAIN_MFG>;
> -                            #power-domain-cells = <0>;
> -                            mediatek,infracfg = <&infracfg>;
> -                        };
> -                    };
> -                };
>              };
>          };
>      };
> -- 
> 2.35.1
> 
> 

