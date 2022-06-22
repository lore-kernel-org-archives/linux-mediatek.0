Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0EFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 13:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zp1toas8eTjSbHHJrOLspMUG/kb5ZckkR1IYJOyJPDU=; b=zeeNbFlnJz6nKJVR0Wi24urz6V
	ew6HdrVF+PevAJpZa6s0dA59m3ymmtsf5QKGsbuIRpRjf1cqu5OPHGQvy6wTZK0ee7fGaNbVLeUz5
	yAEPYnduY5p9XYD0Caz16i3gueUDIomM2zYZakoPPQ+CNrUPobi6VzU5f0wxBHk5Hi7i0wWGMz9AD
	gEIFjznn962rp2z+HcOkGAmFFYuzB8cxnQeumZog7nOosAkkSRMAB0wKCnw94JYazmmrjBKjlp5iP
	SVrMWAwW6sa0nUy/L00WyysoVFYr3mdB35iKzeYYZ3I9QmORazOTQutpC4M4Vb+HVvq2InbiKfSCT
	wFV3m4cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o40fj-00AgLe-H9; Wed, 22 Jun 2022 13:45:31 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889] helo=theia.8bytes.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o40fD-00Ag48-Ad; Wed, 22 Jun 2022 13:45:00 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 8C22F2D0; Wed, 22 Jun 2022 15:44:57 +0200 (CEST)
Date: Wed, 22 Jun 2022 15:44:56 +0200
From: Joerg Roedel <joro@8bytes.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: yong.wu@mediatek.com, will@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	iommu@lists.linux-foundation.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org, miles.chen@mediatek.com
Subject: Re: [PATCH v4 0/5] mtk_iommu: Specify phandles to infracfg and
 pericfg
Message-ID: <YrMc2EUBDIxnoWiB@8bytes.org>
References: <20220616110830.26037-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616110830.26037-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_064459_556796_C37A3480 
X-CRM114-Status: UNSURE (   8.05  )
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

On Thu, Jun 16, 2022 at 01:08:25PM +0200, AngeloGioacchino Del Regno wrote:
> AngeloGioacchino Del Regno (5):
>   dt-bindings: iommu: mediatek: Add mediatek,infracfg phandle
>   iommu/mediatek: Lookup phandle to retrieve syscon to infracfg
>   arm64: dts: mediatek: mt8173: Add mediatek,infracfg phandle for IOMMU
>   arm64: dts: mediatek: mt2712e: Add mediatek,infracfg phandle for IOMMU
>   iommu/mediatek: Cleanup pericfg lookup flow
> 
>  .../bindings/iommu/mediatek,iommu.yaml        | 17 +++++++
>  arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |  2 +
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  1 +
>  drivers/iommu/mtk_iommu.c                     | 50 +++++++++++--------
>  4 files changed, 49 insertions(+), 21 deletions(-)

Applied, thanks.

