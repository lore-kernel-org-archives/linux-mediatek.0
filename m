Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B40C2BD05
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 07:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b19k+/foFyMzoSDxq1RThplVOtb1XjVmJDOSBecBwtA=; b=hrM1MjtukocYHlVYjS5yVQhXUJ
	HIGzKXHoNAL3rOdhuQDqbxRHFCF19D7SZ+uCpgjLU/Zj5w+zBMVU2/AwwtAPZCX5yAL7Fy4jfsjBu
	bUgKwGnJLun/780BI4LWxqno0zMqWcH0AM5U9BvHPXHHNlOfO3PmPjMfjD85X9zJJAyRm2vILYmkv
	7oS68iU34y7vxJWgJ43NW5siYLdEqCmxryJ91WaqMuh7ykTVjHl/JXoR8etmVCTuHoA8Qf+wwGJB4
	QyCseoviPOZ4nH1OfYdc/+PB4RAv89G0DjmLcFK+M8xPQEfOZcI2zoGeXpJ7U8dCdBmtwWOwiTkPd
	VTb+TfVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLdh0-0000000FnrH-3DCf;
	Mon, 24 Jun 2024 07:00:46 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLdgv-0000000Fnq1-0fpp;
	Mon, 24 Jun 2024 07:00:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B9A0640009;
	Mon, 24 Jun 2024 07:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1719212432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b19k+/foFyMzoSDxq1RThplVOtb1XjVmJDOSBecBwtA=;
	b=k5U//jmsb7SQzA1xVwp91Vdb/6n0HBtyxVKJJnfrQ9T5e34PnwanYqHLLOLusY1LuDX9BI
	OBLtqjiyTLcxOXQNcHrNBuEWxFHgtGpN70z15/U6jRWZWqHpb1RhcoZYOBuHKiblzH/8e7
	pxTA0hZxYbN5TvTDvvrb42iG5Isdbu5eI6X63Ff6lBKdVZgNCkf/N71Y7IvgUt2Y5+WE/s
	yFI5aDKXeqoWnhMl69rXx6SqxejVebzQHOewlxSnw/yQFHyYNT8rEY+ZluEfZmZ/01NZQ3
	UCewzl47uimWeqszuqbL4ZGbyIHABNGZKQaXyzSxC3CmAY4W9DtTJkdSw5208Q==
Message-ID: <704f4b95-2aed-4b76-87cb-83002698471c@arinc9.com>
Date: Mon, 24 Jun 2024 10:00:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: net: dsa: mediatek,mt7530: Minor grammar
 fixes
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, andrew@lunn.ch,
 f.fainelli@gmail.com, olteanv@gmail.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>
References: <20240624025812.1729229-1-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240624025812.1729229-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_000041_515668_E8C1DAC3 
X-CRM114-Status: GOOD (  19.53  )
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

On 24/06/2024 05.58, Chris Packham wrote:
> Update the mt7530 binding with some minor updates that make the document
> easier to read.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> 
> Notes:
>      I was referring to this dt binding and found a couple of places where
>      the wording could be improved. I'm not exactly a techical writer but
>      hopefully I've made things a bit better.
> 
>   .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml        | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index 1c2444121e60..6c0abb020631 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -22,16 +22,16 @@ description: |
>   
>     The MT7988 SoC comes with a built-in switch similar to MT7531 as well as four
>     Gigabit Ethernet PHYs. The switch registers are directly mapped into the SoC's
> -  memory map rather than using MDIO. The switch got an internally connected 10G
> +  memory map rather than using MDIO. The switch has an internally connected 10G
>     CPU port and 4 user ports connected to the built-in Gigabit Ethernet PHYs.
>   
> -  MT7530 in MT7620AN, MT7620DA, MT7620DAN and MT7620NN SoCs has got 10/100 PHYs
> +  MT7530 in MT7620AN, MT7620DA, MT7620DAN and MT7620NN SoCs have 10/100 PHYs

MT7530 is singular, the sentence is correct as it is.

>     and the switch registers are directly mapped into SoC's memory map rather than
>     using MDIO. The DSA driver currently doesn't support MT7620 variants.
>   
>     There is only the standalone version of MT7531.
>   
> -  Port 5 on MT7530 has got various ways of configuration:
> +  Port 5 on MT7530 supports various configurations:

This is a rewrite, not a grammar fix.

Arınç

