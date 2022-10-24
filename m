Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BBBC38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 16:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZZ2rH46TVYJ7OPEtrme1f9RRklxhQp2hRpt50E13zU=; b=JR7kGyfDyJ6rsX16eQduBmeIQx
	SXjiISdcL8+jF0PitjsyU1D9EWvzlfpjOFjLvlfePOc/BKWeTT1Fh67iT8Gk13qIjQOokwQOIrPi+
	+Q/WI+CgC2WQgzUu5fhOr7yMTvFSJE7Y+d6cEyP+5BKwZuTLnBybf69RIdTEDIawbvZ9lBooIN8Jm
	CCCL0TODtOx9LK3B0zAeph77MyF8/DR3dCbQGvc1Mov26PqC+ICwb/WI5Hjg6BCfQy0qoR7Dh7PtY
	W0QjYjFRSOY0bN+9L3dw3jigs4CnesMd8DfLUPPSKhM4sGq4VQZ3NmbEGmEATEVe7cVdhd43X9zR+
	Tr1PIrJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on0Yl-002KyF-SG; Mon, 24 Oct 2022 16:44:19 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on0YX-002Kv6-9R; Mon, 24 Oct 2022 16:44:06 +0000
Received: from notapiano (unknown [194.36.25.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7737B6602392;
	Mon, 24 Oct 2022 17:43:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666629840;
	bh=4kWtLxHplFOS10HqVPq+7P3+dYq5PouJzYToXkZX4Kw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RxnUpi1bDW82nmb44+goLMrowb5Wd9tioPQl7b/kkrgLASz3MA/H6Mfcrk1OWg9p0
	 kfT8CZT2IAaA5LedmtnGE+nyDEFDU9GMgEWulgV6pIC5lxMp8S63ZLYECm16UV3Vtl
	 nmLjvBik0WwkbtjEKwi76XMOYyUlFA6ToQyYFUkrlAnhl3B+7dRnMg/uoTO/8+tPtG
	 ueksg4mems9ce5/g7amf9L164rpyDn32FV4nTDlaf2rB1rdxE8SRYh1PpvbtovXUdP
	 0SXlzUsXOMhX+5Pbbfufsxf0NrisgDUYMQmSL0nog1TSoBOmBHnV7ANsQ9bvHiY72g
	 s9ZX7RViGNyLQ==
Date: Mon, 24 Oct 2022 12:43:53 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v3 2/7] dt-bindings: mmc: mtk-sd: Set clocks based on
 compatible
Message-ID: <20221024164353.jzvx4ea442e4vahj@notapiano>
References: <20221023091247.70586-1-linux@fw-web.de>
 <20221023091247.70586-3-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221023091247.70586-3-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_094405_500934_62379255 
X-CRM114-Status: GOOD (  22.22  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

thank you for picking this up.

On Sun, Oct 23, 2022 at 11:12:42AM +0200, Frank Wunderlich wrote:
> From: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> The binding was describing a single clock list for all platforms, but
> that's not really suitable:
> 
> Most platforms using at least 2 clocks (source, hclk), some of them
> a third "source_cg". Mt2712 requires an extra 'bus_clk' on some of
> its controllers, while mt8192 requires 8 clocks.
> 
> Move the clock definitions inside if blocks that match on the
> compatibles.
> 
> I used Patch from Nícolas F. R. A. Prado and modified it to not using
> "not" statement.
> 
> Fixes: 59a23395d8aa ("dt-bindings: mmc: Add support for MT8192 SoC")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> 
> ---
> v2:
> - add this patch
> v3:
> - add blank lines and change "not" to matchlist
> - reorder entries - make generic first then order alphanumeric
> - rewrite commit description
> - drop soc-specific mt8183 - constraints were also set for it above

This is wrong, see below.

> ---
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 113 +++++++++++++-----
>  1 file changed, 83 insertions(+), 30 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> index 3cbf0208f1b4..31bb6dc329d2 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
[..]
>  
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        const: mediatek,mt8183-mmc
> -then:
> -  properties:
> -    reg:
> -      minItems: 2

You can't drop this. Nodes with the mt8183 compatible should keep requiring two
reg values. It's not covered by the branch below.

Thanks,
Nícolas

> +allOf:
> +  - $ref: mmc-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt2701-mmc
> +            - mediatek,mt6779-mmc
> +            - mediatek,mt6795-mmc
> +            - mediatek,mt7620-mmc
> +            - mediatek,mt7622-mmc
> +            - mediatek,mt7623-mmc
> +            - mediatek,mt8135-mmc
> +            - mediatek,mt8173-mmc
> +            - mediatek,mt8183-mmc
> +            - mediatek,mt8186-mmc
> +            - mediatek,mt8188-mmc
> +            - mediatek,mt8195-mmc
> +            - mediatek,mt8516-mmc
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          items:
> +            - description: source clock
> +            - description: HCLK which used for host
> +            - description: independent source clock gate
> +        clock-names:
> +          minItems: 2
> +          items:
> +            - const: source
> +            - const: hclk
> +            - const: source_cg
> +
[..]

