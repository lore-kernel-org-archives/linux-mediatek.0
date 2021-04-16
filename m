Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8081AC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 03:01:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDA0761107
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 03:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDA0761107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G837XteIrroQwzvkHdTWWNjjHCRxa8SENYSx3ww8NX4=; b=eEmSawVK7dPX+C/z26tt++o7+
	Po0KE4IoSSKzpIi2KsNJHnnq9pST6DVJWxTO1bgdxJYfGm5od82Q2N0+jgOQii+7vSw6J47s1RSxH
	KeA8IGzNFXZMA0dw4Xned/+Ova+ib5J8O4uBV1rrGpwxOAsit0AtFAII8VWl+j8+zdEl3AnYgciYr
	h2iAAKupcBn8o2zwyXRhpq8+w0bEGiTxqqkM5FzhwLOf9pP/dsDkNNUSJ/s7NXHGLeAxF/F7LFrRy
	6akzm+pgELHssjsLJurQsorwtRG+8ICefzvX0GVaCC/j827Y2wQQKPN+JwJA36r+7tsODj9jhIngj
	zFawyz7kw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXEje-000ZYw-Qm; Fri, 16 Apr 2021 03:01:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXEjZ-000ZXW-SQ; Fri, 16 Apr 2021 03:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=MTAy3dK7ZeeTqAFn6CDQfuUe2LUsEJXiuvm05pj0FSo=; b=YqtC2zpb9npBJCqOpDUtapwD49
 gzL9uOSiE2IrIapTKC0fyNQ167BTgeWKV6MLHc4spmUh6p0BmBj8wa/DW2HejjkgMerxIuIfC5yFF
 DYOYBZIQpmxzobDtWhczvfL1EIoxo3lF/j1RFhN0MaPkB1Q8y7il5dAxzd9zWY30KxeQeY0XX3ATQ
 4QSVuotFUCHQopHutm3VBTzmb7Zcjc6Sl7t4pYqX6zm3MWuOzLCcFTpNZkv07BXd8P3A88JWxoIN7
 TM8gslNt7zyrKAPji5WUSpiib8RdMz0s3NQl6lrUARZZsvVj67RVItQrs5fLGGnVudzHdGf+E5HoA
 oh0W3Ibg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXEjU-0092pq-W7; Fri, 16 Apr 2021 03:01:28 +0000
X-UUID: 3a2442c8ec5b4d00b6ac7a3ecc57a4ec-20210415
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MTAy3dK7ZeeTqAFn6CDQfuUe2LUsEJXiuvm05pj0FSo=; 
 b=KRDqCfuCAN6kvJxmqjtLn83qxuYVTBV73wN+hQvJ1XYN5LqOOoEAAqan8vhDhjUutIHtyhD9x4/nf/+aDSwMY3gspbcx6XqVn0iuCm/rBJvLIeUhPJNX4pSf8dq0mieRUMtOJ7KBdA6WAsC8flmh1UPN3JvDWzMA9YEtnvKNrVw=;
X-UUID: 3a2442c8ec5b4d00b6ac7a3ecc57a4ec-20210415
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 289828540; Thu, 15 Apr 2021 20:01:14 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Apr 2021 20:01:13 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 11:01:10 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Apr 2021 11:01:10 +0800
Message-ID: <1618542070.27491.15.camel@mtksdccf07>
Subject: Re: [PATCH 4/8] dt-bindings: arm: mediatek: Add new document
 bindings for APU
From: Flora Fu <flora.fu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Chiawen Lee <chiawen.lee@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>
Date: Fri, 16 Apr 2021 11:01:10 +0800
In-Reply-To: <CAL_JsqLKaYY=NHm1hD=YaQgvDOBTtraoUqcycA7tu7n-f2GVDw@mail.gmail.com>
References: <1617766086-5502-1-git-send-email-flora.fu@mediatek.com>
 <1617766086-5502-5-git-send-email-flora.fu@mediatek.com>
 <20210409182538.GA3913794@robh.at.kernel.org>
 <1618209895.25062.11.camel@mtksdccf07>
 <CAL_JsqLKaYY=NHm1hD=YaQgvDOBTtraoUqcycA7tu7n-f2GVDw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9F4E1F87D3F9E72542DAD2DF050407D939B7DB684CFA915AFE9C5AC433219D722000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_200126_414467_111FA5C3 
X-CRM114-Status: GOOD (  28.28  )
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

On Thu, 2021-04-15 at 16:24 -0500, Rob Herring wrote:
> On Mon, Apr 12, 2021 at 1:45 AM Flora Fu <flora.fu@mediatek.com> wrote:
> >
> > On Fri, 2021-04-09 at 13:25 -0500, Rob Herring wrote:
> > > On Wed, Apr 07, 2021 at 11:28:02AM +0800, Flora Fu wrote:
> > > > Document the apusys bindings.
> > > >
> > > > Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> > > > ---
> > > >  .../arm/mediatek/mediatek,apusys.yaml         | 56 +++++++++++++++++++
> > > >  1 file changed, 56 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml
> > > > new file mode 100644
> > > > index 000000000000..dc04a46f1bad
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml
> > > > @@ -0,0 +1,56 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,apusys.yaml*__;Iw!!CTRNKA9wMg0ARbw!3ryKFTA2CvsVss4Pt2ZOG7wv4jgR-2LPxuGn30IxFmpxoxSRdzNdf8FrAYYvZWcw$
> > > > +$schema: https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!3ryKFTA2CvsVss4Pt2ZOG7wv4jgR-2LPxuGn30IxFmpxoxSRdzNdf8FrARlhCQ0w$
> > > > +
> > > > +title: MediaTek APUSYS Controller
> > > > +
> > > > +maintainers:
> > > > +  - Flora Fu <flora.fu@mediatek.com>
> > > > +
> > > > +description:
> > > > +  The Mediatek apusys controller provides functional configurations and clocks
> > > > +  to the system.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - enum:
> > > > +          - mediatek,mt8192-apu_mbox
> > > > +          - mediatek,mt8192-apu_conn
> > > > +          - mediatek,mt8192-apu_vcore
> > >
> > > s/_/-/
> > >
> >
> > OK. I will update expression strings in the next version.
> >
> > > > +      - const: syscon
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  '#clock-cells':
> > > > +    const: 1
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    apu_mbox: apu_mbox@19000000 {
> > >
> > > mailbox@...? Is this a mailbox provider?
> > >
> >
> > Yes, the apu_mbox is the for setup mailbox in the APU hardware.
> 
> Then you need #mbox-cells here.
> 
> And in that case, what makes it a syscon?
> 
The apu_mbox are registers for setup mail box communications between apu
processor and the AP side kernel drivers. It also has spare registers
that reserved for keep specific information between apu and AP side.
That's why I set it as syscon to avoid ioremap from users. Do you think
it is reasonable or it is better to be kept inside the user nodes when
using it?

> >
> > > > +        compatible = "mediatek,mt8192-apu_mbox", "syscon";
> > > > +        reg = <0x19000000 0x1000>;
> > > > +    };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
