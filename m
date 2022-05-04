Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D63DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 08:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3T6KbLkLaEKEA915f8bGS2KBqKEZ4HsRVOlK5wUNpl8=; b=vXaAl8Z76SaJsF
	hIncDwKSztY6J94McFuFqJRfG8+Hty8mPJkWIBxiLCtFNqBNfV9Dkp58zj3x2vwGbJOdecehmZvsV
	8ca2yII7x+RRgUdwqePOodmdTMCnYw5DE1N9GcBXah0AkUYJDgn9Ub32BMTgwpyTQLAUH9AKzvBkO
	bgZ4IyEIdCnlgpUfeq/wEh6+DpwKNmIDJ6jifrU9/h2rDwvXHctLKlYnTmt5yQvGw26rVLku6lHYc
	BV2Ud7fbLXN/04oRQFKkrsTK6BQEkvRnulyfPI2Um9OkwSwhZrZiitGZInM3caURGGrf3eaxewxpP
	AuJLiIws8lfU+pmDnXMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmAZ2-009cAi-Nt; Wed, 04 May 2022 08:40:52 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmAYR-009bw5-JN; Wed, 04 May 2022 08:40:18 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C65FF7EE; Wed,  4 May 2022 10:40:08 +0200 (CEST)
Date: Wed, 4 May 2022 10:40:07 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 yen-chang.chen@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com,
 libo.kang@mediatek.com, chengci.xu@mediatek.com
Subject: Re: [PATCH v7 00/36] MT8195 and MT8186 IOMMU SUPPORT
Message-ID: <YnI751zEqTjrVuuz@8bytes.org>
References: <20220503071427.2285-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220503071427.2285-1-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_014015_865953_8870AAB3 
X-CRM114-Status: GOOD (  13.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, May 03, 2022 at 03:13:51PM +0800, Yong Wu wrote:
> Yong Wu (36):
>   dt-bindings: mediatek: mt8195: Add binding for MM IOMMU
>   dt-bindings: mediatek: mt8195: Add binding for infra IOMMU
>   dt-bindings: mediatek: mt8186: Add binding for MM iommu
>   iommu/mediatek: Fix 2 HW sharing pgtable issue
>   iommu/mediatek: Add list_del in mtk_iommu_remove
>   iommu/mediatek: Remove clk_disable in mtk_iommu_remove
>   iommu/mediatek: Add mutex for m4u_group and m4u_dom in data
>   iommu/mediatek: Add mutex for data in the mtk_iommu_domain
>   iommu/mediatek: Adapt sharing and non-sharing pgtable case
>   iommu/mediatek: Add 12G~16G support for multi domains
>   iommu/mediatek: Add a flag DCM_DISABLE
>   iommu/mediatek: Add a flag STD_AXI_MODE
>   iommu/mediatek: Remove the granule in the tlb flush
>   iommu/mediatek: Always enable output PA over 32bits in isr
>   iommu/mediatek: Add SUB_COMMON_3BITS flag
>   iommu/mediatek: Add IOMMU_TYPE flag
>   iommu/mediatek: Contain MM IOMMU flow with the MM TYPE
>   iommu/mediatek: Adjust device link when it is sub-common
>   iommu/mediatek: Allow IOMMU_DOMAIN_UNMANAGED for PCIe VFIO
>   iommu/mediatek: Add a PM_CLK_AO flag for infra iommu
>   iommu/mediatek: Add infra iommu support
>   iommu/mediatek: Add PCIe support
>   iommu/mediatek: Add mt8195 support
>   iommu/mediatek: Only adjust code about register base
>   iommu/mediatek: Just move code position in hw_init
>   iommu/mediatek: Separate mtk_iommu_data for v1 and v2
>   iommu/mediatek: Remove mtk_iommu.h
>   iommu/mediatek-v1: Just rename mtk_iommu to mtk_iommu_v1
>   iommu/mediatek: Add mtk_iommu_bank_data structure
>   iommu/mediatek: Initialise bank HW for each a bank
>   iommu/mediatek: Change the domid to iova_region_id
>   iommu/mediatek: Get the proper bankid for multi banks
>   iommu/mediatek: Initialise/Remove for multi bank dev
>   iommu/mediatek: Backup/restore regsiters for multi banks
>   iommu/mediatek: mt8195: Enable multi banks for infra iommu
>   iommu/mediatek: Add mt8186 iommu support

Applied, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
