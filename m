Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D86C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 02:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aExvgcjzXbYxrQLeNTR9O4fvXrrh0gtVodWz22COkLQ=; b=XX6XvEnKTEKppt
	r7r7lkmornXLG+Wh2QoDDIWnkrXraemtJwipLXaw3BQlA3ZJl6F6rjuvNXwuB9B2FkDh2inQKVD/K
	5UrMKbAhmj1KvEkNkydJn5zidGtQhZaHYjmR4frdRozkNK0xFwuNCXd1KzLuiVTvcJ1tXo84KtrAe
	niXmxLzW+ec5rEOHkzWLqvIu3IwlLNiBLJKsx0l8SbhBo0hgWbJ7TJ8PUQZtaUSYaj61ijueCk8Gd
	0BY81E+MAPdPUHBYQ9ab3fJk968zCNCHe8MldGJrphPuz2pbD/NBZKu2Yig61fgq5NmtB93uI/xGl
	zIUPekJFy4Q05ug/LcwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niobI-007tvh-Kp; Mon, 25 Apr 2022 02:37:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niobD-007tuq-70; Mon, 25 Apr 2022 02:37:19 +0000
X-UUID: 7a4f59f53939458b9d6f39f21b8b73b3-20220424
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:268f1b01-8a20-4ad7-a1e0-5ee34cc23ab8, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:8918cbf0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 7a4f59f53939458b9d6f39f21b8b73b3-20220424
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1773185657; Sun, 24 Apr 2022 19:37:06 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 Apr 2022 19:37:04 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Apr 2022 10:37:03 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Apr 2022 10:37:03 +0800
Message-ID: <fdedea6f20738bfe2ede7e526aa653af1ac35768.camel@mediatek.com>
Subject: Re: [PATCH V3 11/17] dt-bindings: arm: mediatek: Add #reset-cells
 property for MT8192-sys-clock
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
 <sboyd@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
CC: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, Chun-Jie Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=B5=9A=E6=A1=80=29?= <Chun-Jie.Chen@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>, Runyang Chen
 =?UTF-8?Q?=28=E9=99=88=E6=B6=A6=E6=B4=8B=29?= <Runyang.Chen@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 25 Apr 2022 10:37:02 +0800
In-Reply-To: <288f55f3-b3ed-32b8-9a44-652f3d53617d@linaro.org>
References: <20220422060152.13534-1-rex-bc.chen@mediatek.com>
 <20220422060152.13534-12-rex-bc.chen@mediatek.com>
 <288f55f3-b3ed-32b8-9a44-652f3d53617d@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_193715_469112_B6C1EE99 
X-CRM114-Status: GOOD (  23.54  )
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

On Sat, 2022-04-23 at 18:27 +0800, Krzysztof Kozlowski wrote:
> On 22/04/2022 08:01, Rex-BC Chen wrote:
> > We will use the infra_ao reset which is defined in mt8192-sys-
> > clock.
> > The maximum value of reset-cells is 2. Therefore, we add this patch
> > to
> > define it.
> 
> Remove entire last sentence, does not make sense in the commit.
> 

Hello Krzysztof,

Thanks for your review.
I will drop "Therefore, we add this patch to define it." and add more
detailed messages in next version.

> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  .../bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml       | 3
> > +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-
> > sys-clock.yaml
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-
> > sys-clock.yaml
> > index 5705bcf1fe47..28ebcecc8258 100644
> > ---
> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-
> > sys-clock.yaml
> > +++
> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-
> > sys-clock.yaml
> > @@ -29,6 +29,9 @@ properties:
> >    '#clock-cells':
> >      const: 1
> >  
> > +  '#reset-cells':
> > +    maximum: 2
> 
> Why this is a maximum? Usually this is const, so how do you use it
> (with
> what values)?
> 
We need to let the driver compatible with previous setting in
drivers/clk/mediatek/reset.c

There are two use cases in our reset driver:
(Refer to [1])

1. #reset-cells = <1>
   When we input the argument, the older driver
use is to calculate  
   bank and bit by different method. From the implementation of
   reset_xlate(), we can see if the argument number is 1, it will
   return directly.

2. #reset-cells = <2>
   The input arguments is offset and bit. When we input two arguments,
   we can use reset_xlate() to calculate the corresponding id to assert
   and deassert.

[1]:
https://lore.kernel.org/all/20220422060152.13534-10-rex-bc.chen@mediatek.com/

If it's acceptable, I will add this in commit message.

BRs,
Rex
> > +
> >  required:
> >    - compatible
> >    - reg
> 
> 
> Best regards,
> Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
