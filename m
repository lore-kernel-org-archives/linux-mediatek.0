Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4296BC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 18:46:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6E79208DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 18:46:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S+3Ijh8H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P4LNQCpx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6E79208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/77Y5mw18Pwz0HPju5fHZOPjIcXUYOAMXE8rWeMru0=; b=S+3Ijh8HcmhK1e
	v1YMlfdWg6+R7anuTemg8znddSHMF6XWG3/RSch8RatmsuK1WHLFhmJOsh1BBHEmMUcEsxoU/f7w9
	1VuYt/2kDDA9KvMNjSHju/PeGKvLbBLorNSrHRiPZb5/phkPjNmkKe4stIMG9AyYPfI5JJ3dV8wdb
	AKfVaALIJQfZJFEjh/I21cnS7vWKJIdRZV0jLHhm98f7DR76s6CInBpx2jbz42oYzdPkrRR7emKIe
	FfeAuQvxV5fgpveYjO9caIkePgTidvPzgF254GwYA7VB9D41DbMfVSGE6a5Ps//nV3pZ8nQ0aDbFW
	fmnEwIEfeKgbecBhz2Pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlzY1-0006bj-U9; Thu, 18 Jun 2020 18:46:01 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlzXy-0006aq-L3
 for linux-mediatek@lists.infradead.org; Thu, 18 Jun 2020 18:46:00 +0000
Received: by mail-wm1-x344.google.com with SMTP id r15so6758214wmh.5
 for <linux-mediatek@lists.infradead.org>; Thu, 18 Jun 2020 11:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=om0q/0j+ZqIugQgaYYIuFIhrC2pXMmtAQ/IXYYyteLk=;
 b=P4LNQCpxRN8jCvdEjmGgNPLfQuIQ7KZuO5ExMbN7DTYZY2tsLbyMP2q0l0gYkSlD9u
 +p7svDC5EcuBVpD4M+r6rNupo6F/0dqcAa+2krVJTOePsmpmT+TF8f6R9Rupnvgk39Bv
 QlUvHpOz3JGN+Cm5foXSAvGMv59wReg1IuLMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=om0q/0j+ZqIugQgaYYIuFIhrC2pXMmtAQ/IXYYyteLk=;
 b=AvD0Fs8MkJQYkBCcpdrUKvr93ji0KRMNPX+CDUKHjqvTEE30MSsRocpJB6JojngOH8
 g2Fi7DqzN3XloGuDsG0of9Ybw9x2RRM6O/yX96X/vGknxTJmhTd9cCGYpf7zCGM5KFbJ
 LLyCXHBXM2Z4atmYO3pj2w1TEZRfEafT+dQWXaWguz0fvNROOvkfKXeGBjiVgLLdQcXQ
 fiJR5VxOBZvgVHEI2NumgK8KLnEqPL7VSOsy/s7vhlf4ePNzDjHk8nR6IUrY8MWYriMQ
 jzH3XDEMB9AsoAS/Uk5gaqb/U10fE6S/XgWD3cfMz33Ia13t3ekn0jwTKkATtNDa/93y
 WGPg==
X-Gm-Message-State: AOAM533dh44ZrB3HqVBtVAh0zTxb2t1B5KXp/G+O9U+BrarnuhbxDzt7
 nOifPJGBoE5EbVbRwx6OarqAcQ==
X-Google-Smtp-Source: ABdhPJxsKDOMgOezBCKzn3QqTjUHEzvRe1U6V8whyLVhKxoQ3O7dQu/6dQjOFtvoke2We8fHAwb8Xw==
X-Received: by 2002:a1c:f301:: with SMTP id q1mr5480382wmq.110.1592505957214; 
 Thu, 18 Jun 2020 11:45:57 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id g18sm4511520wme.17.2020.06.18.11.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 11:45:56 -0700 (PDT)
Date: Thu, 18 Jun 2020 18:45:54 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH V8 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200618184554.GA68039@chromium.org>
References: <20200616125531.31671-1-dongchun.zhu@mediatek.com>
 <20200616125531.31671-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616125531.31671-3-dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_114558_719798_A217F589 
X-CRM114-Status: GOOD (  16.53  )
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

On Tue, Jun 16, 2020 at 08:55:31PM +0800, Dongchun Zhu wrote:
> Add a V4L2 sub-device driver for DW9768 voice coil motor,
> providing control to set the desired focus via IIC serial interface.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  MAINTAINERS                |   1 +
>  drivers/media/i2c/Kconfig  |  12 +
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/dw9768.c | 553 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 567 insertions(+)
>  create mode 100644 drivers/media/i2c/dw9768.c
[snip]
> +static int dw9768_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct dw9768 *dw9768;
> +	unsigned int i;
> +	int ret;
> +
> +	dw9768 = devm_kzalloc(dev, sizeof(*dw9768), GFP_KERNEL);
> +	if (!dw9768)
> +		return -ENOMEM;
> +
> +	/* Initialize subdev */
> +	v4l2_i2c_subdev_init(&dw9768->sd, client, &dw9768_ops);
> +
> +	dw9768->aac_mode = DW9768_AAC_MODE_DEFAULT;
> +	dw9768->aac_timing = DW9768_AAC_TIME_DEFAULT;
> +	dw9768->clock_presc = DW9768_CLOCK_PRE_SCALE_DEFAULT;
> +
> +	/* Optional indication of AAC mode select */
> +	fwnode_property_read_u32(dev_fwnode(dev), "dongwoon,aac-mode",
> +				 &dw9768->aac_mode);
> +
> +	/* Optional indication of clock pre-scale select */
> +	fwnode_property_read_u32(dev_fwnode(dev), "dongwoon,clock-presc",
> +				 &dw9768->clock_presc);
> +
> +	/* Optional indication of AAC Timing */
> +	fwnode_property_read_u32(dev_fwnode(dev), "dongwoon,aac-timing",
> +				 &dw9768->aac_timing);
> +
> +	dw9768->move_delay_us = dw9768_cal_move_delay(dw9768->aac_mode,
> +						      dw9768->clock_presc,
> +						      dw9768->aac_timing) / 100;

nit: Could we make the function return the value in us already? One would
expect the function to return the value in a standard unit, so this
division by 100 here is confusing.

> +
> +	for (i = 0; i < ARRAY_SIZE(dw9768_supply_names); i++)
> +		dw9768->supplies[i].supply = dw9768_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(dw9768_supply_names),
> +				      dw9768->supplies);
> +	if (ret) {
> +		dev_err(dev, "failed to get regulators\n");
> +		return ret;
> +	}
> +
> +	/* Initialize controls */
> +	ret = dw9768_init_controls(dw9768);
> +	if (ret)
> +		goto err_free_handler;
> +
> +	/* Initialize subdev */
> +	dw9768->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	dw9768->sd.internal_ops = &dw9768_int_ops;
> +
> +	ret = media_entity_pads_init(&dw9768->sd.entity, 0, NULL);
> +	if (ret < 0)
> +		goto err_free_handler;
> +
> +	dw9768->sd.entity.function = MEDIA_ENT_F_LENS;
> +
> +	pm_runtime_enable(dev);
> +	if (!pm_runtime_enabled(dev)) {
> +		ret = dw9768_runtime_resume(dev);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to power on: %d\n", ret);
> +			goto err_clean_entity;
> +		}
> +	}
> +
> +	ret = v4l2_async_register_subdev(&dw9768->sd);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> +		goto err_power_off;
> +	}
> +
> +	return 0;
> +
> +err_power_off:
> +	pm_runtime_disable(dev);
> +	if (!pm_runtime_enabled(dev))

We just disabled runtime PM in the line above, so this check would be
always true. Need to call pm_runtime_disable() after this if.

> +		dw9768_runtime_suspend(dev);
> +err_clean_entity:
> +	media_entity_cleanup(&dw9768->sd.entity);
> +err_free_handler:
> +	v4l2_ctrl_handler_free(&dw9768->ctrls);
> +
> +	return ret;
> +}
> +
> +static int dw9768_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct dw9768 *dw9768 = sd_to_dw9768(sd);
> +
> +	v4l2_async_unregister_subdev(&dw9768->sd);
> +	v4l2_ctrl_handler_free(&dw9768->ctrls);
> +	media_entity_cleanup(&dw9768->sd.entity);
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_suspended(&client->dev))

Oops, I just realized that my suggestion about the function to use here
was incorrect. pm_runtime_status_suspended() should be the correct function
here. Sorry for the confusion.

This is because we only have 2 cases here:
 - runtime PM compiled out - the stubs function is used, which returns
   false, so the condition is true,
 - runtime PM compiled in - we enabled runtime PM in probe, so here we
   don't need to consider the enable state.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
