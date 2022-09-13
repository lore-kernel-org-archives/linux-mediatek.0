Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221B6C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 08:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KpT3Z+vTyRUI5wW7rWc8V4IlD/xU6jCCdxfp77xS5Ok=; b=yfaJf9iSeKOSuDxqpWA7/9CMMp
	K/n8cYNn0Oh/4tnf+O5OmDdM1vSwLkq92J/ztRFRaRpeei4IIM4U2vQveBY3WBwF0rOIABkJsF1Vb
	sl22b9/2iMTULM6HVZ4geimUOZ/JLhaULPcKnmdN83rLXIXiX+7wlPzRal5NL4iuzEdWO0B9rDpdJ
	lJcXG4P6YKsTx/joJtPAuJ9XgI8ezYI8Sxoa1i4YzxOW5CG+RGg3+73TO0DQd15x/J9NJv5/cx+ek
	H+mRlNnGCCy6duuOCut2db65B03obMDoS/NZGY602SmF+rBOdO9AGISPbWcimt+NQIxmXDiYQhpTe
	PjitaBuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY19t-004F39-MR; Tue, 13 Sep 2022 08:20:41 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY19F-004EXK-1N; Tue, 13 Sep 2022 08:20:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663057171; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ND3H3RZS/MPuMrzk1w/QgPwGKSB4cE0JBpwBGWJ27LMJY9v/lKBW9O4H6ym2rwNaZalVPVqKK2QMud7LDWDuZDq9vlH2CsBpSAxoIeLKZrnWQHFquBKIzFVab8K4WbcUmJ3mbiJYK20qOFcTO3Co8o1bwWvDSSdXJJXhGhQByBI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663057171; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=KpT3Z+vTyRUI5wW7rWc8V4IlD/xU6jCCdxfp77xS5Ok=; 
	b=QXGOz+SmBvwJ46WQ7hEe3Wuq3fgUlJM+fXlt/TFt2VyvdZ3uSPq9Xo2V08fdp9NpObZh3fvNibo2TbsBs+8a3ugj2eN2VVeeZXtWqdkjtR3CqCYpK1Kj67JU5Y5TkFzmva/sXt6qjF/ELfEXQltTqkxpiO/idR7vrhhzcz3ud0Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663057171;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KpT3Z+vTyRUI5wW7rWc8V4IlD/xU6jCCdxfp77xS5Ok=;
	b=BzFPuY4aS3bEKuiBKizrvEGkCNKwWyPX1BHI2Oprq+9M91PVK6CerXO67UMCjMz6
	S16B3yS0ww902y+8YmBhh/e8P8qBJ5weGhDd4xSgAb/EW5foDV1vlI4FI+BMHpBRlHD
	PfjM1DZl9nLgZD1znbjGjH8mm8beJSFBzZ4lK/5Q=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663057169472870.4451352402363; Tue, 13 Sep 2022 01:19:29 -0700 (PDT)
Message-ID: <f7d5d961-8f66-e744-ab59-0077445d5873@arinc9.com>
Date: Tue, 13 Sep 2022 11:19:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH net-next 2/3] dt-bindings: net: dsa: mt7530: stop
 requiring phy-mode on CPU ports
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 George McCollister <george.mccollister@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Alvin_=c5=a0ipraga?= <alsi@bang-olufsen.dk>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Marek Vasut <marex@denx.de>,
 John Crispin <john@phrozen.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20220912175058.280386-1-vladimir.oltean@nxp.com>
 <20220912175058.280386-3-vladimir.oltean@nxp.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20220912175058.280386-3-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_012003_636057_39C4AAAB 
X-CRM114-Status: GOOD (  11.99  )
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

On 12.09.2022 20:50, Vladimir Oltean wrote:
> The common dsa-port.yaml does this (and more) since commit 2ec2fb8331af
> ("dt-bindings: net: dsa: make phylink bindings required for CPU/DSA
> ports").
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

> ---
>   Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index fa271ee16b5e..84bb36cab518 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -165,9 +165,6 @@ patternProperties:
>             - if:
>                 required: [ ethernet ]
>               then:
> -              required:
> -                - phy-mode
> -
>                 properties:
>                   reg:
>                     enum:

