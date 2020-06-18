Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93F53C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 19:10:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 656F1207E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 19:10:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HROURHN1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xl3+pwsO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 656F1207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCpS6ebQyv4bRKmQlhxGHDBTF2Xg5Pp1EzjAtZOFC6c=; b=HROURHN1tL2L1s
	RI54zppGi04ef2vcTuRhnPz+44vTUxOPcsh2KccLsizwpLU0x+YVDPUVTMMn6QjqBt5qV3ZqMFZA/
	DdgRg99xhYBGuVklG8bE2pzqBmOP8SLuAntiDV/5kD3RUeTr9atBLBfdheoF2xDCgqmrYQBShnvJt
	8ZqKiBr2RuAsapFMtLt2MDiJp8g9OcvNcvkfWYwNaKCmY5lRgKL0HeRcMimiHf4ZOnITzz5VpD/PK
	LqvTA6h6EI1+HCeDcK8ojo/7X3vj6CPqJSZiyXZMK3+5NNJTcR92jPMWGzY1YJRyogqY8u5++wq6Y
	hI2P8XDQORznXazfp3Qg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlzvr-0003lg-OD; Thu, 18 Jun 2020 19:10:39 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlzvi-0003dP-4X
 for linux-mediatek@lists.infradead.org; Thu, 18 Jun 2020 19:10:31 +0000
Received: by mail-wm1-x344.google.com with SMTP id a6so2857529wmm.5
 for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2020 12:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/R6+OvZz1Ui/Ew+ADM6r1/2XemZGf5ebcfeNB0iKSqw=;
 b=Xl3+pwsOo3mgOl7QHuL3f6/VF0UUbWo98iffdxLWS9CkkwY9S+VzX0ch7pJuIWKaPI
 g8hsckdhXUtFwpSY49cuMm0G070E4tv/CaJLaaF7nGHCO7nA6l3HGI86wEyYtzWejyNF
 4GE3NirtsgaZaAL02CjDU/nPjkzylIn9BjRRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/R6+OvZz1Ui/Ew+ADM6r1/2XemZGf5ebcfeNB0iKSqw=;
 b=qwNcLcSGxn7/Sq+m3jcujRjOk2xKV4mAHY1Ake8uLqtQqLR94qIRB4xed3eX1oLVAF
 H0gUjrG8N1x6BKDWF1mfLfKiCRXV2aivk3ZbcPn08cnqKm8J/2MuFrewtZhz/YtgEw+F
 wGY0rXQeQunktoJo12eNhr56XQMJjY77vovEcTLwnsdGUNZhu6rwvMEojI2DSjYpgAQ7
 CqSd1EAcJtHQmkm2L5E6KVKeE664llNKaQUAwLvys2vlPSddDeBcptjid67n6S68Ovbx
 Yl1LoU4oku/XXFuymJrSBzf1COvTTPtVAzKZxn4MlMaOX77XWXthZE+QynBbIEO2U8Ud
 uaSQ==
X-Gm-Message-State: AOAM533QgLz0oyNtTQRb2MJwzuVoSI2vrzqIyBuQIys/ik9rNCfmRuxZ
 G2yL/BlmtMvr9pRlVjoWq1LzFw==
X-Google-Smtp-Source: ABdhPJxSbS+R7Qpog7rhrdO1NrPEj7MbxkVtY27yVDONZVpevSGG1jURLAxFrUO7A97WGzYzgARtwA==
X-Received: by 2002:a1c:a74c:: with SMTP id q73mr30726wme.96.1592507428399;
 Thu, 18 Jun 2020 12:10:28 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id u3sm4722137wrw.89.2020.06.18.12.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 12:10:27 -0700 (PDT)
Date: Thu, 18 Jun 2020 19:10:26 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH V10 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
Message-ID: <20200618191026.GA73379@chromium.org>
References: <20200615122937.18965-1-dongchun.zhu@mediatek.com>
 <20200615122937.18965-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200615122937.18965-3-dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_121030_183912_6CA40DD4 
X-CRM114-Status: GOOD (  20.08  )
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
 sakari.ailus@linux.intel.com, matthias.bgg@gmail.com, bingbu.cao@intel.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dongchun,

On Mon, Jun 15, 2020 at 08:29:37PM +0800, Dongchun Zhu wrote:
> Add a V4L2 sub-device driver for OV02A10 image sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  MAINTAINERS                 |    1 +
>  drivers/media/i2c/Kconfig   |   13 +
>  drivers/media/i2c/Makefile  |    1 +
>  drivers/media/i2c/ov02a10.c | 1042 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 1057 insertions(+)
>  create mode 100644 drivers/media/i2c/ov02a10.c
> 

Thank you for the patch. Please see my comments inline.

[snip]
> +static int ov02a10_set_fmt(struct v4l2_subdev *sd,
> +			   struct v4l2_subdev_pad_config *cfg,
> +			   struct v4l2_subdev_format *fmt)
> +{
> +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> +	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> +
> +	mutex_lock(&ov02a10->mutex);
> +
> +	if (ov02a10->streaming) {
> +		mutex_unlock(&ov02a10->mutex);
> +		return -EBUSY;
> +	}
> +
> +	/* Only one sensor mode supported */
> +	mbus_fmt->code = ov02a10->fmt.code;
> +	ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> +	ov02a10->fmt = fmt->format;
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> +		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;

If fmt->which is V4L2_SUBDEV_FORMAT_TRY, the internal driver state must not
be affected. It also should not depend on whether the sensor is streaming
or not. Basically it should be considered a special "candidate" format,
which isn't programmed to the hardware, but just stored aside.

> +
> +	mutex_unlock(&ov02a10->mutex);
> +
> +	return 0;
> +}
[snip]
> +static int ov02a10_power_on(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> +	int ret;
> +
> +	gpiod_set_value_cansleep(ov02a10->rst_gpio, 0);

As we discussed before, the pin names mean their logical function and the
polarity means the function is active. In this case, we want to _activate_
the _reset_ so it should be 1.

> +	gpiod_set_value_cansleep(ov02a10->pd_gpio, 0);

I believe we don't want to deactivate the powerdown yet. First the clock
and regulator need to be enabled.

> +
> +	ret = clk_prepare_enable(ov02a10->eclk);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable eclk\n");
> +		return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(ov02a10_supply_names),
> +				    ov02a10->supplies);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable regulators\n");
> +		goto disable_clk;
> +	}
> +	usleep_range(5000, 6000);
> +
> +	gpiod_set_value_cansleep(ov02a10->pd_gpio, 1);

Here we want to *deactivate* the powerdown, so the value should be 0.

> +	usleep_range(5000, 6000);
> +
> +	gpiod_set_value_cansleep(ov02a10->rst_gpio, 1);

And here we want to *deactivate* the reset so it should be 0.

> +	usleep_range(5000, 6000);
> +
> +	ret = ov02a10_check_sensor_id(ov02a10);
> +	if (ret)
> +		goto disable_regulator;
> +
> +	return 0;
> +
> +disable_regulator:
> +	regulator_bulk_disable(ARRAY_SIZE(ov02a10_supply_names),
> +			       ov02a10->supplies);
> +disable_clk:
> +	clk_disable_unprepare(ov02a10->eclk);
> +
> +	return ret;
> +}
> +
> +static int ov02a10_power_off(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> +
> +	gpiod_set_value_cansleep(ov02a10->rst_gpio, 0);

We want to *activate* reset here, so it should be 1.

> +	clk_disable_unprepare(ov02a10->eclk);
> +	gpiod_set_value_cansleep(ov02a10->pd_gpio, 0);

We want to *activate* powerdown here, so should be 1 too.

> +	regulator_bulk_disable(ARRAY_SIZE(ov02a10_supply_names),
> +			       ov02a10->supplies);
> +
> +	return 0;
> +}
[snip]
> +static int ov02a10_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct ov02a10 *ov02a10;
> +	unsigned int rotation;
> +	unsigned int clock_lane_tx_speed;
> +	unsigned int i;
> +	int ret;
> +
> +	ov02a10 = devm_kzalloc(dev, sizeof(*ov02a10), GFP_KERNEL);
> +	if (!ov02a10)
> +		return -ENOMEM;
> +
> +	ret = ov02a10_check_hwcfg(dev, ov02a10);
> +	if (ret) {
> +		dev_err(dev, "failed to check HW configuration: %d", ret);
> +		return ret;
> +	}
> +
> +	v4l2_i2c_subdev_init(&ov02a10->subdev, client, &ov02a10_subdev_ops);
> +	ov02a10->mipi_clock_tx_speed = OV02A10_MIPI_TX_SPEED_DEFAULT;
> +	ov02a10->fmt.code = MEDIA_BUS_FMT_SBGGR10_1X10;
> +
> +	/* Optional indication of physical rotation of sensor */
> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);
> +	if (!ret && rotation == 180) {
> +		ov02a10->upside_down = true;
> +		ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
> +	}
> +
> +	/* Optional indication of mipi TX speed */
> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "ovti,mipi-tx-speed",
> +				       &clock_lane_tx_speed);
> +
> +	if (!ret)
> +		ov02a10->mipi_clock_tx_speed = clock_lane_tx_speed;
> +
> +	/* Get system clock (eclk) */
> +	ov02a10->eclk = devm_clk_get(dev, "eclk");
> +	if (IS_ERR(ov02a10->eclk)) {
> +		ret = PTR_ERR(ov02a10->eclk);
> +		dev_err(dev, "failed to get eclk %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = fwnode_property_read_u32(dev_fwnode(dev), "clock-frequency",
> +				       &ov02a10->eclk_freq);
> +	if (ret) {
> +		dev_err(dev, "failed to get eclk frequency\n");
> +		return ret;
> +	}
> +
> +	ret = clk_set_rate(ov02a10->eclk, ov02a10->eclk_freq);
> +	if (ret) {
> +		dev_err(dev, "failed to set eclk frequency (24MHz)\n");
> +		return ret;
> +	}
> +
> +	if (clk_get_rate(ov02a10->eclk) != OV02A10_ECLK_FREQ) {
> +		dev_warn(dev, "wrong eclk frequency %d Hz, expected: %d Hz\n",
> +			 ov02a10->eclk_freq, OV02A10_ECLK_FREQ);
> +		return -EINVAL;
> +	}
> +
> +	ov02a10->pd_gpio = devm_gpiod_get(dev, "powerdown", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ov02a10->pd_gpio)) {
> +		ret = PTR_ERR(ov02a10->pd_gpio);
> +		dev_err(dev, "failed to get powerdown-gpios %d\n", ret);
> +		return ret;
> +	}
> +
> +	ov02a10->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ov02a10->rst_gpio)) {
> +		ret = PTR_ERR(ov02a10->rst_gpio);
> +		dev_err(dev, "failed to get reset-gpios %d\n", ret);
> +		return ret;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(ov02a10_supply_names); i++)
> +		ov02a10->supplies[i].supply = ov02a10_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ov02a10_supply_names),
> +				      ov02a10->supplies);
> +	if (ret) {
> +		dev_err(dev, "failed to get regulators\n");
> +		return ret;
> +	}
> +
> +	mutex_init(&ov02a10->mutex);
> +	ov02a10->cur_mode = &supported_modes[0];
> +	ret = ov02a10_initialize_controls(ov02a10);
> +	if (ret) {
> +		dev_err(dev, "failed to initialize controls\n");
> +		goto err_destroy_mutex;
> +	}
> +
> +	ov02a10->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	ov02a10->subdev.entity.ops = &ov02a10_subdev_entity_ops;
> +	ov02a10->subdev.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +	ov02a10->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&ov02a10->subdev.entity, 1, &ov02a10->pad);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to init entity pads: %d", ret);
> +		goto err_free_handler;
> +	}
> +
> +	pm_runtime_enable(dev);
> +	if (!pm_runtime_enabled(dev)) {
> +		ret = ov02a10_power_on(dev);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to power on: %d\n", ret);
> +			goto err_clean_entity;
> +		}
> +	}
> +
> +	ret = v4l2_async_register_subdev(&ov02a10->subdev);
> +	if (ret) {
> +		dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> +		goto err_power_off;
> +	}
> +
> +	return 0;
> +
> +err_power_off:
> +	pm_runtime_disable(dev);
> +	if (!pm_runtime_enabled(dev))

This would be always true, resulting in unbalanced power off. Moving
pm_runtime_disable() after this if should work better.

> +		ov02a10_power_off(dev);
> +err_clean_entity:
> +	media_entity_cleanup(&ov02a10->subdev.entity);
> +err_free_handler:
> +	v4l2_ctrl_handler_free(ov02a10->subdev.ctrl_handler);
> +err_destroy_mutex:
> +	mutex_destroy(&ov02a10->mutex);
> +
> +	return ret;
> +}
> +
> +static int ov02a10_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> +
> +	v4l2_async_unregister_subdev(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_ctrl_handler_free(sd->ctrl_handler);
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_suspended(&client->dev))

Sorry, similarly to the dw9768 driver, I made a mistake and suggested the
wrong function. pm_runtime_status_suspended() should be correct here.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
