Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCCFC3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 12:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KWVfl2mXdavSJiJpzPpLv/sLBgbnODRVaY01wR+6ZTw=; b=m1rk0BNVfVLLSuoCRy4skMeDZH
	UkDLWJmX7hjhDj7DLVq8ljE4tXlnbtKuo+UcvfteT10nmyaGbVTDfyXWYDuJCXwybZN9F82ezwwaK
	dtUBTx/inEoWGaClmSm7Z5hkQGmA57oS95a/idjjT3bXRpplrY9JysA3KYWhzWTG7EE3czhpKJXci
	43adk72M0UYCM+MdzCPDtrkGlHmVRn/MxfASXQxD3T/DqKhF4xwfkxjLHfq24ITlIT7pmEKrrZcUO
	wA8oAtUyH4bNHXN01BYgtkTTGEeX9XKqbIpdBzaINkES+X0cy3u81kpWTX81D+4JfAIiJxnYcoqgZ
	KPkRzX1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCgmD-001Lx3-H8; Tue, 03 Jan 2023 12:52:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCfpi-0014Ox-BP; Tue, 03 Jan 2023 11:52:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 659896602CE7;
	Tue,  3 Jan 2023 11:51:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1672746709;
	bh=6chUOuhMbPwhQBYMQBmnbgN9yec/HXnOChceMVGoqic=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gG9UbXrrgSVeMwXELIxIuwXvRhEU35Fb89KnSK5SmwjjhQ9O3wB7j+BDd3lS8jkhk
	 IXgHZgJELX2+QlzUlyCHHifndDkJ/2C1gc/F9rNweTIPXZBgR/cStGIXLdTInfoLBt
	 fqAq68aomRHY5F6Agw7R+3syaZLI8BGtsv5gRrLWVFzk/aOzdA/QNPtdMRApVusFr8
	 wja6kGf3ePZt9CQfJkUIc1/xZxeB5SrDZ5kqIlna9JDTABicClm3FJzZX0XJIsahmP
	 JAvAje3oGDflWCSLKcHLAvKvlArcK3wtj7nt16E5ROG0/Em2+bgbSRcE6Rq7SdWvIW
	 i1+Njg4yfhRbQ==
Message-ID: <09f1ca83-c7d5-a186-6fa6-09cdd7a0b9cc@collabora.com>
Date: Tue, 3 Jan 2023 12:51:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 3/4] dt-bindings: panel: Introduce dual-link LVDS
 panel
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Matthias Brugger <matthias.bgg@gmail.com>, Guo Ren <guoren@kernel.org>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Linux RISC-V List <linux-riscv@lists.infradead.org>,
 Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
 Linux Mediatek List <linux-mediatek@lists.infradead.org>,
 Linux C-SKY Arch List <linux-csky@vger.kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jai Luthra <j-luthra@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>
References: <20230103064615.5311-1-a-bhatia1@ti.com>
 <20230103064615.5311-4-a-bhatia1@ti.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230103064615.5311-4-a-bhatia1@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_035155_105635_98E945BF 
X-CRM114-Status: GOOD (  21.21  )
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

Il 03/01/23 07:46, Aradhya Bhatia ha scritto:
> Dual-link LVDS interfaces have 2 links, with even pixels traveling on
> one link, and odd pixels on the other. These panels are also generic in
> nature, with no documented constraints, much like their single-link
> counterparts, "panel-lvds".
> 
> Add a new compatible, "panel-dual-lvds", and a dt-binding document for
> these panels.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>   .../display/panel/panel-dual-lvds.yaml        | 157 ++++++++++++++++++
>   MAINTAINERS                                   |   1 +
>   2 files changed, 158 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
> new file mode 100644
> index 000000000000..88a7aa2410be
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-dual-lvds.yaml
> @@ -0,0 +1,157 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-dual-lvds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Dual-Link LVDS Display Panel
> +
> +maintainers:
> +  - Aradhya Bhatia <a-bhatia1@ti.com>
> +  - Thierry Reding <thierry.reding@gmail.com>
> +
> +description: |
> +  A dual-LVDS interface is a dual-link connection with the even pixels
> +  traveling on one link, and the odd pixels traveling on the other.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +  - $ref: /schemas/display/lvds.yaml/#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - lincolntech,lcd185-101ct
> +              - microtips,13-101hieb0hf0-s
> +          - const: panel-dual-lvds
> +      - const: panel-dual-lvds
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description: The sink for first set of LVDS pixels.
> +
> +        properties:
> +          dual-lvds-odd-pixels:
> +            type: boolean
> +
> +          dual-lvds-even-pixels:
> +            type: boolean
> +
> +        oneOf:
> +          - required: [dual-lvds-odd-pixels]

One question: why do we need a "panel-dual-lvds" compatible?
A Dual-LVDS panel is a LVDS panel using two ports, hence still a panel-lvds.

If you're doing this to clearly distinguish, for human readability purposes,
single-link vs dual-link panels, I think that this would still be clear even
if we use panel-lvds alone because dual-link panels, as you wrote in this
binding, does *require* two ports, with "dual-lvds-{odd,even}-pixels" properties.

So... the devicetree node would look like this:

panel {
	compatible = "vendor,panel", "panel-lvds";
	....
	ports {
		port@0 {
			.....
			-> dual-lvds-odd-pixels <-
		}

		port@1 {
			.....
			-> dual-lvds-even-pixels <-
		};
	};
};

> +          - required: [dual-lvds-even-pixels]

...Though, if you expect dual-lvds panels to get other quirks in the future,
that's a whole different story and you may actually need the panel-dual-lvds
compatible.

Regards,
Angelo

