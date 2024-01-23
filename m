Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B28C47DDB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jan 2024 11:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kiug7kxjpiN77MygF4XI4IfliuDYO4n9PN+H+onGaYc=; b=aVaj6ZLU1GvlKSIPs71XUqUvXq
	yB56I/CZAZeTrn8D3+InqQkXiZrigOBuZT7BTgzIA089fxRKreGlwGNYcu9U2dpih9Erh3zrGgHOI
	LSVaOoavGSrE8nq4VFtdP/mwqBUQql0IjBsf7zAzKT6OXhX+hzRwixKonBzH7WxdHlxxAbvFl6Eel
	rm3G17JJAZvFe/DoxE5XRHdpcq3/2z937ksmA59pOWT/tBv/aonIvDeca91gij/9Rp4+h3AIGrPdb
	6h2NlOQ22wdct2bVA5rjRcmvZ5mEIFTNfcZ8C6VStR1pIadYMnZK0SzTUWP4BkyyBBDSfSVdKi5R0
	B9awuy1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSEpY-00G7jp-0C;
	Tue, 23 Jan 2024 11:20:36 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSEpV-00G7he-09;
	Tue, 23 Jan 2024 11:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706008831;
	bh=Ma8J6HFntmgJqAnxZ1TzwNoqA60TOtVPoP1qAOVBdOo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OiIjpPi+qqbZF55b3g1FH53iADZRQPVIE3JvYXt24FNRlry7Mc/kxIGxSJjltIY8t
	 paaOhSDkeW/GZIyZqk/I3coGbW7gHp/dEAQKoj3DpID416Tm0AvXMs5R0o7FVT7nHv
	 n8z04qnbz8DdYLedWX5n8/cgCu2QEJ1c9qXdANZJsK+ZTrGGzUFO5ZBduQQW5P2UYr
	 VZtb1xEHO2r9LVunE4J8+Kl5Edo4MWJCUv+pMq4282q+CcC39d3P00sY+9h/fNWkja
	 EM0P7HPeVqgxT4jnvw2DZRHpYfEtgffMl6KGYqxdBOornIlk/jMc5lsF+vYmZpK+mB
	 z/OYXluJ/LUvg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 94BD937813B5;
	Tue, 23 Jan 2024 11:20:30 +0000 (UTC)
Message-ID: <e17b85b1-7f1f-4b60-89b7-43f560466cc2@collabora.com>
Date: Tue, 23 Jan 2024 12:20:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: arm: mediatek: convert PCIESYS to the
 json-schema
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20240123082100.7334-1-zajec5@gmail.com>
 <20240123082100.7334-3-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240123082100.7334-3-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_032033_256616_8C9CCA5D 
X-CRM114-Status: GOOD (  23.13  )
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

Il 23/01/24 09:20, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files. Introduced changes:
> 1. Documented "reg" property
> 2. Adjusted "reg" in example
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>   .../arm/mediatek/mediatek,mt7622-pciesys.yaml | 47 +++++++++++++++++++
>   .../arm/mediatek/mediatek,pciesys.txt         | 25 ----------
>   2 files changed, 47 insertions(+), 25 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml
>   delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml
> new file mode 100644
> index 000000000000..7340a2512402
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-pciesys.yaml

I think that we should really move all those clock controller yaml files to their
proper directory, which would be

Documentation/devicetree/bindings/clock/

...because those are clock controllers anyway and the fact that they do also
provide a reset controller doesn't really justify having them in arm/mediatek.

Besides, I would appreciate if you could also move mt8186/92/95 and eventual
others that are there to clock/.

> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt7622-pciesys.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek PCIESYS controller
> +
> +description:
> +  The MediaTek PCIESYS controller provides various clocks to the system.
> +
> +maintainers:
> +  - Matthias Brugger <matthias.bgg@gmail.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - mediatek,mt7622-pciesys
> +          - mediatek,mt7629-pciesys
> +      - const: syscon

I know that there's syscon all over the place and, even if I admit I didn't check,
I am fairly sure that there's absolutely no reason to have syscon there, and that
the syscon compatible never did anything for (most of, or all of) those clock
controllers, at all.

I'm not sure - though - if removing syscon during the txt->yaml conversion is
acceptable (yeah we'd be cheating a bit), but something makes me say it is, because
the bindings couldn't validate before that one as well.

Of course you'd have to remove the syscon compatible from the affected device trees
as well as omitting it here.

However, to be sure that we're doing the right thing here, I have to summon someone
that can actually give a definitive answer to what I just said.....

Krzysztof, please? :-)

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +    description: The available clocks are defined in dt-bindings/clock/mt*-clk.h
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - reg
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pciesys@1a100800 {

This is a clock controller, so it is clock-controller@1a100800

> +        compatible = "mediatek,mt7622-pciesys", "syscon";
> +        reg = <0x1a100800 0x1000>;
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +    };
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
> deleted file mode 100644
> index d179a61536f4..000000000000
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -MediaTek PCIESYS controller
> -============================
> -
> -The MediaTek PCIESYS controller provides various clocks to the system.
> -
> -Required Properties:
> -
> -- compatible: Should be:
> -	- "mediatek,mt7622-pciesys", "syscon"
> -	- "mediatek,mt7629-pciesys", "syscon"
> -- #clock-cells: Must be 1
> -- #reset-cells: Must be 1
> -
> -The PCIESYS controller uses the common clk binding from
> -Documentation/devicetree/bindings/clock/clock-bindings.txt
> -The available clocks are defined in dt-bindings/clock/mt*-clk.h.
> -
> -Example:
> -
> -pciesys: pciesys@1a100800 {
> -	compatible = "mediatek,mt7622-pciesys", "syscon";
> -	reg = <0 0x1a100800 0 0x1000>;
> -	#clock-cells = <1>;
> -	#reset-cells = <1>;
> -};



