Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E498EB64DA
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 14:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypN5vITkkhGfPkJuwEgCilvTnXaVJG+QXbGwWF3FDlA=; b=KShnvwb+Dmq831uAotL7HW9Mf8
	WGistKZ9v/wirv9ecHdpUmbd4CGaKDa0LwaDhBfuXV5sImNNX3RkcFxzWfNmDZEmkMWhB2SlOII9Z
	Zmlfj2FcegslmVD+28os0txlrdJEbcJeAiwN3ttXSs1Q7MzB4j2MBaQJ2etM6U2seFd4LmlkOnxYw
	D0RloHN8CjA6Z6a+cWXqx42/t6FsOPPuAvekN0iB0kBF+q64TUw4DeRu4mru73+RC8ESycfErpCn6
	vGppBUez3ROkv4jQlpt7dYCcel3fkCTL7L+TUpgge7Tdv9AISQF1hY+0rAqx8+UU0BdyJC2fd97pe
	wr9nNZxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHm64-004pNx-25;
	Fri, 07 Jul 2023 14:06:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHm5z-004pHP-23
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Jul 2023 14:06:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbc0609cd6so19870015e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Jul 2023 07:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688738760; x=1691330760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ypN5vITkkhGfPkJuwEgCilvTnXaVJG+QXbGwWF3FDlA=;
        b=U8gTuONmR0RGUohWTlcfQ9UAZEkZtIioCQKg4mgY0r/MJ/TM+Zpill9AVXG4dL+n1J
         75f8QB231z1Fd0ceajdas6iwgBBsoo74bl11HgBPwzbZZl7J5SBqmNGvUJ+KY4i/tVpc
         PJMGs+aWolF1d+2lmRul8XsaV1oIefZNmBndfcDd9IgbEc15nODg/tE1iBH/VeMcpr1Z
         BHNKem+bIBCi34voVW5WDXlUyu5XKHYsOL7tr0SsqpqT0j1caJDD0v1r5AJ9NlsUXcp8
         tPx796BR+LndDrv2zLi2l+eu7RYcsyjyS29slTh59y7tA030Ofl1tqvV5FSxZCB1/szd
         iRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688738760; x=1691330760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ypN5vITkkhGfPkJuwEgCilvTnXaVJG+QXbGwWF3FDlA=;
        b=a0wcRtzTKAZh3lQ3S+w7etz8KSYZ9pdNQGBM46oH8Mad0t5xE1duvlVY8ASJtLN9ue
         gNjbZ4ra9akYlMpJ7loGhvsSJ+TNxeZYgCkykxorA/1/vwraw/0zhvMB2UgsVT/P8xHO
         gPQ2W5TRbZsnC/xDvgiEJvLyaZ0sz7LevPOtEHohAWMGhfht7QPbtfMet77T8KgHY07L
         w7nxZEmsW10wzYTevvwbuqRCGLwOH7diQwSpSuNCHGt4wEy7SkeuRiK5zMuOZgEDVzJ9
         N5RiGtQDZjwNBk/KwMz974WKB91NT67iynoMof7gPXGQucULW+zOfYeYWfyH6lJeWbiR
         eSAg==
X-Gm-Message-State: ABy/qLZBSchyocoEUp76LVTGOmXu46v9jMhJLx0lNFqRUKyoEdNz17PZ
	RBb4T3ehyUR4HncadoCXPyBjbg==
X-Google-Smtp-Source: APBJJlE4nXzGIyRM7DxqinqjrJdnm+zgxihOIhoG+vQl/r1Bz95EDhhnhhzYxyE7FPttJhhJ/yJ+1A==
X-Received: by 2002:a5d:6045:0:b0:314:35ba:d02a with SMTP id j5-20020a5d6045000000b0031435bad02amr4720202wrt.13.1688738759840;
        Fri, 07 Jul 2023 07:05:59 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id q24-20020a056000137800b00314172ba213sm4525758wrz.108.2023.07.07.07.05.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 07:05:58 -0700 (PDT)
Message-ID: <8557e0a2-6ab8-f056-6796-770b3675b474@baylibre.com>
Date: Fri, 7 Jul 2023 16:05:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 5/6] thermal/drivers/mediatek/lvts_thermal: Don't leave
 threshold zeroed
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Alexandre Bailon <abailon@baylibre.com>,
 Balsam CHIHI <bchihi@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 Amit Kucheria <amitk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230706153823.201943-1-nfraprado@collabora.com>
 <20230706153823.201943-6-nfraprado@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230706153823.201943-6-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_070603_688438_28A425B0 
X-CRM114-Status: GOOD (  11.67  )
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
> The thermal framework might leave the low threshold unset if there
> aren't any lower trip points. This leaves the register zeroed, which
> translates to a very high temperature for the low threshold. The
> interrupt for this threshold is then immediately triggered, and the
> state machine gets stuck, preventing any other temperature monitoring
> interrupts to ever trigger.
> 
> (The same happens by not setting the Cold or Hot to Normal thresholds
> when using those)
> 
> Set the unused threshold to a valid low value. This value was chosen so
> that for any valid golden temperature read from the efuse, when the
> value is converted to raw and back again to milliCelsius, the result
> doesn't underflow.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

