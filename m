Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB3AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 13:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=04T8mppn67qTmGtwC0oW1g+NXwD1lC1MULOLAHCCVOA=; b=ttprZ8WadWsTV0
	H/VibPbH9imEO8j+lcZL3Yhi+Lbvwez2TgbOUpSKsds03LDV1OCdqeb2u6u755X3oVrDJ5rbOEjBl
	eeqbpYN5fPnivo/VAc3URzBX41EXpanC+yz7WVxvqevs3/+iC7/xDPvy2uAmKNqAtkKlAjiQm5zFb
	p/B65LPh1Y9i5c9xpERGWqzXp4pR5KdPQiYtqMDrr1ZyyZdKu5j0+JHRzPs6By16BfUXtzi6QL8XK
	rv3N0UwH10kd3NF7+qf2K9/6GhRjo8NNW3JrtqhmDcL9Rpb+q14bHKnqle5XevCFPNL2MsJwsgxb3
	79qUw/yXbaBPjS3LxxBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kD2-003rk7-UO; Mon, 13 Jun 2022 13:34:24 +0000
Received: from mail-io1-f46.google.com ([209.85.166.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kC9-003r8X-HT; Mon, 13 Jun 2022 13:33:34 +0000
Received: by mail-io1-f46.google.com with SMTP id s23so6029354iog.13;
        Mon, 13 Jun 2022 06:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=vdZfN90YQu4hf8Uqw177MbmjixkJ2AAcNrLx6oY9MCU=;
        b=vyT9HM4e1C37+nUl7yDnuVZN9YF0KDz9aV3uYXHePZFSmKR0Kdnspps45HWMRnn7Bq
         OTsteiAb2GUWFkFJB5HS9eJF7vD/vdkbqotYicMkxKUcSxp3DCg6b4XveFSkpWw+JOVS
         uaXlmhKAsgG7kBt3Bk08MH19j7GXj5j0iPGib++zo2QpcZKtc3tDU0OKT++J9a6GKafL
         tNjS1ubsiXeH835xKUVag4g3D0qRHRhd7qpTpXHQwnQL6cXjx3342tj9CNeYyfP2tCnB
         OZkof3oUHeQ20qFXPkfDDkRTTp9VP0DIniDTxwDSu5I4yStABEJVKTlEVJvxrXfHxW6K
         2zEQ==
X-Gm-Message-State: AOAM530x2Z+bjExCCcw+HUFLhTrsoka1w9xblFSOtEJb6ft+/6ieOsLA
	RTTTyeCaHV8oVDmGMYip/A==
X-Google-Smtp-Source: ABdhPJwxl/8h496O951i+ofEnsI3E+yQOwKm/ujxZmtouDcCZ56WJ1Frq7wX9lahXWnDMzS3ZoRpNQ==
X-Received: by 2002:a6b:bf46:0:b0:669:c998:6b48 with SMTP id p67-20020a6bbf46000000b00669c9986b48mr6141923iof.67.1655127206555;
        Mon, 13 Jun 2022 06:33:26 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id l16-20020a056e020e5000b002d1a16ef24dsm3870641ilk.82.2022.06.13.06.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 06:33:26 -0700 (PDT)
Received: (nullmailer pid 3564137 invoked by uid 1000);
	Mon, 13 Jun 2022 13:33:17 -0000
From: Rob Herring <robh@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: pavel@ucw.cz, robh+dt@kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, szunichen@gmail.com, lars@metafoo.de, matthias.bgg@gmail.com, daniel.thompson@linaro.org, lee.jones@linaro.org, ChiYuan Huang <cy_huang@richtek.com>, linux-leds@vger.kernel.org, linux-fbdev@vger.kernel.org, jingoohan1@gmail.com, devicetree@vger.kernel.org, jic23@kernel.org, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
In-Reply-To: <20220613111146.25221-7-peterwu.pub@gmail.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com> <20220613111146.25221-7-peterwu.pub@gmail.com>
Subject: Re: [PATCH v2 06/15] dt-bindings: mfd: Add Mediatek MT6370
Date: Mon, 13 Jun 2022 07:33:17 -0600
Message-Id: <1655127197.567546.3564136.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_063329_613004_569E9588 
X-CRM114-Status: GOOD (  11.77  )
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

On Mon, 13 Jun 2022 19:11:37 +0800, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek MT6370 binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  .../bindings/mfd/mediatek,mt6370.yaml         | 279 ++++++++++++++++++
>  .../dt-bindings/iio/adc/mediatek,mt6370_adc.h |  18 ++
>  2 files changed, 297 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/leds/backlight/mediatek,mt6370-backlight.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: backlight: False schema does not allow {'compatible': ['mediatek,mt6370-backlight'], 'mediatek,bled-channel-use': b'\x0f'}
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: charger: False schema does not allow {'compatible': ['mediatek,mt6370-charger'], 'interrupts': [[48], [68], [6]], 'interrupt-names': ['attach_i', 'uvp_d_evt', 'mivr'], 'io-channels': [[1, 5]], 'usb-otg-vbus-regulator': {'regulator-name': ['mt6370-usb-otg-vbus'], 'regulator-min-microvolt': [[4350000]], 'regulator-max-microvolt': [[5800000]], 'regulator-min-microamp': [[500000]], 'regulator-max-microamp': [[3000000]], 'phandle': [[2]]}}
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: tcpc: False schema does not allow {'compatible': ['mediatek,mt6370-tcpc'], 'interrupts-extended': [[4294967295, 4, 8]], 'connector': {'compatible': ['usb-c-connector'], 'label': ['USB-C'], 'vbus-supply': [[2]], 'data-role': ['dual'], 'power-role': ['dual'], 'try-power-role': ['sink'], 'source-pdos': [[570527844]], 'sink-pdos': [[570527944]], 'op-sink-microwatt': [[10000000]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[4294967295]]}}, 'port@1': {'reg': [[1]], 'endpoint': {'remote-endpoint': [[4294967295]]}}, 'port@2': {'reg': [[2]], 'endpoint': {'remote-endpoint': [[4294967295]]}}}}}
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: indicator: False schema does not allow {'compatible': ['mediatek,mt6370-indicator'], '#address-cells': [[1]], '#size-cells': [[0]], 'multi-led@0': {'reg': [[0]], 'function': ['indicator'], 'color': [[9]], 'led-max-microamp': [[24000]], '#address-cells': [[1]], '#size-cells': [[0]], 'led@0': {'reg': [[0]], 'color': [[1]]}, 'led@1': {'reg': [[1]], 'color': [[2]]}, 'led@2': {'reg': [[2]], 'color': [[3]]}}, 'led@3': {'reg': [[3]], 'function': ['indicator'], 'color': [[0]], 'led-max-microamp': [[6000]]}}
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: flashlight: False schema does not allow {'compatible': ['mediatek,mt6370-flashlight'], '#address-cells': [[1]], '#size-cells': [[0]], 'led@0': {'reg': [[0]], 'led-sources': [[0]], 'function': ['flash'], 'color': [[0]], 'function-enumerator': [[1]], 'led-max-microamp': [[200000]], 'flash-max-microamp': [[500000]], 'flash-max-timeout-us': [[1248000]]}, 'led@1': {'reg': [[1]], 'led-sources': [[1]], 'function': ['flash'], 'color': [[0]], 'function-enumerator': [[2]], 'led-max-microamp': [[200000]], 'flash-max-microamp': [[500000]], 'flash-max-timeout-us': [[1248000]]}}
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: backlight: mediatek,bled-channel-use: b'\x0f' is not of type 'object', 'array', 'boolean', 'null'
	From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/dt-core.yaml
Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/pmic@34/backlight: failed to match any schema with compatible: ['mediatek,mt6370-backlight']
Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/pmic@34/charger: failed to match any schema with compatible: ['mediatek,mt6370-charger']
Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/pmic@34/indicator: failed to match any schema with compatible: ['mediatek,mt6370-indicator']
Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/pmic@34/flashlight: failed to match any schema with compatible: ['mediatek,mt6370-flashlight']
Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/pmic@34/tcpc: failed to match any schema with compatible: ['mediatek,mt6370-tcpc']

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
