Return-Path: <SRS0=vCgL=N2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBE4C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Sep 2021 08:40:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA8AC61051
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Sep 2021 08:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA8AC61051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7bTmCWQs+RjKL/M98edUr1jk3KCOwNpNxd6jx6uI1Ec=; b=eJ4ZrZUWKrmsoy
	4yi2nYkvW9TdSKaWm2Z9tSJrnBk2ZNezkbQYduu5HznhEH6cfGb0okfLwZ+eqtt/in37uxjecuPdH
	dGrz2Dj5R7CC4sQNWx/16+1ZIepi0GyzsIf5JFikVRTIzSAdcYAIHjHIyNNXaoyhsvBGc3tZZm2R5
	Gh83qMhJJsIVTrSErbTr5rIAvVonThJxE2c6cvLuyc0gqmwZM0O9fnbQZJE0NIlhxvNl9MZ+go2qk
	hssx0ShJXfvuhNDbPmdLr5d/RbhD2+WiYFONnZqzIODVBffDUURwk41NBg5o19IL7kYF/Zkrnr1lZ
	yCKTNQLeQ4I+3+GerwvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMRDw-00Dqbg-Fw; Sat, 04 Sep 2021 08:40:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMRDr-00Dqai-L0; Sat, 04 Sep 2021 08:40:27 +0000
X-UUID: 9cf38ce73db14d9b9fbc3c536884b675-20210904
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4nWLAKWd0moWp2KumjlyVBrD/vVxfeBponWObcNvyTg=; 
 b=oZP0qshlzMhvdZE16fGZqAO8jEFLnzS6eTDmEn7GnKvL5nvSTBYQctoV547TFWUYcAMuEBDuxEUcEDcab3o7FCE/8SbljW4jtjBeOaaReLjdEwDLL/j4SKChc2Sf2M0Yepv5ug4diCISL5gHUxRbDxAGiF8hgUXVuD2Vgnsgtuk=;
X-UUID: 9cf38ce73db14d9b9fbc3c536884b675-20210904
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 787763427; Sat, 04 Sep 2021 01:40:18 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 4 Sep 2021 01:40:16 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 4 Sep 2021 16:40:15 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 4 Sep 2021 16:40:14 +0800
Message-ID: <4787120f25e76ed3727e10011522fc075da52e32.camel@mediatek.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: pinctrl: mt8195: add rsel define
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
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
Date: Sat, 4 Sep 2021 16:40:16 +0800
In-Reply-To: <CAGXv+5E2pmS7Og5bRH8Q8yvXPHkJuL6EXKORkq1-Ye+2qNYQpg@mail.gmail.com>
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-2-zhiyong.tao@mediatek.com>
 <CAGXv+5HeNj2Ly-T1bWMvnYXv6nP-Q1kv+D9QEd+5u4xfNVibOg@mail.gmail.com>
 <1630551265.2247.11.camel@mhfsdcap03>
 <CAGXv+5E2pmS7Og5bRH8Q8yvXPHkJuL6EXKORkq1-Ye+2qNYQpg@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210904_014025_142462_88716F4F 
X-CRM114-Status: GOOD (  38.11  )
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

On Thu, 2021-09-02 at 11:35 +0800, Chen-Yu Tsai wrote:
> On Thu, Sep 2, 2021 at 10:54 AM zhiyong.tao <zhiyong.tao@mediatek.com
> > wrote:
> > 
> > On Wed, 2021-09-01 at 12:35 +0800, Chen-Yu Tsai wrote:
> > > On Mon, Aug 30, 2021 at 8:36 AM Zhiyong Tao <
> > > zhiyong.tao@mediatek.com> wrote:
> > > > 
> > > > This patch adds rsel define for mt8195.
> > > > 
> > > > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > > > ---
> > > >  include/dt-bindings/pinctrl/mt65xx.h | 9 +++++++++
> > > >  1 file changed, 9 insertions(+)
> > > > 
> > > > diff --git a/include/dt-bindings/pinctrl/mt65xx.h b/include/dt-
> > > > bindings/pinctrl/mt65xx.h
> > > > index 7e16e58fe1f7..f5934abcd1bd 100644
> > > > --- a/include/dt-bindings/pinctrl/mt65xx.h
> > > > +++ b/include/dt-bindings/pinctrl/mt65xx.h
> > > > @@ -16,6 +16,15 @@
> > > >  #define MTK_PUPD_SET_R1R0_10 102
> > > >  #define MTK_PUPD_SET_R1R0_11 103
> > > > 
> > > > +#define MTK_PULL_SET_RSEL_000  200
> > > > +#define MTK_PULL_SET_RSEL_001  201
> > > > +#define MTK_PULL_SET_RSEL_010  202
> > > > +#define MTK_PULL_SET_RSEL_011  203
> > > > +#define MTK_PULL_SET_RSEL_100  204
> > > > +#define MTK_PULL_SET_RSEL_101  205
> > > > +#define MTK_PULL_SET_RSEL_110  206
> > > > +#define MTK_PULL_SET_RSEL_111  207
> > > 
> > > Could you keep the spacing between constants tighter, or have no
> > > spacing
> > > at all? Like having MTK_PULL_SET_RSEL_000 defined as 104 and so
> > > on. This
> > > would reduce the chance of new macro values colliding with actual
> > > resistor
> > > values set in the datasheets, plus a contiguous space would be
> > > easy to
> > > rule as macros.
> > > 
> > > ChenYu
> > 
> > Hi chenyu,
> > By the current solution, it won't be mixed used by
> > MTK_PULL_SET_RSEL_XXX
> > and real  resistor value.
> > If user use MTK_PULL_SET_RSEL_XXX, They don't care the define which
> > means how much resistor value.
> 
> What I meant was that by keeping the value space tight, we avoid the
> situation where in some new chip, one of the RSEL resistors happens
> to
> be 200 or 300 ohms. 100 is already taken, so there's nothing we can
> do if new designs actually do have 100 ohm settings.
> 
> > We think that we don't contiguous macro space for different
> > register.
> > It may increase code complexity to make having
> > MTK_PULL_SET_RSEL_000
> > defined as 104.
> 
> Can you elaborate? It is a simple range check and offset handling.
> Are
> you concerned that a new design would have R2R1R0 and you would like
> the macros to be contiguous?
> 
> BTW I don't quite get why decimal base values (100, 200, etc.) were
> chosen. One would think that binary bases are easier to handle in
> code.
> 
> 
> ChenYu
> 

Yes,we concerned that a new design would have R2R1R0 and we would like
the macros to be contiguous in the feature. we reserve it.

We think that decimal and binary base values are the same for the
feature.

> > Thanks.
> > 
> > > 
> > > >  #define MTK_DRIVE_2mA  2
> > > >  #define MTK_DRIVE_4mA  4
> > > >  #define MTK_DRIVE_6mA  6
> > > > --
> > > > 2.18.0
> > > > _______________________________________________
> > > > Linux-mediatek mailing list
> > > > Linux-mediatek@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
