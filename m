Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CDDC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 03:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KswdLcH7t3GLwRUHpnDaHyvnR7tE+slUMiLIKzAGKcs=; b=5GJMOamPszldDZ
	Ti6mnzAKkqFNW2wQNjhqSDwKEPVrhKkx49vrBiz9sdvrGp3Xdv8Rz6JoUU7H6wBct2VzuWocmkF/E
	rNJg+7XLgeaFJnhVSGH+SKFWBZkveiJGKeOFA4ellUyk6F0YAob68XdlliBhlEr7LE6l9vknFMvMP
	2ytT1sXnowvEaBSWze8QKX8wR3hepJkpllY7En5ciclNieOKSaH15ztnFdA+9IdOFp5EXdWF7LgjS
	AjtbSMFJ3p93ey+kga+NPWXg8HAN48NqUDwEThiQJEgl9p17Qaaq8BxssBlDgzsCG8M3iR2XV1k3F
	THPOdTYxUePt7sP49REg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8CvP-007Yqk-OA; Fri, 14 Jan 2022 03:06:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8CvM-007YpZ-6f; Fri, 14 Jan 2022 03:06:46 +0000
X-UUID: bafddcad330f4bd7b0d001681437da79-20220113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YYOlMTx5xUgPFbdY6aJr7yXSIeGaNag49G05D17aQl8=; 
 b=XQoVhGGDxIA8kqYffpe6ogmYopHTEd4CrLKenu2kJBqnqcVvYJ+l6lfHOdw860YsOCeqlRUCfReiWbk/sS0szBcPPFGuKDE1O6rbGL44+bVgRddNq/ZX1/dWBbKJcZ/3fz1cFP005qkzH90DV2X4y4TNoBsGIyU9XjTErifk7uI=;
X-UUID: bafddcad330f4bd7b0d001681437da79-20220113
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1963152983; Thu, 13 Jan 2022 20:06:40 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Jan 2022 19:06:39 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 14 Jan 2022 11:06:37 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Jan 2022 11:06:36 +0800
Message-ID: <52901ebe0db555f8e58dc0d59cfd703c5a0fc2de.camel@mediatek.com>
Subject: Re: [PATCH v2 3/3] mmc: mediatek: add support for SDIO eint irq
From: Axe Yang <axe.yang@mediatek.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, "Yoshihiro
 Shimoda" <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala
 <satyat@google.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, "Lucas
 Stach" <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>, Andrew Jeffery
 <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim
 <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>, Tian Tao
 <tiantao6@hisilicon.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Fri, 14 Jan 2022 11:06:36 +0800
In-Reply-To: <YeADWXPGPW253ssR@smile.fi.intel.com>
References: <20220111014046.5864-1-axe.yang@mediatek.com>
 <20220111014046.5864-4-axe.yang@mediatek.com>
 <Yd1uJ+dX2CTEJfYY@smile.fi.intel.com>
 <83670f12a4eda1d8aecde3c0bf225642106d1267.camel@mediatek.com>
 <YeADWXPGPW253ssR@smile.fi.intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_190644_280176_0C9A2A50 
X-CRM114-Status: GOOD (  17.52  )
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

On Thu, 2022-01-13 at 12:47 +0200, Andy Shevchenko wrote:
> On Thu, Jan 13, 2022 at 03:58:52PM +0800, Axe Yang wrote:
> 
> > But for the comment for 'dev_dbg', can you explain more about that?
> 
> Sure.
> 
> > On Tue, 2022-01-11 at 13:46 +0200, Andy Shevchenko wrote:
> > > On Tue, Jan 11, 2022 at 09:40:46AM +0800, Axe Yang wrote:
> 
> ..
> 
> > > > +		host->pins_eint = pinctrl_lookup_state(host-
> > > > >pinctrl,
> > > > "state_eint");
> > > > +		if (IS_ERR(host->pins_eint)) {
> > > > +			dev_dbg(&pdev->dev, "Cannot find
> > > > pinctrl
> > > > eint!\n");
> > > 
> > > In debug mode of pin control this will bring a duplicate message.
> > 
> > Can you explain more about this comment?
> > I don't understand what the 'duplicate message' refers for.
> 
> Have you chance to read the implementation of pinctrl_lookup_state()?

I have read pinctrl_lookup_state(), and if the 'duplicate message' you
were talking about is 'using pinctrl dummy state...':

https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/core.c#L1214
No, this message will not appear in debug mode if pins_eint not found
because pinctrl_dummy_state is always FALSE. MTK Soc do not need dummy
state support.

--
Best Regard,
Axe Yang
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
