Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4178C00140
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 08:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EkIrr/XdWNxm5P4ukxZS20W/VtaNurx0qD6+aNFVVkg=; b=a+4ZRwYHXxNV3WPUkpzhIWycqX
	nD2TsuOLPtsHZqiX4PMkYm2ZXPQQiOLdutGnVg2LDlkQcPt+YG9jhWBkvcozvmgVK4hyp6rfsid9g
	Gbeu8RWNIPy3uSnZ3FU67bEDv0sAP8Ns90EoHO/h8GrQdSKYMLC4EgdhrQ7VTrV0F8L51f5H4VOIm
	V2R5ikQU9RhkwxbB2CNKMBQDIhrhNnAqx1dveO/yW0YJfGXzSZfJ8eH31b0y0RmMaMh+oM8LkYkNy
	ZPR4XpUTWnd+6qNJCw9cr26oRpGk4JJJWo0GrgWiZJQz2k+xMz1EbPSDB/Vajk9saumGnnAKspj9k
	lhWal0Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOarp-000o5O-C2; Thu, 18 Aug 2022 08:27:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOara-000nto-5Y; Thu, 18 Aug 2022 08:26:51 +0000
X-UUID: 43c79437e180415fab540388abdc4afc-20220818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=EkIrr/XdWNxm5P4ukxZS20W/VtaNurx0qD6+aNFVVkg=;
	b=pxsp9AuLYOQGgMrvjGVZnApgPslTXXQsIjGvC6W6/uvPlFBeSaC/+okoQ2j9nFSGnmvFjakQYUzw2nzokFz0SAVCrHzssuTnM3qb4Q+LBJ6UR53M4VgfnAtgKfVNzvTKdni/QcklDCqOPVCs8s/XU0+8iEt19rpkFJk2c1WM0lM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:26bd923f-30f7-4d2a-8833-c4c282c1de1d,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:25fcacfd-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 43c79437e180415fab540388abdc4afc-20220818
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 828314494; Thu, 18 Aug 2022 01:26:46 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 18 Aug 2022 15:26:07 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 18 Aug 2022 15:26:06 +0800
Message-ID: <f34db3a295b8c83e03bf79950cc25d39b6f81240.camel@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: mediatek: mt8188: Add binding for MM &
 INFRA IOMMU
From: Chengci.Xu <chengci.xu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Yong Wu
	<yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon
	<will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 18 Aug 2022 15:26:06 +0800
In-Reply-To: <ae06f644-b988-8fc3-fde8-258299f8f2ae@linaro.org>
References: <20220804105834.626-1-chengci.xu@mediatek.com>
	 <20220804105834.626-2-chengci.xu@mediatek.com>
	 <ae06f644-b988-8fc3-fde8-258299f8f2ae@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_012650_271411_A4744090 
X-CRM114-Status: GOOD (  26.59  )
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

On Thu, 2022-08-04 at 13:13 +0200, Krzysztof Kozlowski wrote:
> On 04/08/2022 12:58, Chengci.Xu wrote:
> > This patch adds descriptions for mt8188 IOMMU which also use ARM
> > Short-Descriptor translation table format.
> > 
> 
> 
> Thank you for your patch. There is something to discuss/improve.

Tkanks for your review.

> 
> >      then:
> >        required:
> > diff --git a/include/dt-bindings/memory/mt8188-memory-port.h
> >  b/include/dt-bindings/memory/mt8188-memory-port.h
> > new file mode 100644
> > index 000000000000..612fd366c3a7
> > --- /dev/null
> > +++ b/include/dt-bindings/memory/mt8188-memory-port.h
> 
> Use vendor prefix in filename, so mediatek,mt8188-memory-port.h

Is this a new mandatory rules to add a vendor prefix in dt-bindings
file name? we have never add a vendor prefix before.

If possible, we'd like not to use vendor prefix for the consistency of
fliename's format(mtxxxx-memory-port.h).
Such as "mt8195-memory-port.h" and "mt8186-memory-port.h".      

> 
> > @@ -0,0 +1,482 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> 
> 
> This should be dual-license, if possible.

OK, we will use /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-
Clause) */ in the next version.

> 
> 
> > +/*
> > + * Copyright (c) 2022 MediaTek Inc.
> > + * Author: Chengci Xu <chengci.xu@mediatek.com>
> > + */
> > +#ifndef _DT_BINDINGS_MEMORY_MT8188_LARB_PORT_H_
> > +#define _DT_BINDINGS_MEMORY_MT8188_LARB_PORT_H_
> > +
> > +#include <dt-bindings/memory/mtk-memory-port.h>
> > +
> > +/*
> > + * MM IOMMU supports 16GB dma address. We separate it to four
> > ranges:
> > + * 0 ~ 4G; 4G ~ 8G; 8G ~ 12G; 12G ~ 16G, we could adjust these
> > masters
> > + * locate in anyone region. BUT:
> > + * a) Make sure all the ports inside a larb are in one range.
> > + * b) The iova of any master can NOT cross the 4G/8G/12G boundary.
> > + *
> > + * This is the suggested mapping in this SoC:
> > + *
> > + * modules    dma-address-region	larbs-ports
> > + * disp         0 ~ 4G                  larb0/1/2/3
> > + * vcodec      4G ~ 8G                  larb19/21/23
> > + * cam/mdp     8G ~ 12G                 the other larbs.
> > + * N/A         12G ~ 16G
> > + * CCU0   0x24000_0000 ~ 0x243ff_ffff   larb27: port 0/1
> > + * CCU1   0x24400_0000 ~ 0x247ff_ffff   larb27: port 2/3
> > + *
> > + * This SoC have two MM IOMMU HWs, this is the connected
> > information:
> > + * iommu-vdo: larb0/2/5/9/10/11A/11C/13/16B/17B/19/21
> > + * iommu-vpp: larb1/3/4/6/7/11B/12/14/15/16A/17A/23/27
> > + */
> > +
> > +/* MM IOMMU larbs */
> > +#define SMI_L0_ID		(0)
> 
> No need for ().

Thanks, got it.

> 
> > +#define SMI_L1_ID		(1)
> > +#define SMI_L2_ID		(2)
> > +#define SMI_L3_ID		(3)\
> 
> 
> Best regards,
> Krzysztof

Best regards,
Chengci Xu


