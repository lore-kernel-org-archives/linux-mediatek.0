Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF86C25B76
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 07:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kpT2U9u7A3J+3RZvunFCZzWlEPP+Dke4NuhjUNQlWk=; b=UxGuSvWJ2cT/PkwSX1ZHsc66lJ
	/qdjy6AV2YvksiJ+GRSqSHjKrJgb9T4pW/gSS6fDkGr/fP8u+b7Dv8aqrxzXEhpEbOkxUQbvl9YzM
	A1YNdKckXDXDRtlv5Txvg14NhRx+EQNAl3MZ5914rwBZbrdBK7IeyIvwrse80qSkHVJWWX4hRNjTo
	vgrENiRaRtoSNP6+n/L5L8kf2OeBZCDsiShqRa51HjrbiXmYDdEF0MvmJ/0EfClEMwG+L6KjPsYqd
	bTyIkBV9zVpWlXkUjrue5a6FBMqU014ecCKsgB4L4/Y3g7gOrLbz3oshUOEOxIO00rkSGqxZRH4tF
	Bwop2o2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2ae-0000000FyXh-18mH;
	Mon, 03 Jun 2024 07:58:48 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2ab-0000000FyWh-0QOP
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Jun 2024 07:58:47 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42134bb9735so16171785e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Jun 2024 00:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717401522; x=1718006322; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6kpT2U9u7A3J+3RZvunFCZzWlEPP+Dke4NuhjUNQlWk=;
        b=cKTKhEgoQGzV12nxAfeR2A1bMzetfgRJBHNcmAgICwJt7Q4/F+CXeCPXfe5bvRseBJ
         ydlJu2+2x4PI7WqaaRD7acC+dMgsaqH0MPvrce9shRNY5p9D1N1JeDQmDvLAGr/U464s
         DkvxD19IWg1P8TU5k6ya53NXA9cLk5l6pbOviBMhMhuX81aC4/0LI+QNI1d/HD+ImMVR
         pM6eYxqIc+Df+0wds0xze4nK6y1awL96qUqs+uUGn/AJ4FIjAEC8oSoI0bF0xFE2Gfx1
         HaMPIxQsvAKM5ZEw2EhruZPL164beVQspx4VWLanf7Tflv+bo16eju7vh51vhhsVS5Hu
         abLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717401522; x=1718006322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6kpT2U9u7A3J+3RZvunFCZzWlEPP+Dke4NuhjUNQlWk=;
        b=DwKl5P1CWPU2fFxF0pquuimAtWJekkEKtIEnd7K+JyTn4OKUlmhbd4R9VIv/Fe+mxR
         4TXkTuiN9HF368HfBEuh6XanEJXHF00mpUEE7T/SDtuYSAku1ErAmcnoUcWvw5rxVwuv
         HMt0xOmo5XnwDZt8i1jX7CRC8O+w7pMr/ol5awT7lIVXtvxZufs8E2CepCz6/iQFMDEG
         E7ShwVZTH0Pp0nzxPUXe6dcJxHSCz3+RfLmKb/Pb5EEfK/vQLAosCwz+PIoRiaEJ9kZI
         ys33Ky8+E8w642rHlRhDy/Mc3dO4hjxgxKfp2Xo/ujiG1jGBlIN207w2cufO6ArevV1h
         XY0g==
X-Forwarded-Encrypted: i=1; AJvYcCVuqvVsKNCZYdnKECQkFxQpgjh5Ls3q3YlYjSX/7MsBn+9d+w0MMgq2f0zXq83jWJh98oIGct3mIQ+vLij6cgVmHzfKXBrwpSFhuWRraCHXgb8q
X-Gm-Message-State: AOJu0YzS/BVVX/wDyclE9/o3OdEPg8zLW5p1naZXs7mcewvR2zlASk27
	OKim5Yx2A7HxGKY1qxqAZ5yl3oIecvID9lk6t9K6D4QMuHSyTcLHrZHm8XY7zzk=
X-Google-Smtp-Source: AGHT+IG8BZtVsXsEGPvAsZNEuv10PYEJJ90ijcMu5Alhgovv1Icm+OT1OTewd6+DuvM0JPwdDW9vuQ==
X-Received: by 2002:a05:600c:3c98:b0:41f:3ee0:a302 with SMTP id 5b1f17b1804b1-4212e0ae746mr68261095e9.30.1717401521650;
        Mon, 03 Jun 2024 00:58:41 -0700 (PDT)
Received: from [192.168.1.70] ([84.102.31.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212f0f9660sm97225405e9.39.2024.06.03.00.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 00:58:41 -0700 (PDT)
Message-ID: <940eec49-91d8-4d38-a3d8-e1b7e090b905@baylibre.com>
Date: Mon, 3 Jun 2024 09:58:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] arm64: dts: mediatek: mt8186: add default thermal
 zones
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Nicolas Pitre <npitre@baylibre.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20240529-mtk-thermal-mt818x-dtsi-v6-0-0c71478a9c37@baylibre.com>
 <20240529-mtk-thermal-mt818x-dtsi-v6-4-0c71478a9c37@baylibre.com>
 <75826085-fd59-466a-b1de-b4c323c801c1@collabora.com>
 <CAGXv+5FPG4ob3mTU0Utm8Wgk0_ZLw=NLPbfFerWh4OUeAz7UHw@mail.gmail.com>
 <808db317-4cee-426b-a840-013a5e03098d@baylibre.com>
 <ad047631-16b8-42ce-8a8d-1429e6af4517@collabora.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <ad047631-16b8-42ce-8a8d-1429e6af4517@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_005845_243593_67DA19F9 
X-CRM114-Status: GOOD (  28.05  )
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

On 5/29/24 14:06, AngeloGioacchino Del Regno wrote:
> Il 29/05/24 11:12, Julien Panis ha scritto:
>> On 5/29/24 10:33, Chen-Yu Tsai wrote:
>>> On Wed, May 29, 2024 at 4:17 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>> Il 29/05/24 07:57, Julien Panis ha scritto:
>>>>> From: Nicolas Pitre <npitre@baylibre.com>
>>>>>
>>>>> Inspired by the vendor kernel but adapted to the upstream thermal
>>>>> driver version.
>>>>>
>>>>> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
>>>>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
>>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> I'm getting some crazy readings which would cause the machine to
>>> immediately shutdown during boot. Anyone else see this? Or maybe
>>> my device has bad calibration data?
>>>
>>> gpu_thermal-virtual-0
>>> Adapter: Virtual device
>>> temp1:       +229.7 C
>>>
>>> nna_thermal-virtual-0
>>> Adapter: Virtual device
>>> temp1:       +229.7 C
>>>
>>> cpu_big0_thermal-virtual-0
>>> Adapter: Virtual device
>>> temp1:         -7.2 C
>>>
>>> cpu_little2_thermal-virtual-0
>>> Adapter: Virtual device
>>> temp1:       +157.2 C
>>>
>>> cpu_little0_thermal-virtual-0
>>> Adapter: Virtual device
>>> temp1:       -277.1 C
>>>
>>> adsp_thermal-virtual-0
>>> Adapter: Virtual device
>>> temp1:       +229.7 C
>>>
>>> cpu_big1_thermal-virtual-0
>>> Adapter: Virtual device
>>> temp1:       +229.7 C
>>>
>>> cam_thermal-virtual-0
>>> Adapter: Virtual device
>>> temp1:        +45.4 C
>>>
>>> cpu_little1_thermal-virtual-0
>>> Adapter: Virtual device
>>> temp1:       -241.8 C
>>
>> It's likely that your device has bad calibration data indeed. We observed the same
>> behavior on the mt8186 device we used (a Corsola) and finally realized that the
>> golden temperature was 0 (device not properly calibrated).
>>
>> To make a comparison, we run chromiumos v5.15 and dmesg output was:
>> 'This sample is not calibrated, fake !!'
>> Additional debugging revealed that the golden temp was actually 0. As a result,
>> chromiumos v5.15 does not use the calibration data. It uses some default values
>> instead. That's why you can observe good temperatures with chromiumos v5.15
>> even with a device that is not calibrated.
>>
>> This feature is not implemented in the driver upstream, so you need a device
>> properly calibrated to get good temperatures with it. When we forced this
>> driver using the default values used by chromiumos v5.15 instead of real calib
>> data (temporarily, just for testing), the temperatures were good.
>>
>> Please make sure your device is properly calibrated: 0 < golden temp < 62.
>>
>
> Wait wait wait wait.
>
> What's up with that calibration data stuff?
>
> If there's any device that cannot use the calibration data, we need a way to
> recognize whether the provided data (read from efuse, of course) is valid,
> otherwise we're creating an important regression here.
>
> "This device is unlucky" is not a good reason to have this kind of regression.
>
> Since - as far as I understand - downstream can recognize that, upstream should
> do the same.
> I'd be okay with refusing to even probe this driver on such devices for the
> moment being, as those are things that could be eventually handled on a second
> part series, even though I would prefer a kind of on-the-fly calibration or
> anyway something that would still make the unlucky ones to actually have good
> readings *right now*.
>
> Though, the fact that you assert that you observed this behavior on one of your
> devices and *still decided to send that upstream* is, in my opinion, unacceptable.
>
> Regards,
> Angelo

I've been trying to find some more information about the criteria
"device calibrated VS device not calibrated" because there's a
confusing comment in downstream code (the comment does not
match what I observe on my device). I'll send a separate patch
to add this feature over the next few days, when I get additional
information from MTK about this criteria.

