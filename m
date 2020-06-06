Return-Path: <SRS0=8CO7=7T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CD0C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jun 2020 06:22:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81461206DC
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jun 2020 06:22:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AHh1eveV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="d8vF+8q3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81461206DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHgxBQNjUr4+nFJSZ4DI1oAOVEm4TtiVL6QGSRhQffE=; b=AHh1eveVsN5bBx
	cJDtfVzL7nVT7tZ7MxJcYJ0drqI4q6fQ48SssPzmF2TnOLZUXG6uo9sgKaomUBWa3YkYreXBGjnD4
	moPqDXk8O5ALEeUEZ752du9412rU94VMKGiIzodatui7lPiTuqgJc/lfuH5+nOsvRuQ4ihF+j6DEp
	eBFcWS4hvpJf2vOB3Vbg0HG2cNBrPK6Jt6x5gx9lt8D8gSh8j7tAw2S9L6cQp0BDnvSe1dR9IIMg0
	cl+xmf2jqcnzH+XO3in3r+YwH20zWz7UJQA406/Lii7JyJ1iV6zM7oAFFgC8L3FdLgmLeCFNzsx3o
	nm5V7T4jR7AMZOp3IsAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jhSDH-0001fS-KD; Sat, 06 Jun 2020 06:21:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhSDD-0001er-Mh; Sat, 06 Jun 2020 06:21:50 +0000
X-UUID: 94b25c41c9a240c591d9d875185ef265-20200605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RAIUVuLYgVuH/CCeUhIwCgt+EzgNoHQKrfHndQk9RvY=; 
 b=d8vF+8q3RA1y7ZPvnWi0P0LncAXT02q4+IoYIgo58GNQ5xhxz5ny1cPoIW1kJpqDojkACkM6A6qdQqSxD/MXW4nXuK907NuT/eYOHRJxAdeuPke3/9L5JE2AmZR5ToZjtROknc3Es4/2pP2tSlOuCEytggIV7zx5liNuzJx3DlE=;
X-UUID: 94b25c41c9a240c591d9d875185ef265-20200605
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1559792181; Fri, 05 Jun 2020 22:21:40 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Jun 2020 23:21:32 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 6 Jun 2020 14:21:20 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 6 Jun 2020 14:21:23 +0800
Message-ID: <1591424358.8804.599.camel@mhfsdcap03>
Subject: Re: [V7, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Sat, 6 Jun 2020 14:19:18 +0800
In-Reply-To: <20200605124643.GG2428291@smile.fi.intel.com>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
 <20200605105412.18813-3-dongchun.zhu@mediatek.com>
 <20200605124643.GG2428291@smile.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 935CFC8C3612F8EF46331B0CFDC7ACBCD9C86D19164ACD1A99FF20AA7B28C4202000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_232147_749508_270471E3 
X-CRM114-Status: GOOD (  20.55  )
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
 louis.kuo@mediatek.com, srv_heupstream@mediatek.com, linus.walleij@linaro.org,
 shengnan.wang@mediatek.com, tfiga@chromium.org, bgolaszewski@baylibre.com,
 sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 dongchun.zhu@mediatek.com, sakari.ailus@linux.intel.com,
 matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Andy,

Thanks for the review. My replies are as below.

On Fri, 2020-06-05 at 15:46 +0300, Andy Shevchenko wrote:
> On Fri, Jun 05, 2020 at 06:54:12PM +0800, Dongchun Zhu wrote:
> > Add a V4L2 sub-device driver for DW9768 voice coil motor, providing
> > control to set the desired focus via IIC serial interface.
> 
> ...
> 
> > +config VIDEO_DW9768
> > +	tristate "DW9768 lens voice coil support"
> > +	depends on I2C && VIDEO_V4L2
> 
> No compile test?
> 

Sorry?
Kconfig here is based on the current media tree master branch.
It is also what the other similar drivers from Dongwoon do. 

> > +	depends on PM
> 
> This is very strange dependency for ordinary driver.
> 

Thanks for the reminder.
This would be removed in next release.
As dw9768_runtime_resume/suspend would be called if runtime PM is
disabled.

> > +	select MEDIA_CONTROLLER
> > +	select VIDEO_V4L2_SUBDEV_API
> > +	select V4L2_FWNODE
> 
> ...
> 
> > +/*
> > + * DW9768 requires waiting time (delay time) of t_OPR after power-up,
> > + * or in the case of PD reset taking place.
> > + */
> > +#define DW9768_T_OPR_US				1000
> > +#define DW9768_Tvib_MS_BASE10			(64 - 1)
> > +#define DW9768_AAC_MODE_DEFAULT			2
> 
> > +#define DW9768_AAC_TIME_DEFAULT			0x20
> 
> Hex? Why not decimal?
> 

There is one optional property 'dongwoon,aac-timing' defined in DT.
I don't know whether you have noticed that.

'DW9768_AAC_TIME_DEFAULT' is the value set to AACT[5:0] register.
I thought the Hex unit should be proper as it is directly written to the
Hex register.

> > +#define DW9768_CLOCK_PRE_SCALE_DEFAULT		1
> 
> ...
> 
> > +static int dw9768_mod_reg(struct dw9768 *dw9768, u8 reg, u8 mask, u8 val)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> > +	int ret;
> > +
> > +	ret = i2c_smbus_read_byte_data(client, reg);
> > +	if (ret < 0)
> > +		return ret;
> > +
> 
> > +	val = ((unsigned char)ret & ~mask) | (val & mask);
> 
> This cast is weird.
> 

Thanks for the review, but this cast is using classical pattern from
your suggestion on OV02A10 v5:
https://patchwork.linuxtv.org/patch/59788/

So I wonder whether it is still required to be refined currently.
Or what would it be supposed to do for the cast?

> > +
> > +	return i2c_smbus_write_byte_data(client, reg, val);
> > +}
> 
> ...
> 
> > +			dev_err(&client->dev, "%s I2C failure: %d",
> > +				__func__, ret);
> 
> One line?
> 

Splitting the sentence into two lines or not should both be okay.
Of course, I could put them in one line in next release.

> ...
> 
> > +static int dw9768_release(struct dw9768 *dw9768)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&dw9768->sd);
> > +	u32 move_delay_us = dw9768_cal_move_delay(dw9768->aac_mode,
> > +						  dw9768->clock_presc,
> > +						  dw9768->aac_timing) / 100;
> > +	int ret, val;
> > +
> > +	val = round_down(dw9768->focus->val, DW9768_MOVE_STEPS);
> > +	for ( ; val >= 0; val -= DW9768_MOVE_STEPS) {
> > +		ret = dw9768_set_dac(dw9768, val);
> > +		if (ret) {
> > +			dev_err(&client->dev, "I2C write fail: %d", ret);
> > +			return ret;
> > +		}
> > +		usleep_range(move_delay_us, move_delay_us + 1000);
> > +	}
> 
> 
> It will look more naturally in the multiplier kind of value.
> 
> 	unsigned int steps = DIV_ROUND_UP(...);
> 
> 	while (steps--) {
> 		...(..., steps * ..._MOVE_STEPS);
> 		...
> 	}
> 
> but double check arithmetics.
> 

The current coding style is actually updated with reference to your
previous comments on DW9768 v3:
https://patchwork.linuxtv.org/patch/61856/

> > +	return 0;
> > +}
> 
> 
> Also it seems we need to have writex_poll_timeout() implementation (see
> iopoll.h).
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
