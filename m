Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46157C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 08:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4UjHBtbija4nizNhR3Vl9vGmVRQALoOKrkk+YC2YlBA=; b=U5E9onJVpC3/My
	TmQ64jU3nEtORQWSmfEjdhs2KheJ3UMEIt92nEkouT0XiRwkdpvwgbyQZpdbrb+KMtmwwzau70TNs
	Wl7cZv+BQUSuaCjmrb0twYtrvxtWKtpXghCGRMkEK34m9uvYIaGwnwirtXE19Y4nRg/Bh1NydEHXC
	QrAsYrT72HNAV0ULXnd6ycVJ6k4gChq/TjO53poC5zlaVPgXjGJ8dgUBS3QCSP7Ejwo4wjkrols+U
	ahbu+11ZrglznG24tg3PlaGJx5qw2Lt2BWF6Fbat+P2UZiLI/H5bKq7oZGMl1FuV+pFncwO/aoROK
	C0nEkeWJt+tgKI8GedRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGzma-009R1j-VQ; Mon, 07 Feb 2022 08:54:00 +0000
Received: from mailgw01.mediatek.com ([66.171.122.165])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGzmP-009QzR-AK; Mon, 07 Feb 2022 08:53:50 +0000
X-UUID: b22484c2390449dba4a9dfc0ae3e1787-20220207
X-UUID: b22484c2390449dba4a9dfc0ae3e1787-20220207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1744984697; Mon, 07 Feb 2022 01:53:45 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Feb 2022 00:53:43 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 7 Feb 2022 16:53:42 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 7 Feb 2022 16:53:42 +0800
Message-ID: <618ca2903de8fe3b1f68c450273af7a170de2675.camel@mediatek.com>
Subject: Re: [v1 1/2] dt-bindings: power: Add MT8186 power domains
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
CC: Enric Balletbo Serra <eballetbo@gmail.com>, Nicolas Boichat
 <drinkcat@chromium.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 7 Feb 2022 16:53:42 +0800
In-Reply-To: <ae307028-979b-7e58-dd6f-f1d52520859b@gmail.com>
References: <20220108131953.16744-1-chun-jie.chen@mediatek.com>
 <20220108131953.16744-2-chun-jie.chen@mediatek.com>
 <Yd43V1woRMAcXOfS@robh.at.kernel.org>
 <ae307028-979b-7e58-dd6f-f1d52520859b@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_005349_402200_E89D97B0 
X-CRM114-Status: GOOD (  18.68  )
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

On Fri, 2022-01-14 at 13:49 +0100, Matthias Brugger wrote:
> 
> On 12/01/2022 03:05, Rob Herring wrote:
> > On Sat, Jan 08, 2022 at 09:19:52PM +0800, Chun-Jie Chen wrote:
> > > Add power domains dt-bindings for MT8186.
> > > 
> > > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > > ---
> > >   .../power/mediatek,power-controller.yaml      |  1 +
> > >   include/dt-bindings/power/mt8186-power.h      | 32
> > > +++++++++++++++++++
> > >   2 files changed, 33 insertions(+)
> > >   create mode 100644 include/dt-bindings/power/mt8186-power.h
> > > 
> > > diff --git
> > > a/Documentation/devicetree/bindings/power/mediatek,power-
> > > controller.yaml
> > > b/Documentation/devicetree/bindings/power/mediatek,power-
> > > controller.yaml
> > > index d6ebd77d28a7..135c6f722091 100644
> > > --- a/Documentation/devicetree/bindings/power/mediatek,power-
> > > controller.yaml
> > > +++ b/Documentation/devicetree/bindings/power/mediatek,power-
> > > controller.yaml
> > > @@ -26,6 +26,7 @@ properties:
> > >         - mediatek,mt8167-power-controller
> > >         - mediatek,mt8173-power-controller
> > >         - mediatek,mt8183-power-controller
> > > +      - mediatek,mt8186-power-controller
> > >         - mediatek,mt8192-power-controller
> > >         - mediatek,mt8195-power-controller
> > >   
> > > diff --git a/include/dt-bindings/power/mt8186-power.h
> > > b/include/dt-bindings/power/mt8186-power.h
> > > new file mode 100644
> > > index 000000000000..ca8ea2d24801
> > > --- /dev/null
> > > +++ b/include/dt-bindings/power/mt8186-power.h
> > > @@ -0,0 +1,32 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > 
> > Dual license please.
> > 
> 
> Other then that series looks good.
> 
> Regards,
> Matthias
> 

Ok, I will update license in next patch.

Thanks!
Best Regards,
Chun-Jie

> > > +/*
> > > + * Copyright (c) 2022 MediaTek Inc.
> > > + * Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > > + */
> > > +
> > > +#ifndef _DT_BINDINGS_POWER_MT8186_POWER_H
> > > +#define _DT_BINDINGS_POWER_MT8186_POWER_H
> > > +
> > > +#define MT8186_POWER_DOMAIN_MFG0			0
> > > +#define MT8186_POWER_DOMAIN_MFG1			1
> > > +#define MT8186_POWER_DOMAIN_MFG2			2
> > > +#define MT8186_POWER_DOMAIN_MFG3			3
> > > +#define MT8186_POWER_DOMAIN_SSUSB			4
> > > +#define MT8186_POWER_DOMAIN_SSUSB_P1			5
> > > +#define MT8186_POWER_DOMAIN_DIS				6
> > > +#define MT8186_POWER_DOMAIN_IMG				7
> > > +#define MT8186_POWER_DOMAIN_IMG2			8
> > > +#define MT8186_POWER_DOMAIN_IPE				9
> > > +#define MT8186_POWER_DOMAIN_CAM				10
> > > +#define MT8186_POWER_DOMAIN_CAM_RAWA			11
> > > +#define MT8186_POWER_DOMAIN_CAM_RAWB			12
> > > +#define MT8186_POWER_DOMAIN_VENC			13
> > > +#define MT8186_POWER_DOMAIN_VDEC			14
> > > +#define MT8186_POWER_DOMAIN_WPE				15
> > > +#define MT8186_POWER_DOMAIN_CONN_ON			16
> > > +#define MT8186_POWER_DOMAIN_CSIRX_TOP			17
> > > +#define MT8186_POWER_DOMAIN_ADSP_AO			18
> > > +#define MT8186_POWER_DOMAIN_ADSP_INFRA			19
> > > +#define MT8186_POWER_DOMAIN_ADSP_TOP			20
> > > +
> > > +#endif /* _DT_BINDINGS_POWER_MT8186_POWER_H */
> > > -- 
> > > 2.18.0
> > > 
> > > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
