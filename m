Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BE9C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 22:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3J32u+76iuBmZ/pyIG8ZO0104ISkkpKVuUfH4dEN4XQ=; b=TqCJ2bhmh7f/2qpgKWAl/7M5WS
	ZfnM/9C1OBuHC93sCxeP/mHhDiV9LYcCDsIovpUKkAhulKPldtDwHC21u1VFLgBGNwFOMI/zVUmZg
	tL60FtcbTDPXL/RIQzIXb3oQcsQvXHJsabm+Sly0zq6osr/HGF3XL2b5686V44Fi09o3mzh2BJziB
	aZRZo0aRWmqiGLS81Fx55j5KYyIPKodYqbYEbl8QPRomSXxn+YD1Mx+DiJ/qq1ffvlWLp9qPN1vO0
	J9qCqhEq51/2Pb0yXC4KSEXUDzYXH7OSuG8Hromo203zDI9b3FSFsUHKbWItnOaDIekY48a+Ci+SU
	HxzaEGgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMFQF-0094p2-2u;
	Wed, 19 Jul 2023 22:13:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMFQC-0094oH-2N;
	Wed, 19 Jul 2023 22:13:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 38F0E61861;
	Wed, 19 Jul 2023 22:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9479C433C8;
	Wed, 19 Jul 2023 22:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689804803;
	bh=9mhog5cEC4jCgLXESNkH8Vrr7nDt6CeB9bPN18iRiNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRwSja7i1CQgKB9XQYh+QyWUoWstQ49qNtCB9iXIuGgoS3XxJhCxpva2LrPrMRiU5
	 uBqo2Phhs6Ly5amnSUfJv2cjMtIntJKUQVB9WCPpiGsDq1hdt15j2rXjEM/di8STuB
	 4AtPTy/KV5sl0MQum3efWRfASssJaHvMhpgvJPeHtrz5qkcd8apV+QBzR836rgBlSC
	 u6L2ldh9KuUaKN0vMQm3Xxg8AI+m783g74RRZaTid3wPQ2wZC6gXnK67Z6i55Yxd0J
	 jeMFWnTh8SW7K4bS1UNuiiVnvn3u9+2OZnpUTpTGaxrc8fNIR8IRySaNR5iDGGu0QC
	 N64XRlwBI/mGg==
Received: (nullmailer pid 870826 invoked by uid 1000);
	Wed, 19 Jul 2023 22:13:20 -0000
Date: Wed, 19 Jul 2023 16:13:20 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Russell King <linux@armlinux.org.uk>, Florian Fainelli <f.fainelli@gmail.com>, Greg Ungerer <gerg@kernel.org>, =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 2/9] dt-bindings: net: mediatek,net: add
 mt7988-eth binding
Message-ID: <20230719221320.GA865753-robh@kernel.org>
References: <cover.1689714290.git.daniel@makrotopia.org>
 <584b459ebb0a74a2ce6ca661f1148f59b9014667.1689714291.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <584b459ebb0a74a2ce6ca661f1148f59b9014667.1689714291.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_151324_880480_C8B10BBE 
X-CRM114-Status: GOOD (  23.49  )
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

On Tue, Jul 18, 2023 at 10:30:33PM +0100, Daniel Golle wrote:
> Introduce DT bindings for the MT7988 SoC to mediatek,net.yaml.
> The MT7988 SoC got 3 Ethernet MACs operating at a maximum of
> 10 Gigabit/sec supported by 2 packet processor engines for
> offloading tasks.
> The first MAC is hard-wired to a built-in switch which exposes
> four 1000Base-T PHYs as user ports.
> It also comes with built-in 2500Base-T PHY which can be used
> with the 2nd GMAC.
> The 2nd and 3rd GMAC can be connected to external PHYs or provide
> SFP(+) cages attached via SGMII, 1000Base-X, 2500Base-X, USXGMII,
> 5GBase-KR or 10GBase-KR.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../devicetree/bindings/net/mediatek,net.yaml | 74 +++++++++++++++++--
>  1 file changed, 69 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> index 38aa3d97ee234..ae2062f3c1833 100644
> --- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
> @@ -24,6 +24,7 @@ properties:
>        - mediatek,mt7629-eth
>        - mediatek,mt7981-eth
>        - mediatek,mt7986-eth
> +      - mediatek,mt7988-eth
>        - ralink,rt5350-eth
>  
>    reg:
> @@ -61,6 +62,12 @@ properties:
>        Phandle to the mediatek hifsys controller used to provide various clocks
>        and reset to the system.
>  
> +  mediatek,infracfg:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the syscon node that handles the path from GMAC to
> +      PHY variants.
> +
>    mediatek,sgmiisys:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      minItems: 1
> @@ -229,11 +236,7 @@ allOf:
>              - const: sgmii_ck
>              - const: eth2pll
>  
> -        mediatek,infracfg:
> -          $ref: /schemas/types.yaml#/definitions/phandle
> -          description:
> -            Phandle to the syscon node that handles the path from GMAC to
> -            PHY variants.
> +        mediatek,infracfg: true

You don't need this. What you need is 'mediatek,infracfg: false' in the 
if/then schemas for the cases it should not be present.

Rob

