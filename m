Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D010C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 08:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFqgWmLTPu6Efm5uqI8QHWhAPlyBeMn1zR3+/c+MyV4=; b=OexhZDycmmIH9cFRCCbDRDkwtr
	Y1uzEAvLkSDGImCuSvY1uHDbs0D2wa02QoNU51FB0H3+992thG1d8jZ78iGGqlz+sMHU/GRPjkECq
	XUunX7vjuO7BbfL3kCfug2aLWjnvN64cNRlW7bEo14RHX6fhIP/W7PS7FLBYbzj43acYl/ps7Uudn
	ukrOByC8uWAVwvp0INodTJoY+VwSSoZFF15ORhvLT8Z/5JN0G8UQU+si7WLIpTytbRcbogLRXKERa
	ZcXFR1Zo5d9WCvoLECmMrCQppJE4Lyx9M6vx+gTQ+APsqVWtknQ7blkjvrh6q/rq6L8oTPsCOF3Ke
	uCjpV3Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozvbI-007CXe-0E; Tue, 29 Nov 2022 08:04:20 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozvYb-007Aga-GI; Tue, 29 Nov 2022 08:01:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1669708863; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mt8zflQluXrktvTMy1+7/wqUymDJuNvxcCt9uUvUKw10sGTDK0MmA+82aNr+WwHy9LSPljlTOlsgEk2qQ+EFoOjz+teCuYjgTlWnrXhLgNnE8tc4Ud3W0t3AncJ7vXMDugqp76mqGhM2nALe85m0kzUnLVwq/PXuz8TkjBabTtQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669708863; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=SFqgWmLTPu6Efm5uqI8QHWhAPlyBeMn1zR3+/c+MyV4=; 
	b=XrJLcU4oGZ6bewSlAoGFPefar0lVihXpG2DX7/j5p01eou8CQKfswf1NEdKjTW33pEsGgoBnOvPF1JHhQyILjBt9OXmPxSquYOZ1IP3sOuLQzdbv22MSDzh9ZRPSZDdndb8TawlE4FdHYC54PhKac4RuD6J1t+Fne3mLQOnEN/w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669708863;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=SFqgWmLTPu6Efm5uqI8QHWhAPlyBeMn1zR3+/c+MyV4=;
	b=NzMQ77o6X9I3VrDmPEHUQN1icfGztgC2EGc0z02LnLq1jMb3ZETBFPplSN2gf4gy
	SoLMOp5SVhwl/Ioye3A0wg2ZZtIwr++hN1PXGbga2DP1ttKOv/OC9+9KCKhrBTR8ucQ
	zyYoL7Sc7+oh6Um8H7311lXEphsGe+F/tIg5zvrU=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by mx.zohomail.com
	with SMTPS id 1669708862210987.5702214730692; Tue, 29 Nov 2022 00:01:02 -0800 (PST)
Message-ID: <25533005-60bf-a9bb-d6a0-d14e1804291a@arinc9.com>
Date: Tue, 29 Nov 2022 11:00:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 net-next 06/10] dt-bindings: net: dsa: mediatek,mt7530:
 fix port description location
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 John Crispin <john@phrozen.org>,
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
References: <20221127224734.885526-1-colin.foster@in-advantage.com>
 <20221127224734.885526-7-colin.foster@in-advantage.com>
 <08784493-7e85-9224-acfa-9a87cbd325e7@arinc9.com> <Y4WnjiE2IxDgi5mc@euler>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <Y4WnjiE2IxDgi5mc@euler>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_000133_691829_24787EFF 
X-CRM114-Status: GOOD (  24.14  )
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

Hey Colin,

On 29.11.2022 09:32, Colin Foster wrote:
> Hi Arınç,
> 
> On Mon, Nov 28, 2022 at 11:28:31AM +0300, Arınç ÜNAL wrote:
>> On 28.11.2022 01:47, Colin Foster wrote:
>>> The description property was located where it applies to every port, not
>>> just ports 5 or 6 (CPU ports). Fix this description.
>>
>> I'm not sure I understand. The description for reg does apply to every port.
>> Both CPU ports and user ports are described. This patch moves the
>> description to under CPU ports only.
> 
> You're right. I misinterpreted what Rob suggested, so the commit message
> isn't correct. I see now that reg applies to every port, but is only
> restricted for CPU ports (if: required: [ ethernet ]).  I'll clean this
> message up.
> 
>>
>>>
>>> Suggested-by: Rob Herring <robh@kernel.org>
>>> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
>>> ---
>>>
>>> v2 -> v3
>>>     * New patch.
>>>
>>> ---
>>>    .../bindings/net/dsa/mediatek,mt7530.yaml          | 14 +++-----------
>>>    1 file changed, 3 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> index 7df4ea1901ce..415e6c40787e 100644
>>> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
>>> @@ -156,17 +156,6 @@ patternProperties:
>>>        patternProperties:
>>>          "^(ethernet-)?port@[0-9]+$":
>>> -        type: object
>>> -        description: Ethernet switch ports
>>> -
>>> -        unevaluatedProperties: false
>>> -
>>
>> Would be nice to mention these being removed on the patch log. Or remove
>> them while doing ("dt-bindings: net: dsa: utilize base definitions for
>> standard dsa switches").
> 
> Agreed. My gut is telling me this wants to be in a separate patch from
> the generic DSA base definitions patch... but I can't say why for
> certain. I'll plan to move these to the patch you suggest and add a comment

If I understand correctly, with ("dt-bindings: net: dsa: utilize base 
definitions for standard dsa switches"), these properties are now 
defined on dsa.yaml#/$defs/base and no longer needed to be defined here 
since mediatek,mt7530.yaml was also made to refer to it. It'd make sense 
to remove these properties there as there's continuity.

> in there about how the type, description, and unevaluatedProperties of
> mediatek,mt7530 is no longer needed as a result? Keep this patch as more
> of a "restrict custom port description to CPU ports only" patch?

I'd say get rid of this patch and do above. Trust your gut though. ;P

Arınç

