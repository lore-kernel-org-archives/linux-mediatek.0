Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964A9C02183
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2025 19:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWXRGYqIYfAFCWYGR5cc8ElnhXv1e/ZNViY5lKk/9zc=; b=ZukI/VPSkEDUTjM53nRLUpcoZo
	kzWABR2h/FLyRg7u/7sfQ9hE2YeIkSKV4RqwKwFTUyNBcIwGKr9JTgwy9UTqALPlj9fz//vMnPHT8
	RO4Kjqxr1+2aJh+mdrKGEdoT5cZRdpNtceznS0dKfsMlMmtaUIvdGCsVx/Z84ChVOLAVoz0e0eK6s
	b53OlDlL9w8CLJ94juptPFAnrwQxqDSGdOxXTY4varwREdiOq5TZIomQmlQ+V6wvy/GMknEtTF9e3
	1/QbuSCC1y+ayLQsCVMCx9OPVRGM8BP73t6YvBmCjLAW7H7zfb5jg80BUF/96a7lejRdH00OE2IEU
	bPS0MdOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmsp-00000009ZgH-1k3b;
	Tue, 14 Jan 2025 19:47:27 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlgQ-00000009Qi1-3v5Z
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jan 2025 18:30:36 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43624b2d453so61388185e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Jan 2025 10:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736879433; x=1737484233; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xWXRGYqIYfAFCWYGR5cc8ElnhXv1e/ZNViY5lKk/9zc=;
        b=h4OpJ0QwtJJ3RufE41qQ9KZWn0oy+T7Wsu5BGSjBWI69s/W8w6UrIbc63idhERcqhy
         bulctRsqu4PxnOP1eMlgJwMUOndnmHraeEqCa5LOwk8W5ENttCEzERGmdL2IYnesNuJf
         iOC2xwChcbRGtm2i+AKjKX1LiMdH5L3IrxYTzEROizm7yHzMnC/ohVnnAh/wHwY0wxAv
         FdUwmYWY0CNSo37uP4TvjRkoBMKYZ2Hh1fPtmdtgxYrDDowg4TwWEfPvjqMJJIMaDwuB
         Y/zykrE1AO/iCCCnOTrmScOjs1C3pbi0wY4RSbITCQdeYH3zZxr8uIjmMQuiV9gLHxk6
         OfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736879433; x=1737484233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xWXRGYqIYfAFCWYGR5cc8ElnhXv1e/ZNViY5lKk/9zc=;
        b=kzWhLwaWGGsjSqGJb1gGANlJncHOdSCr2MrVKYxyqL6Xss4+1MMjuch0njdJ4R1pwz
         0Rh0nD8D7VNEKr8EDz3zqD1F8+KZsgW7XXWJG3vPs5L/nK1cIHGQEJRWw1fYRzOXFPoZ
         8BEm8URBWIDtPq0HYg9xbU/3LzfsAQpZyR1YBtgxAIhBocrQ1xhHc1aRbjiOvpleh0Zb
         3rPR5GgSrKt7wEbzSaU2XLlsmaJqrdK2oPezPXo1KePbdoxWJ9ri3PjA2z6ovP3G+/DN
         LJ4BUs/7yVZ618NT8mKowGbNxtHlEXUThGVss2QDQsvFxEnWiR2nS7SRzYffmGqcHCe4
         cbFw==
X-Forwarded-Encrypted: i=1; AJvYcCXWx+KeWET2ME0t2NzZPAtLaZJn8CN/ZHlwRGKU7YbImJ9eqsxJrSldCDBxB3/vzeHh3xDqTtUTCUJYckcNDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6zrWCyu3pjq3c/6w4LVTBJNZJmGbKtO3tQRrM7gH8pRCIrJvC
	NZXl/pNn2Ppv3bvmFZLfcYOC/CxJmldz6gnldxCcndQYg6hT8KJ1+EJ+jOZP4sM=
X-Gm-Gg: ASbGncvx40TwhG2Atlcb/cyzuihtb5n8Dmvt7c51A9jy/Pr8/HCcKKN8TsdB0Rbsvaa
	7a9bsm195SOEXRsqy74pODY50/SPEk4IDKQkxvdNkj9p7Yo8Ol6X26GGs6+7JUzGwwMzzLVqtvl
	ErGZYH4T2ovhXF8cKUCDImSbAmWf3EqXPM77r4+m0Qkt9yaS2Kzil5xG/JbcaXA8TQPYOFaHkpm
	rJ7cabHWFQakmeXKA+RMctQuxGNDy2S4t7bG3zLkht6hhcs2ws+/kQSIdBTt5XtF/S+5OX8QTB9
	17pTlLI6jh6IvlUX3n5A
X-Google-Smtp-Source: AGHT+IEw8eHOips+m7BEL7pSk31Buqsgjf/0/YmNKYluWgMpJRjDHqhoLciiG4fuvyVDzaS9gJVk8A==
X-Received: by 2002:a05:600c:46d2:b0:434:a1d3:a321 with SMTP id 5b1f17b1804b1-436e2679db4mr237168165e9.3.1736879433323;
        Tue, 14 Jan 2025 10:30:33 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e2e8bea5sm217789155e9.31.2025.01.14.10.30.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 10:30:32 -0800 (PST)
Message-ID: <90dd8d93-5653-47f1-8435-f03502e4c0cc@linaro.org>
Date: Tue, 14 Jan 2025 19:30:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 3/5] thermal/drivers/mediatek/lvts: Disable low
 offset IRQ for minimum threshold
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Balsam CHIHI <bchihi@baylibre.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bero@baylibre.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 stable@vger.kernel.org
References: <20250113-mt8192-lvts-filtered-suspend-fix-v2-0-07a25200c7c6@collabora.com>
 <20250113-mt8192-lvts-filtered-suspend-fix-v2-3-07a25200c7c6@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250113-mt8192-lvts-filtered-suspend-fix-v2-3-07a25200c7c6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_103034_980454_F98EB534 
X-CRM114-Status: GOOD (  11.27  )
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

On 13/01/2025 14:27, Nícolas F. R. A. Prado wrote:
> In order to get working interrupts, a low offset value needs to be
> configured. The minimum value for it is 20 Celsius, which is what is
> configured when there's no lower thermal trip (ie the thermal core
> passes -INT_MAX as low trip temperature). However, when the temperature
> gets that low and fluctuates around that value it causes an interrupt
> storm.

Is it really about an irq storm or about having a temperature threshold 
set close to the ambiant temperature. So leading to unnecessary wakeups 
as there is need for mitigation ?

> Prevent that interrupt storm by not enabling the low offset interrupt if
> the low threshold is the minimum one.

The case where the high threshold is the INT_MAX should be handled too. 
The system may have configured a thermal zone without critical trip 
points, so setting the next upper threshold will program the register 
with INT_MAX. I guess it is an undefined behavior in this case, right ?


> Cc: stable@vger.kernel.org

[ ... ]


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

