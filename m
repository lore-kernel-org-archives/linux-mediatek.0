Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA1DC432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 11:15:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F4CB61008
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 11:15:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F4CB61008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Pf8o439aCqFoJi21fOJGCWXmTScyFHYdVyhTtHASNI=; b=H+qgPGUk34YltA
	z611k2AXInvZ+4OBOn61k42ChhlXs5c+d55tCmNA6ETJR7HCLzIMcgXvzwD9cj5fZKFXtXfd6UtLj
	H6D3yoU+FMEd4grfSKF4KQGKWeglGV+cYN6+1H2pp2EUhv2lAN+g7dT7eiG9ESnoshi1xqu9hG8BU
	uUp96W6+qeM6nYZwBEFHUdw19Pf4VSBx/9Eh9wItPTRotjg+OOG8LhFBgqK5j1d7cBKMYe+Wwg6NI
	1sN+bvpmWTl0w0FdfGmsCL7Wr7dxmJFQxRcNpXoP2MVS7nf2Q9F6mYURiwDRlZRPNiXEY7PCPPo+H
	+dqwg+qTsK/KUuZByhJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLOCq-005Vtu-8x; Wed, 01 Sep 2021 11:15:00 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLNNP-005CJJ-32
 for linux-mediatek@lists.infradead.org; Wed, 01 Sep 2021 10:21:55 +0000
Received: by mail-lj1-x231.google.com with SMTP id m4so3962040ljq.8
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Sep 2021 03:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mgYfR3/CpQ3YFz8SbMrcJmhQtblgI9cHByyIJ0goOBI=;
 b=eWVsHdCtUIQxAlqIqaA9KKdn3ovd4zMoXEx2w4VxVZ4sy2vrn74BKX9DJH6nV6/1Al
 aLop/fzzMw45Lo6jMK04X/WVagNiH7iG2IYhIoKUvHwFiedVaFaXUiVBEdCcMUQwnJMd
 sVDmB0MR92tBXbGf2gdX/3C2Kc33dlgSVrhXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mgYfR3/CpQ3YFz8SbMrcJmhQtblgI9cHByyIJ0goOBI=;
 b=Tn2FtgxSQRV+lbe871JbFeLqXo95t612EcA1qglvrYKE9PDLqgrkgWoOMRviW0b5uG
 yTuG4eaWqRs7ZX6RPFM4YlYzR1Cw+I7/Luh+W5/bmyqB401rFFicVljdV3lUykf5nPYf
 w26iFLigsTcl9UlOeNNUJVucuQceOPCG58c7pwMrmPuNUieoXB2+8KqHHesn1ZDiuf3o
 dTHqZMG7qZsA6nM4jOm9Pk3r4fdy5H4QDXV/PTRdRYcdjb3hii6p7drA0dzgAYU7+aNk
 LXJfCyQEJ3tDm7AoiGp2Soi5Wqp6GOGlt1dCBrq6tyk2KgnO0x8LxK28XQ6EWHghTcQo
 kkAA==
X-Gm-Message-State: AOAM530Wkh4FMCojeEmmlhF/nuU0zZGzkjwT43JAwpud3pjeYNwiZPcz
 Z0++rgoI3oXCOHNH+yT8Gjh81bGeXGmc7NTG0EIIxA==
X-Google-Smtp-Source: ABdhPJyrlHHkley1jLqdJEA9M3j2B5m5WxNfwf3JuAH+EwmCKfYibJMfqcFndwA7usdLIL6NyzfXvJC3GLizwiSgejs=
X-Received: by 2002:a2e:964b:: with SMTP id z11mr17242550ljh.91.1630491708890; 
 Wed, 01 Sep 2021 03:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-3-zhiyong.tao@mediatek.com>
 <YS6pbO4hmNyX//tP@robh.at.kernel.org>
 <1630461636.21764.1.camel@mhfsdcap03>
In-Reply-To: <1630461636.21764.1.camel@mhfsdcap03>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 1 Sep 2021 18:21:37 +0800
Message-ID: <CAGXv+5H2-o91VGHwBUB_Gui1pa5m9jz6xTjHvP3+ue8=-ZWGvQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/4] dt-bindings: pinctrl: mt8195: change pull up/down
 description
To: "zhiyong.tao" <zhiyong.tao@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Wang <sean.wang@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 hui.liu@mediatek.com, 
 Eddie Huang <eddie.huang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>,
 Biao Huang <biao.huang@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, 
 Devicetree List <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_032151_196701_5E80A6FF 
X-CRM114-Status: GOOD (  26.06  )
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

On Wed, Sep 1, 2021 at 10:01 AM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> On Tue, 2021-08-31 at 17:13 -0500, Rob Herring wrote:
> > On Mon, Aug 30, 2021 at 08:36:01AM +0800, Zhiyong Tao wrote:
> > > Change pull up/down description
> >
> > Every commit is a 'change'. Your commit msg should explain 'why', not
> > what the diff is.
> >
> Hi robh,
> we will add 'why' explanation in the commit msg in v12.
>
>
> > >
> > > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > > ---
> > >  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 32 +++++++++++++++++--
> > >  1 file changed, 29 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > > index 2f12ec59eee5..a341ed9f0095 100644
> > > --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > > @@ -85,9 +85,35 @@ patternProperties:
> > >            2/4/6/8/10/12/14/16mA in mt8195.
> > >          enum: [0, 1, 2, 3, 4, 5, 6, 7]
> > >
> > > -      bias-pull-down: true
> > > -
> > > -      bias-pull-up: true
> > > +      bias-pull-down:
> > > +        description: |
> > > +          For pull down type is normal, it don't need add RSEL & R1R0 define
> > > +          and resistance value.
> > > +          For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
> > > +          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> > > +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
> > > +          define in mt8195.
> > > +          For pull down type is RSEL, it can add RSEL define & resistance value(ohm)
> > > +          to set different resistance. It can support "MTK_PULL_SET_RSEL_000" &
> > > +          "MTK_PULL_SET_RSEL_001" & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
> > > +          "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" &
> > > +          "MTK_PULL_SET_RSEL_111" define in mt8195. It can also support resistance value(ohm)
> > > +          "75000" & "5000" in mt8195.
> >
> > Sounds like constraints on the values. Please write a schema.
> >
> we will add a schema here in v12.

Could the description be written to encourage device tree authors to
use SI units instead of the macros?

Thanks
ChenYu

>
> Thanks
> > > +
> > > +      bias-pull-up:
> > > +        description: |
> > > +          For pull up type is normal, it don't need add RSEL & R1R0 define
> > > +          and resistance value.
> > > +          For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
> > > +          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> > > +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
> > > +          define in mt8195.
> > > +          For pull up type is RSEL, it can add RSEL define & resistance value(ohm)
> > > +          to set different resistance. It can support "MTK_PULL_SET_RSEL_000" &
> > > +          "MTK_PULL_SET_RSEL_001" & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
> > > +          "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" &
> > > +          "MTK_PULL_SET_RSEL_111" define in mt8195. It can also support resistance value(ohm)
> > > +          "1000" & "1500" & "2000" & "3000" & "4000" & "5000" & "10000" & "75000" in mt8195.
> > >
> > >        bias-disable: true
> > >
> > > --
> > > 2.18.0
> > >
> > >
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
