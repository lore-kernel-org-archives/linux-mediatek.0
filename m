Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BF73C25B76
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jun 2024 11:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZZSKBOJpQ/wLEYAeaBbtgqOhlxH+Cy+1tLeP1EFytA=; b=FsV59XP+iNkc3+chDwcGGf8tG5
	PcvfE6OsHLG3iUTrzp+M7BygHErhljrgjgZuG9+f6D1liImFAbWBnlvbAHvuqDpGaIAEsliIFS01B
	ajtoHHG9i1Yta+abFhKgOAF3DMNm+sHZVjKYyqNXh6aZl+KQkWdp9cZBsmNG6nErOHMZEoxu+kzvW
	HZR5CmJ/9wVAJ6tuxHG54nlDX+fgpouxEf6EVShR4baB1NgjBaI6LAvvFoEpS7cFli+coBYoxHVUq
	OhbDy6zmMmbtBfLYdkqlhU5QSwkpIafgnlrb3IOwAFsD/ZHUKOr0Zho3+9l8LobEDrjR4bztEHr1r
	mCNeTKcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEobt-00000005g1R-2PSF;
	Wed, 05 Jun 2024 11:15:17 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEobq-00000005fzl-1VGe;
	Wed, 05 Jun 2024 11:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717586105;
	bh=EFu+zxcHRzssvsR1UGoPpPvJ2s8V2Pa5OGfZzBovS74=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=3G6hXb3PxIeAdZdzrZC3xDadf1Yv//GVtWhFRW/IJ8qYp422FWwx0zNYVaW90qSkB
	 5dHxeTxNukk2XJPfjgrpQdDYt/5muhaDWY7SbTUeKJ2ZE2DFavQ03IUO67f1fF1gJK
	 XxgbksqWfWALZjKhdNCCalCk6S7cU5SBU25wJO4Zf13r9LsUazgC1RaPMd3t8jD4Mp
	 t/C656XB1eqvJ+/dkJ1hX9LOU4OjTszG0uqCsZPcgDpm49hJ15MDTiEGY/Gf0DqSpT
	 SqRBYmkTRXnmipS3/kQ38qfmjv3v1yXK1F6GuJqky6vbQ6MkabqtdnxzYtWZ72OClS
	 Nqm6mqlTQZXHA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7B84F3780BDB;
	Wed,  5 Jun 2024 11:15:04 +0000 (UTC)
Message-ID: <0e0fe86c-92da-43f5-89d7-8084274a908a@collabora.com>
Date: Wed, 5 Jun 2024 13:15:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
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
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <e7845300fa822413f6308cb6297222cde89c39e0.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_041514_539333_48A32D99 
X-CRM114-Status: GOOD (  24.05  )
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

Il 05/06/24 03:38, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Tue, 2024-05-21 at 09:57 +0200, AngeloGioacchino Del Regno wrote:
>> Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
>> per HW instance (so potentially up to six displays for multi-vdo SoCs).
>>
>> The MMSYS or VDOSYS is always the first component in the DDP pipeline,
>> so it only supports an output port with multiple endpoints - where each
>> endpoint defines the starting point for one of the (currently three)
>> possible hardware paths.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>> Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../bindings/arm/mediatek/mediatek,mmsys.yaml | 28 +++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> index b3c6888c1457..0ef67ca4122b 100644
>> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> @@ -93,6 +93,34 @@ properties:
>>     '#reset-cells':
>>       const: 1
>>   
>> +  port:
>> +    $ref: /schemas/graph.yaml#/properties/port
>> +    description:
>> +      Output port node. This port connects the MMSYS/VDOSYS output to
>> +      the first component of one display pipeline, for example one of
>> +      the available OVL or RDMA blocks.
>> +      Some MediaTek SoCs support multiple display outputs per MMSYS.
> 
> This patch looks good to me. Just want to share another information for you.
> Here is an example that mmsys/vdosys could point to the display interface node.
> 
> vdosys0: syscon@1c01a000 {
>            mmsys-display-interface = <&dsi0>, <&dsi1>, <&dp_intf0>;
> };
>   
> vdosys1: syscon@1c100000 {
>            mmsys-display-interface = <&dp_intf1>;
> };
> 
> There is no conflict that mmsys/vdosys point to first component of one display pipeline or point to display interface.
> Both could co-exist.
> 

Hey CK,

yes, this could be an alternative to the OF graphs, and I'm sure that it'd work,
even though this kind of solution would still require partial hardcoding of the
display paths up until mmsys-display-interface (so, up until DSI0, or DSI1, etc).

The problem with a solution like this is that, well, even though it would work,
even if we ignore the suboptimal partial hardcoding, OF graphs are something
generic, while the mmsys-display-interface would be a MediaTek specific/custom
property.

In the end, reusing generic kernel apis/interfaces/etc is always preferred
compared to custom solutions, especially in this case, in which the generic
stuff is on-par (or actually, depending purely on personal opinions, superior).

As for the two to co-exist, I'm not sure that this is actually needed, as the
OF graphs are already (at the end of the graph) pointing to the display interface.

In any case, just as a reminder: if there will be any need to add any custom
MediaTek specific properties later, it's ok and we can do that at any time.

Cheers!
Angelo

> Regards,
> CK
> 
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
>> +    anyOf:
>> +      - required:
>> +          - endpoint@0
>> +      - required:
>> +          - endpoint@1
>> +      - required:
>> +          - endpoint@2
>> +
>>   required:
>>     - compatible
>>     - reg



