Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA72CD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 20:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzzB3nqQRudBIyBVzsCHsBXmV1ryStFH3hCr94dNizs=; b=gf4qc55+06JK6WNANBMubrhUUM
	lnFK+wj2ickISXqrCHo1tACOXO3B4C6LoBk7uF6P5vyMThf2PEPBLtMCRL1JY6CH6ooruNj9A4VA7
	dCPerW+jXdbL8S1r1NYsP4o/OfS8kjdBeYeJAcb5r80vae7eECUIQjOx1av2OFfIX/wTRM11SFxn/
	irZrWTwl6FfMkDTM2VZfH0rbNsY32s02ezxio8cU5EqfifydJl+5m50cLXELo+LybevKL/4SjNRXO
	mVIq4Hd2Z4UE443R1zhzXlEAgFnBchthXYZzccvOB7gCjlqtQDF32D7J7SU19DcUv2jz83/0YbkhF
	fncphnvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruew8-00000008uKw-2nin;
	Wed, 10 Apr 2024 20:52:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruew4-00000008uI9-12J1;
	Wed, 10 Apr 2024 20:52:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8678A61EF7;
	Wed, 10 Apr 2024 20:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E348CC433C7;
	Wed, 10 Apr 2024 20:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712782367;
	bh=N38KD+SiZS1U4XcfM3Ay0nwghgVyE56H0CZwBOKGYX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DTkCloQ+PnMVIErVzlkWkCxPmRqK8GauL+JqEFrb48YRzYgVQyV8Aip9J0UvT9En9
	 LsfpdpHQ/+duzNJhs65P56FnjIgvs31L2TfFRv3p0y5CZI1eCnyu6P+IvQ2sR1hrTe
	 faZahArzV7TpookNkNNoXWLEyRUB3KfCcd31MFueXfG55TGHVwDBeYFHzRMrfM0zI9
	 irHJ2heLvubaXvjDDDSfpB0FhmZukUp37jpytNLTTtXCoJ+WORQOLcRc4YjhAcxQuK
	 yBOJVUklSAsD4G2z2dSuFjBTOUMX9J2cDdJclsrySj7+TVPEH/oFinnojQL9GLhAkG
	 3aCZNFFH1bAZg==
Date: Wed, 10 Apr 2024 15:52:44 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Zhi Mao <zhi.mao@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
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
Message-ID: <20240410205244.GA1290088-robh@kernel.org>
References: <20240410104002.1197-1-zhi.mao@mediatek.com>
 <20240410104002.1197-2-zhi.mao@mediatek.com>
 <20240410-rice-fringe-4ae992217a2f@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410-rice-fringe-4ae992217a2f@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_135248_396197_99D39CB5 
X-CRM114-Status: GOOD (  25.03  )
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

Except that those would have to be strings for floats or fractions. For 
properties which have little chance of being something common and aren't 
any form of standard unit, I think it is fine to just use the h/w 
specific values. 

The first question to ask whether these parameters are common to 
all/many voice coil motors?


> > +    default: 2
> > +
> > +  giantec,aac-timing:
> > +    description:
> > +      Number of AAC Timing count that controlled by one 6-bit period of
> > +      vibration register AACT[5:0], the unit of which is 100 us.
> 
> Then the property should be in a standard unit of time, not "random" hex
> numbers that correspond to register values.

Here, I agree.

Rob

