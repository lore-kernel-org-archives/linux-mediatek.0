Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD92DC43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 06:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=koxNaxPu3swRL4ag5WtPUWt/xYKpfKpA0baMD4UWIqs=; b=Mx/n2c+1UFErY3
	rohwd3LjyjMkS3pL+cTNgz1f257TMKsgGka9rXWqLxErx1twtMAEijuuQ2zlmVXZj2Vj4yEjVeTBx
	6WySfSaM3vPdcns6Ge06tNeoZT/nuQNYUpUz+SOXiN+JSbQqWwR5MfWng9g5h9ose5tjpucCgPH3r
	6hfcj7/lVOLNDVWABOPwqNfgHFY4jb04/rayntah/nyQSTLU2JhCEzkdq24K9VSsMQEyiGLWIgdUI
	6Hx/+X4qjOjDdLZfyjlTaQoK/BSnWQkQDZQnFmVlsRbzCnogswKgOWPPp6LdvhkgEs4VXYHNR4vJD
	4GpPFv6dgKKiZmq3+4Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nweK0-001jnv-Gi; Thu, 02 Jun 2022 06:28:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nweJy-001jlz-17; Thu, 02 Jun 2022 06:28:39 +0000
X-UUID: 83b28d3cdc5d4d118b875f238beb39e3-20220601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=ChpsM1cLnqmNeeMHjqBksv07oHFy8CGYDmj8mAoUA/k=;
	b=V83M8TbH7haUZ5H+c1oECdxQsZy3pIe1hhkMDvFKpSRYYyaWI1F8gIVMQMd3cvIl78vr78DJrsGtaXqJmWFCD49w7PMj63uxrNcG1RBgGesu3f42t1EqX7vK6XSR2DlQVMs1rwUufYrw430yj3Ino3TyBlsnaqYbmZuBqLLeZCo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:c48eb7cc-a9d4-4962-a7aa-ac0d6ec87c1c,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:37d0920d-3a0d-4bbe-9d72-0e5d26d57423,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 83b28d3cdc5d4d118b875f238beb39e3-20220601
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 270302199; Wed, 01 Jun 2022 23:28:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 23:18:35 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 2 Jun 2022 14:18:34 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 2 Jun 2022 14:18:33 +0800
Message-ID: <8ac7a6766c635412b408cb5295ddb3da37541140.camel@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: iommu: mediatek: add binding
 documentation for MT8365 SoC
From: Yong Wu <yong.wu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>
CC: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <iommu@lists.linux-foundation.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Thu, 2 Jun 2022 14:18:33 +0800
In-Reply-To: <20220530180328.845692-1-fparent@baylibre.com>
References: <20220530180328.845692-1-fparent@baylibre.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_232838_105595_CE88754D 
X-CRM114-Status: GOOD (  13.00  )
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

On Mon, 2022-05-30 at 20:03 +0200, Fabien Parent wrote:
> Add IOMMU binding documentation for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../bindings/iommu/mediatek,iommu.yaml        |  2 +
>  include/dt-bindings/memory/mt8365-larb-port.h | 96
> +++++++++++++++++++
>  2 files changed, 98 insertions(+)
>  create mode 100644 include/dt-bindings/memory/mt8365-larb-port.h

[snip...]

> +#ifndef _DT_BINDINGS_MEMORY_MT8365_LARB_PORT_H_
> +#define _DT_BINDINGS_MEMORY_MT8365_LARB_PORT_H_
> +
> +#include <dt-bindings/memory/mtk-memory-port.h>
> +
> +#define M4U_LARB0_ID			0
> +#define M4U_LARB1_ID			1
> +#define M4U_LARB2_ID			2
> +#define M4U_LARB3_ID			3
> +#define M4U_LARB4_ID			4
> +#define M4U_LARB5_ID			5
> +#define M4U_LARB6_ID			6
> +#define M4U_LARB7_ID			7

Remove these. they are no used, right?

> +
> +/* larb0 */
> +#define M4U_PORT_DISP_OVL0		MTK_M4U_ID(0, 0)
> +#define M4U_PORT_DISP_OVL0_2L	MTK_M4U_ID(0, 1)

[...]

> 
> +/* larb4 */
> +#define M4U_PORT_APU_READ		MTK_M4U_ID(0, 0)
> +#define M4U_PORT_APU_WRITE		MTK_M4U_ID(0, 1)

Please remove these two APU definitions. currently these are not
supported.

Thanks.

> +
> +#endif
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
