Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C0FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 12:38:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2E1460F92
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 12:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2E1460F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0XxTB/DYL5Y5D0K+Z/jxNjnwOv07HgcYkubq06Vdzgc=; b=Koq/CuUW8XRbZQ
	lyJsO9wmz2n6zHKEszzivJpFDsGLelK8PdJsmXHBMbERCMzJWp6Mc3U39je6D/S8LhzSdpVAteGrV
	9AzgA+C/hJ6bIBr7j8zp2RlbDTdvOfk6t8vscaP6mAPxx0+bwtRiauWmuVZJHyEJZvDVXmNVE0L/r
	wl98nklIlNWWUYviJfRyCsvwDTx37HtWdG/G/hRc2VdaQxc/tdXAxEcMvEztGldI0jZaEyyOydXKb
	RoUKVKgxs48UiTMnK0rxx33RmLjSfhA6EJ1Sx0oEigK86NTDqzWImod9dfbvuUpnqa5f5Xw8GMre2
	9cm5+lAiRH13106kjGVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ7hg-005iFh-N2; Tue, 14 Sep 2021 12:38:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ7gx-005hzx-6a; Tue, 14 Sep 2021 12:37:41 +0000
X-UUID: 9174fc41c2314a6d9528d1266336537b-20210914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jxcrZocIJc4j/FnXNfApEeTp74r2tdSqgIBIprTEKVw=; 
 b=KA7WULb81vDABZ9DY70ftGMUd2ipUT5fpsZJiSVTFUB1tLJUUBRE0BQNZ45tEx93zM2kl91rhpjVWWahD5//irbzcSm91h7MJ9ElymZ3rkNaOXnl3BxFl1GDEv6d6qnmVIJKGU80fOWYJpLg4hBmtGy+HDDIh04euH3Dzto+rVo=;
X-UUID: 9174fc41c2314a6d9528d1266336537b-20210914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1157530426; Tue, 14 Sep 2021 05:37:35 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 05:27:33 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 20:27:31 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Sep 2021 20:27:30 +0800
Message-ID: <05f453a466995a6c272d585f18e81c5fcb837a0b.camel@mediatek.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: pinctrl: mt8195: add rsel define
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: <zhiyong.tao@mediatek.com>, Rob Herring <robh+dt@kernel.org>, "Linus
 Walleij" <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>, "Eddie
 Huang" <eddie.huang@mediatek.com>, Light Hsieh <light.hsieh@mediatek.com>,
 Biao Huang <biao.huang@mediatek.com>, Hongzhou Yang
 <hongzhou.yang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Seiya Wang
 <seiya.wang@mediatek.com>, Devicetree List <devicetree@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open
 list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Date: Tue, 14 Sep 2021 20:27:32 +0800
In-Reply-To: <CAGXv+5H6Hj9tGkpMHs_uBTcztDBZ_YJ2PUV7J8+abR+5BEsV2g@mail.gmail.com>
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-2-zhiyong.tao@mediatek.com>
 <CAGXv+5HeNj2Ly-T1bWMvnYXv6nP-Q1kv+D9QEd+5u4xfNVibOg@mail.gmail.com>
 <1630551265.2247.11.camel@mhfsdcap03>
 <CAGXv+5E2pmS7Og5bRH8Q8yvXPHkJuL6EXKORkq1-Ye+2qNYQpg@mail.gmail.com>
 <4787120f25e76ed3727e10011522fc075da52e32.camel@mediatek.com>
 <CAGXv+5H6Hj9tGkpMHs_uBTcztDBZ_YJ2PUV7J8+abR+5BEsV2g@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_053739_318750_C7078D76 
X-CRM114-Status: GOOD (  48.20  )
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

On Mon, 2021-09-06 at 16:20 +0800, Chen-Yu Tsai wrote:
> On Sat, Sep 4, 2021 at 4:40 PM zhiyong.tao <zhiyong.tao@mediatek.com>
> wrote:
> > 
> > On Thu, 2021-09-02 at 11:35 +0800, Chen-Yu Tsai wrote:
> > > On Thu, Sep 2, 2021 at 10:54 AM zhiyong.tao <
> > > zhiyong.tao@mediatek.com
> > > > wrote:
> > > > 
> > > > On Wed, 2021-09-01 at 12:35 +0800, Chen-Yu Tsai wrote:
> > > > > On Mon, Aug 30, 2021 at 8:36 AM Zhiyong Tao <
> > > > > zhiyong.tao@mediatek.com> wrote:
> > > > > > 
> > > > > > This patch adds rsel define for mt8195.
> > > > > > 
> > > > > > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > > > > > ---
> > > > > >  include/dt-bindings/pinctrl/mt65xx.h | 9 +++++++++
> > > > > >  1 file changed, 9 insertions(+)
> > > > > > 
> > > > > > diff --git a/include/dt-bindings/pinctrl/mt65xx.h
> > > > > > b/include/dt-
> > > > > > bindings/pinctrl/mt65xx.h
> > > > > > index 7e16e58fe1f7..f5934abcd1bd 100644
> > > > > > --- a/include/dt-bindings/pinctrl/mt65xx.h
> > > > > > +++ b/include/dt-bindings/pinctrl/mt65xx.h
> > > > > > @@ -16,6 +16,15 @@
> > > > > >  #define MTK_PUPD_SET_R1R0_10 102
> > > > > >  #define MTK_PUPD_SET_R1R0_11 103
> > > > > > 
> > > > > > +#define MTK_PULL_SET_RSEL_000  200
> > > > > > +#define MTK_PULL_SET_RSEL_001  201
> > > > > > +#define MTK_PULL_SET_RSEL_010  202
> > > > > > +#define MTK_PULL_SET_RSEL_011  203
> > > > > > +#define MTK_PULL_SET_RSEL_100  204
> > > > > > +#define MTK_PULL_SET_RSEL_101  205
> > > > > > +#define MTK_PULL_SET_RSEL_110  206
> > > > > > +#define MTK_PULL_SET_RSEL_111  207
> > > > > 
> > > > > Could you keep the spacing between constants tighter, or have
> > > > > no
> > > > > spacing
> > > > > at all? Like having MTK_PULL_SET_RSEL_000 defined as 104 and
> > > > > so
> > > > > on. This
> > > > > would reduce the chance of new macro values colliding with
> > > > > actual
> > > > > resistor
> > > > > values set in the datasheets, plus a contiguous space would
> > > > > be
> > > > > easy to
> > > > > rule as macros.
> > > > > 
> > > > > ChenYu
> > > > 
> > > > Hi chenyu,
> > > > By the current solution, it won't be mixed used by
> > > > MTK_PULL_SET_RSEL_XXX
> > > > and real  resistor value.
> > > > If user use MTK_PULL_SET_RSEL_XXX, They don't care the define
> > > > which
> > > > means how much resistor value.
> > > 
> > > What I meant was that by keeping the value space tight, we avoid
> > > the
> > > situation where in some new chip, one of the RSEL resistors
> > > happens
> > > to
> > > be 200 or 300 ohms. 100 is already taken, so there's nothing we
> > > can
> > > do if new designs actually do have 100 ohm settings.
> > > 
> > > > We think that we don't contiguous macro space for different
> > > > register.
> > > > It may increase code complexity to make having
> > > > MTK_PULL_SET_RSEL_000
> > > > defined as 104.
> > > 
> > > Can you elaborate? It is a simple range check and offset
> > > handling.
> > > Are
> > > you concerned that a new design would have R2R1R0 and you would
> > > like
> > > the macros to be contiguous?
> > > 
> > > BTW I don't quite get why decimal base values (100, 200, etc.)
> > > were
> > > chosen. One would think that binary bases are easier to handle in
> > > code.
> > > 
> > > 
> > > ChenYu
> > > 
> > 
> > Yes,we concerned that a new design would have R2R1R0 and we would
> > like
> > the macros to be contiguous in the feature. we reserve it.
> 
> I see. That makes sense. Do you expect to see R3 or even R4 in the
> future?
> Or put another way, do you expect to see resistor values of 150 or
> 200
> supported?
> 
> Maybe we could reserve 200 and start from 201 for the RSEL macros?
> 
> Some planning needs to be done here to avoid value clashes.
> 
> > We think that decimal and binary base values are the same for the
> > feature.
> 
> With decimal numbers you end up wasting a bit more space, since the
> hardware is always using binary values. I just found it odd, that's
> all.
> 
> ChenYu
> 
> > > > Thanks.

Hi ChenYu,

In the next version, we provide a solution which we discussed internal
to avoid value clashes.
 
The solution:
1. We will keep the define "MTK_PULL_SET_RSEL_000 200". It won't
change.

2. We will add a property in pio dtsi node, for example,
the property name is "rsel_resistance_in_si_unit".
We will add a flag "rsel_si_unit" in pinctrl device.
in probe function, we will identify the property name
"rsel_resistance_in_si_unit" to set the flag "rsel_si_unit" value.
So it can void value clashes.

3.We will provide the define "MTK_PULL_SET_RSEL_000 200" and si unit
two solution. users can support which solution by add property
"rsel_resistance_in_si_unit" in dts node or not.

Thanks.


> > > > 
> > > > > 
> > > > > >  #define MTK_DRIVE_2mA  2
> > > > > >  #define MTK_DRIVE_4mA  4
> > > > > >  #define MTK_DRIVE_6mA  6
> > > > > > --
> > > > > > 2.18.0
> > > > > > _______________________________________________
> > > > > > Linux-mediatek mailing list
> > > > > > Linux-mediatek@lists.infradead.org
> > > > > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
