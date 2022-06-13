Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8DCAC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 05:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GSgEx2SCNqpxsieeMQ1PhHol6sJwxKi0OEIa3vffi38=; b=oS+I9TN28TD41m
	kYUKYfa4H3gjMNnF8JrRI7YVEsf0EIz9jZt25ojEjmWPm9E5OucaV9nUqkAGxabShW41FjleXRO2O
	jRshgEKBcEQuhA2nIHqg+21GPdiwDqGQRX4zpIWXOUorBM3XOio97VLJIdajTdPry90xqwO4F/sYm
	cRT4UgKlw78UE2lCmnNpww4dCYk4S/CWlAdQzqOv5UoPYz1lZnyjiNZvQCeUdZ5W5KdchpJpyA0Zb
	4NH7bbUCG8VEjR7mgoZ3LayklPl5mAE9f1B9WyailhQjVvzcF+J6MTHTU8M6vSmyl/SghT6O95hGp
	Pfxg89jbIDgiWTp1UvdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0cqR-001WBG-8f; Mon, 13 Jun 2022 05:42:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0cpw-001VyG-Qz; Mon, 13 Jun 2022 05:42:06 +0000
X-UUID: dc1ed5d835634a028aa76d95c612bea7-20220612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=vVDGfs8uAFDJQnSNtWMdrkrZQwqDYfDkDrPB4a/aSmo=;
	b=DH7qOmFifpzzzTnSUCjcMhA5kYvTCd6UfajxsVqeEYC7dILsqeMAxgOYPFhC/E0jsgXEoNXfz/vjYf77s7x4ZeXBGrUATX+ILbmYm4j51OoLjs8mTEWpLtweN2eM39HSIV6/fQIPmdC5tFSBPNQYBM1p1LLLfuZLYWL+MqXLTus=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:382f71c5-95ec-4998-94be-2fbc12cce403,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:b6a957c6-12ba-4305-bfdf-9aefbdc32516,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: dc1ed5d835634a028aa76d95c612bea7-20220612
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 499461805; Sun, 12 Jun 2022 22:41:59 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jun 2022 22:32:53 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 13 Jun 2022 13:32:51 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 13 Jun 2022 13:32:50 +0800
Message-ID: <c4d75440a5345bca0447b9a4dd21244aa0484312.camel@mediatek.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mediatek: Add bindings for MT6795
 M4U
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <joro@8bytes.org>, <will@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
	<iommu@lists.linux-foundation.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <konrad.dybcio@somainline.org>,
	<marijn.suijten@somainline.org>, <martin.botka@somainline.org>,
	<~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
	<paul.bouchara@somainline.org>, Rob Herring <robh@kernel.org>
Date: Mon, 13 Jun 2022 13:32:50 +0800
In-Reply-To: <20220609104001.97753-2-angelogioacchino.delregno@collabora.com>
References: <20220609104001.97753-1-angelogioacchino.delregno@collabora.com>
	 <20220609104001.97753-2-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_224204_920792_E560E7DA 
X-CRM114-Status: GOOD (  17.13  )
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

On Thu, 2022-06-09 at 12:39 +0200, AngeloGioacchino Del Regno wrote:
> Add bindings for the MediaTek Helio X10 (MT6795) IOMMU/M4U.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/iommu/mediatek,iommu.yaml        |  4 +
>  include/dt-bindings/memory/mt6795-larb-port.h | 96
> +++++++++++++++++++
>  2 files changed, 100 insertions(+)
>  create mode 100644 include/dt-bindings/memory/mt6795-larb-port.h
> 
> diff --git
> a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> index d5e3272a54e8..20902c387520 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
> @@ -73,6 +73,7 @@ properties:
>            - mediatek,mt2701-m4u  # generation one
>            - mediatek,mt2712-m4u  # generation two
>            - mediatek,mt6779-m4u  # generation two
> +          - mediatek,mt6795-m4u  # generation two
>            - mediatek,mt8167-m4u  # generation two
>            - mediatek,mt8173-m4u  # generation two
>            - mediatek,mt8183-m4u  # generation two
> @@ -128,6 +129,7 @@ properties:
>        dt-binding/memory/mt2701-larb-port.h for mt2701 and mt7623,
>        dt-binding/memory/mt2712-larb-port.h for mt2712,
>        dt-binding/memory/mt6779-larb-port.h for mt6779,
> +      dt-binding/memory/mt6795-larb-port.h for mt6795,
>        dt-binding/memory/mt8167-larb-port.h for mt8167,
>        dt-binding/memory/mt8173-larb-port.h for mt8173,
>        dt-binding/memory/mt8183-larb-port.h for mt8183,
> @@ -152,6 +154,7 @@ allOf:
>              enum:
>                - mediatek,mt2701-m4u
>                - mediatek,mt2712-m4u
> +              - mediatek,mt6795-m4u
>                - mediatek,mt8173-m4u
>                - mediatek,mt8186-iommu-mm
>                - mediatek,mt8192-m4u
> @@ -181,6 +184,7 @@ allOf:
>            contains:
>              enum:
>                - mediatek,mt2712-m4u
> +              - mediatek,mt6795-m4u
>                - mediatek,mt8173-m4u
>  
>      then:
> diff --git a/include/dt-bindings/memory/mt6795-larb-port.h
> b/include/dt-bindings/memory/mt6795-larb-port.h
> new file mode 100644
> index 000000000000..223aca8fd350
> --- /dev/null
> +++ b/include/dt-bindings/memory/mt6795-larb-port.h
> @@ -0,0 +1,96 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2022 Collabora Ltd.
> + * Author: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> + */
> +
> +#ifndef _DT_BINDINGS_MEMORY_MT6795_LARB_PORT_H_
> +#define _DT_BINDINGS_MEMORY_MT6795_LARB_PORT_H_
> +
> +#include <dt-bindings/memory/mtk-memory-port.h>
> +
> +#define M4U_LARB0_ID			0
> +#define M4U_LARB1_ID			1
> +#define M4U_LARB2_ID			2
> +#define M4U_LARB3_ID			3
> +#define M4U_LARB4_ID			4
> +#define M4U_LARB5_ID			5

Just a nitpick: M4U_LARB5_ID is not used, then remove this.

> +
> +/* larb0 */
> +#define M4U_PORT_DISP_OVL0		MTK_M4U_ID(M4U_LARB0_ID, 0)
> +#define M4U_PORT_DISP_RDMA0		MTK_M4U_ID(M4U_LARB0_ID, 1)
> +#define M4U_PORT_DISP_RDMA1		MTK_M4U_ID(M4U_LARB0_ID, 2)
> +#define M4U_PORT_DISP_WDMA0		MTK_M4U_ID(M4U_LARB0_ID, 3)
> +#define M4U_PORT_DISP_OVL1		MTK_M4U_ID(M4U_LARB0_ID, 4)
> +#define M4U_PORT_DISP_RDMA2		MTK_M4U_ID(M4U_LARB0_ID, 5)
> +#define M4U_PORT_DISP_WDMA1		MTK_M4U_ID(M4U_LARB0_ID, 6)
> +#define M4U_PORT_DISP_OD_R		MTK_M4U_ID(M4U_LARB0_ID, 7)
> +#define M4U_PORT_DISP_OD_W		MTK_M4U_ID(M4U_LARB0_ID, 8)
> +#define M4U_PORT_MDP_RDMA0		MTK_M4U_ID(M4U_LARB0_ID, 9)
> +#define M4U_PORT_MDP_RDMA1		MTK_M4U_ID(M4U_LARB0_ID, 10)
> +#define M4U_PORT_MDP_WDMA		MTK_M4U_ID(M4U_LARB0_ID, 11)
> +#define M4U_PORT_MDP_WROT0		MTK_M4U_ID(M4U_LARB0_ID, 12)
> +#define M4U_PORT_MDP_WROT1		MTK_M4U_ID(M4U_LARB0_ID, 13)
> +
> +/* larb1 */
> +#define M4U_PORT_VDEC_MC		MTK_M4U_ID(M4U_LARB1_ID, 0)
> +#define M4U_PORT_VDEC_PP		MTK_M4U_ID(M4U_LARB1_ID, 1)
> +#define M4U_PORT_VDEC_UFO		MTK_M4U_ID(M4U_LARB1_ID, 2)
> +#define M4U_PORT_VDEC_VLD		MTK_M4U_ID(M4U_LARB1_ID, 3)
> +#define M4U_PORT_VDEC_VLD2		MTK_M4U_ID(M4U_LARB1_ID, 4)
> +#define M4U_PORT_VDEC_AVC_MV		MTK_M4U_ID(M4U_LARB1_ID, 5)
> +#define M4U_PORT_VDEC_PRED_RD		MTK_M4U_ID(M4U_LARB1_ID
> , 6)
> +#define M4U_PORT_VDEC_PRED_WR		MTK_M4U_ID(M4U_LARB1_ID
> , 7)
> +#define M4U_PORT_VDEC_PPWRAP		MTK_M4U_ID(M4U_LARB1_ID, 8)
> +
> +/* larb2 */
> +#define M4U_PORT_CAM_IMGO		MTK_M4U_ID(M4U_LARB2_ID, 0)
> +#define M4U_PORT_CAM_RRZO		MTK_M4U_ID(M4U_LARB2_ID, 1)
> +#define M4U_PORT_CAM_AAO		MTK_M4U_ID(M4U_LARB2_ID, 2)
> +#define M4U_PORT_CAM_LCSO		MTK_M4U_ID(M4U_LARB2_ID, 3)
> +#define M4U_PORT_CAM_ESFKO		MTK_M4U_ID(M4U_LARB2_ID, 4)
> +#define M4U_PORT_CAM_IMGO_S		MTK_M4U_ID(M4U_LARB2_ID, 5)
> +#define M4U_PORT_CAM_LSCI		MTK_M4U_ID(M4U_LARB2_ID, 6)
> +#define M4U_PORT_CAM_LSCI_D		MTK_M4U_ID(M4U_LARB2_ID, 7)
> +#define M4U_PORT_CAM_BPCI		MTK_M4U_ID(M4U_LARB2_ID, 8)
> +#define M4U_PORT_CAM_BPCI_D		MTK_M4U_ID(M4U_LARB2_ID, 9)
> +#define M4U_PORT_CAM_UFDI		MTK_M4U_ID(M4U_LARB2_ID, 10)
> +#define M4U_PORT_CAM_IMGI		MTK_M4U_ID(M4U_LARB2_ID, 11)
> +#define M4U_PORT_CAM_IMG2O		MTK_M4U_ID(M4U_LARB2_ID, 12)
> +#define M4U_PORT_CAM_IMG3O		MTK_M4U_ID(M4U_LARB2_ID, 13)
> +#define M4U_PORT_CAM_VIPI		MTK_M4U_ID(M4U_LARB2_ID, 14)
> +#define M4U_PORT_CAM_VIP2I		MTK_M4U_ID(M4U_LARB2_ID, 15)
> +#define M4U_PORT_CAM_VIP3I		MTK_M4U_ID(M4U_LARB2_ID, 16)
> +#define M4U_PORT_CAM_LCEI		MTK_M4U_ID(M4U_LARB2_ID, 17)
> +#define M4U_PORT_CAM_RB			MTK_M4U_ID(M4U_LARB2_ID
> , 18)
> +#define M4U_PORT_CAM_RP			MTK_M4U_ID(M4U_LARB2_ID
> , 19)
> +#define M4U_PORT_CAM_WR			MTK_M4U_ID(M4U_LARB2_ID
> , 20)
> +
> +/* larb3 */
> +#define M4U_PORT_VENC_RCPU		MTK_M4U_ID(M4U_LARB3_ID, 0)
> +#define M4U_PORT_VENC_REC		MTK_M4U_ID(M4U_LARB3_ID, 1)
> +#define M4U_PORT_VENC_BSDMA		MTK_M4U_ID(M4U_LARB3_ID, 2)
> +#define M4U_PORT_VENC_SV_COMV		MTK_M4U_ID(M4U_LARB3_ID
> , 3)
> +#define M4U_PORT_VENC_RD_COMV		MTK_M4U_ID(M4U_LARB3_ID
> , 4)
> +#define M4U_PORT_JPGENC_BSDMA		MTK_M4U_ID(M4U_LARB3_ID
> , 5)
> +#define M4U_PORT_REMDC_SDMA		MTK_M4U_ID(M4U_LARB3_ID, 6)
> +#define M4U_PORT_REMDC_BSDMA		MTK_M4U_ID(M4U_LARB3_ID, 7)
> +#define M4U_PORT_JPGENC_RDMA		MTK_M4U_ID(M4U_LARB3_ID, 8)
> +#define M4U_PORT_JPGENC_SDMA		MTK_M4U_ID(M4U_LARB3_ID, 9)
> +#define M4U_PORT_JPGDEC_WDMA		MTK_M4U_ID(M4U_LARB3_ID, 10)
> +#define M4U_PORT_JPGDEC_BSDMA		MTK_M4U_ID(M4U_LARB3_ID
> , 11)
> +#define M4U_PORT_VENC_CUR_LUMA		MTK_M4U_ID(M4U_LARB3_ID
> , 12)
> +#define M4U_PORT_VENC_CUR_CHROMA	MTK_M4U_ID(M4U_LARB3_ID, 13)
> +#define M4U_PORT_VENC_REF_LUMA		MTK_M4U_ID(M4U_LARB3_ID
> , 14)
> +#define M4U_PORT_VENC_REF_CHROMA	MTK_M4U_ID(M4U_LARB3_ID, 15)
> +#define M4U_PORT_REMDC_WDMA		MTK_M4U_ID(M4U_LARB3_ID, 16)
> +#define M4U_PORT_VENC_NBM_RDMA		MTK_M4U_ID(M4U_LARB3_ID
> , 17)
> +#define M4U_PORT_VENC_NBM_WDMA		MTK_M4U_ID(M4U_LARB3_ID
> , 18)
> +
> +/* larb4 */
> +#define M4U_PORT_MJC_MV_RD		MTK_M4U_ID(M4U_LARB4_ID, 0)
> +#define M4U_PORT_MJC_MV_WR		MTK_M4U_ID(M4U_LARB4_ID, 1)
> +#define M4U_PORT_MJC_DMA_RD		MTK_M4U_ID(M4U_LARB4_ID, 2)
> +#define M4U_PORT_MJC_DMA_WR		MTK_M4U_ID(M4U_LARB4_ID, 3)
> +
> +#endif
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
