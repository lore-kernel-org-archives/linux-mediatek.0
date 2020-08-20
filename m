Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCEB2C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 11:21:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85D842078D
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 11:21:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1D7OoQG9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="R0qJtzBJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85D842078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HkL6gtC9ZDj76mrwC4OGR8UjqrdvY6zuA13JzMrcSS0=; b=1D7OoQG9SB6h+FTiZp8QkwnJS
	Xx2ILPwMr2UlRQ73Te0IHjgzgo/V6e+36tN5e/+OS/OR+Cf4EmyQl8Rrqz6ZwJiBbPYChT+WA4mQV
	DEvF8shRcqFKCWXqffMuzw0Pu3kyCpSJjbcUaxmLEq5bSKRu/ZEc6EHuSAXD59WPztGY8JzoslAR+
	sGpYsYMnaiPY5NuNP5SmJI2KsP4FffLTi5FCYAWyPYTFm62WgTYUhJRQgFj+4eSmiTPh9nyWfzjKt
	L0Q4+XZoJXCMaRq6XEvpO1pDjGQIPbINR+JJiiyLhRC0lZNf+9/SBrF155fGL8kLJmbkfV8uYiUri
	k0wgmFGdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8idP-0003fe-Vd; Thu, 20 Aug 2020 11:21:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8idL-0003f0-33; Thu, 20 Aug 2020 11:21:29 +0000
X-UUID: 2bf6356f5e244d098ac93a3caa74b1aa-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ohfEWTwXhQSMstYzm/6OXzB+lRaN+zQdjX8fExzTluA=; 
 b=R0qJtzBJ1vc+N8eEPOkeNxSCcZ1m//4Jc3Nf6S3JPSGBeA4C2Mlr/wxtO3VfddFN4Nzw2PISibZ0yQpJ64YKhp2UGPmLdk/r0rAYfGkD4GdCT5m59878o2NL/7esxDe7oOk0gTPOEuVF6tDNPTKFoIG84lFAxWtEVSQnd1kX+RA=;
X-UUID: 2bf6356f5e244d098ac93a3caa74b1aa-20200820
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 997170268; Thu, 20 Aug 2020 03:21:19 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 04:21:17 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 19:21:07 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 19:21:07 +0800
Message-ID: <1597922468.29505.1.camel@mtkswgap22>
Subject: Re: [PATCH] pinctrl: mediatek: check mtk_is_virt_gpio input parameter
From: Hanks Chen <hanks.chen@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>
Date: Thu, 20 Aug 2020 19:21:08 +0800
In-Reply-To: <CAGp9Lzq7H_KREyhxNy1zBsBJdFRAA7Zc1jkGc=ZiN_og1H9KBQ@mail.gmail.com>
References: <1597317260-24348-1-git-send-email-hanks.chen@mediatek.com>
 <CAGp9Lzq7H_KREyhxNy1zBsBJdFRAA7Zc1jkGc=ZiN_og1H9KBQ@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 84FF2A7FAAC6C2272C02EA56389C25CB737D14086DD27890545B84F223C0307A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_072127_356344_49B61A63 
X-CRM114-Status: GOOD (  24.41  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: CC Hwang <cc.hwang@mediatek.com>, sin_jieyang <sin_jieyang@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, lkml <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-08-19 at 16:43 -0700, Sean Wang wrote:
> Hi Hanks,
> 
> On Thu, Aug 13, 2020 at 4:14 AM Hanks Chen <hanks.chen@mediatek.com> wrote:
> >
> > check mtk_is_virt_gpio input parameter,
> > virtual gpio need to support eint mode.
> >
> > add error handler for the ko case
> > to fix this boot fail:
> > pc : mtk_is_virt_gpio+0x20/0x38 [pinctrl_mtk_common_v2]
> > lr : mtk_gpio_get_direction+0x44/0xb0 [pinctrl_paris]
> 
> it is better we post the complete call stack when the failure occurs
> 
> >
> > Fixes: edd546465002 ("pinctrl: mediatek: avoid virtual gpio trying to set reg")
> > Singed-off-by: sin_jieyang <sin_jieyang@mediatek.com>
> 
> signed-off-by with the full name

Got it, I'll update it in next version.

> 
> > Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> > ---
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > index c53e2c391e32..27ab9c512ae1 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > @@ -259,6 +259,10 @@ bool mtk_is_virt_gpio(struct mtk_pinctrl *hw, unsigned int gpio_n)
> >
> >         desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio_n];
> >
> > +       /* if the GPIO is not supported for eint mode */
> > +       if (desc->eint.eint_m == EINT_NA)
> 
> s/NO_EINT_SUPPORT/EINT_NA/ to align with pinctrl/mediatek/pinctrl-mtk-mt*.h uses

Got it, I'll fix it in next version.

Thanks for your reply


Hanks

> 
> > +               return virt_gpio;
> > +
> >         if (desc->funcs && !desc->funcs[desc->eint.eint_m].name)
> >                 virt_gpio = true;
> >
> > --
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
