Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8407AC001DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Aug 2023 11:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wq6rCNtRJuWHJjaVoPantiU5p6m/bCS3GxWdOo6VotM=; b=XE7bQbDhTCBFZYx3v7f66p9/2L
	6JH6ddJX2rB+VW9+hrzJ6GZgmU1jI8O49HSZOTOvOzet7ru80K0aZNLJ24Awb9HkkhRnSQn3c0t+Z
	nD4lmamLImbvjUjZ/xSLN+YbY4iHWLKpazx787o9bMV8Wz/fKAM78tg+rACEz2BY+HRkiU5yCM1uR
	OJ8/A1mOTdOst6cOoau8gWNdz4hx0CLfQCzbkRkDOp8Lg0xb36wJUSjK8h8XQSXmCOCiQsa+Xtgn1
	JtV4eK1yuv4dLE3rw5tqBFkj2kGTRZzDpmVUwn0///U2wTFxRGG+yFmEMhYLU9mmfk2E1qP0vlBfz
	iW+tflfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUPtc-00AMQF-37;
	Fri, 11 Aug 2023 11:01:32 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUPtY-00AMOr-3A
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Aug 2023 11:01:31 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31781e15a0cso1664690f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 11 Aug 2023 04:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691751687; x=1692356487;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wq6rCNtRJuWHJjaVoPantiU5p6m/bCS3GxWdOo6VotM=;
        b=fdbZuOBtDpR54KoDZ7bjXOJyX1+vsRS26SItSnfpB482DRIBUsLZ3mPHwyiEuQIQZM
         d1r5PMnDYa60o2XN4r1tFjr+x86Hv28rsRYY9orAdiJBzjDtySjZuJlmCsEFfTXBiMTr
         fkgcAZtBywl66q8uOAlR+6r73wLzRYzLoLlco7eIxi3Mb+7gHniBllIY/PoNX8Z71+yD
         j4t+NialtrbOUxN5Zw+dTzP/Bhq41FgY+LUotEyAqGCc6Gb1P843EkVyPrEqMo1P5061
         n8YgSLlsEANtlasIV+/H7vVpnPwQsBSUKZjh162bYI5CJURFG0eMi4zFhyF9PygEqE+R
         ow2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691751687; x=1692356487;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wq6rCNtRJuWHJjaVoPantiU5p6m/bCS3GxWdOo6VotM=;
        b=WEU7QkRcddrtPAAFWR55qejlJTKIK4rVzoWr4dkXN4cpLA9NJqiUkTnWJbDSBcFdrq
         PDZtDafoznk0HASqvF6Wvjj2LN0D8GVcA1t89paIWUveBuDXcQyJPMfcc+zHfaHXa5/u
         wLM3enJNfgAAn+2p+pre3DQkCUebMmR0hTI1MQv2LTYpPtWwzo+2ltz9//esG6bacc3d
         WDwexa1OrnKvNJ1gWvti/z+7QPVfoq30U49P/hR48tWPj/aZeZfxRkib9nDf4bV8aeXb
         nQE6BJ5IizZX/qYPzBKNelz8AcMUMFa+gakpC6jOwFQoVwf+8E4EJ9176YuwSLUdsqND
         hziw==
X-Gm-Message-State: AOJu0Yz1Lw+g0wxQE05y2fXKp4T5nDGoZeV/XNGy4iyJfZtNnSz9WvtO
	GYVegLIMRXexgs5upZ0z8Af2FA==
X-Google-Smtp-Source: AGHT+IFN6FIrAF8uUc/LBfkNlUB+1kXQV2At2Htm2rDvexqs7oWO5TreHNx76NdUio/+JzgV86S0lA==
X-Received: by 2002:a05:6000:100d:b0:314:475:bc47 with SMTP id a13-20020a056000100d00b003140475bc47mr1031035wrx.69.1691751686187;
        Fri, 11 Aug 2023 04:01:26 -0700 (PDT)
Received: from [192.168.3.194] ([89.226.188.33])
        by smtp.gmail.com with ESMTPSA id d2-20020a5d6dc2000000b00317f70240afsm5063042wrz.27.2023.08.11.04.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Aug 2023 04:01:25 -0700 (PDT)
Message-ID: <9db9f842-fcbe-77e0-4b7f-0f5c26a1db51@baylibre.com>
Date: Fri, 11 Aug 2023 13:01:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] thermal/drivers/mediatek/lvts_thermal: Make readings
 valid in filtered mode
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?=
 <bero@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 Balsam CHIHI <bchihi@baylibre.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Yangtao Li <frank.li@vivo.com>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230713154743.611870-1-nfraprado@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230713154743.611870-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_040129_236975_B357CBD3 
X-CRM114-Status: GOOD (  13.44  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 13/07/2023 17:42, Nícolas F. R. A. Prado wrote:
> Currently, when a controller is configured to use filtered mode, thermal
> readings are valid only about 30% of the time.
> 
> Upon testing, it was noticed that lowering any of the interval settings
> resulted in an improved rate of valid data. The same was observed when
> decreasing the number of samples for each sensor (which also results in
> quicker measurements).
> 
> Retrying the read with a timeout longer than the time it takes to
> resample (about 344us with these settings and 4 sensors) also improves
> the rate.
> 
> Lower all timing settings to the minimum, configure the filtering to
> single sample, and poll the measurement register for at least one period
> to improve the data validity on filtered mode.  With these changes in
> place, out of 100000 reads, a single one failed, ie 99.999% of the data
> was valid.

-- 
Regards,
Alexandre

