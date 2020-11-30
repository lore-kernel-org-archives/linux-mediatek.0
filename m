Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B59C64E90
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 10:35:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36D8620708
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 10:35:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gEZ2N2kS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZurS9jYa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36D8620708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mMDm5UP0jZhch3qMUDuNTFx9Xq2C5pWILg2KyYWUNqI=; b=gEZ2N2kSl3zzexnMwU43HdG28
	SBTr8L6KgXSS9XlsrWQGYzuvw8YApSL6trnM73aoZauYvZzumAD4CwesID4rN/gqawp2PBMrAfA4j
	OoLJnbHP6xKanGp5YETLiyqig91d00eVd8PGRhTgiwwY8CEXHNnfdGdu5u4sz6HUKLeTS1/Pg/gZv
	XoV80784kWXWRfE6XNgm/GsvKdtUjFoxmgQ44MkN7mujStNGxM9q00YWxDRF8wmmG0vrlNAamN7o/
	GsxgklqZumQ3AseyxIbhuXdykNmYh8Ymmju7cM9V4lWZGcujjrT89fT6dp8qkTGz8SdRPU+5NnLRP
	pcII3BNrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjgWa-0006T6-H5; Mon, 30 Nov 2020 10:35:16 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjgWW-0006S3-9e
 for linux-mediatek@lists.infradead.org; Mon, 30 Nov 2020 10:35:13 +0000
Received: by mail-pj1-x1043.google.com with SMTP id ms7so1068124pjb.4
 for <linux-mediatek@lists.infradead.org>; Mon, 30 Nov 2020 02:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JhpB/t5kCjjYRTw+xINHPebhKoCjmMuMSHZrMIpoK54=;
 b=ZurS9jYa+SkfPr8aONBeaAoWbwdGYcdP319Zi7pFHcGkGWQD6suhIhZiM6hdXlNYJX
 NLWoXceltubUgVj5mFTsaGcWP+mqyNizBlqC3MjekPidqQ16FKtKMupb5yuJhRnsJcCc
 HgqlZGwdWIfHqbGt8E0uja48kJ+L7QIVOuj5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JhpB/t5kCjjYRTw+xINHPebhKoCjmMuMSHZrMIpoK54=;
 b=oN4sYQJCfg2eFtW3gDDbtoMpDMK8He7uZ+XC7kxfQTxcy+Qpmce6ci2cUG6q14IFfb
 g+bKu3dWhkQmv5v6lKaD3aTNT/qsm7/mptID+RvzrV9NjR9RujlW2KMnZPJon078Kh+5
 gH/w1NbwgXojRxdpMrlyJh24hrRQcz/Dv0FW5BPmjhoKYKzUMkatSP44/q49QIMmV2Gl
 p9osHUVsmTf9s9OeNFF1922Gnm1ms5F/Sr+euuPGQHTERrIEvbeuigf+WNqSjp07KX1A
 acy2yQNJXPjyU+zIDAJFNRDa9Q8v19zfT2LVmuNMWnAYqAWnHIqfZ5gguXd9GjQipHkB
 lyFA==
X-Gm-Message-State: AOAM532JAhrebReYDl3lwzxQzZLJW7EsBzDwzM6k4s5yNFtNac1tykFJ
 C5lURGyQ5snVz1VfJqm9B8L19g==
X-Google-Smtp-Source: ABdhPJyV9225G6GhzTbG4x8q6OQiHe5mbw2XjxdHxilInipa53F7zqsr/KwXrSFQ1pK695aHz1Bf/Q==
X-Received: by 2002:a17:90a:3d0c:: with SMTP id
 h12mr26010674pjc.177.1606732510116; 
 Mon, 30 Nov 2020 02:35:10 -0800 (PST)
Received: from chromium.org ([2401:fa00:1:b:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id m18sm21844330pjl.41.2020.11.30.02.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 02:35:09 -0800 (PST)
Date: Mon, 30 Nov 2020 18:35:05 +0800
From: Ikjoon Jang <ikjn@chromium.org>
To: Crystal Guo <crystal.guo@mediatek.com>
Subject: Re: [v6,2/3] reset-controller: ti: introduce a new reset handler
Message-ID: <20201130103505.GA3019533@chromium.org>
References: <20200930022159.5559-1-crystal.guo@mediatek.com>
 <20200930022159.5559-3-crystal.guo@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930022159.5559-3-crystal.guo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_053512_431525_520C2027 
X-CRM114-Status: GOOD (  24.82  )
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
Cc: devicetree@vger.kernel.org, yong.liang@mediatek.com, s-anna@ti.com,
 srv_heupstream@mediatek.com, seiya.wang@mediatek.com,
 linux-kernel@vger.kernel.org, fan.chen@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, yingjoe.chen@mediatek.com, stanley.chu@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 30, 2020 at 10:21:58AM +0800, Crystal Guo wrote:
> Introduce ti_syscon_reset() to integrate assert and deassert together.
> If some modules need do serialized assert and deassert operations
> to reset itself, reset_control_reset can be called for convenience.
> 
> Such as reset-qcom-aoss.c, it integrates assert and deassert together
> by 'reset' method. MTK Socs also need this method to perform reset.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

> ---
>  drivers/reset/reset-ti-syscon.c | 40 ++++++++++++++++++++++++++++++++-
>  1 file changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
> index a2635c21db7f..5d1f8306cd4f 100644
> --- a/drivers/reset/reset-ti-syscon.c
> +++ b/drivers/reset/reset-ti-syscon.c
> @@ -15,15 +15,22 @@
>   * GNU General Public License for more details.
>   */
>  
> +#include <linux/delay.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
>  #include <linux/reset-controller.h>
>  
>  #include <dt-bindings/reset/ti-syscon.h>
>  
> +struct mediatek_reset_data {
> +	unsigned char *reset_bits;
> +	unsigned int reset_duration_us;
> +};
> +
>  /**
>   * struct ti_syscon_reset_control - reset control structure
>   * @assert_offset: reset assert control register offset from syscon base
> @@ -56,6 +63,7 @@ struct ti_syscon_reset_data {
>  	struct regmap *regmap;
>  	struct ti_syscon_reset_control *controls;
>  	unsigned int nr_controls;
> +	const struct mediatek_reset_data *reset_data;
>  };
>  
>  #define to_ti_syscon_reset_data(rcdev)	\
> @@ -158,9 +166,29 @@ static int ti_syscon_reset_status(struct reset_controller_dev *rcdev,
>  		!(control->flags & STATUS_SET);
>  }
>  
> +static int ti_syscon_reset(struct reset_controller_dev *rcdev,
> +				  unsigned long id)
> +{
> +	struct ti_syscon_reset_data *data = to_ti_syscon_reset_data(rcdev);
> +	int ret;
> +
> +	if (data->reset_data) {
> +		ret = ti_syscon_reset_assert(rcdev, id);
> +		if (ret)
> +			return ret;
> +		usleep_range(data->reset_data->reset_duration_us,
> +			data->reset_data->reset_duration_us * 2);
> +

There are many users using assert() and deassert() seperately
without any delay between them.

If there's a timing requirement between assertion and deassertion,
shouldn't there be a same amount of delay in assert?

> +		return ti_syscon_reset_deassert(rcdev, id);
> +	} else {
> +		return -ENOTSUPP;
> +	}
> +}
> +
>  static const struct reset_control_ops ti_syscon_reset_ops = {
>  	.assert		= ti_syscon_reset_assert,
>  	.deassert	= ti_syscon_reset_deassert,
> +	.reset		= ti_syscon_reset,
>  	.status		= ti_syscon_reset_status,
>  };
>  
> @@ -182,7 +210,11 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
>  	if (IS_ERR(regmap))
>  		return PTR_ERR(regmap);
>  
> -	list = of_get_property(np, "ti,reset-bits", &size);
> +	data->reset_data = of_device_get_match_data(&pdev->dev);
> +	if (data->reset_data)
> +		list = of_get_property(np, data->reset_data->reset_bits, &size);
> +	else
> +		list = of_get_property(np, "ti,reset-bits", &size);
>  	if (!list || (size / sizeof(*list)) % 7 != 0) {
>  		dev_err(dev, "invalid DT reset description\n");
>  		return -EINVAL;
> @@ -217,8 +249,14 @@ static int ti_syscon_reset_probe(struct platform_device *pdev)
>  	return devm_reset_controller_register(dev, &data->rcdev);
>  }
>  
> +static const struct mediatek_reset_data mtk_reset_data = {
> +	.reset_bits = "mediatek,reset-bits",
> +	.reset_duration_us = 10,
> +};
> +
>  static const struct of_device_id ti_syscon_reset_of_match[] = {
>  	{ .compatible = "ti,syscon-reset", },
> +	{ .compatible = "mediatek,syscon-reset", .data = &mtk_reset_data},
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, ti_syscon_reset_of_match);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
