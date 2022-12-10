Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7D3C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Dec 2022 16:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuxrhOcouOodCpiih51edJPpKil1toFz+E57gSw+0VQ=; b=eQWbzLRc09Y486YDvjF2POw1ef
	Rju8lA7MdVl/+YKlMKejfqBW8KBTkEESSbxuiDiaUE8qzRwgc5hJnfGjiTi6hiG7bHGENS335FoMx
	gQwNXrqw/7SzHm2zzDaX/nJ4QW21wJcVZIj3/F3102rKH1Ed4lG9aVQSmhkQwVuA3Tu8ehJUiLXM6
	QgUTJsN5egNp+gvSiyBCTQ225T/Z0bvq+Y42YSiKyWLUgLgKa36GSMxoFWm6njhNyuRMStFLG1Cyb
	9j5GgMYZmuq8OMmTeFw+xhgOo4eH3XjOOf6MQhCz6nnDeHIbriG0URAewcpOd7nxXZdh+Pihdpiez
	Yy4DllcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p42fb-002Jfg-3U; Sat, 10 Dec 2022 16:25:47 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p42fU-002JYu-Dy; Sat, 10 Dec 2022 16:25:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1670689494; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M7mVTda5GTqsOXhGbbWYwAh8gSAhWSRqvdJYbo7y1LW5r+qHT0qN4+90mjKuuiYeqXdxIcFt0HXKRSGcv0zsaPXEDtcu29cy/s9Adj87toiHT9zjGZsELLZQ8okDv+M8RMByeoGcRmrJ0mGBohJ6nLg6YOnvVYEHpvvJqiFRnzw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1670689494; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=AuxrhOcouOodCpiih51edJPpKil1toFz+E57gSw+0VQ=; 
	b=ezJXQLJD12neIlyNa2jEdbjolhPcyRQaeOKdNSjI4R3hHt3N8YfyRnUBOOXL1/Qq+TNlYGZ9RhnwlJRMZBclkuFxjvpBX+Hx2gqPOaMxUp9H7rzMQ+bhIE9WuhPPUgSipt+r2bpved0SSwb8JhfNlCjBXSDhQmos3xFK1R8kIKs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670689494;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=AuxrhOcouOodCpiih51edJPpKil1toFz+E57gSw+0VQ=;
	b=WcYaXZWKMSVvUIEUIJteLadKb5lBLZIW8nkLqECqShu0kboZ8ircbyTQz5Ks2xy1
	mmpNIAjAEp/qtpLDRie0vrPFrVHEjN/oWUOvzAhkePilIdNBGJegTLyNHK8GijEyvX7
	JKwuUvfGs3UOXLFzOe57iFHs1pgkH1t8EdO9Kt6I=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1670689491712607.4170178546929; Sat, 10 Dec 2022 08:24:51 -0800 (PST)
Message-ID: <1df417b5-a924-33d4-a302-eb526f7124b4@arinc9.com>
Date: Sat, 10 Dec 2022 19:24:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v5 net-next 04/10] dt-bindings: net: dsa: utilize base
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
References: <20221210033033.662553-1-colin.foster@in-advantage.com>
 <20221210033033.662553-5-colin.foster@in-advantage.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20221210033033.662553-5-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221210_082543_495888_FEB59B10 
X-CRM114-Status: GOOD (  20.64  )
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

On 10.12.2022 06:30, Colin Foster wrote:
> DSA switches can fall into one of two categories: switches where all ports
> follow standard '(ethernet-)?port' properties, and switches that have
> additional properties for the ports.
> 
> The scenario where DSA ports are all standardized can be handled by
> switches with a reference to the new 'dsa.yaml#/$defs/ethernet-ports'.
> 
> The scenario where DSA ports require additional properties can reference
> '$dsa.yaml#' directly. This will allow switches to reference these standard
> definitions of the DSA switch, but add additional properties under the port
> nodes.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Alvin Šipraga <alsi@bang-olufsen.dk> # realtek
> Acked-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
> 
> v4 -> v5
>    * Add Rob Reviewed, Arınç Acked
>    * Defer the removal of "^(ethernet-)?switch(@.*)?$" in dsa.yaml until a
>      later patch
>    * Undo the move of ethernet switch ports description in mediatek,mt7530.yaml
>    * Fix typos in commit message
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
>   .../devicetree/bindings/net/dsa/dsa.yaml      | 22 +++++++++++++++++++
>   .../net/dsa/hirschmann,hellcreek.yaml         |  2 +-
>   .../bindings/net/dsa/mediatek,mt7530.yaml     |  5 +----
>   .../bindings/net/dsa/microchip,ksz.yaml       |  2 +-
>   .../bindings/net/dsa/microchip,lan937x.yaml   |  2 +-
>   .../bindings/net/dsa/mscc,ocelot.yaml         |  2 +-
>   .../bindings/net/dsa/nxp,sja1105.yaml         |  2 +-
>   .../devicetree/bindings/net/dsa/realtek.yaml  |  2 +-
>   .../bindings/net/dsa/renesas,rzn1-a5psw.yaml  |  2 +-
>   11 files changed, 32 insertions(+), 13 deletions(-)
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
> index 5efc0ee8edcb..9375cdcfbf96 100644
> --- a/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/dsa.yaml
> @@ -58,4 +58,26 @@ oneOf:
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

I've got moderate experience in json-schema but shouldn't you put 'type: 
object' here like you did for "^(ethernet-)?ports$"?

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
> index f2e9ff3f580b..20312f5d1944 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -157,9 +157,6 @@ patternProperties:
>       patternProperties:
>         "^(ethernet-)?port@[0-9]+$":
>           type: object

This line was being removed on the previous version. Must be related to 
above.

> -        description: Ethernet switch ports
> -
> -        unevaluatedProperties: false
>   
>           properties:
>             reg:

Arınç

