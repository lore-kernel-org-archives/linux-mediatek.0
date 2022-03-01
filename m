Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5974CC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 07:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=et/z8MPp+NmGpqtg/VKfComTizG4ZKTtFGB9I9Pylac=; b=4JAS7hMPGEGg98
	wmDwTOs4+jndL7kpX5cbMexm/KiKTGGoJ2Yx4A5ZqWTbZTrMmAEr9/MtgQ9fT9z9/jLpZLbP0vJKF
	8VRZ9vGzKzW9OoVq1Pah1njF5c8Yyx68NC1b+JHM5xemOHZIO5bA0wC6jbTKQdCVIUB8JJlgDWsj7
	r7wIt4+rO2MK8qh3O/ldxqo1vyeigbwR5nAPfcG/GxjzROAc20Qgn8E2fP4DmwRZFUjypXJo85fOi
	diLq9e98D0C4zdzsNcdy8I43pVL5ALdNy2xVxVroQPurnpQERkCtHKUNgftrITpBMiCn1Loqvv7wb
	DUdf+niKJzfwuxHy7vhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOxPv-00FSBM-Hz; Tue, 01 Mar 2022 07:59:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOxPr-00FS80-QG; Tue, 01 Mar 2022 07:59:30 +0000
X-UUID: f7da43e8669c4a51ac888dc852e959f4-20220301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QVbBstTPqSDXTGrBdzu3F8uCBO0iL6wmU2T7xqQhLZs=; 
 b=aMM3hyTvsCUoJGnDIhyrkK129sITejPX0dVb3dpDgnoWnVCQOHsSu8BDeAhmZsqY2W125zmtOIJUq+LxZrP2uEgP+OonM1N/chOeCu7u8cd47NYVDE9OFb8xX1sXcar5ajSbNTkpFAJRY02T2vULJiCti20ecCG0/TaD00rpr1s=;
X-UUID: f7da43e8669c4a51ac888dc852e959f4-20220301
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1948928062; Tue, 01 Mar 2022 00:59:23 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Feb 2022 23:49:21 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 1 Mar 2022 15:49:20 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Mar 2022 15:49:18 +0800
Message-ID: <5ed9278fa0b72b993512cff2316218ab88cafe50.camel@mediatek.com>
Subject: Re: [PATCH v5 00/34] MT8195 IOMMU SUPPORT
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, <youlin.pei@mediatek.com>,
 <anan.sun@mediatek.com>, <xueqi.zhang@mediatek.com>,
 <yen-chang.chen@mediatek.com>, <mingyuan.ma@mediatek.com>,
 <yf.wang@mediatek.com>, <libo.kang@mediatek.com>, <chengci.xu@mediatek.com>
Date: Tue, 1 Mar 2022 15:49:18 +0800
In-Reply-To: <7ba0ee87-c193-9834-d0b4-ff3e06ced82b@collabora.com>
References: <20220217113453.13658-1-yong.wu@mediatek.com>
 <YhzBSsn/zUlGg5JE@8bytes.org>
 <7ba0ee87-c193-9834-d0b4-ff3e06ced82b@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_235927_901809_ED95DE08 
X-CRM114-Status: GOOD (  23.00  )
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

On Mon, 2022-02-28 at 14:50 +0100, AngeloGioacchino Del Regno wrote:
> Il 28/02/22 13:34, Joerg Roedel ha scritto:
> > Hi Yong Wu,
> > 
> > On Thu, Feb 17, 2022 at 07:34:19PM +0800, Yong Wu wrote:
> > > Yong Wu (34):
> > >    dt-bindings: mediatek: mt8195: Add binding for MM IOMMU
> > >    dt-bindings: mediatek: mt8195: Add binding for infra IOMMU
> > >    iommu/mediatek: Fix 2 HW sharing pgtable issue
> > >    iommu/mediatek: Add list_del in mtk_iommu_remove
> > >    iommu/mediatek: Remove clk_disable in mtk_iommu_remove
> > >    iommu/mediatek: Add mutex for m4u_group and m4u_dom in data
> > >    iommu/mediatek: Add mutex for data in the mtk_iommu_domain
> > >    iommu/mediatek: Adapt sharing and non-sharing pgtable case
> > >    iommu/mediatek: Add 12G~16G support for multi domains
> > >    iommu/mediatek: Add a flag DCM_DISABLE
> > >    iommu/mediatek: Add a flag NON_STD_AXI
> > >    iommu/mediatek: Remove the granule in the tlb flush
> > >    iommu/mediatek: Always enable output PA over 32bits in isr
> > >    iommu/mediatek: Add SUB_COMMON_3BITS flag
> > >    iommu/mediatek: Add IOMMU_TYPE flag
> > >    iommu/mediatek: Contain MM IOMMU flow with the MM TYPE
> > >    iommu/mediatek: Adjust device link when it is sub-common
> > >    iommu/mediatek: Allow IOMMU_DOMAIN_UNMANAGED for PCIe VFIO
> > >    iommu/mediatek: Add a PM_CLK_AO flag for infra iommu
> > >    iommu/mediatek: Add infra iommu support
> > >    iommu/mediatek: Add PCIe support
> > >    iommu/mediatek: Add mt8195 support
> > >    iommu/mediatek: Only adjust code about register base
> > >    iommu/mediatek: Just move code position in hw_init
> > >    iommu/mediatek: Separate mtk_iommu_data for v1 and v2
> > >    iommu/mediatek: Remove mtk_iommu.h
> > >    iommu/mediatek-v1: Just rename mtk_iommu to mtk_iommu_v1
> > >    iommu/mediatek: Add mtk_iommu_bank_data structure
> > >    iommu/mediatek: Initialise bank HW for each a bank
> > >    iommu/mediatek: Change the domid to iova_region_id
> > >    iommu/mediatek: Get the proper bankid for multi banks
> > >    iommu/mediatek: Initialise/Remove for multi bank dev
> > >    iommu/mediatek: Backup/restore regsiters for multi banks
> > >    iommu/mediatek: mt8195: Enable multi banks for infra iommu
> > 
> > This doesn't apply cleanly, can you please send a version rebased
> > to
> > v5.17-rc4?

As in the cover letter, this patchset doesn't base on v5.17-rc4, it
bases on next-20220216 which has contained [1] and Dafna's patchset
below.

By the way, It still conflicts with the latest next-20220228 which has
just contained[2].

In this case, How should I do? Send a version base on the latest next?

[1] 
https://lore.kernel.org/linux-iommu/20220117070510.17642-1-yong.wu@mediatek.com/

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/?h=next-20220228&qt=grep&q=component_compare

Thanks.

> > 
> > Thanks,
> > 
> > 	Joerg
> 
> Hello Joerg,
> 
> this series depends on the following series:
> 
https://patchwork.kernel.org/project/linux-mediatek/list/?series=592275
> 
> ...which is also well tested and ready to be merged in.
> 
> Applying Yong's series without the mentioned series from Dafna would
> not work.

Yes. Thanks.

> 
> 
> Thanks,
> Angelo
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
