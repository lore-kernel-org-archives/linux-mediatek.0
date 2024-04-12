Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C43C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 10:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wmC5fwdfiy0pBEla5IBcemtSe0nfd/AXm5q1WRioK1I=; b=GlWwRYbWPFMxbID/dPncJ3ItPG
	nlOrW3Z02mjRLkZ6xnjTJN7J/lxdVi+MsAPrFfxIYEss51XbsZhPhdSNeXeWFHLWzD5fsXwqG/zq0
	bi1ViM6UCcfAhw3Pt8pg3PIEQEz5H9UcqQiduZxW5DIB8/hudwJJOnpIySMDtAgkXFpNR5LwH1mw2
	Kbqzs25crRb/hTDhURBb8K2/Woo5h15NiT0nGVA7SdXxcEIQF/FunMOx6lViwgTO1jNVUupXcCpen
	4zdwqzW03wLjsjsKHUHhHdHfleEKrKZNylJaF478o5V5XXB+hemG0ZWQk80JAe5nv384GMSUn/vJb
	uPdLg6RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDmc-0000000GZmg-0rqN;
	Fri, 12 Apr 2024 10:05:22 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDmT-0000000GZiJ-0uMq;
	Fri, 12 Apr 2024 10:05:19 +0000
Received: from 8bytes.org (p4ffe0bdf.dip0.t-ipconnect.de [79.254.11.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E632B281A38;
	Fri, 12 Apr 2024 12:05:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1712916308;
	bh=cnwn92O/aPD8VcGrVVyUI2Ec0rIsBja+Z57i++X8koc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ic/stN0y2+5Xrx0L17IZc3CGfAvF5YONhO/Wi2KQgna8jhEm38FzziU/YUKg+d4qu
	 3XQHBV0FSZDR1ieSDOnA+gUG2vXlE0mxrbYcmwB8XE5jnIRaaAyUUKv4INTZDFLRjg
	 zVr7+UeeWSzO9A1EIT1nV6CeAHm7XGO29yI/Ynj1Ll2snh21wYYuSyuZk00kv2nomS
	 gbZSPB06UHAOTxkEOBdtrIv1x0K0nIuR+u2KpVOJGM/7j06JgjEbq9skkM2ufK/rOC
	 J1NM9kGxBrpEP/8jOJD0tAUW1X4VbsiIjlZFA/++epaTdxBqCsvqyjeuHB959u2tP0
	 4G2r5MKjyI/NQ==
Date: Fri, 12 Apr 2024 12:05:06 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] iommu: mtk: fix module autoloading
Message-ID: <ZhkHUnXcGxbiqSFz@8bytes.org>
References: <20240410164109.233308-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240410164109.233308-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_030513_491344_48633A5B 
X-CRM114-Status: UNSURE (   8.94  )
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

On Wed, Apr 10, 2024 at 06:41:09PM +0200, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/iommu/mtk_iommu.c    | 1 +
>  drivers/iommu/mtk_iommu_v1.c | 1 +
>  2 files changed, 2 insertions(+)

Applied, thanks.

