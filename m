Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5D8C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 21:25:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6BC960FDB
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 21:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6BC960FDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WJKr/5hkxC/IoHvsgCp6n4cxsf6JQoItclkCTX3tWrQ=; b=h0bSnN8e7XvpUoHUHNMY1akir
	Q0IVGWr072DsQRDKQ/yGP8NFseIvN1D9hStVvizTw/q1HI4iR8hBwkTFVhSi67yEFo5Sqcg6BIR6C
	QH2RcFQf8CireRdhnMr9ial6hjM5Twdtdq8ejkl6VO+fJa04OyfjdQq97T80iIM3/gSpGCpGjnxbn
	nveg/xN7sNWRmRM8A7rNtfakTRVaU9+gmmzB15zOOe0Jjp+tRlNGnCXnqSSLBGCk8GDPaVbCnCrX9
	68obKvYVMLAGRTQ47Y8Z4SkkutHwqiVmryS2yCNNYnccP5ZgpiEnjbcCrdDaSYwce+tYOV1jNrC0A
	aCutdGc1w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lX9UE-00HOyi-1M; Thu, 15 Apr 2021 21:25:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX9U1-00HOwP-Mb; Thu, 15 Apr 2021 21:25:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=c9scaIssXdq/UWor4TPj5fBHM3FwG50NkM/glSUGJA8=; b=p87VKF4huLBtGbzrBYZmTL1hJY
 bv2IpFUO41QYcsXhhiUqlkvmLpAo+HoqTbe2Xnvok+VvdVOmTGnU6Z72AeRUMijlhXsapApM1RR62
 QO4fpFZcPvxhUdvvdSGgc+Yam4bCK/sXFOrqEcChwEV4/qnGh6nYhDhSwiqr37s0b+CI3VcQmPjDW
 jEVx+7cdx4bp+sYAaL5cT86oHD1X9TLJhKZh/yRHgHRPz70VY3eSexP0Ec/4CVwye6OsjYWVJcZpu
 yU8d/lh22oM7jCqCy3EZwc5ZfEKN8OV2bGlslZN8lEO0TEt8SHrP1mwvNtGIafCgh0Pmgf2Jw+CHU
 rSbZlXxA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lX9Ty-008u35-V0; Thu, 15 Apr 2021 21:25:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91BDE60FDB;
 Thu, 15 Apr 2021 21:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618521902;
 bh=wAzWz1t/6xImauPcT3XLaMkS802uQtcKstpMe9mSozY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=E/51QtVt+JZLl5YJKUji4jjUv0dBmA0cmazs/5w6+Bc4wZzO5QnL2dejEJKPWm3Nz
 blOgsYGjclj6JlD5IGboMfeGiQ+yiXB0FaNPitc6n+Pgc/BPT4z4QUAn8LElc43w2p
 DW0iYl09HZIPMm0/dSBmP6P7h0NNhw9kIp61XrB2T4R+z31rL4dpIhDyAXI0P+/egD
 PKDC65q1VxcwFiaRYagT0Ob/+o2VdMqInrUvQpaSh8X9S4oseMskkKhQEu7aHiu4Pa
 Rjns9bJQt/R4aYcJnf1arUZqeetP5o8esJ0rxv9BXDiQWIGv52jx2HETOIhpRi/JxD
 Q8daW7WZwkObA==
Received: by mail-qk1-f177.google.com with SMTP id o5so26865337qkb.0;
 Thu, 15 Apr 2021 14:25:02 -0700 (PDT)
X-Gm-Message-State: AOAM53282vE1mpUdGca/IzgEMGdr9gbC2M9bpCvAa+0NywcRd9DgZbKd
 dmRZ/gdnpbWfOirT/aZY0bldGkboD+CWUCAx1Q==
X-Google-Smtp-Source: ABdhPJwEOtVU/PBX8pl5Ub9lOQ0rQ9elsjO6RSPqK7TVDKWJEeKEiIDMHMw6Ipuhxv6/Qi8T03BgwK/XvLFUmMN9Nds=
X-Received: by 2002:a37:84b:: with SMTP id 72mr5665420qki.464.1618521901808;
 Thu, 15 Apr 2021 14:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <1617766086-5502-1-git-send-email-flora.fu@mediatek.com>
 <1617766086-5502-5-git-send-email-flora.fu@mediatek.com>
 <20210409182538.GA3913794@robh.at.kernel.org>
 <1618209895.25062.11.camel@mtksdccf07>
In-Reply-To: <1618209895.25062.11.camel@mtksdccf07>
From: Rob Herring <robh@kernel.org>
Date: Thu, 15 Apr 2021 16:24:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLKaYY=NHm1hD=YaQgvDOBTtraoUqcycA7tu7n-f2GVDw@mail.gmail.com>
Message-ID: <CAL_JsqLKaYY=NHm1hD=YaQgvDOBTtraoUqcycA7tu7n-f2GVDw@mail.gmail.com>
Subject: Re: [PATCH 4/8] dt-bindings: arm: mediatek: Add new document bindings
 for APU
To: Flora Fu <flora.fu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, 
 Pi-Cheng Chen <pi-cheng.chen@mediatek.com>,
 Chiawen Lee <chiawen.lee@mediatek.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_142503_066143_8E6427F4 
X-CRM114-Status: GOOD (  21.60  )
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

On Mon, Apr 12, 2021 at 1:45 AM Flora Fu <flora.fu@mediatek.com> wrote:
>
> On Fri, 2021-04-09 at 13:25 -0500, Rob Herring wrote:
> > On Wed, Apr 07, 2021 at 11:28:02AM +0800, Flora Fu wrote:
> > > Document the apusys bindings.
> > >
> > > Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> > > ---
> > >  .../arm/mediatek/mediatek,apusys.yaml         | 56 +++++++++++++++++++
> > >  1 file changed, 56 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml
> > > new file mode 100644
> > > index 000000000000..dc04a46f1bad
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apusys.yaml
> > > @@ -0,0 +1,56 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: https://urldefense.com/v3/__http://devicetree.org/schemas/arm/mediatek/mediatek,apusys.yaml*__;Iw!!CTRNKA9wMg0ARbw!3ryKFTA2CvsVss4Pt2ZOG7wv4jgR-2LPxuGn30IxFmpxoxSRdzNdf8FrAYYvZWcw$
> > > +$schema: https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!3ryKFTA2CvsVss4Pt2ZOG7wv4jgR-2LPxuGn30IxFmpxoxSRdzNdf8FrARlhCQ0w$
> > > +
> > > +title: MediaTek APUSYS Controller
> > > +
> > > +maintainers:
> > > +  - Flora Fu <flora.fu@mediatek.com>
> > > +
> > > +description:
> > > +  The Mediatek apusys controller provides functional configurations and clocks
> > > +  to the system.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +          - mediatek,mt8192-apu_mbox
> > > +          - mediatek,mt8192-apu_conn
> > > +          - mediatek,mt8192-apu_vcore
> >
> > s/_/-/
> >
>
> OK. I will update expression strings in the next version.
>
> > > +      - const: syscon
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  '#clock-cells':
> > > +    const: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    apu_mbox: apu_mbox@19000000 {
> >
> > mailbox@...? Is this a mailbox provider?
> >
>
> Yes, the apu_mbox is the for setup mailbox in the APU hardware.

Then you need #mbox-cells here.

And in that case, what makes it a syscon?

>
> > > +        compatible = "mediatek,mt8192-apu_mbox", "syscon";
> > > +        reg = <0x19000000 0x1000>;
> > > +    };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
