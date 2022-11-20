Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52439C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Nov 2022 13:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R3o7MxftPnsiuByCDpeTAo1VzY2DRAHijDZ+Q9Ek5VE=; b=PmLjJepo1fs1hnsESB09RuT7T/
	DJjuK2PMoQfSp2oopTPvO4bmD9XT23OHNmvOl80lytvpxNgYRHa7R9QwEVcKVA5EUzqjPg8sbqaKr
	V0/W/96JxAYvybAMXY8l95vOn1yEH2zzPhd0hr7nWSVCmU8HP6/0uTRJTQveiVcMZaYWBpsF29FQP
	GltcYRY14scP1Ulw5PpVpgHTCbLzHzjupXLwYVcV4+Ns9Nr5FUu+SnN5XSMs+AXMVoE6bRGogPI63
	6nCNB+EgNEWNLPBxrVACkVI2oYXEu3MGYM84l5+Y4fc4O+JvqWm99OXLEFAwMRUpX05Bi5EmKW4Oo
	II/B76eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owklA-004efe-Th; Sun, 20 Nov 2022 13:53:25 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owkkx-004eXk-GG; Sun, 20 Nov 2022 13:53:13 +0000
Received: by mail-qk1-x72d.google.com with SMTP id d7so6514618qkk.3;
        Sun, 20 Nov 2022 05:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R3o7MxftPnsiuByCDpeTAo1VzY2DRAHijDZ+Q9Ek5VE=;
        b=JIVFY4robx7oRRUQfCLInbCxqPNNQRhFvRFnSzYIldrdG2Je2WB2jAJK7by2FAyGkd
         AclJ4+pXvNKd3bNZrE1MOULb31JbFqHgy5mXs4qao1kSwz+0d7uXTIk7E8t7rzKZgE+C
         svWAWmtiT1mr6y8ZLgSxKiiFC+DqvkDkZWvb5uAqYhf01luNS1B3nwOfHl/0VuJ+eZEN
         NMvaeM7Mfii8P4clfnTRfFf0udrY44fA0mGlLxkhnv7c0dDeJ/eVlbkxawEYq9dBiQw5
         tKxoSnSrS2k7jerbcuo6Vzh9DzzMOXTXQWwsaWsJYrGVMPtjX3UyjfW1PyvR/BacjkLC
         Z5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3o7MxftPnsiuByCDpeTAo1VzY2DRAHijDZ+Q9Ek5VE=;
        b=ZCvsS/mlK6ZYkI9fDouSMuyLvHDq1MJ5KJKY9/sSmuFbQcn8/Mtab9OmsE4xSKzEKW
         icMnfUKvdTR4UdrXoipuwiknkTunbyUilChO/LhYhZjrOQBGE3FTONzaDvsciS6ouMno
         ak99GEH/xHaoLmnXZKIKwhDmbCRhvOjVw6dwJ6jsG9XZnL4qdPhxoZkWGsQRcth2ShTa
         L4rVuuVDgkb3NHjixe0yAE+dMfeyacg/U116Aqfx5sxK66bwayPGW+aoPuCPmkaYZ4nA
         wJ3CoMqREBTSmWZ5O4DVWOHGU4JfgesOKGFrNTgV0sFZcBGrC60lRcxkRUoj+fjeM8sq
         ZZpA==
X-Gm-Message-State: ANoB5pkPn1R+1GMFUF/z+EQ3qMQ95xWNLyEwzPvCDOe9/u7bTPJdvxym
	Nd757s/le9HGAdJP69f52t8=
X-Google-Smtp-Source: AA0mqf6lqRt0pi9+3h33Jkhzmoe8fof4ax9VZl7N0LFXcDLx5t4h1eFk7Zl7LZYKqldtMBKSAXnLLA==
X-Received: by 2002:a05:620a:1427:b0:6f9:ffc7:a9e4 with SMTP id k7-20020a05620a142700b006f9ffc7a9e4mr838228qkj.277.1668952390120;
        Sun, 20 Nov 2022 05:53:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s6-20020a05620a254600b006e07228ed53sm6523055qko.18.2022.11.20.05.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:53:09 -0800 (PST)
Date: Sun, 20 Nov 2022 05:53:08 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
Cc: Ilia Lin <ilia.lin@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jean Delvare <jdelvare@suse.com>,
	Yangtao Li <tiny.windzz@gmail.com>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Javier Martinez Canillas <javier@dowhile0.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Maxime Ripard <mripard@kernel.org>, Daniel Mack <zonque@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Add missing start and/or end of line regex
 anchors
Message-ID: <20221120135308.GA1787641@roeck-us.net>
References: <20221118223728.1721589-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118223728.1721589-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_055311_591661_1B2ED67C 
X-CRM114-Status: GOOD (  18.50  )
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

On Fri, Nov 18, 2022 at 04:37:27PM -0600, Rob Herring wrote:
> json-schema patterns by default will match anywhere in a string, so
> typically we want at least the start or end anchored. Fix the obvious
> cases where the anchors were forgotten.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> ---
>  .../devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml       | 2 +-
>  Documentation/devicetree/bindings/hwmon/adt7475.yaml          | 4 ++--

For hwmon: 

Acked-by: Guenter Roeck <linux@roeck-us.net>

>  .../bindings/opp/allwinner,sun50i-h6-operating-points.yaml    | 4 ++--
>  .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 2 +-
>  .../devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml        | 2 +-
>  Documentation/devicetree/bindings/regulator/max8660.yaml      | 2 +-
>  .../devicetree/bindings/regulator/maxim,max77802.yaml         | 2 +-
>  Documentation/devicetree/bindings/regulator/regulator.yaml    | 2 +-
>  .../devicetree/bindings/regulator/rohm,bd9576-regulator.yaml  | 2 +-
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml     | 2 +-
>  .../devicetree/bindings/spi/nvidia,tegra210-quad.yaml         | 2 +-
>  11 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> index a11e1b867379..3c00ad09eeaa 100644
> --- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> @@ -38,7 +38,7 @@ properties:
>      type: object
>  
>      patternProperties:
> -      'cpu@[0-9a-f]+':
> +      '^cpu@[0-9a-f]+$':
>          type: object
>  
>          properties:
> diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.yaml b/Documentation/devicetree/bindings/hwmon/adt7475.yaml
> index ea595102a86e..051c976ab711 100644
> --- a/Documentation/devicetree/bindings/hwmon/adt7475.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/adt7475.yaml
> @@ -61,7 +61,7 @@ patternProperties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [0, 1]
>  
> -  "adi,pin(5|10)-function":
> +  "^adi,pin(5|10)-function$":
>      description: |
>        Configures the function for pin 5 on the adi,adt7473 and adi,adt7475. Or
>        pin 10 on the adi,adt7476 and adi,adt7490.
> @@ -70,7 +70,7 @@ patternProperties:
>        - pwm2
>        - smbalert#
>  
> -  "adi,pin(9|14)-function":
> +  "^adi,pin(9|14)-function$":
>      description: |
>        Configures the function for pin 9 on the adi,adt7473 and adi,adt7475. Or
>        pin 14 on the adi,adt7476 and adi,adt7490
> diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> index 385b0692261c..51f62c3ae194 100644
> --- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> +++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> @@ -41,7 +41,7 @@ required:
>    - nvmem-cells
>  
>  patternProperties:
> -  "opp-[0-9]+":
> +  "^opp-[0-9]+$":
>      type: object
>  
>      properties:
> @@ -49,7 +49,7 @@ patternProperties:
>        clock-latency-ns: true
>  
>      patternProperties:
> -      "opp-microvolt-.*": true
> +      "^opp-microvolt-speed[0-9]$": true
>  
>      required:
>        - opp-hz
> diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
> index d60f43fd9c5a..e63e6458cea8 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
> @@ -31,7 +31,7 @@ properties:
>      maxItems: 2
>  
>  patternProperties:
> -  'pcie@[0-2],0':
> +  '^pcie@[0-2],0$':
>      type: object
>      $ref: /schemas/pci/pci-bus.yaml#
>  
> diff --git a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
> index 0f18cceba3d5..5a0d64d3ae6b 100644
> --- a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
> +++ b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
> @@ -65,7 +65,7 @@ properties:
>      maxItems: 1
>  
>  patternProperties:
> -  'usb@[0-1],0':
> +  '^usb@[0-1],0$':
>      type: object
>  
>      description:
> diff --git a/Documentation/devicetree/bindings/regulator/max8660.yaml b/Documentation/devicetree/bindings/regulator/max8660.yaml
> index 9c038698f880..4d550ca396eb 100644
> --- a/Documentation/devicetree/bindings/regulator/max8660.yaml
> +++ b/Documentation/devicetree/bindings/regulator/max8660.yaml
> @@ -24,7 +24,7 @@ properties:
>      type: object
>  
>      patternProperties:
> -      "regulator-.+":
> +      "^regulator-.+$":
>          $ref: "regulator.yaml#"
>  
>      additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml
> index 71138c611b6c..b704f05ea454 100644
> --- a/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml
> +++ b/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml
> @@ -77,7 +77,7 @@ patternProperties:
>        regulator-initial-mode: false
>  
>      patternProperties:
> -      regulator-state-(standby|mem|disk):
> +      "^regulator-state-(standby|mem|disk)$":
>          type: object
>          additionalProperties: true
>          properties:
> diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b/Documentation/devicetree/bindings/regulator/regulator.yaml
> index 6e8aa9eed3aa..53b81d8a2d41 100644
> --- a/Documentation/devicetree/bindings/regulator/regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
> @@ -231,7 +231,7 @@ patternProperties:
>    ".*-supply$":
>      description: Input supply phandle(s) for this node
>  
> -  regulator-state-(standby|mem|disk):
> +  "^regulator-state-(standby|mem|disk)$":
>      type: object
>      description:
>        sub-nodes for regulator state in Standby, Suspend-to-RAM, and
> diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
> index 7cb74cc8c5d9..54be194bb244 100644
> --- a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
> @@ -21,7 +21,7 @@ description: |
>    regulator-voutl1, regulator-vouts1
>  
>  patternProperties:
> -  "regulator-.+":
> +  "^regulator-.+$":
>      type: object
>      description:
>        Properties for single regulator.
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index 679a246dd666..7df40c38e865 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -115,7 +115,7 @@ properties:
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      patternProperties:
> -      port(@[0-9a-f]+)?:
> +      '^port(@[0-9a-f]+)?$':
>          $ref: audio-graph-port.yaml#
>          unevaluatedProperties: false
>  
> diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
> index 6b733e5c1163..899100e783c9 100644
> --- a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
> +++ b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
> @@ -48,7 +48,7 @@ properties:
>        - const: tx
>  
>  patternProperties:
> -  "@[0-9a-f]+":
> +  "@[0-9a-f]+$":
>      type: object
>  
>      properties:

