Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241A6C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 07:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RWd6Rhi+D4fks7pVXva23W/axIFd3WmD9+ZO1GWBakE=; b=Z9O823QdH/GyeC
	sNAPI1UO4WVoFbAMU9+Ijp8lGCTYjZ+nBfcy96+TUZDM5aQJ4ovHtITd3DBgsWMHmkBiHGLx9icJw
	eKMeDUiQY961DuDwIZVj2+XpQFPM3n0GS+VIXedqrDH9c7ouzcWhJEw1rnxj5uJ1MlyOVRB73cxz6
	xXkTljJpoc5kxEN8lXCmyaNbNHVy9LSxXv4wgSzdXNVsCuQUdhxpclnPc6kuqV03K9hK2eXX7Ga6x
	b+4OYFPTR408JL5czhHSFExZM8EkfPbVXE24D5ntESaz2d6nRXlzCtX1zYqowOZBSGOR6jwgitiS/
	5PlbjjrI+sCbmnHgE89g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njcGd-000Llt-Jc; Wed, 27 Apr 2022 07:39:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njcGb-000Lkr-IY; Wed, 27 Apr 2022 07:39:18 +0000
X-UUID: dc5c21a8e6c347b79a78d7dc9ec85e7f-20220427
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:e84cd0ca-7c76-49aa-9402-0c4445b9994d, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:fbb1a6c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: dc5c21a8e6c347b79a78d7dc9ec85e7f-20220427
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 340877842; Wed, 27 Apr 2022 00:39:14 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 00:39:12 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Apr 2022 15:39:10 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Apr 2022 15:39:10 +0800
Message-ID: <8913adafed3a4a43f220c0cdcc76663ec06e5313.camel@mediatek.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: Add Mediatek SoC MT8186 dts and
 evaluation board and Makefile
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Miles Chen <miles.chen@mediatek.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <hsinyi@chromium.org>,
 <krzysztof.kozlowski@canonical.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>, <ryder.lee@kernel.org>,
 <wenst@chromium.org>
Date: Wed, 27 Apr 2022 15:39:10 +0800
In-Reply-To: <20220426230048.20685-1-miles.chen@mediatek.com>
References: <20220426125046.17311-3-allen-kh.cheng@mediatek.com>
 <20220426230048.20685-1-miles.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_003917_667687_E2E562CF 
X-CRM114-Status: GOOD (  15.72  )
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

Hi Miles,

On Wed, 2022-04-27 at 07:00 +0800, Miles Chen wrote:
> Hi Allen, 
> 
> > Add basic chip support for Mediatek MT8186.
> 
> s/Mediatek/MediaTek/
> 
ok

> > 
> > Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> ...snip...
> 
> > @@ -0,0 +1,232 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> 
> I think we should use GPL-2.0-only OR BSD-2-Clause for newly added
> dts files.
> i.e.,
> // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> 
ok

> > +/*
> > + * Copyright (C) 2022 MediaTek Inc.
> > + */
> > +/dts-v1/;
> > +#include "mt8186.dtsi"
> > +
> > +/ {
> 
> 
> ..snip...
> 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > new file mode 100644
> > index 000000000000..e8d8867412e3
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > @@ -0,0 +1,932 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> 
> I think we should use GPL-2.0-only OR BSD-2-Clause for newly added
> dts files.
> i.e.,
> // SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> 

ok

> > +/*
> > + * Copyright (C) 2022 MediaTek Inc.
> > + * Author: Allen-KH Cheng <allenn-kh.cheng@mediatek.com>
> > + */
> > +/dts-v1/;
> > 
> 
> 
> thanks,
> Miles

I will correct those in next version.

Best regards,
Allen




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
