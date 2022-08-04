Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C76C19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDwtWe0gIkdtSi8cNur71HHPuzn0FTWDpwW7k5ExZPw=; b=00ctlcMvLqrhp4XdKpNxXmcEIi
	j5JMpVi80Dw1PEYeYmXluBgDNh9s5qTPXT6hj/0iYb71cwIn6MjsiopttNJZvsHEkVpfuoq5gLrhG
	+hoogoX/w2JaeroyMurgzcoNhUiHoIbk8UpTp1tE71xA+Qrg5IPIRRyVbY3kqd00hCtCbXAGNTvmk
	7AHqNIYdtXujDZbNFmN+IUqYYxGhRsOWUEgghLrrXB5+fdf64yW0R80k6nXaK7CJR9EOsczYbOaCr
	Qp6UhsKRKcGMnSWABM+lm3wcwX1iQbtzl06oWOc1Ikeky+ataErzt2nL95YYYk4TdJ/doe7kR49fz
	sAkErbgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJcg9-0075WS-VD; Thu, 04 Aug 2022 15:22:29 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJcfz-0075PK-5T
	for linux-mediatek@lists.infradead.org; Thu, 04 Aug 2022 15:22:20 +0000
Received: by mail-lj1-x232.google.com with SMTP id r14so223916ljp.2
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Aug 2022 08:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=cDwtWe0gIkdtSi8cNur71HHPuzn0FTWDpwW7k5ExZPw=;
        b=Q+iGCjYR4/zG4LeeytGWsb+GidV+WjYzlUxgX8NHoygC39ZdFqdgqzSf2/rrCT2hP+
         rqG+vffLIVNES7Dv14kBLfhyghQR0XQuliT8aTg3oBpC7ybxdIFN2y8L1HnDSuWj9XWc
         kP7ZuVtoovFclRQRz2i7Zl46SduqV5fu2dAMfUUHOiYHRQu79rsLtzsmH/EOi8/h95A/
         x5RYViPEmzjt3LB6d9KY/aTlF/s/VmM26/RyYQnESPL9pZsGqcypfphyjsbK6QDExaib
         r1BEnxH6nSZo5Sl6r1qe+A5jUWu8GDx9Rgu1CTWIkJbk7X7HYiFmU97BpgFZhdLg7Ftc
         MuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cDwtWe0gIkdtSi8cNur71HHPuzn0FTWDpwW7k5ExZPw=;
        b=Xjygt4kOzKxdMLkRUwFPJpPeH5MJ8s70fKcEL+kekqOtcg0oq1GimvbQbuXyqf5Xyp
         LwDs/rM4bRWsOgj6ETsta/DjixmbIwE1j90yBCDe68XXMXJxhEmxdZ86jnt2nj0Ah86E
         8Q/hZ6HnEDhA7dI0Mvlw5jBFWK5PAl/fAh4+9AtBMjhQpk3bwrZ51j0UDVpxLcTEAPIF
         vUlCxOR6fAXWRc6zhLWX9MyFmLXMJK9XhqHd6M47JxkGifxUTG1Ip/DbLkxuBwhDYMF/
         XzBlz0vq1M8SZ1IqDz7m/Qy3kWbgA/cpXlzRQ0SqVWRbZEugLLnCJiCknOeyA9XtJpP2
         ETrg==
X-Gm-Message-State: ACgBeo1yh70tkKF18nmyzWpcSsNqS9gNkFUgSkGs07lPB+RQaEG2IPeq
	KuK6ABQvlVObZdvPYydUX/BOrg==
X-Google-Smtp-Source: AA6agR6kgl6aDqL0jj5GOm3S0+pZbnR+K4i9xZIFoIoGCS9e/HTYt5sGvAxP7DXLI82RddE/CX3GXQ==
X-Received: by 2002:a2e:597:0:b0:25e:4a64:1628 with SMTP id 145-20020a2e0597000000b0025e4a641628mr736820ljf.378.1659626532848;
        Thu, 04 Aug 2022 08:22:12 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id b17-20020a056512219100b0048a8c907fe9sm152854lft.167.2022.08.04.08.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 08:22:11 -0700 (PDT)
Message-ID: <0991e867-10bd-56e8-c8c1-b5d0cdefbb52@linaro.org>
Date: Thu, 4 Aug 2022 17:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v8.1, 5/7] arm64: dts: mt8195: Add efuse node to mt8195
Content-Language: en-US
To: bchihi@baylibre.com, rafael@kernel.org, rui.zhang@intel.com,
 daniel.lezcano@linaro.org, amitk@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com
References: <20220804130912.676043-1-bchihi@baylibre.com>
 <20220804130912.676043-6-bchihi@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220804130912.676043-6-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_082219_231389_BE2B122C 
X-CRM114-Status: GOOD (  14.22  )
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

On 04/08/2022 15:09, bchihi@baylibre.com wrote:
> From: Alexandre Bailon <abailon@baylibre.com>
> 
> This adds the efuse node. This will be required by the thermal driver
> to get the calibration data.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 73a0e2103b83..cbd0401968a2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>  /*
> - * Copyright (c) 2021 MediaTek Inc.
> + * Copyright (c) 2022 MediaTek Inc.

Why changing first copyright release date? This was not explained in
commit msg.



Best regards,
Krzysztof

