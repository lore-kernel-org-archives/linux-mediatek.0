Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013D1CD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 11:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uM8ijGuu7yF17+FRX5B4bo5qU6gi9aZi4GjPYSAo328=; b=aBLRp9t4UUYyMc0OPvhtkiClL4
	IVDAXYEckQDgTDcGMnQCgEda8JU4xWut+uDRxdSA8reStenfeOjR2rMz9zBfkGANQXkqr1aqf+QrW
	XUN3vZceTtb5zU/6Ch9sK7BLBUiwoqtjBJJKFlbcFGAgklHJYeUmlt/+2i8wAgPOoiWREpSrw0v+w
	U1Hl3BP9zrBFC0yAs66NdcDo02OzTxdUYY2hgg7qRPrUJ2+xs9GyrgyrgYJR2CrfNr1EgLU+Uy6r5
	q2SN6N1RNea3DlYSVg9/xgjBZLzTw/1Cg358EbSQLlrSYdE4BrqE8OgY7wAdBzEErvkwnO08XHGL+
	1FBkVkbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWL5-00000006gps-1U7I;
	Wed, 10 Apr 2024 11:42:03 +0000
Received: from mgamail.intel.com ([198.175.65.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruWL2-00000006goW-3Soo;
	Wed, 10 Apr 2024 11:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712749321; x=1744285321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yG0zg+oeG65EEgQu+xIv2yDk0f6ytD4/gZuu43Ic4NM=;
  b=LtZ3jsAJJ4YlMG2IUBJ/5Zbn4DqmxQwqaLRgv5RZVh8EOkfcNzqBsBUW
   srDu4lSyXE/eR4B8YQy+140E/a01dHjemDhBF6BuDZW2xvMYlYlN6zLsS
   BdXOL9fMHo3cOCzBSKoeIR4n1/DMayoLN/5EGwlYVvHS/wv60hCDabsf2
   IRtkqcIv+tcxoTPTKV7/jrpppDrT0hGk8pFhr3Z+aVF2BV/DYM0ClEByL
   6W6N8nfyMA4+Kug3jO41vzimuOThmOYV0fgzDAO5YQbj2ik/nUuWWHuJa
   HEd47yrKGzQ7QLzxezv1niExGP8nSNknwcOpqMnJqAgOnQvDWkSPBE/Ir
   w==;
X-CSE-ConnectionGUID: L0En1Ii5ScmZOltA4BdJBg==
X-CSE-MsgGUID: pc2BPgkMS6u2B56iUiJFdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11896319"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="11896319"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 04:41:59 -0700
X-CSE-ConnectionGUID: ttzm7WJaR6W2mHtBRovH1Q==
X-CSE-MsgGUID: qfAhKikZTKGbSVdCdieoTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20417691"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 04:41:52 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 93BBD1203E6;
	Wed, 10 Apr 2024 14:41:49 +0300 (EEST)
Date: Wed, 10 Apr 2024 11:41:49 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Conor Dooley <conor@kernel.org>
Cc: Zhi Mao <zhi.mao@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hans de Goede <hdegoede@redhat.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, shengnan.wang@mediatek.com,
	yaya.chang@mediatek.com, yunkec@chromium.org, 10572168@qq.com
Subject: Re: [PATCH 1/2] media: dt-bindings: i2c: add Giantec GT97xx VCM
 driver
Message-ID: <ZhZ6_WXfCdwGBdC-@kekkonen.localdomain>
References: <20240410104002.1197-1-zhi.mao@mediatek.com>
 <20240410104002.1197-2-zhi.mao@mediatek.com>
 <20240410-rice-fringe-4ae992217a2f@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410-rice-fringe-4ae992217a2f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_044200_941978_3A3C8E38 
X-CRM114-Status: GOOD (  30.65  )
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

Hi Conor, Zhi,

On Wed, Apr 10, 2024 at 12:27:07PM +0100, Conor Dooley wrote:
> Hey,
> 
> On Wed, Apr 10, 2024 at 06:40:01PM +0800, Zhi Mao wrote:
> > Add YAML device tree binding for GT97xx VCM driver,
> 
> Please don't mention drivers here, bindings are for hardware.
> 
> > and the relevant MAINTAINERS entries.
> > 
> > Signed-off-by: Zhi Mao <zhi.mao@mediatek.com>
> > ---
> >  .../bindings/media/i2c/giantec,gt97xx.yaml    | 91 +++++++++++++++++++
> >  1 file changed, 91 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/giantec,gt97xx.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/giantec,gt97xx.yaml b/Documentation/devicetree/bindings/media/i2c/giantec,gt97xx.yaml
> > new file mode 100644
> > index 000000000000..8c9f1eb4dac8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/giantec,gt97xx.yaml
> > @@ -0,0 +1,91 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +# Copyright (c) 2020 MediaTek Inc.
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/giantec,gt97xx.yaml#
> 
> Filename patching compatible please.
> 
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Giantec Semiconductor, Crop. GT97xx Voice Coil Motor (VCM)
> > +
> > +maintainers:
> > +  - Zhi Mao <zhi.mao@mediatek.com>
> > +
> > +description: |-
> > +  The Giantec GT97xx is a 10-bit DAC with current sink capability.
> > +  The DAC is controlled via I2C bus that operates at clock rates up to 1MHz.
> > +  This chip integrates Advanced Actuator Control (AAC) technology
> > +  and is intended for driving voice coil lens in camera modules.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - giantec,gt9768 # for GT9768 VCM
> > +      - giantec,gt9769 # for GT9769 VCM
> 
> I don't think these comments are needed, they should be clear from the
> compatibles, no?
> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  vin-supply: true
> > +
> > +  vdd-supply: true
> > +
> > +  giantec,aac-mode:
> > +    description:
> > +      Indication of AAC mode select.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum:
> > +      - 1    #  AAC2 mode(operation time# 0.48 x Tvib)
> > +      - 2    #  AAC3 mode(operation time# 0.70 x Tvib)
> > +      - 3    #  AAC4 mode(operation time# 0.75 x Tvib)
> > +      - 5    #  AAC8 mode(operation time# 1.13 x Tvib)
> 
> I dislike these enum based properties and I would rather this either be
> the values themselves (0.48, 0.70 etc).
> 
> > +    default: 2
> > +
> > +  giantec,aac-timing:
> > +    description:
> > +      Number of AAC Timing count that controlled by one 6-bit period of
> > +      vibration register AACT[5:0], the unit of which is 100 us.
> 
> Then the property should be in a standard unit of time, not "random" hex
> numbers that correspond to register values.
> 
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    default: 0x20
> > +    minimum: 0x00
> > +    maximum: 0x3f
> > +
> > +  giantec,clock-presc:
> > +    description:
> > +      Indication of VCM internal clock dividing rate select, as one multiple
> > +      factor to calculate VCM ring periodic time Tvib.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum:
> > +      - 0    #  Dividing Rate -  2
> > +      - 1    #  Dividing Rate -  1
> > +      - 2    #  Dividing Rate -  1/2
> > +      - 3    #  Dividing Rate -  1/4
> > +      - 4    #  Dividing Rate -  8
> > +      - 5    #  Dividing Rate -  4
> 
> Same here, you should not need these comments explaining the values, use
> an enum with meaningful values please. 
> 
> > +    default: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - vin-supply
> > +  - vdd-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        vcm@c {
> 
> "vcm" is not a generic node-name, can you use one please?
> Look around similar bindings or at the dt spec for generic node-names.

"camera-lens" would seem to be widely used. I can post patches to change
some of the rest out there that aren't aligned.

> 
> Thanks,
> Conor.
> 
> > +            compatible = "giantec,gt9768";
> > +            reg = <0x0c>;
> > +
> > +            vin-supply = <&gt97xx_vin>;
> > +            vdd-supply = <&gt97xx_vdd>;
> > +            giantec,aac-timing = <0x20>;
> > +        };
> > +    };
> > +
> > +...

-- 
Kind regards,

Sakari Ailus

