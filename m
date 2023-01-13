Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C058C67871
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 12:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9xVHcYsXrWDi0vGmkE9TGrGk9XSM3J6A32ZgmxGqsVk=; b=eid9/AZOZnEPxtHnAUebejRjMH
	yTSMr38QCXXDOkzJ+j/3t8KW5CRNwKnwczN6IvDiLQLvy+MA348NuU8jyQij7N9QNNH3DB9VkvFBA
	nvTgnYjmGLaTYeNUEsA5P61f0/qPfDXrT1Wj7IsFwWskn4O3O2rjhOwYAr3pFAWVqJMLnmeaZTsZm
	3o/kBMC0EmYlcGAOAEjft75mLf3pdkS5dt64vItxXlX8fGvAkWaKWkf7UYFqFJy1WSfd8M27a8cId
	VpdcRgV4nQoT0RY5RkdTxqRTz4c0SkjPqpYz7TDNb2GdqEr/Ve1ThXU3OM/J17De9Sv/CAAIX9G6Y
	uTFnEIUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGJQY-002bRo-QK; Fri, 13 Jan 2023 12:44:58 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGJQN-002bNM-H8; Fri, 13 Jan 2023 12:44:48 +0000
Received: from 8bytes.org (p200300c277327f0086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7732:7f00:86ad:4f9d:2505:dd0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id ED600262340;
	Fri, 13 Jan 2023 13:44:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1673613884;
	bh=MscDIF3GsS7zhLNLVm/WiZfXdK2GItkr1gCY7Yuq/gI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rPPebLs22xmYECIA08EQJNTrmdxY/5R/5bZCTMtoBcDNUjONEC2f+5UAg8dAZe75+
	 tqE8v/3rLs7mCO3KLHwvNGsPVWQBtuVvqPwY3CkNFofuCjIbjORA2kfOpk1F+SJqHS
	 vu74z7MbR0+vA3ZD6tOFAUFqsWrOHy3641EGSVcGnfOUn2ROmYiifTNyvZaaOZVeup
	 CHaSNd8Wxg0IAfMYSzJLIyNFFsgFkFpLl3vTxK06O5163O32q9h66/GXsfrk9ouli+
	 wblcy2rD81UzrGfIbXJ5pJIvmpHtRjWubRPBGt7+fMH6SD1A1suPCFFH1DEGwtb3oG
	 3OjlH5HQuawEA==
Date: Fri, 13 Jan 2023 13:44:42 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Honghui Zhang <honghui.zhang@mediatek.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Joerg Roedel <jroedel@suse.de>, iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] iommu/mediatek-v1: Fix an error handling path in
 mtk_iommu_v1_probe()
Message-ID: <Y8FSOqUqQpTa+zAU@8bytes.org>
References: <593e7b7d97c6e064b29716b091a9d4fd122241fb.1671473163.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <593e7b7d97c6e064b29716b091a9d4fd122241fb.1671473163.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_044447_740341_34159B97 
X-CRM114-Status: GOOD (  15.18  )
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

On Mon, Dec 19, 2022 at 07:06:22PM +0100, Christophe JAILLET wrote:
> Fixes: b17336c55d89 ("iommu/mediatek: add support for mtk iommu generation one HW")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Another option would be to use devm_clk_get_enabled(). This would save a
> few LoC in mtk_iommu_v1_hw_init() and in the remove function.
> However, it would change the order of function calls in the remove function
> so I leave it as-is.
> Let me know if it is fine and if you prefer this alternative.
> ---
>  drivers/iommu/mtk_iommu_v1.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

