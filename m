Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D98C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 21:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTgtnJqoI3mBOnlXVRuirNE3H0rwkt9IzKJ3dXVz2R0=; b=pDu9nFDkl71zI1UG7dBS256GH6
	c9iTDwvcBqk0o0YH2+omVXauplDIqGp50cfk+0kZjD1cRPjiUeOY2FFKZ/ZIldUUeIKN+n9B4x7IK
	NaPFh+Pe6qJO8wu3qRzWnpVv+6mv8jEqoiK4jV0ajumgkPVv9lnVJCvfWOWehiq9P6K9VkEwftiaA
	8yy+P6eqKGiTUtnKDcFp7nNddexygAPVgSL/QeaEJdesBZKIdNNOPXBB6x30LSeUTThXffr8mW9UD
	T/29qn2z7mj1sE1ulyCGZnkDAbYUXSwsIfUKxvgoxn9gWtdu46E7ZlECU/AWhaFb7c6fhachyEbqo
	wzXVU1iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1DrP-001Qej-BG; Fri, 02 Dec 2022 21:46:19 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1DrM-001QNp-C6; Fri, 02 Dec 2022 21:46:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1670017546; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DnXhT2OUlhlC5DwILJKEz4FKOfX14rJuU1Z5pzoNKTHRt0IUEa9cKCxGC4LhhHuaTHuIVkQLu9THL5C9MN53zX4Lw32mj3sFgx+Ie6bN410Bu32ZGi8nu3VMyzkgRbo05Xn8LajJ48A+CPQiVZ0T9zuAwYnAJANtBLQAwfNb/ZY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1670017546; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=JTgtnJqoI3mBOnlXVRuirNE3H0rwkt9IzKJ3dXVz2R0=; 
	b=UQF4RXBepui+yim0KwIXhj7dIhvabk1ebfPx5aBM/OJRRVD6h9B8XSbiylbUJV+tZHQL36Y4iJfWYF+VdvHoF1PXZ7gMR8OXrmh3SCTSa4m6FYGWRfT2VZbwTMq6/KIDyBCGu6sJHv5q6FsnmmHLdUsfXpwsDfS1Q21BO4D0uhQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670017546;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JTgtnJqoI3mBOnlXVRuirNE3H0rwkt9IzKJ3dXVz2R0=;
	b=bFc/Twx+wSKbN8cptiRq7XpT5s0ryu0P35a+jvbqT8ZRJwgPIDEnK6Ps6plwEu81
	w0cLAsN8BAPiqk64Tf8fnP6ZotcTzZJaT2y0LQeZqZ/qb55X7oq1a6rVSyUT44eQhXw
	Igl7pFg4wtB7Ywjk7u/WCAm/0bsT69eVVbU85i2c=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1670017543642787.7203324647592; Fri, 2 Dec 2022 13:45:43 -0800 (PST)
Message-ID: <bfc6810b-3c21-201b-3c4f-a0def3928597@arinc9.com>
Date: Sat, 3 Dec 2022 00:45:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 net-next 3/9] dt-bindings: net: dsa: utilize base
 definitions for standard dsa switches
To: Colin Foster <colin.foster@in-advantage.com>,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Marek Vasut <marex@denx.de>,
 Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 =?UTF-8?Q?Alvin_=c5=a0ipraga?= <alsi@bang-olufsen.dk>,
 Linus Walleij <linus.walleij@linaro.org>, UNGLinuxDriver@microchip.com,
 Woojung Huh <woojung.huh@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, Vladimir Oltean
 <olteanv@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 George McCollister <george.mccollister@gmail.com>,
 Rob Herring <robh@kernel.org>
References: <20221202204559.162619-1-colin.foster@in-advantage.com>
 <20221202204559.162619-4-colin.foster@in-advantage.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20221202204559.162619-4-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_134616_466429_38E6617B 
X-CRM114-Status: GOOD (  21.80  )
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

On 2.12.2022 23:45, Colin Foster wrote:
> DSA switches can fall into one of two categories: switches where all ports
> follow standard '(ethernet-)?port' properties, and switches that have
> additional properties for the ports.
> 
> The scenario where DSA ports are all standardized can be handled by
> swtiches with a reference to the new 'dsa.yaml#/$defs/ethernet-ports'.
> 
> The scenario where DSA ports require additional properties can reference
> '$dsa.yaml#' directly. This will allow switches to reference these standard
> defitions of the DSA switch, but add additional properties under the port
> nodes.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Acked-by: Alvin Šipraga <alsi@bang-olufsen.dk> # realtek
> ---
> 
> v3 -> v4
>    * Rename "$defs/base" to "$defs/ethernet-ports" to avoid implication of a
>      "base class" and fix commit message accordingly
>    * Add the following to the common etherent-ports node:
>        "additionalProperties: false"
>        "#address-cells" property
>        "#size-cells" property
>    * Fix "etherenet-ports@[0-9]+" to correctly be "ethernet-port@[0-9]+"
>    * Remove unnecessary newline
>    * Apply changes to mediatek,mt7530.yaml that were previously in a separate patch
>    * Add Reviewed and Acked tags
> 
> v3
>    * New patch
> 
> ---
>   .../bindings/net/dsa/arrow,xrs700x.yaml       |  2 +-
>   .../devicetree/bindings/net/dsa/brcm,b53.yaml |  2 +-
>   .../devicetree/bindings/net/dsa/dsa.yaml      | 25 ++++++++++++++++---
>   .../net/dsa/hirschmann,hellcreek.yaml         |  2 +-
>   .../bindings/net/dsa/mediatek,mt7530.yaml     | 16 +++---------
>   .../bindings/net/dsa/microchip,ksz.yaml       |  2 +-
>   .../bindings/net/dsa/microchip,lan937x.yaml   |  2 +-
>   .../bindings/net/dsa/mscc,ocelot.yaml         |  2 +-
>   .../bindings/net/dsa/nxp,sja1105.yaml         |  2 +-
>   .../devicetree/bindings/net/dsa/realtek.yaml  |  2 +-
>   .../bindings/net/dsa/renesas,rzn1-a5psw.yaml  |  2 +-
>   11 files changed, 35 insertions(+), 24 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/arrow,xrs700x.yaml b/Documentation/devicetree/bindings/net/dsa/arrow,xrs700x.yaml
> index 259a0c6547f3..5888e3a0169a 100644
> --- a/Documentation/devicetree/bindings/net/dsa/arrow,xrs700x.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/arrow,xrs700x.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   title: Arrow SpeedChips XRS7000 Series Switch Device Tree Bindings
>   
>   allOf:
> -  - $ref: dsa.yaml#
> +  - $ref: dsa.yaml#/$defs/ethernet-ports
>   
>   maintainers:
>     - George McCollister <george.mccollister@gmail.com>
> diff --git a/Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml b/Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml
> index 1219b830b1a4..5bef4128d175 100644
> --- a/Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/brcm,b53.yaml
> @@ -66,7 +66,7 @@ required:
>     - reg
>   
>   allOf:
> -  - $ref: dsa.yaml#
> +  - $ref: dsa.yaml#/$defs/ethernet-ports
>     - if:
>         properties:
>           compatible:
> diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.yaml b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> index b9d48e357e77..b9e366e46aed 100644
> --- a/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> @@ -19,9 +19,6 @@ description:
>   select: false
>   
>   properties:
> -  $nodename:
> -    pattern: "^(ethernet-)?switch(@.*)?$"
> -
>     dsa,member:
>       minItems: 2
>       maxItems: 2
> @@ -58,4 +55,26 @@ oneOf:
>   
>   additionalProperties: true
>   
> +$defs:
> +  ethernet-ports:
> +    description: A DSA switch without any extra port properties
> +    $ref: '#/'
> +
> +    patternProperties:
> +      "^(ethernet-)?ports$":
> +        type: object
> +        additionalProperties: false
> +
> +        properties:
> +          '#address-cells':
> +            const: 1
> +          '#size-cells':
> +            const: 0
> +
> +        patternProperties:
> +          "^(ethernet-)?port@[0-9]+$":
> +            description: Ethernet switch ports
> +            $ref: dsa-port.yaml#
> +            unevaluatedProperties: false
> +
>   ...
> diff --git a/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcreek.yaml b/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcreek.yaml
> index 73b774eadd0b..748ef9983ce2 100644
> --- a/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcreek.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcreek.yaml
> @@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>   title: Hirschmann Hellcreek TSN Switch Device Tree Bindings
>   
>   allOf:
> -  - $ref: dsa.yaml#
> +  - $ref: dsa.yaml#/$defs/ethernet-ports
>   
>   maintainers:
>     - Andrew Lunn <andrew@lunn.ch>
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index f2e9ff3f580b..b815272531fa 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -156,17 +156,6 @@ patternProperties:
>   
>       patternProperties:
>         "^(ethernet-)?port@[0-9]+$":
> -        type: object
> -        description: Ethernet switch ports
> -
> -        unevaluatedProperties: false
> -
> -        properties:
> -          reg:
> -            description:
> -              Port address described must be 5 or 6 for CPU port and from 0 to 5
> -              for user ports.

This shouldn't be moved. Please reread our conversation on the previous 
version.

> -
>           allOf:
>             - $ref: dsa-port.yaml#
>             - if:
> @@ -174,6 +163,9 @@ patternProperties:
>               then:
>                 properties:
>                   reg:
> +                  description:
> +                    Port address described must be 5 or 6 for CPU port and from
> +                    0 to 5 for user ports

Arınç

