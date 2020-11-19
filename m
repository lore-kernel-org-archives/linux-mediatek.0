Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819B9C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 13:07:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C32BB2076B
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 13:07:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tQBdTuc3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mXlB++9n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C32BB2076B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s5ddIpFCGM0gc+y3cZbMiUe9jclH1AFre9l3WhS92HU=; b=tQBdTuc3I+zdyv6N0cGL/tHRB
	DygbhHmPX0D6y57yrj33QDnPTHmwxgJ7VPh1JhHnVYABMwzyjcFvRIspma5e4M0/E9znFozcuncn4
	LLKv875gLHcyPZUNGJxG+wSf7926+9FWpDOEYyn5tebOjEj8MXkQUIj+SyiYF9yfNKyWE29qh2j3F
	Pn4cl9W//2D382jI8L27cCXNcgu2YiHAtB9lreilqSQm8VEX0RTgFra0FOvnkB34oCSwE/aMguPoC
	eRN3++sA+8F2uUFiNMM6zarhfni4mITzQTqW0URQ90rGOiCwUmiV4AqvSGkUuogi9aoaeSisBLj2h
	uItqd5ezw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfjeN-0003b8-7W; Thu, 19 Nov 2020 13:06:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfjeK-0003a5-HB; Thu, 19 Nov 2020 13:06:57 +0000
X-UUID: 49393de389c148c0a8a783fbf5915941-20201119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=12lxvwfey+8nddLZ+ZoT8HbHqOzwkHuwsOhoD85K9Cg=; 
 b=mXlB++9nqp2P7V0CMz3zl6EHRz+3FxzOb3QldHur8JDi/TG+UIiAtdN2bLhlZYIViLJr0TTO0xUTuvmKKSzPKlQrEBHfm7IZ2AfPnGMTBDqOoK9PThw0+P9A49cmcQsWHPnV0BK9jv6ZPSrHG+PWucbTz8Dab0j7pjVg4yX22QU=;
X-UUID: 49393de389c148c0a8a783fbf5915941-20201119
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1927165012; Thu, 19 Nov 2020 05:06:53 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 05:06:51 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 19 Nov 2020 21:06:41 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 19 Nov 2020 21:06:40 +0800
Message-ID: <1605791201.4733.114.camel@mhfsdcap03>
Subject: Re: [PATCH v15 2/2] media: i2c: Add OV02A10 image sensor driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 19 Nov 2020 21:06:41 +0800
In-Reply-To: <20201023143156.GX4077@smile.fi.intel.com>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-3-dongchun.zhu@mediatek.com>
 <20201023143156.GX4077@smile.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C846AD7DB098136D27C99F550A830DFF88D98FA0B6CAD3A5ABB190F0FE9C2D672000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_080656_798670_7D1182F0 
X-CRM114-Status: GOOD (  27.20  )
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
 linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com,
 sakari.ailus@linux.intel.com, matthias.bgg@gmail.com, bingbu.cao@intel.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Andy,

On Fri, 2020-10-23 at 17:31 +0300, Andy Shevchenko wrote:
> On Tue, Oct 13, 2020 at 09:05:03PM +0800, Dongchun Zhu wrote:
> > Add a V4L2 sub-device driver for OmniVision OV02A10 image sensor.
> 
> ...
> 
> > +#define OV02A10_ID_MASK					0xffff
> 
> GENMASK()
> 
> (And include bits.h for that)
> 

It seems could build pass without including bits.h, as DW9768 once used.

> ...
> 
> > +static int __ov02a10_start_stream(struct ov02a10 *ov02a10)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > +	const struct ov02a10_reg_list *reg_list;
> > +	int ret;
> > +
> > +	/* Apply default values of current mode */
> > +	reg_list = &ov02a10->cur_mode->reg_list;
> > +	ret = ov02a10_write_array(ov02a10, reg_list);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Apply customized values from user */
> > +	ret = __v4l2_ctrl_handler_setup(ov02a10->subdev.ctrl_handler);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Set orientation to 180 degree */
> > +	if (ov02a10->upside_down) {
> > +		ret = i2c_smbus_write_byte_data(client, REG_MIRROR_FLIP_CONTROL,
> > +						REG_MIRROR_FLIP_ENABLE);
> > +		if (ret) {
> 
> Shouldn't you use 'ret < 0' here as well?
> 

Fixed in next release.

> > +			dev_err(&client->dev, "failed to set orientation\n");
> > +			return ret;
> > +		}
> > +		ret = i2c_smbus_write_byte_data(client, REG_GLOBAL_EFFECTIVE,
> > +						REG_ENABLE);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> > +	/* Set MIPI TX speed according to DT property */
> > +	if (ov02a10->mipi_clock_voltage != OV02A10_MIPI_TX_SPEED_DEFAULT) {
> > +		ret = i2c_smbus_write_byte_data(client, TX_SPEED_AREA_SEL,
> > +						ov02a10->mipi_clock_voltage);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> > +	/* Set stream on register */
> > +	return i2c_smbus_write_byte_data(client, REG_SC_CTRL_MODE,
> > +					 SC_CTRL_MODE_STREAMING);
> > +}
> 
> ...
> 
> > +/*
> 
> Was your intention to declare it as a kernel doc?
> 

Removed in next release.

> > + * ov02a10_set_exposure - Function called when setting exposure time
> > + * @priv: Pointer to device structure
> > + * @val: Variable for exposure time, in the unit of micro-second
> > + *
> > + * Set exposure time based on input value.
> > + *
> > + * Return: 0 on success
> > + */
> > +static int ov02a10_set_exposure(struct ov02a10 *ov02a10, int val)
> 
> ...
> 
> > +static int ov02a10_check_hwcfg(struct device *dev, struct ov02a10 *ov02a10)
> > +{
> > +	struct fwnode_handle *ep;
> > +	struct fwnode_handle *fwnode = dev_fwnode(dev);
> > +	struct v4l2_fwnode_endpoint bus_cfg = {
> > +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> > +	};
> > +	unsigned int i, j;
> > +	int ret;
> 
> > +	if (!fwnode)
> > +		return -EINVAL;
> 
> Basically you can avoid this check, but it's up to you.
> 

I'd like to keep it. Thank you.

> > +	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> > +	if (!ep)
> > +		return -ENXIO;
> > +
> > +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> > +	fwnode_handle_put(ep);
> > +	if (ret)
> > +		return ret;
> > +
> > +	for (i = 0; i < ARRAY_SIZE(link_freq_menu_items); i++) {
> > +		for (j = 0; j < bus_cfg.nr_of_link_frequencies; j++) {
> > +			if (link_freq_menu_items[i] ==
> > +				bus_cfg.link_frequencies[j]) {
> > +				ov02a10->freq_index = i;
> > +				break;
> > +			}
> > +		}
> > +
> > +		if (j == bus_cfg.nr_of_link_frequencies) {
> > +			dev_err(dev, "no link frequency %lld supported\n",
> > +				link_freq_menu_items[i]);
> > +			ret = -EINVAL;
> > +			break;
> > +		}
> > +	}
> > +
> > +	v4l2_fwnode_endpoint_free(&bus_cfg);
> > +
> > +	return ret;
> > +}
> 
> ...
> 
> > +	fwnode_property_read_u32(dev_fwnode(dev), "rotation", &rotation);
> 
> Same Q as per previous reviews. Why device property API can't be used here?
> 
> And everywhere else when you have
> 	 fwnode_property_read_*(dev_fwnode(dev), ...)
> calls.
> 

Thanks for the reminder.
'fwnode_property_read_u32' and 'fwnode_property_read_u32_array' would be
replaced in next release if local test passes.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
