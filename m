Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC631C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 06:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4gPPxTlxB3ZC1AdLf130whVqbSgFtqrc2AGzdktLnk=; b=IftIYM11275bJc
	UnLBwSY36xMmIoOcHU7tCI9XvcyGwk5ugsDNcw+ANYY7DGuUaZ0DQF0/7Dqw8gCScmOZSKtcm95AC
	cKjIavfeI+FJhI/mBFiuFAkcFh8/sZt4G0UAGYyGsglUUSrxvI7ZOqRMQbvL+rmJaf114rvoi/oiS
	dnntlKZsE/3qL7KWepK43I60tOR92BZ8D1yvCJfCHt+USo/aTZA0fikynJt0GZJ9CRs/wOF/fmBNS
	4Zs92ZOKG93jB1srH4ACOPjUh2pH/mtcctcXoeVdccb5O5fhz9M7DA4/8pdOtDsBvkThdYjU+IFt3
	oiRe4bIxZ7WfYTC4dUxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nweKA-001jrp-AM; Thu, 02 Jun 2022 06:28:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nweK1-001jo7-K9; Thu, 02 Jun 2022 06:28:43 +0000
X-UUID: a3ce854a22b44fc694ab51572af48fa4-20220601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=0q1svj9DHTmpZP30d0ZymMQkjVFndK5JFAstym71BZw=;
	b=oZl3VtHDNi7zoNNjvWsNYHbhZcaR6juNos4c3+Cv+cOI43x1b0BgcP7w8lHU6PWWcUgWwOrqiB40mPRG0EQ+6ZEa72OmHFp4x9zV+JOGlR7X23DurA26Wa08S79qG9HYismZyW8O1SLOMLs/MEgSvoiH6tU7xj24Q0tiNkHk1nE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:c24026da-fb54-418c-b229-6bd31b9f27f8,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:50d0920d-3a0d-4bbe-9d72-0e5d26d57423,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: a3ce854a22b44fc694ab51572af48fa4-20220601
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 265267355; Wed, 01 Jun 2022 23:28:33 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 23:18:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 2 Jun 2022 14:18:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 2 Jun 2022 14:18:29 +0800
Message-ID: <e970f47d462b0cca9bc6107843721b6b0aabd73a.camel@mediatek.com>
Subject: Re: [PATCH 2/3] iommu: mtk_iommu: add support for 6-bit encoded
 port IDs
From: Yong Wu <yong.wu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>
CC: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <iommu@lists.linux-foundation.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Date: Thu, 2 Jun 2022 14:18:29 +0800
In-Reply-To: <20220530180328.845692-2-fparent@baylibre.com>
References: <20220530180328.845692-1-fparent@baylibre.com>
	 <20220530180328.845692-2-fparent@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_232841_717918_27B22B12 
X-CRM114-Status: GOOD (  24.08  )
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

Hi Fabien,

Thanks for very much for this patch.

Retitle to iommu/mediatek: Xxx

On Mon, 2022-05-30 at 20:03 +0200, Fabien Parent wrote:
> Until now the port ID was always encoded as a 5-bit data. On MT8365,
> the port ID is encoded as a 6-bit data. This requires to rework the
> macros F_MMU_INT_ID_LARB_ID, and F_MMU_INT_ID_PORT_ID in order
> to support 5-bit and 6-bit encoded port IDs.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/iommu/mtk_iommu.c | 17 +++++++++++++----
>  drivers/iommu/mtk_iommu.h |  1 +
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 6fd75a60abd6..b692347d8d56 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -103,8 +103,10 @@
>  #define REG_MMU1_INT_ID				0x154
>  #define F_MMU_INT_ID_COMM_ID(a)			(((a) >> 9) &
> 0x7)
>  #define F_MMU_INT_ID_SUB_COMM_ID(a)		(((a) >> 7) & 0x3)
> -#define F_MMU_INT_ID_LARB_ID(a)			(((a) >> 7) &
> 0x7)
> -#define F_MMU_INT_ID_PORT_ID(a)			(((a) >> 2) &
> 0x1f)
> +#define F_MMU_INT_ID_LARB_ID(a, port_width)	\
> +				((a) >> ((port_width + 2) & 0x7))
> +#define F_MMU_INT_ID_PORT_ID(a, port_width)	\
> +				(((a) >> 2) & GENMASK(port_width - 1,
> 0))

Add () for port_width.

>  
>  #define MTK_PROTECT_PA_ALIGN			256
>  
> @@ -291,12 +293,13 @@ static irqreturn_t mtk_iommu_isr(int irq, void
> *dev_id)
>  		fault_pa |= (u64)pa34_32 << 32;
>  	}
>  
> -	fault_port = F_MMU_INT_ID_PORT_ID(regval);
> +	fault_port = F_MMU_INT_ID_PORT_ID(regval, data->plat_data-
> >port_width);
>  	if (MTK_IOMMU_HAS_FLAG(data->plat_data, HAS_SUB_COMM)) {
>  		fault_larb = F_MMU_INT_ID_COMM_ID(regval);
>  		sub_comm = F_MMU_INT_ID_SUB_COMM_ID(regval);
>  	} else {
> -		fault_larb = F_MMU_INT_ID_LARB_ID(regval);
> +		fault_larb = F_MMU_INT_ID_LARB_ID(regval,
> +						  data->plat_data-
> >port_width);
>  	}
>  	fault_larb = data->plat_data-
> >larbid_remap[fault_larb][sub_comm];
>  
> @@ -1034,6 +1037,7 @@ static const struct mtk_iommu_plat_data
> mt2712_data = {
>  	.iova_region  = single_domain,
>  	.iova_region_nr = ARRAY_SIZE(single_domain),
>  	.larbid_remap = {{0}, {1}, {2}, {3}, {4}, {5}, {6}, {7}},
> +	.port_width   = 5,
>  };
>  
>  static const struct mtk_iommu_plat_data mt6779_data = {
> @@ -1043,6 +1047,7 @@ static const struct mtk_iommu_plat_data
> mt6779_data = {
>  	.iova_region   = single_domain,
>  	.iova_region_nr = ARRAY_SIZE(single_domain),
>  	.larbid_remap  = {{0}, {1}, {2}, {3}, {5}, {7, 8}, {10}, {9}},
> +	.port_width    = 5,
>  };
>  
>  static const struct mtk_iommu_plat_data mt8167_data = {
> @@ -1052,6 +1057,7 @@ static const struct mtk_iommu_plat_data
> mt8167_data = {
>  	.iova_region  = single_domain,
>  	.iova_region_nr = ARRAY_SIZE(single_domain),
>  	.larbid_remap = {{0}, {1}, {2}}, /* Linear mapping. */
> +	.port_width   = 5,
>  };
>  
>  static const struct mtk_iommu_plat_data mt8173_data = {
> @@ -1062,6 +1068,7 @@ static const struct mtk_iommu_plat_data
> mt8173_data = {
>  	.iova_region  = single_domain,
>  	.iova_region_nr = ARRAY_SIZE(single_domain),
>  	.larbid_remap = {{0}, {1}, {2}, {3}, {4}, {5}}, /* Linear
> mapping. */
> +	.port_width   = 5,
>  };
>  
>  static const struct mtk_iommu_plat_data mt8183_data = {
> @@ -1071,6 +1078,7 @@ static const struct mtk_iommu_plat_data
> mt8183_data = {
>  	.iova_region  = single_domain,
>  	.iova_region_nr = ARRAY_SIZE(single_domain),
>  	.larbid_remap = {{0}, {4}, {5}, {6}, {7}, {2}, {3}, {1}},
> +	.port_width   = 5,
>  };
>  
>  static const struct mtk_iommu_plat_data mt8192_data = {
> @@ -1082,6 +1090,7 @@ static const struct mtk_iommu_plat_data
> mt8192_data = {
>  	.iova_region_nr = ARRAY_SIZE(mt8192_multi_dom),
>  	.larbid_remap   = {{0}, {1}, {4, 5}, {7}, {2}, {9, 11, 19, 20},
>  			   {0, 14, 16}, {0, 13, 18, 17}},
> +	.port_width     = 5,
>  };
>  
>  static const struct of_device_id mtk_iommu_of_ids[] = {
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index b742432220c5..84cecaf6d61c 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -54,6 +54,7 @@ struct mtk_iommu_plat_data {
>  	enum mtk_iommu_plat m4u_plat;
>  	u32                 flags;
>  	u32                 inv_sel_reg;
> +	u8                  port_width;

Please help rename to int_id_port_width for more detailed from the
register name (REG_MMU0_INT_ID).

>  
>  	unsigned int				iova_region_nr;
>  	const struct mtk_iommu_iova_region	*iova_region;
> -- 
> 2.36.1
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
