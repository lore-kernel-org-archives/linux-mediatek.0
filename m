Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0FCC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 06:45:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C8236101B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 06:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C8236101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Tsbb9WRnLWPprvwSqGI+BAA3UYglvprpsPsko5KE0no=; b=MGpH6jy/VjX9FjhvJCOu4FrhM
	zMPLR2oouT2NzEaB5izoNoeRskbqFXK1WI00Vt/XUMEzl9qyMJ4Z78PSzybU2KJvw31Ixbv76qNwV
	9uZaLgOuBG+UppgBu+JyHiuD4fw28Uw9HVhry/ly4wEBueBu1+x1nmMrnxGiiYcIJ73yhYQNtcaoG
	Fg7DoEB4rbRgZj0PnF4nGUohzk3DZsgr2g1+5jYgll/vrV8AKorsIkJ82i27nPgJprGtYZdiKLZn+
	p8rp2Ax+BB/3FifvgBVUqst5kmAyfIkRdfFWDFm626VLbqp+jtWuyDOFSADj8c1QUUnUJNkefGQqP
	MxXZwBriw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVqJs-005qbR-8s; Mon, 12 Apr 2021 06:45:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqJo-005qb5-7k; Mon, 12 Apr 2021 06:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=6irlN+d9Mb2+ba18MKnOG1SxUR8FvHNgzGMB81pMeE0=; b=dF0V4ssdLnG1r4n0f6G2JcY3AJ
 vgNHtd4VyX/G1YHmIXQwZrE+703rDFYB97g05NnkwmcYutC1yUjHqIr5MqpRNMCDR0Q50qeYb6b1j
 EgKQzHcBoh7eL1pdAbdNP1Cr0R+Boh1kTX3K1pLhUCn3Vy6hEzFjDONNT8SYge5knbDwC31vqpZmz
 CH7Imf+f3OAGN8mRTVedoz+7Ot+obTgEle3JsjEdgYPrQctB9twiLzEhakclTHBziMLxPofXSF7S1
 Lxcf5hyWuj4gPzTbUD8B7T7U8+urXsMyn7pupejdOaIj/nOXhw85E2TDq1TMj9iKiUypUrzh91gVt
 jGa35fjQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqJk-005uPS-PT; Mon, 12 Apr 2021 06:45:06 +0000
X-UUID: f0389e19c1244c41a6923eae70738422-20210411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6irlN+d9Mb2+ba18MKnOG1SxUR8FvHNgzGMB81pMeE0=; 
 b=USQkW+zVIb1Jn2MRjQsE4w46Qvh0jLI4jpdRxirtAC/v5POt3Cj/5YwJv7kxHdKk/6WM+wmZ8tIENDbIDGE+ABjbzimvESgLPol0Svv4dD/P9mkAEfDTda4FoaV3G2k3eSOhFj1Iq7oLNXg9PmftnF0AYLmJ5DNdSXVttugc4GM=;
X-UUID: f0389e19c1244c41a6923eae70738422-20210411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 36130315; Sun, 11 Apr 2021 23:44:59 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Apr 2021 23:44:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 14:44:55 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 14:44:55 +0800
Message-ID: <1618209895.25062.11.camel@mtksdccf07>
Subject: Re: [PATCH 4/8] dt-bindings: arm: mediatek: Add new document
 bindings for APU
From: Flora Fu <flora.fu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Chiawen Lee <chiawen.lee@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>, Flora Fu
 <flora.fu@mediatek.com>
Date: Mon, 12 Apr 2021 14:44:55 +0800
In-Reply-To: <20210409182538.GA3913794@robh.at.kernel.org>
References: <1617766086-5502-1-git-send-email-flora.fu@mediatek.com>
 <1617766086-5502-5-git-send-email-flora.fu@mediatek.com>
 <20210409182538.GA3913794@robh.at.kernel.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FAF44DDF206968B3B76899833A08D826296786249D61A9BED1B4F7C2A51F30DE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_234504_870206_AAB3CC21 
X-CRM114-Status: GOOD (  21.16  )
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

On Fri, 2021-04-09 at 13:25 -0500, Rob Herring wrote:
> On Wed, Apr 07, 2021 at 11:28:02AM +0800, Flora Fu wrote:
> > Document the apusys bindings.
> > 
> > Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> > ---
> >  .../arm/mediatek/mediatek,apusys.yaml         | 56 +++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml
> > new file mode 100644
> > index 000000000000..dc04a46f1bad
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml
> > @@ -0,0 +1,56 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,apusys.yaml*__;Iw!!CTRNKA9wMg0ARbw!3ryKFTA2CvsVss4Pt2ZOG7wv4jgR-2LPxuGn30IxFmpxoxSRdzNdf8FrAYYvZWcw$ 
> > +$schema: https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!3ryKFTA2CvsVss4Pt2ZOG7wv4jgR-2LPxuGn30IxFmpxoxSRdzNdf8FrARlhCQ0w$ 
> > +
> > +title: MediaTek APUSYS Controller
> > +
> > +maintainers:
> > +  - Flora Fu <flora.fu@mediatek.com>
> > +
> > +description:
> > +  The Mediatek apusys controller provides functional configurations and clocks
> > +  to the system.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - mediatek,mt8192-apu_mbox
> > +          - mediatek,mt8192-apu_conn
> > +          - mediatek,mt8192-apu_vcore
> 
> s/_/-/
> 

OK. I will update expression strings in the next version.

> > +      - const: syscon
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    apu_mbox: apu_mbox@19000000 {
> 
> mailbox@...? Is this a mailbox provider?
> 

Yes, the apu_mbox is the for setup mailbox in the APU hardware.

> > +        compatible = "mediatek,mt8192-apu_mbox", "syscon";
> > +        reg = <0x19000000 0x1000>;
> > +    };
> > +
> > +  - |
> > +    apu_conn: apu_conn@19020000 {
> > +        compatible = "mediatek,mt8192-apu_conn", "syscon";
> > +        reg = <0x19020000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > +
> > +  - |
> > +    apu_vcore: apu_vcore@19029000 {
> > +        compatible = "mediatek,mt8192-apu_vcore", "syscon";
> > +        reg = <0x19029000 0x1000>;
> > +        #clock-cells = <1>;
> > +    };
> > -- 
> > 2.18.0
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
