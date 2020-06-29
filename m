Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE35C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 07:57:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA558206A1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 07:57:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CcNNzedb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="e/Ketz3U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA558206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BmgPyqCRDizyRvb9JE6+slKt8KM0dgTL1R6du7d2pKc=; b=CcNNzedbUtZ+WkjHWIrGo0ZFA
	SRvyDqZXYOXT4E4rLJW4Dy9/kgJWbmClD5NopIw+DPLRMpJx9aQBF06vYSHOmFsRrFoW/wio7JRwc
	7UX/MYf1iufgKnznQjU9Q01aaFthwd3dab89o6ayxPCG6LH2dG4Ywy2T0Dvs72XhfN8DBkFQ34NEs
	v8odOa34mERKbXBw3JVln8IWORrrWoZKqVGk1rc0eGkn4D4UzQpvfTk8aCEBi4jFy9Vg5B4LK9IQz
	Amh5ZSfz+3rLnmIe7JAr6auUIZQsltaKUpiprYl1PeLcwXTlDRK7mBWiKY3CfVmkegs1S+iWbOSs6
	wOKVLzw2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpoey-0006NK-Fv; Mon, 29 Jun 2020 07:57:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpoev-0006MQ-Ip; Mon, 29 Jun 2020 07:56:59 +0000
X-UUID: b813c00dfd374f138d9ad90583a78e1e-20200628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yN5goJppVj9UIa7Dv+nhj6OYTbfB/S3z82hXPlK+L1w=; 
 b=e/Ketz3Uddn6JfZHCnGUoi5uC/MzrSfouZDk7kTKOSMNpL/Oa+DMXEOWVzJ5R73NuAxpbm1Nk6BKRJywHzT+G/cc6e3XCjlsOSZZ6QTIyNDHG7nAZ+b0E5fX0sOKfUPS0RTbOaLeeZ4E4Tvo6alhRZsr7mh1AL14FdpwZX0lQKo=;
X-UUID: b813c00dfd374f138d9ad90583a78e1e-20200628
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1707892; Sun, 28 Jun 2020 23:56:41 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Jun 2020 00:54:03 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 29 Jun 2020 15:54:00 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Jun 2020 15:53:59 +0800
Message-ID: <1593417224.17166.10.camel@mhfsdcap03>
Subject: Re: [PATCH V10 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 29 Jun 2020 15:53:44 +0800
In-Reply-To: <20200618191026.GA73379@chromium.org>
References: <20200615122937.18965-1-dongchun.zhu@mediatek.com>
 <20200615122937.18965-3-dongchun.zhu@mediatek.com>
 <20200618191026.GA73379@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B9E0D342F4153787C819F2275392D12C22425E910134405000A37EE3EB838C062000:8
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
Cc: mark.rutland@arm.com, drinkcat@chromium.org,
 andriy.shevchenko@linux.intel.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linus.walleij@linaro.org,
 shengnan.wang@mediatek.com, louis.kuo@mediatek.com, bgolaszewski@baylibre.com,
 sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 dongchun.zhu@mediatek.com, sakari.ailus@linux.intel.com,
 matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tomasz,

On Thu, 2020-06-18 at 19:10 +0000, Tomasz Figa wrote:
> Hi Dongchun,
> 
> On Mon, Jun 15, 2020 at 08:29:37PM +0800, Dongchun Zhu wrote:
> > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  MAINTAINERS                 |    1 +
> >  drivers/media/i2c/Kconfig   |   13 +
> >  drivers/media/i2c/Makefile  |    1 +
> >  drivers/media/i2c/ov02a10.c | 1042 +++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 1057 insertions(+)
> >  create mode 100644 drivers/media/i2c/ov02a10.c
> > 
> 
> Thank you for the patch. Please see my comments inline.
> 

[snip]

> > +static int ov02a10_probe(struct i2c_client *client)
> > +{
> > +	struct device *dev = &client->dev;
> > +	struct ov02a10 *ov02a10;
> > +	unsigned int rotation;
> > +	unsigned int clock_lane_tx_speed;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	ov02a10 = devm_kzalloc(dev, sizeof(*ov02a10), GFP_KERNEL);
> > +	if (!ov02a10)
> > +		return -ENOMEM;
> > +
> > +	ret = ov02a10_check_hwcfg(dev, ov02a10);
> > +	if (ret) {
> > +		dev_err(dev, "failed to check HW configuration: %d", ret);
> > +		return ret;
> > +	}
> > +
> > +	v4l2_i2c_subdev_init(&ov02a10->subdev, client, &ov02a10_subdev_ops);
> > +	ov02a10->mipi_clock_tx_speed = OV02A10_MIPI_TX_SPEED_DEFAULT;
> > +	ov02a10->fmt.code = MEDIA_BUS_FMT_SBGGR10_1X10;
> > +
> > +	/* Optional indication of physical rotation of sensor */
> > +	ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);
> > +	if (!ret && rotation == 180) {
> > +		ov02a10->upside_down = true;
> > +		ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
> > +	}
> > +
> > +	/* Optional indication of mipi TX speed */
> > +	ret = fwnode_property_read_u32(dev_fwnode(dev), "ovti,mipi-tx-speed",
> > +				       &clock_lane_tx_speed);
> > +
> > +	if (!ret)
> > +		ov02a10->mipi_clock_tx_speed = clock_lane_tx_speed;
> > +
> > +	/* Get system clock (eclk) */
> > +	ov02a10->eclk = devm_clk_get(dev, "eclk");
> > +	if (IS_ERR(ov02a10->eclk)) {
> > +		ret = PTR_ERR(ov02a10->eclk);
> > +		dev_err(dev, "failed to get eclk %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> > +				       &ov02a10->eclk_freq);
> > +	if (ret) {
> > +		dev_err(dev, "failed to get eclk frequency\n");
> > +		return ret;
> > +	}
> > +
> > +	ret = clk_set_rate(ov02a10->eclk, ov02a10->eclk_freq);
> > +	if (ret) {
> > +		dev_err(dev, "failed to set eclk frequency (24MHz)\n");
> > +		return ret;
> > +	}
> > +
> > +	if (clk_get_rate(ov02a10->eclk) != OV02A10_ECLK_FREQ) {
> > +		dev_warn(dev, "wrong eclk frequency %d Hz, expected: %d Hz\n",
> > +			 ov02a10->eclk_freq, OV02A10_ECLK_FREQ);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ov02a10->pd_gpio = devm_gpiod_get(dev, "powerdown", GPIOD_OUT_HIGH);
> > +	if (IS_ERR(ov02a10->pd_gpio)) {
> > +		ret = PTR_ERR(ov02a10->pd_gpio);
> > +		dev_err(dev, "failed to get powerdown-gpios %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ov02a10->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > +	if (IS_ERR(ov02a10->rst_gpio)) {
> > +		ret = PTR_ERR(ov02a10->rst_gpio);
> > +		dev_err(dev, "failed to get reset-gpios %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	for (i = 0; i < ARRAY_SIZE(ov02a10_supply_names); i++)
> > +		ov02a10->supplies[i].supply = ov02a10_supply_names[i];
> > +
> > +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov02a10_supply_names),
> > +				      ov02a10->supplies);
> > +	if (ret) {
> > +		dev_err(dev, "failed to get regulators\n");
> > +		return ret;
> > +	}
> > +
> > +	mutex_init(&ov02a10->mutex);
> > +	ov02a10->cur_mode = &supported_modes[0];
> > +	ret = ov02a10_initialize_controls(ov02a10);
> > +	if (ret) {
> > +		dev_err(dev, "failed to initialize controls\n");
> > +		goto err_destroy_mutex;
> > +	}
> > +
> > +	ov02a10->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	ov02a10->subdev.entity.ops = &ov02a10_subdev_entity_ops;
> > +	ov02a10->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> > +	ov02a10->pad.flags = MEDIA_PAD_FL_SOURCE;
> > +	ret = media_entity_pads_init(&ov02a10->subdev.entity, 1, &ov02a10->pad);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to init entity pads: %d", ret);
> > +		goto err_free_handler;
> > +	}
> > +
> > +	pm_runtime_enable(dev);
> > +	if (!pm_runtime_enabled(dev)) {
> > +		ret = ov02a10_power_on(dev);
> > +		if (ret < 0) {
> > +			dev_err(dev, "failed to power on: %d\n", ret);
> > +			goto err_clean_entity;
> > +		}
> > +	}
> > +
> > +	ret = v4l2_async_register_subdev(&ov02a10->subdev);
> > +	if (ret) {
> > +		dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> > +		goto err_power_off;
> > +	}
> > +
> > +	return 0;
> > +
> > +err_power_off:
> > +	pm_runtime_disable(dev);
> > +	if (!pm_runtime_enabled(dev))
> 
> This would be always true, resulting in unbalanced power off. Moving
> pm_runtime_disable() after this if should work better.
> 

Pardon, do you mean that we shall use like this:
err_power_off:
	if (!pm_runtime_enabled(dev)) {
		pm_runtime_disable(dev);
		if (!pm_runtime_status_suspended(dev)
			ov02a10_power_off(dev);
	}

> > +		ov02a10_power_off(dev);
> > +err_clean_entity:
> > +	media_entity_cleanup(&ov02a10->subdev.entity);
> > +err_free_handler:
> > +	v4l2_ctrl_handler_free(ov02a10->subdev.ctrl_handler);
> > +err_destroy_mutex:
> > +	mutex_destroy(&ov02a10->mutex);
> > +
> > +	return ret;
> > +}
> > +

[snip]
...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
