Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484F9C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 09:12:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 009786023F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 09:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 009786023F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SbK/VQB8esvhQ+Z9K2r0qfMReI59/t3WKP69U5fpBSY=; b=gtiSaOKyHtpLoq
	ruirlKtgmqYFEGgrSF7ROccU00HbgU7ienMj3KL1uTgY/HrU+FgItEoSmlArhpiSHZprLJHsTs0d5
	Y4J2/ZKw8+Oj60TJfNjDAAhzOiEsTxFBvFAO3sxs1nLwdPSG5sQRVK3WiC5BAsYN0EqFaEufJYCzk
	GhA6r6jzWWY5Cgr1iRFyfhJ7nHViddlLADfhxYwqAKIciB3bgPoZRP+bXBm6Uo98ru4eAbowszE7X
	O1LF5dZ7+khF0OHGgaqbT6oBrApv6BUR312PMNON7JbwNiu4SJwDtGHU9XXdIl0kzTLJqyK5rOK3P
	hYpg2B3puB0wGrVZHuwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKzo9-001ume-4G; Tue, 31 Aug 2021 09:11:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKzo3-001uii-K9; Tue, 31 Aug 2021 09:11:51 +0000
X-UUID: ab0e6cc550e5422f844a6fdfb4c79542-20210831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5W4QXwfTwPNUqiJHtsZa3Pb3wmoeHssy3TRADECpkfQ=; 
 b=XFeap5SToF2RkjrZ5EZ4YEaCyLcOQtUwdS2fJxMDHgLmlpEU7rghCdVKKLLgen6SVng4CBT2P2CYieh7FAjkLjNNGJmVTnvgmePU0fHcV8vZElei/7sJ1wTIgFNMLzR4YxzE+a95YddJOVnsjMmpLfO5Y+yq8GyaY43xjilJ0Vc=;
X-UUID: ab0e6cc550e5422f844a6fdfb4c79542-20210831
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1859875223; Tue, 31 Aug 2021 02:11:42 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 02:11:41 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 17:11:39 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 31 Aug 2021 17:11:38 +0800
Message-ID: <1630401098.14536.2.camel@mhfsdcap03>
Subject: Re: [PATCH v11 3/4] pinctrl: mediatek: mt8195: Add pm_ops
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
Date: Tue, 31 Aug 2021 17:11:38 +0800
In-Reply-To: <CAGXv+5Gx74SxdB_-V3SZB1sQ3=bpUkbkkaHxAyFg9m+7k+HVkw@mail.gmail.com>
References: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
 <20210830003603.31864-4-zhiyong.tao@mediatek.com>
 <CAGXv+5Gx74SxdB_-V3SZB1sQ3=bpUkbkkaHxAyFg9m+7k+HVkw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_021147_710738_D55C4AF6 
X-CRM114-Status: GOOD (  25.96  )
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

On Tue, 2021-08-31 at 15:53 +0800, Chen-Yu Tsai wrote:
> On Mon, Aug 30, 2021 at 8:37 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
> >
> > Setting this up will configure wake from suspend properly,
> > and wake only for the interrupts that are setup in wake_mask,
> > not all interrupts.
> 
> This sounds like a fix. Please add a Fixes tag for this patch. This makes
> tracking things easier.
> 
> So,
> 
> Fixes: 6cf5e9ef362a ("pinctrl: add pinctrl driver on mt8195")
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> Also this patch is unrelated to the rest. You should send it separately.
> This would also help the maintainer merge it directly.
> 

Hi Chen-Yu,

We will add Fixed tag for this patch and send it separately.

Thanks.

> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > ---
> >  drivers/pinctrl/mediatek/pinctrl-mt8195.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8195.c b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> > index a7500e18bb1d..892e79703f98 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mt8195.c
> > @@ -839,6 +839,7 @@ static struct platform_driver mt8195_pinctrl_driver = {
> >         .driver = {
> >                 .name = "mt8195-pinctrl",
> >                 .of_match_table = mt8195_pinctrl_of_match,
> > +               .pm = &mtk_paris_pinctrl_pm_ops,
> >         },
> >         .probe = mt8195_pinctrl_probe,
> >  };
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
