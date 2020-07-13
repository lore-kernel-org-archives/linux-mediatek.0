Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D87C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:33:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D04552067D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u3kY5sWV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GS5Y1elU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D04552067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ja5j2URMSC6LiVSA5nVCWHd/7KjtVEj/pM+G41C16Ms=; b=u3kY5sWVr714czKM8106nfhL1
	wqU+A+6pKhfhXS9nx39LjQyaaZZNR9vaLp44R6/rQC6oFvdNDB9TXm4ZSELPIDsL2jyDQh2vgnT1t
	7QQCDRdKKCaBAcHhBSHssqG7VCssKIX5c3uJsfJTq7/VMiUgVqwSZvBiczGOAvDe9up/L2L1d8i5o
	TVVq5v0BCdJg5j4vH59NCaPBgVQdzDmGAFdLYVAFhDhdL7Rs3xRZZYuGm+r99tnMLKbABQe/u9hIa
	ly57AexEpZXmMOk6meDk2Kh543qXNNUZi9ywa9uIiDFCG/Slf3lHzB9NCsfoKe/UGopz/Ue8Umdon
	/cjwWGR2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jus1Y-0004or-JD; Mon, 13 Jul 2020 06:33:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jus1W-0004nr-G1; Mon, 13 Jul 2020 06:33:11 +0000
X-UUID: 5767375645de4ff7bc5b2fb0729f9309-20200712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=u1YVFUhNBChKn3hVAOGio4nlm710e7A413UQV7bi/Ys=; 
 b=GS5Y1elUly4hzWnTLjkS+daSnzadDnpJeT8Fv0icMGBYh20qoNbpEMJa26TF4mu6hq4W7U5mnL9McUMMni4qjpgec1CW7ktk+ehk3ZpUChGSWEyhVN/1NN046Be2JXrJc5tXG9gDXFUuOr1rLrFK0Sh2VP0XIkKvfg7IyJ9/i9c=;
X-UUID: 5767375645de4ff7bc5b2fb0729f9309-20200712
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1717619310; Sun, 12 Jul 2020 22:33:05 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jul 2020 23:28:54 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 13 Jul 2020 14:28:51 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jul 2020 14:28:51 +0800
Message-ID: <1594621684.16172.22.camel@mhfsdcap03>
Subject: Re: [PATCH 01/21] dt-binding: memory: mediatek: Add a common
 larb-port header file
From: Yong Wu <yong.wu@mediatek.com>
To: Pi-Hsun Shih <pihsun@chromium.org>
Date: Mon, 13 Jul 2020 14:28:04 +0800
In-Reply-To: <CANdKZ0dwsaP=s8AgRbDx2_0y4JmPnF-X0Rb=4vor2MWCYWfGKw@mail.gmail.com>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-2-yong.wu@mediatek.com>
 <9e21288c-07da-88b0-2dbb-bd9a2a4d529b@gmail.com>
 <CANdKZ0dwsaP=s8AgRbDx2_0y4JmPnF-X0Rb=4vor2MWCYWfGKw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B2F7F870170CA2A9C5CE3E2AE2DE382AD28F42E6BD22B1BEE765926AC2E33B272000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_023310_753853_E7743BFB 
X-CRM114-Status: GOOD (  21.17  )
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
Cc: Youlin Pei =?UTF-8?Q?=28=E8=A3=B4=E5=8F=8B=E6=9E=97=29?=
 <youlin.pei@mediatek.com>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 cui.zhang@mediatek.com, srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 open list <linux-kernel@vger.kernel.org>, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-07-13 at 13:43 +0800, Pi-Hsun Shih wrote:
> On Mon, Jul 13, 2020 at 2:06 AM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> >
> >
> >
> > On 11/07/2020 08:48, Yong Wu wrote:
> > > Put all the macros about smi larb/port togethers, this is a preparing
> > > patch for extending LARB_NR and adding new dom-id support.
> > >
> > > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > > ---
> > >   include/dt-bindings/memory/mt2712-larb-port.h  |  2 +-
> > >   include/dt-bindings/memory/mt6779-larb-port.h  |  2 +-
> > >   include/dt-bindings/memory/mt8173-larb-port.h  |  2 +-
> > >   include/dt-bindings/memory/mt8183-larb-port.h  |  2 +-
> > >   include/dt-bindings/memory/mtk-smi-larb-port.h | 15 +++++++++++++++
> > >   5 files changed, 19 insertions(+), 4 deletions(-)
> > >   create mode 100644 include/dt-bindings/memory/mtk-smi-larb-port.h
> > >
> > > ...
> > > diff --git a/include/dt-bindings/memory/mtk-smi-larb-port.h b/include/dt-bindings/memory/mtk-smi-larb-port.h
> > > new file mode 100644
> > > index 000000000000..2ec7fe5ce4e9
> > > --- /dev/null
> > > +++ b/include/dt-bindings/memory/mtk-smi-larb-port.h
> > > @@ -0,0 +1,15 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +/*
> > > + * Copyright (c) 2020 MediaTek Inc.
> > > + * Author: Yong Wu <yong.wu@mediatek.com>
> > > + */
> > > +#ifndef __DTS_MTK_IOMMU_PORT_H_
> > > +#define __DTS_MTK_IOMMU_PORT_H_
> > > +
> > > +#define MTK_LARB_NR_MAX                      16
> >
> > include/soc/mediatek/smi.h has the very same define.
> > Should smi.h include this file?
> >
> > Regards,
> > Matthias
> >
> 
> Looks like this is being addressed in patch 5 in this series ([05/21]
> iommu/mediatek: Use the common mtk-smi-larb-port.h)
> That said, should that patch be merged into this one?

At the beginning, I really did like this. But checkpatch will complain
like that:

WARNING:DT_SPLIT_BINDING_PATCH: DT binding docs and includes should be a
separate patch. See:
Documentation/devicetree/bindings/submitting-patches.rst

> 
> 
> 
> > > +
> > > +#define MTK_M4U_ID(larb, port)               (((larb) << 5) | (port))
> > > +#define MTK_M4U_TO_LARB(id)          (((id) >> 5) & 0xf)
> > > +#define MTK_M4U_TO_PORT(id)          ((id) & 0x1f)
> > > +
> > > +#endif
> > >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
