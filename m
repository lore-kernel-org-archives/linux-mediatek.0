Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F94C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 16:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/z8QKfMMd+WonlTY8n0DPm8aF8FNJazKFMMzbtj3WIs=; b=xTX4M+e3p6kVXMjP4gBNCSusU+
	2fqwt8zdC306/aUFFVRL+1DsIXdjZfW2AUuays3qPmYhv2hCpCDkJCOUU17WAAIPUuqSyfigZly40
	YWB1uGPaV1RPkM2UWG4zMvAtjjDGmjy3gRCal1/VcW6b81NBSkg4kGBMjSU/brDX7YpjxEa1Bzwi6
	nd900pVGGo9+P3HOQdIcIlm8LnFoCLgrosRkIJSiP6ekX8F6Ip2f3ccNx2AbB3xOo9EftKvvONotu
	MWqgGyxhSWLAT8GrvmX8mWKvXm3cLKmjYBSTjkwdxoJo7rurft73OFtY2q3NoEpxAn/CBzJMHSUxk
	mUp+rMLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofOT3-006pw2-AH; Mon, 03 Oct 2022 16:38:57 +0000
Received: from mail-oo1-f47.google.com ([209.85.161.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofOT0-006pvC-Kq; Mon, 03 Oct 2022 16:38:56 +0000
Received: by mail-oo1-f47.google.com with SMTP id t4-20020a4aa3c4000000b00475624f2369so7120337ool.3;
        Mon, 03 Oct 2022 09:38:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=/z8QKfMMd+WonlTY8n0DPm8aF8FNJazKFMMzbtj3WIs=;
        b=Emi623G4qAduchg8CLJR3EMFpv2gJj3VtCRq/HUjZsSOE7x9UkINJrJKZYJeM12TMh
         xmlLT3nn1guPm4tZdQ0gdbC4bNHsRk6ew0KHadG91y7rDUSCGAYOnploRD7nBtRXh5J8
         sNrHk+4+Q2rCja7V9E73ka6/WZI697kiv1Mip7lIl9D3q3yLsB22f9twkIDSvj5K2IzM
         luPk/g289Afnmo1+Y/znHxrboyecoOfxzmMZeSAVzPzylJlvc+jTFgdPu5XQZYAudJCT
         pDKPruDoi7JZCJs+FoCJ/NSWYGtYKq0M6Pb7odR2ZBPoL6b+CLap1nNfq74Ghgv0hGB5
         c2fg==
X-Gm-Message-State: ACrzQf33OsfWK5UqGB6Fa9hTukGqzFioo1u0PtpbKJ76Gxl6xoxILhMr
	UndrjzIVzcqsc963BRl48pNGqw8R8g==
X-Google-Smtp-Source: AMsMyM4lszwFBCq6xZtL8Y5wePiwpGG3IHD7bBaryZPr5QpC4yM9+bd2vnHC3Cb5CLrmbhQmc34z8A==
X-Received: by 2002:a9d:4c83:0:b0:655:f666:801d with SMTP id m3-20020a9d4c83000000b00655f666801dmr8543844otf.303.1664815132666;
        Mon, 03 Oct 2022 09:38:52 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l6-20020a056871068600b0011e37fb5493sm3089089oao.30.2022.10.03.09.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 09:38:52 -0700 (PDT)
Received: (nullmailer pid 2422556 invoked by uid 1000);
	Mon, 03 Oct 2022 16:38:51 -0000
Date: Mon, 3 Oct 2022 11:38:51 -0500
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com, p.zabel@pengutronix.de, alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 12/12] dt-bindings: mediatek: mt8188: add mt8188-mt6359
 document
Message-ID: <20221003163851.GA2414624-robh@kernel.org>
References: <20220930145701.18790-1-trevor.wu@mediatek.com>
 <20220930145701.18790-13-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220930145701.18790-13-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_093854_726720_1CE29EE3 
X-CRM114-Status: GOOD (  19.85  )
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

On Fri, Sep 30, 2022 at 10:57:01PM +0800, Trevor Wu wrote:
> Add document for mt8188 board with mt6359.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mt8188-mt6359.yaml         | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
> new file mode 100644
> index 000000000000..57c7c5ceef8a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8188-mt6359.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8188-mt6359.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8188 ASoC sound card driver
> +
> +maintainers:
> +  - Trevor Wu <trevor.wu@mediatek.com>
> +
> +description:
> +  This binding describes the MT8188 sound card.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt8188-sound
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: User specified audio sound card name
> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      A list of the connections between audio components. Each entry is a
> +      sink/source pair of strings. Valid names could be the input or output
> +      widgets of audio components, power supplies, MicBias of codec and the
> +      software switch.
> +
> +  mediatek,platform:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"

Don't need quotes.

> +    description: The phandle of MT8188 ASoC platform.
> +
> +  mediatek,dptx-codec:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of MT8188 Display Port Tx codec node.
> +
> +  mediatek,hdmi-codec:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of MT8188 HDMI codec node.
> +
> +  mediatek,dai-link:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description:
> +      A list of the desired dai-links in the sound card. Each entry is a
> +      name defined in the machine driver.

Names have to be defined here.

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - mediatek,platform
> +
> +examples:
> +  - |
> +
> +    sound: mt8188-sound {
> +        compatible = "mediatek,mt8188-sound";
> +        mediatek,platform = <&afe>:
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&aud_pins_default>;
> +        audio-routing =
> +            "Headphone", "Headphone L",
> +            "Headphone", "Headphone R",
> +            "AIN1", "Headset Mic";
> +    };
> +
> +...
> -- 
> 2.18.0
> 
> 

