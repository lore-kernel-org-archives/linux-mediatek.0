Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B9ED4A60E
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 08:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtwXi98dukcBHXUmYfDVVmv4uOwHXaoUVbR21k6BzYs=; b=tXRub56VIFAHHwfT0xWz0BwTaU
	fLsUXrtbQz06PxeYhybORFzYz1lgEBB94Fj8XRxWFsoTauEjEdLfO5ScynTTfPs8Y1vF0A1jPCcuG
	3Hzi+gyFYm/pOIX25kKWUHeUk36x35T8PsRsG2TTsTKWhMIHG5uuVmvtBwLUrHTnoyeOcIYxVFWgX
	9ZiaLiU6X5eo+ZMc0hWtPkjFBCJ7QwPYPHzVFeJD6IWP/rIY042qwrvzC9BDUbxYsLkpo2MGs0Fgh
	oWWVU9ZLIj4HxJwmhIGMyQxOEvHVXpso3C3PsZ8FioIslti7s0RXHOxlLs97oYqLXwnEH74Rk4/4s
	o5PE2MUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfNy-0000000Dmbo-17jN;
	Fri, 16 Jan 2026 08:40:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgfNv-0000000DmbE-20Zv;
	Fri, 16 Jan 2026 08:40:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3705C419BB;
	Fri, 16 Jan 2026 08:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86164C116C6;
	Fri, 16 Jan 2026 08:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768552846;
	bh=f+DnxG+tWr6LkjJ/46PLbA9O6VfKrOr4lzxCHsXIu2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MtXZls+GShqS+5lTMgfRUU+FuysRlVU4riZP1foVzCoS5sfZl2JAjlbABOIdVhveG
	 BhtkSrQOvDZOF9BKZjpOSxHhvuDPA4fjWKHHHoELkrV9mC+Lfjc6v67jPBV2P27aXM
	 NzOAt+hDDfs/36IJawV0O7D+WcGDur5ipqM5jxjC10vde+6/Btpna571rGyOWWqqhR
	 byJ8MJj20689SaCiIlBAkgsWJXddQZ0PbTjK/fqUfu6mzhjoniPrt21U1e8B9G40Pf
	 ogO/MP0Ay0gVUlzuJXth07zDupN/UtdFlEW531x5/krYN/QyNRNBFPrQw1EHuJRLsX
	 foW/nsb3TK6Mg==
Date: Fri, 16 Jan 2026 09:40:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, andersson@kernel.org, 
	mathieu.poirier@linaro.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, tinghan.shen@mediatek.com, olivia.wen@mediatek.com, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2] dt-bindings: remoteproc: mediatek: Remove l1tcm MMIO
 from MT8188 dual
Message-ID: <20260116-soft-rapid-mongrel-8de32e@quoll>
References: <20260115111645.63295-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115111645.63295-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_004047_564439_1403EF2A 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jan 15, 2026 at 12:16:45PM +0100, AngeloGioacchino Del Regno wrote:
>    reg-names:
> -    minItems: 2
> +    minItems: 1
>      maxItems: 3
>  
>    clocks:
> @@ -185,7 +185,7 @@ allOf:
>      then:
>        properties:
>          reg:
> -          maxItems: 3
> +          minItems: 3
>          reg-names:
>            items:
>              - const: sram

I think you also need to update the if:then: section with
mediatek,mt8183-scp+mediatek,mt8186-scp+mediatek,mt8188-scp

> @@ -196,11 +196,22 @@ allOf:
>          compatible:
>            enum:
>              - mediatek,mt8188-scp-dual
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 1
> +        reg-names:
> +          items:
> +            - const: cfg
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
>              - mediatek,mt8195-scp-dual
>      then:
>        properties:
>          reg:
> -          maxItems: 2
> +          minItems: 2

You still need maxItems here, otherwise you change the meaning to 2-3.

>          reg-names:
>            items:
>              - const: cfg
> -- 
> 2.52.0
> 

