Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40895C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 22:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSoJgBw7gvJKRqtJPwGF8TC9wXnUbl77+8hQ4HnaDNg=; b=i4oW49qPOc9hgn50MkeUzcAGpm
	VSj3B7zHMXGZb1EFeh9O/ddRcUjNUojMhfPReLhItufRrEgsJgiLVA7JSY4aWHiQe2wB9NvsXAwEb
	V0v9aszOx++i9zv2JA8n+cT/UMgTwXR8sZslrULSAmgO1IQojNAnB7H1dDlFLQJdTvEMDeW+7qCOz
	BBMr0n14vgd0wAsIzkFplEtFmniR/sd5/al4IQPUZzLWqHNd7m/fV5c1k6hZH5eVqsu/tdEqSKeKG
	DceY2Dq4f9gCaD4M3IB3U74MpKt8p8BMeFPpM1VjDn4CJWw5sIudmB9sM92WoGddGyp+rDyeXlXCL
	qQaElQbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0sRb-00BRtA-5X; Thu, 01 Dec 2022 22:54:15 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0sGU-00BQY2-N6; Thu, 01 Dec 2022 22:42:48 +0000
Received: by mail-oi1-f181.google.com with SMTP id q186so3590403oia.9;
        Thu, 01 Dec 2022 14:42:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSoJgBw7gvJKRqtJPwGF8TC9wXnUbl77+8hQ4HnaDNg=;
        b=rZOOBe/8haQdgknScNb4ReoZHvxegeRbBiCVsQfYMe8bxmy4szUz+IqMS8o01r3hxO
         ykaYwhcGaqfmeRko9fXf+eA/aneyTt/FrF4wSNtIB1L75z2QJKSWI2SGoCoCqP7ACDq6
         9XHanVSkUZ58DFMjviQ8rP+FA0jPHInEa23bcFtl5P0q4nuJ1oJuV8rCufD0PJW+wJR8
         kz17xypmyitbOBXfRhlOPF8uvBDsTVHKRfvOFuqsAdxKw8P3QHWtArt9/ltIQeGdwW5k
         R+SP5HhrSaNyuHr9C/DBHOypZc7WlI1v9va1uQweDpaBdzrCeL+ydfRIl/Axx3v3EejH
         vDZw==
X-Gm-Message-State: ANoB5pkCKl5FzoXQ6AhbKOd9jHd8JpdnDgrJKOFY7tz6Vy/bJuaxkCVm
	OtxI4q1+/YAB3zfC8KjBSA==
X-Google-Smtp-Source: AA0mqf7svA0cxObJDPcHKDecL0TjB4LXILyHf3dlg0pDOqySswFXalFd1Qb1ROCnAafNRLIhvA0gbg==
X-Received: by 2002:a05:6808:7c1:b0:35a:eee1:6716 with SMTP id f1-20020a05680807c100b0035aeee16716mr24058254oij.173.1669934562232;
        Thu, 01 Dec 2022 14:42:42 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f97-20020a9d03ea000000b0066c41be56e7sm2617464otf.55.2022.12.01.14.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 14:42:41 -0800 (PST)
Received: (nullmailer pid 1578165 invoked by uid 1000);
	Thu, 01 Dec 2022 22:42:40 -0000
Date: Thu, 1 Dec 2022 16:42:40 -0600
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, netdev@vger.kernel.org, 
	John Crispin <john@phrozen.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Manoil <claudiu.manoil@nxp.com>, Marek Vasut <marex@denx.de>, 
	Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
	Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>, 
	Vivien Didelot <vivien.didelot@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Linus Walleij <linus.walleij@linaro.org>, UNGLinuxDriver@microchip.com, 
	Woojung Huh <woojung.huh@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Kurt Kanzenbach <kurt@linutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paolo Abeni <pabeni@redhat.com>, 
	Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	George McCollister <george.mccollister@gmail.com>
Subject: Re: [PATCH v3 net-next 05/10] dt-bindings: net: dsa: qca8k: utilize
 shared dsa.yaml
Message-ID: <20221201224240.GA1565974-robh@kernel.org>
References: <20221127224734.885526-1-colin.foster@in-advantage.com>
 <20221127224734.885526-6-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221127224734.885526-6-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_144246_777375_4A3138AB 
X-CRM114-Status: GOOD (  20.59  )
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

On Sun, Nov 27, 2022 at 02:47:29PM -0800, Colin Foster wrote:
> The dsa.yaml binding contains duplicated bindings for address and size
> cells, as well as the reference to dsa-port.yaml. Instead of duplicating
> this information, remove the reference to dsa-port.yaml and include the
> full reference to dsa.yaml.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> ---
> 
> v2 -> v3
>   * Remove #address-cells and #size-cells from v2. The examples were
>     incorrect and fixed elsewhere.
>   * Remove erroneous unevaluatedProperties: true under Ethernet Port.
>   * Add back ref: dsa-port.yaml#.
> 
> v1 -> v2
>   * Add #address-cells and #size-cells to the switch layer. They aren't
>     part of dsa.yaml.
>   * Add unevaluatedProperties: true to the ethernet-port layer so it can
>     correctly read properties from dsa.yaml.
> 
> ---
>  Documentation/devicetree/bindings/net/dsa/qca8k.yaml | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
> index 6fc9bc985726..93a9ddebcac8 100644
> --- a/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/qca8k.yaml
> @@ -66,20 +66,15 @@ properties:
>                   With the legacy mapping the reg corresponding to the internal
>                   mdio is the switch reg with an offset of -1.
>  
> +$ref: "dsa.yaml#"
> +
>  patternProperties:
>    "^(ethernet-)?ports$":
>      type: object
> -    properties:
> -      '#address-cells':
> -        const: 1
> -      '#size-cells':
> -        const: 0
> -
>      patternProperties:
>        "^(ethernet-)?port@[0-6]$":
>          type: object
>          description: Ethernet switch ports
> -
>          $ref: dsa-port.yaml#

So here you need 'unevaluatedProperties: false'.

unevaluatedProperties only applies to the properties defined in a single 
node level, and child nodes properties from 2 schemas can't 'see' each 
other. IOW, what dsa.yaml has in child nodes has no effect on this node. 

>  
>          properties:
> @@ -116,7 +111,7 @@ required:
>    - compatible
>    - reg
>  
> -additionalProperties: true
> +unevaluatedProperties: false

So this has no effect on anything within "^(ethernet-)?port@[0-6]$" and 
below.

Rob

