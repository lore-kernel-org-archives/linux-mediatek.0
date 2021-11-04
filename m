Return-Path: <SRS0=FoZt=PX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700D8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 08:32:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23189610A8
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 08:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23189610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=loW7D8EJhjrN6DANZVOTHAWYr2l3EBpRo4cbhht/HE4=; b=PJD1aRyp+QTvo7
	C6Qb83P+rgj2HuNAxmVeWfn/0B02q9mWiSVXm7Q8dd08tlJfDw7Uy4Qjp8x1F81E57syXTIbrQ++j
	nxRhcGxYAmMsUq9yA6cnYnIuPzU1naSsZeqqDm3lHI0bM9dz5VWmPINWUCnUx24nNAPejZ0PUkykd
	DphuNa8SMRPuQkjHQBwgmAYHV8N3oTWU6ZXdIgwNx29/A9oHH9qZ3OycTGAjpcAx3GO4jvOdDVQ1F
	fO04lxxXm5KwoPeXmHO6HAHvkXBvqFvP7w6bYsVC299PenJk77fQPdRCPjLCdrevHKtTONUqxh1AY
	htolOTqgXvEonMUZjPrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miY9y-008IVn-Kz; Thu, 04 Nov 2021 08:31:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miY9k-008IUM-Mf; Thu, 04 Nov 2021 08:31:35 +0000
X-UUID: 1cf0c245c2b14895a52d364a10a7abad-20211104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ki4NlJ6iEjqgEKAi8c09U77S16LHsT+3xmGU5SQrUdQ=; 
 b=RWAbk2UZqz/WurrsmK0WRq8AwoKs8l1kxKlNXzgjiD8dN2O6foYgRoIxpURdFM7yAhj8N8YFmQVQbu5P89V/iJMmpK39BrCR3nfPg3Q4vxiI4i6V4rYMWXjMwNKObYdKxyHCdkrQ9MlbhJIVSBgwCHOJOzHP8Iba5PEUU0VoCog=;
X-UUID: 1cf0c245c2b14895a52d364a10a7abad-20211104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1551639386; Thu, 04 Nov 2021 01:31:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Nov 2021 01:25:36 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 4 Nov 2021 16:25:34 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 4 Nov 2021 16:25:33 +0800
Message-ID: <751bb32ae8afde61bb19e365a51faca652b608d8.camel@mediatek.com>
Subject: Re: [PATCH] pinctrl: mediatek: fix global-out-of-bounds issue
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, srv_heupstream
 <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>, Light Hsieh
 <light.hsieh@mediatek.com>, Sean Wang
 =?UTF-8?Q?=28=E7=8E=8B=E5=BF=97=E4=BA=98=29?= <sean.wang@mediatek.com>, Seiya
 Wang <seiya.wang@mediatek.com>, <rex-bc.chen@mediatek.com>, "open list:OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, "linux-arm Mailing List"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>, Guodong Liu
 <guodong.liu@mediatek.corp-partner.google.com>
Date: Thu, 4 Nov 2021 16:25:33 +0800
In-Reply-To: <CAGp9LzpEG_6w6fvmjaBAW3ihKQZm4uMEy9-5MaLLWkeu+QFqeQ@mail.gmail.com>
References: <20211104014039.26772-1-zhiyong.tao@mediatek.com>
 <20211104014039.26772-2-zhiyong.tao@mediatek.com>
 <CAGp9LzpEG_6w6fvmjaBAW3ihKQZm4uMEy9-5MaLLWkeu+QFqeQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_013134_198525_01847D2B 
X-CRM114-Status: GOOD (  20.77  )
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

On Wed, 2021-11-03 at 23:07 -0700, Sean Wang wrote:
> HI, Zhiyong
> 
> On Wed, Nov 3, 2021 at 6:40 PM Zhiyong Tao <zhiyong.tao@mediatek.com>
> wrote:
> > 
> > From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
> > 
> > When eint virtual eint number is greater than gpio number,
> > it maybe produce 'desc[eint_n]' size globle-out-of-bounds issue.
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > Signed-off-by: Guodong Liu <
> > guodong.liu@mediatek.corp-partner.google.com>
> > ---
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > index 45ebdeba985a..9d57c897835c 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > @@ -286,7 +286,8 @@ static int mtk_xt_get_gpio_n(void *data,
> > unsigned long eint_n,
> >         *gpio_chip = &hw->chip;
> > 
> >         /* Be greedy to guess first gpio_n is equal to eint_n */
> > -       if (desc[eint_n].eint.eint_n == eint_n)
> > +       if (((*gpio_chip)->ngpio > eint_n) &&
> 
> please use "hw->soc->npins > eint_n" to perform the boundary check to
> be consistent with the other places for the same purpose

Hi sean,

Thanks for your suggestion.
We will change it in next version(v1)

Thanks.
> 
> > +           desc[eint_n].eint.eint_n == eint_n)
> >                 *gpio_n = eint_n;
> >         else
> >                 *gpio_n = mtk_xt_find_eint_num(hw, eint_n);
> > --
> > 2.25.1
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
