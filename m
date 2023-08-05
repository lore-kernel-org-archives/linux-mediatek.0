Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6024C001DE
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Aug 2023 20:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sB0DYsnKTLjhfxTTwRqjmaAwhvS5Yj9DfCBbL9YyVtQ=; b=b/20HZruQgVlav+i42aCMNPrTs
	BlFocvX4d02qfZJ/uFp2bHc5Ztvc1FGVNjImaOyaxdLpFTjNmjInwGlhkAndF7TFa6Gpw8drfHFxs
	yZGhnjsfi5bgYLT5FV+qA/diEhq8XBwVRrKOGvKGG2SJU6HiZe7zdiH1hjrHIPFkxj5jeRDX1NwW+
	2XsOWO+vfn0oKTNi5TJPTJuu4u7V5Ko5oOoa18FT1aBe+jvyYkLngpRPFASzz4/PfuAiyN1uHyqDf
	zSHDOQnXFn4fj/BOMo4I1SnYCBW8tzjeuXpj5mwDLJdAmlS82HGw+na0isFG1jglO+VTpwZZ89pVB
	/+pHvVCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSNgX-00EWew-1L;
	Sat, 05 Aug 2023 20:15:37 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSNgR-00EWdu-2n;
	Sat, 05 Aug 2023 20:15:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D199E40002;
	Sat,  5 Aug 2023 20:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1691266524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sB0DYsnKTLjhfxTTwRqjmaAwhvS5Yj9DfCBbL9YyVtQ=;
	b=ihlfUg8Wv/z9rdF68pSORNQLzSef2eaYYFg2w+fLwW8qapqdRFc0qvnIAV8eE7+cuXfwYy
	6tRwUkiz16SPA+PiE5yIsx1EvDhp0uVlQvWYO8SCxLf0nz+5DlkGXod9v0FAkpiRPY3D6N
	5ZUtPQNfI/cF7IH5OFzEZQogO+wjuzgkU77B4XHB4vZhuIqTdtXhdUj0N23p9sGBzEPmSX
	HxiaE8C2hvesqwDOAnyQOQ6Ob9pl9ksqezvRDQUEeGHjYh4uM1Zmcw+rZGnD5fQUHe2mfU
	3t3gyPMtZvs/70Rwao1QNYYjg4bMeINSi+b1SazRNIChMqrbfaSOdpIDaSh68Q==
Message-ID: <dcb981b9-b435-c0e5-8e47-d66add207fdc@arinc9.com>
Date: Sat, 5 Aug 2023 23:15:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND net-next 2/2] dt-bindings: net: dsa:
 mediatek,mt7530: document MDIO-bus
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <6eb1b7b8dbc3a4b14becad15f0707d4f624ee18b.1691246461.git.daniel@makrotopia.org>
 <9aec0fe0cb676b76132c388bb3ead46f596a6e6e.1691246461.git.daniel@makrotopia.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <9aec0fe0cb676b76132c388bb3ead46f596a6e6e.1691246461.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_131532_079469_42958636 
X-CRM114-Status: GOOD (  16.26  )
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

I don't see a reason to resubmit this without addressing the requested 
change.

>> Wouldn't we just skip the whole issue by documenting the need for defining all PHYs
>> used on the switch when defining the MDIO bus?
> 
> Good idea, please do that.

https://lore.kernel.org/netdev/0f501bb6-18a0-1713-b08c-6ad244c022ec@arinc9.com/

Arınç

On 5.08.2023 17:43, Daniel Golle wrote:
> From: David Bauer <mail@david-bauer.net>
> 
> Document the ability to add nodes for the MDIO bus connecting the
> switch-internal PHYs.
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>   .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml        | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index e532c6b795f4f..50f8f83cc440f 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -128,6 +128,12 @@ properties:
>         See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt for
>         details for the regulator setup on these boards.
>   
> +  mdio:
> +    $ref: /schemas/net/mdio.yaml#
> +    unevaluatedProperties: false
> +    description:
> +      Node for the internal MDIO bus connected to the embedded ethernet-PHYs.
> +
>     mediatek,mcm:
>       type: boolean
>       description:

