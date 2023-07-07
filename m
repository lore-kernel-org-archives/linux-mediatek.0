Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11E1EB64DA
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jul 2023 13:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRYKWLcICY/w12lNxMoJVR5s2kK0wW/mWDa5IrHhho0=; b=OMkGFkM7HFBEZQ6pZ4BPOVtoZe
	snV0GHgnYHH13BbM1YN5bfSGZwY69zPL+O8ZAb7CEC52O+1iTh9JXTCpL+nRiFGMXvOyeB67V/Uu9
	XGsgMC615LH5kQ69IQ3oexMxMtnShtOL08q42t0aHBjTXrRvXB0Fj5sm+75+KsKcUj6p2T3IJ/MII
	/nppZzjcZn6kUwImZTxiDn/PMBvK1p2lBnxXDC14TcYeonjDiqpaT2znqJNGOnEIBdneoJPtukLI0
	NKfr7X8Lh+zJ+F/254uM+EEcuIowCFikdcsFN294olgYs41MnH7mjyTZuE57ttOCNbyCsRfberlEK
	q9MiKecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHlyZ-004nNg-3B;
	Fri, 07 Jul 2023 13:58:23 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHlyW-004nLx-0t
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Jul 2023 13:58:21 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3141c3a7547so1957599f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Jul 2023 06:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688738296; x=1691330296;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YRYKWLcICY/w12lNxMoJVR5s2kK0wW/mWDa5IrHhho0=;
        b=D8DASQjM8uOnq/Et1EL0DKBNOL395SX4Pd99z5tcVN2SjA4RkVZAjGu1Q+5rD7n3RT
         1zSbc0cQfgXHjkzXIhBWwpaysopWq6WFJZWseTprmcFChioMdkcVs+GXWjFeBndn8BWv
         7g+0qtRSOl2QKrQJqBB11GEx4jkTiORHX/kpWkOfeEZJ8w4MWIhlx5Fz8nNjRHbBFf8A
         fTkd06UJg4JkK/tOaeKgd6oik7Z7R/kXeX+EFe8N6LpG1aE7saTmdFlMnGE7m5ob7OcU
         W9L1tZYvSDs+UAOXk+CIxXOW+eUOeG0auIrUMx8inqhz8XETF6jYv2t/6Bpu0CzFtDyt
         /NhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688738296; x=1691330296;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YRYKWLcICY/w12lNxMoJVR5s2kK0wW/mWDa5IrHhho0=;
        b=APIsMislALfFHthkg8vHiPLgqUX0rYhl1kkVbrbFPVNd5bvjAUmjFGSjcf1IWYCSxo
         MOlgFFf7HdJYrzm0ArCag+rEDUOxE3XZWKdcmhkh3sXKn4hi5gd7c3j+iPDNTZapJrq2
         NffFb+Etg/2ia+c2t1DCCHPtR8GWhNfcQ+ToMIdf/6b0xYkKoKNXkQvD9isuEry4f2Of
         LyEH0xUfgdnvBwkHG6jiPNeF8ALCPttDIHt+oD859FqjTyzIB2HF1RoZCKtbuY/jSRTM
         X6yWn/n7lsywyYU1nBIZfMiGaFX5fPmvX+OaE+5N+jIQKBbAIpnyujLSSmhkyY5rXAvG
         TEug==
X-Gm-Message-State: ABy/qLZ0REO/Q0lc18mnjSFfHSXzx0fvev+1kNOyZKXpspGFnAqoFwW9
	D5wZpoXXfaOi8dI7gVcZmHJ8Sw==
X-Google-Smtp-Source: APBJJlF/IJPwi2hekpbwYkjsQKScIRJcy/Nj82kQId+zt+KJoEcW2RTRZob/tUsy1Qycfvbvjj4riA==
X-Received: by 2002:adf:ee4a:0:b0:30f:af19:81f3 with SMTP id w10-20020adfee4a000000b0030faf1981f3mr4239441wro.41.1688738296585;
        Fri, 07 Jul 2023 06:58:16 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id f3-20020a5d5683000000b0030ae499da59sm4520881wrv.111.2023.07.07.06.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 06:58:15 -0700 (PDT)
Message-ID: <c0441cfc-82cd-f398-6a11-8b4644953332@baylibre.com>
Date: Fri, 7 Jul 2023 15:58:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 4/6] thermal/drivers/mediatek/lvts_thermal: Disable
 undesired interrupts
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
 <20230706153823.201943-5-nfraprado@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230706153823.201943-5-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_065820_322760_2E2EF234 
X-CRM114-Status: GOOD (  11.31  )
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
> Out of the many interrupts supported by the hardware, the only ones of
> interest to the driver currently are:
> * The temperature went over the high offset threshold, for any of the
>    sensors
> * The temperature went below the low offset threshold, for any of the
>    sensors
> * The temperature went over the stage3 threshold
> 
> These are the only thresholds configured by the driver through the
> OFFSETH, OFFSETL, and PROTTC registers, respectively.
> 
> The current interrupt mask in LVTS_MONINT_CONF, enables many more
> interrupts, including data ready on sensors for both filtered and
> immediate mode. These are not only not handled by the driver, but they
> are also triggered too often, causing unneeded overhead. Disable these
> unnecessary interrupts.
> 
> The meaning of each bit can be seen in the comment describing
> LVTS_MONINTST in the IRQ handler.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

