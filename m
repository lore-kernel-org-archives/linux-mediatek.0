Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3D6C25B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Aug 2022 15:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5WiUIEakaBIT3EhpAEayc6sO+2fsKfDY6BFWpgB1bc=; b=pEFF81WWv4WG6G3k5BP+nuS6hv
	0PlQ7KFfnEsH1YHk8RzgSgITzFHci1biynB6ztKu2x7UvNl4+JLd4o0S69EH2sYnB0448qU4N0He9
	N33CzdfE2ugqv2MwoZwUDBZaNbXTZTwFLqtepQqfr82/qZvPQGsTqTlaA6UGjMe0WMpc4z83GiHYY
	1Iam0WIoQ6IUHGSizcn9N+cEYUP5uS+mHw8KsZzfl3fBlup1e+LygYP1WXdZ3HXmRaGT2FTIUZoOl
	5TfcWZDP8RaIibEkbA/xccCP9xa71M4q0SRJGgG6pTXZTV9nDrJfVZFeXquIHuYw1XXD2QgGXpbE1
	qv/vM4Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNydv-0040MU-7s; Tue, 16 Aug 2022 15:38:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNyde-003zu9-I6; Tue, 16 Aug 2022 15:37:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3F5E3611EC;
	Tue, 16 Aug 2022 15:37:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E562C4347C;
	Tue, 16 Aug 2022 15:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660664272;
	bh=V49dgqu/RAkWRS3001yah3EjBpkjCkpA7y5OPLHrM9Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HM6nA176MfOgvwM4aYzgxrXtkZNsyPzieWFtOM7wfa7Y6HbUs11ekwRDWDVFGGXGw
	 27V34YIPzdRIqrOl8k53roAb4tMeD5UDDV3RvxJs4/nEufjpEz3ytpRzUlb75UoX7f
	 SROELHAJ8Mbne9KSmP6mgvraDA/lHVPnonXJXTuB2h/9bkscGKgJ5nrdhIZtDpIjEo
	 kBNP11wnL1imt6wjN99dVad9lNWWj9FE1BCqH6GH4kVXnOR+yujHEy4YqWd9AVAx0H
	 WxHwbprxicMp3T+ovVm4DD6URYmFQxUHfQ68vJnbup2ojgM6/H6z1HwLET+nn0RO97
	 fcXe1fZzFaopQ==
Received: by mail-ua1-f50.google.com with SMTP id m21so275980uab.13;
        Tue, 16 Aug 2022 08:37:52 -0700 (PDT)
X-Gm-Message-State: ACgBeo0U4Nir3JL7tZrsp5PwAidVeyP0i7+lo0J4eoINRmxdjNkH8bjz
	WrkHQKmdGyXoYAUq+XeTCv2ahB4B9vqznf2zyg==
X-Google-Smtp-Source: AA6agR6P6tx9Y0Tb4qmdIdqjNQDONt+9JZtqem7UsItHKI1hbGP9NpYbZ5qL4HTr0AbwT9oos2Tvh2M0MtkHzHMsHgQ=
X-Received: by 2002:ab0:2b06:0:b0:384:c4af:107c with SMTP id
 e6-20020ab02b06000000b00384c4af107cmr8599136uar.77.1660664270971; Tue, 16 Aug
 2022 08:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220805070610.3516-1-peterwu.pub@gmail.com> <20220805070610.3516-7-peterwu.pub@gmail.com>
 <YvJdpq0MWNPQZw5c@google.com>
In-Reply-To: <YvJdpq0MWNPQZw5c@google.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 16 Aug 2022 09:37:39 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJriSbJvejCi7n50T-NaOW+GF8yb6Fi4m-GvUkggf-9kw@mail.gmail.com>
Message-ID: <CAL_JsqJriSbJvejCi7n50T-NaOW+GF8yb6Fi4m-GvUkggf-9kw@mail.gmail.com>
Subject: Re: [PATCH v7 06/13] dt-bindings: mfd: Add MediaTek MT6370
To: Lee Jones <lee.jones@linaro.org>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
	pavel@ucw.cz, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, 
	sre@kernel.org, chunfeng.yun@mediatek.com, gregkh@linuxfoundation.org, 
	jic23@kernel.org, lars@metafoo.de, lgirdwood@gmail.com, broonie@kernel.org, 
	linux@roeck-us.net, heikki.krogerus@linux.intel.com, deller@gmx.de, 
	andy.shevchenko@gmail.com, chiaen_wu@richtek.com, alice_chen@richtek.com, 
	cy_huang@richtek.com, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, szunichen@gmail.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Lee Jones <lee@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_083754_718670_C7B1CC4F 
X-CRM114-Status: GOOD (  13.60  )
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

On Tue, Aug 9, 2022 at 7:14 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Fri, 05 Aug 2022, ChiaEn Wu wrote:
>
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add MediaTek MT6370 binding documentation.
> >
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > ---
> >  .../devicetree/bindings/mfd/mediatek,mt6370.yaml   | 280 +++++++++++++++++++++
> >  include/dt-bindings/iio/adc/mediatek,mt6370_adc.h  |  18 ++
> >  2 files changed, 298 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> >  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
>
> Applied, thanks.

Without the backlight schema applied, this is the result:

./Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml: Unable
to find schema file matching $id:
http://devicetree.org/schemas/leds/backlight/mediatek,mt6370-backlight.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:
pmic@34: backlight: False schema does not allow {'compatible':
['mediatek,mt6370-backlight'], 'mediatek,bled-channel-use': b'\x0f'}
 From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:
pmic@34: charger: False schema does not allow {'compatible':
['mediatek,mt6370-charger'], 'interrupts': [[48], [68], [6]],
'interrupt-names': ['attach_i', 'uvp_d_evt', 'mivr'], 'io-channels':
[[1, 5]], 'usb-otg-vbus-regulator': {'regulator-name':
['mt6370-usb-otg-vbus'], 'regulator-min-microvolt': [[4350000]],
'regulator-max-microvolt': [[5800000]], 'regulator-min-microamp':
[[500000]], 'regulator-max-microamp': [[3000000]], 'phandle': [[2]]}}
 From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:
pmic@34: tcpc: False schema does not allow {'compatible':
['mediatek,mt6370-tcpc'], 'interrupts-extended': [[4294967295, 4, 8]],
'connector': {'compatible': ['usb-c-connector'], 'label': ['USB-C'],
'vbus-supply': [[2]], 'data-role': ['dual'], 'power-role': ['dual'],
'try-power-role': ['sink'], 'source-pdos': [[570527844]], 'sink-pdos':
[[570527944]], 'op-sink-microwatt': [[10000000]], 'ports':
{'#address-cells': [[1]], '#size-cells': [[0]], 'port@0': {'reg':
[[0]], 'endpoint': {'remote-endpoint': [[4294967295]]}}, 'port@1':
{'reg': [[1]], 'endpoint': {'remote-endpoint': [[4294967295]]}},
'port@2': {'reg': [[2]], 'endpoint': {'remote-endpoint':
[[4294967295]]}}}}}
 From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:
pmic@34: indicator: False schema does not allow {'compatible':
['mediatek,mt6370-indicator'], '#address-cells': [[1]], '#size-cells':
[[0]], 'multi-led@0': {'reg': [[0]], 'function': ['indicator'],
'color': [[9]], 'led-max-microamp': [[24000]], '#address-cells':
[[1]], '#size-cells': [[0]], 'led@0': {'reg': [[0]], 'color': [[1]]},
'led@1': {'reg': [[1]], 'color': [[2]]}, 'led@2': {'reg': [[2]],
'color': [[3]]}}, 'led@3': {'reg': [[3]], 'function': ['indicator'],
'color': [[0]], 'led-max-microamp': [[6000]]}}
 From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:
pmic@34: flashlight: False schema does not allow {'compatible':
['mediatek,mt6370-flashlight'], '#address-cells': [[1]],
'#size-cells': [[0]], 'led@0': {'reg': [[0]], 'led-sources': [[0]],
'function': ['flash'], 'color': [[0]], 'function-enumerator': [[1]],
'led-max-microamp': [[200000]], 'flash-max-microamp': [[500000]],
'flash-max-timeout-us': [[1248000]]}, 'led@1': {'reg': [[1]],
'led-sources': [[1]], 'function': ['flash'], 'color': [[0]],
'function-enumerator': [[2]], 'led-max-microamp': [[200000]],
'flash-max-microamp': [[500000]], 'flash-max-timeout-us':
[[1248000]]}}
 From schema: /builds/robherring/linux-dt/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/mfd/mediatek,mt6370.example.dtb:
backlight: mediatek,bled-channel-use: b'\x0f' is not of type 'object',
'array', 'boolean', 'null'
 From schema: /usr/local/lib/python3.10/dist-packages/dtschema/schemas/dt-core.yaml

