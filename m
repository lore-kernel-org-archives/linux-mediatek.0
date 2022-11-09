Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72CEC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 22:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qutKClpaMtj7cgQ2BDKv2YC/ArzsyxTBFqjgebWdeE=; b=EqrunvgojfhqSQYJfVsbGUl96v
	A6gphEYIWj1kWiGieww24mW739lmWcR2MWtX13n9zT5l8wMFl6oiYg+aDx/YZ1xiS5j9Xah68cA1c
	SYgxfxFcRPNtFk8cW35xAmIcmeeMrZIXG1BJkGvsLw0/gGNT6iNRLc33MErP5qabDeU7fJFHd1ymG
	nllkFkXfCfh8tIpJK0g/aF3jkhFDQlTZ9BM/A4sFRHSxFcKrakYx9Uf8Bqdjiyd41X3huzC11J/pj
	yBDvdhp4NOjdiyJYLRF7XnQYvOv6GEE6TaJ0lN11l0c2bf6YvGzp9tnFaIEaYnZt48Fgv1IoTSHio
	LQiNTN3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osu0y-000SmA-KM; Wed, 09 Nov 2022 22:57:48 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osu0l-000SdN-5c; Wed, 09 Nov 2022 22:57:37 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6BDBAFF802;
	Wed,  9 Nov 2022 22:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668034642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4qutKClpaMtj7cgQ2BDKv2YC/ArzsyxTBFqjgebWdeE=;
	b=Wj1QADdKc4kzuieut1F0r5KxBkYYWxjNrJNQK9hOurYpohcXx3snCxMxmQoMuBlHDO7Usd
	bAuP4MhygFBfrCrUc222hussBxd4Gw+jKFZezkTx0u0q4dq5TsEbPpSrCJfHsoAwBHfrLC
	B6cdwRgshTy65gyZ8qh6N9yKmBCxckwyuzvikA1Pwkgn4R1++tcKrvbeCrnOE/staWDqk5
	GFsE2D0Y4f4iY+mKn1/rHBnnDgYnT+0Ti1f8dUOQgUG4BD21C5VwaX3CYsjR1Hz2ESw3JF
	tU6xpxAePf4T5DIt/cu4ZSu+e+ivp1Lxz63RNurtq4QE2EXMM5pylre+etBRrg==
Date: Wed, 9 Nov 2022 23:57:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
	Fabien Parent <fabien.parent@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee@kernel.org>, Chen Zhong <chen.zhong@mediatek.com>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Pavel Machek <pavel@ucw.cz>, Liam Girdwood <lgirdwood@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>, linux-rtc@vger.kernel.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: Re: [PATCH v4 2/9] dt-bindings: rtc: mediatek: convert MT6397 rtc
 documentation
Message-ID: <Y2wwUOJ0KZdt1tZ6@mail.local>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-2-5d2bb58e6087@baylibre.com>
 <20221109222916.GA2985917-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109222916.GA2985917-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_145735_525335_D4D07D87 
X-CRM114-Status: GOOD (  24.08  )
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

On 09/11/2022 16:29:16-0600, Rob Herring wrote:
> On Tue, Nov 08, 2022 at 07:43:37PM +0100, Alexandre Mergnat wrote:
> > - Convert rtc/rtc-mt6397.txt to rtc/mt6397-rtc.yaml
> > - Add mediatek,mt6357-rtc compatible.
> > - Add maintainer
> > - Remove the .txt binding file
> > 
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/mt6397.txt   |  2 +-
> >  .../bindings/rtc/mediatek,mt6397-rtc.yaml          | 40 ++++++++++++++++++++++
> >  .../devicetree/bindings/rtc/rtc-mt6397.txt         | 31 -----------------
> >  3 files changed, 41 insertions(+), 32 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
> > index 0088442efca1..79aaf21af8e9 100644
> > --- a/Documentation/devicetree/bindings/mfd/mt6397.txt
> > +++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
> > @@ -33,7 +33,7 @@ Optional subnodes:
> >  		- compatible: "mediatek,mt6331-rtc"
> >  		- compatible: "mediatek,mt6358-rtc"
> >  		- compatible: "mediatek,mt6397-rtc"
> > -	For details, see ../rtc/rtc-mt6397.txt
> > +	For details, see ../rtc/mediatek,mt6397-rtc.yaml
> >  - regulators
> >  	Required properties:
> >  		- compatible: "mediatek,mt6323-regulator"
> > diff --git a/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
> > new file mode 100644
> > index 000000000000..bb48c0150f95
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.yaml
> > @@ -0,0 +1,40 @@
> > + # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/rtc/mediatek,mt6397-rtc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MediaTek MT6397/MT6366/MT6358/MT6357/MT6323 RTC
> > +
> > +maintainers:
> > +  - Alexandre Mergnat <amergnat@baylibre.com>
> > +
> > +description: |
> > +  MediaTek PMIC based RTC is an independent function of MediaTek PMIC that works
> > +  as a type of multi-function device (MFD). The RTC can be configured and set up
> > +  with PMIC wrapper bus which is a common resource shared with the other
> > +  functions found on the same PMIC.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt6323-rtc
> > +      - mediatek,mt6357-rtc
> > +      - mediatek,mt6358-rtc
> > +      - mediatek,mt6366-rtc
> > +      - mediatek,mt6397-rtc
> 
> As this is only a compatible string, just fold this into the MFD schema 
> doc.

Actually, it probably also supports the start-year property

> 
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +
> > +examples:
> > +  - |
> > +    pmic {
> > +        compatible = "mediatek,mt6397";
> > +
> > +        rtc {
> > +               compatible = "mediatek,mt6397-rtc";
> > +        };
> > +    };

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

