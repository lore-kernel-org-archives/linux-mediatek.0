Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5047DE8FDD8
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Dec 2025 12:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBPWUBiL5CalH6fG9l6uoRjSAiiKhy0Vufo5waN65Uc=; b=PMkkcW1gwCjRM9Qwa3ODFryoZp
	+GNv0VsM+aP8VNvF0qRa5tUzxzSuU6Gj3l6WDNxLj2bPsS6dOASKEF+njIutEczWRmaJWOLEcVA1G
	Uvnun2uThO6Zj9RJa9enHUJDLU0E7+VsLq2Vg+yYgOYTzCVkQWQCvJ+QHpAayT+5Ht9SNGsD3a+2g
	oLr9YpvrzLwt2et86g7dZ1JR9d2aA3OPl8YowQ+jC1NbPHfzK9qEIHV726tnXc3BSXi5wr5NnC57B
	10drLrAt9iZIPD6bzO09FS2HQWiecMmSWL5weQhHQSOX9f+/BfKcub1jJ+sr0gANhzvPMcHTP2HlU
	qXHw+pnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTUU-00000001yOC-1N74;
	Sat, 27 Dec 2025 12:33:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTUT-00000001yNm-0iNB;
	Sat, 27 Dec 2025 12:33:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5608C60010;
	Sat, 27 Dec 2025 12:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF26C4CEF1;
	Sat, 27 Dec 2025 12:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766838828;
	bh=8v2tz0JfK6WqVTLbRCNHBz2Yx1sDxVrIhMcSIbpqRvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F+2YMh68LEqHknGT7FJBSeYImNH6oZ4QjdFPLuOJ3nmnc4xoYyBwnrGHW6/eBFfZ4
	 pqYXpPb9gr/xXzLk3x9DjtDTzg90Y+U03DWSdy5TIQ5EQgDv4olrwhjSh9QULbHJVJ
	 KfJhpgfCmO0fSzz+v9hghEQO/H0ir7KcWTmmiJBT4PRJ+2FKdEI1X2ZvJ/Phonht56
	 n6jRtEo+fifN808/PrA2SC5KDyvB29MFCayjhk0248wL3DV54kmOXjHNuczR+daQVp
	 Ho4Ik0kfhUmfSbkUVWP62+qO8SkTgvpNvPsZKBIRwA+6ssii+YEtlpDBu4G3N/jGvT
	 b4dgUlMdDYU7Q==
Date: Sat, 27 Dec 2025 13:33:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, 
	jh.hsu@mediatek.com
Subject: Re: [PATCH v2 2/4] dt-bindings: media: mediatek-jpeg-decoder: add
 MT8189 compatible string
Message-ID: <20251227-romantic-crystal-vole-4bb126@quoll>
References: <20251224031721.9942-1-jianhua.lin@mediatek.com>
 <20251224031721.9942-3-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251224031721.9942-3-jianhua.lin@mediatek.com>
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

On Wed, Dec 24, 2025 at 11:17:19AM +0800, Jianhua Lin wrote:
> Compared to the previous generation IC, the MT8189 uses 34-bit iova
> address-space (16GB) and requires a single clock configuration.
> Therefore, add "mediatek,mt8189-jpgdec" compatible to the binding document.
> Additionally, it corrects the inheritance for MT8188, aligning it
> with MT8189 due to their shared architecture and 34-bit iova address
> space (16GB) and singlesingle clock requirement.
> Previously, MT8188 was incorrectly defined alongside SoCs with 32-bit
> iova address-space (4GB), such as "mediatek,mt2701-jpgdec". This mismatch
> results in an ABI break, as MT8188 cannot function correctly under
> the 32-bit iova address-space (4GB) configuration.
> 
> Key changes include:
> - Introducing "mediatek,mt8189-jpgdec" as a new compatible string to
>   represent the correct architecture.
> - Updating MT8188 to inherit from MT8189, ensuring proper support for
>   34-bit iova address-space (16GB) and simplifying clock configuration.
> - Add property "mediatek,larb" for MT8189 requirements.
> - Improved formatting for better readability and consistency.
> 
> These changes ensure that both MT8188 and MT8189 are correctly supported
> with the necessary 34-bit iova address-space (16GB), while maintaining
> compatibility with their shared architecture.
> 
> Extensive internal review and testing have been conducted to validate
> these changes and ensure compliance with DT binding standards.

That's not even true. If you did extensive internal review, then people
would have tell you that you never mix fixes with new features in one
commit. Never, that's like basic rule.

Best regards,
Krzysztof


