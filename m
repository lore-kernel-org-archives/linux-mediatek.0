Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDADC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 09:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHvebLwHuRfKrhRhx4zUZc+osrZ3cO5ITZcXKlhy5f4=; b=yk0i8lBECUUMnuNAZ5XWWR0sfj
	DjRGo/g8Moe+X3Q5r92VgcJZh++cpoC9Fj3XR9qFJRH80TVZgs830PRC5C/HOA2qO/5JN8aL4zJFo
	UrL2WsEgH2Z3lYMYKvUa+ZivAKot6pH85n+YJGTtiOQzfNmCJ1qvVF6SpE1qDRStI//vZHsjC5Kw4
	OKzi2B/kU5DghV77KRkpMqEY8pPfWeZtLMu88ImYSNeB0kmuGoe7mZHfkRoPzF4GPkYZvxvEca9EY
	WZSS6wNIihHzbgkscIPtaQQuIQCWyWTviVoIKHcDNMgIhpXTf6WTHAw4/Hx0C7zrjRju+R1O8nR6e
	rafC/zOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUkmt-0000000G2Kc-0s35;
	Tue, 30 Jan 2024 09:52:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUkmr-0000000G2JS-2ROm
	for linux-mediatek@bombadil.infradead.org;
	Tue, 30 Jan 2024 09:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UHvebLwHuRfKrhRhx4zUZc+osrZ3cO5ITZcXKlhy5f4=; b=NBOkQV56Z6faEm6jMRpGUeO4yr
	O3Dp7DQhv0dJoIHB+9b4i0CpfCuI6vh0aJ3GHvIrYq3dTDepdnEctcmCmJep5spG0hkoAyhaytl+M
	MJbCeB3WHXFYnF8AfLuRtZ1zZvdBZ5OHVVjbmmUP/oGCx2DRuSgxOlUqP0VrN2mNpRVoBmy51qfrk
	SxEFi05PRwHJap5kssq6A7CC2/jFYGljxNrwBg+0KH/i2QntDaZF3XniN59xwwsXtMfA+v9RxgeBt
	jnIZB5OBw3Q5flb7IOTf9jcDowft0vWobM46hxHungSpEmiFAwVXnmv9CfKZ3OFt/Q66VvLOv0vdp
	YdAb4ckA==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUkme-00000008G2f-4AnK
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jan 2024 09:52:08 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40eb033c1b0so42408065e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jan 2024 01:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706608314; x=1707213114; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UHvebLwHuRfKrhRhx4zUZc+osrZ3cO5ITZcXKlhy5f4=;
        b=krVxyB6Cs4f8QXn+rOuB5YPg91okKJaHBqSrS/hHSfp/JvoDCdb5wmEtaBGUHSgZMZ
         GZfK+a5rGHRGQv8Xn2+7e/p+mt/5AX74u1lGsvv5KIseeIPX4Ld0OHkYiLDbvu4DTQ5j
         FPw+11K0XKBHwY2dxKrxG8JcTc7KS+KnFX66JrCevv3Enw7KcoQhxgDkM2eSPaCpECwM
         Hb8FXbxSZr3Yd6f0d4oFwZ1CypGfEP5ZFDiiesUJrnUFVqh4foQrt9HHcqQNeSzSPxHD
         qKCfTwjXxl59OpMdlN3b3YPfYxWOaWp7WNP5al9AgWKy+F6+2kSMDt02xruKnxQaij80
         007A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706608314; x=1707213114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UHvebLwHuRfKrhRhx4zUZc+osrZ3cO5ITZcXKlhy5f4=;
        b=R0cH3fspGgTz2a1lNTMBRbymd6sEnDALnDwKi71Ijfxd1AoMRbs5BYJPCJWGOzlTl/
         BBSWJX2selQgYMrjfchlCNefy+CM9pAfZvjl09D4ffPwLf2L2coh7dUNoTYL4QtsNR9b
         J3J1ItLBB2dQ11qjx2LK35OYmj8+kKTPlMRwp2zbGa2EROJldnn3WCaxVADa03//pthY
         QpbZXF1NF2HStJD7Ult8G0Q+6HmqZhyA8x6j5UGiFhs2j87zP8gKqCvwD3Lcnm9y68uH
         wWhM3yniuFzPxMkLQdaMVgo+q1pHVtK2s0fyHwVzq2HfYx4fMnEi4AHA6Az8PqABrttS
         QeIw==
X-Gm-Message-State: AOJu0YxPyo/mIQ7AuMVtUtGnEE7ffJwYwVyUDkA9S9WY1/8AVsHMWq48
	wIQSlWq4m6reTpohFzcj+Oc7ClFW/KzEZlfWpphhUVR/6faUr1wSZHd3o59iwBg=
X-Google-Smtp-Source: AGHT+IF38u7/UMq2Ehe06B1hdRlnUG7cUccj6aYmXDUSxOCpUZXxCEPO+lNn+j1151l0KXe8fxwwHw==
X-Received: by 2002:a05:600c:4d96:b0:40e:d319:4792 with SMTP id v22-20020a05600c4d9600b0040ed3194792mr6064680wmp.22.1706608314364;
        Tue, 30 Jan 2024 01:51:54 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id u7-20020a05600c138700b0040d8ff79fd8sm12646748wmf.7.2024.01.30.01.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 01:51:54 -0800 (PST)
Message-ID: <57a5ca95-9d79-45cb-89dd-fa7a3a6ad228@linaro.org>
Date: Tue, 30 Jan 2024 10:51:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Fix a memory leak
 in an error handling path
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Balsam CHIHI <bchihi@baylibre.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <481d345233862d58c3c305855a93d0dbc2bbae7e.1706431063.git.christophe.jaillet@wanadoo.fr>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <481d345233862d58c3c305855a93d0dbc2bbae7e.1706431063.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_095205_737767_E494E0B3 
X-CRM114-Status: UNSURE (   7.47  )
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

On 28/01/2024 09:38, Christophe JAILLET wrote:
> If devm_krealloc() fails, then 'efuse' is leaking.
> So free it to avoid a leak.
> 
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


