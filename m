Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C05EC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Dec 2023 12:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xhsn3xQMJRBpqNaxhkufvdhrsoGP0x7afgw68pSy+Vk=; b=svtaGaKWny9OpqjPAFuAIY2Trp
	ikUOJmb7l0krT+ZlvfHs2w6VjnjDFr1Js4uCBILakbLLgKvAv7wL493fvaYqH552DNCJHMV5t5Lax
	ZAQwCBCOv8FygJRPUX7j2Rgx2RaXlueQE5kkKY45+Tl8MAreoJ5Z9xMkMKfW6xJWCZoKW1bBUZeDE
	BEuSlswxaX6IFdRp8hDxftf2wpR0QUKSvFi9RpPL1Uvosahe2RR9ImHAEfRebZ9kqX0ZnBqjESj5s
	gi+2Q1HgILiUO5d11MYjHPbrAV2boqSFDHm8019kj9QP+eVtwFgJssqWd5OI/lSyfT4vizLiZDZ64
	5doIpYow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDWg-00Cmxm-2A;
	Thu, 07 Dec 2023 12:30:46 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBDWd-00CmwY-05
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Dec 2023 12:30:44 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3334a701cbbso887235f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Dec 2023 04:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701952238; x=1702557038; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xhsn3xQMJRBpqNaxhkufvdhrsoGP0x7afgw68pSy+Vk=;
        b=ymYO6AQkPtW0gLmBPvkczW9hfAQQ/ARLbHXEoeK6Ha0SVzD0sI7BrOtZeqB7KFTJig
         gj55EtfmQAENf9ar+Nv541vaeKzqcQtog6D6qjvnITWO5nhZ89q2pguZC+jJo0HrpR8V
         mDUXvCuj7oNMXiMmqcrRedBvchilEyKiNMR4XJYl/D1Ni9GQgqavjvaZNwKdO4FonNA6
         wzWZiugg4Yri1QqIx5zyjHyfXiQgd6mDfxlc0TC6eI2BoUZbEZSxadPgZPJvWi2Yt1Vx
         lpy1TVn5IuShgoMwf5ff6DcGncfVHEYwwaVXBpsgsHXl8AqgCKnLyhkQ1qaG7AxALPuT
         LfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701952238; x=1702557038;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xhsn3xQMJRBpqNaxhkufvdhrsoGP0x7afgw68pSy+Vk=;
        b=PTKJXhlknxG2OfatpjyRJtUEXuFhzM7TqdFL8iP7cUMXCNKBEQOeznR75olk58JAD8
         b2r06Yi8rAZQhAj1prY6FEUZ0D/UCdCEKsaHtRVsAcTmVbI3Ut3AbmKodrITyvgTHw2E
         9DnTBwyo4E4s3WhmBymBzs7MubGoR+OwGWYOE/4vHW/eBTZT8A7QXEDkxCjP9IaGT7iR
         Dt1NFKsx0EgX8savymxLzfP0WeRhWGITYU7DJNrxlb6PNXH7Q8yrXSKX6HKN9euGsvTc
         7R9e9ZIpqsmLuM/cgiuRuOfPCfO7uPajNT1x4Sl06c94W4HnYEZxaIeprrBOvin1T7+E
         3elw==
X-Gm-Message-State: AOJu0YzdnhZnaY6WouBUtCcA1znbWS7uXFqUy4zbxqtFIdMaeGhnDKvs
	RbrmqSf9RJfu0diQCdgYkZozcw==
X-Google-Smtp-Source: AGHT+IHR93A1+XbSqEKL0Zq3OPwfawDHLkqfkbOHegUzDi+LE57mKz8KJf6kRcl2/+wYKxjcunAWrg==
X-Received: by 2002:a05:600c:46d1:b0:40c:305d:4af4 with SMTP id q17-20020a05600c46d100b0040c305d4af4mr8615wmo.179.1701952238100;
        Thu, 07 Dec 2023 04:30:38 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b0040c1c269264sm1818451wmq.40.2023.12.07.04.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 04:30:37 -0800 (PST)
Message-ID: <129e3a8b-5e91-424a-8ff8-b015d5175f1a@linaro.org>
Date: Thu, 7 Dec 2023 13:30:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: i2c: Add GC08A3 image sensor driver
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Zhi Mao <zhi.mao@mediatek.com>
Cc: mchehab@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shengnan.wang@mediatek.com,
 yaya.chang@mediatek.com, 10572168@qq.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, yunkec@chromium.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, jacopo.mondi@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, heiko@sntech.de, jernej.skrabec@gmail.com,
 macromorgan@hotmail.com, linus.walleij@linaro.org,
 laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
 tomi.valkeinen@ideasonboard.com, gerald.loacker@wolfvision.net,
 andy.shevchenko@gmail.com, bingbu.cao@intel.com,
 dan.scally@ideasonboard.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231207052016.25954-1-zhi.mao@mediatek.com>
 <20231207052016.25954-2-zhi.mao@mediatek.com>
 <ZXGtqwjYruBQVaUr@kekkonen.localdomain>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZXGtqwjYruBQVaUr@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_043043_066013_F51658B0 
X-CRM114-Status: UNSURE (   7.13  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 07/12/2023 12:34, Sakari Ailus wrote:
>> +	ret = gc08a3_parse_fwnode(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	gc08a3 = devm_kzalloc(dev, sizeof(*gc08a3), GFP_KERNEL);
>> +	if (!gc08a3)
>> +		return -ENOMEM;
>> +
>> +	gc08a3->dev = dev;
>> +
>> +	gc08a3->xclk = devm_clk_get(dev, NULL);
>> +	if (IS_ERR(gc08a3->xclk))
>> +		return dev_err_probe(dev, PTR_ERR(gc08a3->xclk),
>> +					 "failed to get xclk\n");
>> +
>> +	ret = clk_set_rate(gc08a3->xclk, GC08A3_DEFAULT_CLK_FREQ);
> 
> Please see:
> <URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html#devicetree>.


Oh, that's cool it was documented!

The canonical link would be:
https://www.kernel.org/doc/html/latest/driver-api/media/camera-sensor.html#devicetree



Best regards,
Krzysztof


