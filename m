Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADCDC001DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 10:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-reply-to:Date:Subject:To:From:References:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmu3IjUQ2taW3zTxDp9/zo0P78kimt745EhKwmVkMfQ=; b=wqOkYzv9WACqGtGfmBxEwSM5K/
	SUX/OvZyXkPz5xtfLJaYsDvX7X/fDk5HQgF/jb1M+kSpEnjovZGmwmeuygDZTMw4EPCsGlN2bxFcr
	IoemircslZrtFj2V4m+kxanK5t8Y33FElrJb4WyaL9HaQShnLhQw4FPUDVO26S6rOBsKNy4mImpY5
	oRec1i2HBdcnQK2wABgSVDXMo8+UWZsbBNaTdSP4z3B3n2NCKRqpGO64GZXh7lRdfM+dIUgZUYyjI
	L0jl9eyi7YpcKyZhkIxRDvOqJ/Q3XRle2mfJFzM/m0f+S3WufMzgvnhdBc4cVR4aghRMK9K5ryLjA
	SxOfKVjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPl4-00ExJ3-0X;
	Mon, 31 Jul 2023 10:04:10 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPkz-00ExIJ-0p
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Jul 2023 10:04:08 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-31783d02093so3940101f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Jul 2023 03:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690797843; x=1691402643;
        h=mime-version:message-id:in-reply-to:date:subject:to:from:user-agent
         :references:from:to:cc:subject:date:message-id:reply-to;
        bh=xmu3IjUQ2taW3zTxDp9/zo0P78kimt745EhKwmVkMfQ=;
        b=Vz8bn6xtRr9ajaVL2BYH/aU5C5qeoqk0tN1tW8v5Bz3+absmnMeoDLPOTrnC4mkk/M
         9+D9rninKuwW61xhv+cDJcG0P33QMQ5HZz1mfs7UiwCXi6dIM/vsZyh3HjQ9922kj/4s
         +jIin1qddCBn41gsu0Eo3jA+DxF8aM+9VZV6koeVX4ph6OqSYHlQ54AaEJNN4iEc1wD8
         3yclrtFuxve6PCVDn+11GlYIJWc0Ha3DyBodOsez5rv8FHqjZNRq2htMQzNF9Ho13HT8
         h/RrB+CklDlcmR7qAzMy0Ink/xkNE7JCgUqwrQsDQYYWQ6E9D+lOkpmzCoYZNzO26OPs
         82ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690797843; x=1691402643;
        h=mime-version:message-id:in-reply-to:date:subject:to:from:user-agent
         :references:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xmu3IjUQ2taW3zTxDp9/zo0P78kimt745EhKwmVkMfQ=;
        b=GlgsR0rnkET6vv3EBhgpRJwxKerlNzXC0t47QcPtuLXZ1fZdKmOfCo+A9cAEmnSqSP
         aSZPQr4W4SKxmvCnV4akTa1Y8WCcaG/L1x4hcaP1SOTkSsqxoQZCsgcBiUMyGpnfEfdv
         jCtNZD9C0FtKc1x6oinWzlkcUEtVPRIsQ5bOPjyf6WDDkIdN7hc2I3XVccVTV8ckg3bL
         uFjQLjDm+Kr7sVbNalNwd3Z1DRwHpKI9bJ9I4NfkKilO2lGvy8vTIwYmjKUS6BYB3jBb
         Sg/EoJksQFhOMjOJyzH53mRqou0ZAy5JwE0sC7Z1s1ZTs4duRZwFOvclDxmPqbNlMAfu
         qHJQ==
X-Gm-Message-State: ABy/qLYtVKMut5/VvmrK9XzsBp4LxAKVKYj+lcnyscf+8UoXzhYESmqT
	kHBE5OSBaUJUj+LY4LTsS6+rJg==
X-Google-Smtp-Source: APBJJlG/6YtIJ2PZyWt5JPzeSkuVMJs1cDNhO+1x9k/xAk4VYOxr9uirGMxr5kOpAVkpkBapLLbIcQ==
X-Received: by 2002:adf:f681:0:b0:314:46af:e1e7 with SMTP id v1-20020adff681000000b0031446afe1e7mr8192622wrp.34.1690797842657;
        Mon, 31 Jul 2023 03:04:02 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:686f:cc54:f527:35c0])
        by smtp.gmail.com with ESMTPSA id f11-20020adff58b000000b003143aa0ca8asm12553696wro.13.2023.07.31.03.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 03:04:02 -0700 (PDT)
References: <20230731094303.185067-1-krzysztof.kozlowski@linaro.org>
 <20230731094303.185067-2-krzysztof.kozlowski@linaro.org>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, Rohit kumar
 <quic_rohkumar@quicinc.com>, Cheng-Yi Chiang <cychiang@chromium.org>, Rao
 Mandadapu <srivasam@codeaurora.org>, Judy Hsiao <judyhsiao@chromium.org>,
 Trevor Wu <trevor.wu@mediatek.com>, Jonathan Bakker <xc-racer2@live.ca>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 01/12] ASoC: dt-bindings: amlogic,gx-sound-card: correct
 maxItems constraints
Date: Mon, 31 Jul 2023 11:52:53 +0200
In-reply-to: <20230731094303.185067-2-krzysztof.kozlowski@linaro.org>
Message-ID: <1jr0oowg6m.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_030405_480885_F0967D63 
X-CRM114-Status: GOOD (  17.13  )
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


On Mon 31 Jul 2023 at 11:42, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> minItems without maxItems implies upper limit, so add some high maxItems
> to fix dtbs_check warnings like:
>
>   meson-gxm-s912-libretech-pc.dtb: sound: audio-routing: ['AU2 INL', 'ACODEC LOLN', 'AU2 INR', 'ACODEC LORN', '7J4-14 LEFT', 'AU2 OUTL', '7J4-11 RIGHT', 'AU2 OUTR'] is too long

The only contraints is that values come in pair and there is no upper
limit to the number of routes a device (using this driver) may have.

The upper limit of 8 might work now but is very likely to be wrong for
the next device to come.

Is there way to correctly describe this "pair" contraint with DT schema ?

If not, then I guess the most adequate solution is to drop minItems and
give no bound, like simple-card is doing for the same type of properties.

Same goes for the audio-widgets property

>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> index b358fd601ed3..45d6202d9730 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml
> @@ -21,6 +21,7 @@ properties:
>    audio-routing:
>      $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>      minItems: 2
> +    maxItems: 32
>      description: |-
>        A list of the connections between audio components. Each entry is a
>        pair of strings, the first being the connection's sink, the second
> @@ -29,6 +30,7 @@ properties:
>    audio-widgets:
>      $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>      minItems: 2
> +    maxItems: 8
>      description: |-
>        A list off component DAPM widget. Each entry is a pair of strings,
>        the first being the widget type, the second being the widget name


