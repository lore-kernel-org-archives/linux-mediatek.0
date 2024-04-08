Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8C0C67861
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 10:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pVekdkrQBPc4D4jebsomNbQ+DnizhbQ58ZJeq6rgCc=; b=f9MAotJj9E/basJnGc2PUD3G89
	yV/pJlc6Mzx3Z3LI4W3NDBMNXqtlMZ1AS5xoWX9vfJU+nwefp37kQMkLcuFhm6tn+ZGuthIMXZjzQ
	+zs+Vz27Na/6QaXTMi2GTKfp8lwhhXS+ACl5pugMAAMrq3iqBDyL/WjMzcPz09nwd+EpGWEtyZXEv
	t+kPs7Tl837M6ZP9KF7jrZNx3nf3aKhhazNHHutIWMzPKVq39ejr/XUZi5BGRi+yCzLnA2GY8Tio/
	iE2AdOPr0+SwE96yzsh5Wo8NduC49pAjM4WCAD10vq9svWK7lVuzqEMyJH7YI2J9lYk2/asCgicJD
	cE/DZkRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtm3O-0000000FElo-1aQy;
	Mon, 08 Apr 2024 10:16:42 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtm2r-0000000FEfO-3r3M;
	Mon, 08 Apr 2024 10:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712571365;
	bh=su42lLW6PD3z+UBwwbFQ0posL3pq3ei8eZhPwV7J1QU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aaY5QGWExwVtL7oX5bMM2dEOfNtL1HOeztXi5FJXuvvhWIuxrbzODt/767fCfgNvi
	 zFUowTzx0VKnymoQvkXzj73u5/ZHw4o/2BC7HmPwmdUT3jojDy1H1vCFpTxsmGv3KI
	 tqXGNeshynXl0YQS/vODDfUl5DWbZb0jAF5cJTATPg+tJOiV8rVXVnHSk5nMQUsJnf
	 jNnAHdgwqkmoVMzktYrKnyEfxgO5Xjf9GQL0MdukR/htkCPqqzBsVERbgLMZNWNky6
	 JCeLMA0hrNlXYb0IisVRdkZzWodc6l3iK4n+qLUxeV3mn+zWLAp63ZhnESId8gZoMb
	 3B+cTnpnSZDew==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 398633780627;
	Mon,  8 Apr 2024 10:16:04 +0000 (UTC)
Message-ID: <5e385c2e-6509-4347-96a5-4606b32d20ff@collabora.com>
Date: Mon, 8 Apr 2024 12:16:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: chunkuang.hu@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20240404081635.91412-1-angelogioacchino.delregno@collabora.com>
 <20240404081635.91412-3-angelogioacchino.delregno@collabora.com>
 <CAGXv+5F9rfTVDExKSCF7fBKwR+HijNzFYE6+4aHKw3ZP81DG9w@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5F9rfTVDExKSCF7fBKwR+HijNzFYE6+4aHKw3ZP81DG9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_031610_298996_E6F40C71 
X-CRM114-Status: GOOD (  18.59  )
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

Il 08/04/24 05:20, Chen-Yu Tsai ha scritto:
> On Thu, Apr 4, 2024 at 4:16 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
>> per HW instance (so potentially up to six displays for multi-vdo SoCs).
>>
>> The MMSYS or VDOSYS is always the first component in the DDP pipeline,
>> so it only supports an output port with multiple endpoints - where each
>> endpoint defines the starting point for one of the (currently three)
>> possible hardware paths.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../bindings/arm/mediatek/mediatek,mmsys.yaml | 23 +++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> index b3c6888c1457..90758bb5bcb1 100644
>> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> @@ -93,6 +93,29 @@ properties:
>>     '#reset-cells':
>>       const: 1
>>
>> +  port:
>> +    $ref: /schemas/graph.yaml#/properties/port
>> +    description:
>> +      Output port node. This port connects the MMSYS/VDOSYS output to
>> +      the first component of one display pipeline, for example one of
>> +      the available OVL or RDMA blocks.
>> +      Some MediaTek SoCs support up to three display outputs per MMSYS.
>> +    properties:
>> +      endpoint@0:
>> +        $ref: /schemas/graph.yaml#/properties/endpoint
>> +        description: Output to the primary display pipeline
>> +
>> +      endpoint@1:
>> +        $ref: /schemas/graph.yaml#/properties/endpoint
>> +        description: Output to the secondary display pipeline
>> +
>> +      endpoint@2:
>> +        $ref: /schemas/graph.yaml#/properties/endpoint
>> +        description: Output to the tertiary display pipeline
>> +
>> +      required:
>> +        - endpoint@0
>> +
> 
> Technically the mmsys device serves as an glue layer for the display
> pipeline, providing things like clock control and signal routing; the
> device itself is not part of the pipeline, and probably shouldn't be
> part of the graph?
> 

That is (only) partially true: in the case of older SoCs, the MMSYS can only
connect to a single first IP of the pipeline, but in the case of newer ones,
and especially (but not limited to) MT8195 onwards having multiple instances
of VDOSYS, that really becomes part of the pipeline.

This is not because of the possible different first IP in the pipeline, but
because of support for dual-interface (DSI and DP) that, in even newer SoCs,
can be done with cross-mmsys (cross-vdosys, actually...) as some of those do
have the two in different VDOs.

So yes, this can be done without the graph in MMSYS *in this precise moment in
time*, but we'll anyway end up adding it sooner than later - and I'm doing this
right now, instead of later, because it's also simplifying the implementation
so like that I'm "catching two birds with one stone" :-)

Cheers,
Angelo

> ChenYu
> 
>>   required:
>>     - compatible
>>     - reg
>> --
>> 2.44.0
>>



