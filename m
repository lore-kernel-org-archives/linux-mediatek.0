Return-Path: <SRS0=3SR4=76=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DDB5C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 12:05:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F390D20CC7
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 12:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VdMmVmcx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QlBh1x10"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F390D20CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IHiCGgRG7rChqlvM6k9AJBHNF7FtySCOrgUg3k/zF/E=; b=VdMmVmcxhVk0iU
	x/e4GE8RNn80+b+g3E2qqLZFiMLa7GC/OCqDU3cMPno1P2NEBLRl8qrzqOh3qEjDFz5kfc5ZPiejD
	8COzTqNWvWuaxuBtwxXco//3kE93VGEoijRiBdREukTGJrP2SzJthVIvEIEqmN1P/U5nvp3vI0UuK
	h+kKAw7+HHbLBl3mPoLvS9Y6Gc+GY/a7ChhQAduZ16wltq5H/uBiK2AYHo8NG7TRq1ujA6hgHGwwx
	SbsBaUWcCNeE3ugsg5/8hXbu9uh3P6771cEI3IQct5JKq6jzwbYKEjU81t/EXYISDEK5fw3ybmR9i
	Q52KAk2zkQbIudBmJCoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlWos-00055C-Vx; Wed, 17 Jun 2020 12:05:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlWop-00054E-He; Wed, 17 Jun 2020 12:05:29 +0000
X-UUID: 8263704063f44f299ca29f8cfe18a2c8-20200617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ePqp1XCduyF+0DK0KjaNw0tZo0lcnwLg1Ln0fgHyKJo=; 
 b=QlBh1x10nTR1U+ZrroXjlD6WXEINjAwuZWnEXud+3u/irbnVxzIZpX3JYlnUtEUU2+oda91MII8TTvhJSCO5+CfqipiHGw5VBd+12YrKMBRaAhquggeLMRvrdMQadgWnEhEv86R86pJi62ltalz/HyBCGOshJQ3Zor9zVxB95PM=;
X-UUID: 8263704063f44f299ca29f8cfe18a2c8-20200617
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <andrew-sh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 188358142; Wed, 17 Jun 2020 04:05:14 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Jun 2020 05:05:19 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Jun 2020 20:05:18 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 17 Jun 2020 20:05:17 +0800
Message-ID: <1592395520.30389.2.camel@mtksdaap41>
Subject: Re: [PATCH 08/12] dt-bindings: devfreq: add compatible for mt8183
 cci devfreq
From: andrew-sh.cheng <andrew-sh.cheng@mediatek.com>
To: Chanwoo Choi <cw00.choi@samsung.com>
Date: Wed, 17 Jun 2020 20:05:20 +0800
In-Reply-To: <4087bcdb-a247-3d2d-96b2-16f965e8ba5c@samsung.com>
References: <20200520034307.20435-1-andrew-sh.cheng@mediatek.com>
 <CGME20200520034339epcas1p1524dea2d7089cb3492384bbe917dcffe@epcas1p1.samsung.com>
 <20200520034307.20435-9-andrew-sh.cheng@mediatek.com>
 <4087bcdb-a247-3d2d-96b2-16f965e8ba5c@samsung.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200617_050527_593493_94675F33 
X-CRM114-Status: GOOD (  19.73  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 srv_heupstream@mediatek.com, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Mark Brown <broonie@kernel.org>, "Rafael J
 . Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-05-28 at 16:42 +0900, Chanwoo Choi wrote:
> Hi,
> 
> On 5/20/20 12:43 PM, Andrew-sh.Cheng wrote:
> > This adds dt-binding documentation of cci devfreq
> > for Mediatek MT8183 SoC platform.
> > 
> > Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > ---
> >  .../devicetree/bindings/devfreq/mt8183-cci.yaml    | 51 ++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/devfreq/mt8183-cci.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/devfreq/mt8183-cci.yaml b/Documentation/devicetree/bindings/devfreq/mt8183-cci.yaml
> > new file mode 100644
> > index 000000000000..a7341fd94097
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/devfreq/mt8183-cci.yaml
> > @@ -0,0 +1,51 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: https://protect2.fireeye.com/url?k=33f1f15d-6e23ea05-33f07a12-0cc47a31c8b4-91b3f8aeecce95dc&q=1&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Fdevfreq%2Fmt8183-cci.yaml%23
> > +$schema: https://protect2.fireeye.com/url?k=fc7d9089-a1af8bd1-fc7c1bc6-0cc47a31c8b4-b46f5afc59faf86d&q=1&u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
> > +
> > +title: CCI_DEVFREQ driver for MT8183.
> > +
> > +maintainers:
> > +  - Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> > +
> > +description: |
> > +  This module is used to create CCI DEVFREQ.
> > +  The performance will depend on both CCI frequency and CPU frequency.
> > +  For MT8183, CCI co-buck with Little core.
> > +  Contain CCI opp table for voltage and frequency scaling.
> > +
> > +properties:
> > +  compatible:
> > +    const: "mediatek,mt8183-cci"
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: "cci"
> > +
> > +  operating-points-v2: true
> > +  opp-table: true
> > +
> > +  proc-supply:
> > +    description:
> > +      Phandle of the regulator that provides the supply voltage.
> > +
> > +required:
> > +  - compatible
> > +  - clocks
> > +  - clock-names
> > +  - proc-supply
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/mt8183-clk.h>
> > +    cci: cci {
> > +      compatible = "mediatek,mt8183-cci";
> > +      clocks = <&apmixedsys CLK_APMIXED_CCIPLL>;
> > +      clock-names = "cci";
> > +      operating-points-v2 = <&cci_opp>;
> > +      proc-supply = <&mt6358_vproc12_reg>;
> > +    };
> > +
> > 
> 
> I recommend that add the more detailed example
> with OPP table with CPU node.
> 

Hi Chanwoo Choi,

Actually, for previous versions of my patch set, I didn't use
governor_passive as cci_devfreq governor.
So I think it is okay that not provide CPU OPP node for this cci device
node.

> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
