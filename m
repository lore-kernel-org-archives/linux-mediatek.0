Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DF0EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 15:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncuaFGbbtekf5cXch+1XQiyBNxzcKPWmwcz1ZHv7TQE=; b=PmaYnk198Tq0VZU7Mdb4WEgs34
	Ms0Hrad+FtBUTnLWocG6GeldIeq4PC9UUpGFhjhMGkaeJPQtYA24ELaFj55tJLtO9yhY11YOr0uuK
	naI0a5o4IH5xmU5SZaWXgJB1rM0Hrwq3Adh41GBjcmQxhQWCA0rZCyJKmOzSAjSqF0oIrRMgjG5is
	4ew/R85cKPouoQl6teYoJYzLGc5Xh3FY2zSktfreTvbiK7GpPq+hqcZ5VD2lwh2V/wOqfcuGn+zlB
	ZoVWXB79TEiywlh69QlkrDR60LLBXMjnXr1PvaoHG031Eut0vWYxnvm5Jg9En5lXC2JLUQ65kxPSG
	ixeBLM6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEWwy-00Fy9l-2C;
	Wed, 28 Jun 2023 15:19:20 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEWwu-00Fy63-1r;
	Wed, 28 Jun 2023 15:19:18 +0000
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3426e9a9c3eso3092135ab.0;
        Wed, 28 Jun 2023 08:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687965554; x=1690557554;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ncuaFGbbtekf5cXch+1XQiyBNxzcKPWmwcz1ZHv7TQE=;
        b=BxMaV3gfLvvsvIHCErdJOsdsi7YLhHKIveXL5gsmaeNsOjeFWOnwakLTpqtctyjujA
         ziVYSnmNsqyLEVU5KVZiaZkT4UT45sPA1My44xl3OIq2IWDs/gQm+3g2VG72kptd9fLj
         fX9QArgXn5meuAXnuYmEtQqMzjseVWDOUCDhOu2eoUY/tDupTkQHUVL6VJ92WfukE0wX
         b4/mxGnqsbMvLrKoNUtM0/+3dfNLS/n/VCnoLNWB7G/n7d+SeYgyGehgTMO2LLeoj2E3
         sCKlMJEJr4foMQD8D/rm0hQZ7NK4C030NWoYOqFM62Vyerr9GvoNHmZQ1By0+7S781E8
         b/hA==
X-Gm-Message-State: AC+VfDyjtdm0is5YhxccFT32wIGtna1B91GdtBo4zq0pMRi4RIiI2fj/
	Uktd1ko3NpV/XjJ7FEITiQ==
X-Google-Smtp-Source: ACHHUZ60XE/cJWRbRB1KdKUGN41MKsBhEBIqJPgQk90PdHVO0sDuR3fhUruPrF1dHVi2aSXHXvvrgA==
X-Received: by 2002:a05:6e02:5c7:b0:33f:eb60:519d with SMTP id l7-20020a056e0205c700b0033feb60519dmr1141469ils.2.1687965554414;
        Wed, 28 Jun 2023 08:19:14 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id l11-20020a02cceb000000b003e8a17d7b1fsm3316028jaq.27.2023.06.28.08.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 08:19:13 -0700 (PDT)
Received: (nullmailer pid 489759 invoked by uid 1000);
	Wed, 28 Jun 2023 15:19:08 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Andy Hsieh <andy.hsieh@mediatek.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, daoyuan huang <daoyuan.huang@mediatek.com>, Louis Kuo <louis.kuo@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Moudy Ho <moudy.ho@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mediatek@lists.infradead.org, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Vasily Gorbik <gor@linux.ibm.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Florian Sylvestre <fsylvestre@baylibre.com>, devicetree@vger.kernel.org, Phi-bang Nguyen <pnguyen@baylibre.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20230628145412.1610260-4-jstephan@baylibre.com>
References: <20230628145412.1610260-1-jstephan@baylibre.com>
 <20230628145412.1610260-4-jstephan@baylibre.com>
Message-Id: <168796554802.489724.9682174200154392018.robh@kernel.org>
Subject: Re: [PATCH 3/4] dt-bindings: media: add mediatek ISP3.0 camsv
Date: Wed, 28 Jun 2023 09:19:08 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_081916_611564_AE7EC60E 
X-CRM114-Status: GOOD (  16.07  )
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


On Wed, 28 Jun 2023 16:52:54 +0200, Julien Stephan wrote:
> From: Phi-bang Nguyen <pnguyen@baylibre.com>
> 
> This adds the bindings, for the ISP3.0 camsv module embedded in
> some Mediatek SoC, such as the mt8365
> 
> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../bindings/media/mediatek,mt8365-camsv.yaml | 113 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 114 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml: properties:ports:properties:port@0:patternProperties: 'endpoint' does not match '[\\^$()*@]'
	hint: Fixed strings belong in 'properties', not 'patternProperties'
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
Documentation/devicetree/bindings/clock/milbeaut-clock.example.dtb: /example-2/serial@1e700010: failed to match any schema with compatible: ['socionext,milbeaut-usio-uart']
Documentation/devicetree/bindings/clock/sprd,sc9863a-clk.example.dtb: /example-1/syscon@20e00000: failed to match any schema with compatible: ['sprd,sc9863a-glbregs', 'syscon', 'simple-mfd']
Documentation/devicetree/bindings/leds/common.example.dtb: /example-2/i2c/led-controller@30: failed to match any schema with compatible: ['panasonic,an30259a']
Documentation/devicetree/bindings/sound/audio-graph-card2.example.dtb: /example-0/cpu: failed to match any schema with compatible: ['cpu-driver']
Documentation/devicetree/bindings/sound/audio-graph-card2.example.dtb: /example-0/codec: failed to match any schema with compatible: ['codec-driver']
Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.example.dtb: /example-0/avs-monitor@7d5d2000: failed to match any schema with compatible: ['brcm,bcm2711-avs-monitor', 'syscon', 'simple-mfd']
Documentation/devicetree/bindings/thermal/imx-thermal.example.dtb: /example-0/anatop@20c8000: failed to match any schema with compatible: ['fsl,imx6q-anatop', 'syscon', 'simple-mfd']
Documentation/devicetree/bindings/i2c/qcom,i2c-cci.example.dtb: /example-0/cci@ac4a000/i2c-bus@1/camera@60: failed to match any schema with compatible: ['ovti,ov7251']
Documentation/devicetree/bindings/iio/adc/ti,palmas-gpadc.example.dtb: /example-0/pmic: failed to match any schema with compatible: ['ti,twl6035-pmic', 'ti,palmas-pmic']
Documentation/devicetree/bindings/iio/adc/ti,palmas-gpadc.example.dtb: /example-0/pmic: failed to match any schema with compatible: ['ti,twl6035-pmic', 'ti,palmas-pmic']
Documentation/devicetree/bindings/input/mediatek,pmic-keys.example.dtb: /example-0/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.example.dtb: /example-0/pmic@0: failed to match any schema with compatible: ['sprd,sc2731']
Documentation/devicetree/bindings/dma/dma-controller.example.dtb: /example-0/dma-controller@48000000: failed to match any schema with compatible: ['ti,omap-sdma']
Documentation/devicetree/bindings/dma/dma-router.example.dtb: /example-0/dma-router@4a002b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.example.dtb: /example-0/memory-controller@13410000/ethernet@6: failed to match any schema with compatible: ['davicom,dm9000']
Documentation/devicetree/bindings/arm/hisilicon/controller/cpuctrl.example.dtb: /example-0/cpuctrl@a22000/clock@0: failed to match any schema with compatible: ['hisilicon,hix5hd2-clock']
Documentation/devicetree/bindings/arm/hisilicon/controller/sysctrl.example.dtb: /example-0/system-controller@802000/clock@0: failed to match any schema with compatible: ['hisilicon,hi3620-clock']
Documentation/devicetree/bindings/arm/hisilicon/controller/hi3798cv200-perictrl.example.dtb: /example-0/peripheral-controller@8a20000/phy@850: failed to match any schema with compatible: ['hisilicon,hi3798cv200-combphy']
Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.example.dts:28:18: fatal error: dt-bindings/power/mediatek,mt8365-power.h: No such file or directory
   28 |         #include <dt-bindings/power/mediatek,mt8365-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1512: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230628145412.1610260-4-jstephan@baylibre.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


