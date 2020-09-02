Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DD1C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 05:35:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ED5620758
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 05:35:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bACnvXTi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pDzQpqIN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ED5620758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/ePucJOY8SfRW2VBWKSKdPeVv4kNQ17t6l/BdgaVXY8=; b=bACnvXTi9EuTY1f4fOHRYoiIj
	lsbQD/DGsWt7MdC/ZHYhmGLHasQzM1O9EBFnEKef8JEUj+qbHaMkjxaBYtZV7F+eNwK4VI7k4HXlQ
	KSIqgzG3B4lMZOIPV1WCAMnQjUtP8CrzA82gkpB0fi2dPQ/bCEvIjjiFhpv232dWvzYBw5fdVHmus
	QOiISlS1M3YqGcWpI6wmCJE2WFV9t06qBRifbt4AWsliith3rJI7ME0bgz3mzppZZca04ieeTnJ1i
	cQRn5o490o7SCxTPAzsBuWScYXgZpyQD+LPRcTuHC6g6Ct4bkLJ1FBZVVvn90AyEcfw6NBLWdcVC5
	PbGlJ9ZmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDLQv-0005rI-ML; Wed, 02 Sep 2020 05:35:45 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDLQt-0005q1-PN; Wed, 02 Sep 2020 05:35:44 +0000
Received: by mail-pl1-x643.google.com with SMTP id y6so1756481plt.3;
 Tue, 01 Sep 2020 22:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eQPR30zGfRfeAaiqiFgod4rMnLiD9w7BcMVmHoMNe6I=;
 b=pDzQpqINV8Bc/bc9VIOK+95xcXunbQUoqiHZ+g1Vc3u4naR3uz/81aNSPNi1S+iJim
 UBo+xMuLI+Axtc0qbjDY4xwBG7Egssp2GVM3vJQyO70DNYOGvfvHyzuMpItR+9DoCNSh
 ZybDEywUInFXMB168+RHJTmC9Z+U2cd06klj41JAsLqICHz/WqLzhVcAwsVsI6K48YSb
 M+rbaDf1Z6T6kbuSNTp+av9JNHNpJhOKjjh8by8n/vOawHBNvmgAL6fNGVTUjOZdQ/QO
 IdPHLOjiR1DnXBqU9nUG89pDZVl18svEvfipP9r92UEVblcenJdTAgk5rphfQD4PSVnc
 1DJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eQPR30zGfRfeAaiqiFgod4rMnLiD9w7BcMVmHoMNe6I=;
 b=W87FBkWcqnpGZjlmnIoAPWy1pNvlzamXNHLozCFagiRrCIi6BU0XTEwHX4+Ds2n9W/
 qJsWtsrQ7nAoLjL/MBV87AKd12JJjQliyHl7PWjEff/5hDnJmlsojyeL3IM/5bc4EH9U
 gRpkY1vjbUJ/nEM5pAGwsfBLDp6OJWVG+YC9H+1W00D42ftQpRuInEPRT92OsUYxXe8H
 GW/XUjbXjN6TpG5cVDjYsV08CrZPecPO+sLs3daw5XYhIi7g3fxX3lP4yUThsbtGN4or
 mn7VOjtUi6YIHaL+lsaVYUoX8Dv5pKBSbC21nyDp2O809urWiZEbhk9reH3p+Ai0ktSm
 2sfA==
X-Gm-Message-State: AOAM530wG4ee+bNbQbZhgHneqpKx0AP4j56d/Rb6AetdDzH5KlK68MgK
 jlBYNRaqxHmS5crShN3G1V6XWfI3e3I=
X-Google-Smtp-Source: ABdhPJyNlWT8JPI8rqixhq9HIg8+D7+aDTjHXMIKLbUrx9Nv2GXMWOXm0vv/86Ne5hHQSHaeBIzS1Q==
X-Received: by 2002:a17:90b:1916:: with SMTP id
 mp22mr737220pjb.132.1599024938457; 
 Tue, 01 Sep 2020 22:35:38 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:a6ae:11ff:fe11:4b46])
 by smtp.gmail.com with ESMTPSA id in12sm3154140pjb.29.2020.09.01.22.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 22:35:37 -0700 (PDT)
Date: Wed, 2 Sep 2020 14:35:35 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH V10 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200902053535.GC2264887@google.com>
References: <20200703080404.29770-1-dongchun.zhu@mediatek.com>
 <20200703080404.29770-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703080404.29770-3-dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_013543_827438_F3995F80 
X-CRM114-Status: GOOD (  14.22  )
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
 andriy.shevchenko@linux.intel.com, louis.kuo@mediatek.com,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linus.walleij@linaro.org, shengnan.wang@mediatek.com, tfiga@chromium.org,
 bgolaszewski@baylibre.com, sj.huang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, sakari.ailus@linux.intel.com,
 matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On (20/07/03 16:04), Dongchun Zhu wrote:
[..]
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
[..]
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

I would expect to see a slightly different order here: first set
everything up, then expose the device to PM subsystem.

[..]
> +static int dw9768_remove(struct i2c_client *client)
> +{
> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> +	struct dw9768 *dw9768 = sd_to_dw9768(sd);
> +
> +	v4l2_async_unregister_subdev(&dw9768->sd);
> +	v4l2_ctrl_handler_free(&dw9768->ctrls);
> +	media_entity_cleanup(&dw9768->sd.entity);
> +	pm_runtime_disable(&client->dev);
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		dw9768_runtime_suspend(&client->dev);
> +	pm_runtime_set_suspended(&client->dev);

Ditto. Shall we first disable PM (so that we won't get any unexpected
PM callbacks) and then destroy the device?

	-ss

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
