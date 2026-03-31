Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3211FF60D8
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2026 06:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nqMPxCyJPgWl55lvKwJiskd5mysgy8bz3FdQbDuTwEE=; b=K37Rf9w6t4OACKkMGhVaHT9M0f
	QCdbz0GifeAo8bumJw/l+9XrxdK0dx5+KWqs74gu2bfsgcxo+T/5kprUzF9v/e1JxZP0UCXVDAXdn
	r7PVR3CT+3hnkRDTIxpPx6YaN4XvzpdP8/QZNAbluG7UyCnAB2KUwn/1Ez/L7yaquUuS6auW9+Jwg
	cmNEAMy3rMVITxS/RVxODrhoBfTZYNdi0lYel2xae4SbydzpcAGltRg93spAvvdKYPdee4ZGEFLDT
	SOJIaiTQYZw7TGELTgktcBQ9j8jRmv9OyhrPyyAwCBoYF8+9hWMzxm6OazMycUQQLoTYpfYEPYzVE
	CQq8zDCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7T3I-0000000CPxN-0hS4;
	Tue, 31 Mar 2026 06:58:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7T3G-0000000CPwM-02A8;
	Tue, 31 Mar 2026 06:58:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 52A49600CB;
	Tue, 31 Mar 2026 06:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5D3C19423;
	Tue, 31 Mar 2026 06:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774940293;
	bh=vZRhJfLIHtRNxv9Ku8UnrdHkQj63umsc0nroN0CiSVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DFnvt4VrrZmcm2PstmRZXNm45WHCeH7OgYOg3Q0leLVTj/SIpXSxL0W19zsdk9X8I
	 he4gRaNRwP4dhmSnFU2zFfosEJvPlIity6K0lyY8vWbJkyTStL9vuGEDFiilu1DkOE
	 iDlLaqXATsDH3qkySF1HT82ImNt/ejvAk5Z0ddAKjmCGX8TjuVcqj3TUie8zY8xlhg
	 lU5lIqgPNe/DJCay49+04YOUCBZxnvyqMBKCR7ebe6ZDGmB+r2Yf2q1RydHf4vWBfV
	 MSl30gU6me9sgK0iR21Qx6CsKY8/jgP6mEaAhbtiWQxcWhYntwyN9YMPeYkV41rIZ1
	 QnDOh70oPK00A==
Date: Tue, 31 Mar 2026 08:58:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: nicolas@ndufresne.ca, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Subject: Re: [PATCH v5 1/3] dt-bindings: media: mediatek-jpeg-decoder: add
 MT8189 compatible string
Message-ID: <20260331-thankful-crouching-camel-cfabce@quoll>
References: <20260331005458.24010-1-jianhua.lin@mediatek.com>
 <20260331005458.24010-2-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260331005458.24010-2-jianhua.lin@mediatek.com>
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

On Tue, Mar 31, 2026 at 08:54:56AM +0800, Jianhua Lin wrote:
> Add the compatible string for the JPEG decoder block found in the
> MediaTek MT8189 SoC.
> 
> Compared to previous generation ICs, the MT8189 JPEG decoder requires
> 34-bit IOVA address space support and only needs a single clock
> ("jpgdec") instead of two. Therefore, it is added as a standalone
> compatible string without falling back to older SoCs.
> 
> Update the binding schema to include the new compatible string and add
> an `allOf` block with conditional checks. This enforces the single clock
> requirement for MT8189 while preserving the two-clock requirement
> ("jpgdec-smi", "jpgdec") for older SoCs.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
>  .../bindings/media/mediatek-jpeg-decoder.yaml | 44 +++++++++++++++----
>  1 file changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> index a4aacd3eb189..601fe05b73e7 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> @@ -15,10 +15,10 @@ description: |-
>  properties:
>    compatible:
>      oneOf:
> -      - items:
> -          - enum:
> -              - mediatek,mt8173-jpgdec
> -              - mediatek,mt2701-jpgdec
> +      - enum:
> +          - mediatek,mt2701-jpgdec
> +          - mediatek,mt8173-jpgdec
> +          - mediatek,mt8189-jpgdec
>        - items:
>            - enum:
>                - mediatek,mt7623-jpgdec
> @@ -32,13 +32,22 @@ properties:
>      maxItems: 1
>  
>    clocks:
> +    minItems: 1
>      maxItems: 2
> -    minItems: 2
>  
>    clock-names:
> -    items:
> -      - const: jpgdec-smi
> -      - const: jpgdec
> +    minItems: 1
> +    maxItems: 2

Why jpgdec-smi alone is now valid? Drop these two.

> +    oneOf:
> +      - items:
> +          - const: jpgdec
> +      - items:
> +          - const: jpgdec-smi
> +          - const: jpgdec
> +
> +  mediatek,larb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: a phandle to the smi_larb node.

Best regards,
Krzysztof


