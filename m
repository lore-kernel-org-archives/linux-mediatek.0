Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B45E9C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:08:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71B5860F55
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 10:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 71B5860F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lpf6/0+9E4Bzar4NX/p2yhPn1lCzZbUSEH1tudf5Lhk=; b=QTe9tlCDIZD6s8
	9VUjokpm/1MvaFZWgHw+8vfIglJYlBeJgPCjqC9jAOb1B9+0Gli6uQbpyKrzQc4wLG8a1R0E1cyVL
	MaWbmRr+v/Um56/zvLimoL1io0mdtJkbiCmOq3Y1seUwNP3iOmOx8DLZAWge+I58rUB9udq+yADwK
	p4fJakkWMvkX2v3Kl93R0VhIVpUvqd2NDsnko+MxBuzJxIbX7rGuQuNtwZ2GGhV5nspu6J2W7YNSl
	bJp+S1cfdkeYl2jRyNRNM7ta746qevR8ckNt6hlkW/i2aC9fLhu8HlaoYo2qRKL3P8w9bjkBucQ6V
	jSbFtJqaDy9OuhjXaE0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7xXQ-00AdJI-4C; Mon, 26 Jul 2021 10:08:44 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7xXN-00AdHx-LU; Mon, 26 Jul 2021 10:08:43 +0000
Received: by mail-ot1-x32e.google.com with SMTP id
 c2-20020a0568303482b029048bcf4c6bd9so8114514otu.8; 
 Mon, 26 Jul 2021 03:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F1W8BM33E8I7Rg6qQkHpIq24nb3jtDXTVrJEtrhyQpY=;
 b=mhxSo+BtVhr0w+J9JSXO8eV4u/xQHPXbnkT1CJPffjjbaxEUzQHPRFm9j8Er6+4DyB
 7jFZhKMOOZ/9DEfrCUmxS3cO4159fI3JHkWf+itkWMBYAXmhPG4T6qO0/hJM/ecd6KRM
 +fBwalsP8KMrcDjZPg/r1d9qdCagN6ec2r9TQgaWMnpldEetamoI1WIPPPrwyFzhGQcR
 Jh/3NOTVKIMMWCUYMXSZHv8rD0/eOWpgxdbYDnwJNUITjcPzQHNjZaNc6zmZstvviRjl
 PbVDcIszcZEdawhBkh2zIjxEd2nqOiuIIUkx1TpoU8MGw265fNFfAYcCZ1x97CLBxr+T
 BeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F1W8BM33E8I7Rg6qQkHpIq24nb3jtDXTVrJEtrhyQpY=;
 b=ePOB5jl3ET5B9xDvWdaIuRR2/MMXojT4AAEwbF/7D0UId2cImoBvH4bZSAXDV5sFWf
 ir3kjQ4cfUPTMfPj6OjdS1SFGJ96ZWR81uMl3bB625Av6ZdjW7R2/m+Edu01rvDZEFgH
 Ah3meqnZBeYWeoN9CgRfF3FTMyuPcb7HYxq67HzpcvnuInDalMdMfiGw32R6redX0gYe
 9mt643sx7VsyfN88QiN1tcZdVzcvj8GegcR7W3qYbSLeICRZIRuHSwhnhviq7n+pGr3P
 A6weTzWEJ4I0mGJU0BSbsyeHhkZILziSrLyLFDHP0ex4OpNcuQC+LrXN2q4YsZ9ZBoaC
 sBDA==
X-Gm-Message-State: AOAM5320FPHdk4nCJyvAc9wuI5yV2YmLKS5sDvhHkcNsnHMxAIVYmlaH
 3nBMq4n7Fhv3Q1xgU3vX72aTI9JQ/6+xDvjk4+0=
X-Google-Smtp-Source: ABdhPJwcFKNYI6+KwnCa9bmjN5KGLG4/G0IOcDqm6ZBsn9Z8heUe+7xQBKSswL+u6yHDGeIWzLR0FC8ZXJ5dmHqbbiY=
X-Received: by 2002:a9d:6490:: with SMTP id g16mr1584823otl.184.1627294120561; 
 Mon, 26 Jul 2021 03:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210722092624.14401-1-jason-jh.lin@mediatek.com>
 <20210722092624.14401-2-jason-jh.lin@mediatek.com>
 <CAFqH_51qKkxMit5fkSh_AyeNAYwKnoPe09nwJLKaKez26+HUew@mail.gmail.com>
 <4c0fe16988c559a5a4b1ce714eeaa31f4628f68f.camel@mediatek.com>
In-Reply-To: <4c0fe16988c559a5a4b1ce714eeaa31f4628f68f.camel@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Mon, 26 Jul 2021 12:08:28 +0200
Message-ID: <CAFqH_512RCNBufS=zL5hQSQJya3565dm2D3zznWie9rKUN_sAw@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] dt-bindings: arm: mediatek: mmsys: add mt8195 SoC
 binding
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree <devicetree@vger.kernel.org>, 
 Jitao shi <jitao.shi@mediatek.com>, fshao@chromium.org, 
 David Airlie <airlied@linux.ie>, singo.chang@mediatek.com, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Fabien Parent <fparent@baylibre.com>, "Nancy.Lin" <nancy.lin@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_030841_766848_DA61DDE5 
X-CRM114-Status: GOOD (  31.66  )
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

Hi Jason,

Missatge de Jason-JH Lin <jason-jh.lin@mediatek.com> del dia dl., 26
de jul. 2021 a les 9:02:
>
> On Fri, 2021-07-23 at 13:13 +0200, Enric Balletbo Serra wrote:
> > Hi Jason,
> >
> > Thank you for your patch.
> >
> > Missatge de jason-jh.lin <jason-jh.lin@mediatek.com> del dia dj., 22
> > de jul. 2021 a les 11:26:
> > >
> > > There are 2 display hardware path in mt8195, namely vdosys0 and
> > > vdosys1, so add their definition in mtk-mmsys documentation.
> > >
> >
> > Just having 2 display hardware paths is not a reason to have two
> > compatibles, isn't the IP block the same? Why do you need to
> > introduce
> > the two compatibles?
> >
> > Thanks,
> >   Enric
> >
>
> Hi Enric,
>
> Thanks for reviewing my patch.
>
> The reason for using two compatibles is that vdosys0 and vdosys1 are
> different IP blocks.
>

With that there are different IP blocks, what do you mean? Do you mean
that there are two completely different blocks with completely
different functionalities?

Or that there is the same IP block twice? I mean, of course, the
registers are different but has exactly the same functionality.

> Because mmsys provides clock control, other display function blocks may
> use them as clock provider.
>
> E.g.
> 1. mmsys with compatible="mediatek,mt8195-vdosys0"
> [v4,1/6] arm64: dts: mt8195: add display node for vdosys0
>
> https://patchwork.kernel.org/project/linux-mediatek/patch/20210723090233.24007-2-jason-jh.lin@mediatek.com/
>
> ovl0: disp_ovl@1c000000 {
>         ...
>         clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
>         ...
> };
>
> 2. mmsys with compatible="mediatek,mt8195-vdosys1"
> [v2,06/14] arm64: dts: mt8195: add display node for vdosys1
>
> https://patchwork.kernel.org/project/linux-mediatek/patch/20210722094551.15255-7-nancy.lin@mediatek.com/
>
> vdo1_rdma0: vdo1_rdma@1c104000 {
>         ...
>         clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
>         ...
> };
>

Note that I am talking without knowing the hardware in detail, but I
am wondering why I can't have something like this, where every mmsys
is a clock and reset controller provider.

vdosys0: syscon@14000000 {
          compatible = "mediatek,mt8195-mmsys", "syscon";
          reg = <0 0x14000000 0 0x1000>;
          #clock-cells = <1>;
          #reset-cells = <1>;
};

vdosys1: syscon@15000000 {
          compatible = "mediatek,mt8195-mmsys", "syscon";
          reg = <0 0x15000000 0 0x1000>;
          #clock-cells = <1>;
          #reset-cells = <1>;
};

ovl0: disp_ovl@1c000000 {
        ...
       clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
        ...
};

vdo1_rdma0: vdo1_rdma@1c104000 {
        ...
        clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
        ...
};

What are the differences between vdosys0 and vdosys1 from a hardware
point of view?

Cheers,
  Enric

> Regards,
> Jason-JH.Lin
>
> > > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > > ---
> > > this patch is base on [1][2]
> > >
> > > [1] dt-bindings: arm: mediatek: mmsys: convert to YAML format
> > > -
> > > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210519161847.3747352-1-fparent@baylibre.com/__;!!CTRNKA9wMg0ARbw!ycgPEK4yBDojiiZJC2E9mGwvxJbaLqhyUxzJIq0ckEP-JVteBcjFdc6ixkNbmknH8f2P$
> > >
> > > [2] dt-bindings: arm: mediatek: mmsys: add MT8365 SoC binding
> > > -
> > > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210519161847.3747352-2-fparent@baylibre.com/__;!!CTRNKA9wMg0ARbw!ycgPEK4yBDojiiZJC2E9mGwvxJbaLqhyUxzJIq0ckEP-JVteBcjFdc6ixkNbmju2GBrD$
> > >
> > > ---
> > >  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        |
> > > 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > > l
> > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > > l
> > > index 2d4ff0ce387b..0789a9614f12 100644
> > > ---
> > > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > > l
> > > +++
> > > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
> > > l
> > > @@ -30,6 +30,8 @@ properties:
> > >                - mediatek,mt8173-mmsys
> > >                - mediatek,mt8183-mmsys
> > >                - mediatek,mt8365-mmsys
> > > +              - mediatek,mt8195-vdosys0
> > > +              - mediatek,mt8195-vdosys1
> > >            - const: syscon
> > >        - items:
> > >            - const: mediatek,mt7623-mmsys
> > > --
> > > 2.18.0
> > >
> --

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
