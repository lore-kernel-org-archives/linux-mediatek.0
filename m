Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8963C2BD09
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 17:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQ4G9gHer+vGikuMMCqTObACnz6EiIwEffwORvVea34=; b=27hOcIEMIpssoVKe1i2bcbPWoW
	SBOY9qtfeOx+Dp6rYpwr7eRsto5FwPnoAH3ponNQ+Dh2tYCQ1rN5YgsWAU9nmBiGc0MRU+QzJmuJE
	eeoh1D5W33q9NnQX7j0o0ggMuZLazr7lwrnTKDh75CQxmbZOzPeDNV979Ybo6pOmXd67puwE56Hlo
	oBZzGeC2bPO2QjNoG24ipu23q0vUoiFtz4eFvb0M56xBn474tmGHbe4wfbITdgZ+u+Z+7MWBJ8kFx
	ZAdBK0sDFN8/E6XmQD/Np2XnDk4SReF8pinxtkdmoeDp7pv0IK6EsEYUAeP7LeNOK5NW2tjjUdTHn
	b1lMeyMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLn30-000000001Hl-17Lk;
	Mon, 24 Jun 2024 17:00:06 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLn2u-000000001GS-1BHA;
	Mon, 24 Jun 2024 17:00:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D95E0E0003;
	Mon, 24 Jun 2024 16:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1719248397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yQ4G9gHer+vGikuMMCqTObACnz6EiIwEffwORvVea34=;
	b=WaByuFDkkhlrEUniTJL8/4WDvdgswAlaHd8tSxvOr2wDMPKTIA40qJExeDYTH24tp9b/n3
	1sZtfv/v29UJVa4jLCbqZr1t/fjSQ70b7XMeZfWua+cU3Ompcsk7wNfzuXu/awfKgYhLS3
	R/Bvd/okJC8y63AbOWE9oMHYoODqFDxqkOoCgeg9T5xjFbKy8iqlXiRk8n+/Om1Fg+bt2X
	FAhPcorxp3rV9QZdpdQki3zHm4sKjMvfNqlGAmjTMH8oKz1M5DptG/LR8ufUxPLilBMVaU
	8Bm28divy2PghoSiFXl3tV7nT27G4ou/ZF8v++BWdOF39p7BEn+HZ3H3IHyFEQ==
Message-ID: <68961d4f-10d8-4769-94d3-92ce709aa00a@arinc9.com>
Date: Mon, 24 Jun 2024 19:59:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: net: dsa: mediatek,mt7530: Minor grammar
 fixes
To: Conor Dooley <conor@kernel.org>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, andrew@lunn.ch,
 f.fainelli@gmail.com, olteanv@gmail.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>
References: <20240624025812.1729229-1-chris.packham@alliedtelesis.co.nz>
 <704f4b95-2aed-4b76-87cb-83002698471c@arinc9.com>
 <20240624-radiance-untracked-29369921c468@spud>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240624-radiance-untracked-29369921c468@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_100000_626383_9205413D 
X-CRM114-Status: GOOD (  18.35  )
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

On 24/06/2024 19.29, Conor Dooley wrote:
> On Mon, Jun 24, 2024 at 10:00:25AM +0300, Arınç ÜNAL wrote:
>> On 24/06/2024 05.58, Chris Packham wrote:
>>> Update the mt7530 binding with some minor updates that make the document
>>> easier to read.
>>>
>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> ---
>>>
>>> Notes:
>>>       I was referring to this dt binding and found a couple of places where
>>>       the wording could be improved. I'm not exactly a techical writer but
>>>       hopefully I've made things a bit better.
>>>
>>>    .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml        | 6 +++---
>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> index 1c2444121e60..6c0abb020631 100644
>>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> @@ -22,16 +22,16 @@ description: |
>>>      The MT7988 SoC comes with a built-in switch similar to MT7531 as well as four
>>>      Gigabit Ethernet PHYs. The switch registers are directly mapped into the SoC's
>>> -  memory map rather than using MDIO. The switch got an internally connected 10G
>>> +  memory map rather than using MDIO. The switch has an internally connected 10G
>>>      CPU port and 4 user ports connected to the built-in Gigabit Ethernet PHYs.
>>> -  MT7530 in MT7620AN, MT7620DA, MT7620DAN and MT7620NN SoCs has got 10/100 PHYs
>>> +  MT7530 in MT7620AN, MT7620DA, MT7620DAN and MT7620NN SoCs have 10/100 PHYs
>>
>> MT7530 is singular, the sentence is correct as it is.
> 
> Actually, the sentence is missing a definite article, so is not correct
> as-is.

The definite article is omitted for the sake of brevity. I don't believe
omitting the definite article renders the sentence incorrect.

> 
>>
>>>      and the switch registers are directly mapped into SoC's memory map rather than
>>>      using MDIO. The DSA driver currently doesn't support MT7620 variants.
>>>      There is only the standalone version of MT7531.
>>> -  Port 5 on MT7530 has got various ways of configuration:
>>> +  Port 5 on MT7530 supports various configurations:
>>
>> This is a rewrite, not a grammar fix.
> 
> In both cases "has got" is clumsy wording,

We don't use "have/has" on the other side of the Atlantic often.

Arınç

