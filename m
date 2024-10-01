Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9084CEB2FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 06:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYZIRBXYhRSaFyOA+6XTCmHm160Kd2J7/rPtmlgRqyw=; b=G9VptJapYlfiCkFAuTpeWR/X/f
	rqSeEBOlDUbSB/HToZlP6om8Wbf0m070DHI0L7F4lUgd36C5GirhxAutO/a1/JoAVrSwxaZv4zEBK
	fggUGtB9ybxQ2Omy8o0NFOtUsaQwC5vgY20RXmUeZdgC+LxbH7pObqJZDYd4JcrYwDZGQ9O4SNegQ
	mGIZxowDjvRzmwQ8Oo1eXj/hFMgy77W7ne9TWv22YqjARSRYMmUVBDcmDcI+YOWe/a2HmYUPmDAie
	RuS1Z0fbg2DNbMe/LluHZlpupBHxqPlTLrOUhQ720Lsc6J563ONxKpT3Mg4RuV0mEHMII1tiOHEKt
	0d1Dh+2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svWUW-00000001lse-3Mbz;
	Tue, 01 Oct 2024 06:36:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svWNk-00000001khe-3bOk;
	Tue, 01 Oct 2024 06:29:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A9C55C4B58;
	Tue,  1 Oct 2024 06:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC49C4CEC6;
	Tue,  1 Oct 2024 06:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727764151;
	bh=0XqIWLSy+r1tAJqu9dtKMYNrWWKnDsQbZXqh+mGvbpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ClxzX++YUuvJ3p1LbcwvLLoR0bG747zASAaHUnYOKQfMNbz77FvcrcInkXxyvHPxc
	 1zrLnUepPkjPAzv7ZWA00nln6ZIlLG8mO2Boz4yYxAugcfg7mqR/tuP99spZABoZij
	 4aWJCT2dslclOzQ57GloMaQ3OHBKCFzCAn18Yef4TohxqHrZ+GB+na9Kk7vVquPiG7
	 R/4ANhqGbhioQMljr/59MmgeN+Q760Y1wNEnrISrAKzcHqqe1nWU7gF/i1rczTmPG8
	 7AM+HkxTDZOU8RBJRgZTMmfvoqriNEWkdoRYZwDn3gW+3QFJO0RNVFdwdVK/gTtUxL
	 x9cZAl4+cTIgQ==
Date: Tue, 1 Oct 2024 08:29:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-sound@vger.kernel.org, 
	Alexandre Mergnat <amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, 
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, 
	Chris-qj chen <chris-qj.chen@mediatek.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v7 3/3] dt-bindings: mfd: mediatek: mt6397: Convert to DT
 schema format
Message-ID: <psjwbo2vecr54vmz5ib2eurhpcaynpc67rc2nwuj2gtej6gqiu@4ysahn2ghthf>
References: <20240930073311.1486-1-macpaul.lin@mediatek.com>
 <20240930073311.1486-3-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240930073311.1486-3-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_232913_015966_B1F07219 
X-CRM114-Status: GOOD (  18.39  )
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

On Mon, Sep 30, 2024 at 03:33:11PM +0800, Macpaul Lin wrote:
> Convert the mfd: mediatek: mt6397 binding to DT schema format.
> 
> MT6323, MT6358, and MT6397 are PMIC devices with multiple function
> subdevices. They share a common PMIC design but have variations in
> subdevice combinations.
> 
> Key updates in this conversion:
> 
> 1. RTC:
>    - Convert rtc-mt6397.txt and merge into parent MT6397 PMIC DT schema.
> 
> 2. Regulators:
>    - Align to generic name "regulators".
>    - Update references from .txt to .yaml for mt6323, mt6358, and mt6397
>      regulators.
>    - Simplify regulator name labels in device tree examples.
>    - Add a new 'mt6359-regulator' to the compatibles of regulators.

Why?

>      Merge from the other patch [1].
> 
> 3. ADC:
>    - Add a new 'adc' property and include a $ref for sub-device node of
>      MT6359 PMIC AUXADC: 'mediatek,mt6359-auxadc'.
>      Merge from the other patch [1].
> 
> 4. Audio Codec:
>    - Simplify Audio Codec part with updating compatible items.
>    - Add 'mt6359-codec' to the compatible

Why?
.
> 
> 5. Clocks:
>    - Align to generic name "clocks" for clockbuffer subdevices.
> 
> 6. LEDs:
>    - Convert leds-mt6323.txt and merge into parent MT6397 PMIC DT schema.
>    - Update LED binding.
> 
> 7. Keys:
>    - Add detailed descriptions for power and home keys.
>    - Add compatible: mediatek,mt6358-keys.
> 
> 8. Power Controller:
>    - Convert mt6323-poweroff.txt and merge into parent MT6397 PMIC DT
>      schema.
>    - Add #power-domain-cells property to fix dt-binding check error.
>    - Clarify "BBPU" as "Baseband power up".
> 
> 9. Pinctrl:
>    - Align to generic name "pinctrl" instead of "pin-controller".
> 
> 10. Compatible:
>    - Drop "mediatek,mt6357" since there is a separated DT Schema
>      for PMIC MT6357.
> 
> 11. Examples:
>    - MT6323: Retain complete examples for this PMIC.
>    - MT6358 and MT6397: simplify settings in regulators.
>     - Preserve "audio-codec", "clocks", "pinctrl", "rtc", and "keys"
>       sections as they contain typical settings for different PMICs.
> 
> Additional updates:
> - MAINTAINERS: Add co-maintainers and reference to
>   mfd/mediatek,mt6397.yaml for LED and power-controller drivers.
> - input/mediatek,pmic-keys.yaml: Update reference to
>   mfd/mediatek,mt6397.yaml.
> 
> References:
> [1] https://lore.kernel.org/all/20240925171156.9115-1-macpaul.lin@mediatek.com/
> 
> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---

> +
> +  adc:
> +    type: object
> +    $ref: /schemas/iio/adc/mediatek,mt6359-auxadc.yaml#
> +    unevaluatedProperties: false
> +
> +  audio-codec:
> +    type: object
> +    description:
> +      Audio codec support with MT6358, MT6359, and MT6397.
> +    additionalProperties: true

No, this cannot be true. Schema is incomplete for listed compatibles.

> +
> +    properties:
> +      compatible:
> +        oneOf:
> +          - enum:
> +              - mediatek,mt6358-sound
> +              - mediatek,mt6359-codec

There was no such compatible.

Why do you add non-existing compatibles during conversion?


