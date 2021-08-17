Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6E6C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 07:54:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DA556023B
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 07:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DA556023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmQ020LUj6ZVgsE9nKLSxF26Pu8n7eJBxStYHgD+mhE=; b=zrCt8ZxX7EWe39
	sSsEMoani1AaGkqCHA8IY20twX96kday8vL+poNke3bZ0NSHmBlsX5MiEzJMvyzhVcpB6uyYvTjzU
	UnVA9QKYlFlYJt9ejMIxXbJgisRTHOxnwaR3tvo946SHPke5He7VQOvAA8oJN7O4mrZAiKSf8wxog
	Nt8cRADS2ZbFzRoZG/R+O2u+jUjdRc7Iq+XEWWt1dhz96W3XkVNS3DUQUGqaWXiW4EKmtx8u5t/k9
	rRIrMA4k9ERCEBydTXC0xaVYwEeLRte4YE+cVrhMjsLhSbh5U+QMaYyccVkhtAaeQfH7ySjnDQEgD
	ngrnvSCVkDyBUHYOMvwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFtvB-001QRo-Lb; Tue, 17 Aug 2021 07:54:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFttA-001PY9-H8; Tue, 17 Aug 2021 07:52:04 +0000
X-UUID: 9ab70512c25e4fc0a9fed895be87e26d-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=km+HQapEnj97cGmlAY2k+L6aikO6tJLQDG1ewnsIXg8=; 
 b=o0CGDNmBlHz5pRFsBeMMJ1Fdb0+J7ga3AMIBTbizXZtkhpNJJeqi3dFuWKsLWA6Cc8G4sQ8bDg6YOzgW18KuQ+OBlG1x9cKODWzuRGP4jKMzjQBh+w6/xvqOjuYdYlZy/qFft2nT0iYC/DkZA+rUd5mPK0KFJMYNT7eAl9veqeM=;
X-UUID: 9ab70512c25e4fc0a9fed895be87e26d-20210817
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1080609125; Tue, 17 Aug 2021 00:51:57 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 00:51:56 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 15:51:54 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 15:51:53 +0800
Message-ID: <d40f6d5fd26aedb13e7a393202e5794b1893ecf8.camel@mediatek.com>
Subject: Re: [PATCH v10 1/2] dt-bindings: pinctrl: mt8195: add rsel define
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: <zhiyong.tao@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, "Rob
 Herring" <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 "Matthias
 Brugger" <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>, "Eddie
 Huang" <eddie.huang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>,
 Biao Huang <biao.huang@mediatek.com>, Hongzhou Yang
 <hongzhou.yang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, "Seiya
 Wang" <seiya.wang@mediatek.com>, Devicetree List
 <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>
Date: Tue, 17 Aug 2021 15:51:54 +0800
In-Reply-To: <CAGXv+5FtL2zaSWx4tUymx6mpCSb5dXG4XNWM9AJL+b6Ok3dxMg@mail.gmail.com>
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
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_005200_651993_344B39D7 
X-CRM114-Status: GOOD (  39.92  )
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

On Tue, 2021-08-17 at 13:44 +0800, Chen-Yu Tsai wrote:
> On Tue, Aug 17, 2021 at 10:21 AM zhiyong.tao <
> zhiyong.tao@mediatek.com> wrote:
> > 
> > On Tue, 2021-08-17 at 01:00 +0200, Linus Walleij wrote:
> > > On Mon, Aug 16, 2021 at 5:38 PM Chen-Yu Tsai <wenst@chromium.org>
> > > wrote:
> > > > On Mon, Aug 16, 2021 at 6:48 PM zhiyong.tao <
> > > > zhiyong.tao@mediatek.com> wrote:
> > > > > > I'll take that as "use SI units whenever possible and
> > > > > > reasonable".
> > > > > 
> > > > > ==> so It doesn't need to change the define, is it right?
> > > > > we will keep the common define.
> > > > 
> > > > Actually I think it would be possible and reasonable to use SI
> > > > units
> > > > in this case, since you are the vendor and have the resistor
> > > > values
> > > > to implement the support. Having different sets of values for
> > > > different
> > > > chips is nothing out of the ordinary. We already have to
> > > > account
> > > > for
> > > > different number of pins and different pin functions. That is
> > > > what
> > > > compatible strings are for.
> > > 
> > > I fully agree with Chen-Yu's analysis here.
> > > 
> > > Zhiyong can you make an attempt to use SI units (Ohms) and see
> > > what it will look like? I think it will look better for users and
> > > it
> > > will
> > > be less risk to make mistakes.
> > > 
> > > Yours,
> > > Linus Walleij
> > 
> > Hi Linus & chen-yu,
> > 
> > The rsel actual bias resistance of each setting is different in
> > different IC. For example, in mt8195, the rsel actual bias
> > resistance
> > setting like as:
> > MTK_PULL_SET_RSEL_000:75K in PU, 75k in PD;
> > MTK_PULL_SET
> > _RSEL_001:10k in PU, 5k in PD;
> > MTK_PULL_SET_RSEL_010:5k in PU, 75k in
> > PD;
> > MTK_PULL_SET_RSEL_011:4k in PU, 5K in PD;
> > MTK_PULL_SET_RSEL_100:3k in
> > PU, 75k in PD;
> > MTK_PULL_SET_RSEL_101:2k in PU, 5K in PD;
> > MTK_PULL_SET_RSE
> > L_110:1.5k in PU, 75k in PD;
> > MTK_PULL_SET_RSEL_111:1k in PU, 5k in PD.
> > 
> > but in mt8192, the rsel actual bias resistance setting like as:
> > MTK_PULL_SET_RSEL_000:75K in PU, 75k in PD;
> > MTK_PULL_SET_RSEL_001:3k in PU, 5k in PD;
> > MTK_PULL_SET_RSEL_010:10k in PU, 75k in PD;
> > MTK_PULL_SET_RSEL_011:1k in PU, 5K in PD;
> > 
> > Can you help me to provide a suggestion common define for the all
> > different IC?
> > It seems that we should add a new define, if we upstream a new IC
> > pinctrl driver in the future.
> 
> I assume you mean the macros used in the device tree?
> 
> The point of using SI units is to get rid of the macros. Instead of:
> 
>     bias-pull-up = <MTK_PULL_SET_RSEL_000>;
> 
> and
> 
>     bias-pull-down = <MTK_PULL_SET_RSEL_011>;
> 
> We want:
> 
>     bias-pull-up = <75000>;
> 
> and
> 
>     bias-pull-down = <5000>;
> 
> And the pinctrl driver then converts the real values in the device
> tree
> into register values using some lookup table.
> 
> The DT schema could then enumerate all the valid resistor values,
> and get proper validity checking.
> 
> Now if you really wanted to keep some symbols for mapping hardware
> register values to resistor values, you could have
> 
>     #define MT8192_PULL_UP_RSEL_001      75000
>     #define MT8192_PULL_DOWN_RSEL_001     5000
> 
> or have them all named MTK_PULL_{UP,DOWN}_RSEL_NNN, but split into
> different header files, one per SoC.
> 
> Personally I think having the macros is a bad idea if proper values
> are available. It just adds another layer of indirection, and another
> area where errors can creep in.
> 
> 
> Regards
> ChenYu

Hi Chenyu,

In one chip, If GPIO is different, the MTXXXX_PULL_UP_RSEL_001 may
means different actual bias resistance setting.

For example,

KPROW IO                                        
Paramters       Descriptions                   Min      Typ     Max    
 UNIT
Rpd     Input pull-down resistance      40      75      190     Kohm
Rpu     Input pull-up resistance        40      75      190     Kohm
Rpd     Input pull-down resistance      0.8     1.6     2       Kohm
Rpu     Input pull-up resistance        0.8     1.6     2       Kohm
                                        
                                        
KPCOL IO                                        
Paramters       Descriptions                   Min      Typ     Max    
 UNIT
Rpd     Input pull-down resistance      40      75      190     Kohm
Rpu     Input pull-up resistance        40      75      190     Kohm
Rpd     Input pull-down resistance      200     260     400     Kohm
Rpu     Input pull-up resistance        200     260     400     Kohm
                                        
                                        
MSDC1 IO                                        
Paramters       Descriptions                    Min     Typ     Max    
 UNIT
Rpd     Input pull-down resistance      5       7.5     10      Kohm
Rpu     Input pull-up resistance        5       7.5     10      Kohm
Rpd     Input pull-down resistance      10      50      100     Kohm
Rpu     Input pull-up resistance        10      50      100     Kohm

we think that we can't define like this.

Thanks.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
