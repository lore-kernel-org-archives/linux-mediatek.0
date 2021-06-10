Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A39C47094
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 09:09:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B1A961249
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 09:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B1A961249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eZ7kOvyyNOdadR2y6me5uxEB69zVDHTEMP3xbDazH18=; b=q5pqfXT4GW9bxRfyFqkBHEQPZq
	kl6zlSY5hmfedizym4xPHJpGM/KSfgMvqyKIRm3GQE+ormCbxsfHzgLcyhlVy4FEJsgGHzfdvKH01
	8RnHE1OoewgbnZG6ZU9RK6bxbMeA5YDpsD2ncAmlNCWV+lE7CBDVTSsSfvBWBKFTP47qc4PysrVI+
	7j4TAP2Hby6Iq1VareBssZPhNrONLpVGAdx7v3zhrQUXIIIwzLSw+Njdd0oYI1L6tguVC5v9gyTq8
	6bPaCPbfS7RJANRBzTRXYKQqIhmpEkn1hxVvF8Lg50Xz9A//SwTBR2Dw4mjAKUudBWQjKr1D/6bl/
	S5RCTjkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrGgL-0006cd-9h; Thu, 10 Jun 2021 09:08:57 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrGD9-00HY6q-Cn; Thu, 10 Jun 2021 08:38:49 +0000
Received: by mail-wm1-f52.google.com with SMTP id
 m41-20020a05600c3b29b02901b9e5d74f02so2770965wms.3; 
 Thu, 10 Jun 2021 01:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Vw2rEidNYSZeHFrj7gyKfEnss0oZYJ9I5iUbvOkNzhg=;
 b=ooamT84SYgotXdYQmlxem5mrZzw1HzuUkCjt4aOlyohi6/Rm95UNTFkdQIjLulE2VV
 aozaQKnE6Si75yQpSMmR0ssVEZK0cPJxkXhNKsqeaP3BL8ASpHmfDJaIxXT+/DZ+54iJ
 aQy7NZ9kioLpoWTxSmhbdlRGt/T1Ds4CF+z9PKTf90jHc53Sl6FV3m/eWb+el5brKNMz
 luw6RF0GAQ3/+JRjmJ6Jizh4HK2iWbP8p7zLGlTMpOor1ZXGxLw3MLezHPmcJWwPbbt2
 iQgDCzRYRhk7CbBMhrZC4uoKRzddo7vYB+9pou03oWbTUyOcPE2EoVm5J//xQ92LMs+G
 PdUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vw2rEidNYSZeHFrj7gyKfEnss0oZYJ9I5iUbvOkNzhg=;
 b=ZRQrrYsR6lcE6YhNYDCbkzanNLsaloEPaHOp0s1cz+m3fhQJfX/xw2ysp0GQ9fnSUw
 SVPIj6FRGvbkR/ixX3DSTmMnta9GJv2VyiGrr0oWTfjMi1ZqD3fDvocOcslcrzUFg4aZ
 WSbmoY8H5U3e7Ce8f9vPGyG7cQjB6D4O5R6RXAYJdp/yZOdHOGt6yHHtej61m6gU82V8
 cUpn5h7R0pc8iGeTvTaUeR8/2Tvza/UwudXyo263XNu4gsVnsvGuh1xMCPCooOVu/MsP
 +B1IGdr2A7Jeria4zUQ92jBD0JXl+5bNvPa0KS1VvMDDbIYwSucYM8YjZ/xP6Pba5Drx
 mKDQ==
X-Gm-Message-State: AOAM531yxohnP3dY/Uq0+xNxfsd1v5RsaoqL7tPvheWVpz1BaSz2sJlg
 G7mZl3086w3EhnhhnbNUk3GPC51FrUQGtg==
X-Google-Smtp-Source: ABdhPJzcXxE0Z1+qB1Riub+DwCapNG6b60zmCOtH7Z/t9aZnXBURBj3oDjbAhDLMIsLCcajgntaNyA==
X-Received: by 2002:a05:600c:4114:: with SMTP id
 j20mr14226178wmi.0.1623314265323; 
 Thu, 10 Jun 2021 01:37:45 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id o18sm2648988wrx.59.2021.06.10.01.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 01:37:44 -0700 (PDT)
Subject: Re: [PATCH v2] dt-bindings: mediatek: convert mtk jpeg
 decoder/encoder to yaml
To: Hsin-Yi Wang <hsinyi@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, yong.wu@mediatek.com
References: <20210609180130.693944-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <c324de79-9a07-2f2c-e29a-dcd448da29f8@gmail.com>
Date: Thu, 10 Jun 2021 10:37:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210609180130.693944-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_013847_511794_1006BE8F 
X-CRM114-Status: GOOD (  23.04  )
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

Hi Hsin-Yi,

On 09/06/2021 20:01, Hsin-Yi Wang wrote:
> Convert mediatek jpeg decoder and encoder bindings to yaml.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v2: fix dt_binding_check errors
> ---
>  .../bindings/media/mediatek-jpeg-decoder.txt  | 38 ----------
>  .../bindings/media/mediatek-jpeg-decoder.yaml | 76 +++++++++++++++++++
>  .../bindings/media/mediatek-jpeg-encoder.txt  | 35 ---------
>  .../bindings/media/mediatek-jpeg-encoder.yaml | 68 +++++++++++++++++
>  4 files changed, 144 insertions(+), 73 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
>  delete mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
> deleted file mode 100644
> index 39c1028b2dfb4..0000000000000
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
> +++ /dev/null
> @@ -1,38 +0,0 @@
> -* Mediatek JPEG Decoder
> -
> -Mediatek JPEG Decoder is the JPEG decode hardware present in Mediatek SoCs
> -
> -Required properties:
> -- compatible : must be one of the following string:
> -	"mediatek,mt8173-jpgdec"
> -	"mediatek,mt7623-jpgdec", "mediatek,mt2701-jpgdec"
> -	"mediatek,mt2701-jpgdec"
> -- reg : physical base address of the jpeg decoder registers and length of
> -  memory mapped region.
> -- interrupts : interrupt number to the interrupt controller.
> -- clocks: device clocks, see
> -  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> -- clock-names: must contain "jpgdec-smi" and "jpgdec".
> -- power-domains: a phandle to the power domain, see
> -  Documentation/devicetree/bindings/power/power_domain.txt for details.
> -- mediatek,larb: must contain the local arbiters in the current Socs, see
> -  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> -  for details.

We miss the mediatek,larb in the yaml.

> -- iommus: should point to the respective IOMMU block with master port as
> -  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> -  for details.
> -
> -Example:
> -	jpegdec: jpegdec@15004000 {
> -		compatible = "mediatek,mt2701-jpgdec";
> -		reg = <0 0x15004000 0 0x1000>;
> -		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
> -		clocks =  <&imgsys CLK_IMG_JPGDEC_SMI>,
> -			  <&imgsys CLK_IMG_JPGDEC>;
> -		clock-names = "jpgdec-smi",
> -			      "jpgdec";
> -		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
> -		mediatek,larb = <&larb2>;
> -		iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
> -			 <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
> -	};
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> new file mode 100644
> index 0000000000000..821e6b480901a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek JPEG Decoder Device Tree Bindings
> +
> +maintainers:
> +  - Xia Jiang <xia.jiang@mediatek.com>
> +
> +description: |-
> +  Mediatek JPEG Decoder is the JPEG decode hardware present in Mediatek SoCs
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: mediatek,mt8173-jpgdec
> +      - items:
> +          - const: mediatek,mt2701-jpgdec
> +      - items:
> +          - enum:
> +              - mediatek,mt7623-jpgdec
> +          - const: mediatek,mt2701-jpgdec
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +    minItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: jpgdec-smi
> +      - const: jpgdec
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  iommus:
> +    maxItems: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - iommus
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt2701-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/memory/mt2701-larb-port.h>
> +    #include <dt-bindings/power/mt2701-power.h>
> +    jpegdec: jpegdec@15004000 {
> +      compatible = "mediatek,mt2701-jpgdec";
> +      reg = <0x15004000 0x1000>;
> +      interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
> +      clocks =  <&imgsys CLK_IMG_JPGDEC_SMI>,
> +                <&imgsys CLK_IMG_JPGDEC>;
> +      clock-names = "jpgdec-smi",
> +                    "jpgdec";
> +      power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
> +      iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
> +               <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
> +    };
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> deleted file mode 100644
> index 5e53c6ab52d01..0000000000000
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -* MediaTek JPEG Encoder
> -
> -MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
> -
> -Required properties:
> -- compatible : "mediatek,mt2701-jpgenc"
> -  followed by "mediatek,mtk-jpgenc"
> -- reg : physical base address of the JPEG encoder registers and length of
> -  memory mapped region.
> -- interrupts : interrupt number to the interrupt controller.
> -- clocks: device clocks, see
> -  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
> -- clock-names: must contain "jpgenc". It is the clock of JPEG encoder.
> -- power-domains: a phandle to the power domain, see
> -  Documentation/devicetree/bindings/power/power_domain.txt for details.
> -- mediatek,larb: must contain the local arbiters in the current SoCs, see
> -  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> -  for details.

Same here.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
