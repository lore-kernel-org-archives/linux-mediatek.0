Return-Path: <SRS0=3/N7=7X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0CD8C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 18:36:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 826F82070B
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 18:36:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mk/MBn8H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RPnWMutX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 826F82070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ML+d1KrIwUoXpl95WwCSZAI/bNfbCODhLWAgymDz8rU=; b=Mk/MBn8HLs5rKw
	AxyEs3yc1HvWFCe+gyhhFXye3SeINOb07ACUQkv+6nW7Xr/n2hSYgbakBjufHpAq/HgSOrL/swXIP
	LNhKC8no/Tq0Fa0mKU7mCxNxeVhZbsTvHxvl4Ds7vcfMThpN2h9otnxTWHYY/2T7GSYm6Ro/hb7Uv
	2tMpt1XkXP6E6IIeA901g5bOwkG9XErE9E0iqCDXbcDdFP2dRpyKUknxd8uO6KDRV6SufRvbwog/k
	+ODgccZa/UeZgWRuV/cVDarOGcuXuTHy5LIIQK0yfmFHlybjJN9kmezSHtKKTojzVfO86aeW2HIIO
	Cp90UR3jmsNn+yfMkfUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jj5aD-0007pl-OO; Wed, 10 Jun 2020 18:36:17 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jj5a0-0007fn-MR
 for linux-mediatek@lists.infradead.org; Wed, 10 Jun 2020 18:36:08 +0000
Received: by mail-wm1-x32c.google.com with SMTP id d128so2764312wmc.1
 for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2020 11:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GAKX/BkxTn/LJgWRS+1X11Mbc2rWzrpG7EzLbVyHFc0=;
 b=RPnWMutX/QRRcz0TMYMoRUA578kiy7PU2Vm88l+RS5gO/Pknvm5sWAtth+EliUqh38
 C/UAvvkRwHxWgIhri0FAZGPcCri1wJvxiuiEWMwfPRcAtMNrizZUhQ5wz7rYsUUYyvaJ
 FtZB75PSjzL6hvGkf/JJzuRYcux77pdBbkM+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GAKX/BkxTn/LJgWRS+1X11Mbc2rWzrpG7EzLbVyHFc0=;
 b=rY6emQcHLvXgOUK/bldy10Y/IcYygLX3u52r/smy4txKsCB6tiOakQiixLYVEPO3jX
 +DrAiAa8EmsOIE5ESxhQ0E8D0OlyFsNjy9DCgVeGlax7YTSbdfrfVXDlWTVLC+vpMlN1
 sKbiAVEWNLp0UXIqekr8L+Ycw/8kHvWVqeG/1q8ztjbxYapzJi+8cahzyXVglLk0/QAd
 3bbB05dxphJSNLhXYOVs3C4Eeyco6EGKPBd5VmB2gYHczWEIONI9Cn4TPVHJ0tkJDJbw
 BVxvftLDwjPCZj/svGILJzGfDY7xAEB5nNpQweV7Mgd7D02xrox2rvZvksL8suWP65/h
 EZFQ==
X-Gm-Message-State: AOAM533A8LtpsxMIPoC0ApzuwF0bLKNlrqLHK370HyY02G/Q63WlYxe9
 1VNwD7oNHZ3vZDmEecdMjZPTSg==
X-Google-Smtp-Source: ABdhPJy74R1qCnO28Ip6GBZKnzUcwExOKJX50OLQZG2OUIsPlzuJOoCoKc9XcVZG+a5TOL8W/oWneQ==
X-Received: by 2002:a1c:e0c3:: with SMTP id x186mr4322110wmg.17.1591814162734; 
 Wed, 10 Jun 2020 11:36:02 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id d5sm981424wrb.14.2020.06.10.11.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 11:36:02 -0700 (PDT)
Date: Wed, 10 Jun 2020 18:36:00 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [V8, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
Message-ID: <20200610183600.GI201868@chromium.org>
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
 <20200509080627.23222-3-dongchun.zhu@mediatek.com>
 <20200521193204.GA14214@chromium.org>
 <1590209415.8804.431.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1590209415.8804.431.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200610_113604_750787_4D2751E3 
X-CRM114-Status: GOOD (  28.45  )
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

On Sat, May 23, 2020 at 12:50:15PM +0800, Dongchun Zhu wrote:
> Hi Tomasz,
> 
> Thanks for the review. My replies are as below.
> 
> On Thu, 2020-05-21 at 19:32 +0000, Tomasz Figa wrote:
> > Hi Dongchun,
> > 
> > On Sat, May 09, 2020 at 04:06:27PM +0800, Dongchun Zhu wrote:
[snip]
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > +	int ret;
> > > +
> > > +	gpiod_set_value_cansleep(ov02a10->n_rst_gpio, 0);
> > > +	gpiod_set_value_cansleep(ov02a10->pd_gpio, 0);
> > > +
> > > +	ret = clk_prepare_enable(ov02a10->eclk);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "failed to enable eclk\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = regulator_bulk_enable(OV02A10_NUM_SUPPLIES, ov02a10->supplies);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "failed to enable regulators\n");
> > > +		goto disable_clk;
> > > +	}
> > > +	usleep_range(5000, 6000);
> > > +
> > > +	gpiod_set_value_cansleep(ov02a10->pd_gpio, 1);
> > 
> > This is a "powerdown" GPIO. It must be set to 0 if the sensor is to be
> > powered on.
> > 
> 
> The value set by gpiod_set_value_cansleep() API actually depends upon
> GPIO polarity defined in DT.
> Since I set GPIO_ACTIVE_LOW to powerdown,
> gpiod_set_value_cansleep(gpio_desc, value) would set !value to
> gpio_desc.
> Thus here powerdown would be low-state when sensor is powered on.
> For GPIO polarity, I also post a comment to the binding patch.
>

That's true. However, this makes the driver really confusing. If someone
reads this code and compares with the datasheet, it looks incorrect,
because in the datasheet the powerdown GPIO needs to be configured low
for the sensor to operate.

I'd recommend defining the binding in a way that makes it clear in the driver code
that it implementes the power sequencing as per the datasheet.

[snip]
> > > +/*
> > > + * ov02a10_set_exposure - Function called when setting exposure time
> > > + * @priv: Pointer to device structure
> > > + * @val: Variable for exposure time, in the unit of micro-second
> > > + *
> > > + * Set exposure time based on input value.
> > > + *
> > > + * Return: 0 on success
> > > + */
> > > +static int ov02a10_set_exposure(struct ov02a10 *ov02a10, int val)
> > > +{
> > > +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > +	int ret;
> > > +
> > > +	ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
> > > +	if (ret < 0)
> > > +		return ret;
> > 
> > How does this page switch work? According to the documentation I have, the
> > register allows selecting between a few different pages. However, there
> > should be two page pointers - one for the AP and the other for the sensor,
> > so that when the AP is programming page X, the sensor can have consistent
> > settings from page Y. But here we only set one register and always with
> > page 1.
> > 
> 
> Thanks for the carefully observation.
> The style or requirement of register setting here is suggested by OV
> vendor.
> From hardware signal behavior and effect-test, this setting should be
> right.
> But for your concern, we can also dig into it with OV.
> Let's have time to talk with OV.
> 
> > > +
> > > +	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_EXPOSURE_H,
> > > +					val >> OV02A10_EXP_SHIFT);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_EXPOSURE_L, val);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	return i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> > > +					 REG_ENABLE);
> > 
> > This patch defines REG_GLOBAL_EFFECTIVE to 0x01. I don't see such register
> > mentioned in the documentation.
> > 
> 
> There may be several editions of sensor documentation.
> From OV, 0x01 is one register shall be updated to keep
> exposure/gain/test pattern... register settings effective.
>

Okay, let's try to get some explanation of this offline.

> > > +}
> > > +
> > > +static int ov02a10_set_gain(struct ov02a10 *ov02a10, int val)
> > > +{
> > > +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > +	int ret;
> > > +
> > > +	ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_GAIN, val);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	return i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> > > +					 REG_ENABLE);
> > > +}
> > > +
> > > +static int ov02a10_set_vblank(struct ov02a10 *ov02a10, int val)
> > > +{
> > > +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > +	u32 vts = val + ov02a10->cur_mode->height - OV02A10_BASIC_LINE;
> > > +	int ret;
> > > +
> > > +	ret = i2c_smbus_write_byte_data(client, REG_PAGE_SWITCH, REG_ENABLE);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_H,
> > > +					vts >> OV02A10_VTS_SHIFT);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	ret = i2c_smbus_write_byte_data(client, OV02A10_REG_VTS_L, vts);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	return i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> > > +					 REG_ENABLE);
> > > +}
> > > +
> > > +static int ov02a10_set_test_pattern(struct ov02a10 *ov02a10, int pattern)
> > > +{
> > > +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > +	int ret;
> > > +
> > > +	if (pattern)
> > > +		pattern = OV02A10_TEST_PATTERN_ENABLE;
> > 
> > Is this necessary? Our control can be 0 for disabled and 1 for color bars.
> > The latter is the same as the above macro.
> > 
> 
> Yes. It looks redundant here.
> Fixed in next release.
> 
> > [snip]
> > > +static int ov02a10_initialize_controls(struct ov02a10 *ov02a10)
> > > +{
> > > +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > > +	const struct ov02a10_mode *mode;
> > > +	struct v4l2_ctrl_handler *handler;
> > > +	struct v4l2_ctrl *ctrl;
> > > +	u64 exposure_max;
> > > +	u32 pixel_rate, h_blank;
> > > +	int ret;
> > > +
> > > +	handler = &ov02a10->ctrl_handler;
> > > +	mode = ov02a10->cur_mode;
> > > +	ret = v4l2_ctrl_handler_init(handler, 7);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	handler->lock = &ov02a10->mutex;
> > > +
> > > +	ctrl = v4l2_ctrl_new_int_menu(handler, NULL, V4L2_CID_LINK_FREQ, 0, 0,
> > > +				      link_freq_menu_items);
> > > +	if (ctrl)
> > > +		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +
> > > +	pixel_rate = to_pixel_rate(0);
> > > +	v4l2_ctrl_new_std(handler, NULL, V4L2_CID_PIXEL_RATE, 0, pixel_rate, 1,
> > > +			  pixel_rate);
> > > +
> > > +	h_blank = mode->hts_def - mode->width;
> > > +	ov02a10->hblank = v4l2_ctrl_new_std(handler, NULL, V4L2_CID_HBLANK,
> > > +					    h_blank, h_blank, 1, h_blank);
> > > +	if (ov02a10->hblank)
> > > +		ov02a10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> > > +
> > 
> > Do we need to hold a pointer to this control? We don't seem to ever access
> > it anywhere else in the driver.
> > 
> 
> No.
> These lines would be removed in next release.
> 
> > > +	ov02a10->vblank = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
> > > +					    V4L2_CID_VBLANK, mode->vts_def -
> > > +					    mode->height,
> > > +					    OV02A10_VTS_MAX - mode->height, 1,
> > > +					    mode->vts_def - mode->height);
> > > +
> > 
> > Ditto.
> > 
> 
> These lines would be removed in next release.
> 
> > > +	exposure_max = mode->vts_def - 4;
> > > +	ov02a10->exposure = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
> > > +					      V4L2_CID_EXPOSURE,
> > > +					      OV02A10_EXPOSURE_MIN,
> > > +					      exposure_max,
> > > +					      OV02A10_EXPOSURE_STEP,
> > > +					      mode->exp_def);
> > > +
> > > +	ov02a10->anal_gain = v4l2_ctrl_new_std(handler, &ov02a10_ctrl_ops,
> > > +					       V4L2_CID_ANALOGUE_GAIN,
> > > +					       OV02A10_GAIN_MIN,
> > > +					       OV02A10_GAIN_MAX,
> > > +					       OV02A10_GAIN_STEP,
> > > +					       OV02A10_GAIN_DEFAULT);
> > 
> > Ditto.
> > 
> 
> Fields: exposure and anal_gain would be removed in next release.
> But v4l2_ctrl_new_std remains, as user may set exp/gain. 
> 

I don't mean removing the controls, but just not storing the returned
pointers inside driver data.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
