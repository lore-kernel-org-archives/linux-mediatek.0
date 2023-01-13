Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10146C54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 14:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XIzLCHjOlK7JqT1a5riCzWdmzSSNrYyQjzpqGCHbiYA=; b=n/rXCqZdzUhdBqUQV7OCewhC0Q
	xfkhoEE5cIwBt08cknMdVOCsDdtR5gF6ArfFyU5yT0WQ+XCdKxzv/tdkumk7S4XXmmP47uhVW7cdC
	lBgBsnwT7BpvVuS9KsiS0ADsq54Ojzw2SJQYAQI4td8xFf4789MR3IlBfV+8/Ia9wpglE9DEB35pP
	wzbhRgvh2F+tc71mebzPBPWpzyHXm8uyjEnJkCz+qQPPVraArxMWwZ78EbJxbFyfuxU7LZ4LjO0ts
	QTgwojzLs98BpR5B4soPj4k0ARiGm+R2HLqWondPAMOzUzR1IFKgh8xwegCDfy7H3u4ls5A7bVzpZ
	sJiauEww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGL4w-002wiX-9J; Fri, 13 Jan 2023 14:30:46 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGL4s-002wh0-1y
	for linux-mediatek@lists.infradead.org; Fri, 13 Jan 2023 14:30:44 +0000
Received: by mail-ed1-x530.google.com with SMTP id w14so14078790edi.5
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Jan 2023 06:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XIzLCHjOlK7JqT1a5riCzWdmzSSNrYyQjzpqGCHbiYA=;
        b=rztnWigQsExyewJcT2hKS4dNXjO3uq2hIcOjtknI3x3kXg+k9eSvP/KJICjQkxKioC
         vmLRB6+DiXnqDBC0iPMAJ4ViSvIxiH1DBFPRE6CmgGqjxSSUtdtLbt+erbeQZgYand1i
         agQt5StA6tspagtctJpwprX/LV3Fhb/QzNQTLA365uepss9rQm8h9hNoTYhNsj9TpDSC
         j+ucWiWdIEDlwz+EOjCl7a/lD3Y0GUn7Yo+upDfS1EqAPHSZ6Gi1Dhf73uddnc1TKMon
         pReYdezrsTG6FwkIPI9We53kL08T1N/4mWejDPhFKH2MPa6A0lSruA59c4rkWHWXycV8
         pwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIzLCHjOlK7JqT1a5riCzWdmzSSNrYyQjzpqGCHbiYA=;
        b=5iVxEViE0D4HqRz6jrVbWjIUZuLbO5Giwn4C3JWFeGrMfVbmtrLgVznypzgtdJSoeu
         GdT9SbjdFlZUePhd6nIU1tk01FV4b4SakB/QQQVwQDL+VmyA0Gad49OwkFAEGOfXIIbI
         r533flWQ3k/r8+/otQJpmG6+CY6b+cfMSV8kBcI10tWX1miuqRGrdi6oOHzYEsrkTxUw
         nsX6DddQCqjdlfP8ly/F8t13Az9ySsyjUTzM0OhapkCMusLGU6ky3bHzYFBCt74mjDGl
         ZJlwAc1ABJAcbIm2NTrYsjv622YHv7nh4+j8r7hGA4OltmV00PTGJ3dDBx1Vo7qy6AXa
         0KFA==
X-Gm-Message-State: AFqh2kqOVtxHw+Dxku3Q9k1XHtjFz/PXcf74iNE5kUGxlqex3j7ekFvP
	OB3dWsKt/GAZvilsXXwOMZGOvWMXTJWooOvARnRkvg==
X-Google-Smtp-Source: AMrXdXuaw1xiYifqHpHgbKdJOyLfSsq/Qvd4woRbqqlxJp+p7Zqy4u4+7RifGeftB/aG1Nf4mlv0ULjps6FcYzu3d6E=
X-Received: by 2002:a05:6402:4013:b0:49a:b8ee:ef4b with SMTP id
 d19-20020a056402401300b0049ab8eeef4bmr788818eda.143.1673620239920; Fri, 13
 Jan 2023 06:30:39 -0800 (PST)
MIME-Version: 1.0
References: <20230112152855.216072-1-bchihi@baylibre.com> <20230112152855.216072-3-bchihi@baylibre.com>
 <96384f72-19aa-b038-75c6-76b0957750c7@gmail.com>
In-Reply-To: <96384f72-19aa-b038-75c6-76b0957750c7@gmail.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Fri, 13 Jan 2023 15:30:03 +0100
Message-ID: <CAGuA+ooYM3Z83igp8oVBv2Rj1t3GaUw-AoVGsaK9iHJ8REeb4w@mail.gmail.com>
Subject: Re: [PATCH v10 2/6] dt-bindings/thermal/mediatek: Add dt-binding
 document for LVTS thermal controllers
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: daniel.lezcano@linaro.org, rafael@kernel.org, amitk@kernel.org, 
	rui.zhang@intel.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	khilman@baylibre.com, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_063042_121275_B911CE64 
X-CRM114-Status: GOOD (  20.58  )
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

On Fri, Jan 13, 2023 at 12:54 PM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
>
>
>
> On 12/01/2023 16:28, bchihi@baylibre.com wrote:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> >
> > Add dt-binding document for mt8192 and mt8195 LVTS thermal controllers.
> >
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > ---
> >   .../thermal/mediatek,lvts-thermal.yaml        | 140 ++++++++++++++++++
> >   1 file changed, 140 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> > new file mode 100644
> > index 000000000000..43b8777fc1b2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> > @@ -0,0 +1,140 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/thermal/mediatek,lvts-thermal.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek SoC Low Voltage Thermal Sensor (LVTS)
> > +
> > +maintainers:
> > +  - Balsam CHIHI <bchihi@baylibre.com>
> > +
> > +description: |
> > +  LVTS is a thermal management architecture composed of three subsystems,
> > +  a Sensing device - Thermal Sensing Micro Circuit Unit (TSMCU),
> > +  a Converter - Low Voltage Thermal Sensor converter (LVTS), and
> > +  a Digital controller (LVTS_CTRL).
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt8192-lvts-mcu
> > +      - mediatek,mt8192-lvts-ap
>
> I wonder: you provide the binding description for mt8192 but no implementation
> in the driver. Are you sure the description is correct?

Hi Matthias,

Yes it is correct.
mt8192 driver implementation will be added after this series, to make
it easier to review.
Would you like to remove the binding description of mt8192 from this series?

Best regards,
Balsam.

>
> Regards,
> Matthias
>
> > +      - mediatek,mt8195-lvts-mcu
> > +      - mediatek,mt8195-lvts-ap
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +    description: LVTS reset for clearing temporary data on AP/MCU.
> > +
> > +  nvmem-cells:
> > +    minItems: 1
> > +    items:
> > +      - description: Calibration eFuse data 1 for LVTS
> > +      - description: Calibration eFuse data 2 for LVTS
> > +
> > +  nvmem-cell-names:
> > +    minItems: 1
> > +    items:
> > +      - const: lvts-calib-data-1
> > +      - const: lvts-calib-data-2
> > +
> > +  "#thermal-sensor-cells":
> > +    const: 1
> > +
> > +allOf:
> > +  - $ref: thermal-sensor.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8192-lvts-mcu
> > +              - mediatek,mt8192-lvts-ap
> > +    then:
> > +      properties:
> > +        nvmem-cells:
> > +          maxItems: 1
> > +
> > +        nvmem-cell-names:
> > +          maxItems: 1
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8195-lvts-mcu
> > +              - mediatek,mt8195-lvts-ap
> > +    then:
> > +      properties:
> > +        nvmem-cells:
> > +          maxItems: 2
> > +
> > +        nvmem-cell-names:
> > +          maxItems: 2
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - resets
> > +  - nvmem-cells
> > +  - nvmem-cell-names
> > +  - "#thermal-sensor-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/mt8195-clk.h>
> > +    #include <dt-bindings/reset/mt8195-resets.h>
> > +    #include <dt-bindings/thermal/mediatek-lvts.h>
> > +
> > +    soc {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      lvts_mcu: thermal-sensor@11278000 {
> > +        compatible = "mediatek,mt8195-lvts-mcu";
> > +        reg = <0 0x11278000 0 0x1000>;
> > +        interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
> > +        resets = <&infracfg_ao MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
> > +        nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
> > +        nvmem-cell-names = "lvts-calib-data-1", "lvts-calib-data-2";
> > +        #thermal-sensor-cells = <1>;
> > +      };
> > +    };
> > +
> > +    thermal_zones: thermal-zones {
> > +      cpu0-thermal {
> > +        polling-delay = <1000>;
> > +        polling-delay-passive = <250>;
> > +        thermal-sensors = <&lvts_mcu MT819x_MCU_LITTLE_CPU0>;
> > +        trips {
> > +          cpu0_alert: trip-alert {
> > +            temperature = <85000>;
> > +            hysteresis = <2000>;
> > +            type = "passive";
> > +          };
> > +          cpu0_crit: trip-crit {
> > +            temperature = <100000>;
> > +            hysteresis = <2000>;
> > +            type = "critical";
> > +          };
> > +        };
> > +      };
> > +    };

