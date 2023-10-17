Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD76BCDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 19:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRbfGybtcC4Q4xK9Jhz49EEEj1HrZpSkJKq488b1wYI=; b=d3taHu2k5Prze76+jVZUMdcWJI
	C4kNye+wvHu07BmKjJAH6JszqbBA76QPPO92Ge+qe9VjoZlwfcxYDXP9jWsUb/11upjM53J/zKK3B
	ELJbYiQrU/of4+QFL1MSvrigxVXXDK6aGdD6FDucKLEQpgyzOf2+3IqffJnLLOFbbeR5PzrHuhcp1
	5hixzWK7Q258Jj6RwADzbWiYQdZ2uyRvDTJMq8PLBo88dioIY4ie5E2YJKCI/E5BxKYxIlj9tMzYN
	yIQgbGnPPgAIJ+Q0eH5dtnolewaIJr5bHlwiV6gtetdEVeUEnMD71o8SMRB9XeNjAx3tHRLMbSfTZ
	Xo+kEevw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qspbL-00D4pp-1w;
	Tue, 17 Oct 2023 19:19:35 +0000
Received: from mx11lb.world4you.com ([81.19.149.121])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qspbH-00D4ko-2F;
	Tue, 17 Oct 2023 19:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hRbfGybtcC4Q4xK9Jhz49EEEj1HrZpSkJKq488b1wYI=; b=f3O6uWhfVuFcx5VC4Lri+Z8xMP
	aEAuW35JcCDw5jyvHUXN3ojVvwLDrrKBdcXWV35W/scFFPYxd/XGYrSFvo7AMm1p+AcgQuC5HxjHh
	4tLECcrM98rS0sfpSF238CJu0LyNkPyA/fEFFJQoq3wZ3pRV5a9B7XA1KST8l+3I6Qyg=;
Received: from [88.117.60.21] (helo=[10.0.0.160])
	by mx11lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1qspai-0000aP-2c;
	Tue, 17 Oct 2023 21:18:56 +0200
Message-ID: <00181d0f-e7b3-4fb1-a3f7-12935ab03f8b@engleder-embedded.com>
Date: Tue, 17 Oct 2023 21:18:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/8] dt-bindings: net: Add missing
 (unevaluated|additional)Properties on child node schemas
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
 =?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 John Crispin <john@phrozen.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
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
 <20231016-dt-net-cleanups-v1-1-a525a090b444@kernel.org>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <20231016-dt-net-cleanups-v1-1-a525a090b444@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AV-Do-Run: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_121931_749421_9B8BDAF5 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

On 16.10.23 23:44, Rob Herring wrote:
> Just as unevaluatedProperties or additionalProperties are required at
> the top level of schemas, they should (and will) also be required for
> child node schemas. That ensures only documented properties are
> present for any node.
> 
> Add unevaluatedProperties or additionalProperties as appropriate.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml     |  2 ++
>   Documentation/devicetree/bindings/net/dsa/brcm,sf2.yaml        |  1 +
>   Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml |  2 ++
>   .../devicetree/bindings/net/dsa/microchip,lan937x.yaml         |  1 +
>   Documentation/devicetree/bindings/net/dsa/nxp,sja1105.yaml     |  2 ++
>   Documentation/devicetree/bindings/net/dsa/qca8k.yaml           |  1 +
>   Documentation/devicetree/bindings/net/dsa/realtek.yaml         |  2 ++
>   .../devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml        | 10 ++--------
>   Documentation/devicetree/bindings/net/engleder,tsnep.yaml      |  1 +

Looks good for tsnep.

Reviewed-by: Gerhard Engleder <gerhard@engleder-embedded.com>

Thank you!

>   Documentation/devicetree/bindings/net/nxp,tja11xx.yaml         |  1 +
>   10 files changed, 15 insertions(+), 8 deletions(-)

