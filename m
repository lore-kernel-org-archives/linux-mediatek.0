Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D25CF3195
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 06:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tonD7okvUOorxZ8VRTLArA84zHRIPiOHD5dpQshNd7M=; b=twFWv9ocJxMkunRoT+wp0g6aPV
	2YtcvzRskrpQZExTHZGj1x5ytjbCD2kMJQc8l0MZD8btixTRA6ZpOZv4uCF6YSO84QHHsz3Ssw6sH
	uj8mGKiv/CmE6XUprCbRSRnBoUXCTXqrAtpeWs9dlc3YjuYVuGd5Fa45Pn4fdbfKeRyZQTvBfnChY
	1PfqMDKTwW9sQFVBKVApNzCE5eKKyWyoyFR1PXrjr0Jfzr+pPcDLkorILNK1NDshDJmK/6+4OP7B2
	NSkuTOr94dACvk2WeImCOiXnbQ6Uqjv4UBv9t57+0FPbhM8p9mLgZTLXp7WdgNFNb3+S3hidVF0HG
	aMpD76dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svsbd-00000004uuI-0gyd;
	Wed, 02 Oct 2024 06:13:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svsaN-00000004ugA-0F75;
	Wed, 02 Oct 2024 06:11:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2CA2F5C0F71;
	Wed,  2 Oct 2024 06:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9F6C4CEC5;
	Wed,  2 Oct 2024 06:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727849501;
	bh=2y3iWK2PGdYna/MWeskhSWBizeDSgrBBmx0svF+hg+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H+qtrCDIVZ8EGwzzt1SNU+qkeseOJbL0CFREx8eHQkdZR00sWzH95mOItvG1nkrRF
	 kSn6911vx5QIZ9KSNR4zIBK3Sws6vlBwvts5ESyYFFweSdbDm0z6VwiZi0kR/AIqVX
	 wHg+DZgeqOPZJ7IGDL7Ikz71HOKSmpb0te/Evwcp0V9ZSt8EBbub6qxOTnEcqt/ibc
	 krHIvq+kROfOZ/TpUG8XsoC7/MEHIj+L+T2h7o5JVQI2/vFF2cF3pT8vjwmThMd/dk
	 2GnFthf6cvnuAXQXuNycWLhz92WBM7PZNbf0EAuwcMOUkay7xakQhIpPNvjP0aOF1b
	 gjXNgQnnwhS7w==
Date: Wed, 2 Oct 2024 08:11:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pablo Sun <pablo.sun@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 3/6] dt-bindings: nvmem: mediatek: efuse: Reuse
 mt8186-efuse in mt8188
Message-ID: <mh7upw2y2dclyosved3chw7chpqgdg4a3j5ftwftfhm6v5uqpt@cotoeuopfbqg>
References: <20241002022138.29241-1-pablo.sun@mediatek.com>
 <20241002022138.29241-4-pablo.sun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241002022138.29241-4-pablo.sun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_231143_190424_9FC82AFA 
X-CRM114-Status: GOOD (  16.47  )
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

On Wed, Oct 02, 2024 at 10:21:35AM +0800, Pablo Sun wrote:
> mt8188 has the same GPU speed binning efuse field just
> like mt8186, which requires post-processing to convert to the
> bit field format specified by OPP table.
> 
> Add the binding for the compatible list:
>   "mediatek,mt8188-efuse", "mediatek,mt8186-efuse"
> so mt8188 uses the same conversion.
> 
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> ---
>  Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> index 32b8c1eb4e80..70815a3329bf 100644
> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -39,6 +39,10 @@ properties:
>                - mediatek,mt8195-efuse
>                - mediatek,mt8516-efuse
>            - const: mediatek,efuse
> +      - items:
> +          - enum:
> +              - mediatek,mt8188-efuse
> +          - const: mediatek,mt8186-efuse

And this is not compatible with generic one? This is confusing. Why are
you adding generic fallbacks if they are not valid?

Best regards,
Krzysztof


