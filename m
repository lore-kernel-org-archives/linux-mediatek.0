Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4ABCA6012
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2026 10:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IK08WvoWJC1h6DlgEI7ITQrkIpsRhrwFymhPxbueT8=; b=pNVw/+PeCJLTgsDXrUfmgit5/I
	F3Ti9pGI6irhd4LIJmNd3LsRTvJgXL5NFgy7Br32AM84ZcTsgRwCIEnaQ70EhZa7bQDVBBvUv/gB7
	uwEZitOEwlZxD8H35VdMtVXGeTpe8ixXFY5DjdmxMZSy+A4tXxx3diBcbHASFXEPm8N+SedZhqdiQ
	an8hSvAci0Hv5eMUfszd95OU4j4u1T0OKBJLBhdL01lPDhHpWHpWBp/q+4Gnr9nv/QiFwNPhArFmj
	s+3sbJmOUhh20xTAKbPyaTvcU+POCsiO2746TNbNrZ3coiHtAE8Tl70NBlgF/SkamdZHQeaMBQ3yv
	hjaor9XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7g2-000000061mN-1bej;
	Fri, 09 Oct 2026 10:18:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7g1-000000061m9-0v4f;
	Fri, 09 Oct 2026 10:18:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 705AC41471;
	Fri,  9 Oct 2026 10:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE501F000FF;
	Fri,  9 Oct 2026 10:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791541087;
	bh=2IK08WvoWJC1h6DlgEI7ITQrkIpsRhrwFymhPxbueT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MIDk5/IU6tP3YARpKWHfyeeG7ABschktkAyCEp43D1TgmMbNhOnbWuBEzKUe9lWMR
	 /CeFpSIl8ufe90s/Wj6YSXA790NYrCVsD/XaiFPrAXIUoy5zv077JDbwfOGfBHnyE/
	 sYHwIJ6/3zjaaO/jmSOCGbNfKnCqX4PMK8LZEGaoxVzmJ0SWiD3f9xAnAAu3gdQZsl
	 rP020XSgCfBZJozzUCXHBjZlzD9pHyfe1LVKQZcyQU+wwfTu4KrSPWEs2Tv7/4Jpv5
	 hsvQXwOCt7ynkBKCapGo5icvAj5mPENhu6iEZFYuyLRzhlSD6Chd9NXO7gQtP/ABb1
	 3FJyzVLyxAj7A==
Date: Fri, 9 Oct 2026 12:18:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tim Kuo <Tim.Kuo@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Steven Liu <Steven.Liu@mediatek.com>, 
	Sky Huang <Skylake.Huang@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>
Subject: Re: [PATCH v3 1/2] spi: dt-bindings: mediatek,spi-mt65xx: add
 MT7987/MT7989 compatibles
Message-ID: <20261009-tricky-fine-aardwolf-cca31a@quoll>
References: <20261008085332.802898-1-Tim.Kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008085332.802898-1-Tim.Kuo@mediatek.com>
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

On Thu, Oct 08, 2026 at 04:53:31PM +0800, Tim Kuo wrote:
> The MT7987 and MT7989 SPI IPs are IPM designs, so they keep
> "mediatek,spi-ipm" as their fallback compatible, but they widen the tick
> delay field of SPI_CMD_REG and therefore need compatibles of their own.
> 
> Signed-off-by: Tim Kuo <Tim.Kuo@mediatek.com>
> ---
> v2: Add mt7987 and mt7989 real device compatible
> v3:
>  - Drop "mediatek,spi-ipm-v59" 
>  - Move compatible of mt7987 and mt7989 to group of spi-ipm fallback
> 
>  Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> index 3bf3eb1f8728..63b23928c734 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> @@ -35,8 +35,10 @@ properties:
>            - enum:
>                - mediatek,mt7981-spi-ipm
>                - mediatek,mt7986-spi-ipm
> +              - mediatek,mt7987-spi
>                - mediatek,mt7988-spi-quad
>                - mediatek,mt7988-spi-single
> +              - mediatek,mt7989-spi
>                - mediatek,mt8188-spi-ipm
>            - const: mediatek,spi-ipm

Nope. How is this a specific compatible?

Look at git or even read the REST of this file.

Best regards,
Krzysztof


