Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DF1AC4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 14:31:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CABDC21527
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 14:31:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s/IXYFQT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CABDC21527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gMzblBmkQSWMcpmiksTEC/amlhNqLyjxa/jdcDDonYA=; b=s/IXYFQT+0cv8B7A5oPjA5X8p
	oLJdurGGZDNcXiwuZirGxKocY7WuP8mWNkvDAh7dTpYM4O31R3zOkjQGwqrxTCaic49cbxzUMvQPB
	GaxUYRaWgySAnKwKLRmJP0/JmAsxs9Mmqx42h8woAXRA37jGEWkOi7CHZI4OFVOB7WzRXNnRSrC9h
	Ydk+SjmZcuhWnoSF1CZAa9FENhEr90dfqqROWOgrcGoeEcZmVujcu78My54IDYA8+/BlZqAibSNI4
	h+UcZU0whrFwN9+xO06fGGi+TX21D954P7EK1ogQCsVIq5kypkJlBu26ihVg2Mfcm0Bff6NaiMg+Y
	MuleQ6XTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVy63-0002XJ-Bu; Fri, 23 Oct 2020 14:31:12 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVy5x-0002VV-Df; Fri, 23 Oct 2020 14:31:06 +0000
IronPort-SDR: g7l3V+1nTvJfHdTgYE20vPnRGIMSV8AxGtUiDXtFhR8QRj3062pSJSgTVI5x5xWWcQe3l94U9c
 vY4wdYAIZqkQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9782"; a="154640202"
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; d="scan'208";a="154640202"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 07:30:58 -0700
IronPort-SDR: strZ7qZQpzKzpW+H9q1kQAGAQ2o4KKVxcx2BObcjmBmCxf0w5J4zy48ak1cHbj/rIJ9J49uzSh
 S2ndozz2CtvA==
X-IronPort-AV: E=Sophos;i="5.77,408,1596524400"; d="scan'208";a="523514927"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2020 07:30:54 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kVy6m-00E8jW-Fi; Fri, 23 Oct 2020 17:31:56 +0300
Date: Fri, 23 Oct 2020 17:31:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH v15 2/2] media: i2c: Add OV02A10 image sensor driver
Message-ID: <20201023143156.GX4077@smile.fi.intel.com>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013130503.2412-3-dongchun.zhu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_103105_632217_9096B656 
X-CRM114-Status: GOOD (  23.01  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org,
 srv_heupstream@mediatek.com, shengnan.wang@mediatek.com, tfiga@chromium.org,
 louis.kuo@mediatek.com, sj.huang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, sakari.ailus@linux.intel.com,
 matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 13, 2020 at 09:05:03PM +0800, Dongchun Zhu wrote:
> Add a V4L2 sub-device driver for OmniVision OV02A10 image sensor.

...

> +#define OV02A10_ID_MASK					0xffff

GENMASK()

(And include bits.h for that)

...

> +static int __ov02a10_start_stream(struct ov02a10 *ov02a10)
> +{
> +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> +	const struct ov02a10_reg_list *reg_list;
> +	int ret;
> +
> +	/* Apply default values of current mode */
> +	reg_list = &ov02a10->cur_mode->reg_list;
> +	ret = ov02a10_write_array(ov02a10, reg_list);
> +	if (ret)
> +		return ret;
> +
> +	/* Apply customized values from user */
> +	ret = __v4l2_ctrl_handler_setup(ov02a10->subdev.ctrl_handler);
> +	if (ret)
> +		return ret;
> +
> +	/* Set orientation to 180 degree */
> +	if (ov02a10->upside_down) {
> +		ret = i2c_smbus_write_byte_data(client, REG_MIRROR_FLIP_CONTROL,
> +						REG_MIRROR_FLIP_ENABLE);
> +		if (ret) {

Shouldn't you use 'ret < 0' here as well?

> +			dev_err(&client->dev, "failed to set orientation\n");
> +			return ret;
> +		}
> +		ret = i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> +						REG_ENABLE);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/* Set MIPI TX speed according to DT property */
> +	if (ov02a10->mipi_clock_voltage != OV02A10_MIPI_TX_SPEED_DEFAULT) {
> +		ret = i2c_smbus_write_byte_data(client, TX_SPEED_AREA_SEL,
> +						ov02a10->mipi_clock_voltage);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	/* Set stream on register */
> +	return i2c_smbus_write_byte_data(client, REG_SC_CTRL_MODE,
> +					 SC_CTRL_MODE_STREAMING);
> +}

...

> +/*

Was your intention to declare it as a kernel doc?

> + * ov02a10_set_exposure - Function called when setting exposure time
> + * @priv: Pointer to device structure
> + * @val: Variable for exposure time, in the unit of micro-second
> + *
> + * Set exposure time based on input value.
> + *
> + * Return: 0 on success
> + */
> +static int ov02a10_set_exposure(struct ov02a10 *ov02a10, int val)

...

> +static int ov02a10_check_hwcfg(struct device *dev, struct ov02a10 *ov02a10)
> +{
> +	struct fwnode_handle *ep;
> +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> +	struct v4l2_fwnode_endpoint bus_cfg = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};
> +	unsigned int i, j;
> +	int ret;

> +	if (!fwnode)
> +		return -EINVAL;

Basically you can avoid this check, but it's up to you.

> +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> +	if (!ep)
> +		return -ENXIO;
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
> +		for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
> +			if (link_freq_menu_items[i] ==
> +				bus_cfg.link_frequencies[j]) {
> +				ov02a10->freq_index = i;
> +				break;
> +			}
> +		}
> +
> +		if (j == bus_cfg.nr_of_link_frequencies) {
> +			dev_err(dev, "no link frequency %lld supported\n",
> +				link_freq_menu_items[i]);
> +			ret = -EINVAL;
> +			break;
> +		}
> +	}
> +
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +	return ret;
> +}

...

> +	fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);

Same Q as per previous reviews. Why device property API can't be used here?

And everywhere else when you have
	 fwnode_property_read_*(dev_fwnode(dev), ...)
calls.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
