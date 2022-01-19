Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB761C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 10:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Al17gu2AqfhoPULcAAc70D8PPpCmZAzrq2uwj1YjLPE=; b=BWlrggG1g3/pKz
	F+72SP8C2tYUh213IcRIsNPA3uSUXRsD1m3NxSoL7X6TZNcKeOy+PNLaoe3z3GaMpHLR9i3aJCqKm
	KEa2w26jDBmKTDkjXC0h18OjbY0v22SyPgwTY1PTgf3SggR+sRxMj1eHKBurvo/tJY/cnJznvb55X
	jQ6jo8sGeKaCyER3p2+5YGqdLsoy8smNDJqdXQvqHX6YLFEuGh0WkxZ3SnhwTIuJq+xLOHWCx/BFd
	H1NpryAB2XWnGSjRylOxSNqC+OVx/LtTAWxqICWqP2zUHTk0mMvqp5GqQmAFAk7NEQ2WWGSY7rOo7
	YefjNtrwXu23stgbGdkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA86H-004t4s-Kw; Wed, 19 Jan 2022 10:21:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA86F-004t3L-3X; Wed, 19 Jan 2022 10:21:56 +0000
X-UUID: e5d396ee78cd462daba8c8917f1c5366-20220119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JdoJGBA8s/Lspa+YSqEekANj4wfMz52MVNjpNCuIGqU=; 
 b=J/EZ94P2RqnyxCc83tX1C7P6ydxXlCE8UbL6yXg/Ri64iYqGAV1g5V0YZ3BjuxxSuSDzcRJIZ1ECVqAotHJQJN8KpWK+ctW74+N+iaRpgIQcL5HMd8t68k4UtPFgrw/ahR7qugogU6vyuEb8UJiFsd0DxSi/Pw66Says7Kamgv8=;
X-UUID: e5d396ee78cd462daba8c8917f1c5366-20220119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 157147558; Wed, 19 Jan 2022 03:21:48 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 02:11:46 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 19 Jan 2022 18:11:45 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Jan 2022 18:11:44 +0800
Message-ID: <068c965a0243486f0e1cabbafb8904a6a8ddcc9f.camel@mediatek.com>
Subject: Re: [RESEND v3 3/3] mmc: mediatek: add support for SDIO eint IRQ
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
 <tiantao6@hisilicon.com>, <angelogioacchino.delregno@collabora.com>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Yong Mao <yong.mao@mediatek.com>
Date: Wed, 19 Jan 2022 18:11:43 +0800
In-Reply-To: <CAHp75VdkKYujGZOdGkLK-tzC9q+RjkX59fFZe5cHajGOnDdL2w@mail.gmail.com>
References: <20220117082539.18713-1-axe.yang@mediatek.com>
 <20220117082539.18713-4-axe.yang@mediatek.com>
 <CAHp75VdkKYujGZOdGkLK-tzC9q+RjkX59fFZe5cHajGOnDdL2w@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_022155_190584_9B75431C 
X-CRM114-Status: GOOD (  22.67  )
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

On Tue, 2022-01-18 at 11:18 +0200, Andy Shevchenko wrote:
> On Mon, Jan 17, 2022 at 7:33 PM Axe Yang <axe.yang@mediatek.com>
> wrote:
> > 
> > Add support for eint IRQ when MSDC is used as an SDIO host. This
> > feature requires SDIO device support async IRQ function. With this
> > feature, SDIO host can be awakened by SDIO card in suspend state,
> > without additional pin.
> > 
> > MSDC driver will time-share the SDIO DAT1 pin. During suspend, MSDC
> > turn off clock and switch SDIO DAT1 pin to GPIO mode. And during
> > resume, switch GPIO function back to DAT1 mode then turn on clock.
> > 
> > Some device tree property should be added or modified in MSDC node
> > to support SDIO eint IRQ. Pinctrls named state_dat1 and state_eint
> > are mandatory. And cap-sdio-async-irq flag is necessary since this
> > feature depends on asynchronous interrupt:
> >         &mmcX {
> >                 ...
> >                 pinctrl-names = "default", "state_uhs",
> > "state_eint",
> >                                 "state_dat1";
> >                 ...
> >                 pinctrl-2 = <&mmc2_pins_eint>;
> >                 pinctrl-3 = <&mmc2_pins_dat1>;
> >                 ...
> >                 cap-sdio-async-irq;
> >                 ...
> >         };
> 
> ...
> 
> > +static irqreturn_t msdc_sdio_eint_irq(int irq, void *dev_id)
> > +{
> > +       struct msdc_host *host = dev_id;
> > +       struct mmc_host *mmc = mmc_from_priv(host);
> > +       unsigned long flags;
> 
> Same Q as per v2. Why do you need this?
> 
> Yes, you did the first step to the answer, but I want you to go
> deeper
> and tell me why you need the spin_lock_irqsave() variant.

You are right, no need to save/restore flags in irq handler.
Will fix it in new version.
Thanks.

> 
> > +       spin_lock_irqsave(&host->lock, flags);
> > +       if (likely(host->sdio_irq_cnt > 0)) {
> > +               disable_irq_nosync(host->eint_irq);
> > +               disable_irq_wake(host->eint_irq);
> > +               host->sdio_irq_cnt--;
> > +       }
> > +       spin_unlock_irqrestore(&host->lock, flags);
> > +
> > +       sdio_signal_irq(mmc);
> > +
> > +       return IRQ_HANDLED;
> > +}
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
