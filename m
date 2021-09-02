Return-Path: <SRS0=hgkd=NY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A78C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 03:33:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59E5C60243
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Sep 2021 03:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59E5C60243
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DwFp2tX9gchvTIoH9Njq561AC/VKC2tIeQqo32J277A=; b=HYb8ongQZrYfJh
	RdK9JFrn24rRjT5rg0EZqG4J11NpDnvGK5uFhYJUTnUwiBeI5yBFmGmBuZQRwZ1JXqdiuUuhmEbry
	L9L5HLtfTpYJs1mc6rqZt87eATZah30akoOHLIWtarxUbyPz5gXGs1EX7bqDdMXlsCBSn8Pv3aGx3
	RJGE/RlavFjtckBye2IRi3lnX2ucbMqD6Lyt/px8BHTZo1Y03uGQnDFeMcrfG6tFtxw/L1QbJuLaF
	o2ftB076o9tNRB37pQCWmb48/W9ZzXYX86jd4+JkLRCTtB/h1Y4wZt3mtkDlYfSVExKn6DyLjWgny
	iwWzYnDjxbuuW42TyHqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLdTh-008Kss-Ei; Thu, 02 Sep 2021 03:33:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLdTc-008KoK-K0; Thu, 02 Sep 2021 03:33:24 +0000
X-UUID: 588f373119a04aa5b1096c5daef0a94e-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=rHsTfvEv/bgnURUlumiDcYJW9+LcWoNewep7B8fr+70=; 
 b=EgubN7MoOjvtwrvAls6U8DZCXAtCl80X9z2vc5rk6053l/Tse60sCXgeWOEP+MZjZg4WwOxqM4SGtPLujGDfdGJvKUMwHyY3P7McHbrTBGO5mz7hLsPI9Fmch1IgWMglSbB/8+beVnO093kNfq6ne7/8z4p8expTMTa5L+CLKl0=;
X-UUID: 588f373119a04aa5b1096c5daef0a94e-20210901
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 39496328; Wed, 01 Sep 2021 20:33:16 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 20:31:24 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 11:31:23 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Sep 2021 11:31:22 +0800
Message-ID: <1630553482.2247.16.camel@mhfsdcap03>
Subject: Re: [PATCH v11 2/4] dt-bindings: pinctrl: mt8195: change pull
 up/down description
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Rob Herring <robh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
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
Date: Thu, 2 Sep 2021 11:31:22 +0800
In-Reply-To: <CAGXv+5H2-o91VGHwBUB_Gui1pa5m9jz6xTjHvP3+ue8=-ZWGvQ@mail.gmail.com>
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-3-zhiyong.tao@mediatek.com>
 <YS6pbO4hmNyX//tP@robh.at.kernel.org> <1630461636.21764.1.camel@mhfsdcap03>
 <CAGXv+5H2-o91VGHwBUB_Gui1pa5m9jz6xTjHvP3+ue8=-ZWGvQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_203320_709961_7EB709D7 
X-CRM114-Status: GOOD (  29.44  )
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

On Wed, 2021-09-01 at 18:21 +0800, Chen-Yu Tsai wrote:
> On Wed, Sep 1, 2021 at 10:01 AM zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
> >
> > On Tue, 2021-08-31 at 17:13 -0500, Rob Herring wrote:
> > > On Mon, Aug 30, 2021 at 08:36:01AM +0800, Zhiyong Tao wrote:
> > > > Change pull up/down description
> > >
> > > Every commit is a 'change'. Your commit msg should explain 'why', not
> > > what the diff is.
> > >
> > Hi robh,
> > we will add 'why' explanation in the commit msg in v12.
> >
> >
> > > >
> > > > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > > > ---
> > > >  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 32 +++++++++++++++++--
> > > >  1 file changed, 29 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > > > index 2f12ec59eee5..a341ed9f0095 100644
> > > > --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > > > +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> > > > @@ -85,9 +85,35 @@ patternProperties:
> > > >            2/4/6/8/10/12/14/16mA in mt8195.
> > > >          enum: [0, 1, 2, 3, 4, 5, 6, 7]
> > > >
> > > > -      bias-pull-down: true
> > > > -
> > > > -      bias-pull-up: true
> > > > +      bias-pull-down:
> > > > +        description: |
> > > > +          For pull down type is normal, it don't need add RSEL & R1R0 define
> > > > +          and resistance value.
> > > > +          For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
> > > > +          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> > > > +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
> > > > +          define in mt8195.
> > > > +          For pull down type is RSEL, it can add RSEL define & resistance value(ohm)
> > > > +          to set different resistance. It can support "MTK_PULL_SET_RSEL_000" &
> > > > +          "MTK_PULL_SET_RSEL_001" & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
> > > > +          "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" &
> > > > +          "MTK_PULL_SET_RSEL_111" define in mt8195. It can also support resistance value(ohm)
> > > > +          "75000" & "5000" in mt8195.
> > >
> > > Sounds like constraints on the values. Please write a schema.
> > >
> > we will add a schema here in v12.
> 
> Could the description be written to encourage device tree authors to
> use SI units instead of the macros?
> 
> Thanks
> ChenYu

In mt8195, SI units is used. we will change the description.
If user dont want to use SI units, We also provide the solution of the
macros for the solution.

> 
> >
> > Thanks
> > > > +
> > > > +      bias-pull-up:
> > > > +        description: |
> > > > +          For pull up type is normal, it don't need add RSEL & R1R0 define
> > > > +          and resistance value.
> > > > +          For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
> > > > +          set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> > > > +          "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
> > > > +          define in mt8195.
> > > > +          For pull up type is RSEL, it can add RSEL define & resistance value(ohm)
> > > > +          to set different resistance. It can support "MTK_PULL_SET_RSEL_000" &
> > > > +          "MTK_PULL_SET_RSEL_001" & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
> > > > +          "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" &
> > > > +          "MTK_PULL_SET_RSEL_111" define in mt8195. It can also support resistance value(ohm)
> > > > +          "1000" & "1500" & "2000" & "3000" & "4000" & "5000" & "10000" & "75000" in mt8195.
> > > >
> > > >        bias-disable: true
> > > >
> > > > --
> > > > 2.18.0
> > > >
> > > >
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
