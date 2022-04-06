Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AE0C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HnTKBH4jgxdLFVQWtjDSfjJUhOsRphZCrjP6QyMAXYQ=; b=TDixCRWT3497No
	lZYXflUodjEupaqFXCeL67N6IGUnTwCNNl0zgjOh2Ed+YX7pUPL4Imb+SezCjnK4gM0xCEhk+j0Ry
	irRhOak52LKa1YUvytpbTPQdSTi1jGauztgowCkLUtasL7Ym8U+Z389qjM1qGzPE58elscipplvk8
	I0LPMTQG74I2tE/GAAT5ZaW6hloEIuFwWbk+kcIQDmPXGQaaRMvdPtvBSos3a+Jbdt+wNLYK8c8eU
	MKlarNigmYtyr7LJtRu1PHcaDabWM4vvjW9vjUvjlV9mtcKHp6U62/JjZXIhDrGtWqBENdGeokuDi
	3jH8YZ9WsEjLpoaRcQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc2Tg-005CYZ-MT; Wed, 06 Apr 2022 10:01:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc2KD-0058Po-0N; Wed, 06 Apr 2022 09:51:46 +0000
X-UUID: a34536715eab41198565e72b4469ea63-20220406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=KPxsJq7VQ1ntZBjz6Sn3kCS9TKTmeC6nIWwqsfBeIsk=; 
 b=mO14pr10mCeRLunoGoyevRwk12s9moEyBZhSEdcpuSuBLIgpFiXcfR3JZDEOrUHBoWgJgu6onZh26VPQNngqu3SLrsKruKY3HqzrJfbLJm+3AZ4n9rxdubyWp4tx2u8oQZUsYooVgy9g+TwSU5vDtGq2exPcoapzZsyrHvwpe/k=;
X-UUID: a34536715eab41198565e72b4469ea63-20220406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 922207048; Wed, 06 Apr 2022 02:51:39 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 02:41:37 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 17:41:36 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Apr 2022 17:41:34 +0800
Message-ID: <174a42437212ed26ecc08d1a35d20717d0346158.camel@mediatek.com>
Subject: Re: [PATCH v9 2/3] mmc: core: Add support for SDIO wakeup interrupt
From: Axe Yang <axe.yang@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Chaotian Jing
 <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala <satyat@google.com>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>, "Eric
 Biggers" <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, "Stephen
 Boyd" <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu
 <huyue2@yulong.com>, Tian Tao <tiantao6@hisilicon.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-mmc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Wed, 6 Apr 2022 17:41:34 +0800
In-Reply-To: <CAPDyKFqzNJxt8RhQ5ABLqqkVaJmRPDFu=QuSUvAr-eW9SK4fSw@mail.gmail.com>
References: <20220329032913.8750-1-axe.yang@mediatek.com>
 <20220329032913.8750-3-axe.yang@mediatek.com>
 <CAPDyKFqzNJxt8RhQ5ABLqqkVaJmRPDFu=QuSUvAr-eW9SK4fSw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_025141_238320_65C5FEA0 
X-CRM114-Status: GOOD (  22.61  )
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

On Fri, 2022-04-01 at 14:42 +0200, Ulf Hansson wrote:
> On Tue, 29 Mar 2022 at 05:29, Axe Yang <axe.yang@mediatek.com> wrote:
> > 
> > If wakeup-source flag is set in host dts node, parse EAI
> > information
> > from SDIO CCCR interrupt externsion segment for in-band wakeup. If
> > async interrupt is supported by SDIO card then enable it and set
> > enable_async_irq flag in sdio_cccr structure to 1. The parse flow
> > is
> > implemented in sdio_read_cccr().
> > 
> > Acked-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> > ---
> >  drivers/mmc/core/sdio.c  | 17 +++++++++++++++++
> >  include/linux/mmc/card.h |  8 +++++++-
> >  include/linux/mmc/sdio.h |  5 +++++
> >  3 files changed, 29 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
> > index 25799accf8a0..4898c5e9a299 100644
> > --- a/drivers/mmc/core/sdio.c
> > +++ b/drivers/mmc/core/sdio.c
> > @@ -226,6 +226,23 @@ static int sdio_read_cccr(struct mmc_card
> > *card, u32 ocr)
> >                                 card->sw_caps.sd3_drv_type |=
> > SD_DRIVER_TYPE_C;
> >                         if (data & SDIO_DRIVE_SDTD)
> >                                 card->sw_caps.sd3_drv_type |=
> > SD_DRIVER_TYPE_D;
> > +
> > +                       if (card->host->pm_caps &
> > MMC_PM_WAKE_SDIO_IRQ) {
> 
> After a second thought, I think we can just skip this check. The
> MMC_PM_WAKE_SDIO_IRQ indicates that the host supports SDIO IRQs as
> *system wakeups*.
> 
> But, in fact, I think we want this feature to be enabled to allow
> waking up for runtime_suspend (RPM_SUSPENDED) too.
> 
> > +                               ret = mmc_io_rw_direct(card, 0, 0,
> > SDIO_CCCR_INTERRUPT_EXT, 0,
> > +                                                      &data);
> > +                               if (ret)
> > +                                       goto out;
> > +
> > +                               if (data & SDIO_INTERRUPT_EXT_SAI)
> > {
> > +                                       data |=
> > SDIO_INTERRUPT_EXT_EAI;
> > +                                       ret =
> > mmc_io_rw_direct(card, 1, 0, SDIO_CCCR_INTERRUPT_EXT,
> > +                                                              data
> > , NULL);
> > +                                       if (ret)
> > +                                               goto out;
> > +
> > +                                       card->cccr.enable_async_irq 
> > = 1;
> > +                               }
> > +                       }
> >                 }
> 
> 
Will skip this check in next version. Thanks.

Regards,
Axe
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
