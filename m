Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1C2C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 01:49:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC075610A1
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 01:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC075610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4NTyQNoyrB44cYO4a6hSmilmtO+kGlygVgnBrq9RPAg=; b=xW8hIfkO8dA0q8
	3+dmGUt8FJ9fJdUMguaP/E/SuvC8YsoExahGX5AHt5ubp/0dYp6ojTBpJT+30Mmf72BfjURynU4lv
	EQgJTdc436ZdJFw3rHBKq50aZYl0Q0lpuoKSx0YI4STRzs6TyUEVTmOhQdtdAGeSFZQEY+xfr9669
	DGMDW2hNiZ3LGb/Rk421+NFEYNN1iYBbCOWhOXpa0Ra2YsVqc8tGqvzt9+SCvEnr1Yi/hmj/SjeeW
	0jxaskN3YrqyCHyGVPiRThLDoxYXNR90TCw2NlWm/ByQFOUNc3BLCISro5CUPWZa3fxFRNNqoqzlJ
	dLwhgd75FTth8Ewc5f7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGXBM-006vbK-GJ; Thu, 19 Aug 2021 01:49:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGXBF-006vam-A7; Thu, 19 Aug 2021 01:49:22 +0000
X-UUID: 3b41ba6253c8434d8089bbc88efdeff2-20210818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MOTnvcQQrwrHuNmCbimBA8R95Q1U0tJMkIAyT1uMvqQ=; 
 b=INX3C4C0uycC6wywqBZoreUlRIQy+3fyjNEsZBxWidcmbb3sn5sAQVDYorQPQlZSxYsSHXqXfrgdgJ8l8bXYTfjCeTQjdH959c+VfTItGeZymPAhhjQqD+z1kkHlKOaLv5CXDKXhv8Dvo54/RNj2G7d+vQTL0rgSLl14T7vnb50=;
X-UUID: 3b41ba6253c8434d8089bbc88efdeff2-20210818
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1638007983; Wed, 18 Aug 2021 18:49:11 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 18:49:10 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 09:49:08 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 Aug 2021 09:49:07 +0800
Message-ID: <dff9c2c8358594a15fab543415bc084058d33bb7.camel@mediatek.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>, Eddie Huang
 <eddie.huang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>, "Biao
 Huang" <biao.huang@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open
 list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Date: Thu, 19 Aug 2021 09:49:08 +0800
In-Reply-To: <CAGXv+5EUAVFJd7VZsDgpOK_6fhs12ztwKHioghq5ZQHzFKY89w@mail.gmail.com>
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
 <CAGXv+5EUAVFJd7VZsDgpOK_6fhs12ztwKHioghq5ZQHzFKY89w@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_184918_814707_DE3B6EA5 
X-CRM114-Status: GOOD (  34.23  )
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

On Wed, 2021-08-18 at 14:25 +0800, Chen-Yu Tsai wrote:
> On Wed, Aug 18, 2021 at 4:09 AM Linus Walleij <
> linus.walleij@linaro.org> wrote:
> > 
> > On Tue, Aug 17, 2021 at 9:51 AM zhiyong.tao <
> > zhiyong.tao@mediatek.com> wrote:
> > 
> > > In one chip, If GPIO is different, the MTXXXX_PULL_UP_RSEL_001
> > > may
> > > means different actual bias resistance setting.
> > > 
> > > For example,
> > > 
> > > KPROW IO
> > > Paramters       Descriptions                   Min      Typ     M
> > > ax
> > >  UNIT
> > > Rpd     Input pull-down
> > > resistance      40      75      190     Kohm
> > > Rpu     Input pull-up
> > > resistance        40      75      190     Kohm
> > > Rpd     Input pull-down
> > > resistance      0.8     1.6     2       Kohm
> > > Rpu     Input pull-up
> > > resistance        0.8     1.6     2       Kohm
> > 
> > This is exactly why we should try to use SI units in the device
> > tree.
> > I assume that the software can eventually configure which
> > resistance
> > it gets?
> > 
> > The electronics people will say make sure it is pulled down by
> > around
> > 80 kOhm, they can put that on the device tree and your code can
> > say, "hm 40 < 80 < 190 this is OK" and let the value pass.
> > 
> > We do not define these exact semantics, it is up to the driver code
> > to decide what to do with the Ohm value 80000 in this case, but
> > it makes perfect sent for me to let it pass and fail if someone
> > for example requests 20 kOhm, or at least print a helpful warning:
> > 
> > dev_warn(dev, "the requested resistance %d is out of range,
> > supported
> > range %d to %d kOhm\n",
> >                  val, low, high);
> > 
> > This is what makes the SI units really helpful for people writing
> > device
> > trees: solve real integration tasks and make it easy to do the
> > right thing.
> 
> I think this makes a lot of sense. The driver could select the
> closest
> setting. And from what Zhiyong mentioned offline, the resistor values
> aren't exact as specified in the datasheet. I suppose this is
> expected
> with any electronics. So the hardware integration will say to pull up
> or down by some value, and the driver will do its best to fulfill
> that
> request. That precludes DT schema checking for the values used, but I
> think that is a good compromise.
> 
> Zhiyong also mentioned that some of their downstream integrators
> might
> not be able to deal with actual values, and would prefer symbols tied
> to specific RSEL values. I think that would be doable together using
> some _magic_ values, but I would prefer not to if it were avoidable.
> 
> 
> Regards
> ChenYu

Hi chenyu & Linus,

Thanks for your suggestion.

we will try to update a new version to use SI units in the device tree
in the rsel feature patch.

Thanks
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
