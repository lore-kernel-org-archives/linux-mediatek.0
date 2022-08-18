Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E61AC00140
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 14:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kv66vxJ0YAn/r791jElf5y4ZMDzSN2X5TyTuKb96rI=; b=0dXb1EA34qDtxFiec81XhD+o37
	Gt4ANwLwMzOKcKL8Q+jwJfyCvGxv//j+c/38+AQk1/Rb2fKp6a8r8BK9XpIJmGcDBtMTeCr0pVqTW
	vVJjknpSWqFdLpdRtxWAqbXjbui//JgfsuvLKMjZL/hQfDS9mNqlDgxmdiDM13UkWKmWHb/zTuIQs
	55UCMY8UBZCZ1EN4d9UaX8zOmOqs8ucL5vI5AONvQptoROn3LvmXEQrZ/0n6s20nVoX3usLlsuqet
	XMRJ+A89loIdZSu65Sl3HAC0GVTQ4C91DZfvhGjc50tvz9priQQKDyUN6DBNx+kVxFiG4hZPflNZU
	Nd8BO1Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOgRf-0061Dp-3Y; Thu, 18 Aug 2022 14:24:27 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOg8V-005q0n-4V
	for linux-mediatek@lists.infradead.org; Thu, 18 Aug 2022 14:04:42 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-3376851fe13so10316797b3.6
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Aug 2022 07:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=+kv66vxJ0YAn/r791jElf5y4ZMDzSN2X5TyTuKb96rI=;
        b=Au0+wmSCKtfaRR52iCMDAqCL12HsLn0096khZpro0Ew0t8wYVhkNmnONrg/gtX4k96
         KqU6CYvipoE2ICrlq95wJSsHspIK/o59+FhEYt7MQMKWobALXS0x1LsWuzqHMFehUxCi
         YP0NeqB5JRfRg5J2YPhbH/BLR9DJxpFCLU9HV7RdYVjX9Isft/lBxda118WZbu5BnSMs
         Kyo6KpXeDbTmZ800Z4BwXZYzPm846I1ECGc4S8aoIBePMG2BUy9mKnT8Ch2JLiY1vxPi
         Eu0W99CN6+L/UtTpVF6GeCVFx6gVAsBYqO9qS/Ps0Q2eYalNOwaGY1UvjyIB/GF4mKOi
         r2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=+kv66vxJ0YAn/r791jElf5y4ZMDzSN2X5TyTuKb96rI=;
        b=rOz3oCk69u1BeV8MvnnLJSGf/lCbyS3KEOHoywpoRlOWOTlNk69WyII+NG4MoWt6IK
         I4zzJj+Z8J6PCQ+tSxJfnLxj3mSSnN64A2X9aPZozNpi0dipPdTWe4PxCfX3QBXxp40c
         2YmBmm8jeU0S94STXvchc226DPQax+81txX2dhx2p7QyysR2i+lEV5/X+JASjUHtNwl0
         Q5rz8MHhffLth6L+dPHaNswg9zC7miBjeRqMsxy6Rj0gYBHy8Ek27fZ+p0AvBXxCeyWa
         nRoWKiS4B145EIScpItY/IRAKzeQlBLpMduQIX8E08FdnDVzoU7R/C8YCkzPfCaxuuQK
         5EMQ==
X-Gm-Message-State: ACgBeo2YPJ1lS7YPUwMKkdES8iJoZwIVG2DAKrFDxSImzO2uEcHvdiZ7
	7dCt7SBmCgHTaryZ8J7kM9lD7BO8HSdhKLYcS8n2cA==
X-Google-Smtp-Source: AA6agR7q18DufKU0IAifoEXyfBzC9Ih5o9isetdzMCKDhC+zW7uCM8Mj8lYx0qEqPIvSPiHSqmk3+VqMyDhz+qXZCw4=
X-Received: by 2002:a25:4986:0:b0:67b:c97f:6975 with SMTP id
 w128-20020a254986000000b0067bc97f6975mr2745146yba.520.1660831476550; Thu, 18
 Aug 2022 07:04:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220817080757.352021-1-bchihi@baylibre.com> <20220817080757.352021-3-bchihi@baylibre.com>
 <18164de9-ad28-939c-a802-69647fc65a37@linaro.org>
In-Reply-To: <18164de9-ad28-939c-a802-69647fc65a37@linaro.org>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Thu, 18 Aug 2022 16:04:00 +0200
Message-ID: <CAGuA+op3tFL6M=H2rzAB4DJn+7ve4W5vUuRc+zBrq7zQY2CX7w@mail.gmail.com>
Subject: Re: [PATCH v9,2/7] dt-bindings: thermal: Add dt-binding document for
 LVTS thermal controllers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org, 
	amitk@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org, 
	krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, james.lo@mediatek.com, 
	fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com, 
	abailon@baylibre.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_070439_220568_6E99D92D 
X-CRM114-Status: GOOD (  23.44  )
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

Hi Krzysztof,

Thank you for the reviews.
Would you please explain the meaning of "Rebase your patchset on
decent kernel tree. You seem to use something a bit old"?
It is rebased on top of linux-6.0.0-rc1.
Am I missing something?

Best regards,
Balsam

On Thu, Aug 18, 2022 at 3:48 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 17/08/2022 11:07, bchihi@baylibre.com wrote:
> > From: Alexandre Bailon <abailon@baylibre.com>
> >
> > Add dt-binding document for mt8192 and mt8195 LVTS thermal controllers.
>
> Rebase your patchset on decent kernel tree. You seem to use something a
> bit old.
>
> >
> > Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> > Co-developed-by: Balsam CHIHI <bchihi@baylibre.com>
> > Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> > ---
> >  .../thermal/mediatek,lvts-thermal.yaml        | 152 ++++++++++++++++++
> >  1 file changed, 152 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> > new file mode 100644
> > index 000000000000..31d9e220513a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> > @@ -0,0 +1,152 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/thermal/mediatek,lvts-thermal.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek SoC LVTS thermal controller
> > +
> > +maintainers:
> > +  - Yu-Chia Chang <ethan.chang@mediatek.com>
> > +  - Ben Tseng <ben.tseng@mediatek.com>
> > +
> > +description: |
> > +  LVTS (Low Voltage Thermal Sensor).
> > +  The architecture will be first used on mt8192 and mt8195.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt8192-lvts-ap
> > +      - mediatek,mt8192-lvts-mcu
> > +      - mediatek,mt8195-lvts-ap
> > +      - mediatek,mt8195-lvts-mcu
> > +
> > +  "#thermal-sensor-cells":
> > +    const: 1
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: LVTS instance registers.
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description: LVTS instance interrupts.
> > +
> > +  clocks:
> > +    maxItems: 1
> > +    description: LVTS instance clock.
>
> Skip all these three descriptions. They are obvious.
>
> > +
> > +  resets:
> > +    maxItems: 1
> > +    description: |
> > +      LVTS instance SW reset for HW AP/MCU domain to clean temporary data
> > +      on HW initialization/resume.
> > +
> > +  nvmem-cells:
> > +    minItems: 1
> > +    maxItems: 2
> > +    description: Calibration efuse data for LVTS
> > +
> > +  nvmem-cell-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +    description: Calibration efuse cell names for LVTS
> > +
> > +allOf:
> > +  - $ref: thermal-sensor.yaml#
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8192-lvts-ap
> > +              - mediatek,mt8192-lvts-mcu
> > +    then:
> > +      properties:
> > +        nvmem-cells:
> > +          items:
> > +            - description: Calibration efuse data for LVTS
> > +
> > +        nvmem-cell-names:
> > +          items:
> > +            - const: lvts_calib_data1
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - mediatek,mt8195-lvts-ap
> > +              - mediatek,mt8195-lvts-mcu
> > +    then:
> > +      properties:
> > +        nvmem-cells:
> > +          items:
> > +            - description: Calibration efuse data 1 for LVTS
> > +            - description: Calibration efuse data 2 for LVTS
> > +
> > +        nvmem-cell-names:
> > +          items:
> > +            - const: lvts_calib_data1
> > +            - const: lvts_calib_data2
> > +
> > +required:
> > +  - compatible
> > +  - '#thermal-sensor-cells'
>
> Use consistent quotes: either ' or "
>
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - resets
> > +  - nvmem-cells
> > +  - nvmem-cell-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/clock/mt8192-clk.h>
> > +    #include <dt-bindings/reset/mt8192-resets.h>
> > +
> > +    soc {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      lvts_ap: thermal-sensor@1100b000 {
> > +        compatible = "mediatek,mt8192-lvts-ap";
> > +        #thermal-sensor-cells = <1>;
> > +        reg = <0 0x1100b000 0 0x1000>;
>
> Convention is: compatible, then reg, then the rest of properties
>
> > +        interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        clocks = <&infracfg CLK_INFRA_THERM>;
> > +        resets = <&infracfg MT8192_INFRA_RST0_THERM_CTRL_SWRST>;
> > +        nvmem-cells = <&lvts_e_data1>;
> > +        nvmem-cell-names = "lvts_calib_data1";
> > +      };
> > +
> > +      lvts_mcu: thermal-sensor@11278000 {
> > +        compatible = "mediatek,mt8192-lvts-mcu";
> > +        #thermal-sensor-cells = <1>;
> > +        reg = <0 0x11278000 0 0x1000>;
> > +        interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        clocks = <&infracfg CLK_INFRA_THERM>;
> > +        resets = <&infracfg MT8192_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
> > +        nvmem-cells = <&lvts_e_data1>;
> > +        nvmem-cell-names = "lvts_calib_data1";
> > +      };
> > +    };
>
> This part is the same as previous, so just skip it or replace with an
> example which is different somehow.
>
> Best regards,
> Krzysztof

