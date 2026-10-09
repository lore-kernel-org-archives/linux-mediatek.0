Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6610BCA5FED
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2026 07:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qI+415q4E5u/K30Ei0He1md1f8jr5YcEgEriT1ap3tw=; b=uAq0OcvA//T9bk/5wZ1rFJu4rn
	jU+6KkOk2GWfIll3j7uVgWtbNpzgOMgtXUqz9G1GAjEpohzw9m5fMdxK6/SE68s9qOt9Qh4hsRUbd
	C/in2Wb/NS8PWMTrSxODKLO9TPKBirXvnJ3b9Xedk1dvO//HT4e/bskDMVTghEUGtF+9Gp2nwKVU8
	Uh6690wPADPPDy2QeCfRdLOP5GcC27Ag1san/9grWFrEbGNPWfqwg5obBqzKrboy2MLWHJDxZ/4fM
	rqmgZc3x1ub9EYnyHOUD6iHT5QCmWIta2eoBwbnRuKcKyde/UvxBKGv8nfv1F5syL8HdtTP09QRqP
	zBxKp7eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4rf-00000005hoi-2JQl;
	Fri, 09 Oct 2026 07:17:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4rd-00000005hoM-2FxZ;
	Fri, 09 Oct 2026 07:17:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AEBCA602C3;
	Fri,  9 Oct 2026 07:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37961F000FF;
	Fri,  9 Oct 2026 07:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791530276;
	bh=qI+415q4E5u/K30Ei0He1md1f8jr5YcEgEriT1ap3tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h9FEAAmJC9FwS+gXSVDcQG2rNWk/F0ybQyI6n7qzSoip58Nl9ThMoyvqF+6WcgQL5
	 kqUeOASwzAl9jrF09PpglkvIK82uu4OUH2tliTQ+1GYS/Q3VM+oBRCJ94qgdYpvAe6
	 8WyWXY6EAJE3vbPHBeE3eS5G2jx4jE/VZmm0UKoXOzU0dAbvFPzItfZKlfmG0n+8jq
	 FIOI8qu07S2kMlItCyKzr/DotJp2tYgIWKs4Kf7a+nd/bIv4aYaQ7YFxK2ZX8o+Ssj
	 5ePs4YSReTuDQnwi9wFotP7OKwOAA2xepcLR59pgzbsv4pVQrJ0So9NW4U2cw0lVNe
	 j65j+vgpPjjTA==
Date: Fri, 9 Oct 2026 09:17:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 05/21] ASoC: dt-bindings: Add binding for Apple
 Silicon Mac audio
Message-ID: <20261009-daring-objective-flounder-c0b66d@quoll>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>
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

On Sun, Oct 04, 2026 at 04:03:32PM +1000, James Calligeros wrote:
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - apple,j180-macaudio
> +              - apple,j274-macaudio
> +              - apple,j293-macaudio
> +              - apple,j313-macaudio
> +              - apple,j314-macaudio
> +              - apple,j316-macaudio
> +              - apple,j375-macaudio
> +              - apple,j413-macaudio
> +              - apple,j415-macaudio
> +              - apple,j473-macaudio
> +              - apple,j456-macaudio
> +              - apple,j457-macaudio

Keep this list sorted.

> +      - items:
> +          - enum:
> +              - apple,j493-macaudio
> +          - const: apple,j293-macaudio

...

> +  model:
> +    description:
> +      Model name for presentation to users
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +patternProperties:
> +  "^dai-link(@[0-9a-f]+)?$":
> +    description: |
> +      Node for each sound peripheral such as the speaker array, headphones jack,
> +      or microphone.
> +    type: object
> +    $ref: tdm-slot.yaml#
> +

Drop blank line

> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      link-name:
> +        description: Name for the peripheral
> +        enum: [ Headphone Jack, Speaker, Speakers ]
> +        $ref: /schemas/types.yaml#/definitions/string
> +
> +      codec:
> +        type: object
> +

Drop blank line

> +        additionalProperties: false
> +
> +        properties:
> +          sound-dai:
> +            minItems: 1
> +            maxItems: 8
> +            description: |
> +              DAI list with the CODEC-side DAIs connected to the above CPU-side
> +              DAIs and involved in this sound peripheral.
> +
> +              The list is in left/right order if applicable. If there are more
> +              than one CPU-side DAIs (there can be two), the CODECs must be
> +              listed first those connected to the first CPU, then those
> +              connected to the second.
> +
> +              In addition, on some machines with many speaker codecs, the CODECs
> +              are listed in this fixed order:
> +
> +              Four speakers: Left Front, Left Rear, Right Front, Right Rear
> +              Six speakers: Left Woofer 1, Left Tweeter, Left Woofer 2,
> +                            Right Woofer 1, Right Tweeter, Right Woofer 2
> +
> +        required:
> +          - sound-dai
> +
> +      cpu:
> +        type: object
> +

Drop blank line

> +        additionalProperties: false
> +
> +        properties:
> +          sound-dai:
> +            minItems: 1
> +            maxItems: 2
> +            description: |
> +              DAI list with CPU-side I2S ports involved in this peripheral.
> +
> +        required:
> +          - sound-dai
> +
> +    patternProperties:
> +      "^dai-tdm-idle-mode-[0-9]$":
> +        $ref: tdm-slot.yaml#/properties/dai-tdm-idle-mode

This looks like you put several slots into one. TDM slot is for one
slot, no?

> +
> +      "^dai-tdm-slot-tx-idle-mask-[0-9]$":
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Idle slot mask. A bit being set to 1 indicates
> +          that the corresponding TDM slot is inactive/idle.
> +
> +    required:
> +      - reg
> +      - codec
> +      - cpu
> +
> +required:
> +  - compatible
> +  - model
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound {
> +      compatible = "apple,j416-macaudio", "apple,j316-macaudio";
> +      model = "MacBook Pro J416";
> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      dai-link@0 {
> +        reg = <0>;
> +        link-name = "Speakers";
> +
> +        dai-tdm-idle-mode-0 = "zero";
> +        dai-tdm-idle-mode-3 = "zero";
> +        dai-tdm-slot-tx-idle-mask-0 = <0xf0f0f0>;
> +        dai-tdm-slot-tx-idle-mask-3 = <0x0f0f0f>;
> +
> +        codec {
> +          sound-dai = <&speaker_left_woof1>,
> +                      <&speaker_left_tweet>,
> +                      <&speaker_left_woof2>,
> +                      <&speaker_right_woof1>,
> +                      <&speaker_right_tweet>,
> +                      <&speaker_right_woof2>;
> +        };
> +
> +        cpu {
> +          sound-dai = <&mca 0>, <&mca 1>;
> +        };
> +      };
> +
> +      dai-link@1 {
> +        reg = <1>;
> +        link-name = "Headphone Jack";
> +
> +        codec {
> +          sound-dai = <&jack_codec>;
> +        };
> +
> +        cpu {
> +          sound-dai = <&mca 2>;

Example looks incomplete, you miss TDM slot properties.

> +        };
> +      };
> +    };
> 
> -- 
> 2.55.0
> 

