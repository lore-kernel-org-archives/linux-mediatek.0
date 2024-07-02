Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA36C30658
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jul 2024 17:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eMxjNF73xEehfmLmhKwg3pjkqI+cYmjdSdGZcjJzAQY=; b=rj35AJvFzpnYn/
	WivXfRGBfqB0vnVW7OT0dmCmJ3oJnpvPfnOKUHsJgzZ8hk4G/OGUdzB6QGLu/ti8eu151Ct9tFfoC
	6QQtkXRirJi3onvToSXM7Say9jelzkcrNFoPzQ9Mys/8mnbSd3NTBqZWIfgd5MK+2rC9OeIBHK0Xm
	HOZhCxx1ex8Ny0HAFQXZsP6U5gVpb6z31RGeJF561nKDqEjJpq+4qRbVW2sYNfAwJGHkIlZCUmCw4
	USGF0ahN2QJRWRncITe5G5tSwUvqV76b9mr9rlolyUllzcUNhiAGP3lujApDDKcVeoBSNs2yHLeu2
	Xadyfd/L5K+PMKE9I2jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOh7m-00000007UAu-2Etq;
	Tue, 02 Jul 2024 17:17:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOh7k-00000007U9d-1rGC
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jul 2024 17:17:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42565697036so33223575e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jul 2024 10:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719940617; x=1720545417; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eMxjNF73xEehfmLmhKwg3pjkqI+cYmjdSdGZcjJzAQY=;
        b=KeNa6LlEkKoWg7F7czR1dbc58n8NRsLk3Ri1lSdWne8nP1ShbzMw+DHFklbSPJu8x5
         xXI/p/PGc7i0n63S9kWzvRQHX5qSxRC6vUyQxnIXTZMfJO8VW12MR1m1mUa1wyeN05wf
         qd/NZeha8pjXVjUtHpHulok00jvnkRQJGJ7HPEfTK7+0zeEC6gG+zyQ3VMQfnpeElDSc
         u2c65fbxsPQIxByQI1EWCpxhViTWe4z1YkB40pLE6l6sV1cVOQSqFuvfRLehYA6aXRpR
         bgGnA+vzAGnRKYfQd4p5ooEX0w0tWc6NAKw5ykrw8yjCAnLef7InBjRC+YhPDfF1xpbq
         BbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719940617; x=1720545417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eMxjNF73xEehfmLmhKwg3pjkqI+cYmjdSdGZcjJzAQY=;
        b=S5NVdS/1ZX6eQsYhy5fhdfadyPnxUM4ZmwLZx12K6LmqeCOOCrmW5z/sxYffoeu11k
         o/4BRJy1RzluV84urr+U+yFIMgNelEJ2lah4910y2gSSx1hMP+AuT0zmtHa5RK3pzwaC
         1jOjdV3mTZYBNMP/YF6FYkIb6x8MAamxmH20ZSEibEEH0oSD13aUUfMsPtQMAMjooAae
         e65lDFHrcHK+9uaw76N1PxVFERRR6YAz3Yn1YvIKXx4ywEV504MdzXXs/RAuMS4jWXem
         50XuFdjL2RRubVmLtjGa5+qfvKSxLZQvDdIFq9dluUexHptT4zvAfZrv2Kj8yKIxtFhn
         nfzA==
X-Forwarded-Encrypted: i=1; AJvYcCVVa7AjlwAgwDc1N37rJUhxKKC+iMU9prJuljO2CiDv9a9wufFqNY0jGV38yD91iH4Lwu6owy/SJ0Wn+WI+5lXnYDOq3E5FWK7ngYpGUXw4rkzN
X-Gm-Message-State: AOJu0YzvBPWHBiWlDUxRFIpt0yacimoPNJAbLYMGoxQd8tm79KoKA7UD
	fMBob8aRfW+XZ0DaYGyOGWhueLzm0/HKoHpaUUdSeOSFaDuee9Oz+i2ylmDmU5g=
X-Google-Smtp-Source: AGHT+IHt/P0ua15wXj9zZu7YMLDV20uxy+PQFqpcA+vAHPimqKTS72Y/7YzGoy4cdhn7YTh0hbVksQ==
X-Received: by 2002:a5d:5983:0:b0:35f:314a:229c with SMTP id ffacd0b85a97d-36774f899ffmr9542381f8f.28.1719940617271;
        Tue, 02 Jul 2024 10:16:57 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36789fd7a0esm2004822f8f.104.2024.07.02.10.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 10:16:56 -0700 (PDT)
Message-ID: <7a198549-df42-4fb1-97cd-116e1bd96903@linaro.org>
Date: Tue, 2 Jul 2024 19:16:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Provide default
 calibration data
To: Chen-Yu Tsai <wenst@chromium.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240620092306.2352606-1-wenst@chromium.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240620092306.2352606-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_101700_671110_8AB7E924 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, linux-pm@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, Nicolas Pitre <npitre@baylibre.com>, linux-mediatek@lists.infradead.org, Julien Panis <jpanis@baylibre.com>, Balsam CHIHI <bchihi@baylibre.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 20/06/2024 11:23, Chen-Yu Tsai wrote:
> On some pre-production hardware, the SoCs do not contain calibration
> data for the thermal sensors. The downstream drivers provide default
> values that sort of work, instead of having the thermal sensors not
> work at all.
> 
> Port the default values to the upstream driver. These values are from
> the ChromeOS kernels, which sadly do not cover the MT7988.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


