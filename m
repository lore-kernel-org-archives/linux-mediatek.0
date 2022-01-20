Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9FFC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jan 2022 01:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TNJPV5zXHp6++JDM59Ag5BwETT/32+pAD+zdAvWjZY0=; b=Sgg5EYTJiwf1cD
	HutM6u8VWhGQWEomQAXeJ3oMDIFXqUXh6MRkOD/SLM7BaBYZ+wjNF5QShtepAY8ej9o9xo4Y5WjX7
	LHU2aA8zGL5qPfVnEu8rcxHQj6Z55Tac7JPF/40mqNrkMoaXxEQsmWG8zwWmQFmEbhaNrDPWzeGg3
	LTTeBhceWVtBg3azucMWov/qeiJpk9ZsM79tblSrV5htVULwXhgP5w4PPNu8LdVTQ5nnuNSBYX0Iz
	Zjrk29ipx91xNTTerbUP+cDd9Bw/Rf2irxEHNVBoGgzQV0QXW4DNCL07+kHaD/30zdZymrx0IAIEt
	/fDXxACnCWYKRC6E/Fqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAMXh-008E34-O4; Thu, 20 Jan 2022 01:47:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAMXe-008E1l-0m; Thu, 20 Jan 2022 01:47:11 +0000
X-UUID: d8adab46266546a7b001c755674ba5d3-20220119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=h1+9eioGHFyC8guZ8M8Y+/FUxCp4CSSJZoZbXagxQ0M=; 
 b=LG4mOQ45APuGOKbzlvNzpr3uWDaDSVqQmz8xTzfeejaX92MGNNMpvbg3VBxCwFmwMDVUqNQ+uO6nbzYcE37h7wzEGac0sITMn6kLmquEgnyJTP6TlFgS/ZbQavVXcgfC1Go9uvBJ71L84vDPi+i5Irg/o/TOz8DRCc2HT5PK9EI=;
X-UUID: d8adab46266546a7b001c755674ba5d3-20220119
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <guodong.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 95439545; Wed, 19 Jan 2022 18:47:04 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 17:47:02 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 20 Jan 2022 09:47:01 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Jan 2022 09:47:00 +0800
Message-ID: <883391d5642d217e79fb09bebd81f9b5027ce20a.camel@mediatek.com>
Subject: Re: [PATCH 2/7] pinctrl: mediatek: paris: Fix
 PIN_CONFIG_BIAS_DISABLE readback
From: Guodong Liu <guodong.liu@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Sean Wang <sean.wang@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Hui Liu <hui.liu@mediatek.com>,
 "Light Hsieh" <light.hsieh@mediatek.com>
Date: Thu, 20 Jan 2022 09:47:00 +0800
In-Reply-To: <CAGXv+5GHVtCO9tN7B0O2c5V_Bk61-LL79LvbE1CRbyBfnvKSGQ@mail.gmail.com>
References: <20220111112244.1483783-1-wenst@chromium.org>
 <20220111112244.1483783-3-wenst@chromium.org>
 <eca4a0c18fe75536c8276410628b9459c040dce2.camel@mediatek.com>
 <CAGXv+5GHVtCO9tN7B0O2c5V_Bk61-LL79LvbE1CRbyBfnvKSGQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_174710_096766_E2AB0B0E 
X-CRM114-Status: GOOD (  25.50  )
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

-----Original Message-----
From: Chen-Yu Tsai <wenst@chromium.org>
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <
linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
Zhiyong Tao <zhiyong.tao@mediatek.com>, Hui Liu <hui.liu@mediatek.com>,
Light Hsieh <light.hsieh@mediatek.com>
Subject: Re: [PATCH 2/7] pinctrl: mediatek: paris: Fix
PIN_CONFIG_BIAS_DISABLE readback
Date: Wed, 19 Jan 2022 13:57:18 +0800

On Wed, Jan 19, 2022 at 9:42 AM Guodong Liu <guodong.liu@mediatek.com>
wrote:
> 
> -----Original Message-----
> From: Chen-Yu Tsai <wenst@chromium.org>
> To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <
> linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Chen-Yu Tsai <wenst@chromium.org>,
> linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
> linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
> Zhiyong Tao <zhiyong.tao@mediatek.com>, Guodong Liu <
> guodong.liu@mediatek.com>
> Subject: [PATCH 2/7] pinctrl: mediatek: paris: Fix
> PIN_CONFIG_BIAS_DISABLE readback
> Date: Tue, 11 Jan 2022 19:22:39 +0800
> 
> When reading back pin bias settings, if the pin is not in a
> bias-disabled state, the function should return -EINVAL.
> 
> Fix this in the mediatek-paris pinctrl library so that the read back
> state is not littered with bogus a "input bias disabled" combined
> with
> "pull up" or "pull down" states.
> 
> Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that
> implements the vendor dt-bindings")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/pinctrl/mediatek/pinctrl-paris.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c
> b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index f9f9110f2107..1ca598ea7ba7 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -97,8 +97,8 @@ static int mtk_pinconf_get(struct pinctrl_dev
> *pctldev,
>                         if (err)
>                                 goto out;
>                         if (param == PIN_CONFIG_BIAS_DISABLE) {
> -                               if (ret == MTK_PUPD_SET_R1R0_00)
> -                                       ret = MTK_DISABLE;
> +                               if (ret != MTK_PUPD_SET_R1R0_00)
> +                                       err = -EINVAL;
> Hi Chen-Yu
> 
> When the API "hw->soc->bias_get_combo(hw, desc, &pullup, &ret)" is
> called,
> The ret vaule of ret may be MTK_DISABLE or MTK_PUPD_SET_R1R0_00
> or  (pullen
> == 0),  All those cases are expected to be as "bias-disable".
> We advices to keep original code,
> +                               if (ret == MTK_PUPD_SET_R1R0_00)
> +                                       ret = MTK_DISABLE;
> +                               if (ret != MTK_DISABLE)
> +                                       err = -EINVAL;

IIUC you are suggesting to assign MTK_DISABLE to ret in the other two
cases,
and then check if ret == MTK_DISABLE.

Thanks for pointing that out.

ChenYu

> Thanks

Hi Chen-Yu

Yes, just for pins with config of MTK_PUPD_SET_R1R0_00 are required to
do additional assignment operations(ret = MTK_DISABLE;), in the other
two cases, the assignment operations of ret as MTK_DISABLE is obtained
by function call "hw->soc->bias_get_combo(hw, desc, &pullup, &ret)".

Thanks

>                         } else if (param == PIN_CONFIG_BIAS_PULL_UP)
> {
>                                 /* When desire to get pull-up value,
> return
>                                  *  error if current setting is pull-
> down
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
