Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF66C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 09:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHvEfcxyAGflW6698PJ2M8/StPZZbijpvoICHSbf4PM=; b=XWYgsBODlFJmOI
	mXWGCb7QMXDLXIJjMtExQCzB8odVoc5m2gOFUMvzY5FIJQNSfnTBw7fkUXN3PZVoGEefSisbPX/M7
	H8ijzK801LG3TYTY+4UehLSwgcqxMp4xDZ8Vn+7mb6gXw8TL3VEehKS63nsK3iY52TI6e194rbtTZ
	a6xCf1zbR9vsVWjqf/uy2u07w3DIhDFqHJ8klnYLJMpGtd5KpUeiUU9oZ5DA3FC6mgNBk/ZO3akSX
	aeQYrEFWafkkKc1jixD5qWBrZtn42A053CKrI2ZAyjbGju3kHKlx/UUItnAb9SRov9R1hwJqko0Ug
	3enb6fjMxYVQmAxW3cyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrzJi-00Bico-7W; Fri, 20 May 2022 09:53:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzJT-00Bi6D-9e; Fri, 20 May 2022 09:52:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=QzHENAQV4EE0A7ldyY32dejH25BESVoHhvpfT0Fn8bI=; b=ZO51ku7ewBqWF536k5rxLfFMwn
 NC6Xche6rtEOHXV1Z6s2lPowhnoViKesXWiYUd/N+kJsd6Ebj4ggyWURXP50iTsiDsiOdBgNpY0ZE
 2DrL9/gZUwD7aGdOf8u0M5VyBviGli84KU6w7Ja9oU6INq/MOwQe5DLXCP/C2wt0RcULBqIrVxOGy
 n8BEe5Ou9GegyjzL6iK6te1c0Zro4aOHfh2Y4b64nG+1qWer8LuGfnbQak4+04rwnZRCy/1nblsxN
 UqqsPdseLd0Ld21Z62TNsMe8l6pSwzEAg7c0u9q6qv3BEItgJ2I73S4RPAguAohL8a7HeDCo20G2y
 vdzCkpFg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrz8E-002I7p-Dl; Fri, 20 May 2022 09:41:19 +0000
X-UUID: 99d121feb05a4f10870ecc89346d6437-20220520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:bf4ff35f-8179-4fd5-a930-f197eda25ddd, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:7789007a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 99d121feb05a4f10870ecc89346d6437-20220520
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 723349765; Fri, 20 May 2022 02:40:58 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 02:40:56 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 17:40:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 May 2022 17:40:54 +0800
Message-ID: <9b6e304e69e0d6064893534831d70df58f932843.camel@mediatek.com>
Subject: Re: [RESEND v4 1/2] dt-bindings: interconnect: Add MediaTek CCI
 dt-bindings
From: Johnson Wang <johnson.wang@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: <cw00.choi@samsung.com>, <krzk+dt@kernel.org>, <robh+dt@kernel.org>,
 <kyungmin.park@samsung.com>, <djakov@kernel.org>, <khilman@kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <jia-wei.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 20 May 2022 17:40:54 +0800
In-Reply-To: <CAGXv+5FqjDX7y_bR0Y=2xCnCqwtAB2S+3Fn==adxJJqanv8=YQ@mail.gmail.com>
References: <20220513032832.17645-1-johnson.wang@mediatek.com>
 <20220513032832.17645-2-johnson.wang@mediatek.com>
 <CAGXv+5FqjDX7y_bR0Y=2xCnCqwtAB2S+3Fn==adxJJqanv8=YQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_104115_256305_C603CBC1 
X-CRM114-Status: GOOD (  23.51  )
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

On Fri, 2022-05-13 at 11:35 +0800, Chen-Yu Tsai wrote:
> On Fri, May 13, 2022 at 11:31 AM Johnson Wang <
> johnson.wang@mediatek.com> wrote:
> > 
> > Add devicetree binding of MediaTek CCI on MT8183 and MT8186.
> > 
> > Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> > ---
> >  .../bindings/interconnect/mediatek,cci.yaml   | 140
> > ++++++++++++++++++
> >  MAINTAINERS                                   |   1 +
> >  2 files changed, 141 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> > b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> > new file mode 100644
> > index 000000000000..034c3b38ca3d
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> > @@ -0,0 +1,140 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: 
> > https://urldefense.com/v3/__http://devicetree.org/schemas/interconnect/mediatek,cci.yaml*__;Iw!!CTRNKA9wMg0ARbw!0vYE2yw5meNp-VKz6-Xp4C_qT8rz0tpzc0iPAGI__dVczbtBVpOcQfxdrQADjIdqtgDrrni0ZKWuBFP1QcwD0mHhOw$
> >  
> > +$schema: 
> > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!0vYE2yw5meNp-VKz6-Xp4C_qT8rz0tpzc0iPAGI__dVczbtBVpOcQfxdrQADjIdqtgDrrni0ZKWuBFP1QcxLQ8hn_A$
> >  
> > +
> > +title: MediaTek Cache Coherent Interconnect (CCI) frequency and
> > voltage scaling
> > +
> > +maintainers:
> > +  - Jia-Wei Chang <jia-wei.chang@mediatek.com>
> > +  - Johnson Wang <johnson.wang@mediatek.com>
> > +
> > +description: |
> > +  MediaTek Cache Coherent Interconnect (CCI) is a hardware engine
> > used by
> > +  MT8183 and MT8186 SoCs to scale the frequency and adjust the
> > voltage in
> > +  hardware. It can also optimize the voltage to reduce the power
> > consumption.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - mediatek,mt8183-cci
> > +      - mediatek,mt8186-cci
> > +
> > +  clocks:
> > +    items:
> > +      - description:
> > +          The multiplexer for clock input of the bus.
> > +      - description:
> > +          A parent of "cpu" clock which is used as an intermediate
> > clock source
> 
> Replace "cpu" with "bus"?
> 
> > +          when the original CPU is under transition and not stable
> > yet.
> 
> 
> And also, "when the original clock source (PLL) is under transition
> ..."
> 
> Otherwise,
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Hi Chen-Yu,

I will modify them in the next version.

BRs,
Johnson Wang


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
