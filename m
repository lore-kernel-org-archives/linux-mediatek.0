Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFA14C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 12:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w9455R+Q2YaHojPGgTqaT/xfTHHmxumDMqcdKHbtKhE=; b=TnPliBW+3GZYnq
	jCfkrjYyQWKBTpWqzaRRHaX7JpvcqqkevJ8hYF00tFtCkmzqQp3jOCK1y3UdQoObdhv4lMDFnkbcN
	83YR8DD0DRHOUvMelcb0ixHqGex5j2gjrPAh7r+Dgy1JjR4iOmCqQ3RF3vKyI4sMg/QH8nXygM0vD
	EQSuIkPwKLoa7vGxB3G5vZqxbfn3DHxhz60qCkQkzvYKlCXeS5uvScLsH7PPQWlRoZNnAqSOMWzZn
	so6Au+Y2tDgq/k4RzVFonYLiIa+yfm21SBulfGPpVfhlZqGlewyF4p3N47CDS6u5f6MuUKjhcVwKf
	ROk0S9bUmVxF6Pb+jCnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOfTd-00CL1A-NW; Mon, 28 Feb 2022 12:50:09 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOfEL-00CExV-3U; Mon, 28 Feb 2022 12:34:23 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 56FDE4B0; Mon, 28 Feb 2022 13:34:19 +0100 (CET)
Date: Mon, 28 Feb 2022 13:34:18 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 yen-chang.chen@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com,
 libo.kang@mediatek.com, chengci.xu@mediatek.com
Subject: Re: [PATCH v5 00/34] MT8195 IOMMU SUPPORT
Message-ID: <YhzBSsn/zUlGg5JE@8bytes.org>
References: <20220217113453.13658-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220217113453.13658-1-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_043421_335132_78B9278E 
X-CRM114-Status: GOOD (  13.18  )
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

Hi Yong Wu,

On Thu, Feb 17, 2022 at 07:34:19PM +0800, Yong Wu wrote:
> Yong Wu (34):
>   dt-bindings: mediatek: mt8195: Add binding for MM IOMMU
>   dt-bindings: mediatek: mt8195: Add binding for infra IOMMU
>   iommu/mediatek: Fix 2 HW sharing pgtable issue
>   iommu/mediatek: Add list_del in mtk_iommu_remove
>   iommu/mediatek: Remove clk_disable in mtk_iommu_remove
>   iommu/mediatek: Add mutex for m4u_group and m4u_dom in data
>   iommu/mediatek: Add mutex for data in the mtk_iommu_domain
>   iommu/mediatek: Adapt sharing and non-sharing pgtable case
>   iommu/mediatek: Add 12G~16G support for multi domains
>   iommu/mediatek: Add a flag DCM_DISABLE
>   iommu/mediatek: Add a flag NON_STD_AXI
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

This doesn't apply cleanly, can you please send a version rebased to
v5.17-rc4?

Thanks,

	Joerg

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
