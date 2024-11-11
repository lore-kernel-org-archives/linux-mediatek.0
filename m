Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91AAD3ABF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2024 20:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1JK9Kr+GCqzwxAexfpzkOKsF3faosyxxsDPxmghl8gg=; b=sm2SgUBA54tPQky59/WUbVkFNk
	m89+5WjFZfNXL22pMsNTq0aJHNW4VktCUNRvEl4yB2CcRMmRy71OsuYARGQfisGXJmurCPbi+0SHx
	9Ah9m7KWhnQ74Gt2eSwtWfOX52wPAVzknQjcZi1As7nHoLrg4SKniqSToZrxCNUfyZPLsUe84nYRl
	44azZFNA5JokhLX/bCn01WekS0xN49IS/BBfnR3gFceqETEk3LrY+WbYifAkVOv+l7bTW1KsscTgG
	MlxUomtI2UCuewrDsZAo50fqzC5DKBRP6mr/bElEQ2k+XzxrufKfA+vhMdFcQ7ey9XZ677YBHtg5L
	UQAW+e7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbLT-00000001Ezh-3hol;
	Mon, 11 Nov 2024 20:49:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAbAk-00000001DXI-3r5v;
	Mon, 11 Nov 2024 20:38:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ABF34A40928;
	Mon, 11 Nov 2024 20:36:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D41CC4CECF;
	Mon, 11 Nov 2024 20:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731357485;
	bh=KwaHLfJUIhXroumjHZ4bZlkQwpn6earNMC5wOJS8F3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s+ImfXkPI1O4CAQC7LGmSngp4INKqyeJCveS2DSuVJVX1UgzHimen+i0RyVKBvEk6
	 hQN4Z9wDYJzrqvLNKWD7+hhjC761myQjPqeqfGAb9PwqGcW0JzjQF8UtGdneSpGBho
	 qitioKlKlvo5kwuGk61r6IeO/Ve+XjrpQkXg+xWY1vizwq/d7F2ZpCLLBMUKfQMqWK
	 bYiq2qedk57RKVeHa6XzX+cOI7Qsjr2GqkiJ17Jwl/dCS77Foo2Qhla7+yuLsWyC/+
	 3A8d2XysWw8y7QiUgl3smDorGRCHuTQ+0t54NHPTGgJqXGgciIoN6HKu0R7Il42VPM
	 t12XXSrSSZFCg==
Date: Mon, 11 Nov 2024 14:38:03 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH] dt-bindings: spi: add compatibles for mt7988
Message-ID: <20241111203803.GA1917413-robh@kernel.org>
References: <20241109105029.52748-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109105029.52748-1-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_123807_043162_55474E5E 
X-CRM114-Status: GOOD (  14.50  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leilk Liu <leilk.liu@mediatek.com>, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Nov 09, 2024 at 11:50:28AM +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> MT7988 has 2 different spi controllers. Add their compatibles.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> index e1f5bfa4433c..ed17815263a8 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> @@ -35,6 +35,8 @@ properties:
>            - enum:
>                - mediatek,mt7981-spi-ipm
>                - mediatek,mt7986-spi-ipm
> +              - mediatek,mt7988-spi-quad
> +              - mediatek,mt7988-spi-single
>                - mediatek,mt8188-spi-ipm
>            - const: mediatek,spi-ipm

Does the fallback make sense for both? Is there some common subset of 
functionality where they are the same?

Rob

