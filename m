Return-Path: <SRS0=tlsQ=F6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6654EC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Dec 2020 09:07:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17F0D221E9
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Dec 2020 09:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17F0D221E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m623FBI+e2tc4m0yUKA9EbtjTI2h8tR5KOXIBqzoDW4=; b=bPtorLjyuAB63W+ZHrkL3xuNC
	Zd/ysW0z2x74MWTOspofLYTMk3GiWbVLQ34ukv16Ixxbqqr6UN9Fr5+hyIAs/aGyW9C3/o1EzfUsi
	Jsbui3qu8mtewxo9g8zrF2wb/p9t3kQlPCUobCOKGB7IbnlDWcKClTD+H1ktdSg3RrunkDuRiCs82
	s1Zvbzr2h+2NjlYRYGDC9VMnfcpHnnQcu3aKEuKVZ8V9b6Ck/iKwdGpw3B7zcFvinBi9nETF7NjjI
	3PVJW8GwLXg+SlXzZqNH/bxpJyVKeDFU/68xnyqcRwe/n2cwhs1bkkVCCUu7+azHdYaG5XwkY1WEM
	LaaaRUGyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kt5Xn-0003bp-UF; Sat, 26 Dec 2020 09:07:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kt5Xj-0003av-Ro; Sat, 26 Dec 2020 09:07:21 +0000
X-UUID: abd5fcd1914146d3b7e4d54ab5e9ac79-20201226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SlEDBqr6pqTI7qWfhu/ALj97BCMwtKpquEMZ16ReOls=; 
 b=k76dwY/LHyP9BagZ4RTbOVoLM8aX/37q5B+gZz4PeaTwf4ku+YUyQ9M0gxDWlNV1+IFXYFcQP2qO/niQMgXD4Xu21iG+SOdFF5Yr6HGEtXyacnCYR3dy6IfBuqItWrZJxTgb0SDakQQoWK9Nd4TnxyeynFBcEkXPlISH616Sccs=;
X-UUID: abd5fcd1914146d3b7e4d54ab5e9ac79-20201226
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1376261238; Sat, 26 Dec 2020 01:07:12 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 26 Dec 2020 01:07:10 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 26 Dec 2020 17:06:52 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 26 Dec 2020 17:06:53 +0800
Message-ID: <1608973616.14806.79.camel@mhfsdcap03>
Subject: Re: [v6,1/3] dt-binding: reset-controller: mediatek: add YAML schemas
From: Crystal Guo <crystal.guo@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Date: Sat, 26 Dec 2020 17:06:56 +0800
In-Reply-To: <230c34e8a973140ebb7f155f5527050408f0c438.camel@pengutronix.de>
References: <20200930022159.5559-1-crystal.guo@mediatek.com>
 <20200930022159.5559-2-crystal.guo@mediatek.com>
 <230c34e8a973140ebb7f155f5527050408f0c438.camel@pengutronix.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: CC6C40D32C38A3E17A270A2E49EE5F45BF57B0C9132D9BE69FA5F9432ABFB6882000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201226_040720_106626_69F79D12 
X-CRM114-Status: GOOD (  18.59  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Yong
 Liang =?UTF-8?Q?=28=E6=A2=81=E5=8B=87=29?= <Yong.Liang@mediatek.com>,
 Stanley Chu =?UTF-8?Q?=28=E6=9C=B1=E5=8E=9F=E9=99=9E=29?=
 <stanley.chu@mediatek.com>, srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fan Chen =?UTF-8?Q?=28=E9=99=B3=E5=87=A1=29?= <fan.chen@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>, "s-anna@ti.com" <s-anna@ti.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-12-03 at 15:41 +0800, Philipp Zabel wrote:
> Hi,
> 
> On Wed, 2020-09-30 at 10:21 +0800, Crystal Guo wrote:
> > Add a YAML documentation for Mediatek, which uses ti reset-controller
> > driver directly. The TI reset controller provides a common reset
> > management, and is suitable for Mediatek SoCs.
> > 
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> > ---
> >  .../bindings/reset/mediatek-syscon-reset.yaml | 51 +++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml b/Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml
> > new file mode 100644
> > index 000000000000..7871550c3c69
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml
> > @@ -0,0 +1,51 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/reset/mediatek-syscon-reset.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek Reset Controller
> > +
> > +maintainers:
> > +  - Crystal Guo <crystal.guo@mediatek.com>
> > +
> > +description:
> > +  The bindings describe the reset-controller for Mediatek SoCs,
> > +  which is based on TI reset controller. For more detail, please
> > +  visit Documentation/devicetree/bindings/reset/ti-syscon-reset.txt.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,syscon-reset
> > +
> > +  '#reset-cells':
> > +    const: 1
> > +
> > +  mediatek,reset-bits:
> > +    description: >
> > +      Contains the reset control register information, please refer to
> > +      Documentation/devicetree/bindings/reset/ti-syscon-reset.txt.
> 
> I would really like some input from Rob on this, in v4 he asked not to
> repeat 'ti,reset-bits'.
> 
> regards
> Philipp


Hi Rob,

Can you give some suggestions on this document
"mediatek-syscon-reset.yaml", many thanks~

regards
Crystal Guo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
