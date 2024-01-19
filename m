Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F107CC47DAF
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 10:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4gHjra2qJ1TgIn/vuUbwbfpKdU7sHndvozJ55m57cQ=; b=h/KgViGBwQ0BFy0mK97xjqiZki
	0oBNI/ukdbxq0ZOv2xR2vIZGcI+B1czxuSnYrKlhY+bMkvmTjSlzSbhAgKKrEj0SyKGdW7ijkQgXY
	ksDblanU2TwpvfbhvMxwD8uuRxNqYjIEo/2dNm7PULihUQdF9P5tdR2rPavVtF1D3gr0PL5kbZatN
	nOPBk6PqmyRVgV/5RI9aGoY8WvGMkBsoLmhziXIXVPrbaQ6qA8VXbMnNESzkNpOojezZ4/GdEpK9m
	tgFxFijrxDBDTBKHkYNS8eb+ssx9w/LwS7nV2yK+/L2txb2yg8kJhFtqapuMvJ8b/k2B+Dgnt0oDR
	8EQOoP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQmVB-005AMb-2e;
	Fri, 19 Jan 2024 10:53:33 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQmV8-005ALN-0U;
	Fri, 19 Jan 2024 10:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705661608;
	bh=CFyBN3hM6Icm5piROwxSXNJbjOUUSK0D7k+x7CC40aU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=avoTUk8WRN/wl1do+O2nS/ru8pUagCwo4abnUWi1pX+a2UJBgBv/QnAf8ajcp/IRX
	 rn7dvUSc6EWvANhphTJmt3tJaslmfHGyXq05qKFHILrnX3hQzV8EDK5PszgnmTvIc0
	 M5cyBnu2ZLRTuJiqyIMvEUKNkiNoaLuuxpMNbf05/XvhVJjmy7Ji9Vbo7Bft8JW14f
	 rkJZIpie5RTHZdSfoOCkWnrJ92vqbz34HZwxTy8EGfJ9Wts8CCASh/jwXUovDOgaBm
	 Ee3tMs5+O+EndXRO7krQWzoKAKnYRoMF3o78oqyfHjMMBbHUdJg2MbzZLNApmb8gg1
	 ZNvAuD/5vERSA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5EC20378202D;
	Fri, 19 Jan 2024 10:53:27 +0000 (UTC)
Message-ID: <30dca707-2b48-4309-8567-8c1297a75db5@collabora.com>
Date: Fri, 19 Jan 2024 11:53:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240119063224.29671-1-jason-jh.lin@mediatek.com>
 <20240119063224.29671-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240119063224.29671-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_025330_316990_DFEB1D67 
X-CRM114-Status: GOOD (  35.18  )
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

Il 19/01/24 07:32, Jason-JH.Lin ha scritto:
> Add mediatek,gce-props.yaml for common GCE properties that is used for
> both mailbox providers and consumers. We place the common property
> "mediatek,gce-events" in this binding currently.
> 
> The property "mediatek,gce-events" is used for GCE event ID corresponding
> to a hardware event signal sent by the hardware or a sofware driver.
> If the mailbox providers or consumers want to manipulate the value of
> the event ID, they need to know the specific event ID.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   .../bindings/mailbox/mediatek,gce-props.yaml  | 52 +++++++++++++++++++
>   1 file changed, 52 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
> new file mode 100644
> index 000000000000..68b519ff089f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/mediatek,gce-props.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Global Command Engine Common Propertes
> +
> +maintainers:
> +  - Houlong Wei <houlong.wei@mediatek.com>
> +
> +description:
> +  The Global Command Engine (GCE) is an instruction based, multi-threaded,
> +  single-core command dispatcher for MediaTek hardware. The Command Queue
> +  (CMDQ) mailbox driver is a driver for GCE, implemented using the Linux
> +  mailbox framework. It is used to receive messages from mailbox consumers
> +  and configure GCE to execute the specified instruction set in the message.
> +  We use mediatek,gce-mailbox.yaml to define the properties for CMDQ mailbox
> +  driver. A device driver that uses the CMDQ driver to configure its hardware
> +  registers is a mailbox consumer. The mailbox consumer can request a mailbox
> +  channel corresponding to a GCE hardware thread to send a message, specifying
> +  that the GCE thread to configure its hardware. The mailbox provider can also
> +  reserved a mailbox channel to configure GCE hardware register by the spcific
> +  GCE thread. This binding defines the common GCE properties for both mailbox
> +  provider and consumers.
> +
> +properties:
> +  mediatek,gce-events:
> +    description:
> +      GCE has an event table in SRAM, consisting of 1024 event IDs (0~1023).
> +      Each event ID has a boolean event value with the default value 0.
> +      The property mediatek,gce-events is used to obtain the event IDs.
> +      Some gce-events are hardware-bound and cannot be changed by software.
> +      For instance, in MT8195, when VDO0_MUTEX is stream done, VDO_MUTEX will
> +      send an event signal to GCE, setting the value of event ID 597 to 1.
> +      Similarly, in MT8188, the value of event ID 574 will be set to 1 when
> +      VOD0_MUTEX is stream done.
> +      On the other hand, some gce-events are not hardware-bound and can be
> +      changed by software. For example, in MT8188, we can set the value of
> +      event ID 855, which is not bound to any hardware, to 1 when the driver
> +      in the secure world completes a task. However, in MT8195, event ID 855
> +      is already bound to VDEC_LAT1, so we need to select another event ID to
> +      achieve the same purpose. This event ID can be any ID that is not bound
> +      to any hardware and is not yet used in any software driver.
> +      To determine if the event ID is bound to the hardware or used by a
> +      software driver, refer to the GCE header
> +      include/dt-bindings/gce/<chip>-gce.h of each chip.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 1024

maxItems: 1024 seems to be a bit too many... this means that one devicetree node
may have up to 1024 gce events, which is impossible! If a driver needed all of
the 1024 events, this means that it's not an user of the GCE, but the GCE itself!

Imagine seeing a devicetree node with 1024 array entries for mediatek,gce-events...

I'd set that to a more sensible value of 32 - eventually we can extend it later,
if ever needed.

Besides, nice job about all this documentation of the GCE and its events: love it!

Cheers,
Angelo


