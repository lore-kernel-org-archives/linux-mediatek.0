Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD52C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 09:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MkwepmJ7oPP0ueVckwbWKoBdn7jWrigmFbDUK7bIQA=; b=X8L7e4Re3ECjw0
	vqkuhQCLVPuiemUp9F4hhXmkgmbo3l135dYL+tPTAv27PsgDBn9b2hyxu503I5JKdzhPHPLDAWmVA
	MqGsV3lpmh3GOLS2sq/JsA9sFrMacSEbwK/NWJTsfAKsX6vVQ0SpBpXJHNyxUsa6zla9ca5bZc8qE
	KNerjwLpaqwwV8PhA2zhk2pd8J+QdfHH7GdxOD1fUBQQW/mVryDUpGHlomt8pDe5JxMOyLKbm3Gly
	ACbvApWx25Cchr4YkqCNMYXBQaWegzR3sIdf1T6JWLaxgQAOF3WIepIlmrifqQXIosBk/48kztDx7
	p88z3JMnMsG3D46IJGNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2V0q-002WTg-J3; Wed, 29 Dec 2021 09:12:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2V0d-002WRJ-Nn; Wed, 29 Dec 2021 09:12:37 +0000
X-UUID: 06492a7ac8294089aa2b752631cd529d-20211229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=IYlNhXTVg7RykrRTJ4Pn1wcnduyAqMsSQtTQ4GeTyeg=; 
 b=pHnK3QWr9rtEsX73rEBk80fcBTuzQcmoceD+5jxBto9ZdvarJilRRZpT7en2UmV4M10owvjocB6lPInh+as3PZU8lScV7PIq7ckkDcbqvUsCa2dLRXVaPu3shmHWvEVXRONcsz/gwF94Qd03CMQx9FReIMcvXYbIYDuOVJMPRC0=;
X-UUID: 06492a7ac8294089aa2b752631cd529d-20211229
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1258925094; Wed, 29 Dec 2021 02:12:22 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Dec 2021 01:12:21 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 29 Dec 2021 17:12:13 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Dec 2021 17:12:12 +0800
Message-ID: <36b3e42bf80da14782712de5f8c672191dd58073.camel@mediatek.com>
Subject: Re: [PATCH v1 3/3] mmc: mediatek: add support for SDIO eint irq
From: Axe Yang <axe.yang@mediatek.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, "Yoshihiro
 Shimoda" <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala
 <satyat@google.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach
 <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>, Andrew Jeffery
 <andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim
 <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>, Tian Tao
 <tiantao6@hisilicon.com>, linux-mmc <linux-mmc@vger.kernel.org>, devicetree
 <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Date: Wed, 29 Dec 2021 17:12:12 +0800
In-Reply-To: <CAHp75VcVx4Yf69TEoSy8GL-he9ZAW+yvoH8-DXAotQ3Mwx7n2A@mail.gmail.com>
References: <20211227083641.12538-1-axe.yang@mediatek.com>
 <20211227083641.12538-4-axe.yang@mediatek.com>
 <CAHp75VcVx4Yf69TEoSy8GL-he9ZAW+yvoH8-DXAotQ3Mwx7n2A@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_011235_951599_D33AC90C 
X-CRM114-Status: GOOD (  21.81  )
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

On Mon, 2021-12-27 at 19:27 +0200, Andy Shevchenko wrote:
> On Mon, Dec 27, 2021 at 6:46 PM Axe Yang <axe.yang@mediatek.com>
> wrote:
> 
> ...
> 
> > +       if (mmc->card && !mmc->card->cccr.enable_async_int) {
> > +               if (enb)
> 
> Spell it fully, i.e. enable.

Will fix it in next version.

> 
> 
> > +                       pm_runtime_get_noresume(host->dev);
> > +               else
> > +                       pm_runtime_put_noidle(host->dev);
> > +       }
> 
> ...
> 
> > +       int ret = 0;
> 
> Redundant assignment, see below.

Will fix it in next version.

> 
> ...
> 
> > +       desc = devm_gpiod_get_index(host->dev, "eint", 0,
> > GPIOD_IN);
> 
> Why _index variant? By default devm_gpiod_get() uses 0 for index.

Will fix it in next version.

> 
> > +       if (IS_ERR(desc))
> > +               return PTR_ERR(desc);
> 
> ...
> 
> > +       irq = gpiod_to_irq(desc);
> 
> ret = ...
> if (ret < 0)
>   ...handle error...

Will fix it in next version.

> 
> > +       if (irq >= 0) {
> 
> (for the record, 0 is never returned by gpiod_to_irq() according to
> all its versions).

Will fix it in next version.

> 
> > +               irq_set_status_flags(irq, IRQ_NOAUTOEN);
> 
> Use corresponding flag:
> 
https://elixir.bootlin.com/linux/latest/source/include/linux/interrupt.h#L83

I think IRQ_NOAUTOEN is the correct parameter I should use:

https://elixir.bootli.com/linux/latest/source/include/linux/irq.h#L800

IRQF_XXX defined in interrupt.h is only for xxx_request_xxx_irq().
Can you confirm that?

> 
> > +               ret = devm_request_threaded_irq(host->dev, irq,
> > NULL, msdc_sdio_eint_irq,
> > +                                               IRQF_TRIGGER_LOW |
> > IRQF_ONESHOT,
> > +                                               "sdio-eint", host);
> > +       } else {
> > +               ret = irq;
> > +       }
> > +
> > +       host->eint_irq = irq;
> 
> Is it okay if you assign garbage here in case of error?

Will refine this part in next version.

> 
> > +       return ret;
> 
> ...
> 
> > +       host->pins_eint = pinctrl_lookup_state(host->pinctrl,
> > "state_eint");
> > +       if (IS_ERR(host->pins_eint)) {
> > +               dev_dbg(&pdev->dev, "Cannot find pinctrl eint!\n");
> > +       } else {
> > +               host->pins_dat1 = pinctrl_lookup_state(host-
> > >pinctrl, "state_dat1");
> > +               if (IS_ERR(host->pins_dat1)) {
> > +                       ret = PTR_ERR(host->pins_dat1);
> > +                       dev_err(&pdev->dev, "Cannot find pinctrl
> > dat1!\n");
> 
> ret = dev_err_probe(...); ?

Will fix it in next version.

> 
> > +                       goto host_free;
> > +               }
> > +       }
> 
> ...
> 
> > +       if (!IS_ERR(host->pins_eint)) {
> 
> I'm wondering if you can use a pattern "error check first"?

The intention of this line is to determine whether current mmc device
is a SDIO card which supports eint, not for error check. But, since it
may bring ambiguity, I will implement it in another way. Thanks for
your advice.

...

--
Regards,
Axe Yang

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
