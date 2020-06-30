Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95F3C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 17:08:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6B20206BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 17:08:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l3yeQtRD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="krnaQcrW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6B20206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HHBuE2zGKtPH2+0+NEMEDtKbcUo7tjjZ0moY1jUAFSA=; b=l3yeQtRDSC48hEwULHCl7bi8Y
	S/pXKE6IXOoJP1v2njHkLG3VEIATvJ8iLhwjPrOP0AuZrd6XfRDsAi3Twsr13OsBk8eGC50QK0wPd
	26Smx1n8UlA0gWV0GhqhXv8pOlZ0ER69fo8a0smEblIITEygbuhxu+39V4qwc5TMHv+dBroSI6OuD
	NrLzYIds//U48UGz4dXr8bx54BHXjArEoWA8uKt7kkoZl8wLyLmgZpGBV9WP+9e3W5A1cVy3C5+95
	erqyIqBRbIgvAX/VObcMTU4uSCBv7hU6xf6z6EBuOBThmm3jJBoGzO/WlRZyYzPh9pSW6gf9Bm4bw
	u2YnX3TNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqJjk-0006Po-4X; Tue, 30 Jun 2020 17:08:00 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqJjZ-0006NX-Nn
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 17:07:55 +0000
Received: by mail-wm1-x343.google.com with SMTP id l17so19542338wmj.0
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2020 10:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eo3ES9sUCig8aLu5NZZkJQXvABEslHkuO9SXxTeXs7A=;
 b=krnaQcrWpA9PjZpBjE+pBBdEaARw/s+oHt5/YFoFvJphTS/aiTcVUYQvXi8rYFehln
 Nfsb2EgxZD8PIG4hq8NhzdV40PvmoApJZXgYKSUdgQ6ZfIRZOcvoDAiF/gR/7702rhfM
 0OLGZAHNZ1+N5mBncwANibrTdVA7yBuMl3lhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eo3ES9sUCig8aLu5NZZkJQXvABEslHkuO9SXxTeXs7A=;
 b=liJ4mHKQhjiy9s9JGaf4RKlXmnZXNXqqLTBiXB4TX7vsfMDURgScQaMoW9eEnCM9oG
 XRAYM68l5ZHyudbZwbjmmncCFbXo0k+71yZTABW7UIvU9ms/mEW4aQKbCoOfQo2yjw8R
 /WCB8/I37nSAOkiByIeDZFEZ57+L4Z9OJghpL7Zw0Zc5Sw7TC7iY1TnTvswOVW+9xU2J
 p56YRcuw9ntKUQVjKlalfHa/XSe7vaW/EkTxpMUK0dYp5oJcMQGEQXQK9V8ED5dE/XH4
 UwZMcJ61flgpcitwQM/fyOs7VJr+5/jYi+AHeOClP/RZXl4xG3m9j+lBN2XJDgAFvWAh
 XxmQ==
X-Gm-Message-State: AOAM531Ic0QtQ0xm1MHUOOoPsiM6xwogdU7ADVhcAGxfkcXbNznEoHYT
 LGfNDb9QtFBZM8SpGXv98g9icA==
X-Google-Smtp-Source: ABdhPJwlgaLryaWZGTbiuR1St0l7UpAMy7IhlnmJgccwBKqfDnX8dswNiXEgaVH7QqQgdM/4TqRpEA==
X-Received: by 2002:a1c:2e0e:: with SMTP id u14mr22242245wmu.55.1593536868603; 
 Tue, 30 Jun 2020 10:07:48 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id h14sm4457200wrt.36.2020.06.30.10.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 10:07:48 -0700 (PDT)
Date: Tue, 30 Jun 2020 17:07:46 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH V11 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
Message-ID: <20200630170746.GD1212092@chromium.org>
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630024942.20891-3-dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_130749_833541_8583CD77 
X-CRM114-Status: GOOD (  12.09  )
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

On Tue, Jun 30, 2020 at 10:49:42AM +0800, Dongchun Zhu wrote:
> Add a V4L2 sub-device driver for OV02A10 image sensor.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  MAINTAINERS                 |    1 +
>  drivers/media/i2c/Kconfig   |   13 +
>  drivers/media/i2c/Makefile  |    1 +
>  drivers/media/i2c/ov02a10.c | 1052 +++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 1067 insertions(+)
>  create mode 100644 drivers/media/i2c/ov02a10.c

Thank you for the patch. Please see my comments inline.

[snip]
> +static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_pad_config *cfg)
> +{
> +	struct v4l2_subdev_format fmt = {
> +		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE,

As we discussed before, this function is never called with cfg == NULL.
Perhaps what we need here is to call ov02a10_set_fmt() twice, once for
V4L2_SUBDEV_FORMAT_ACTIVE and then for V4L2_SUBDEV_FORMAT_TRY?

Sakari, would that be a proper implementation of this function?

> +		.format = {
> +			.width = 1600,
> +			.height = 1200,
> +		}
> +	};
> +
> +	ov02a10_set_fmt(sd, cfg, &fmt);
> +
> +	return 0;
[snip]

With this and Sakari's comment about the initial state of the reset pin
fixed, feel free to add my

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
