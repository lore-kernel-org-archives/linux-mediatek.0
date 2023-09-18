Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BFF1C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 20:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=steSxAGxIIrBB8yF0EoHEQ1bHRxKbPjfwJmQQcwCf3s=; b=k8k7VKe/+3VGEIsCWsBK4w2TAl
	SNoaN48w36VRdEjqrqgVrdplUmP6dbKV10pbp7mSX1oeZ7O9LLa3IIqTdtnq7RnPR0CBGbYXopWu/
	tuqFOE/XPWbkMwWerkl9S+jF/AIUq3DsereFdq8V39OmOl9InXAhjWh1b1HmwHuiXoDtopa+JBcpL
	aSSN2ISpVRxfrgchjmvVlBqA18Yx+OX1OfmvGC5BrEIxLtDqJ66iLRZyGJeE4H6sEIj1jZsGc4r0n
	knTbdQoqu0SdyO8ZVmEdigWb1Wf3KvKVurmMNAPtk8f2m3VVesBo+xVVY6Qw2BJbYCNprIr7YgS0f
	ta77w8fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiKsb-00GHbi-20;
	Mon, 18 Sep 2023 20:30:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiKsX-00GHag-36;
	Mon, 18 Sep 2023 20:29:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5D6C1B810DE;
	Mon, 18 Sep 2023 20:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E767C433C7;
	Mon, 18 Sep 2023 20:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695068994;
	bh=RQUlDwkha5Sj8e9teHemf6VSIjaIGbIuFWE9vk0iWlU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uCzW6D1x/Y7q1cYGyDSizob45IJop6qiLZU0lvL7zyHPyQgpnCwZ71Yk8JdkiDR8+
	 gzIUTMx6RP8cx7F9xQRmJOV5oFIBuaM2LDGCGHzaF+jkK9lIXyIqCrc3qtNDOfdW+E
	 iHP1EdYfrVZeN5j0EpGs3egt/UowxfsNhGXxht7L0qV/Fz7f6zzDcdjW1bUZUnRAzT
	 TmXdKKlPzc1j5ZN0AFuJOB++bnjHC5PbeuZolKX1tRTkxydHT4y5NeuoQTEwEa4pdw
	 Lx9XA2p3NApWtYPWdrRMHNfiq70mH6iq4glmVp5UeHaagdY+TeoCHpk6kae4QcF0Z3
	 nylVsTKXgreoQ==
Received: (nullmailer pid 1722890 invoked by uid 1000);
	Mon, 18 Sep 2023 20:29:51 -0000
Date: Mon, 18 Sep 2023 15:29:51 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, Daniel Golle <daniel@makrotopia.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 2/2] dt-bindings: net: mediatek,net: move
 mediatek,mt7621-eth to another schema
Message-ID: <20230918202951.GA1712467-robh@kernel.org>
References: <20230917124723.143202-1-arinc.unal@arinc9.com>
 <20230917124723.143202-2-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230917124723.143202-2-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_132958_293876_E6C80C5F 
X-CRM114-Status: GOOD (  23.81  )
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

On Sun, Sep 17, 2023 at 03:47:23PM +0300, Arınç ÜNAL wrote:
> The bindings for mediatek,mt7621-eth contradict with some of the rules on
> the top level schema of mediatek,net.yaml:
> - resets must be two items. resets with "maxItems: 3" at the top level
>   implies "minItems: 3" and cannot be overriden under a subschema.
> - reset-names items must be "fe" and "eth". reset-names items defined on
>   the top level schema cannot be overridden under a subschema.

Why not? You can shuffle things around. Though at some point it is worth 
splitting the schemas.

> 
> Therefore, move mediatek,mt7621-eth to another schema. Fix the order of
> clock-names items. Do not define the properties that don't apply to this
> hardware. Require more properties. Add an example.
> 
> Fixes: 1cbf487d7d3a ("dt-bindings: net: mediatek,net: add missing mediatek,mt7621-eth")
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/mediatek,mt7621-eth.yaml     | 143 ++++++++++++++++++
>  .../devicetree/bindings/net/mediatek,net.yaml |  27 ----
>  2 files changed, 143 insertions(+), 27 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/mediatek,mt7621-eth.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek,mt7621-eth.yaml b/Documentation/devicetree/bindings/net/mediatek,mt7621-eth.yaml
> new file mode 100644
> index 000000000000..4f39d7124693
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/mediatek,mt7621-eth.yaml
> @@ -0,0 +1,143 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/mediatek,mt7621-eth.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT7621 Frame Engine Ethernet controller
> +
> +maintainers:
> +  - Arınç ÜNAL <arinc.unal@arinc9.com>
> +
> +description:
> +  The frame engine ethernet controller can be found on MediaTek MT7621 SoC. This
> +  SoC has got dual GMAC ports.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt7621-eth
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: fe
> +      - const: ethif
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 2
> +
> +  reset-names:
> +    items:
> +      - const: fe
> +      - const: eth
> +
> +  mediatek,ethsys:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the syscon node that handles the port setup.
> +
> +  mdio-bus:
> +    $ref: mdio.yaml#
> +    unevaluatedProperties: false
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^mac@[0-1]$":
> +    type: object
> +    unevaluatedProperties: false
> +    allOf:

Don't need allOf.

> +      - $ref: ethernet-controller.yaml#
> +    description:
> +      Ethernet MAC node
> +    properties:
> +      compatible:
> +        const: mediatek,eth-mac
> +
> +      reg:
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +      - compatible

Now all the child nodes (at least) are duplicated. If you don't want to 
further extend the if/then schemas (it's a judgement call when splitting 
makes sense), then I'd suggest you move what is common to a separate 
schema file and then $ref it in this file and the original schema.

Rob

