Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD29C369D7
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 07:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRYO+1cSR2M0s6/cKBOKnQkL2D/iZZP2TEbPD+H1eoQ=; b=v+u+rBG0z/tna2L1zbPnrnVzVT
	3os41c25iVaJIgqJJzAuq+LWzTrBYHdMn+HdIk1EG2CbccnmvN0aGJ57ipjRlJqy4swExJCpTuC8v
	jMNev9mCJVQYHeKAwwAxvoxxiJjjHDRdMsI41nnekxsFB7yqg+QrDP3dwopaTGl/j0JeqDOag+DFZ
	gXYl/00/w9rAT+8aoirhvjZOxQmcMsf7ttb3jnDd9bR9UY9zCVYxEzz75VH7JCT46fx8UByg+d/8U
	0nXh+9L6NUhNm02oyxLopDgWDMZcxjbW/fVFYGEQlziVwlAa6+g4EmtojyJKoMXjRVcw+z9FBKQY6
	IOHj9xZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qhK-0000000D5lc-3Rrl;
	Thu, 24 Apr 2025 07:08:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7qHW-0000000D2KW-41l9;
	Thu, 24 Apr 2025 06:42:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD1C5449AB;
	Thu, 24 Apr 2025 06:41:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E344C4CEE3;
	Thu, 24 Apr 2025 06:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745476918;
	bh=M+nFHMzEVi+QVGMGUalVB1g9i8u6j31DvTqyfMj/nZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=glGhtIHxFk/2r+VTB0xJFT4DLQovRwqbnEKJJ92e3nGBYsoINW1bT6kHDV/tdy9Nj
	 2DqM0oVa8gmje7rIHU80vw7Bd+SLjzDIZNziRR127GQoBxyaM8k6ijIJay8vINFh//
	 IYPsRJBgLhLOL2u93AdfpSfLwfojpdGpGnjM1CaTXptDRCmvJLVsX9z3aE36Bk7d9a
	 GMRIHoIQlndwOdf9TRW6KYvEz0IwoV/076tOtoNdWF9bjZjQXbGwJZy6HquV9ooEm9
	 pFRdoB+ddQTRlTkrd0zcGElbP1YxgMBf11W5XqiWz2vFAHM62j0q/mmja99G0gfhWg
	 /Gv70M5zcytzA==
Date: Thu, 24 Apr 2025 08:41:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v4 3/8] dt-bindings: phy: mtk-xs-phy: Add mt7988
 compatible
Message-ID: <20250424-muscular-ginger-hog-3047f6@kuoka>
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250422132438.15735-4-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_234159_032658_0E083461 
X-CRM114-Status: UNSURE (   8.40  )
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>, Daniel Golle <daniel@makrotopia.org>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Apr 22, 2025 at 03:24:26PM GMT, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible for xs-phy on mt7988.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


