Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C443C27C54
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 11:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSZUHBAYaHL3BMvGmdMY1lDKdN8dvOSdJXvo60NyG/Y=; b=nqjEygrYHlDcChGHHgqhMslj2a
	C2AZXiHvY1+9uCVpQ4NBSR71I/YGLuFMR8Megh7ycPic9Of21VWyCHpkikAfNx9YgDPWPHOqLB1Lt
	WJwPKephz7T7M2B6tjwHfyc2atl49v4rXpppm/COw3zNIi5946MDusRyb8rb4xbMLoEHA5JBeYA3e
	dAVUMddpenUeN2BfiC4i9Iy5X1Amb4UBxP/SULkOc6oJ2X4Pl4MJFWwvEo07lR5Nsbs5qVCUsX35K
	I1fMXowyPDv/EehIlF2REaATnJPURlE/+R3W/DB3Wv3dei5rP9kOVHcrRl8aYZtszgtyMlygHeWvc
	SDpVvDbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFB7M-00000009V6N-0G4d;
	Thu, 06 Jun 2024 11:17:16 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFB7I-00000009V4t-0T2y;
	Thu, 06 Jun 2024 11:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717672630;
	bh=oeA5U1dOP1fkZuCJTDBmCrBPiCffZl7cApyojpOoeKA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=4GoOi8snV8Yb/VuOTJ5QixOhvORfiktqnLBtl0DCGL1cm6Wp6wRqRoSMQ8qbqllOV
	 P8CMtQgmIQjkgkqX5g79flLvzr5rvaiSSyrnK8sswcfSDKg2wHxltGGHba6Wf4To5N
	 AkmLmJlrZirdWzGE3I5UIXq9OUurbm8YgDqBhONEEH4S22RkSar96DF+EFuJOQWeXT
	 lb5t2H/9zNQeAejsLTBSeIvF3jadA7vGo4JixiM8a4iEqVzQOpvW/ItuiBwqTr86nQ
	 t3UlI0xoUF1xFbEI3AwLOy3X9/6BifNtjxQGSrMQkgqD+1JgBAeXyWY/jVycW2Omi3
	 CNxPgsrOi8vqQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 82FB7378061A;
	Thu,  6 Jun 2024 11:17:08 +0000 (UTC)
Message-ID: <7f1b4a45-04cf-4b6d-878a-5bd0054a9ac0@collabora.com>
Date: Thu, 6 Jun 2024 13:17:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?= <Yu-chang.Lee@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "amergnat@baylibre.com" <amergnat@baylibre.com>
References: <20240521075717.50330-1-angelogioacchino.delregno@collabora.com>
 <20240521075717.50330-3-angelogioacchino.delregno@collabora.com>
 <e7845300fa822413f6308cb6297222cde89c39e0.camel@mediatek.com>
 <0e0fe86c-92da-43f5-89d7-8084274a908a@collabora.com>
 <CAGXv+5FgVk9z3DhAC5oYoGXSJ+wJf+sa6wFSyJ_Nhy3JrKkCng@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5FgVk9z3DhAC5oYoGXSJ+wJf+sa6wFSyJ_Nhy3JrKkCng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_041712_342758_9F424FA1 
X-CRM114-Status: GOOD (  39.89  )
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

Il 06/06/24 08:46, Chen-Yu Tsai ha scritto:
> On Wed, Jun 5, 2024 at 7:15 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 05/06/24 03:38, CK Hu (胡俊光) ha scritto:
>>> Hi, Angelo:
>>>
>>> On Tue, 2024-05-21 at 09:57 +0200, AngeloGioacchino Del Regno wrote:
>>>> Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
>>>> per HW instance (so potentially up to six displays for multi-vdo SoCs).
>>>>
>>>> The MMSYS or VDOSYS is always the first component in the DDP pipeline,
>>>> so it only supports an output port with multiple endpoints - where each
>>>> endpoint defines the starting point for one of the (currently three)
>>>> possible hardware paths.
>>>>
>>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>>>> Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> ---
>>>>    .../bindings/arm/mediatek/mediatek,mmsys.yaml | 28 +++++++++++++++++++
>>>>    1 file changed, 28 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>>>> index b3c6888c1457..0ef67ca4122b 100644
>>>> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>>>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>>>> @@ -93,6 +93,34 @@ properties:
>>>>      '#reset-cells':
>>>>        const: 1
>>>>
>>>> +  port:
>>>> +    $ref: /schemas/graph.yaml#/properties/port
>>>> +    description:
>>>> +      Output port node. This port connects the MMSYS/VDOSYS output to
>>>> +      the first component of one display pipeline, for example one of
>>>> +      the available OVL or RDMA blocks.
>>>> +      Some MediaTek SoCs support multiple display outputs per MMSYS.
>>>
>>> This patch looks good to me. Just want to share another information for you.
>>> Here is an example that mmsys/vdosys could point to the display interface node.
>>>
>>> vdosys0: syscon@1c01a000 {
>>>             mmsys-display-interface = <&dsi0>, <&dsi1>, <&dp_intf0>;
>>> };
>>>
>>> vdosys1: syscon@1c100000 {
>>>             mmsys-display-interface = <&dp_intf1>;
>>> };
>>>
>>> There is no conflict that mmsys/vdosys point to first component of one display pipeline or point to display interface.
>>> Both could co-exist.
>>>
>>
>> Hey CK,
>>
>> yes, this could be an alternative to the OF graphs, and I'm sure that it'd work,
>> even though this kind of solution would still require partial hardcoding of the
>> display paths up until mmsys-display-interface (so, up until DSI0, or DSI1, etc).
> 
> I think you might be misunderstanding CK's proposal? He's simply saying that
> instead of pointing to the start of the pipeline, point to the end instead.
> You can still use the OF graph and work backwards from the output.
> 

Oh, well, if I'm misunderstanding, sorry about that!

Though, OF Graphs are describing a "sequence of stuff" (sorry for the suboptimal
wording) and, well, the data goes from A to C with B in the middle, so the graph
starts at A, goes to B, then goes to C.

Starting from A, going to C, then backwards to B would be actually wrong, as that
appears to describe that the pipeline goes A->C->B instead of A->B->C.

>> The problem with a solution like this is that, well, even though it would work,
>> even if we ignore the suboptimal partial hardcoding, OF graphs are something
>> generic, while the mmsys-display-interface would be a MediaTek specific/custom
>> property.
>>
>> In the end, reusing generic kernel apis/interfaces/etc is always preferred
>> compared to custom solutions, especially in this case, in which the generic
>> stuff is on-par (or actually, depending purely on personal opinions, superior).
> 
> Here you are mixing hardware descriptions and kernel implementation details.
> 

Not really. I'm saying that OF Graph would be preferred compared to a custom
propety, when they both do the same.

But again, I might have misunderstood what CK was trying to say, so just leave it.

> I think this goes back to whether the mmsys/vdosys is actually part of the
> graph or not. It certainly controls the muxes within the graph. But that
> doesn't mean it has to be within the graph itself. It can just have pointers
> to entry points of the graph (for which you would have a couple lines of
> custom code [1]). If the data doesn't flow through the mmsys/vdosys, then

               ^^^ [1] is a link I think? You missed it! :-)

> I would argue that it is not part of the graph.

It's part of the graph, because it is setting up the pipeline - and it's doing that
in hardware, by doing the muxing as you said.
I could even go on arguing that the data does actually pass through that, but I
don't want to start any big deal around that, so I won't.

> 
> I would also argue that the data path should be fully described in the
> device tree, not hardcoding paths based on board usage.

Yes, that's what I also said (perhaps I should've been clearer) since the very
beginning, and it's exactly what made me put effort in making this series, so
we are totally agreeing on this point.


Cheers,
Angelo

> The latter is
> a policy / design decision, not a hardware capability.
> 
> 
> ChenYu
> 
>> As for the two to co-exist, I'm not sure that this is actually needed, as the
>> OF graphs are already (at the end of the graph) pointing to the display interface.
>>
>> In any case, just as a reminder: if there will be any need to add any custom
>> MediaTek specific properties later, it's ok and we can do that at any time.
>>
>> Cheers!
>> Angelo
>>
>>> Regards,
>>> CK
>>>
>>>> +    properties:
>>>> +      endpoint@0:
>>>> +        $ref: /schemas/graph.yaml#/properties/endpoint
>>>> +        description: Output to the primary display pipeline
>>>> +
>>>> +      endpoint@1:
>>>> +        $ref: /schemas/graph.yaml#/properties/endpoint
>>>> +        description: Output to the secondary display pipeline
>>>> +
>>>> +      endpoint@2:
>>>> +        $ref: /schemas/graph.yaml#/properties/endpoint
>>>> +        description: Output to the tertiary display pipeline
>>>> +
>>>> +    anyOf:
>>>> +      - required:
>>>> +          - endpoint@0
>>>> +      - required:
>>>> +          - endpoint@1
>>>> +      - required:
>>>> +          - endpoint@2
>>>> +
>>>>    required:
>>>>      - compatible
>>>>      - reg
>>
>>


