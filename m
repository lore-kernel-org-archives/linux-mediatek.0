Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9BEC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 07:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OXkPJ2LV2ZogyoqlMfE2v8PeFH0/dwvhwc1PVxytzB0=; b=W77Yqa85dtWkQd
	UW2zmRJqvK67WKchmNvhrZkgApLoFhPYYeJh7Td4Hd/qMo7i2aMf0wSksYdrscXb3vf/FWRQB0Lp4
	K9JeyXp7kFzVhzmp2Yty4Kc5BtSXCVi8u3euLcVhtB1sh0qIWX8lJHnCNR3kHvoZDnQeDcAKv+l2w
	B/eltL9sUxFN1wgdR7y4F2RtfF9QOCKE+7exxFm9FNcrif0L/T6XmybbAAtUOpuvvrgAJJUBstY0W
	RysnNcZ38jEz92iNPUc6vVTKmEwPm8DOFbhGx1afw+nR+ZUyaFTKHy6p/44iEGwEWuucU8qZ6WbZ6
	qMZ6N4M2FpurgwgPUNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwIvw-00EPJI-2N; Wed, 01 Jun 2022 07:38:24 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwIuQ-00EOUC-Ey
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 07:36:51 +0000
Received: by mail-ej1-x630.google.com with SMTP id fu3so457359ejc.7
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 00:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xBCpf2ijkY04JO9G9o2+kZbRlNvwewrf/4U7CP2kV/Q=;
        b=gV+J5H9vudoy1jXIIq0cFUYJVb6S3uq/9ey4aCormFoudezlzz0SFq7wkA1hjz6aaD
         uZEaWAamHW72+BF8B9dQ2dFnzJTLO90WFV3Xl4RCcTXViWv8Hy3EYyLIntuRwnlUvp3t
         /NCbF/kU8/v+ouGvLC0hs90dMzJPm2NWb1muqvS4/CrcHEUj69BtVLPwb1vslUmvz1O0
         Kc/IJTYIGHFIoIWTDsw0iAQ7LoihyDvNMwjrlsY18IxjajxaWxO0CwAoBDvu/nw7Ebge
         EnlPx3uK1SAR/GeSWt3TqDfZYsaqZA6CuMo1CtVUlAvVreobSOg77dv0D0pT9+x3zf1W
         GJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xBCpf2ijkY04JO9G9o2+kZbRlNvwewrf/4U7CP2kV/Q=;
        b=2MkLKR8ptn3JpPGpZCCqy7sjPahmyQqunGpYTAuOKQc2ekAurqUxxCVBeJh1Gg8yU+
         dUME4/yn2RU7LEDeBxNbRlO6Y0JOi/PxVlxnMkHRmdHNPQX/rPbqbbNXIYqUJCuhK5mq
         K/P4c+lzWUd8tuEXhNz9AgsITbRYSgokLtQE1Yaa1nunyVXv5oIFH1Zi1TmmW8dfIxdt
         8WFcA/+6PFtlPKPpoaREbgf4nlXPrCBRm2jmmlMAM6SxnzANRhLFUKw6KbFB19TJ6DRF
         OlRBQM6fA5HoZVJwECvjp5fKX3xitPeARqIq9zvc4lBdAQI1sLG9mUH2YWhEfCLY6m0/
         fRMA==
X-Gm-Message-State: AOAM531MWO1vkeG7PlzHi9L+A5rMhB8/Kn41lgAyi86x0gldrqY90mWI
	It7I89XM6SIA3vDvpf415oP2kA==
X-Google-Smtp-Source: ABdhPJxfd2wQq5+y/1mKBm1VxIcQyViT4mU2wnLCba4T6VYB+uuoOMJoXI413QaVy+3m4ZkIk2bPnw==
X-Received: by 2002:a17:906:974e:b0:6f5:2d44:7e3c with SMTP id o14-20020a170906974e00b006f52d447e3cmr55781341ejy.167.1654069008364;
        Wed, 01 Jun 2022 00:36:48 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id v4-20020aa7dbc4000000b0042de38b8c49sm516690edt.34.2022.06.01.00.36.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 00:36:47 -0700 (PDT)
Message-ID: <e58cc626-a5dd-4926-5192-cd85d16c797f@linaro.org>
Date: Wed, 1 Jun 2022 09:36:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RESEND 04/14] dt-bindings: leds: Add Mediatek MT6370 flashlight
 binding
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Cc: cy_huang@richtek.com, alice_chen@richtek.com, chiaen_wu@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
 <20220531111900.19422-5-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531111900.19422-5-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_003650_523130_FEB2F0AF 
X-CRM114-Status: UNSURE (   6.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 31/05/2022 13:18, ChiaEn Wu wrote:
> From: Alice Chen <alice_chen@richtek.com>
> 
> Add Mediatek MT6370 flashlight binding documentation
> 

Please apply my previous comments.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
