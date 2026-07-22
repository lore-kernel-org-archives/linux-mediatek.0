Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBF6C44512
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 06:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdvYnB+kWeZ1KxPeBGxQmiB4q+ygBCOu5lRTKg/qEN0=; b=lMU1T5dGR02embI63R1iHY+FVm
	JsOZUyVFXm/UaFZJMNeKWOPygeLI5KDRxAv5Lgl3HTEQBBokJlHgq+4viuynKxs6Ig60Wn93nV2Ga
	Up+k5uqYaZP6PXBhQZTiVEuFkGK6Ex/NZu7U70JITOhxQvjXqN0TSfkCDZCG1JOwkFiyO8w3tqku2
	4SLkrX+czT9OuQOWjkZkQ1bKOsGY2uEpGKk6fH6q1tccI8SvhKJb0t6rHD8JgYhrAp7r59kZ/VKb+
	+3TloD1lYD8V+bK02kDWW8huM1zx/PA0mjTBpbFB1axC+PXA5ucYxowQGyrz3sWg+EmH+RXw9VT+j
	IFfa5YCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQow-0000000B0ak-1u2P;
	Wed, 22 Jul 2026 06:52:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQot-0000000B0Zv-1rJl;
	Wed, 22 Jul 2026 06:52:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD07160A64;
	Wed, 22 Jul 2026 06:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908361F000E9;
	Wed, 22 Jul 2026 06:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784703162;
	bh=xdvYnB+kWeZ1KxPeBGxQmiB4q+ygBCOu5lRTKg/qEN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BQZI6bI17aExhSauJW3kHtAiZ/lPh/4uFjw9l8DBrK28ghwPbiocAFm9yC4OfvlWF
	 xxujk1JJ6k7qOKpr6cwvZshfk1n30bgsrQ0Kz7VKUizSC0BCALTZLzn3/6UTzq+zQN
	 SpWKd/gVPu88rropTW4m5rnZOJKLkvB48VxOzE/ud/J2vK7TfEpoEwQZ3tDAPjjWuB
	 GV03IHMeXQZ9SNQ6O6eT0xE+4GRkCF8qILPsyPuzCj9cu9p0OZ2gAx29YjI7FvClya
	 uzpeckF1Yd69mdqOXJivFrWywWyBzdJ5BGpIp60ivZWMh1v6qUS7EcGdBcXe/w+6ql
	 yGZq+XuzYPyCQ==
Date: Wed, 22 Jul 2026 08:52:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: nicolas@ndufresne.ca, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Subject: Re: [PATCH v10 1/3] dt-bindings: media: mediatek-jpeg-decoder: add
 MT8189 compatible string
Message-ID: <20260722-discreet-imperious-mustang-22dcf4@quoll>
References: <20260720062829.7343-1-jianhua.lin@mediatek.com>
 <20260720062829.7343-2-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720062829.7343-2-jianhua.lin@mediatek.com>
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

On Mon, Jul 20, 2026 at 02:28:27PM +0800, Jianhua Lin wrote:
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
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
>  .../bindings/media/mediatek-jpeg-decoder.yaml | 50 ++++++++++++++++---
>  1 file changed, 42 insertions(+), 8 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


