Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72674606A89C
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 14:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eOaocoxX;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PpD4pmK5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xVGo4n8kANG+d9df7pyjbNiLNk7bdG6h6VAwEv6uVzM=; b=eOaocoxXGUx2+LyuImlqgYBHfI
	iM5FrKACYweDXkrOcnziZ9E4h3AFIS53NonS83T7jw/elBukC8EA2jfPxg+j5XPFmZ9v5AciF/Cqg
	5qcoo4aPyM05IS5w45SGVYgAZu3cRgX5Fxr27WqDdov1i1xMgZ7QXssT23afHIIXL//WY09HYqpdd
	U0QOq25oh+94FzP4E1aMr/aGq89iCyQ/+Qt/nzqFUdQHgUE7xZQl/TbjSLLcP3NzrloYrcnS+Ey+U
	WZU78nLg24JS2MMGnUvPKiabmQZxWd8+5/ThorFW0Pnm9ync1xvSEvZjwqeC7LJroV2ySLQaKvHwc
	TojI8znA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSF7A-0000000GImH-0fJX;
	Sat, 14 Nov 2026 14:52:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSF70-0000000GIiR-32Mv;
	Sat, 14 Nov 2026 14:52:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B34EB62763;
	Sat, 14 Nov 2026 14:52:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A7D1F000C5;
	Sat, 14 Nov 2026 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794667933;
	bh=xVGo4n8kANG+d9df7pyjbNiLNk7bdG6h6VAwEv6uVzM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PpD4pmK57h1+iemKNBgqZYbMnTEPuJZ8EZThjqZ+TMf/YrSPbQ4d5wGd8XoZ6kGjR
	 /69pmAhVH6MfKK1f4UqHVDgy0dfGgcDTYcpQ7DvyYntWkqBvlVdR+BjOQdTXgnquz1
	 R30shb3G28o41pkxNOmU0VNZKbz0MN+vhDjghJwS/Yf0xyJ1RRowtdswLQSFpKpF9B
	 5WoovcgdmTtioxkmFauu+yY9hmJqfpLcVQawslJv5hVqbJ0WL+hbxnxkB3CNKyGKW/
	 tZmeP7MtJe0vA88WA0XYJz6o0HKeZs5j22dFwesuigwu3rntt+wNMeWBaoKkVtJr0F
	 geFBG+P6HcMVg==
Subject: Re: [PATCH net-next v5 03/10] dt-bindings: net: mediatek-dwmac: add
 support for MT8189 SoC
From: netdev-bot+sashiko@kernel.org
To: louisalexis.eyraud@collabora.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, biao.huang@mediatek.com,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, edumazet@kernel.org, kernel@collabora.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Date: Sat, 14 Nov 2026 14:52:12 +0000
Message-ID: <179466793200.2199510.8648958877429402751@kernel.org>
In-Reply-To: <20261110-dwmac-mediatek-mt8189-v5-3-7d99d6292962@collabora.com>
References: <20261110-dwmac-mediatek-mt8189-v5-3-7d99d6292962@collabora.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The new compatible `mediatek,mt8189-gmac` is added to the
  binding, but the descriptions of `mediatek,tx-delay-ps` and…

--

dt-bindings: net: mediatek-dwmac: add support for MT8189 SoC

This patch adds the mediatek,mt8189-gmac compatible to the MediaTek DWMAC
binding and lowers the clocks/clock-names minItems to 4. It also adds
allOf conditionals that keep 5 clocks for MT2712/MT8188/MT8195, allow at
most 4 for MT8189, and disallow mediatek,rmii-clk-from-mac on MT8189.

> diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> index 9562406166387..0fc2eed066464 100644
> --- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml

[ ... ]

> @@ -153,6 +152,39 @@ required:
>    - phy-mode
>    - mediatek,pericfg
>  
> +allOf:
> +  - $ref: snps,dwmac.yaml#

[ ... ]

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8189-gmac
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4
> +        clock-names:
> +          maxItems: 4
> +
> +        mediatek,rmii-clk-from-mac: false

[Severity: Low]

This block only disallows mediatek,rmii-clk-from-mac for MT8189, so
mediatek,tx-delay-ps and mediatek,rx-delay-ps are still allowed there.
Should their descriptions also cover the new compatible?

At the moment they only describe MT2712 and MT8188/MT8195:

  mediatek,tx-delay-ps:
    ...
      For MT8188/MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple of 290,
      or will round down. Range 0~31*290.

The mediatek,rx-delay-ps description has the same text.

The later patch in this series, "net: stmmac: mediatek: add support for
MT8189 SoC", uses a different step size and maximum for MT8189:

  #define MT8189_MII_DLY_STAGE_DIV	180  /* 180ps per stage */
  #define MT8189_MII_DELAY_MAX		5760 /* 32 x 180ps */

For MII/RMII, these vendor properties are the only way to set the internal
delays. mediatek_dwmac_config_dt() reads the standard *-internal-delay-ps
properties only for RGMII.

Suppose a value is picked using the documented 290 ps step. The driver will
then program value / 180 stages instead of value / 290. Any value of 5760 ps
or more (for example 20 * 290 = 5800) is rejected with -EINVAL:

  of_property_read_u32(plat->np, "mediatek,tx-delay-ps", &tx_delay_ps);
  if (tx_delay_ps >= plat->variant->mii_delay_max) {

and probe fails.

Setting mediatek,tx-delay-ps: false for MT8189 would not be the right fix,
because it would remove the only way to configure MII/RMII delays on MT8189.

Could both descriptions get an MT8189 line with the 180 ps step and the
0~31*180 range instead?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962%40collabora.com

