Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47170C47095
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 09:04:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12D5061185
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 09:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12D5061185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wwQbMziKAhgDR0c3ORTWT94BfgbyIHiEG/gt4jL74NE=; b=wPUtVHqdejRhhGUsrw1fMICG3n
	xcQR+gnBaRmKxwngcz8kxhIxjxYdZ3pN7WeNRoXG0Ft38qPyO5JmXeoDNx24MOMQC8IvaiKWyYO+Y
	co/oqA6BOtJfZ0GIiEQAXyVi9ewKrbZV1x8I2jBzcjDzBadCFtj5txEwoLtj+ycdw3WFNgdKeF7wj
	nBSkchOzH0Ms9SrZqohGMHo8LQz/O4qOelsTyaMXISiujw6s5mA13BLQ72vIyfTZbsvHb6XxmdelI
	7GuvP8HtZpMyLM221EyyF5hoFkd0xP9/MDu+n07ruaAhE6MjCqfPvV9b9Q05DAPm3DDkqVga4UEXC
	zQK3MzOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqu8M-00CY88-D3; Wed, 09 Jun 2021 09:04:22 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqtIF-00CIfK-4j; Wed, 09 Jun 2021 08:10:32 +0000
Received: by mail-wm1-f51.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso3632924wmi.3; 
 Wed, 09 Jun 2021 01:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZWS3MwmOtTgK8KzMw9axjq4+2CXYo4dUJ6kQFDobHa4=;
 b=RP9SBzME6Yp5GvJvuPzsa8sUoTFFIj9qPw33zzygi8NFBPwNH1Raxtlk5O7KBPxD1S
 b0ZpQEmFcCiAnywdlfGmTF3mSfJpsj2sJVbB7c00YPIDPqyFdNMmM/gwQdzlF10fOqWr
 O6rxzH2fUpkOfkSglik3kbs2aenbxAfAcfHr5Ydcbt3neH16dciL4w3FPj2ZIzD4z7Ji
 ZGG//irhoOjWPkLE95q4ZF3/kth7zhU+szCdFCT9E/br3rD4yrlj1XhYJgWTjYVlq+Bl
 zAiRHXPrTgOQeMBaMA15DfMPRDwKR3jOhvTzOuSq/gPCc+4FawwxcWbUc9+Q84EngWnt
 vv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZWS3MwmOtTgK8KzMw9axjq4+2CXYo4dUJ6kQFDobHa4=;
 b=j6EUX+CqwuFs3AE61WeQ8qgzYWGV56s8sV9jTh21PTonnfSpZyTplkxb6v0H57WHi9
 smfxG3EMg0kLD5sIWJwAhnNHeF9Y1BCxEVXv32LYJmqyX8sDs1dzN4Nfuwf2FxafQsiY
 Nw3ED5oO1jjHdnfrpPmTuo13Gkt345cnpxFKBNKao3PFNMFGIuAPjErzjZFEYMd4qglN
 SlEO+SHcHYQ5EqkFm36am74vSVCSWgGU2j8IUMwAejr07hwQDVKRcd/Ng3CDv2G+2HuW
 v2xjeYb9xTZ2xECgyZfYFgt+J8aOt/YfZ/2H6a9WDt6emR1lgU8q9X8fHX+nqIiXaeCs
 x6bA==
X-Gm-Message-State: AOAM532n7bVAjPePQ+cbCEU1ZU3/0QvwYWrYGfODN8l4HpWfyH1/20Oh
 UrmqOSp+yqry8Yq6BkPuBDI=
X-Google-Smtp-Source: ABdhPJxF19Evm7s4ElEWSnMEPIT+yKJD5u0Z2LH2a7HoLDsA4tr5Oe1LO+xtXd43URi0nrJ5s8BxWg==
X-Received: by 2002:a05:600c:4a09:: with SMTP id
 c9mr8315517wmp.162.1623226169391; 
 Wed, 09 Jun 2021 01:09:29 -0700 (PDT)
Received: from ziggy.stardust (81.172.61.185.dyn.user.ono.com. [81.172.61.185])
 by smtp.gmail.com with ESMTPSA id v18sm24943781wrb.10.2021.06.09.01.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 01:09:29 -0700 (PDT)
Subject: Re: [PATCH v4] thermal: mediatek: add sensors-support
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210608154530.70074-1-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <9eb45f06-1303-1438-7ba0-b9ccaa898b34@gmail.com>
Date: Wed, 9 Jun 2021 10:09:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210608154530.70074-1-linux@fw-web.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_011031_237483_0CDC31F9 
X-CRM114-Status: GOOD (  17.81  )
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



On 08/06/2021 17:45, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> add HWMON-support to mediateks thermal driver to allow lm-sensors
> userspace tools read soc temperature
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> v4: change message to dev_warn as suggested by matthias
> v3: drop no_hwmon
> v2: drop ifdef and used devm_thermal_add_hwmon_sysfs
> ---
>  drivers/thermal/mtk_thermal.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index 97e8678ccf0e..ede94eadddda 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c
> @@ -23,6 +23,8 @@
>  #include <linux/reset.h>
>  #include <linux/types.h>
>  
> +#include "thermal_hwmon.h"
> +
>  /* AUXADC Registers */
>  #define AUXADC_CON1_SET_V	0x008
>  #define AUXADC_CON1_CLR_V	0x00c
> @@ -1087,6 +1089,10 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>  		goto err_disable_clk_peri_therm;
>  	}
>  
> +	ret = devm_thermal_add_hwmon_sysfs(tzdev);
> +	if (ret)
> +		dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
> +
>  	return 0;
>  
>  err_disable_clk_peri_therm:
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
