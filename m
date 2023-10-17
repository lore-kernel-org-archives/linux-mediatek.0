Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0101CDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 06:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itnPW5rRfzWD1R0hThVhfk8sAUkui3kg+yDMgRUM000=; b=Yw7ZA2lIsMFm2KHtoP7tnTr57L
	Uv2yitx/g98cbwSGTkLTGLSaMxPcjnwPH4furiJtYKdjiAcYGq+7cHC6X3UVB4Qc+iQ3ejcw/UKao
	XV7LDkB6IweaDqSwsVuI6d9EpP4FzKXuOLowdFblTWrhV+IL1EcEVByCP0RKizHih48A52HAjqCDq
	SDybEF8VQPDI/lQQQeimYa/kBUE3MEwPGvw4hKpBOElJZsFbiwmXeu8I5TvgD9qO5QwekjTZYbsyK
	vavtAI7O3jrYS2Zcby52bP/VDhYQAdlsEeO2N/SuWLPMYQomGIjKRh1E98D9IqRqkLW3TCvFgI5aE
	aqoSjGrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsdWk-00BPgx-2Q;
	Tue, 17 Oct 2023 06:26:02 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsdWf-00BPe0-2A;
	Tue, 17 Oct 2023 06:25:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F323C0007;
	Tue, 17 Oct 2023 06:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1697523949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=itnPW5rRfzWD1R0hThVhfk8sAUkui3kg+yDMgRUM000=;
	b=bcTdqH2iIG9E86n9wjdLB9+H1RfKLhSC1wgDOmxIwvCp3LLgzdRHfsygoJxwnDurJqvOhh
	ci1qBi8NI2RV5PvEeN2ONy+TIog7sDsPSXcnKN5YYHcrBm4m9REvx7w+VjfEllLn+wKSWQ
	QjmvEIYNxq3hfgCIDOmQdrYn3RT3WSCU+4rjZcDv7THt/gqvQWjtNNs3dyLBP1vwxlQfAw
	6rlU8hfuB2xhGaSGRaCy8lv9kVlm6o7Y/m6ZoRnxy2dGqD1SFRJqwnm90FLarqbAnjqLg+
	f74wTcSI+f+fB3yuMX78XBjEUUpgWQr2tgyFDrjskmejyDyL/8VnN1nLEreKeg==
Message-ID: <735a683c-fdf2-42ab-b94b-efb32847979d@arinc9.com>
Date: Tue, 17 Oct 2023 09:25:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/8] dt-bindings: net: dsa/switch: Make
 'ethernet-port' node addresses hex
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 John Crispin <john@phrozen.org>,
 Gerhard Engleder <gerhard@engleder-embedded.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Justin Chen <justin.chen@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com
References: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
 <20231016-dt-net-cleanups-v1-3-a525a090b444@kernel.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20231016-dt-net-cleanups-v1-3-a525a090b444@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_232557_998557_2601B39E 
X-CRM114-Status: GOOD (  13.25  )
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

On 17.10.2023 00:44, Rob Herring wrote:
> 'ethernet-port' node unit-addresses should be in hexadecimal. Some
> instances have it correct, but fix the ones that don't.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml         | 2 +-
>   Documentation/devicetree/bindings/net/dsa/dsa.yaml               | 2 +-
>   Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml   | 6 +++---
>   Documentation/devicetree/bindings/net/dsa/microchip,lan937x.yaml | 2 +-
>   Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml       | 2 +-
>   Documentation/devicetree/bindings/net/ethernet-switch.yaml       | 4 ++--
>   Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml        | 2 +-
>   7 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> index aa3162c74833..75d8138298fb 100644
> --- a/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> +++ b/Documentation/devicetree/bindings/net/brcm,asp-v2.0.yaml
> @@ -53,7 +53,7 @@ properties:
>           const: 0
>   
>       patternProperties:
> -      "^port@[0-9]+$":
> +      "^port@[0-9a-f]+$":
>           type: object
>   
>           $ref: ethernet-controller.yaml#
> diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.yaml b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> index ec74a660beda..e6010821f86f 100644
> --- a/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> @@ -50,7 +50,7 @@ $defs:
>               const: 0
>   
>           patternProperties:
> -          "^(ethernet-)?port@[0-9]+$":
> +          "^(ethernet-)?port@[0-9a-f]+$":
>               description: Ethernet switch ports
>               $ref: dsa-port.yaml#
>               unevaluatedProperties: false
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index 20f7ba4e2203..5038818e9f2e 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -157,7 +157,7 @@ patternProperties:
>       additionalProperties: true
>   
>       patternProperties:
> -      "^(ethernet-)?port@[0-9]+$":
> +      "^(ethernet-)?port@[0-6]$":

You also restrict the pattern depending on how many ports the switch has.
Shouldn't this be a separate patch or, at the least, mentioned on the patch
log?

Regardless:

Acked-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

