Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52C1C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 11:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NUDHNIGejFEeAlOmH1yqk90NK5UFxRSKAGtVLDYEtVY=; b=4JExWvjgQs/zIN
	sLpZaYQ4emW8nXS2z5jPNbOASieHKp+t+iGaj3zoWP9N05QaQgZcCVEIYlzGruQmwgeSmZGHwnnxc
	zbViK57Rw2fs0GkUKOMzNgUG/1Abmz1dhx3YxmYhk5g5XavxO8ILr4o7ppU63iGSNtosnUaJ/c5fN
	jaWMD3H/XoJwm3GTMqzInv/Z2ReLcprU/7ySRC8Jq3wUFNPyyqadwseSvwhFGSuikADEqFR35WBAh
	wo3C+Huw4jaiRjEQOFZiVqygtSld8uHqijodNGc/hjs/9W7KpPZI8JmajdPrVsif8LBL13HkmtU5F
	iSSoX5GhzRqpmiPf4dzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntpbu-00B07v-Rl; Wed, 25 May 2022 11:55:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntpbj-00B049-4I; Wed, 25 May 2022 11:55:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: kholk11)
	with ESMTPSA id 893E61F44CFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1653479715;
	bh=nuxGWQWNesZ/7a6N1/y9rDh1aXO9s7JIDe0xC4nw6GQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j9yTx8cauhT8UcAVv4U59s0oW4k8pz/Z6K1faqEFRrVipgEVU4Jv55Tslk4Us4zdn
	 qelGzQ1noPB9csE56IIuB+fKDpZc5pnfYXAhBIQLYSItE6nPTl/Y/B6Cv3hGWjYDQP
	 3jjkwRoUKkNMAtFTCNOaYAYgwjlm4+G1FhaN201qJOEwKLkvDbc6FE8kew5EWq8Sgu
	 neVTNTi35gFOCfBXTVj6l2wpwsriJwCvwCwQldtO2r9Dbc+uqLJvHXY4RIU4p27NFI
	 w7ek15EnwpP0EQxN3qTbEFz0J3kygxhtjj2xq6LO+TbHW9GTMMTmgMcqZORZmT5ptW
	 kqVK/YQdIvofg==
Message-ID: <c1dacdd0-f25e-a522-5d5f-1ef2fe297094@collabora.com>
Date: Wed, 25 May 2022 13:55:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v10 01/21] dt-bindings: mediatek,dpi: Add DPINTF
 compatible
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Helge Deller <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-2-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523104758.29531-2-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_045519_331387_26415EF4 
X-CRM114-Status: GOOD (  21.30  )
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

Il 23/05/22 12:47, Guillaume Ranquet ha scritto:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> DPINTF is similar to DPI but does not have the exact same feature set
> or register layouts.
> 
> DPINTF is the sink of the display pipeline that is connected to the
> DisplayPort controller and encoder unit. It takes the same clocks as
> DPI.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   .../bindings/display/mediatek/mediatek,dpi.yaml     | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index dd2896a40ff0..6d9f6c11806e 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -4,16 +4,16 @@
>   $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
> -title: mediatek DPI Controller Device Tree Bindings
> +title: mediatek DPI/DPINTF Controller
>   
>   maintainers:
>     - CK Hu <ck.hu@mediatek.com>
>     - Jitao shi <jitao.shi@mediatek.com>
>   
>   description: |
> -  The Mediatek DPI function block is a sink of the display subsystem and
> -  provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
> -  output bus.
> +  The Mediatek DPI and DPINTF function blocks are a sink of the display
> +  subsystem and provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a
> +  parallel output bus.
>   
>   properties:
>     compatible:
> @@ -23,6 +23,7 @@ properties:
>         - mediatek,mt8173-dpi
>         - mediatek,mt8183-dpi
>         - mediatek,mt8192-dpi
> +      - mediatek,mt8195-dpintf
>   
>     reg:
>       maxItems: 1
> @@ -35,12 +36,14 @@ properties:
>         - description: Pixel Clock
>         - description: Engine Clock
>         - description: DPI PLL
> +      - description: Optional CK CG Clock
>   
>     clock-names:
>       items:
>         - const: pixel
>         - const: engine
>         - const: pll
> +      - const: ck_cg

This is my understanding on how the DisplayPort Interface clocks work on 8195:

The "engine" clock is for the *VPP Engine's DisplayPort ip/block*,
"pll" is for TVD PLL divider selection
"pixel" is the gate for the pixel clock to the connected display.

"ck_cg" is useless, as that's the parent of "pixel" (and will always be)... for
example, on mt8195... check clk/mediatek/clk-mt8195-vdo0.c - the
CLK_VDO0_DP_INTF0_DP_INTF clock already has CLK_TOP_EDP as its parent, hence
enabling the first will enable the latter.

That said... you can most probably avoid adding the ck_cg clock, as if you try
to turn that off while it's in use by its children, you'll be only decrementing
a refcount, but no "real action" will ever take place.


Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
