Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B41C77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 10:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rh1gldBq6zKF54NhdToFqztzBsv3VTQhW4I1lS7ak3s=; b=S2o7bZ8PFkkNJdApQeuBkI30FT
	RrFNuQEuZbKU2rHXPNC/Qo7YzwbZNXjrzG1D9okQYnH8FJ0EN4YWoOMXsxzcTfIYyTday0nAW81Tm
	OdWu4WseA7mgR1vm5oID8ZMDpbU+42NDxhIJLbkc2mBGR4oxRwWraOOF+vjKVcP8pLgIRkAshG8Uh
	kt78faCPdsvIlDISe6FF4riu5AIP3RJ5L+8MQqX3gfridFb+4265zVCDv/GklvKoJZOW1mtwAvisl
	bjMnYhnjsI36mkV3HjPS4lBnATb4yUCpwiqGBoR7u+b3Ar3ixkM+6zWIhCmuSTMjySkIyhvQ33zRA
	BqOJ7g5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmtvm-005jpx-0y;
	Thu, 13 Apr 2023 10:11:54 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmtvi-005joI-1J
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Apr 2023 10:11:52 +0000
Received: by mail-wm1-x332.google.com with SMTP id l16so7670870wms.1
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Apr 2023 03:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681380705; x=1683972705;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rh1gldBq6zKF54NhdToFqztzBsv3VTQhW4I1lS7ak3s=;
        b=cd/3lqYYREcX6JZjYJCzZcFEiAlsmLK9yPaLNG2ggAfQWA03NDHYlNe6RFe5ctjv9j
         qkE5Cf1F+oJYzQo3r73M21KKBaPIzK3KyQFLDTKYYiBkxV5Q356zFVhXMe5hyo1ilEoX
         qyGs1bAiedY+adpUXbxa1aaOjAzy4huTTBHKeWvcHoFd2EWjO4UiZMMDFIfFLr5scngV
         d38urRIbk2oz8ofRbz43x2+gQIRnGxFCRxeiPsgvEjT/ikUExlhCMUQ+YQW52jtDV8TR
         owvkvvgib9FfCWgDC/jd3QaVLUOmQKeQd7MXLeZQdehb2kkpHs4EYCf22Z4waE/Y2o4J
         FEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681380705; x=1683972705;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rh1gldBq6zKF54NhdToFqztzBsv3VTQhW4I1lS7ak3s=;
        b=lRPY6pwyMRuh/0rjt9Cl2icUD2UV4Zq15Q++3RN6MW5sGPvrIdebkT7XaOkMz0eyj5
         5Lkc4a1L8UgEkEyorpn6Kz/TDlzZCFTvBZn0fUc0AIoi/43RB7j+UDSXaSYHW7Zz29sZ
         e3uhuUhbVF16eaWPj/M8WjDd6mjNokP00PtPMTN4YIGzQus7QxSKMPfYpva0ul0b6lcv
         WPHLg+VoBl9Z41gzNQ3r/zuwlOA/kcf7u/Ya9Iw9tit8m26MT8G/UtCNZis8LA2zsiE8
         qh8uMJ48GZsNF517UhFRJ7guRXIUI554xBPKeIK4poGd2UwmKlcWhlGgfwe/+XWoQwJS
         WO7w==
X-Gm-Message-State: AAQBX9ceK66FWfKODs+3A86F7MqyKvDTnmzF7mKL6qfIJ8N5F2uQ5yvi
	yqy2aBh09Bwe/kR6HAspyN5BlQ==
X-Google-Smtp-Source: AKy350ZFAT71PMZf5H+HAkQEk6xT99x0FuglrvXuwh0ry9ycBGd2Dz0LsyxMOMG0AoEOw6ril9Fmig==
X-Received: by 2002:a7b:ce88:0:b0:3f0:7ddf:d8e4 with SMTP id q8-20020a7bce88000000b003f07ddfd8e4mr1279283wmj.17.1681380705280;
        Thu, 13 Apr 2023 03:11:45 -0700 (PDT)
Received: from [10.1.3.59] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c228800b003edef091b17sm1381662wmf.37.2023.04.13.03.11.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 03:11:44 -0700 (PDT)
Message-ID: <40f79e51-db8b-7105-5cc1-4465ca818416@baylibre.com>
Date: Thu, 13 Apr 2023 12:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 3/7] leds: leds-mt6323: Specify registers and specs in
 platform data
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 pavel@ucw.cz
Cc: lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
 <20230412153310.241046-4-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412153310.241046-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_031150_662136_79BA5F63 
X-CRM114-Status: GOOD (  15.53  )
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

On 12/04/2023 17:33, AngeloGioacchino Del Regno wrote:
> In order to enhance the flexibility of this driver and let it support
> more than just one MediaTek LEDs IP for more than just one PMIC,
> add platform data structure specifying the register offsets and
> data that commonly varies between different IPs.
> 
> This commit brings no functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/leds/leds-mt6323.c | 145 ++++++++++++++++++++++++++++---------
>   1 file changed, 112 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/leds/leds-mt6323.c b/drivers/leds/leds-mt6323.c
> index 17ee88043f52..a5b2d06e9d63 100644
> --- a/drivers/leds/leds-mt6323.c
> +++ b/drivers/leds/leds-mt6323.c
> @@ -37,18 +37,16 @@
>    * Register for MT6323_ISINK_CON0 to setup the

Comment should be changed.

>    * duty cycle of the blink.
>    */
> -#define MT6323_ISINK_CON0(i)		(MT6323_ISINK0_CON0 + 0x8 * (i))
> +#define MT6323_ISINK_CON(r, i)		(r + 0x8 * (i))
>   #define MT6323_ISINK_DIM_DUTY_MASK	(0x1f << 8)
>   #define MT6323_ISINK_DIM_DUTY(i)	(((i) << 8) & \
>   					MT6323_ISINK_DIM_DUTY_MASK)
>   


After that, it should be ok.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

Regards,
Alexandre


