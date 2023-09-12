Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5478FCA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 12:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kYU91k+Yt4At9Ky8Zo4xbD1ZbiophgceK/i0wy1hkcE=; b=ZZWD9UtwyrzCEYrzgkCNAyF2zs
	eIl2Nu0Tix6nQHZeOtH1SjhgjYOBRNbvF59nfal/jg0ddqIzHnohmQn6BP8Tf4dNDyxcDTltr3ayg
	ZgDXLTmap1pRXtAKjzJH2PWZCGNV8PWDyJgF/dPidy+OCLx0xazKO55k8cuwUpy1ivvYoSJLWIOP7
	p8O/woAm4WdnrQbHdphwvVZ5uO6gEj3BiYmawSQ7OcBTHYeZdjS1s+vII700ipCfDPxj8xNhNdzvz
	okUCdOHsOefMoM0+jbu6QrhHn8m/wemEGOfD1VXRAQ+e/dAiNfLtoST5qNA42kIlOZ1V1waBYaavA
	zfppUF7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg2xl-003N9k-0e;
	Tue, 12 Sep 2023 12:57:53 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg2xj-003N8i-0P
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 12:57:52 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-401da71b83cso63553075e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694523467; x=1695128267; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kYU91k+Yt4At9Ky8Zo4xbD1ZbiophgceK/i0wy1hkcE=;
        b=Hhehf8SnpZ5tVjKZmEInofuv8d1RBBcwFqnMg5RabqT4zPa6Q/R/ymr+3JHs6up73n
         fgeIPNYkfJ0ortrZwTwmHZIJF060i8wq/KNcMREwIyhiOCkz+G0dOXjnzc1HBaS61uXh
         uIQfPLPcSzKBbOKeaOm/lEzXweXj3aJowOs3Z7wI6LV9XQcvEjbwmN+8v03l1prc/VPM
         bvlX3Ss2wKLIwZu6GM86p7WefeZVaE4UP2D+oMldnEfid/UT4KS7bYcASfrVUSJu8IGf
         m3dWXA2cQwaWMDF409a6p38/G6o5R/++j2C+vl/Yt6Rlclk1WV2UW/QEEyPYEviA5Rw1
         ZBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694523467; x=1695128267;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYU91k+Yt4At9Ky8Zo4xbD1ZbiophgceK/i0wy1hkcE=;
        b=JKoNJ2QHx+BExHDHv2el5m0CHgMzhVMg9xaKbReFOMmwHE4+WgQ+NueHoeeYMrFUTl
         QfV4nJY3hzcwVjuqzpB7z/rTcXV0ZtyDSbdk4jthGIUCEJ59wTUMSVBtPUej+xG3Vs3f
         7awFwD+mE+uH/2ycH+jnjzDeXM1Zx4AGvVPxMIUmLEe32kPX23MbFNeFNU6CmepQgH/8
         vdsofnGCmJN8GnNo3EpiP28ZO9nW5l7U5WjmD9Rcc088QXScZMi2ghHE1BPZ+0AScmjA
         0vM7hNQAjE0Bjcz70EKSPItE59FVyjuUiEwLqzP1AFfR/RxWHd9JsmY0Q6EdQUte0gqa
         vB5g==
X-Gm-Message-State: AOJu0YxcRj2Puexk9ZSwDsSyKXExK6BqynzzZ2C+wVvqksCRizi07nca
	veF0/K6J10eVMzib1GiuOMtTaA==
X-Google-Smtp-Source: AGHT+IEvBC5cBojbboN1wVPdVG3nssSxtqehgHtA+QFGwbidSUE5Ft50iLURqhRnLWY9y/XYtYnlYA==
X-Received: by 2002:a05:600c:228f:b0:401:d803:6246 with SMTP id 15-20020a05600c228f00b00401d8036246mr11053444wmf.2.1694523466766;
        Tue, 12 Sep 2023 05:57:46 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:6333:6696:6b64:4890? ([2a05:6e02:1041:c10:6333:6696:6b64:4890])
        by smtp.googlemail.com with ESMTPSA id t15-20020a7bc3cf000000b00402be2666bcsm16205152wmj.6.2023.09.12.05.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 05:57:46 -0700 (PDT)
Message-ID: <07a569b9-e691-64ea-dd65-3b49842af33d@linaro.org>
Date: Tue, 12 Sep 2023 14:57:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Aw: regression with 33140e668b10 thermal/drivers/mediatek:
 Control buffer enablement tweaks
Content-Language: en-US
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alex Riabchenko <d3adme4t@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <trinity-6713557b-fe0a-4dae-84aa-1aa86f7619fa-1693473911557@3c-app-gmx-bs12>
 <trinity-f3e7d8e0-2e93-4e84-a489-3993c819d2c3-1693488871086@3c-app-gmx-bs12>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <trinity-f3e7d8e0-2e93-4e84-a489-3993c819d2c3-1693488871086@3c-app-gmx-bs12>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_055751_167547_786C4003 
X-CRM114-Status: GOOD (  16.15  )
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


Hi Frank,

thanks for reporting and investigating the issue.


On 31/08/2023 15:34, Frank Wunderlich wrote:
> Hi,
> 
> looked a bit deeper into it and it looks like i only need to add the fields in the mtk_thermal_data struct
> 
> --- a/drivers/thermal/mediatek/auxadc_thermal.c
> +++ b/drivers/thermal/mediatek/auxadc_thermal.c
> @@ -690,6 +690,9 @@ static const struct mtk_thermal_data mt7986_thermal_data = {
>          .adcpnp = mt7986_adcpnp,
>          .sensor_mux_values = mt7986_mux_values,
>          .version = MTK_THERMAL_V3,
> +       .apmixed_buffer_ctl_reg = APMIXED_SYS_TS_CON1,
> +       .apmixed_buffer_ctl_mask = GENMASK(31, 6) | BIT(3),
> +       .apmixed_buffer_ctl_set = BIT(0),
>   };
> 
> in my quick test the temprature can be read again and i'm near room temperature...i though it was a bit higher before, but as far as i understand the code, the values were fixed before and only made it configurable.
> 
> if someone can confirm that i'm right, i can send official patch.

At the first glance, it seems the proposed change is correct and could 
be proposed as a hot fix.

However, the conditions with the version and the apmixed_buffer_ctl_reg 
looks a bit fuzzy.

Markus, can you revisit this part of code and consolidate the 
configurable approach ?

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


