Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FE3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 12:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6xCZeqSXkRVqL5XKTAL0ZliskdqfqqHwXtGElu5SsM=; b=q0dxUkmYRLQX1X
	JkccYYPzFShafkYD6tk45la7eu9VisfCN06l1+2PBYbQtxnn3keOn553U3oNXm3m2D6FU/YjEboos
	wm5Beao8vb4ETcvQUa+CmvMpW70jNqxiWvBnmEUKangpL9DH+L+mXjU8nfCtSki/nVIGP/+yaGQYw
	qbfAUwT0/rn8oIWrwmiyqr7KhoNIOKvOdxlsmhaZ52iuYOHrcUUJukFuo/iaOJS41kV7mRLLRiQWA
	yLLcpqaMz2x+r6/AYwiXCJV6cO527ZuQkhNLuusnSyUjA7eeKwd0AT82Ak3B5ElAv27jOAU9x/Fvp
	DTrKds8nhqkLwLvyohRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntTV0-007xTt-NK; Tue, 24 May 2022 12:18:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntTUp-007xQ5-GC; Tue, 24 May 2022 12:18:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 759CF1F43F10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653394722;
 bh=qL2zwEVTGyHx3qjDE2gF4fhdtuxKIJOmdMC0x5/fTok=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JQ/tsavMoWUhJC7+r53CgL89tt+wgN9dKsUbLNgReY5V8a7Aos7c1EZ0Ox8KLUmuK
 rjA/ZAdXfjCML/ZzbOeElopTUlqZPg08pOCyFDmDmCSeUEZ6/jlF29jltWhcAU7031
 wxobtSG5g4sh+pudjAra1pOPwbYlU87ccTtoJ9UhDVJgj6YR8z/REy/IVbhXBn4klo
 /Sz2022c8TNJD85AY5pdw6JEndg0FnTxWRvwXfScGpAxifmFt6CxSTR6YD6CzTVuEv
 4x41a+rizq6hS0r8kFj9cx9XrFLdW2dytM6cSpE9hS2QaC7S0CyZpya/Pm8V3DtMiS
 DI8bm98tL04Vg==
Message-ID: <8d1411a7-0714-1667-ffd4-3de99732b1a3@collabora.com>
Date: Tue, 24 May 2022 14:18:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] dt-bindings: mailbox: mtk-gce: Convert txt to json-schema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org
Cc: jassisinghbrar@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, houlong.wei@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220519101806.18097-1-angelogioacchino.delregno@collabora.com>
 <45e78390-5f91-7ac7-45d8-5796bc608234@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <45e78390-5f91-7ac7-45d8-5796bc608234@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_051843_853486_7806ECE4 
X-CRM114-Status: GOOD (  23.72  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/05/22 10:15, Krzysztof Kozlowski ha scritto:
> On 19/05/2022 12:18, AngeloGioacchino Del Regno wrote:
>> Convert the mtk-gce documentation from freeform text format to a
>> json-schema.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../bindings/mailbox/mediatek,gce-mbox.yaml   | 114 ++++++++++++++++++
>>   .../devicetree/bindings/mailbox/mtk-gce.txt   |  82 -------------
>>   2 files changed, 114 insertions(+), 82 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gce-mbox.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/mailbox/mtk-gce.txt
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mbox.yaml
>> new file mode 100644
>> index 000000000000..750391b4038c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mbox.yaml
>> @@ -0,0 +1,114 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mailbox/mediatek,gce-mbox.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek Global Command Engine (GCE) mailbox
>> +
>> +maintainers:
>> +  - Houlong Wei <houlong.wei@mediatek.com>
>> +
>> +description: |
>> +  The Global Command Engine (GCE) is used to help read/write registers
>> +  with critical time limitation, such as updating display configuration
>> +  during the vblank.
>> +  The GCE can be used to implement the Command Queue (CMDQ) driver.
> 
> Mention the headers in description.
> 

   Values for properties used by the GCE, such as sub-system IDs, thread

   priority and event IDs are defined in 'dt-bindings/gce/<chip>-gce.h'.

Would that be enough, or should I list all of the headers?

>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - mediatek,mt6779-gce
>> +      - mediatek,mt8173-gce
>> +      - mediatek,mt8183-gce
>> +      - mediatek,mt8186-gce
>> +      - mediatek,mt8192-gce
>> +      - mediatek,mt8195-gce
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: gce
>> +
>> +  '#mbox-cells':
>> +    description: |
>> +      The first cell describes the mailbox channel, which is the GCE Thread ID;
>> +      The second cell describes the priority of the GCE thread.
>> +    const: 2
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - clock-names
>> +  - '#mbox-cells'
>> +
>> +additionalProperties: false
>> +
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - mediatek,mt8195-gce
>> +    then:
>> +      properties:
>> +        clocks:
>> +          maxItems: 2
> 
> Are you sure this works on mt8195-gce?
> 

Thanks for that, I've just rechecked the driver and.. no, that won't
work for MT8195: it's just one clock there (like the others) and the
clock names aren't even enforced, as the driver is always taking the
clock at index 0.

I got confused because the driver uses a slightly different kind of
logic when probing on SoCs with multiple mailboxes, specifically:
  - For single mailbox, having a clock with name "gce" is enforced
    as it's grabbing it with devm_clk_get(dev, clk_name), where the
    clock name is declared in a string called "clk_name";
  - For multiple mailboxes, it's looking for an of_alias, declared
    in an array of strings called "clk_names" and getting the clock
    with of_clk_get(node, 0).


So there comes my confusion, recapping:

static const char * const clk_name = "gce";
                  <- this is a clock name
static const char * const clk_names[] = { "gce0", "gce1" }; <- OF alias names


At this point, I think that the best idea would be to fix this issue
first... luckily there's no MT8195 devicetree upstream yet, so I would
technically not be breaking any ABI by changing it to be the same as
the others.

Easier explanation: plan is to change the driver such that we won't
need anything different from the others in this schema.

New version coming soon, then....

Regards,
Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
