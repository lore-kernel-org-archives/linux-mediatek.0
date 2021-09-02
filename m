Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A85C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 03:04:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CA9761056
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 03:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CA9761056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AiPlaha5gxkZZv3nJyFoveRZym+MSyVy0M1cX0nf5JQ=; b=cm9+PlkPZAVqem
	f5BOyu8SIUfEJ15lHig5ftuv5kpxXwdaLZ1EsLYyCob76aNPvarqmVIP6w5+KZu/XSFV8IkBZExWG
	iKsKE9MKQiownFBydTjsasrIFKPRFjUS60nHmBYOi3tbSrcWIuRUz0p214kIUT+OX1Z2X34pqo25Q
	AUnxG/hzfxOnMgFOQQ8aXLHs9oZBWiwZsst0hfB2x3G7TeqKivK5dkgovdalW4z0Cg6lUsaiYoMkn
	GfoNpHBt3W4zbGWPw1pGIwAVlhEVJViiOgZTUE99byp2QPPlRX2nnaO/H1bckz1+f+w2QdCWH89I4
	vn/dQJBUMmySbAroPl2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLd1w-008Gna-Rb; Thu, 02 Sep 2021 03:04:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLd1p-008Gmb-Ci; Thu, 02 Sep 2021 03:04:42 +0000
X-UUID: 2263b8dd983e408785dd32097b473a5b-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=oKwi5vQyQUW6ltkazyhgIJ93lF1wrGUFw2P5Zp/Ilm4=; 
 b=XrZIm3plTUBMC0rGVCKTS7LWzll8MVb+XRJVS/q7lNnpEe9WQs/rMMIGM4u5LGG0ClVgAsLMmO1M2dNhXHL1UNSed3fAVTkKLPOQNAWctCiBe0flBzWWULsWDneuSYWXUVuIsjucSlaBiL8V5P2ZH7XZLrTMCZg1vBad64hhgec=;
X-UUID: 2263b8dd983e408785dd32097b473a5b-20210901
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1458139401; Wed, 01 Sep 2021 20:04:30 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 19:54:27 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 10:54:26 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Sep 2021 10:54:25 +0800
Message-ID: <1630551265.2247.11.camel@mhfsdcap03>
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
Date: Thu, 2 Sep 2021 10:54:25 +0800
In-Reply-To: <CAGXv+5HeNj2Ly-T1bWMvnYXv6nP-Q1kv+D9QEd+5u4xfNVibOg@mail.gmail.com>
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-2-zhiyong.tao@mediatek.com>
 <CAGXv+5HeNj2Ly-T1bWMvnYXv6nP-Q1kv+D9QEd+5u4xfNVibOg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_200438_889765_D689F644 
X-CRM114-Status: GOOD (  23.94  )
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

On Wed, 2021-09-01 at 12:35 +0800, Chen-Yu Tsai wrote:
> On Mon, Aug 30, 2021 at 8:36 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
> >
> > This patch adds rsel define for mt8195.
> >
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > ---
> >  include/dt-bindings/pinctrl/mt65xx.h | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/include/dt-bindings/pinctrl/mt65xx.h b/include/dt-bindings/pinctrl/mt65xx.h
> > index 7e16e58fe1f7..f5934abcd1bd 100644
> > --- a/include/dt-bindings/pinctrl/mt65xx.h
> > +++ b/include/dt-bindings/pinctrl/mt65xx.h
> > @@ -16,6 +16,15 @@
> >  #define MTK_PUPD_SET_R1R0_10 102
> >  #define MTK_PUPD_SET_R1R0_11 103
> >
> > +#define MTK_PULL_SET_RSEL_000  200
> > +#define MTK_PULL_SET_RSEL_001  201
> > +#define MTK_PULL_SET_RSEL_010  202
> > +#define MTK_PULL_SET_RSEL_011  203
> > +#define MTK_PULL_SET_RSEL_100  204
> > +#define MTK_PULL_SET_RSEL_101  205
> > +#define MTK_PULL_SET_RSEL_110  206
> > +#define MTK_PULL_SET_RSEL_111  207
> 
> Could you keep the spacing between constants tighter, or have no spacing
> at all? Like having MTK_PULL_SET_RSEL_000 defined as 104 and so on. This
> would reduce the chance of new macro values colliding with actual resistor
> values set in the datasheets, plus a contiguous space would be easy to
> rule as macros.
> 
> ChenYu

Hi chenyu,
By the current solution, it won't be mixed used by MTK_PULL_SET_RSEL_XXX
and real  resistor value.
If user use MTK_PULL_SET_RSEL_XXX, They don't care the define which
means how much resistor value.
We think that we don't contiguous macro space for different register. 
It may increase code complexity to make having MTK_PULL_SET_RSEL_000
defined as 104.

Thanks.

> 
> >  #define MTK_DRIVE_2mA  2
> >  #define MTK_DRIVE_4mA  4
> >  #define MTK_DRIVE_6mA  6
> > --
> > 2.18.0
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
