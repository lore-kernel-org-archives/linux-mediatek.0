Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC8ACD128D
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Apr 2024 15:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRqo8gY7+Vs23IJHKbmO6ua9EEcvx//oYAJXqXetYYA=; b=PCLdwsLgyDxNmARQGC9WXj+WOX
	qUqynxRyZ2n/N5HYaTEHPZ+iMO2lZTRt10P+tFeyfpY8XShWRD9pKXDRYD+miOOL2UoBbHL83TzDH
	oSK11EGmyjemb/pZpCNK2/dY/EiMeqHVstd8p743xl5vwobyRQnv9Nr1vGJf1XbI8UrFszr8ZH0N/
	WdE0edk4u8wwl6t+hB1+bxwu5umvPGwe6erd6i1wroiWtZrKFFyh/z+TDwvgRfzJE3h9dyExtOQ+9
	bDNV4wymPZy+Im+8o1OzjxJvTS4+GwSo170HaWCmSlT6wUxneihiK6U/UqUHjgw5TY803ddTZ2xsb
	ID14p6aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrJMb-000000089NT-2Eni;
	Mon, 01 Apr 2024 15:14:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrJMY-000000089Ma-2bEt;
	Mon, 01 Apr 2024 15:14:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9149060C96;
	Mon,  1 Apr 2024 15:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E47B0C433C7;
	Mon,  1 Apr 2024 15:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711984457;
	bh=JltTTo7L3Pqb7x/nOOqrDGh4IIDaFzvkM7xcA0ivsp8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AOYUl9CpeoWpySvUK2rUyJSDEeRhPXzAHbVHYDs5CFBnvRRj4DVrls0W7obkCxRwR
	 EEPk4esZ4pUA7/dilS17s/Z4pT5eOIpZw8WrSqXNcLxS/gaZ/37r7LWPiAHNcMAnCw
	 u6mahNDpuw8dv6REBM/9UnBLP5vur6pY73oGNmKEk75DENS31rw3hrBScSV3SGVLyq
	 1p/WGUNP10x7qJdySPicK7tP2b4nhDZCi0rjatOUbLFrXJSIYXA5VjQjzFQP3dSlWb
	 B7SLYw1B5HU/gFkCZ31mE4jx6eBMgFqPqYPIg9RIvohuUJMwNeZ6RM9zLp6LlA4eg0
	 Qjq9Q5PfDa9/g==
Date: Mon, 1 Apr 2024 10:14:14 -0500
From: Rob Herring <robh@kernel.org>
To: Kartik Agarwala <agarwala.kartik@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: dt-bindings: mt2701-wm8960: Convert to dtschema
Message-ID: <20240401151414.GA706943-robh@kernel.org>
References: <20240401043505.40972-1-agarwala.kartik@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240401043505.40972-1-agarwala.kartik@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_081418_782480_3200829B 
X-CRM114-Status: GOOD (  16.87  )
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

On Mon, Apr 01, 2024 at 10:05:05AM +0530, Kartik Agarwala wrote:
> Convert mt2701-wm890 bindings from text to dtschema. This is used by MediaTek mt77623a/n SoC.

Wrap lines at 75.

> 
> Signed-off-by: Kartik Agarwala <agarwala.kartik@gmail.com>
> ---
>  .../sound/mediatek,mt2701-wm8960.yaml         | 59 +++++++++++++++++++
>  .../bindings/sound/mt2701-wm8960.txt          | 24 --------
>  2 files changed, 59 insertions(+), 24 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/mt2701-wm8960.txt
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml
> new file mode 100644
> index 000000000..771f14a59
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt2701-wm8960.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT2701 with WM8960 CODEC
> +
> +maintainers:
> +  - Kartik Agarwala <agarwala.kartik@gmail.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt2701-wm8960-machine
> +
> +  mediatek,platform:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of MT2701 ASoC platform.
> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |

Don't need '|'.

> +      A list of the connections between audio components. Each entry is a
> +      pair of strings, the first being the connection's sink, the second
> +      being the connection's source.
> +
> +  mediatek,audio-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the WM8960 audio codec.
> +  
> +  pinctrl-names:
> +    const: default
> +
> +  pinctrl-0: true

You can drop pinctrl properties. Those are implicitly supported.

> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - mediatek,platform
> +  - audio-routing
> +  - mediatek,audio-codec
> +  - pinctrl-names
> +  - pinctrl-0
> +
> +examples:
> +  - |
> +    sound {
> +        compatible = "mediatek,mt2701-wm8960-machine";
> +        mediatek,platform = <&afe>;
> +        audio-routing =
> +            "Headphone", "HP_L",
> +            "Headphone", "HP_R",
> +            "LINPUT1", "AMIC",
> +            "RINPUT1", "AMIC";
> +        mediatek,audio-codec = <&wm8960>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&aud_pins_default>;
> +    };

