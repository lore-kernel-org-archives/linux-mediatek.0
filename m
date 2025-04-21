Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876CBC369D3
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Apr 2025 21:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuR57SLAInKxuzj5Jea/lasnCVNh6qfQg4ec2su7EHc=; b=IGAaSNSN8bYA2zjR6+lKY188ve
	V1we/APRl+TPRmabmGif6Ls5Xdn7z9lol0mUqWvS5wBupNIqArU+7RnXFal5irwZ0FAOfKrVAbWHY
	+/b5TVxzqyFsGC0wvATZkkzFY7L6bwG8wcWICeccVL7fFl6JNPqU2/umEPBjaH2s3kvcnqAutwzVi
	IrP+ZhnQM4G15TYBnGvcYgwhdpNbm+thvcfgbcKcmu0s2x5Ayy6hcm6waJQ1nn7NEPNeovhDNQdnr
	83AYSa05FwP6twYKJqgmkctYkyA5TNoLNJDtIAULCGjYtPSzSz09iFV5oXbYejKYkBcwUA7LcKaTV
	qxaE/CaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6yrd-00000005CLw-2Dwt;
	Mon, 21 Apr 2025 21:39:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ylr-00000005BeS-355P;
	Mon, 21 Apr 2025 21:33:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CE860A439C5;
	Mon, 21 Apr 2025 21:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763DCC4CEE4;
	Mon, 21 Apr 2025 21:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745271222;
	bh=eWQGFVOb67pwuM4hIzwD8j+qtic7xt7xLG1iErnbV80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WCAjD2ygtiAME3dvLC9OERSMi0Jt62PUQw+UiYuJddJJm6p+wa4wPNvpuRw27UNoO
	 Z8fZ9QIXyDDiPidkqjeojtNyWk4/9+KjqCyhv/aHdrQ2jK6rxU36sw4bBi/pktY+aC
	 bhnC/nG5sVxPjb2es8OJ8f4RHx/4aAGx0VrTnni9XL5AtXKuCOsMlH7DyRMu9jP1ik
	 K9YjZV6qTqXH5Bd2qDyAVObzFiDY73aid1Zy5LxMqHMKcosGoRAehEYLmKkt9gH8Tj
	 87Gf818rys1vlW2TimPTSq7NDn2KmRXsFPQFzR6/SpmXbq2o1u1PQ+G6Y0+TWNR4fx
	 pV6fyLI7mADAA==
Date: Mon, 21 Apr 2025 16:33:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lee@kernel.org, mandyjh.liu@mediatek.com, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	kernel@collabora.com, krzk+dt@kernel.org, matthias.bgg@gmail.com
Subject: Re: [PATCH] dt-bindings: mfd: mediatek,mt8195-scpsys: Add support
 for MT6893
Message-ID: <174527122027.2966032.17419699387190944980.robh@kernel.org>
References: <20250416120225.147826-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120225.147826-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_143343_835064_174D0068 
X-CRM114-Status: UNSURE (   8.78  )
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


On Wed, 16 Apr 2025 14:02:25 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the scpsys block found in the MediaTek
> Dimensity 1200 (MT6893) SoC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


