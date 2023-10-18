Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DE4CDB47E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 09:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVKii9ueJQTXrmJv/xlWd/pBh5EbWT9TwHnx3wpagyU=; b=LetR1OE0F5wgTXkdfywGDYeC8g
	FPepWM6kLJi7ck4P5l5GmKnjOcgic6B/bADwPaoRuKlSgKE+t+8Df7xlK2Ehb3KthuelzVq8MYrOj
	9q/b8rfhR7yN8V/Al8ewsgqbku10U5XSmsbS2GaKFoUBpEpFL7tBTZOVAPGkug/2g/eEiUkQ0Nqup
	wwejV4hRcN8rNZc9nkQ4hwss+I5MmyDOVQVVFFBC8mGbqFqarle4QGzMQKtzzofjSNxvy69WF0QxE
	U1XUGHLyHnJqULYFIeCNhjdjRv/8JeLmAs2KSiu4JC1J+xAOmj4IOy+QlJo1cyCACtiG4Os2NQnPh
	RsmVKbWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt2ri-00EHDD-2j;
	Wed, 18 Oct 2023 09:29:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt2rf-00EHBB-1I;
	Wed, 18 Oct 2023 09:29:20 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5CBCF66072F4;
	Wed, 18 Oct 2023 10:29:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697621354;
	bh=9tOmuNn4amTBPLiqMSY+fjbpWsftcPyLojA4Ajbn/i4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JAmaOnc8L/a1j+NJQYq51be9a8L1S6SSABYLIpIQohVhh/JU3mupOYp0AV1kbjNzO
	 QtfJwQfrDdMI3wKugWGifvg+qZ3+wdXSE8XcNDAy4hOvCdeVqtJCGOPbvWFvJDTtAd
	 vordH3lM8ogVIUW0t3pB66pkY3mSfiW/VcXF88H/qolQG4n/m8C6+1L5h9Y9Vxe+HF
	 K4J99Q7PJSZ+WwbBTiJv8V91P/clTm1f070VF1Sc7XouxUm8nxPyakNiBPRD0xcd/j
	 /G3vxbWnuGOEbR7vJE1dutgoTfcnBA/CRTdqF3121XTnXJ8uNueEV3lr1E0DEqYW1m
	 c1BVbyVmz8zKg==
Message-ID: <a9f0acfb-742a-4197-8237-9666fedf5fc3@collabora.com>
Date: Wed, 18 Oct 2023 11:29:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/16] dt-bindings: media: mediatek: mdp3: merge the
 indentical RDMA under display
Content-Language: en-US
To: =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
 <20231012084037.19376-3-moudy.ho@mediatek.com>
 <0e972a0a-af27-4837-a80c-cbab0002d368@linaro.org>
 <324f170c69387c5587688ae7bee5ddf95bc94576.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <324f170c69387c5587688ae7bee5ddf95bc94576.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_022919_697514_8D5FDCFC 
X-CRM114-Status: GOOD (  20.56  )
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

Il 18/10/23 05:06, Moudy Ho (何宗原) ha scritto:
> On Fri, 2023-10-13 at 08:46 +0200, Krzysztof Kozlowski wrote:
>>   	
> 
> Hi Krzysztof,
> 
> Thank you for assisting with the review.
> 
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>   On 12/10/2023 10:40, Moudy Ho wrote:
>>
>>>   
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: mediatek,mt8183-mdp3-rdma
>>> +
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          items:
>>> +            - description: RDMA clock
>>> +            - description: RSZ clock (shared SRAM with RDMA)
>>> +
>>> +        mboxes:
>>> +          items:
>>> +            - description: used for 1st data pipe from RDMA
>>> +            - description: used for 2nd data pipe from RDMA
>>
>> interrupts:
>>    false
>>
> 
> As Angelo provided additional clarification in [15/16], explaining that
> certain conditions in [2/16] and [3/16] were intentionally omitted due
> to the need to integrate the same IP with different operations.
> Apologies for any inconvenience this has caused you.
> 

MT8183's MDP3 RDMA interrupt property was omitted in the devicetree that we
have upstream because it was either unused in the driver, or MTK didn't want
to actually use it for reasons, but that SoC *definitely does* have a mdp_rdma0
IRQ and a mdp_rdma1 IRQ.

That's the same for MT8186 and MT8188... and it's probably the same for all
MediaTek SoCs, so interrupts shouldn't be disallowed in this binding.

>>> +
>>> +      required:
>>> +        - mboxes
>>> +        - mediatek,gce-events
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: mediatek,mt8195-vdo1-rdma
>>> +
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          items:
>>> +            - description: RDMA clock
>>
>> mboxes: false
>> mediatek,gce-events: false
>>
>> I am not so sure it is actually "simpler" to merge these. They are
>> quite
>> different. You will end up with unmanageable allOf  with a lot of
>> branches (which supposedly you want to remove).
>>

It's the same thing as "split"... All of the display and mdp/mdp3 components of
MediaTek SoC do support GCE mailboxes by HW, so it's not limited to "split", but
literally all of them.

Disallowing mboxes and/or mediatek,gce-events on *any* of those is actually wrong.

Cheers,
Angelo

>>
> 
> Upon examining the minor hardware changes in MDP for MT8183 and MT8195
> RDMA ([3/16]), it appears that branching cannot be avoided. However,
> consolidating these changes has the additional advantage of addressing
> Rob's concerns from v4. Perhaps we can consider the current changes as
> a form of progress.
> 
> Sincerely,
> Moudy
> 
>>> +
>>>   additionalProperties: false
>>>   
>>>   examples:
>>
>> Best regards,
>> Krzysztof
>>



