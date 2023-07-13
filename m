Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2842DEB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jul 2023 09:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dU5KDiUEXkqyxb1dz2x3HHUapbhudnVUKqik8C6tDVE=; b=t1hW7bc3T+TpBB/7DiKEV+aK+D
	T08WKCb8vzYvwPxcm2QXiyN0p0BHG5WZAMu3kL2vy03lzlK7VcTZFZuBbEmyyHCRDqmLVhyQaRQ5L
	w6ChJGPrjg88ayvaKsl8FDa30oZhw12mv3IKwuX7xuy/IENzAn7qQpNdnbm2V6TTE/3GEeON0sXql
	zILjyq4abXERvADdMYg+dg9r7JyhJmQAalFIK2XhGPuUGQl6d5l9SwhGnztHrfrWmU2jR3APvAxMd
	X0+5X7V/xYzzZs/g7sQBBd0Oi11JcGwljifUSLqOLJPWgvqGzuP3MFiyhzjVLABU33Ary12rE9Tal
	aaVxyrUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsFf-002YXR-1m;
	Thu, 13 Jul 2023 09:04:43 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsFc-002YWN-13
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jul 2023 09:04:41 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbab0d0b88so10556635e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Jul 2023 02:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689239078; x=1691831078;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dU5KDiUEXkqyxb1dz2x3HHUapbhudnVUKqik8C6tDVE=;
        b=dBd1WsIUF22756YKeYlcfQiSg5UUZ2nn+zJ4H3l3KTqOJl7Sr01C28kmD2ZhSs1dGh
         boEnVOOrZ728+wluWVHunLyVWEdfGyUzceI+ObwQrPKv+a0Jc+r+7MUe/htY9+ovc3+X
         awlZkv51RfM9NJWEiPe5iZl4RydZWvoWOeciRVJEuUz+XYROd5E//KRl9sI4mZrgrx53
         KubgJEYQ7IghTzGezX406O7ROHs8ZK5L6/NZEIEavLb05mDLfDFYSr6EeFed8q0m+odF
         qibIRMfQanAGk6O+UbXNX8EVkREtFxRfwSeRBw9iluB5wshx/YneefAfpiY8YXQt7G6M
         KVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689239078; x=1691831078;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dU5KDiUEXkqyxb1dz2x3HHUapbhudnVUKqik8C6tDVE=;
        b=VPXREHIT24NLZJi/kB4O+UnVQTUvHibdaKQCJT0GSE/hBpqFL5W3MfRJEOwUBYx6Kg
         pTsd2JJdAV67PyA+WY8ga4H2TugMAFWB4iBmOW44vAIFKvZQftylg7rWmAkNLCQbl/fz
         EUrMgO0VePPdFt3KKp0KVlvFm2K5UCI67aM7fdjtiEOeLuceVU6ExFzmJ9v8fJIdE5IQ
         0eFIEgPXw6iqaGHGbhZUAcQsEHIDJbk6tx5Ub0mya8FRlRfcZftO6TkQ3LvbKjoIwDw6
         mFPDb/cvza1MNNWQZbcgUOITd4mEPc/hWPiQo9tSCYeHT+lsn5c92BQ3VIY2LCEu5LVC
         lnwg==
X-Gm-Message-State: ABy/qLZWdZLgV/gq7z38vuxiEsaY4TM12YA0Wb9DWTSjq9tFH76ck+n0
	taN3kkKfIo8YB4pwuhqrOejEEg==
X-Google-Smtp-Source: APBJJlHa7eA3YGzLEKLvvgvkWg8/+bqmncsrH8kSNAoE1KnD5WGcimF+bQJ6Yl3CogySwfzwhjQmbQ==
X-Received: by 2002:adf:d0c3:0:b0:314:323b:9d3b with SMTP id z3-20020adfd0c3000000b00314323b9d3bmr3684448wrh.32.1689239077829;
        Thu, 13 Jul 2023 02:04:37 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id q14-20020a1cf30e000000b003fbb25da65bsm7235763wmq.30.2023.07.13.02.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 02:04:37 -0700 (PDT)
Message-ID: <58acd4bd-8694-9bdc-0e61-400120d8c14e@linaro.org>
Date: Thu, 13 Jul 2023 11:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 0/6] thermal/drivers/mediatek/lvts_thermal: Fixes to
 the interrupt handling
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Alexandre Bailon <abailon@baylibre.com>,
 Balsam CHIHI <bchihi@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Alexandre Mergnat
 <amergnat@baylibre.com>, kernel@collabora.com,
 Amit Kucheria <amitk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230706153823.201943-1-nfraprado@collabora.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230706153823.201943-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_020440_396407_9B5FE6A4 
X-CRM114-Status: GOOD (  10.20  )
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

On 06/07/2023 17:37, Nícolas F. R. A. Prado wrote:
> 
> This series fixes interrupt handling in the LVTS thermal driver. It not
> only solves the interrupt storms currently happening, but also allows
> the temperature monitoring interrupts to trigger when the thermal trip
> temperature is reached.
> 
> This series was tested together with the MT8192 support series [1] on
> the Spherion Chromebook (mt8192-asurada-spherion).
> 
> These are standalone fixes and don't depend on anything else.
> 
> [1] https://lore.kernel.org/all/20230530195132.2286163-1-bero@baylibre.com

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


