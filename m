Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5BCC43461
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 03:45:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C478120DD4
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 03:45:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TZ12BNho";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ei/MDmmY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C478120DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZYKypsqRuYLewYMyGs06arDeAhI2d0HloKNITBM4e0E=; b=TZ12BNhobOYeFEar9h8IspE1q
	tv6mZy0h5mZPIKUD0LZJGXYqbYIItRS5o+Xz8kiZKHvXHdHLdVBsHNUzyxJkQVHN5vit2tkXvfdmu
	/ecxp+Gi0CCTivaOBTQPABIeHoW8ZPPGzx9zFxlbZ9RiT1Jx26GcX78KBhmboctbOmdDLcEW3aity
	3+Jqz3xfAWfBFILPZiuYevAzTTNTQBDxiI25Pd7qTkHPcbarg8UAIjA7yub1uXTSQSGLOFiU7sXXb
	+LPPmMATSLiLxXZhUA6ebDSADYVunxsOV0DOmSQVfO3D5VbHqmHXEXbQGsYYunCbFD0P8VY6DsvZ4
	dltWkEX0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kF85j-00067w-6f; Mon, 07 Sep 2020 03:45:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kF85g-00066u-9U; Mon, 07 Sep 2020 03:45:13 +0000
X-UUID: bffc624f2a4847118c498bbe4ed0cbed-20200906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+kQMFZtTwzN5g3ipj6RMOu9cz09zTtXs8Jvc7SvBRYE=; 
 b=Ei/MDmmYIlxQ6eMkoRim98t3V6iyykR81POfDmFima10X4k+i9Ln0zRDpt44gt5vh67c5M1qpydfs61pAa3aNtGHWT0HaFBHCTBQWKbZ2WrhLERE9jZr9TVYmRFPFdhKoV9QAto56ns80AmZmvtu8ib0zxkP3verGSFCiKZ4WAk=;
X-UUID: bffc624f2a4847118c498bbe4ed0cbed-20200906
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 708136693; Sun, 06 Sep 2020 19:45:11 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Sep 2020 20:45:09 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 7 Sep 2020 11:45:05 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Sep 2020 11:45:06 +0800
Message-ID: <1599450198.27773.12.camel@mhfsdcap03>
Subject: Re: [PATCH v3 1/3] dt-bindings: iommu: Add binding for MediaTek
 MT8167 IOMMU
From: Yong Wu <yong.wu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>
Date: Mon, 7 Sep 2020 11:43:18 +0800
In-Reply-To: <20200906151928.881209-1-fparent@baylibre.com>
References: <20200906151928.881209-1-fparent@baylibre.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 870868C0E752BB5D53643B5CAD2F078C8B2CECA589AC935CFAB57F2A2BDFD3EB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200906_234512_484484_8B47D313 
X-CRM114-Status: GOOD (  19.89  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, joro@8bytes.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2020-09-06 at 17:19 +0200, Fabien Parent wrote:
> This commit adds IOMMU binding documentation and larb port definitions
> for the MT8167 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> 
> V3: Added mt8167-larb-port.h file for iommu port definitions
> V2: no change
> 
> ---
>  .../bindings/iommu/mediatek,iommu.txt         |  1 +
>  include/dt-bindings/memory/mt8167-larb-port.h | 49 +++++++++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 include/dt-bindings/memory/mt8167-larb-port.h
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> index c1ccd8582eb2..f7a348f48e0d 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> @@ -61,6 +61,7 @@ Required properties:
>  	"mediatek,mt6779-m4u" for mt6779 which uses generation two m4u HW.
>  	"mediatek,mt7623-m4u", "mediatek,mt2701-m4u" for mt7623 which uses
>  						     generation one m4u HW.
> +	"mediatek,mt8167-m4u" for mt8167 which uses generation two m4u HW.
>  	"mediatek,mt8173-m4u" for mt8173 which uses generation two m4u HW.
>  	"mediatek,mt8183-m4u" for mt8183 which uses generation two m4u HW.
>  - reg : m4u register base and size.

Please also add this line in the iommu-cells property:

     dt-bindings/memory/mt8167-larb-port.h for mt8167.

> diff --git a/include/dt-bindings/memory/mt8167-larb-port.h b/include/dt-bindings/memory/mt8167-larb-port.h
> new file mode 100644
> index 000000000000..4dd44d1037a7
> --- /dev/null
> +++ b/include/dt-bindings/memory/mt8167-larb-port.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2020 BayLibre, SAS
> + * Author: Fabien Parent <fparent@baylibre.com>

If I'm not wrong, the first version was created by:
 Honghui Zhang <honghui.zhang@mediatek.com>

the original author should be kept.

> + */
> +#ifndef __DTS_IOMMU_PORT_MT8167_H
> +#define __DTS_IOMMU_PORT_MT8167_H
> +
> +#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
> +
> +#define M4U_LARB0_ID			0
> +#define M4U_LARB1_ID			1
> +#define M4U_LARB2_ID			2
> +
> +/* larb0 */
> +#define M4U_PORT_DISP_OVL0		MTK_M4U_ID(M4U_LARB0_ID, 0)
> +#define M4U_PORT_DISP_RDMA0		MTK_M4U_ID(M4U_LARB0_ID, 1)
> +#define M4U_PORT_DISP_WDMA0		MTK_M4U_ID(M4U_LARB0_ID, 2)
> +#define M4U_PORT_DISP_RDMA1		MTK_M4U_ID(M4U_LARB0_ID, 3)
> +#define M4U_PORT_MDP_RDMA		MTK_M4U_ID(M4U_LARB0_ID, 4)
> +#define M4U_PORT_MDP_WDMA		MTK_M4U_ID(M4U_LARB0_ID, 5)
> +#define M4U_PORT_MDP_WROT		MTK_M4U_ID(M4U_LARB0_ID, 6)
> +#define M4U_PORT_DISP_FAKE		MTK_M4U_ID(M4U_LARB0_ID, 7)
> +
> +/* IMG larb1*/
> +#define M4U_PORT_CAM_IMGO		MTK_M4U_ID(M4U_LARB1_ID, 0)
> +#define M4U_PORT_CAM_IMG2O		MTK_M4U_ID(M4U_LARB1_ID, 1)
> +#define M4U_PORT_CAM_LSCI		MTK_M4U_ID(M4U_LARB1_ID, 2)
> +#define M4U_PORT_CAM_ESFKO		MTK_M4U_ID(M4U_LARB1_ID, 3)
> +#define M4U_PORT_CAM_AAO		MTK_M4U_ID(M4U_LARB1_ID, 4)
> +#define M4U_PORT_VENC_REC		MTK_M4U_ID(M4U_LARB1_ID, 5)
> +#define M4U_PORT_VENC_BSDMA		MTK_M4U_ID(M4U_LARB1_ID, 6)
> +#define M4U_PORT_VENC_RD_COMV		MTK_M4U_ID(M4U_LARB1_ID, 7)
> +#define M4U_PORT_CAM_IMGI		MTK_M4U_ID(M4U_LARB1_ID, 8)
> +#define M4U_PORT_VENC_CUR_LUMA		MTK_M4U_ID(M4U_LARB1_ID, 9)
> +#define M4U_PORT_VENC_CUR_CHROMA	MTK_M4U_ID(M4U_LARB1_ID, 10)
> +#define M4U_PORT_VENC_REF_LUMA		MTK_M4U_ID(M4U_LARB1_ID, 11)
> +#define M4U_PORT_VENC_REF_CHROMA	MTK_M4U_ID(M4U_LARB1_ID, 12)
> +
> +/* VDEC larb2*/
> +#define M4U_PORT_HW_VDEC_MC_EXT		MTK_M4U_ID(M4U_LARB2_ID, 0)
> +#define M4U_PORT_HW_VDEC_PP_EXT		MTK_M4U_ID(M4U_LARB2_ID, 1)
> +#define M4U_PORT_HW_VDEC_VLD_EXT	MTK_M4U_ID(M4U_LARB2_ID, 2)
> +#define M4U_PORT_HW_VDEC_AVC_MV_EXT	MTK_M4U_ID(M4U_LARB2_ID, 3)
> +#define M4U_PORT_HW_VDEC_PRED_RD_EXT	MTK_M4U_ID(M4U_LARB2_ID, 4)
> +#define M4U_PORT_HW_VDEC_PRED_WR_EXT	MTK_M4U_ID(M4U_LARB2_ID, 5)
> +#define M4U_PORT_HW_VDEC_PPWRAP_EXT	MTK_M4U_ID(M4U_LARB2_ID, 6)
> +
> +#endif

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
