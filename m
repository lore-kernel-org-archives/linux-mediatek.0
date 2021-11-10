Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8689C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 07:08:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72A76611AD
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 07:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 72A76611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1QKKz75yuTVjKb7sDO1RAmKQrQz44jqRXSrj3UeqUrQ=; b=ZoL/EkhpdrNaID
	BR73GyMfsWcVYoPHHzZz3Uw1aYL4J5Lm+KJbTjEMBCwoN2U+UOd0rslyn0XK+ZXl1HFjw+muKTwg+
	k+MV3v+rz0sGNJ2FHlDdVHbX/JNMYjk1ynx6PWD1qKU3BHNbHBOva0XduQ7wfFBvehfgQDAIvdePr
	kk6D+CWyUocEk/rqzSMZmG3slkQXDbKGDPiJR3qP/2wdpjf+i/p7QTTtFpgmzpSsuyPuaVwDpFvlW
	QmwshJ5Af0Tf7v+ck8DcSQFJWI2zRraJWh8M94364NSOJwxchsUPobDGeDEGX4X62NB9oVhUVPnjM
	QeA5dnavqiMuFk+8jAeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkhid-004ePB-DE; Wed, 10 Nov 2021 07:08:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkhiP-004eMN-FP; Wed, 10 Nov 2021 07:08:15 +0000
X-UUID: 516884396a534858a47392b69262d81f-20211110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ItwlDnlQgUykQbgi7IHcDd6WZdPNkyCL1SNvs8RgwJI=; 
 b=DtuwiuIkuFj2sRu0iGpXJ1lYY8yWOt92b8vhdGjS6PMN8gFJOMEYjv6Irl8yp4itXxHo0z0fzUq8mV1UXuac6+96cVPM32H7HW0LcAgKNaVjXH3BNIAIhuBiwEz/uiMp/2L9w82f6i8ygSytr5DhKdT/CErzbcwXwqTpvFxuji8=;
X-UUID: 516884396a534858a47392b69262d81f-20211110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2005943005; Wed, 10 Nov 2021 00:08:07 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Nov 2021 23:02:47 -0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 10 Nov 2021 15:02:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 10 Nov 2021 15:02:44 +0800
Message-ID: <5efca75edf7dce93359f560f302e4728101e38f1.camel@mediatek.com>
Subject: Re: [PATCH v3] pinctrl: mediatek: fix global-out-of-bounds issue
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>,
 <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>,
 <light.hsieh@mediatek.com>, <sean.wang@mediatek.com>,
 <seiya.wang@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <guodong.liu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>, "Guodong
 Liu" <guodong.liu@mediatek.corp-partner.google.com>
Date: Wed, 10 Nov 2021 15:02:44 +0800
In-Reply-To: <CAGXv+5Entn5QnCODgbUSdDFSds4z+_QJ6cD39yEoLndms+rY7Q@mail.gmail.com>
References: <20211110021411.31761-1-zhiyong.tao@mediatek.com>
 <20211110021411.31761-2-zhiyong.tao@mediatek.com>
 <CAGXv+5Entn5QnCODgbUSdDFSds4z+_QJ6cD39yEoLndms+rY7Q@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_230813_549869_91C6740A 
X-CRM114-Status: GOOD (  26.65  )
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

On Wed, 2021-11-10 at 13:54 +0800, Chen-Yu Tsai wrote:
> On Wed, Nov 10, 2021 at 10:14 AM Zhiyong Tao <
> zhiyong.tao@mediatek.com> wrote:
> > 
> > From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
> > 
> > When eint virtual eint number is greater than gpio number,
> > it maybe produce 'desc[eint_n]' size globle-out-of-bounds issue.
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> > Signed-off-by: Guodong Liu <
> > guodong.liu@mediatek.corp-partner.google.com>
> 
> The order of Signed-off-by is still reversed though. The author comes
> first,
> then comes everyone who subsequently handled the patch.
> 
> Once fixed,
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> Also, for single patches, you don't really need to have a cover
> letter.
> Any info you would convey through the cover letter, such as
> changelogs,
> additional context, or whose tree you would like it merged through,
> can
> be put after the triple-dash ...
> 
> > ---
> 
> here. Text put here won't get included in the commit log.

Thanks for your suggestion, we will fix it in next version(v4).

> 
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
