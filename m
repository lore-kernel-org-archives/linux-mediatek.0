Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC7BC4725D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 10:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2e8La/1TjODsgMtjIgFdqwrtY4E14yS6mSpiLWoj4p4=; b=c9BzfwesJQw/z6Htzl4owVp52H
	xo0VCl20cHMg9/nD83j1PrgeyDDZEWXC6GbEl5beUQWxFNfOKTso1N1iSWOyWdqNpSbieyb8lfjog
	bzCEsXyYIpvOZ+dQf6Ioy1XzkaJ9+66m3cwAqxoIJ6uB1gvs/dba2/j/rWSFaTyzrG2kqaGa4dOPL
	KW6XVphT+1pULtI8ub8TMcz/W9vFHLdWU6/V4PNMxu0DnvMLJE8fKWo1SsGEUVTY99LearW2N7xYW
	biH+MHOOiLMQ/Lb0Xf2iTUB4+FkF30ZZwUY1Arzw2wFSSb6bJFJ4L8kjtxPpUZMf9WvnU/nCVoz/g
	R1esN5xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRrh9-00BYvd-0W;
	Mon, 22 Jan 2024 10:38:23 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRrh5-00BYuI-0q;
	Mon, 22 Jan 2024 10:38:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705919897;
	bh=QOgZWgCo219X/V3HqTTipzGqn3wTwHbInkP56JKp9LU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ry2b84fvNF59C0fPB/rOmCrQfkB9UCYyyxjbbVblAutR13mGF1OtEsYNT4P9veMNH
	 qNGb0ir5fSdO4/aVWMTwKNLlUU4KN+tMfMu64/tonBwHeD1VIHlseBwPfkXoaAHWoL
	 gNMt/FELnlRq0ivLUOec/jQpoxO2qCVeXjzlOswL3NAJBM7KRH5I23LTC7FwxSwe0B
	 4MZeDMMZYFG6QD6iFsGlOpEyACqG6GUsEXAdtXbAt7wl1yVFWDEwcExZjeJN09OoNg
	 bb2AeCvEGX7DEYDkLgAxYVEnt8NlA8nXRW+J+OfUcYS0PFxRe/mST7BTtk5m9gOW9R
	 dUgN3exk993+g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 89FCE378045F;
	Mon, 22 Jan 2024 10:38:16 +0000 (UTC)
Message-ID: <9c447297-2738-4b63-9da9-0d004660e65d@collabora.com>
Date: Mon, 22 Jan 2024 11:38:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, "Jason-JH.Lin"
 <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240119063224.29671-1-jason-jh.lin@mediatek.com>
 <20240119063224.29671-2-jason-jh.lin@mediatek.com>
 <20240119-demote-fragment-624a35367a87@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240119-demote-fragment-624a35367a87@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_023819_437476_4F3B1C37 
X-CRM114-Status: GOOD (  28.32  )
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

Il 19/01/24 17:44, Conor Dooley ha scritto:
> Rob,
> 
> On Fri, Jan 19, 2024 at 02:32:22PM +0800, Jason-JH.Lin wrote:
>> Add mediatek,gce-props.yaml for common GCE properties that is used for
>> both mailbox providers and consumers. We place the common property
>> "mediatek,gce-events" in this binding currently.
>>
>> The property "mediatek,gce-events" is used for GCE event ID corresponding
>> to a hardware event signal sent by the hardware or a sofware driver.
>> If the mailbox providers or consumers want to manipulate the value of
>> the event ID, they need to know the specific event ID.
>>
>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>> ---
>>   .../bindings/mailbox/mediatek,gce-props.yaml  | 52 +++++++++++++++++++
> 
> Is bindings/mailbox the correct directory to put this in?
> 

Well, the GCE is a mailbox :-)

...but I get why you're asking... and I don't think that this should go to
arm/mediatek/ as it's really just only referring to extra properties for kind of
"special" mailbox client events...

Cheers,
Angelo

>>   1 file changed, 52 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
>> new file mode 100644
>> index 000000000000..68b519ff089f
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
>> @@ -0,0 +1,52 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mailbox/mediatek,gce-props.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MediaTek Global Command Engine Common Propertes
>> +
>> +maintainers:
>> +  - Houlong Wei <houlong.wei@mediatek.com>
>> +
>> +description:
>> +  The Global Command Engine (GCE) is an instruction based, multi-threaded,
>> +  single-core command dispatcher for MediaTek hardware. The Command Queue
>> +  (CMDQ) mailbox driver is a driver for GCE, implemented using the Linux
>> +  mailbox framework. It is used to receive messages from mailbox consumers
>> +  and configure GCE to execute the specified instruction set in the message.
>> +  We use mediatek,gce-mailbox.yaml to define the properties for CMDQ mailbox
>> +  driver. A device driver that uses the CMDQ driver to configure its hardware
>> +  registers is a mailbox consumer. The mailbox consumer can request a mailbox
>> +  channel corresponding to a GCE hardware thread to send a message, specifying
>> +  that the GCE thread to configure its hardware. The mailbox provider can also
>> +  reserved a mailbox channel to configure GCE hardware register by the spcific
>> +  GCE thread. This binding defines the common GCE properties for both mailbox
>> +  provider and consumers.
>> +
>> +properties:
>> +  mediatek,gce-events:
>> +    description:
>> +      GCE has an event table in SRAM, consisting of 1024 event IDs (0~1023).
>> +      Each event ID has a boolean event value with the default value 0.
>> +      The property mediatek,gce-events is used to obtain the event IDs.
>> +      Some gce-events are hardware-bound and cannot be changed by software.
>> +      For instance, in MT8195, when VDO0_MUTEX is stream done, VDO_MUTEX will
>> +      send an event signal to GCE, setting the value of event ID 597 to 1.
>> +      Similarly, in MT8188, the value of event ID 574 will be set to 1 when
>> +      VOD0_MUTEX is stream done.
>> +      On the other hand, some gce-events are not hardware-bound and can be
>> +      changed by software. For example, in MT8188, we can set the value of
>> +      event ID 855, which is not bound to any hardware, to 1 when the driver
>> +      in the secure world completes a task. However, in MT8195, event ID 855
>> +      is already bound to VDEC_LAT1, so we need to select another event ID to
>> +      achieve the same purpose. This event ID can be any ID that is not bound
>> +      to any hardware and is not yet used in any software driver.
>> +      To determine if the event ID is bound to the hardware or used by a
>> +      software driver, refer to the GCE header
>> +      include/dt-bindings/gce/<chip>-gce.h of each chip.
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    minItems: 1
>> +    maxItems: 1024
>> +
>> +additionalProperties: true
>> -- 
>> 2.18.0
>>


