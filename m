Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED3AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 06:03:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 151F461211
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 06:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 151F461211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cD03FuS8QuGToe5C2E8PanEKfjRLuZh4+C6FniEK15I=; b=X1GMUh8PRDDFiq
	d0eIa+z3aDzP1rKyHljSwgI2QM2zskLu78i0cLc+qLqYNb6Jh5NwtwcLab+jWK0X8fDq90eTIODt7
	JNea/QxviPNNGNQZnXnTPnDdnBL2KT3FGt0WZRjPQa3uEMOTLh57gCxcvpXHszhAa5ltN6yRwlBfc
	V4zDEIK25YRgcvBMTgcgJqKfQcZo3qmeTiZg945rkzZE0WkjMFi6N9LyoIwD5+RN5NV5/REMX/kAB
	M1PaCSp9hJg42pdhRkH/eUzhlt0xkyYgqpbDoXiRwI2iWlor8kMM3LmUJL8oGOH9BEazsU6CJrjnb
	qwx2iRpxI7hp+x8hbZ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTeIb-00D95W-Rx; Fri, 24 Sep 2021 06:03:05 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTeIO-00D93m-Ka
 for linux-mediatek@lists.infradead.org; Fri, 24 Sep 2021 06:02:54 +0000
Received: by mail-io1-xd2d.google.com with SMTP id y197so11127801iof.11
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Sep 2021 23:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8EJ8DYKndFK+5So2UKuINw0ckdpPba90RU7+1mo4Kbs=;
 b=goM+/0IhsvZrgtKeDDt9Vf1dhntj9ubEcOhxssAViO9HXfNYHBiR2kxsdKngsoJbO/
 sam8qudQ26QM/0N1lAudAKMR9Ude3eGQ9LeUR5xodwMVVkGX4re5b1Zzz9sZyzBfiMKb
 aZlnk4uX4VQR5+6mto1fM38ZynAE1pRX52Niw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8EJ8DYKndFK+5So2UKuINw0ckdpPba90RU7+1mo4Kbs=;
 b=TDBR3bfawmdKsqJOTrnM/rPe/JRtTSBvTxbmNuzAGRX8eS+be32IUxjUU12UBOU+JR
 zamU0DwwTx2oa0f1Ef3/pJwC4ydZ6ICtfsCd1HWkOy9oXJXBRVV+mfx41CiHDeADIIoJ
 09jxOa54KLWOJRMEVaNDsBt6VdMbK8e5N67UY/gQlfbA6v3Szld7kOEivje8RK2t4g4e
 YQCbDWrXc55kflWGH7aaShev8CYqT2ollge2vMxi5U4HvGO5h8eDlNMZ0yCdksjGgLri
 AdUHFKfFlT5kOMYlGjJz1G29bIXXes0C4BOxl+Vh+vhojKsk05FNjgPMgQBkgXHuvfpo
 2rKg==
X-Gm-Message-State: AOAM5326W+4n5UhTr0stdxANTRD7QJzTtcdnsLqRX96htnDw1rtxwZpy
 TORy7oX7rrFVmovJqtAoLYt0t2sVLCjk5+meQc7QEQ==
X-Google-Smtp-Source: ABdhPJxUsO5lNgbt/bn3O3IzyVReZBGY0xZnLoXmOtAktRYLOyTdzdcKibiIFq5TZwe27oZ3V2EJI4+RTaoqcsq75eA=
X-Received: by 2002:a05:6602:180e:: with SMTP id
 t14mr7228927ioh.204.1632463368083; 
 Thu, 23 Sep 2021 23:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210702102304.3346429-1-hsinyi@chromium.org>
In-Reply-To: <20210702102304.3346429-1-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 24 Sep 2021 14:02:22 +0800
Message-ID: <CAJMQK-h090rkRJdzfq_4YkRqwwaU7Wn-p3i0Zc+8-7hVzx+8sA@mail.gmail.com>
Subject: Re: [PATCH v5 RESEND 1/3] dt-bindings: mediatek: convert mtk jpeg
 decoder/encoder to yaml
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 Devicetree List <devicetree@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, 
 Maoguang Meng <maoguang.meng@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_230252_721014_E402CA80 
X-CRM114-Status: GOOD (  23.38  )
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

On Fri, Jul 2, 2021 at 6:23 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Convert mediatek jpeg decoder and encoder bindings to yaml.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Kindly ping on these patches.

> ---
>  .../bindings/media/mediatek-jpeg-decoder.txt  | 38 --------
>  .../bindings/media/mediatek-jpeg-decoder.yaml | 89 +++++++++++++++++++
>  .../bindings/media/mediatek-jpeg-encoder.txt  | 35 --------
>  .../bindings/media/mediatek-jpeg-encoder.yaml | 80 +++++++++++++++++
>  4 files changed, 169 insertions(+), 73 deletions(-)
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
> -       "mediatek,mt8173-jpgdec"
> -       "mediatek,mt7623-jpgdec", "mediatek,mt2701-jpgdec"
> -       "mediatek,mt2701-jpgdec"
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
> -- iommus: should point to the respective IOMMU block with master port as
> -  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> -  for details.
> -
> -Example:
> -       jpegdec: jpegdec@15004000 {
> -               compatible = "mediatek,mt2701-jpgdec";
> -               reg = <0 0x15004000 0 0x1000>;
> -               interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
> -               clocks =  <&imgsys CLK_IMG_JPGDEC_SMI>,
> -                         <&imgsys CLK_IMG_JPGDEC>;
> -               clock-names = "jpgdec-smi",
> -                             "jpgdec";
> -               power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
> -               mediatek,larb = <&larb2>;
> -               iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
> -                        <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
> -       };
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> new file mode 100644
> index 0000000000000..9b87f036f1785
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> @@ -0,0 +1,89 @@
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
> +          - enum:
> +              - mediatek,mt8173-jpgdec
> +              - mediatek,mt2701-jpgdec
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
> +  mediatek,larb:
> +    $ref: '/schemas/types.yaml#/definitions/phandle'
> +    description: |
> +      Must contain the local arbiters in the current Socs, see
> +      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> +      for details.
> +
> +  iommus:
> +    maxItems: 2
> +    description: |
> +      Points to the respective IOMMU block with master port as argument, see
> +      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> +      Ports are according to the HW.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - mediatek,larb
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
> +      mediatek,larb = <&larb2>;
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
> -- iommus: should point to the respective IOMMU block with master port as
> -  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> -  for details.
> -
> -Example:
> -       jpegenc: jpegenc@1500a000 {
> -               compatible = "mediatek,mt2701-jpgenc",
> -                            "mediatek,mtk-jpgenc";
> -               reg = <0 0x1500a000 0 0x1000>;
> -               interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
> -               clocks =  <&imgsys CLK_IMG_VENC>;
> -               clock-names = "jpgenc";
> -               power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
> -               mediatek,larb = <&larb2>;
> -               iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
> -                        <&iommu MT2701_M4U_PORT_JPGENC_BSDMA>;
> -       };
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> new file mode 100644
> index 0000000000000..5e35ecfd21f1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> @@ -0,0 +1,80 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek JPEG Encoder Device Tree Bindings
> +
> +maintainers:
> +  - Xia Jiang <xia.jiang@mediatek.com>
> +
> +description: |-
> +  MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt2701-jpgenc
> +      - const: mediatek,mtk-jpgenc
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: jpgenc
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  mediatek,larb:
> +    $ref: '/schemas/types.yaml#/definitions/phandle'
> +    description: |
> +      Must contain the local arbiters in the current Socs, see
> +      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
> +      for details.
> +
> +  iommus:
> +    maxItems: 2
> +    description: |
> +      Points to the respective IOMMU block with master port as argument, see
> +      Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> +      Ports are according to the HW.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - mediatek,larb
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
> +    jpegenc: jpegenc@1500a000 {
> +      compatible = "mediatek,mt2701-jpgenc",
> +                   "mediatek,mtk-jpgenc";
> +      reg = <0x1500a000 0x1000>;
> +      interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
> +      clocks =  <&imgsys CLK_IMG_VENC>;
> +      clock-names = "jpgenc";
> +      power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
> +      mediatek,larb = <&larb2>;
> +      iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
> +               <&iommu MT2701_M4U_PORT_JPGENC_BSDMA>;
> +    };
> --
> 2.32.0.93.g670b81a890-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
