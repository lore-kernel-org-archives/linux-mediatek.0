Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E21C4320A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 06:26:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1224B61056
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 06:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1224B61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K+opqTFwMwPmL6pMo1FvHcT7Hw+qB/TwX+ySQV4h6zU=; b=go6HyXol3DD1fC
	wHeHc5sEjfTxfpHlRcas0Ecg/oQ+YFCwuuwTGOfaUEHaeDYRRvWiLa94ytALZpuvoE/vkMLmFlB7s
	SwOGGYLGEmsoxBtfGiEV2OcrTMu+U+MUi56HqcT1KoH/wmeRitNATJOKIn4g5l9pcbghRJDRFwunH
	oMXu6UaESdvnbujCJ08/4IhICu/1ndl6X2tfkJwFdV1TFvDiVsy5kfAEaZ4BuMN6cnsXhDkjvOibT
	He7NVlblICYkfNZkLHh7lqzwOkV/j8ZbS8RVIz8rYSWp8JE+Z7IwvhVsUkw9MgUVkdAf660SKjd93
	VB3SKmtx+okESAGJg1OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGF1t-004MjT-2p; Wed, 18 Aug 2021 06:26:25 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGF1c-004MhS-DI
 for linux-mediatek@lists.infradead.org; Wed, 18 Aug 2021 06:26:12 +0000
Received: by mail-lj1-x22e.google.com with SMTP id i28so3051913ljm.7
 for <linux-mediatek@lists.infradead.org>; Tue, 17 Aug 2021 23:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0niOOKpLOqJWr+G2N4qsyCfMLmKR4C8+b8TBbZbKaU8=;
 b=Et8efFBgzM1OWhTpqkovSGInq7BYnqTenDPJF5Sfp/8L2BDfO3pcqtdv6gK9Xf6rVi
 bPlFqq3u2Mlnv1Oxq7zttZXNhuIFaIoCKH5Il61HHre6WKqQXBgZ2rtyo6Ql01WiAgAf
 iqwYaadnd/cBDGdzYU20uWob0rjtS561A0+w4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0niOOKpLOqJWr+G2N4qsyCfMLmKR4C8+b8TBbZbKaU8=;
 b=dFv40pf6oLRC0FJFIKI4/B4f74qLZFgulEMRey2Z4BxpjuR3sC9wLGEB89sr+v3xA0
 Me9LzMZc0BbhoDqG5kN5lZb24ZL2XeJdKSXYzOzLzRsXCDJnIhy34Xv2jPg7yCMrDHjM
 JS74UmqUm/EN1Vpd4jawBwhYVzzlISH8/K3gZy7HqWfCSzx4tk5PooPnADcW1YuV6x2b
 kSKe9FcdX0MQATJsNOcCP4c1o5A5E9grlpNHSH0j80NUJmFA4SGYpsVS0XoNdSvMKIgg
 25QN9Uy+qNW82GlAXxSv8U0YScR6UkDeBW0hEbc4ZeIlSBShUa3D7BqRfXN0KNc4i9rt
 eP2g==
X-Gm-Message-State: AOAM530rQLK/btmx6C44suti2rWolUK5sePo5mF727vm5PFJbsuYxvCG
 KLv44dPSkRLzA5cf0490QoTJUUdrzcBczPPvl14xDA==
X-Google-Smtp-Source: ABdhPJycOOwNmb0zD73kqTDlXcUFSNdJdOw1Y3p1pB/PjGtP3t4iluned8prH8xjVYxNIs08EqJIS54IEOaxSu1nOPY=
X-Received: by 2002:a2e:7d0e:: with SMTP id y14mr6438392ljc.251.1629267965676; 
 Tue, 17 Aug 2021 23:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210710081722.1828-1-zhiyong.tao@mediatek.com>
 <20210710081722.1828-2-zhiyong.tao@mediatek.com>
 <CAGXv+5GXg0RuOQkh4vaRmcLpehZiXnEUXBvEaObiatAa1sXvaA@mail.gmail.com>
 <1626940470.29611.9.camel@mhfsdcap03>
 <CAGXv+5F_-W4aNt0WVSDBGLo_t8orNUq59GMKk_4xVr+hMb9Ctg@mail.gmail.com>
 <07388dac4e25e0f260725e8f80ba099d5aa80949.camel@mediatek.com>
 <CAGXv+5EagmhYYpri+nzo6WgGz8A=oiU3Vy+2AVjho=eo6Z+DLw@mail.gmail.com>
 <CACRpkdZ4k9Km3vBtdN6AnBM89c4355GtPMzCQ0_YHaTb4V5cKA@mail.gmail.com>
 <CAGXv+5HohMwU8jow5QXO5MK1tO+u=5YsfhArBWCP4Dgm1Q8igg@mail.gmail.com>
 <4fd12d5c53f6492e5fa3ba94a78b9a149f5b6ed9.camel@mediatek.com>
 <CAGXv+5GCuNK=-z9VAOjkpJdZLUSZFPfUsQ09m1FhfTsbCYLLRw@mail.gmail.com>
 <CACRpkdbZKh8cqqiDRUik6Ooo33e+feGwYsLjcLRvBQnT3x5M3A@mail.gmail.com>
 <a7c8ab68ac3513865698cde27e665bdd554f459e.camel@mediatek.com>
 <CAGXv+5FtL2zaSWx4tUymx6mpCSb5dXG4XNWM9AJL+b6Ok3dxMg@mail.gmail.com>
 <d40f6d5fd26aedb13e7a393202e5794b1893ecf8.camel@mediatek.com>
 <CACRpkdYkwXr76Kq5WYdz=1KkLTpaByAL1vJFo8V+2mncqs8-3Q@mail.gmail.com>
In-Reply-To: <CACRpkdYkwXr76Kq5WYdz=1KkLTpaByAL1vJFo8V+2mncqs8-3Q@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 18 Aug 2021 14:25:54 +0800
Message-ID: <CAGXv+5EUAVFJd7VZsDgpOK_6fhs12ztwKHioghq5ZQHzFKY89w@mail.gmail.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
To: "zhiyong.tao" <zhiyong.tao@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
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
X-CRM114-CacheID: sfid-20210817_232608_500025_2801BDC6 
X-CRM114-Status: GOOD (  25.46  )
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

On Wed, Aug 18, 2021 at 4:09 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, Aug 17, 2021 at 9:51 AM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> > In one chip, If GPIO is different, the MTXXXX_PULL_UP_RSEL_001 may
> > means different actual bias resistance setting.
> >
> > For example,
> >
> > KPROW IO
> > Paramters       Descriptions                   Min      Typ     Max
> >  UNIT
> > Rpd     Input pull-down resistance      40      75      190     Kohm
> > Rpu     Input pull-up resistance        40      75      190     Kohm
> > Rpd     Input pull-down resistance      0.8     1.6     2       Kohm
> > Rpu     Input pull-up resistance        0.8     1.6     2       Kohm
>
> This is exactly why we should try to use SI units in the device tree.
> I assume that the software can eventually configure which resistance
> it gets?
>
> The electronics people will say make sure it is pulled down by around
> 80 kOhm, they can put that on the device tree and your code can
> say, "hm 40 < 80 < 190 this is OK" and let the value pass.
>
> We do not define these exact semantics, it is up to the driver code
> to decide what to do with the Ohm value 80000 in this case, but
> it makes perfect sent for me to let it pass and fail if someone
> for example requests 20 kOhm, or at least print a helpful warning:
>
> dev_warn(dev, "the requested resistance %d is out of range, supported
> range %d to %d kOhm\n",
>                  val, low, high);
>
> This is what makes the SI units really helpful for people writing device
> trees: solve real integration tasks and make it easy to do the right thing.

I think this makes a lot of sense. The driver could select the closest
setting. And from what Zhiyong mentioned offline, the resistor values
aren't exact as specified in the datasheet. I suppose this is expected
with any electronics. So the hardware integration will say to pull up
or down by some value, and the driver will do its best to fulfill that
request. That precludes DT schema checking for the values used, but I
think that is a good compromise.

Zhiyong also mentioned that some of their downstream integrators might
not be able to deal with actual values, and would prefer symbols tied
to specific RSEL values. I think that would be doable together using
some _magic_ values, but I would prefer not to if it were avoidable.


Regards
ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
