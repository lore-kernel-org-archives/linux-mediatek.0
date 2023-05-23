Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5832DC7EE26
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 16:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hWDKOTssM4FQyfGCYtsz+cR6mie3Z18WQlIfyIGgK4=; b=yHHOTt5vSjTMLMflZf77whakIR
	j97iVzVa8wuJ9ZSvZ3KqGBjp0jaTlZo56UyDCvFApVhiT7hW8tOzx+2kI7LofS7E2Z/wBq27T3CJI
	GUDXKwZuzzPi7aOEUbckWg9jFgEfLtJUyobJ63quaVrtJ4AvEMpm57+E45SJJvWZjfZea1+VRtB+j
	IB+qP/uVyoWzg7kXGnu2lXhGTxJYWtXs9mhWggeAvFGcUzcYU9e1Oqx762tGHe81BAiE8ZzoRywNI
	EH2aMgtHJphBlbjZMAODa6vuYCmhLUNUyarfqzYjAyfTIhh1cHN2IFcUs68rxJdceVG61TzuTLyul
	kmwCKvmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Uq2-00AnAC-0s;
	Tue, 23 May 2023 16:26:18 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Upy-00An8D-0Z
	for linux-mediatek@lists.infradead.org;
	Tue, 23 May 2023 16:26:16 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f60dfc6028so432605e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 23 May 2023 09:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684859169; x=1687451169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hWDKOTssM4FQyfGCYtsz+cR6mie3Z18WQlIfyIGgK4=;
        b=mYu0SEk+RZXENY1xtpNmWBrgNsZdpZ9O4tniZ/Wkwa+8dCOI8W1i2GmjzsBImvf2OQ
         /+0iD2cM8wt7vw7Z1a9jbaHadU1iIPqQ+lAaExnbAISEjZ6PCHUEpy3M+fVk3gzuUz0P
         j71SEkbgQu3MPnS5Cd7/uCdBfthCcWCXn3ZW2U37PSQAQQskcFiAL506vrhnYsinXa7S
         ZIwAKdhOixG1Yf0s3lGwng3Olx2HfN+e/WYGEDBAAQGd9SsnaVnw9c5a0YRZOpJ2SiqM
         gYFiTjkYtzop1yt1Lws4oD6AmMb4rB/5f/w7gz2OKk7yIDmOvByd3ZqDv7fNav2iirnd
         iISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684859169; x=1687451169;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hWDKOTssM4FQyfGCYtsz+cR6mie3Z18WQlIfyIGgK4=;
        b=Y7pnfijL3Qyisw1u2py5+uZjbse/gH246bj5GQJVSm75s7F/Ojp2mPE/SrtsZj5hcz
         1nWqNoLkb5NtpE8U/WkI6BzbADhtLPcad+1fmhzLt0kYbfaVvX4NAUdnLCWwCAI21j04
         S44K2a9WvB7uMGK6NElHR2BLCMb9jfv0IlAKXF2FVuHCNB4fwv93Bb8CrBVuTgKh6d/Z
         5rSrZLxsHH8tfo88GEbiaIzxEOY791KP3aMb1C0EJGG4/AQwdiIFz0ozy4Szn2L+QpzQ
         wN3kbnPkPM4WbgiIJNV1f7XBK3axhF285Pf/eJgkY9oelkK+HUeJ3/bLMiDeHmOO6ncw
         OIpA==
X-Gm-Message-State: AC+VfDy9FHD5q0n5uUK2Oo6MBmWyGV1Hi+k1gvyUYRGvwyE+weePEwwk
	Wwv19JcRnTjPZDxYGU7MN9U1uQ==
X-Google-Smtp-Source: ACHHUZ7wvkNksRRlhJ5pqhiWSVhwW+UQHRyyp9zUBWS/rshrEORKyWRTxRCw2le4JdEfLngvcdm3lg==
X-Received: by 2002:a7b:c4ce:0:b0:3f5:b4e:944b with SMTP id g14-20020a7bc4ce000000b003f50b4e944bmr9335119wmk.18.1684859169598;
        Tue, 23 May 2023 09:26:09 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id p24-20020a05600c205800b003f6041f5a6csm7729571wmg.12.2023.05.23.09.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 09:26:08 -0700 (PDT)
Message-ID: <cb69dbab-0966-8ecb-d9b9-017f430fd7ea@baylibre.com>
Date: Tue, 23 May 2023 18:26:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/7] ASoC: dt-bindings: mediatek,mt8188-mt6359: remove
 ADDA_BE from link-name
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
 <20230523021933.3422-3-trevor.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230523021933.3422-3-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_092614_453665_0F5D468A 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 23/05/2023 04:19, Trevor Wu wrote:
> ADDA_BE is used to connect to mt6359. For machine mt8188-mt6359, codec
> for ADDA_BE must be mt6359 which are configured on the machine driver.
> Besides, ADDA_BE is divided into two dais, UL_SRC_BE and DL_SRC_BE.
> As a result, remove ADDA_BE from items of link-name.
> 
> Signed-off-by: Trevor Wu<trevor.wu@mediatek.com>

I don't understand how "DL_SRC_BE" and "UL_SRC_BE" links are done.
Why these dais don't replace "ADDA_BE" in this binding ?

Regards,
Alexandre


