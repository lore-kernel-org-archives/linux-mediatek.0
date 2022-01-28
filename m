Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6AAC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 10:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Wh2Iikvqah99UqDz6SCBkRUmzFxWRsG++A46Mj8xhM=; b=LHvhobKvH2E9u4
	xvOAyNStwjfHrEDxXGX+54YL3NjMmkhw2Xe8hag+ZBp5YHqLSaO233pJ6Nt4/PUgwR/jlDBKF+Joy
	nvEoMk3ot+56OKwofk5gq1ntqGTbkB6+4RgzkodjTL7HqxUBSI5+sO5vi8NN32znKHikLVX1Fp53y
	4jppTubrU2RReZap7nTrVQN+8CryjrSga0KxLhQ44xP5I6CuIEdFeewszchfksO21XefXaa9JShJe
	Hhzy7y8MOndx/gWHYCNtP/MFaFxCUx/lpOZiTvuSqW6NXtTT8d8omankOxunnFyTNDGFPEtVDBa0x
	GWApAl91Yr1WqSB24BUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDO69-001MjZ-OO; Fri, 28 Jan 2022 10:03:17 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDO65-001MhD-0n
 for linux-mediatek@lists.infradead.org; Fri, 28 Jan 2022 10:03:15 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 c190-20020a1c9ac7000000b0035081bc722dso3676815wme.5
 for <linux-mediatek@lists.infradead.org>; Fri, 28 Jan 2022 02:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=vQHl1kKziPP//RPPVFscaIeYrQPiD/BKe7PC4j8ax6c=;
 b=Fzv1T+rGFotkDidQaBLfjgeshzec1rdrJugreJ4E4ER511twVIjRsOWbmAmgAJhSjH
 soAr9SxHMN2Xd4icay0VOiQTdwpi3tz3SKBN/fxILgf7SD50gxPSUZraeQSsfgeQBO9V
 DcZ3rReVzhtCSf7rJ7QT7dWsvh8/pFCQroSXhYUEzn04XvlVonYA4PD+9GHrmRcD7krF
 ERhZuKgCrhUFpyQ6g7pNA5XYtNK6hYzhqRzujjb0YtEL9lqv9De3qaGgo2ya/1uWGHR2
 Zx+3EkM+VvtQ+Elu29Bzbqgp+vR1468RQhMEwCCIdI1c1c1JhN8qxFW2kYDS4nFmRwxp
 CE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=vQHl1kKziPP//RPPVFscaIeYrQPiD/BKe7PC4j8ax6c=;
 b=QDWSEswW7UlQTa7p53+N8af6M8qfGOHMkJ7gOCzXxhvg6uSA3PBpWtCPuOTcZ0hd6a
 XWZxqZAb16+5jSef3RasU81rn4DTWZG8mnlCq8PWuqvEFieEiwRcbhoeeKCyJAdP5IO7
 +ReagdCPCqA3F2EN+ByUkYWeOXucuZUlfMbcanXxVKFuu/KkAV03siyLWjEGZvinvieA
 TlMk+R0iZkMeDOAoDwT2J0iAsrkYrEGXHYVvmSqrcEByvGBR7ig6Q3L2W4iF1+R9ws7C
 AV/N5EsFAbXkWnz9m5As89tDOunZlpDrYUh1wFn4gvix9ZmOEwJQ/7lvOO2NSXpHt4zo
 XixQ==
X-Gm-Message-State: AOAM533CnILUhRVQmy1ns2M6/8nNP2SEW+A2oE9E3c21/oMxH0gO1NpL
 lD1xKBMKpmR4VzW977gIPFT+GpvGpnmy0Q==
X-Google-Smtp-Source: ABdhPJyVqxevH/KOBMCOHMp1EH4UYJ2z6Ysjjih/WI63AVmR57PKiAmJIQN3MQ9MQW35Da3EV7C4KA==
X-Received: by 2002:a7b:c350:: with SMTP id l16mr6542037wmj.146.1643364190814; 
 Fri, 28 Jan 2022 02:03:10 -0800 (PST)
Received: from localhost ([2a01:cb1a:7d:5d4:c222:c6fc:1de7:17bc])
 by smtp.gmail.com with ESMTPSA id e10sm5407686wrq.53.2022.01.28.02.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 02:03:10 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Marco Felsch
 <m.felsch@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Fengping Yu <fengping.yu@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, Fabien Parent
 <fparent@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 2/3] Input: mt6779-keypad - Add MediaTek keypad driver
In-Reply-To: <YfK4UcuCfF7JfI7H@smile.fi.intel.com>
References: <20220127111526.3716689-1-mkorpershoek@baylibre.com>
 <20220127111526.3716689-3-mkorpershoek@baylibre.com>
 <YfK4UcuCfF7JfI7H@smile.fi.intel.com>
Date: Fri, 28 Jan 2022 11:03:08 +0100
Message-ID: <87v8y4p483.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_020313_128455_D1F0F68C 
X-CRM114-Status: GOOD (  21.58  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 27, 2022 at 17:20, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Thu, Jan 27, 2022 at 12:15:25PM +0100, Mattijs Korpershoek wrote:
>> From: "fengping.yu" <fengping.yu@mediatek.com>
>> 
>> This patch adds matrix keypad support for Mediatek SoCs.
>
> Some comments which may be addressed now or in the follow-up patch(es).
> Up to you.
Hi Andy,
Thank you for your review and your suggestions.

>
> ...
>
>> +static const struct regmap_config mt6779_keypad_regmap_cfg = {
>> +	.reg_bits = 32,
>> +	.val_bits = 32,
>
>> +	.reg_stride = sizeof(u32),
>
> I'm wondering if we need this when we have reg_bits = 32 already.

Per my understanding, .reg_stride is mainly used to check for invalid register
addresses in regmap_{read,write}():

    if (!IS_ALIGNED(reg, map->reg_stride))
            return -EINVAL;

If .reg_stride is not set, regmap core will default it to 1.
It's not computed from reg_bits.

So I think we still need it.
>
>> +	.max_register = 36,
>> +};
>
> ...
>
>> +	regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
>> +		     (debounce * 32) & MTK_KPD_DEBOUNCE_MASK);
>
> I'm wondering if << 5 is more specific to show that the value
> is based on 2^5 units.

The datasheet I've seen states: "De-bounce time = KP_DEBOUNCE / 32ms"
But rewriting it as 1 << 5 seems reasonable as well:
regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
            (debounce * (1 << 5)) & MTK_KPD_DEBOUNCE_MASK);

I don't have any preference on this one.
If I have to send a v21, I will rewrite it using (1 << 5)

>
> ...
>
>> +	error = devm_add_action_or_reset(&pdev->dev, mt6779_keypad_clk_disable, keypad->clk);
>
> You have this long line...
>
>> +	error = devm_request_threaded_irq(&pdev->dev, irq,
>> +					  NULL, mt6779_keypad_irq_handler,
>> +					  IRQF_ONESHOT,
>> +					  MTK_KPD_NAME, keypad);
>
> ...at the same time you may reduce LOCs here...
Ack. will join lines to reduce LOCs if I have to send v21.
>
>> +	if (error) {
>> +		dev_err(&pdev->dev, "Failed to request IRQ#%d:%d\n",
>> +			irq, error);
>
> ...and here.
Ack. will join lines to reduce LOCs if I have to send v21.

>
>> +		return error;
>> +	}
>
> -- 
> With Best Regards,
> Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
