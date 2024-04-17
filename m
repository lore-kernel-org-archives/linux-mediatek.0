Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76B8C04FF9
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 18:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iANwQ5usPikHjy5J9Akmp81GJjWfBeOtPjd/27BA3PE=; b=O5/IDViN69Ps7nE+4FOMmfqsq9
	KCo2O+GouN5mhj7NVEfILs97hgB/3bTT1mH7DX7HtVVpp6HGK4vG4AgulUJ3jowUGPLYKEw3DyQPF
	dhftPp/d+lY6C7Gn1D4IL2mO8l5WsNrXRvdw9Gwn9aLEwIEmpVpqNv2y6Bjk1SHO5vXDit7GlOi8u
	3/c+dakEhpx0TkstFkVLVeKTi/THtXrRxL/HfkzqLsj7rFAT/Qtnn7kj+QG7xLUArT4gCwloK7rSl
	987YpLmpgyF+sTWRYOqB//0TmuEutEl2K1uiwbG4REZEveNltu+97t8p/3dqzJN05cNpkjOaXSijM
	R5l/kpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAFX-0000000HE6y-0xYX;
	Wed, 17 Apr 2024 18:43:15 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxAFS-0000000HE6B-42Jv;
	Wed, 17 Apr 2024 18:43:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1982ECE1478;
	Wed, 17 Apr 2024 18:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D83C072AA;
	Wed, 17 Apr 2024 18:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713379388;
	bh=U0liresN6pKXHe9eKATPDUeQXUBQNGAGywFu8BJYKr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hdeHnHu5sNTo+q5ZUU2sw0JiYLeNIDlaZrgw4qZYb8vIUm1o9T8K2MWN8G2BY6UIy
	 Xzeu+15mlMk2tqBRHBvt8SippFORLXhC/TEBo2W5DI28mBu0URNoJwtJrZYG5H/Jbq
	 1vMA7uoIn1ePHDBDad8sk+ULPXT+rdi0kPXNxDXdIn3pECBvg1h8nR++Ss62z7Rh0E
	 n2HYoH4ddR0Ib4DvPiY6thyvWW4jFBL4vCKRR2nqzh/HyMcd2t7HWcR9keFNmNTWwC
	 sOfguIQC3WIHjAm8o6izrxZCKBupP9jTgzsIvSIa7EvfZu3Fotkl8Rg+vuXwXZEuZi
	 Q0GrC71bMgRgA==
Date: Wed, 17 Apr 2024 13:43:05 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: David Airlie <airlied@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	Daniel Vetter <daniel@ffwll.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, linux-pwm@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	devicetree@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-clk@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 01/18] dt-bindings: display: mediatek: aal: add
 compatible for MT8365 SoC
Message-ID: <171337923835.3070962.10313309897836151730.robh@kernel.org>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-1-33ce8864b227@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023-display-support-v2-1-33ce8864b227@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_114311_219149_05178589 
X-CRM114-Status: GOOD (  10.25  )
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


On Tue, 16 Apr 2024 17:53:02 +0200, Alexandre Mergnat wrote:
> Document the display Adaptive Ambient Light on MT8365, which is compatible
> with that of the MT8183.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


