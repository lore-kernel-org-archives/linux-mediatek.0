Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451BCCE79AA
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 18:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDOf3d47/cXNtqKgF2KstQVxLQ+sa5NOv+jSa5w94do=; b=LkICVHQn7SwtCejBdBlwS8N2HU
	1zQW9amicCTs502naRH/s/ClB/Ju3DkP4c62nVVTuEkZEmICnVxcIzdUysV6XLIC07nTbI04hOwLB
	gAdhyy/+NvBlgfuZWbHEeYW+taGiHr/ywwyPHRPS9F4oO7wjDFiTpIzHKpVsUr/Zh3y0woigzoicA
	9kKT9kNXXMu7WYyNBhb9IPu4VWxoiOIBW1Ytd3hBTUhJIAokXGpCiJ8ccvmyrp1txybvM3pAlGtZv
	aRMK1us1qxA9OSvw2L5qA2qTVtIttGi4Ee9rISaXO/CROCKF2uCjCk5M/swiqPSE8Fj4BhJLT9xww
	xqtiAV4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qif9x-0012Xl-2J;
	Tue, 19 Sep 2023 18:09:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qif9t-0012WC-1q;
	Tue, 19 Sep 2023 18:09:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D81F561731;
	Tue, 19 Sep 2023 18:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 307F6C433C8;
	Tue, 19 Sep 2023 18:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695146952;
	bh=NiQhEzZ16sAKsbZx0nSfSfGM+Oqurfn7GL5Vpupl3ME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMh1x1eWX1dPxF/rQjU9qyK5jvupSZnFN5lJhRo5QZcgCNgl9DRLJebEn0oTxgxKR
	 6hXm+2Vc4GYKV/b3pcEnNDV7vj7XItmLzQH0Z0Wyswr6f2TSEH5l/khhE/dPQciCUF
	 ha7lAs49r0QPgsLJspD5OKPANA7YmKJuzBQQ8vp2bY/6wBNG9uimXqXNOPDXwAe1AO
	 QGVNfqG68EIyQvEZlC/Gr5vTWv/WqmIHQNYM0rOfI8mBc6zyI5oRGv12W6RqjXCljJ
	 8QSSln7LWmvK+RoftT023Y5CexORitN9iJ2EWYgtfLxPtC1D8CapUTzc9iAfoiJCYR
	 jaXie/FMK4iwg==
Received: (nullmailer pid 4169551 invoked by uid 1000);
	Tue, 19 Sep 2023 18:09:09 -0000
Date: Tue, 19 Sep 2023 13:09:09 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 1/2] dt-bindings: net: mediatek,net: add
 phandles for SerDes on MT7988
Message-ID: <20230919180909.GA4151534-robh@kernel.org>
References: <cover.1695058909.git.daniel@makrotopia.org>
 <35c12a115893d324db16ec6983afb5f1951fd4c9.1695058909.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <35c12a115893d324db16ec6983afb5f1951fd4c9.1695058909.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_110913_698616_E6A3690E 
X-CRM114-Status: GOOD (  18.82  )
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

On Mon, Sep 18, 2023 at 11:26:34PM +0100, Daniel Golle wrote:
> Add several phandles needed for Ethernet SerDes interfaces on the
> MediaTek MT7988 SoC.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> index e74502a0afe86..78219158b96af 100644
> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> @@ -385,6 +385,34 @@ allOf:
>            minItems: 2
>            maxItems: 2
>  
> +        mediatek,toprgu:
> +          $ref: /schemas/types.yaml#/definitions/phandle
> +          description:
> +            Phandle to the syscon representing the reset controller.

Use the reset binding

> +
> +        mediatek,usxgmiisys:
> +          $ref: /schemas/types.yaml#/definitions/phandle-array
> +          minItems: 2
> +          maxItems: 2
> +          items:
> +            maxItems: 1
> +          description:
> +            A list of phandle to the syscon node referencing the USXGMII PCS.

Use the PCS binding

> +
> +        mediatek,xfi-pextp:
> +          $ref: /schemas/types.yaml#/definitions/phandle-array
> +          minItems: 2
> +          maxItems: 2
> +          items:
> +            maxItems: 1
> +          description:
> +            A list of phandle to the syscon node that handles the 10GE SerDes PHY.

Use the phy binding (phys, not phy-handle for ethernet PHY).

> +
> +        mediatek,xfi-pll:
> +          $ref: /schemas/types.yaml#/definitions/phandle
> +          description:
> +            Phandle to the syscon node handling the 10GE SerDes clock setup.

Use the clock binding


> +
>  patternProperties:
>    "^mac@[0-1]$":
>      type: object
> -- 
> 2.42.0

