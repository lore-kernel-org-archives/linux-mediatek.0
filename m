Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56EEC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 07:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jpibmgjARzfGwNfhHdJFfkiorHbDOP4SJ+saSfemng=; b=4H2ZmhDRsfS2wr
	p2gIVccZCB3uOFGEl2Jf6rykJKtnVh6DEkJxKwBUK41zexg0ZTAOz04ZYTDzW9zEQFOAnpXm7O+ba
	wHqpYbuHV67z2sXBycSRyKkFeWMsfDWGKRJcq0Q/EZR76dlmj9DL50A24beVQQ168/2T2deRhk8yZ
	Odhk53yNXwTYtCMpLXrdedyRay3EHUOQgCDqpE+SlM5joTVvCZCDy40AuGP/bE3aWPOnjfFN71QKT
	w67qQfOccU0shthkBxLDvqtpjkh2srPsTJrqcW5iPbtfx5R6aFQgDp1E1umZEgCRZfDYBYvf8BLRL
	XMY1E+RfnJQTVNX0TPiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM3IM-004313-V6; Mon, 21 Feb 2022 07:39:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM3IK-0042zO-Jd; Mon, 21 Feb 2022 07:39:42 +0000
X-UUID: 88f0a7f93bb84971800a2539330a8485-20220221
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FxE26pzaMWzEBO5INCK7p0nHU6GqHn4naPQp7BN1N0Y=; 
 b=Dgj1p+z5pXkrw1J8VmWUpabwdh42K5qCgaOryDYlOHJHg2LA0pT/ehl4hozyhbmoz3VzkeAUoIbHUQpXfmD5WnP9Ds9ZHitDGJUC8PISO9ak/zoWyjUCe/QLz7uOJ8qoQauMZJQyfJm6Dzc58jrt5nJFkeUFK3D6dJZnbG7wusE=;
X-UUID: 88f0a7f93bb84971800a2539330a8485-20220221
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <axe.yang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1253980141; Mon, 21 Feb 2022 00:39:37 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 20 Feb 2022 23:29:34 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 21 Feb 2022 15:29:21 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 21 Feb 2022 15:29:20 +0800
Message-ID: <4be20cf9fd351c17414945a2fa199c490a0ff8d6.camel@mediatek.com>
Subject: Re: [PATCH v5 2/3] mmc: core: Add support for SDIO async interrupt
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
Date: Mon, 21 Feb 2022 15:29:19 +0800
In-Reply-To: <CAPDyKFqd+H6F4+gBd4CEigaOTC5TtjtT75B3G0B6qexFi6XqKw@mail.gmail.com>
References: <20220121071942.11601-1-axe.yang@mediatek.com>
 <20220121071942.11601-3-axe.yang@mediatek.com>
 <CAPDyKFqd+H6F4+gBd4CEigaOTC5TtjtT75B3G0B6qexFi6XqKw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_233940_681971_A3E0F26D 
X-CRM114-Status: GOOD (  33.23  )
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

On Mon, 2022-02-14 at 16:34 +0100, Ulf Hansson wrote:
> On Fri, 21 Jan 2022 at 08:19, Axe Yang <axe.yang@mediatek.com> wrote:
> > 
> > If cap-sdio-async-irq flag is set in host dts node, parse EAI
> > information from SDIO CCCR interrupt externsion segment. If async
> > interrupt is supported by SDIO card then send command to card to
> > enable it and set enable_async_irq flag in sdio_cccr structure to
> > 1.
> > The parse flow is implemented in sdio_read_cccr().
> > 
> > Acked-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Axe Yang <axe.yang@mediatek.com>
> > ---
> >  drivers/mmc/core/host.c  |  2 ++
> >  drivers/mmc/core/sdio.c  | 17 +++++++++++++++++
> >  include/linux/mmc/card.h |  3 ++-
> >  include/linux/mmc/host.h |  1 +
> >  include/linux/mmc/sdio.h |  5 +++++
> >  5 files changed, 27 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> > index cf140f4ec864..a972241548b4 100644
> > --- a/drivers/mmc/core/host.c
> > +++ b/drivers/mmc/core/host.c
> > @@ -410,6 +410,8 @@ int mmc_of_parse(struct mmc_host *host)
> >         if (device_property_read_bool(dev, "no-mmc-hs400"))
> >                 host->caps2 &= ~(MMC_CAP2_HS400_1_8V |
> > MMC_CAP2_HS400_1_2V |
> >                                  MMC_CAP2_HS400_ES);
> > +       if (device_property_read_bool(dev, "cap-sdio-async-irq"))
> > +               host->caps2 |= MMC_CAP2_SDIO_ASYNC_IRQ;
> > 
> >         /* Must be after "non-removable" check */
> >         if (device_property_read_u32(dev, "fixed-emmc-driver-type", 
> > &drv_type) == 0) {
> > diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
> > index 41164748723d..771fb5d18585 100644
> > --- a/drivers/mmc/core/sdio.c
> > +++ b/drivers/mmc/core/sdio.c
> > @@ -225,6 +225,23 @@ static int sdio_read_cccr(struct mmc_card
> > *card, u32 ocr)
> >                                 card->sw_caps.sd3_drv_type |=
> > SD_DRIVER_TYPE_C;
> >                         if (data & SDIO_DRIVE_SDTD)
> >                                 card->sw_caps.sd3_drv_type |=
> > SD_DRIVER_TYPE_D;
> > +
> > +                       if (card->host->caps2 &
> > MMC_CAP2_SDIO_ASYNC_IRQ) {
> 
> We can probably check host->pm_caps & MMC_PM_WAKE_SDIO_IRQ here,
> instead of MMC_CAP2_SDIO_ASYNC_IRQ.

Will update this part in next version.

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
> 
> As you show in the next patch(3), this flag is useful to read for the
> host driver.
> 
> However, rather than accessing this flag directly in the host driver,
> can you please add a helper function that takes a struct mmc_card* as
> in-parameter instead?

OK. I will do that in next version.

> 
> > +                               }
> > +                       }
> >                 }
> > 
> >                 /* if no uhs mode ensure we check for high speed */
> > diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
> > index 37f975875102..4df9182bc0e6 100644
> > --- a/include/linux/mmc/card.h
> > +++ b/include/linux/mmc/card.h
> > @@ -219,7 +219,8 @@ struct sdio_cccr {
> >                                 wide_bus:1,
> >                                 high_power:1,
> >                                 high_speed:1,
> > -                               disable_cd:1;
> > +                               disable_cd:1,
> > +                               enable_async_irq:1;
> >  };
> > 
> >  struct sdio_cis {
> > diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> > index 7afb57cab00b..502a5418264c 100644
> > --- a/include/linux/mmc/host.h
> > +++ b/include/linux/mmc/host.h
> > @@ -402,6 +402,7 @@ struct mmc_host {
> >  #define MMC_CAP2_CRYPTO                0
> >  #endif
> >  #define MMC_CAP2_ALT_GPT_TEGRA (1 << 28)       /* Host with eMMC
> > that has GPT entry at a non-standard location */
> > +#define MMC_CAP2_SDIO_ASYNC_IRQ        (1 << 29)       /* SDIO
> > host supports asynchronous interrupt */
> > 
> >         int                     fixed_drv_type; /* fixed driver
> > type for non-removable media */
> > 
> > diff --git a/include/linux/mmc/sdio.h b/include/linux/mmc/sdio.h
> > index 2a05d1ac4f0e..1ef400f28642 100644
> > --- a/include/linux/mmc/sdio.h
> > +++ b/include/linux/mmc/sdio.h
> > @@ -159,6 +159,11 @@
> >  #define  SDIO_DTSx_SET_TYPE_A  (1 << SDIO_DRIVE_DTSx_SHIFT)
> >  #define  SDIO_DTSx_SET_TYPE_C  (2 << SDIO_DRIVE_DTSx_SHIFT)
> >  #define  SDIO_DTSx_SET_TYPE_D  (3 << SDIO_DRIVE_DTSx_SHIFT)
> > +
> > +#define SDIO_CCCR_INTERRUPT_EXT        0x16
> > +#define SDIO_INTERRUPT_EXT_SAI (1 << 0)
> > +#define SDIO_INTERRUPT_EXT_EAI (1 << 1)
> > +
> >  /*
> >   * Function Basic Registers (FBR)
> >   */
> 
Regards,
Axe Yang

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
