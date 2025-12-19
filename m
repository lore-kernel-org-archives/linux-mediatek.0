Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67683D74961
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Dec 2025 07:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CM3bW0Xzw+7Hlpork1R44JLitJdkZ3PrusVl6PNgGtg=; b=eYa9NH4dmN8wxGNkcpVeKnlEeO
	GEBIQy3nLOkhww06+9lKTNi1e+O5gogAOMJ+12iMtGGerF5FEKmWWpYw/7DOoyuHvnFHSYuV32Nec
	m7W7/GrwSReoWmT3ziXQeQ91SWGGpJy6p1SgjdCDzheYuQwSdFvXJ7JYXkLEGz2AGD0CFRrR3Ft2W
	YkbcgS1lFTAhb1mFZueSFMw8Dtx7NkWOKW8UAZIxRU32ZTXTUWQZcJX+PlFhdZiehYEYxDweoweFZ
	hEzcOqNDDXZtxkQGz6AAo9dkqmzPrGaRWitJgmdnlsT12jwg8RcqOtO4eNNxophCY8qt25Y3gxbGY
	HHTlECJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWV2P-00000009lOz-04Hy;
	Fri, 19 Dec 2025 07:36:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWV2N-00000009lOS-2x8F;
	Fri, 19 Dec 2025 07:36:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8E6760008;
	Fri, 19 Dec 2025 07:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8AACC4CEF1;
	Fri, 19 Dec 2025 07:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766129790;
	bh=aCodlFFXHQBWaHWICD9txtmi5ow3KNr2Et6gGaYS0Fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SpBVSxT1nNM8br11CaoNIEktIFCoo1I0t1wbvowO5w1uBfxPKJR6YohzaXTdMn5FN
	 dm5ARDtTuLIZLHvdHRjEjbEzABBm99J8rjNn/Rs8aoh4aFh4kNgsBSPA3akHdWZtuY
	 nY8TtyqnaSyRHkZ9dxrvqlAZDBuh4uCFSuwYspkCpOn/lTCEMvBdFKRDhzS8c5lTIj
	 DTdhFRpgXZlemZqxLF8DkvUJX+dQsApoBBST1n3yhx49vQE7+K/qgdbG+BwZSmjZIX
	 y9SBFwwn34HyJFm55RdVVkHZSqMNZc4MTZUVt7d/HOZEB5R/qxSCy9Nq946cuM3Cq5
	 J35Lf7byM5s4w==
Date: Fri, 19 Dec 2025 08:36:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Richard Cochran <richardcochran@gmail.com>, Qiqi Wang <qiqi.wang@mediatek.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
	netdev@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Subject: Re: [PATCH v4 02/21] dt-bindings: power: mediatek: Add MT8189 power
 domain definitions
Message-ID: <20251219-hissing-chicken-of-poetry-5fbfd9@quoll>
References: <20251215034944.2973003-1-irving-ch.lin@mediatek.com>
 <20251215034944.2973003-3-irving-ch.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251215034944.2973003-3-irving-ch.lin@mediatek.com>
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

On Mon, Dec 15, 2025 at 11:49:11AM +0800, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
> 
> Add device tree bindings for the power domains of MediaTek MT8189 SoC.
> 
> Signed-off-by: Irving-CH Lin <irving-ch.lin@mediatek.com>
> ---
>  .../power/mediatek,power-controller.yaml      |  1 +
>  .../dt-bindings/power/mediatek,mt8189-power.h | 38 +++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 include/dt-bindings/power/mediatek,mt8189-power.h

You did not cc maintainer of the binding, so either it's fake entry or
you forgot to use tools.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about 'b4 prep --auto-to-cc' if you added new
patches to the patchset.

Best regards,
Krzysztof


