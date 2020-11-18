Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85079C56201
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 21:23:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 091E42100A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 21:23:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KvldCyVZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 091E42100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GgwAkY/8yLEX0/qX2s2Jyy7rt8vO5CmWRi/+MpYb+Wc=; b=KvldCyVZ8gWVZ0Sia3XKos1DG
	jm372LA+w32kcIdHsYlPyOgRyRW++U/jnhIEAEb8dXbixGbiRjqbrvEj1xqXvMzF1CX53/81KMtcU
	fSzFuln8SEMTzKTq9b4uyIp5PnVk03MPyjRAi9gT7LWB4zXv75of55/VysGa6ojlC8EaAPAZFQqnI
	Xr7zyLnanacySgiecOIeTpBwtbwpqcPPoaX79UUoGWszhfGB4MMh1Ujdm1En2XeryeoWw/KADNePP
	5C04ImU6YNOhqAgWVdIDh5r+G89xTMsGyQWAEvOxPehuqLe3rNa7oG9pYKoEGzzXorUnvt9uIe7LK
	RNmGpy5kw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfUva-0001zz-VQ; Wed, 18 Nov 2020 21:23:46 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfUvW-0001yj-Nu; Wed, 18 Nov 2020 21:23:43 +0000
Received: by mail-oi1-f195.google.com with SMTP id l206so3836151oif.12;
 Wed, 18 Nov 2020 13:23:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VwNLniwC05uRP38qLvBvwBl3DAlw0ptrgVFyzGmX8aE=;
 b=CrRCLaV0EAJ9MdMcBKoQvh3DzucP3Z3mteOeJ3s05ORgNl7Zel0y4R36XypSQJiXCv
 h1/WDadKlmJ/1eWxrkCpv3TGcnGh2HxSnO+ScOlK+r89f0lYqN/JSMyXUW2SX8T1IubW
 uBjVzC5E1qqQ/cTq0A3y4Psnq+j6+2pd+/Ikzz4AAITbsFccKykivcCQMbzsKRlCqTsB
 jZuk9VxxJY95npfvSwMsgdSyFMptFyiwaIjybe7TT8cmacBN7Xps6BotMWInp36S7cJo
 s0lpKpHjWDm6IKO/VCLdpJizPpC31k3x+Zvl8b9VALrGxx7qRvi9JZoa/0BExnxXDT7I
 kXtw==
X-Gm-Message-State: AOAM533xSeuof90MGdqZlizuJc1VwjATSyDI9Fe1T6LtXeCcYlRdESVA
 hMrfDJdeIi2ARYHTkT4wBg==
X-Google-Smtp-Source: ABdhPJxGFTjxG7CJuPxoqdLsQg9S19jIx83S+QcoWMEsUa1EVmhqHhY1J3hxYWHsPEsETeEM72gnGg==
X-Received: by 2002:aca:c502:: with SMTP id v2mr728700oif.93.1605734619925;
 Wed, 18 Nov 2020 13:23:39 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id u138sm8120293oie.33.2020.11.18.13.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2020 13:23:39 -0800 (PST)
Received: (nullmailer pid 1839273 invoked by uid 1000);
 Wed, 18 Nov 2020 21:23:37 -0000
Date: Wed, 18 Nov 2020 15:23:37 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v3 01/11] dt-bindings: usb: convert usb-device.txt to
 YAML schema
Message-ID: <20201118212337.GA1838662@bogus>
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_162342_789848_00DB6B09 
X-CRM114-Status: GOOD (  17.40  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Min Guo <min.guo@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 18 Nov 2020 16:21:16 +0800, Chunfeng Yun wrote:
> Convert usb-device.txt to YAML schema usb-device.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3:
>   1. remove $nodenmae and items key word for compatilbe;
>   2. add additionalProperties;
> 
>   The followings are suggested by Rob:
>   3. merge the following patch
>     [v2,1/4] dt-bindings: usb: convert usb-device.txt to YAML schema
>     [v2,2/4] dt-bindings: usb: add properties for hard wired devices
>   4. define the unit-address for hard-wired device in usb-hcd.yaml,
>      also define its 'reg' and 'compatible';
>   5. This series is base on Serge's series:
>     https://patchwork.kernel.org/project/linux-usb/cover/20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru/
>     [v4,00/18] dt-bindings: usb: Add generic USB HCD, xHCI, DWC USB3 DT schema
> 
> v2 changes suggested by Rob:
>   1. modify pattern to support any USB class
>   2. convert usb-device.txt into usb-device.yaml
> ---
>  .../devicetree/bindings/usb/usb-device.txt    | 102 --------------
>  .../devicetree/bindings/usb/usb-device.yaml   | 125 ++++++++++++++++++
>  .../devicetree/bindings/usb/usb-hcd.yaml      |  33 +++++
>  3 files changed, 158 insertions(+), 102 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/usb-device.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/usb-device.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/intel,keembay-dwc3.example.dt.yaml: usb: #size-cells:0:0: 0 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/intel,keembay-dwc3.example.dt.yaml: usb: dwc3@34000000:compatible:0: 'snps,dwc3' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml: usb@a6f8800: #address-cells:0:0: 1 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml: usb@a6f8800: #size-cells:0:0: 0 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml: usb@a6f8800: dwc3@a600000:compatible:0: 'snps,dwc3' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ffe09000: #size-cells:0:0: 0 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ffe09000: usb@ff400000:compatible:0: 'amlogic,meson-g12a-usb' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ffe09000: usb@ff400000:compatible: ['amlogic,meson-g12a-usb', 'snps,dwc2'] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ffe09000: usb@ff400000:compatible: Additional items are not allowed ('snps,dwc2' was unexpected)
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ffe09000: usb@ff500000:compatible:0: 'snps,dwc3' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/socionext,uniphier-usb2-phy.example.dt.yaml: usb-controller: phy@0: 'compatible' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/socionext,uniphier-usb2-phy.example.dt.yaml: usb-controller: phy@1: 'compatible' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/socionext,uniphier-usb2-phy.example.dt.yaml: usb-controller: phy@2: 'compatible' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/socionext,uniphier-usb3ss-phy.example.dt.yaml: usb-glue@65b00000: #size-cells:0:0: 0 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/socionext,uniphier-usb3ss-phy.example.dt.yaml: usb-glue@65b00000: ss-phy@300:compatible:0: 'socionext,uniphier-ld20-usb3-ssphy' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/socionext,uniphier-usb3hs-phy.example.dt.yaml: usb-glue@65b00000: #size-cells:0:0: 0 was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/socionext,uniphier-usb3hs-phy.example.dt.yaml: usb-glue@65b00000: hs-phy@200:compatible:0: 'socionext,uniphier-ld20-usb3-hsphy' does not match '^usb[0-9a-f]+,[0-9a-f]+$'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/usb-hcd.yaml


See https://patchwork.ozlabs.org/patch/1402017

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
