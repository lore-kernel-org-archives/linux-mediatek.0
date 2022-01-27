Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAACC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 14:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ixtYkkx00UcH1GutvWKegQRdVHwPDKy5lnh8cXdua9o=; b=ZYpWhxi/TvTbHx
	UP4DnWJUNBnggahubPZj0y0d/LyQiYRR8kD+3PBU/TSv3hsCrL88nVn0rythLoFRDV8Wfm0cr89sY
	wFtSVd/yRp3TyAVsb67KwkKHM4XKpZnsgVoVvZ+Tkm7GFhoO1EvC6HMyTdmW0MsUcA6a0od4ajFc6
	DmgwOirvOGevXm6FlZ57PurREo5AGZ/uGNWS1nWHL2Zc0PNFKhrpiRXIgvclFvVnvu6c1yiJ+kidn
	bnH9spn1AunHJPMGmCgukTTBIRlVp0ej0yB/XkZ9aGXbEoV2ol9Unxw1Otu3+mq0pneqv5r4d1Cjk
	X/gobp1fiD2cKw/MMp7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD5My-00G0Tf-CX; Thu, 27 Jan 2022 14:03:24 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD5Ml-00G0PC-BQ; Thu, 27 Jan 2022 14:03:13 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 10-20020a9d030a000000b0059f164f4a86so2599259otv.13; 
 Thu, 27 Jan 2022 06:03:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=nGqKAVozOn7icaKYITMo1ImX9DZEs2FfFmM8RWbY00w=;
 b=iZvjC3B8t5RMQvNcSJS9VInPE52gIVYnLioGngWRNngIu3MHdRPmqs9oEHKVXM5VIN
 zs2mABfYp3oiG1NcqxirMy94XYW5v2zsKyq5ReD2i+E6RhQS1FwzHDI+e3LjC3xx6XIl
 K6Bn4cfTIZpCpKTRYkk8uhYcKRXklx0QXbJuAl4LaNz4AXktTG8GlOX8XkZChlUyR3Sv
 XyeaJN8aqlslxYR9b8qyokNAPyBx4eMIw98KjGiPCRSJQoYJ3npdDyYX5BNabx6PwjD2
 m0xWIXB9tNJMOD805Qavtz/exh+3l7e/HgzM4WGvcxcXOqMWq0q5QhJJRoE2/r8Cy+l9
 SZFA==
X-Gm-Message-State: AOAM531VO8p4w3YOQFRbIPJa6D2HQR64M1HE1tifL8kunS0vB+MP6ekk
 gcQTXw3HTfEHsD5wJXXinw==
X-Google-Smtp-Source: ABdhPJxzUuTwBszF3Lg08WmG5YnfL6szBIhS8BUAQhafTGghz3Ge7GhLBQkPe6spEuXN3Zzy+6LlbA==
X-Received: by 2002:a9d:24a1:: with SMTP id z30mr2186536ota.242.1643292190055; 
 Thu, 27 Jan 2022 06:03:10 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id g34sm4240519ooi.48.2022.01.27.06.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 06:03:08 -0800 (PST)
Received: (nullmailer pid 3149361 invoked by uid 1000);
 Thu, 27 Jan 2022 14:03:05 -0000
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220127085930.15637-1-chunfeng.yun@mediatek.com>
References: <20220127085930.15637-1-chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v3] dt-bindings: nvmem: convert mtk-efuse.txt to YAML
 schema
Date: Thu, 27 Jan 2022 08:03:05 -0600
Message-Id: <1643292185.232142.3149360.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_060311_411652_E8B114AA 
X-CRM114-Status: GOOD (  12.88  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 27 Jan 2022 16:59:30 +0800, Chunfeng Yun wrote:
> Convert mtk-efuse.txt to YAML schema mediatek,efuse.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> v3: add reviewed-by Rob
> 
> v2:
>   1. remove description of subnodes which is covered by nvmem.yaml suggested by Rob
>   2. change the example which is commoner than mt8173's
> ---
>  .../bindings/nvmem/mediatek,efuse.yaml        | 86 +++++++++++++++++++
>  .../devicetree/bindings/nvmem/mtk-efuse.txt   | 43 ----------
>  2 files changed, 86 insertions(+), 43 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>  delete mode 100644 Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/nvmem/mediatek,efuse.example.dts:25.43-28.15: Warning (unique_unit_address_if_enabled): /example-0/efuse@11c10000/usb3-tx-imp@184: duplicate unit-address (also used in node /example-0/efuse@11c10000/usb3-rx-imp@184)
Documentation/devicetree/bindings/nvmem/mediatek,efuse.example.dts:37.45-40.15: Warning (unique_unit_address_if_enabled): /example-0/efuse@11c10000/usb3-tx-imp@186: duplicate unit-address (also used in node /example-0/efuse@11c10000/usb3-rx-imp@186)
Documentation/devicetree/bindings/nvmem/mediatek,efuse.example.dts:49.42-52.15: Warning (unique_unit_address_if_enabled): /example-0/efuse@11c10000/usb2-intr-p0@188: duplicate unit-address (also used in node /example-0/efuse@11c10000/usb2-intr-p1@188)

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1584864

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
