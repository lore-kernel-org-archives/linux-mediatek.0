Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B7BBCD80BD
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 12:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ctxSL5NHuvqBM6PtJ7e7K+XdAt+ChzjxPiXwTE9IU1w=; b=WiKu5YVy+j6NmS0sBSaMcAJADR
	Nt0U66N6gIV2mxy18UXB/W8QVJE0r0alWC2WYOkPPQ9A7rnYR180aFA1DOB+8KmWena99J1sh1bG9
	xA9mD5uqCuug3RQIG28I6egGo7rVOGtyaJaXtOBkz9hbCbtdT2H8dcECTWVni86rZcIBCTO3PA3me
	9PtIHByPVyfr++fNS4DGdTJz7c7Kptna3vj7ZjOr1ZyjHaMiF9lN7tU6o0OzFwEQmuuioQMJ0cJnF
	YOfIfiADKseuhN32pboJHPQw0GOEI8Pej9wflwSWNv2KZTkEHUK4+zisTP4TJHN3nXRb5vF5MXLzw
	VXtgxi/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqBwe-00DLzq-2h;
	Tue, 10 Oct 2023 12:34:40 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqBwd-00DLz2-0c
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Oct 2023 12:34:40 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9ae75ece209so1015367066b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Oct 2023 05:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696941278; x=1697546078; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ctxSL5NHuvqBM6PtJ7e7K+XdAt+ChzjxPiXwTE9IU1w=;
        b=zdy9GKGGWMNrAi1thesuj+vXqwJW5+s+llc2LwoaXpBuTTJX3LwUsYLswQ6LyE8MFs
         V+UAcSGeKwr3KaiMqISv6fovbxVu+lx8gsxWvHXM5kVsZ82HeYLQl2JFGbMgGPJLPtua
         sIVuk2sITGiMYQ3UjXhk51hM3z76mSyaTMBgrmHKi8ml6+2H5YNUNlw7d/vMxg/vyjrf
         HX7I7n5XxII5dWItJ+xVvKixvm4bYUApUGkm6u/sKeqFTObcBCDHLR5DI/cYpEgGXiUJ
         Rb1+HzVTSLESy8Dnm/K6GbQzvXzdHNcDTHRTyeYnUZ90010511UY3dVekFcWhmL1Umek
         GFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696941278; x=1697546078;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ctxSL5NHuvqBM6PtJ7e7K+XdAt+ChzjxPiXwTE9IU1w=;
        b=iOGSK0IIuJlROqaSgIOwIqMChgDVLPUXGLPDx8Z+lU0e0RT8ojCm+wKDd2EKZJX3Mh
         N1bXKHdIUJSvz2wKby80YUTFL+USvs/GWm6T7IuSVxyg3utHjRlS1DPPESYBSBScB/eE
         OZRrvCdkUjyd0MLRERqL3MrLxjFO/RK1VHgT4l1DV8ONwp5EknfKcYlcvOqHK7nel9z6
         vRKZ7peoUpp0NBANTg/un4wwm25T8/5HFDG44CgRDJt8UEJfYaMmOYJyACL8IvEtvm5T
         /osbAkGT86v7uGvSSa+b7dWhMKEAyDo/B1G67pdKNLfaeAWD9ODdKGcm5QDxRNTiGpXG
         hMQg==
X-Gm-Message-State: AOJu0Yyvrx0Zy8rgtPwO5LH3z/KrKi0pNXC5oaj5+Yhdysl+ZXBoYTQ4
	SC/fSD2XmAM2/lC7XJDqYYdTKg==
X-Google-Smtp-Source: AGHT+IFNzIdVmK0dxW9clCRZ8qa+lFvSfLd3+EmkUWyp763Qj8lwGzsRCnf2oKn9izNfzMeApEkpFg==
X-Received: by 2002:a17:906:3094:b0:9b7:2a13:160c with SMTP id 20-20020a170906309400b009b72a13160cmr16436421ejv.69.1696941277834;
        Tue, 10 Oct 2023 05:34:37 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id e10-20020a1709062c0a00b009b64987e1absm8294690ejh.139.2023.10.10.05.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 05:34:37 -0700 (PDT)
Message-ID: <dc50d8ec-b43a-4beb-9fdf-773b0ee30d0c@baylibre.com>
Date: Tue, 10 Oct 2023 14:34:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: mt6577_auxadc: Fix kernel panic on suspend
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 jic23@kernel.org
Cc: lars@metafoo.de, matthias.bgg@gmail.com, ruanjinjie@huawei.com,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com
References: <20231010121940.159696-1-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231010121940.159696-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_053439_232072_A37FE1C8 
X-CRM114-Status: UNSURE (   7.37  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 10/10/2023 14:19, AngeloGioacchino Del Regno wrote:
> Commit a2d518fbe376 ("iio: adc: mt6577_auxadc: Simplify with device 
> managed function") simplified the driver with devm hooks, but wrongly 
> states that the platform_set_drvdata(), platform_get_drvdata() are 
> unused after the simplification: the driver data is infact used in 
> .suspend() and .resume() PM callbacks, currently producing a kernel 
> panic. Reintroduce the call to platform_set_drvdata() in the probe function

-- 
Regards,
Alexandre

