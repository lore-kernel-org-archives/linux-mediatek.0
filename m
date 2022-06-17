Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D91C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 22:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zh/0Zx5VR9OkdNl9GEaMHnSoW3UuL0RxbuRlgNOyx3U=; b=g8j7MqRfkOZeLualuVTRsBZN//
	BmInSRgzl//BbFzbWJF4AeKsNBS2VfKPXQ3C8oPxbh/gg/eF3uV/YS5J/efgdRx0UHxuCUM/1sGp4
	WITp+7jPsBtaynA7xHFDatLHnERz35J6RFKyfhomJwDsYiRwmdlIMtMaOFZ98BLxelT5ra+Nga/GK
	cFSq8gSbDWjN402Xc3NXyCNNHJTZM8l4tg/KlLGhqlrDqllRm0n/mSORcWXudmFZU4RBcIEwFThR9
	oQGEfGwoMu+c8sldAr8qvGK4wxGR5aQaJqFSJZmDqQioJtIVakRuwWaG9jrKXrZEH/rVpxtl0Lfdn
	FCGW+LcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Kgm-009SVI-Ud; Fri, 17 Jun 2022 22:43:40 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Kgk-009SU5-0H; Fri, 17 Jun 2022 22:43:39 +0000
Received: by mail-io1-f52.google.com with SMTP id i16so5898656ioa.6;
        Fri, 17 Jun 2022 15:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Zh/0Zx5VR9OkdNl9GEaMHnSoW3UuL0RxbuRlgNOyx3U=;
        b=dKZyA+1YZiCQPfPXX+qnAPaWUm3Pb3NWjOb41pZC9NW6hcG541JtG3kx/JJ/wRgTNj
         Klk4UxecymwKbWyMj6RB0koaUvG/aQeKu3WPdoQPDLlrbbTb6/siaHvccNLh+uD7rHtO
         NnKW6118Zex3JbHia1RwlYH00kjmL/up6UaMU7VnAfloeFFvrS6IeDn7xkg4tqx9qkkK
         i4mcD1hHxLkr1ZStcc/HAywkoCS1x6rSs7vPl3xeQ/RQc+TM989AGZl53T9Da683mOyw
         rB70Ashvj67PrATyX5pT7mJvChdRfhKWZnYdizsp8QF+LBZtl1O/+tABAK12pRqypZLT
         dhQw==
X-Gm-Message-State: AJIora+YBWioEUAS6xjprkONSIx2sAPzo9ILyvZWgq2htwo9o85g4yLT
	JBV1DuKvSLP1XU+qFlKBuw==
X-Google-Smtp-Source: AGRyM1tvyT1XZEsULmIOGU/hr9lRpu/t3yqYEU1/GhEsnQese2mFTYGyCi7NOLnTQaaRUC8jarJyVw==
X-Received: by 2002:a05:6638:d8c:b0:332:15ef:657f with SMTP id l12-20020a0566380d8c00b0033215ef657fmr6523987jaj.146.1655505814198;
        Fri, 17 Jun 2022 15:43:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id i26-20020a023b5a000000b0032b3a781781sm2734205jaf.69.2022.06.17.15.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 15:43:33 -0700 (PDT)
Received: (nullmailer pid 2574515 invoked by uid 1000);
	Fri, 17 Jun 2022 22:43:32 -0000
Date: Fri, 17 Jun 2022 16:43:32 -0600
From: Rob Herring <robh@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: pavel@ucw.cz, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, szunichen@gmail.com, lars@metafoo.de, matthias.bgg@gmail.com, Daniel Thompson <daniel.thompson@linaro.org>, lee.jones@linaro.org, ChiYuan Huang <cy_huang@richtek.com>, linux-leds@vger.kernel.org, linux-fbdev@vger.kernel.org, jingoohan1@gmail.com, devicetree@vger.kernel.org, jic23@kernel.org, linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org
Subject: Re: [PATCH v2 06/15] dt-bindings: mfd: Add Mediatek MT6370
Message-ID: <20220617224332.GA2570673-robh@kernel.org>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-7-peterwu.pub@gmail.com>
 <1655127197.567546.3564136.nullmailer@robh.at.kernel.org>
 <CABtFH5JPu5tOg4wGJf5ay1-NJHLcPTK4XxADGTksHW1-6wjMRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABtFH5JPu5tOg4wGJf5ay1-NJHLcPTK4XxADGTksHW1-6wjMRQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_154338_092331_3256CF60 
X-CRM114-Status: GOOD (  17.58  )
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

On Fri, Jun 17, 2022 at 07:15:49PM +0800, ChiaEn Wu wrote:
> Hi Rob,
> 
> Rob Herring <robh@kernel.org> 於 2022年6月13日 週一 晚上9:33寫道：
> >
> > On Mon, 13 Jun 2022 19:11:37 +0800, ChiaEn Wu wrote:
> > > From: ChiYuan Huang <cy_huang@richtek.com>
> > >
> > > Add Mediatek MT6370 binding documentation.
> > >
> > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > > ---
> > >  .../bindings/mfd/mediatek,mt6370.yaml         | 279 ++++++++++++++++++
> > >  .../dt-bindings/iio/adc/mediatek,mt6370_adc.h |  18 ++
> > >  2 files changed, 297 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> > >  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
> > >
> >
> > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > ./Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/leds/backlight/mediatek,mt6370-backlight.yaml
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: backlight: False schema does not allow {'compatible': ['mediatek,mt6370-backlight'], 'mediatek,bled-channel-use': b'\x0f'}
> >         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: charger: False schema does not allow {'compatible': ['mediatek,mt6370-charger'], 'interrupts': [[48], [68], [6]], 'interrupt-names': ['attach_i', 'uvp_d_evt', 'mivr'], 'io-channels': [[1, 5]], 'usb-otg-vbus-regulator': {'regulator-name': ['mt6370-usb-otg-vbus'], 'regulator-min-microvolt': [[4350000]], 'regulator-max-microvolt': [[5800000]], 'regulator-min-microamp': [[500000]], 'regulator-max-microamp': [[3000000]], 'phandle': [[2]]}}
> >         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: tcpc: False schema does not allow {'compatible': ['mediatek,mt6370-tcpc'], 'interrupts-extended': [[4294967295, 4, 8]], 'connector': {'compatible': ['usb-c-connector'], 'label': ['USB-C'], 'vbus-supply': [[2]], 'data-role': ['dual'], 'power-role': ['dual'], 'try-power-role': ['sink'], 'source-pdos': [[570527844]], 'sink-pdos': [[570527944]], 'op-sink-microwatt': [[10000000]], 'ports': {'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg': [[0]], 'endpoint': {'remote-endpoint': [[4294967295]]}}, 'port@1': {'reg': [[1]], 'endpoint': {'remote-endpoint': [[4294967295]]}}, 'port@2': {'reg': [[2]], 'endpoint': {'remote-endpoint': [[4294967295]]}}}}}
> >         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: indicator: False schema does not allow {'compatible': ['mediatek,mt6370-indicator'], '#address-cells': [[1]], '#size-cells': [[0]], 'multi-led@0': {'reg': [[0]], 'function': ['indicator'], 'color': [[9]], 'led-max-microamp': [[24000]], '#address-cells': [[1]], '#size-cells': [[0]], 'led@0': {'reg': [[0]], 'color': [[1]]}, 'led@1': {'reg': [[1]], 'color': [[2]]}, 'led@2': {'reg': [[2]], 'color': [[3]]}}, 'led@3': {'reg': [[3]], 'function': ['indicator'], 'color': [[0]], 'led-max-microamp': [[6000]]}}
> >         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: pmic@34: flashlight: False schema does not allow {'compatible': ['mediatek,mt6370-flashlight'], '#address-cells': [[1]], '#size-cells': [[0]], 'led@0': {'reg': [[0]], 'led-sources': [[0]], 'function': ['flash'], 'color': [[0]], 'function-enumerator': [[1]], 'led-max-microamp': [[200000]], 'flash-max-microamp': [[500000]], 'flash-max-timeout-us': [[1248000]]}, 'led@1': {'reg': [[1]], 'led-sources': [[1]], 'function': ['flash'], 'color': [[0]], 'function-enumerator': [[2]], 'led-max-microamp': [[200000]], 'flash-max-microamp': [[500000]], 'flash-max-timeout-us': [[1248000]]}}
> >         From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb: backlight: mediatek,bled-channel-use: b'\x0f' is not of type 'object', 'array', 'boolean', 'null'
> >         From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/dt-core.yaml
> > Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/pmic@34/backlight: failed to match any schema with compatible: ['mediatek,mt6370-backlight']
> > Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/pmic@34/charger: failed to match any schema with compatible: ['mediatek,mt6370-charger']
> > Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/pmic@34/indicator: failed to match any schema with compatible: ['mediatek,mt6370-indicator']
> > Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/pmic@34/flashlight: failed to match any schema with compatible: ['mediatek,mt6370-flashlight']
> > Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:0:0: /example-0/i2c/pmic@34/tcpc: failed to match any schema with compatible: ['mediatek,mt6370-tcpc']
> >
> 
> Before we submitted these patches, we had already checked by running
> this command below,
> "make DT_CHECKER_FLAGS=-m dt_binding_check
> DT_SCHEMA_FILES=Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml".
> But we could not find any errors like your error msg after the checking process.
> 
> Our mfd dt-binding patch is dependent on "backlight dt-binding",
> "charger dt-binding", "tcpc dt-binding", "indicator dt-binding" and
> "flashlight dt-binding" patches.
> Would you please apply them before you check mfd dt-binding patch?

That is what is done. Not sure what happened here though.

Rob

