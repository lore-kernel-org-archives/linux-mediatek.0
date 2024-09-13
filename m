Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AC7FA3750
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 19:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4aNUanB+B0O3PfYIQsaIlEEj6pvli2/yNsnvrdk2G+Y=; b=mM/80XIWMVweSfIT5G/E9If0S/
	qTWBs/6OEPkuKQk5hhynuhaJRL/AKozvIYF/EFmP3tpUx/sF8PHlmRLP/swc3ORbb5avLIMvB2lU/
	XTU4NTXqM+mr9QF9HleAfzH/FfimzSwfZUfoVncj5vXi2qQnbobKrOoDHaK/gBGhEcD2lkLLR+Y0/
	eJIoSvKdGw2QYqEor4X2NDBuYJR9pXsKdWlBVdtaecO9gd0zJf8GswkTId6v3uMXwJmBIbJSYNtyL
	TnvO1Sdgc446AOn+GHD/Qg/BBz1hlJR8G61B7xKBAeuQDTJdMmK0GR3/vMICVbPWHSetNSQqdC8UW
	UOq3xLyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spCP1-0000000GzAD-0GpK;
	Fri, 13 Sep 2024 19:56:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spCNv-0000000Gz0M-1NbP;
	Fri, 13 Sep 2024 19:55:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D90495C5B18;
	Fri, 13 Sep 2024 19:55:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D15C4CEC7;
	Fri, 13 Sep 2024 19:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726257314;
	bh=0pptzHNsve6nRG0iI/Yy3BO7ZIXTXQFwTPNQzNE/ojA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oEPRwGYaY5gURAduPfJhCaTmFvsWW7L7Na1ih+OfH6R+IPEDbgjkYdl4oO0G9doSk
	 hcLzAOXt70vogKidE841p5kxzaXm1oxWyMff1pc6PSl0zHokAsfA5CUgXaJgsWTIaJ
	 anqWwz0R2xXF2gvOtPAuK+QMBljQLYyb3zQx/PDFqVIFWy7F9gJCuCbUmTKIpwiU2r
	 VLf28av+ZuCEPzNPVgNHjsKKtfV82JN+OfdVIOKXj2LNXnMGwY+hSdKYBiPgrhyhMA
	 ARM2StltMHvAr6iP8c0IevXOOxzFuhi7Zho+QKiC1MrPPl/EZHBR/8/sGUl0nbBZNS
	 v4klyfi5kMLqg==
Date: Fri, 13 Sep 2024 14:55:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH] dt-bindings: clock: mediatek: Drop duplicate
 mediatek,mt6795-sys-clock.yaml
Message-ID: <172625731189.514249.780064376530933894.robh@kernel.org>
References: <20240910234238.1028422-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910234238.1028422-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_125515_458398_511CDBF8 
X-CRM114-Status: GOOD (  10.45  )
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


On Tue, 10 Sep 2024 18:42:37 -0500, Rob Herring (Arm) wrote:
> The compatible strings for mt6795 clocks are also documented in other
> schemas:
> 
> "mediatek,mt6795-apmixedsys" in clock/mediatek,apmixedsys.yaml
> "mediatek,mt6795-topckgen" in clock/mediatek,topckgen.yaml
> "mediatek,mt6795-pericfg" in clock/mediatek,pericfg.yaml
> "mediatek,mt6795-infracfg" in clock/mediatek,infracfg.yaml
> 
> The only difference is #reset-cells is not allowed in some of these,
> but that aligns with actual users in .dts files.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../clock/mediatek,mt6795-sys-clock.yaml      | 54 -------------------
>  1 file changed, 54 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt6795-sys-clock.yaml
> 

Applied, thanks!


