Return-Path: <SRS0=oIsV=74=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D495CC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 07:34:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 668802068E
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 07:34:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T9iTRmEa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VDzHNQAN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 668802068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3x4F6TelCEHkVtyLYdKsy8qTgIPcfrfs+tTZzftTG4g=; b=T9iTRmEaywEM+T
	rcKTVu6RZUm0BCYe21FGh/jlyK+yJ4926jcYKf4PwjYyZQ1Byan7xoBSQTLPk6Lq1ZpnJ+8iUYcRl
	LqL4sgGpjNDrEm2b8zxoyxNox5oyGorwLIBHZN0OEamcN9x1howEviLsRx2WMJ6iHh+qw0WFiLJtV
	gGgVULpnSOXcsIGBqPNnQe0XpaDg86GWtbccn6eVRrfCydVf4xGmj8ATvan1pM6SyTcOUIKoSZ3PT
	rE2MgaP+zZ2s5JwnHDD15+xSY7vErvzeIgjhoAiQYCyX35UNbE2GvhaWoXdeVUmfrL56sEBO3MSUw
	qXEV+IGBWXodNVhS93hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkjcy-00048F-RI; Mon, 15 Jun 2020 07:33:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkjci-0003ur-AU; Mon, 15 Jun 2020 07:33:43 +0000
X-UUID: baae1b70d2864cdc926d620cce5e4866-20200614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=m/v3E4p1m/OZyPE8uUXIhT+TD6yH0vQGAescG6WMe18=; 
 b=VDzHNQANysP2lm1uqeHrNCXAMrNx1iRwrz1r3Nifz8sJF0aDiq3Vo95JosXHEj+QhIUDCH0BA08KtfqjSYRdN8/P7XKjSnNqIUCPhwZqXDKFwXQGWOiKgl+cqmWbiv14cWWFnSaSNrF44U7gN1H64t1S7ypneqVcsjHOCUAt4M8=;
X-UUID: baae1b70d2864cdc926d620cce5e4866-20200614
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 843906623; Sun, 14 Jun 2020 23:33:36 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Jun 2020 00:26:59 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 15 Jun 2020 15:26:50 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Jun 2020 15:26:49 +0800
Message-ID: <1592205866.8804.686.camel@mhfsdcap03>
Subject: Re: [V8, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 15 Jun 2020 15:24:26 +0800
In-Reply-To: <CAAFQd5CboZ9aFhUyKPES_2oO_AKAOh3Pg8D+9YpfmzJ8v-yFHw@mail.gmail.com>
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
 <20200509080627.23222-3-dongchun.zhu@mediatek.com>
 <20200521193204.GA14214@chromium.org>
 <1590209415.8804.431.camel@mhfsdcap03>
 <20200610183600.GI201868@chromium.org>
 <1591954266.8804.646.camel@mhfsdcap03>
 <CAAFQd5CboZ9aFhUyKPES_2oO_AKAOh3Pg8D+9YpfmzJ8v-yFHw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F48042F2A1F78F21A0AF70589031EBB7AAF552C4E8B9EC0D9A43D09539458DD92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_003341_655778_3B327014 
X-CRM114-Status: GOOD (  26.15  )
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
 Nicolas Boichat <drinkcat@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Shengnan
 Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=A3=E7=94=B7=29?=
 <shengnan.wang@mediatek.com>, Louis Kuo <louis.kuo@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dongchun.zhu@mediatek.com, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, "list@263.net:IOMMU DRIVERS
 <iommu@lists.linux-foundation.org>, Joerg  Roedel <joro@8bytes.org>,
 " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tomasz,

On Fri, 2020-06-12 at 20:49 +0200, Tomasz Figa wrote:
> On Fri, Jun 12, 2020 at 11:33 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> >
> > Hi Tomasz,
> >
> > On Wed, 2020-06-10 at 18:36 +0000, Tomasz Figa wrote:
> > > On Sat, May 23, 2020 at 12:50:15PM +0800, Dongchun Zhu wrote:
> > > > Hi Tomasz,
> > > >
> > > > Thanks for the review. My replies are as below.
> > > >
> > > > On Thu, 2020-05-21 at 19:32 +0000, Tomasz Figa wrote:
> > > > > Hi Dongchun,
> > > > >
> > > > > On Sat, May 09, 2020 at 04:06:27PM +0800, Dongchun Zhu wrote:
> > > [snip]
> > > > > > +{
> > > > > > +       struct i2c_client *client = to_i2c_client(dev);
> > > > > > +       struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > > > > +       struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > > > > +       int ret;
> > > > > > +
> > > > > > +       gpiod_set_value_cansleep(ov02a10->n_rst_gpio, 0);
> > > > > > +       gpiod_set_value_cansleep(ov02a10->pd_gpio, 0);
> > > > > > +
> > > > > > +       ret = clk_prepare_enable(ov02a10->eclk);
> > > > > > +       if (ret < 0) {
> > > > > > +               dev_err(dev, "failed to enable eclk\n");
> > > > > > +               return ret;
> > > > > > +       }
> > > > > > +
> > > > > > +       ret = regulator_bulk_enable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> > > > > > +       if (ret < 0) {
> > > > > > +               dev_err(dev, "failed to enable regulators\n");
> > > > > > +               goto disable_clk;
> > > > > > +       }
> > > > > > +       usleep_range(5000, 6000);
> > > > > > +
> > > > > > +       gpiod_set_value_cansleep(ov02a10->pd_gpio, 1);
> > > > >
> > > > > This is a "powerdown" GPIO. It must be set to 0 if the sensor is to be
> > > > > powered on.
> > > > >
> > > >
> > > > The value set by gpiod_set_value_cansleep() API actually depends upon
> > > > GPIO polarity defined in DT.
> > > > Since I set GPIO_ACTIVE_LOW to powerdown,
> > > > gpiod_set_value_cansleep(gpio_desc, value) would set !value to
> > > > gpio_desc.
> > > > Thus here powerdown would be low-state when sensor is powered on.
> > > > For GPIO polarity, I also post a comment to the binding patch.
> > > >
> > >
> > > That's true. However, this makes the driver really confusing. If someone
> > > reads this code and compares with the datasheet, it looks incorrect,
> > > because in the datasheet the powerdown GPIO needs to be configured low
> > > for the sensor to operate.
> > >
> > > I'd recommend defining the binding in a way that makes it clear in the driver code
> > > that it implementes the power sequencing as per the datasheet.
> > >
> >
> > Uh-huh...
> > But it all depends on how we look at the powerdown GPIO.
> > Or where should we define the active low or active high, the driver or
> > DT?
> >
> > My initial idea is using DT GPIO polarity to describe sensor active
> > polarity according to the datasheet.
> > As an active low shutdown signal is equivalent to an active high enable
> > signal.
> >
> 
> Okay, I discussed this offline with Laurent and Sakari and we also
> found the guidelines of the Linux GPIO subsystem on this [1].
> 
> The conclusion is that the pin names in the driver or DT must not
> contain any negation prefixes and the driver needs to care only about
> the logical function of the pin, such as "powerdown" or "reset". In
> case of this driver, we should call the pins "rst" and "pd" and
> setting them to 1 would trigger the reset and power down respectively.
> The physical signal polarity must be configured in DT using the
> polarity flags.
> 
> [1] https://www.kernel.org/doc/html/latest/driver-api/gpio/consumer.html#the-active-low-and-open-drain-semantics
> 

Thank you for the sharing.
If driver only focus on the logical function of GPIO pins,
'n_rst_gpio' may need to be renamed back to the 1st version 'rst_gpio'.

> Best regards,
> Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
