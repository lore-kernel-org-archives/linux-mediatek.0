Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443E7C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 01:14:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11E4520780
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 01:14:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mQPmcc+u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CKY5qjdC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11E4520780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PWUngoMyrsB5MOnJtzC80r0pKzlu5rh/GXvLvSnMsJw=; b=mQPmcc+uZ37XVhenniaST03kP
	hcrId1z2id1GDIU3Y/ImKASCG9c2bR1NMszili0hDE6DG8z+3IwSyxaKP+dJuIxMuL+luyRvKf81e
	3NfiIRWcQEBIHswovxXtnhKGi6pnWAXdYC4zX+/EIPNeSf7RKw5Yav60HDFCpqu6CK8JjmEhYoFGn
	yXEnhyKF+i3aEctZqAJRIJgLcxTa4MlM4oW/bs64sKXEc7UOb7s/eCxfWnO3qoRmBiiM38dvOpYZa
	l4tdARGNRp21GCwmgt+Z5uQNyZV/A/qWx+cwq1AW04ALNQgoXzBNXKYmQIb9L0rQqJbKEKnU+nQEs
	ZU5N64N/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq4qs-0003y4-Ni; Tue, 30 Jun 2020 01:14:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq4qo-0003vC-Qf; Tue, 30 Jun 2020 01:14:20 +0000
X-UUID: b8c716db0a084ba5a1de879b5e63cc8c-20200629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SS0pJVdbsiL6JVdMxrk/GV4yeHEBmXgpP0noRgOebgk=; 
 b=CKY5qjdCW16BG0btLvJbCtEa3+k1GS8GEQLPPF9vbJPCJo3b2WACdN1jaHh2fhTOzXfICvlV8zPYQm2Y5kqoYV6vsUsHUyCIbVFS4ahV+aWdoukAcjGvrnqOh8MioOjqrEzYGYseJOujmAligcuvGp341Glnaf3+Xgfn4JGn+Aw=;
X-UUID: b8c716db0a084ba5a1de879b5e63cc8c-20200629
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1442541878; Mon, 29 Jun 2020 17:14:12 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 18:14:11 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 30 Jun 2020 09:14:08 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Jun 2020 09:14:07 +0800
Message-ID: <1593479628.17166.25.camel@mhfsdcap03>
Subject: Re: [PATCH V10 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 30 Jun 2020 09:13:48 +0800
In-Reply-To: <CAAFQd5DAbGDp=e-b2K89ydyK_bft5D2grpFfGDtX6hC__n-L-g@mail.gmail.com>
References: <20200615122937.18965-1-dongchun.zhu@mediatek.com>
 <20200615122937.18965-3-dongchun.zhu@mediatek.com>
 <20200618191026.GA73379@chromium.org>
 <1593417224.17166.10.camel@mhfsdcap03>
 <CAAFQd5DAbGDp=e-b2K89ydyK_bft5D2grpFfGDtX6hC__n-L-g@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 95C4641E1A68A30AD0ACD32A5821ABBCDA3842FF6C1DACC921D99503365618662000:8
X-MTK: N
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

On Mon, 2020-06-29 at 12:27 +0200, Tomasz Figa wrote:
> On Mon, Jun 29, 2020 at 9:54 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> >
> > Hi Tomasz,
> >
> > On Thu, 2020-06-18 at 19:10 +0000, Tomasz Figa wrote:
> > > Hi Dongchun,
> > >
> > > On Mon, Jun 15, 2020 at 08:29:37PM +0800, Dongchun Zhu wrote:
> > > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > > >
> > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > ---
> > > >  MAINTAINERS                 |    1 +
> > > >  drivers/media/i2c/Kconfig   |   13 +
> > > >  drivers/media/i2c/Makefile  |    1 +
> > > >  drivers/media/i2c/ov02a10.c | 1042 +++++++++++++++++++++++++++++++++++++++++++
> > > >  4 files changed, 1057 insertions(+)
> > > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > > >
> > >
> > > Thank you for the patch. Please see my comments inline.
> > >
> >
> > [snip]
> >
> > > > +static int ov02a10_probe(struct i2c_client *client)
> > > > +{
> > > > +   struct device *dev = &client->dev;
> > > > +   struct ov02a10 *ov02a10;
> > > > +   unsigned int rotation;
> > > > +   unsigned int clock_lane_tx_speed;
> > > > +   unsigned int i;
> > > > +   int ret;
> > > > +
> > > > +   ov02a10 = devm_kzalloc(dev, sizeof(*ov02a10), GFP_KERNEL);
> > > > +   if (!ov02a10)
> > > > +           return -ENOMEM;
> > > > +
> > > > +   ret = ov02a10_check_hwcfg(dev, ov02a10);
> > > > +   if (ret) {
> > > > +           dev_err(dev, "failed to check HW configuration: %d", ret);
> > > > +           return ret;
> > > > +   }
> > > > +
> > > > +   v4l2_i2c_subdev_init(&ov02a10->subdev, client, &ov02a10_subdev_ops);
> > > > +   ov02a10->mipi_clock_tx_speed = OV02A10_MIPI_TX_SPEED_DEFAULT;
> > > > +   ov02a10->fmt.code = MEDIA_BUS_FMT_SBGGR10_1X10;
> > > > +
> > > > +   /* Optional indication of physical rotation of sensor */
> > > > +   ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);
> > > > +   if (!ret && rotation == 180) {
> > > > +           ov02a10->upside_down = true;
> > > > +           ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
> > > > +   }
> > > > +
> > > > +   /* Optional indication of mipi TX speed */
> > > > +   ret = fwnode_property_read_u32(dev_fwnode(dev), "ovti,mipi-tx-speed",
> > > > +                                  &clock_lane_tx_speed);
> > > > +
> > > > +   if (!ret)
> > > > +           ov02a10->mipi_clock_tx_speed = clock_lane_tx_speed;
> > > > +
> > > > +   /* Get system clock (eclk) */
> > > > +   ov02a10->eclk = devm_clk_get(dev, "eclk");
> > > > +   if (IS_ERR(ov02a10->eclk)) {
> > > > +           ret = PTR_ERR(ov02a10->eclk);
> > > > +           dev_err(dev, "failed to get eclk %d\n", ret);
> > > > +           return ret;
> > > > +   }
> > > > +
> > > > +   ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> > > > +                                  &ov02a10->eclk_freq);
> > > > +   if (ret) {
> > > > +           dev_err(dev, "failed to get eclk frequency\n");
> > > > +           return ret;
> > > > +   }
> > > > +
> > > > +   ret = clk_set_rate(ov02a10->eclk, ov02a10->eclk_freq);
> > > > +   if (ret) {
> > > > +           dev_err(dev, "failed to set eclk frequency (24MHz)\n");
> > > > +           return ret;
> > > > +   }
> > > > +
> > > > +   if (clk_get_rate(ov02a10->eclk) != OV02A10_ECLK_FREQ) {
> > > > +           dev_warn(dev, "wrong eclk frequency %d Hz, expected: %d Hz\n",
> > > > +                    ov02a10->eclk_freq, OV02A10_ECLK_FREQ);
> > > > +           return -EINVAL;
> > > > +   }
> > > > +
> > > > +   ov02a10->pd_gpio = devm_gpiod_get(dev, "powerdown", GPIOD_OUT_HIGH);
> > > > +   if (IS_ERR(ov02a10->pd_gpio)) {
> > > > +           ret = PTR_ERR(ov02a10->pd_gpio);
> > > > +           dev_err(dev, "failed to get powerdown-gpios %d\n", ret);
> > > > +           return ret;
> > > > +   }
> > > > +
> > > > +   ov02a10->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > > > +   if (IS_ERR(ov02a10->rst_gpio)) {
> > > > +           ret = PTR_ERR(ov02a10->rst_gpio);
> > > > +           dev_err(dev, "failed to get reset-gpios %d\n", ret);
> > > > +           return ret;
> > > > +   }
> > > > +
> > > > +   for (i = 0; i < ARRAY_SIZE(ov02a10_supply_names); i++)
> > > > +           ov02a10->supplies[i].supply = ov02a10_supply_names[i];
> > > > +
> > > > +   ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov02a10_supply_names),
> > > > +                                 ov02a10->supplies);
> > > > +   if (ret) {
> > > > +           dev_err(dev, "failed to get regulators\n");
> > > > +           return ret;
> > > > +   }
> > > > +
> > > > +   mutex_init(&ov02a10->mutex);
> > > > +   ov02a10->cur_mode = &supported_modes[0];
> > > > +   ret = ov02a10_initialize_controls(ov02a10);
> > > > +   if (ret) {
> > > > +           dev_err(dev, "failed to initialize controls\n");
> > > > +           goto err_destroy_mutex;
> > > > +   }
> > > > +
> > > > +   ov02a10->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > > > +   ov02a10->subdev.entity.ops = &ov02a10_subdev_entity_ops;
> > > > +   ov02a10->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > > > +   ov02a10->pad.flags = MEDIA_PAD_FL_SOURCE;
> > > > +   ret = media_entity_pads_init(&ov02a10->subdev.entity, 1, &ov02a10->pad);
> > > > +   if (ret < 0) {
> > > > +           dev_err(dev, "failed to init entity pads: %d", ret);
> > > > +           goto err_free_handler;
> > > > +   }
> > > > +
> > > > +   pm_runtime_enable(dev);
> > > > +   if (!pm_runtime_enabled(dev)) {
> > > > +           ret = ov02a10_power_on(dev);
> > > > +           if (ret < 0) {
> > > > +                   dev_err(dev, "failed to power on: %d\n", ret);
> > > > +                   goto err_clean_entity;
> > > > +           }
> > > > +   }
> > > > +
> > > > +   ret = v4l2_async_register_subdev(&ov02a10->subdev);
> > > > +   if (ret) {
> > > > +           dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> > > > +           goto err_power_off;
> > > > +   }
> > > > +
> > > > +   return 0;
> > > > +
> > > > +err_power_off:
> > > > +   pm_runtime_disable(dev);
> > > > +   if (!pm_runtime_enabled(dev))
> > >
> > > This would be always true, resulting in unbalanced power off. Moving
> > > pm_runtime_disable() after this if should work better.
> > >
> >
> > Pardon, do you mean that we shall use like this:
> > err_power_off:
> >         if (!pm_runtime_enabled(dev)) {
> >                 pm_runtime_disable(dev);
> >                 if (!pm_runtime_status_suspended(dev)
> >                         ov02a10_power_off(dev);
> >         }
> 
> Hmm, that wouldn't really work, because there is no reason to disable
> runtime PM if it's disabled already. I also noticed that we don't need
> to check pm_runtime_status_suspended() in the error path in probe,
> because we only ever attempt to power it on when runtime PM is
> disabled in kernel config. This would make the end result as:
> 
>          if (pm_runtime_enabled(dev))
>                  pm_runtime_disable(dev);
>          else
>                  ov02a10_power_off(dev);
> 

Thanks for the sharing.
It seems err_power_off section here helps balance the pm_runtime_enable
and pm_runtime_disable to keep dev->power.disable_depth right.
While runtime PM is disabled, ov02a10_power_off could also perform power
off instead of runtime PM.

> Best regards,
> Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
