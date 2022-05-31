Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E44EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 22:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5Jh2ypnv+HF7dY2kBZcrH3hhdzF//LZkQ/kgNljfww=; b=dJidA+cU/dy0NR
	byfdcHkJXC3z8FdnLvvZn3VIVBgZX6dtN8pvi9nsNrzbhK77VIfTcgOYeCMrvPzrPOCsWcvx3w37S
	ETlwIjCGzus10pPqUkjgWWH4l/h7KMr3iKUAqzpzabfl5HkgODU5JHfxRktdyi8aR/R329J5uSU8k
	mOzcaXc6BCFiOGCUOaRvkjACGSe9MgG/m7RD7oZ4yztwVHaO9Y/I9yg7hSb/W2zm0oy2eLZlkBMK0
	VX4F8lwgEJmV4HAP2oRtg6oeIo8+0AkDH2fW2oCe3r4lGAtiHqYqo3DoOSajMTin1pGAB0/GQIHgX
	mgNRr7D57qfN2S3DnGQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwAeS-00Cthu-Po; Tue, 31 May 2022 22:47:48 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwAdm-00CtN7-68; Tue, 31 May 2022 22:47:10 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-f33f0f5b1dso360324fac.8;
        Tue, 31 May 2022 15:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=aprzOwmeu9ofv4NArUYUbqpCw1+7K1N79lDMatDRSxY=;
        b=50yT4OJ05fNPnxMaTU7KaBiTRKDqUPNifLgByFDHhTjqS+zqQeK81J4YopVmdH8n+o
         8fcwqcFi5KdZoQ1jY4oH9t1br3oB8oL1X5abwONcAPCpNnqGbc2g4lAUe5kw79cyv8rL
         X6WRcwboOeOBtke1sxQJLpRpA4aW3rON3rh9AStIxp+ZZs9QeeDT/CWCn5R6nxxQNNPk
         2FzVHzo/weIUqgdzs+XeJ7vVv1+14G0JMcsGqdxJrz+z6DaE2UvpQVXhydvOlTAh3s7t
         ccpuviFwfzmyw9WGHT81YqS9mnqj6OB7gXvFIrnYofX4sLyHItSjg4bUuIznIFfyevCH
         8mZg==
X-Gm-Message-State: AOAM531NGl2j2CgD/UB7SA6UbszL3o3Amiaoq7l2d9k2o4t+naHzj24Y
	2gNNx79AR0hwt/g2GM4MgA==
X-Google-Smtp-Source: ABdhPJzrxihBjK98eUTkfRJDT5Ew9e/c5AjwMgz/IhfhSleaQEJbbkcrawGZcg5v4oRO3DRzsYRYvw==
X-Received: by 2002:a05:6870:8985:b0:da:b3f:3253 with SMTP id f5-20020a056870898500b000da0b3f3253mr14896611oaq.259.1654037221882;
        Tue, 31 May 2022 15:47:01 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bo44-20020a05680822ac00b0032af1c6bf02sm84725oib.45.2022.05.31.15.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 15:47:01 -0700 (PDT)
Received: (nullmailer pid 2476562 invoked by uid 1000);
	Tue, 31 May 2022 22:46:54 -0000
From: Rob Herring <robh@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, sre@kernel.org, jingoohan1@gmail.com, broonie@kernel.org, deller@gmx.de, alice_chen@richtek.com, heikki.krogerus@linux.intel.com, lars@metafoo.de, lee.jones@linaro.org, chunfeng.yun@mediatek.com, linux-pm@vger.kernel.org, linux-fbdev@vger.kernel.org, chiaen_wu@richtek.com, linux-iio@vger.kernel.org, linux@roeck-us.net, daniel.thompson@linaro.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, lgirdwood@gmail.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, pavel@ucw.cz, linux-usb@vger.kernel.org, linux-leds@vger.kernel.org, matthias.bgg@gmail.com, cy_huang@richtek.com
In-Reply-To: <20220531111900.19422-7-peterwu.pub@gmail.com>
References: <20220531111900.19422-1-peterwu.pub@gmail.com> <20220531111900.19422-7-peterwu.pub@gmail.com>
Subject: Re: [RESEND 06/14] dt-bindings: mfd: Add Mediatek MT6370 binding
Date: Tue, 31 May 2022 17:46:54 -0500
Message-Id: <1654037214.477381.2476559.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_154706_450102_B0F1F050 
X-CRM114-Status: GOOD (  10.97  )
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

On Tue, 31 May 2022 19:18:52 +0800, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek MT6370 binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../bindings/mfd/mediatek,mt6370.yaml         | 282 ++++++++++++++++++
>  .../dt-bindings/iio/adc/mediatek,mt6370_adc.h |  18 ++
>  include/dt-bindings/mfd/mediatek,mt6370.h     |  83 ++++++
>  3 files changed, 383 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
>  create mode 100644 include/dt-bindings/mfd/mediatek,mt6370.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charger.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: mt6370@34: charger: False schema does not allow {'compatible': ['mediatek,mt6370-charger'], 'interrupts': [[48], [68], [6]], 'interrupt-names': ['attach_i', 'uvp_d_evt', 'mivr'], 'io-channels': [[1, 5]], 'usb-otg-vbus': {'regulator-compatible': ['mt6370,otg-vbus'], 'regulator-name': ['usb-otg-vbus'], 'regulator-min-microvolt': [[4350000]], 'regulator-max-microvolt': [[5800000]], 'regulator-min-microamp': [[500000]], 'regulator-max-microamp': [[3000000]], 'phandle': [[2]]}}
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: mt6370@34: tcpc: False schema does not allow {'compatible': ['mediatek,mt6370-tcpc'], 'interrupts-extended': [[4294967295, 4, 8]], 'connector': {'compatible': ['usb-c-connector'], 'label': ['USB-C'], 'vbus-supply': [[2]], 'data-role': ['dual'], 'power-role': ['dual'], 'try-power-role': ['sink'], 'source-pdos': [[570527844]], 'sink-pdos': [[570527944]], 'op-sink-microwatt': [[10000000]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[4294967295]]}}, 'port@1': {'reg': [[1]], 'endpoint': {'remote-endpoint': [[4294967295]]}}, 'port@2': {'reg': [[2]], 'endpoint': {'remote-endpoint': [[4294967295]]}}}}}
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: mt6370@34: indicator: False schema does not allow {'compatible': ['mediatek,mt6370-indicator'], '#address-cells': [[1]], '#size-cells': [[0]], 'multi-led@0': {'reg': [[0]], 'function': ['indicator'], 'color': [[9]], 'led-max-microamp': [[24000]], '#address-cells': [[1]], '#size-cells': [[0]], 'mediatek,soft-start': [[3]], 'led@0': {'reg': [[0]], 'color': [[1]]}, 'led@1': {'reg': [[1]], 'color': [[2]]}, 'led@2': {'reg': [[2]], 'color': [[3]]}}, 'led@3': {'reg': [[3]], 'function': ['indicator'], 'color': [[0]], 'led-max-microamp': [[6000]]}}
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: mt6370@34: flashlight: False schema does not allow {'compatible': ['mediatek,mt6370-flashlight'], '#address-cells': [[1]], '#size-cells': [[0]], 'led@0': {'reg': [[0]], 'led-sources': [[0]], 'function': ['flash'], 'color': [[0]], 'function-enumerator': [[1]], 'led-max-microamp': [[200000]], 'flash-max-microamp': [[500000]], 'flash-max-timeout-us': [[1248000]]}, 'led@1': {'reg': [[1]], 'led-sources': [[1]], 'function': ['flash'], 'color': [[0]], 'function-enumerator': [[2]], 'led-max-microamp': [[200000]], 'flash-max-microamp': [[500000]], 'flash-max-timeout-us': [[1248000]]}}
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/mt6370@34/charger: failed to match any schema with compatible: ['mediatek,mt6370-charger']
Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/mt6370@34/indicator: failed to match any schema with compatible: ['mediatek,mt6370-indicator']
Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/mt6370@34/flashlight: failed to match any schema with compatible: ['mediatek,mt6370-flashlight']
Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/mt6370@34/tcpc: failed to match any schema with compatible: ['mediatek,mt6370-tcpc']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

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
