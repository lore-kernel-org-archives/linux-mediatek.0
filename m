Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2DECFB440
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Oct 2024 05:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0Yv5zQLCrrR8EEKtvWxYxcc8rXBypZnZAeZlmUzNC8=; b=20C9I7CvieN92s8eo4uciUFXkT
	B8r3azDKvkCNVtuLKKimCOhNBrir8ijxx5g5EgPmI3dtEu2gniCRgVScKO9x0wizUivxermVJeTo4
	2RGZ09h2eiCMPjOGy/63R6zvlhzr/Kd5vqBlVDAes/Gg5VjSbsnkS7EeplC6dCehE7m0h83HJ5ahh
	TRLrcYP+JQpIU0cP/4PWZ9Mi+7+xJqdlfEIvrpOiIO7Qtp2ykasM7eER1HPwB75HT2kTLGuC52Z1k
	5J31GEe3kIyvRDtIY3ZebgEjgmYPCpaMTB915W8YW14sFLcoCqpwoPzVVyXjp+0YLnpD02dxmHSk/
	XSXjLmgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxgjm-00000001LmE-3f0r;
	Mon, 07 Oct 2024 05:56:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxgiV-00000001Lfb-173B;
	Mon, 07 Oct 2024 05:55:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 765415C557F;
	Mon,  7 Oct 2024 05:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F46C4CEC6;
	Mon,  7 Oct 2024 05:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728280534;
	bh=J9urfxcnqXo+r0zVu4pjopmJJlcc42dMLRF/ElIUMkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DY3f0qxjV4sArWNZ9Uh4gBWFawn2qn7GxWNq+6iDQHf6HBaFRq5fL51AQ/jU/kUEB
	 Li/7P9CwZXcjAgJesInKE0mRUrHEvH8juB657T1Br3QDOVNFiyoTHbtYwm3H23SMfm
	 UjPYzSO2ZOgLMya0Jt1OUuG2wvKwOuDkz9SAQvCKxOb7ioF1nVo05IVauxLq4DS/tf
	 77bJ+51qOjlI+n1DqUxWSGcPbddXWZoIfQPM1crASG5mx2hJd2yDB4Di/rxjSjwK2V
	 FdQgRt4NeiGFypEtkjKkcYObzrkngGS9VTCR/TSoLRI5wMZhRua9o2vAcqIGDVWv2E
	 3eJaBfnk+fV1A==
Date: Mon, 7 Oct 2024 07:55:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Add mt7988 SoC
Message-ID: <p7lqqhet6ahmvieh5xaws6ugsnasmuw6k4oajkmfcctuhrs4dn@quvrkmyof5ss>
References: <20241006153447.41377-1-linux@fw-web.de>
 <20241006153447.41377-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241006153447.41377-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_225535_372563_13C4004B 
X-CRM114-Status: GOOD (  14.02  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, john@phrozen.org, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org, eladwf@gmail.com, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, daniel@makrotopia.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, ansuelsmth@gmail.com, Chaotian Jing <chaotian.jing@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Oct 06, 2024 at 05:34:45PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add binding definitions for mmc on MT7988 SoC.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v2:
> - fixed minItems to 4
> ---
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index c532ec92d2d9..7380f72ea189 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -21,6 +21,7 @@ properties:
>            - mediatek,mt7620-mmc
>            - mediatek,mt7622-mmc
>            - mediatek,mt7986-mmc
> +          - mediatek,mt7988-mmc
>            - mediatek,mt8135-mmc
>            - mediatek,mt8173-mmc
>            - mediatek,mt8183-mmc
> @@ -263,6 +264,29 @@ allOf:
>              - const: bus_clk
>              - const: sys_cg
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt7988-mmc
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4

Drop

> +          items:
> +            - description: source clock
> +            - description: HCLK which used for host
> +            - description: Advanced eXtensible Interface
> +            - description: Advanced High-performance Bus clock
> +        clock-names:
> +          minItems: 3

This is still wrong... anyway, drop.

Best regards,
Krzysztof


