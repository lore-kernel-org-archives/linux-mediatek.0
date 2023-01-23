Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A31EC05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQ+/a8w/qFj3luZoDJ3OxPjYbwogmzi2kqkpt3vBPmQ=; b=bShVbWEDLiGZAdEmpAYbHVRWBN
	6ksPaW8XF+GCu9+j+IrKUo5pYXaPIwlB6c9+r2bgAXk/JXA+0O3qRTz9eTk/F8k+WrHTrAiU8O93r
	a0ip2DZEZWncc4tgaCZmOPibbrrohOTm5uElCok0wZJj0mtB8AMO74MIjAwhykyndYer753k7YfRg
	NehtMn7kpgSxEOeYeZImtd7itGp9VFfWsz0sie2hcsJagBfa8az9/QQbjnXt5tAKPISTeqgER1xT8
	LSlIbV/M2saB8Qir5IWkfFw1ozjxJBm/upgd8MnwKqXU51IYjX97Q/n/Q102cS3VpJR2T1aGApuUt
	D3tX9C/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzLX-000QRL-MM; Mon, 23 Jan 2023 16:06:59 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzAk-000MNV-RL
	for linux-mediatek@lists.infradead.org; Mon, 23 Jan 2023 15:55:52 +0000
Received: by mail-wm1-x329.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so8939123wmq.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jan 2023 07:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UQ+/a8w/qFj3luZoDJ3OxPjYbwogmzi2kqkpt3vBPmQ=;
        b=VWS7PSmLmcJaTf6s/uhF+6wnvE+BRrCrll9s928FrSFccqhWO2UJvnlL2172c3R4BG
         baRGfNGYybTJ1LR97ouds3lNSYT8qGmBhAdsjsUV546yl55AzJOKPYUWxLnfbvYeSrx9
         QCWrCKMzl1u9q/CRqKphUzwokHw+oju5ZLZq1JnFj+d40qH6lzC00YG8Pb7PWDDux65R
         aZmNwO97F8yUgYsLPeyQMTsoJTJzwr9v9V8yqrcwR4eDRbH1Er+hFD3lgoowNAy2hzjE
         NF2x6ukHrhImJI21NHC0LyBw30x1IOvup7SRC4sbmDvQOjrajtr07Jn770O8tTq4viIJ
         2qLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQ+/a8w/qFj3luZoDJ3OxPjYbwogmzi2kqkpt3vBPmQ=;
        b=S5c3fZYmZSdqauwjR6yVWigAWExm+Audl66WY2D8mjk96zH6NeLy6Bi+q3WnIuQ2KG
         4pLdtZPPmB5dxP6XwUHwzJ9E/SlDekJ9+pmJ06ivXFahfffsfkkkQQhf91ojCjbSq9NT
         NhDlALna65lS4D21Yj97JcE2YA3ykBDk6fcSxG44hdbBv14+fOFU+F6wtQYvpVbfI+ti
         W+LXxYl/fjbS3FlORi85oPpBgAiFi5zdR7dm8NkUjM7SLeFVIn8ENPT9uWuPZJQXFahy
         Kw0KoTlQKX0zd62aAb1rpDizJpBpHoNQ8UtioSV7Z/EP0Cpqp7Xc6KJus1ELXXummFZV
         xRhg==
X-Gm-Message-State: AFqh2kpRJMI1WC0eOL4Vzv/xocwazB3ToGMH2fiQegel3l09x2PRJhji
	j1sLF1grF5Wv8CSwOCk/x9QEgA==
X-Google-Smtp-Source: AMrXdXt8WYT9onKbkfM8CaJV81Gp9fudEaR2Scx8A4s5srCWVOUCIqmfOHP0RzuwYfOTN5WR9mt20w==
X-Received: by 2002:a05:600c:2d05:b0:3d0:85b5:33d3 with SMTP id x5-20020a05600c2d0500b003d085b533d3mr23415558wmf.16.1674489349204;
        Mon, 23 Jan 2023 07:55:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o24-20020a05600c511800b003d9de0c39fasm14623257wms.36.2023.01.23.07.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 07:55:48 -0800 (PST)
Message-ID: <b2fee032-cd19-eea9-730f-0502274884ba@linaro.org>
Date: Mon, 23 Jan 2023 16:55:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/2] spi: spidev: add new mediatek support
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230118-mt8365-spi-support-v1-0-842a21e50494@baylibre.com>
 <20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com>
 <60766c7b-abb2-3afb-aa16-0e1385b88a73@linaro.org>
 <CAFGrd9rtO0B2XWEEU6gtv39PndjdjLL6tbRWimWT3RvLu1GFrQ@mail.gmail.com>
 <259d738b-5717-8fda-22f0-c61db4660e95@linaro.org>
 <CAFGrd9qENTZV2fs52HPv291=AJdcBHpd2L_uoc9PhbO1vcKw=w@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAFGrd9qENTZV2fs52HPv291=AJdcBHpd2L_uoc9PhbO1vcKw=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_075550_977580_A066EA49 
X-CRM114-Status: UNSURE (   9.84  )
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

On 23/01/2023 11:06, Alexandre Mergnat wrote:
>  Because there are no logical order:
>     { .compatible = "rohm,dh2228fv", .data = &spidev_of_check },
>     { .compatible = "lineartechnology,ltc2488", .data = &spidev_of_check },
>     { .compatible = "semtech,sx1301", .data = &spidev_of_check },
>     { .compatible = "lwn,bk4", .data = &spidev_of_check },
>     { .compatible = "dh,dhcom-board", .data = &spidev_of_check },
>     { .compatible = "menlo,m53cpld", .data = &spidev_of_check },
>     { .compatible = "cisco,spi-petra", .data = &spidev_of_check },
>     { .compatible = "micron,spi-authenta", .data = &spidev_of_check },
>     { .compatible = "mediatek,genio", .data = &spidev_of_check },
> 
> I can put it first then before "rohm", or before
> "micron,spi-authenta" you prefer.

Yeah, I noticed it afterwards.

> 
> I can also introduce another patch in my serie to re-order everything.

I already sent a patch for it.

Best regards,
Krzysztof


