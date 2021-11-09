Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1DAC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 01:47:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB72161104
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 01:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB72161104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSgaxzxLLIzf4ZZ3KjOqjnbysSRR9suM5OqNhqfTgXw=; b=P9V0/soRJF7EH9
	t8a1wPOnc/20o42JoiBgLckbN3X0P+blyR8UVGpG/uo1VSh1zKzc1gwaJ9fftFFRWeL/xL76P8eYs
	iRkOfjkz0m+joZAU1tXAdKtVXsMcyyVT8eb1m1w/Y0lfEGv0P1vi5o93x6+kZCvz47+bNTzPyPgNU
	edYO8pmgi6ViGuJif5Le9sw+kkEQc3Fg9iFRmXbJrSJqY9OAi/oh/XnL7/940ZsZtmsUmUVv0xcSA
	pm7l9h+jFQWdP/vKBOZxvVDbL9f3t21toKuQoTyjUZxvXUEV//ezSC99vxRO+lRDVAEjdae9zjmsM
	U/NxDUibSTQhndp8Mr6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkGE4-000SqM-4F; Tue, 09 Nov 2021 01:47:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkGCd-000SFV-9O; Tue, 09 Nov 2021 01:45:38 +0000
X-UUID: 8c9b46939c7b49998c5ff080103fd42e-20211108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3jry03xfqOwDfpbKOW6VGx3Xuj5KTDuIsp0lgJKYo5g=; 
 b=XE4ALOruDyoBiEGkAQtqOs1QhwetA7b3r7KA3LdhJkLBM6p2B6Hf8usP7TZQD9hbymDBqp1X8ShuSolWKh5i/si99YI5ho6HxwwAFHFvChhsf9zrUUqRP8pWoXx87Jgl6pIzvIcUDxIdyPyzmIxSPD5o0+EEJlBBz5w+BAzTcVI=;
X-UUID: 8c9b46939c7b49998c5ff080103fd42e-20211108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 566031262; Mon, 08 Nov 2021 18:45:31 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Nov 2021 17:43:53 -0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 9 Nov 2021 09:43:51 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 9 Nov 2021 09:43:50 +0800
Message-ID: <511a65714cdd9e4ffe5548a44b62663b1b921623.camel@mediatek.com>
Subject: Re: [PATCH v1] pinctrl: mediatek: fix global-out-of-bounds issue
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>,
 <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>,
 <light.hsieh@mediatek.com>, <sean.wang@mediatek.com>,
 <seiya.wang@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-gpio@vger.kernel.org>, Guodong Liu
 <guodong.liu@mediatek.corp-partner.google.com>
Date: Tue, 9 Nov 2021 09:43:50 +0800
In-Reply-To: <CAGXv+5EWCkcC51nNF4k1FgEsVhuiQADCiOcdSLtU9yMb-8Q0GA@mail.gmail.com>
References: <20211104112329.8446-1-zhiyong.tao@mediatek.com>
 <20211104112329.8446-2-zhiyong.tao@mediatek.com>
 <CAGXv+5EWCkcC51nNF4k1FgEsVhuiQADCiOcdSLtU9yMb-8Q0GA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_174536_790964_C1E156AF 
X-CRM114-Status: GOOD (  31.99  )
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

On Mon, 2021-11-08 at 16:32 +0800, Chen-Yu Tsai wrote:
> On Thu, Nov 4, 2021 at 7:24 PM Zhiyong Tao <zhiyong.tao@mediatek.com>
> wrote:
> 
> This should be tagged as v2. Your first submission, not tagged with
> any
> version or RFC/RFT, is v1.

Hi Chen-Yu,

Thanks for your suggestion, so we will send next patch version as V3.

> 
> > When eint virtual eint number is greater than gpio number,
> > it maybe produce 'desc[eint_n]' size globle-out-of-bounds issue.
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > Signed-off-by: Guodong Liu <
> > guodong.liu@mediatek.corp-partner.google.com>
> 
> Guodong's Signed-off-by here is confusing, as they are not the author
> nor
> the submitter, and as far as the mailing list is concerned they have
> not
> handled this patch either.
> 
> Looks like the original patch is from https://crrev.com/c/3233623 ?

> 
> It's customary to preserve the authorship and append your Signed-off-
> by
> when submitting patches written by others.
> 

yes, it is from the original patch "https://crrev.com/c/3233623".
we will preserve the authorship and append my Signed-off-by
in next version.

> > ---
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > index 45ebdeba985a..12163d3c4bcb 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > @@ -285,8 +285,12 @@ static int mtk_xt_get_gpio_n(void *data,
> > unsigned long eint_n,
> >         desc = (const struct mtk_pin_desc *)hw->soc->pins;
> >         *gpio_chip = &hw->chip;
> > 
> > -       /* Be greedy to guess first gpio_n is equal to eint_n */
> > -       if (desc[eint_n].eint.eint_n == eint_n)
> > +       /*
> > +        * Be greedy to guess first gpio_n is equal to eint_n.
> > +        * Only eint virtual eint number is greater than gpio
> > number.
> > +        */
> > +       if (hw->soc->npins > eint_n &&
> 
> Nit: I believe it's more common to have the variable on the left, and
> the
> invariable on the right, but maybe it's just me:
> 
>     if (eint_n < hw->soc->npins && ...
> 
> Either way is OK I guess.
> 
we keep it as 'hw->soc->npins > eint_n', so that is can be consistent
with 'desc[eint_n].eint.eint_n == eint_n'. 

Thanks

> 
> ChenYu
> 
> > +           desc[eint_n].eint.eint_n == eint_n)
> >                 *gpio_n = eint_n;
> >         else
> >                 *gpio_n = mtk_xt_find_eint_num(hw, eint_n);
> > --
> > 2.25.1
> > 
> > 
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
