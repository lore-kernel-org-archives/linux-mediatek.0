Return-Path: <SRS0=eXAR=6E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A3A9C3815B
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 11:02:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ABE020724
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 11:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bv+F8Q/T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Lb/JZR/e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ABE020724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sc1kDAGDT/W12XrXFo/VaYhXZYXYaAGOiTUA1QGrq+w=; b=bv+F8Q/TuwuqyI
	howIfGGhIGz5rW254B8U5t4MUGWLDe7CygqZS2Wv0QfeYJCuMsHcWCR3pduE+VDhxVferuATlAsI5
	8eg0MHFtQI526zIU0DsoFVqJ8ar7LHikXqbw5Y5+9QF13px3N8Jv71yHHl8LvitFTof++HTWVU4Yc
	Dt4SGibjtm2JLeMnMK1gF1hEQTYoppYUPXGX8uZPqMo/0Em1WiDRqkmb29bYarscMJR4bnKYPm0S+
	1U1+zlSNNX5zJ/YCmjrl5iZnO63qdEOb6lgkkrbQjqkfjsYJzcQrd20R2XZUv2eUv4EJlEzP0xBOY
	7ITEPZ7vB7ZCjetv70rg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQUC0-0007kg-D3; Mon, 20 Apr 2020 11:02:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQUBx-0007iJ-Q5; Mon, 20 Apr 2020 11:02:23 +0000
X-UUID: 33b32213cdfb4cadbb69609a3528dfb4-20200420
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5ZSYvBnifQattuM6WwNJ4dWYpkcL8v4PWiqKlXsfHC4=; 
 b=Lb/JZR/eWuDKE3nJtNwTqNxoX3q95MJ5c16AIklc5G6MtbkfSHR+P7TbvxOtohT2olVNdApWhGGr1R2J66PWZNB24AUdl2xGyoFtteQg4uReAsTqHWlDEttJ6m3Gb+MRS8hx/5j8PG32hRIqzuEWu9ixxFo5bxVha2r6txYgaoc=;
X-UUID: 33b32213cdfb4cadbb69609a3528dfb4-20200420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1332806410; Mon, 20 Apr 2020 03:02:10 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Apr 2020 03:52:48 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Apr 2020 18:52:38 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 20 Apr 2020 18:52:37 +0800
Message-ID: <1587379959.6297.2.camel@mtksdaap41>
Subject: Re: [PATCH v12 1/6] mfd: mt6397: Modify suspend/resume behavior
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>
Date: Mon, 20 Apr 2020 18:52:39 +0800
In-Reply-To: <20200416084910.GX2167633@dell>
References: <1586333531-21641-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1586333531-21641-2-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20200416084910.GX2167633@dell>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 665BB53A9B209DF474DE368E25DAC4D6E7703353C21B189088EF792896EB3DFD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_040221_851816_5428B220 
X-CRM114-Status: GOOD (  17.96  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Sebastian Reichel <sre@kernel.org>, Richard
 Fontana <rfontana@redhat.com>, linux-rtc@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>,
 Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias
 Brugger <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 Alessandro Zummo <a.zummo@towertech.it>, Josef Friedl <josef.friedl@speed.at>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Thu, 2020-04-16 at 09:49 +0100, Lee Jones wrote:
> On Wed, 08 Apr 2020, Hsin-Hsiung Wang wrote:
> 
> > Some pmics don't need backup interrupt settings, so we change to use
> > pm notifier for the pmics which are necessary to store settings.
> > 
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> >  drivers/mfd/mt6397-core.c       | 30 ------------------------------
> >  drivers/mfd/mt6397-irq.c        | 35 ++++++++++++++++++++++++++++++++++-
> >  include/linux/mfd/mt6397/core.h |  2 ++
> >  3 files changed, 36 insertions(+), 31 deletions(-)
> > 
> > diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> > index 0437c85..d2e70d8 100644
> > --- a/drivers/mfd/mt6397-core.c
> > +++ b/drivers/mfd/mt6397-core.c
> > @@ -100,35 +100,6 @@ static const struct mfd_cell mt6397_devs[] = {
> >  	}
> >  };
> >  
> > -#ifdef CONFIG_PM_SLEEP
> > -static int mt6397_irq_suspend(struct device *dev)
> > -{
> > -	struct mt6397_chip *chip = dev_get_drvdata(dev);
> > -
> > -	regmap_write(chip->regmap, chip->int_con[0], chip->wake_mask[0]);
> > -	regmap_write(chip->regmap, chip->int_con[1], chip->wake_mask[1]);
> > -
> > -	enable_irq_wake(chip->irq);
> > -
> > -	return 0;
> > -}
> > -
> > -static int mt6397_irq_resume(struct device *dev)
> > -{
> > -	struct mt6397_chip *chip = dev_get_drvdata(dev);
> > -
> > -	regmap_write(chip->regmap, chip->int_con[0], chip->irq_masks_cur[0]);
> > -	regmap_write(chip->regmap, chip->int_con[1], chip->irq_masks_cur[1]);
> > -
> > -	disable_irq_wake(chip->irq);
> > -
> > -	return 0;
> > -}
> > -#endif
> > -
> > -static SIMPLE_DEV_PM_OPS(mt6397_pm_ops, mt6397_irq_suspend,
> > -			mt6397_irq_resume);
> > -
> >  struct chip_data {
> >  	u32 cid_addr;
> >  	u32 cid_shift;
> > @@ -238,7 +209,6 @@ static struct platform_driver mt6397_driver = {
> >  	.driver = {
> >  		.name = "mt6397",
> >  		.of_match_table = of_match_ptr(mt6397_of_match),
> > -		.pm = &mt6397_pm_ops,
> >  	},
> >  	.id_table = mt6397_id,
> >  };
> > diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
> > index b2d3ce1..2924919 100644
> > --- a/drivers/mfd/mt6397-irq.c
> > +++ b/drivers/mfd/mt6397-irq.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/of_irq.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> > +#include <linux/suspend.h>
> >  #include <linux/mfd/mt6323/core.h>
> >  #include <linux/mfd/mt6323/registers.h>
> >  #include <linux/mfd/mt6397/core.h>
> > @@ -81,7 +82,7 @@ static struct irq_chip mt6397_irq_chip = {
> >  static void mt6397_irq_handle_reg(struct mt6397_chip *mt6397, int reg,
> >  				  int irqbase)
> >  {
> > -	unsigned int status;
> > +	unsigned int status = 0;
> 
> This looks like an unrelated change, no?
> 

It is to fix the coverity defect.

> >  	int i, irq, ret;
> >  
> >  	ret = regmap_read(mt6397->regmap, reg, &status);
> > @@ -128,6 +129,36 @@ static const struct irq_domain_ops mt6397_irq_domain_ops = {
> >  	.map = mt6397_irq_domain_map,
> >  };
> 
> Other than that.
> 
> For my own reference:
>   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> 
Thanks for your review. I will add it in the next version.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
