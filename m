Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A079C76196
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 09:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMAAzjoxghzuYPYu2mwwJpHwylO5OVQJssvnVC4wWic=; b=AqDVCoHM06FdxoXgf3ncgeU0km
	/p7Vfi/mr8MDiCRnQkIajXN9l1f1qwdvrhEt+r1T08td3XZsaMW0XCFIbzdY+zaVA5cKryiAV+q6R
	XdupkQQwzqvUJB2457aC8tETooZGmqRBeoiGrQmhd/1RTEutXfh/a0r7jLx3sLJo/6AkylXd5SRQI
	Fd/e2zxDYErNHVkxDWB6gA3id3gnmd2JZyb2vC4rlxjgMsM6BzeQbGbS+g6qdSoRJbKOzkb7M1G7g
	z27KEsSQZJqisr23+/G2nBSrE69pml7CQw1VtDrWptW2Z3cpHAbySCBUwmBEzhn9sZS/l03BNkHFr
	4DIlIb7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkMDB-006uq3-0A;
	Thu, 06 Apr 2023 09:47:21 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkMD7-006uoL-2i;
	Thu, 06 Apr 2023 09:47:19 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pkMCs-0000AJ-2t;
	Thu, 06 Apr 2023 11:47:03 +0200
Date: Thu, 6 Apr 2023 10:46:59 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: arinc9.unal@gmail.com
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/7] dt-bindings: net: dsa: mediatek,mt7530: add port
 bindings for MT7988
Message-ID: <ZC6VE2C5KAza8U8r@makrotopia.org>
References: <20230406080141.22924-1-arinc.unal@arinc9.com>
 <20230406080141.22924-3-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230406080141.22924-3-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_024717_878517_C7BBED09 
X-CRM114-Status: GOOD (  20.02  )
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

On Thu, Apr 06, 2023 at 11:01:37AM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The switch on MT7988 has got only port 6 as a CPU port. The only phy-mode
> to be used is internal. Add this.
> 
> Some bindings are incorrect for this switch now, so move them to more
> specific places.
> 
> Address the incorrect information of which ports can be used as a user
> port. Any port can be used as a user port.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Acked-by: Daniel Golle <daniel@makrotopia.org>

> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 63 ++++++++++++++-----
>  1 file changed, 46 insertions(+), 17 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index 7045a98d9593..605888ce2bc6 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -160,22 +160,6 @@ patternProperties:
>        "^(ethernet-)?port@[0-9]+$":
>          type: object
>  
> -        properties:
> -          reg:
> -            description:
> -              Port address described must be 5 or 6 for CPU port and from 0 to 5
> -              for user ports.
> -
> -        allOf:
> -          - if:
> -              required: [ ethernet ]
> -            then:
> -              properties:
> -                reg:
> -                  enum:
> -                    - 5
> -                    - 6
> -
>  required:
>    - compatible
>    - reg
> @@ -186,9 +170,21 @@ $defs:
>        "^(ethernet-)?ports$":
>          patternProperties:
>            "^(ethernet-)?port@[0-9]+$":
> +            properties:
> +              reg:
> +                description:
> +                  Port address described must be 5 or 6 for the CPU port. User
> +                  ports can be 0 to 6.
> +
>              if:
>                required: [ ethernet ]
>              then:
> +              properties:
> +                reg:
> +                  enum:
> +                    - 5
> +                    - 6
> +
>                if:
>                  properties:
>                    reg:
> @@ -212,9 +208,21 @@ $defs:
>        "^(ethernet-)?ports$":
>          patternProperties:
>            "^(ethernet-)?port@[0-9]+$":
> +            properties:
> +              reg:
> +                description:
> +                  Port address described must be 5 or 6 for the CPU port. User
> +                  ports can be 0 to 6.
> +
>              if:
>                required: [ ethernet ]
>              then:
> +              properties:
> +                reg:
> +                  enum:
> +                    - 5
> +                    - 6
> +
>                if:
>                  properties:
>                    reg:
> @@ -235,6 +243,27 @@ $defs:
>                        - 2500base-x
>                        - sgmii
>  
> +  mt7988-dsa-port:
> +    patternProperties:
> +      "^(ethernet-)?ports$":
> +        patternProperties:
> +          "^(ethernet-)?port@[0-9]+$":
> +            properties:
> +              reg:
> +                description:
> +                  Port address described must be 6 for the CPU port. User ports
> +                  can be 0 to 3, and 6.
> +
> +            if:
> +              required: [ ethernet ]
> +            then:
> +              properties:
> +                reg:
> +                  const: 6
> +
> +                phy-mode:
> +                  const: internal
> +
>  allOf:
>    - $ref: dsa.yaml#/$defs/ethernet-ports
>    - if:
> @@ -285,7 +314,7 @@ allOf:
>          compatible:
>            const: mediatek,mt7988-switch
>      then:
> -      $ref: "#/$defs/mt7530-dsa-port"
> +      $ref: "#/$defs/mt7988-dsa-port"
>        properties:
>          gpio-controller: false
>          mediatek,mcm: false
> -- 
> 2.37.2
> 

