Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB47BC47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 14:15:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB08B61078
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 14:15:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB08B61078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wDFVdgZLCgmywy5oNgNBA5FFIXb0BRpNAp5cWd9k0f0=; b=DNQItXOUo/xKhx/HxVOQM+zq2s
	rP1/1ntqUNlLngmOTyIDSiHTebwA1losXAxFk04LMBAK1LN1Ml8DzOOGgDuTlbqeF8tJK3IPTTzYB
	G17V0ig6rUKTU4QWa9Kq494iC7kQnGXlOmA6pESRf3oV6XkJmqwQy5dTyoxAXPbiokQncJh+Csc6+
	LGpP3BmIjmmEDXt52HnVnoDTHkhL4+k71C8hTfcWrPPJmNULkY/TQDcPM2S53w5rrhSiDLDdgEtfn
	pe5eImEOyuqtK0JwTUx682g0aisXW6nqI+ed1ZBjUKLI/PpveIBtMFlI2jGB19C6FyecvGhuQtn6F
	1PIVFYVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqcVh-008pZ9-6k; Tue, 08 Jun 2021 14:15:17 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqcSk-008ncL-DR; Tue, 08 Jun 2021 14:12:15 +0000
Received: by mail-wr1-f50.google.com with SMTP id m18so21766360wrv.2;
 Tue, 08 Jun 2021 07:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QN+EdKzoWLP2CkjUZ6p50v7bzf6RSbEoChR/qB42S2M=;
 b=Y0ElOsfMlfn3oQVhrjMka5+BB71sz0UqnqGojDryyCKaNV4tvyv5lXEUdW7+Ve0p0j
 gyJ6YSW1nZ05z0+pdsY3GTSyHNaSSdN4/Ab1N+6+5P7P1NcT0Zh2VyIwxSxDybZRrs7x
 +Nr/NCN4a5ekwZ9xtNRJm9PwJHQHSu3/xMZLPbZRU7KTGaocWIqOHRtA5Q2pmRx0Q5e1
 MJE348wtJ/nYwf1z/OFORnPQcks3uvNX18SKP3cW87D5hAMWsK6Xp+3zgaU1a0cw09Xv
 BThBW7Ufue7YQlpHodp/24H0cK6dEi1pnNFOfUt3Rgcbk4nAJtqGCrmq3RweXnsDM/r9
 n/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QN+EdKzoWLP2CkjUZ6p50v7bzf6RSbEoChR/qB42S2M=;
 b=fUfDCQwJlqa++IssdvaviQBtmcJ5uundIzizhFC5rxljvqKsaL+qe+jQlWxVXCA6mc
 4v/E1lFhYGE7sZMyyvAPPFU8k947qAY1KmMKg765a7LiYMEmxKCqW4DXv6N/otHnSQ6y
 qWWWGZAi1bP7LTyg2176auLF+gKatO4eDBWZUI9RBcsPFvX28mPHUpChS6SwU8aCERES
 xxlKDUTd9huy5fNmqpXLaJ+1q6ZLVNyTr8dQ9UExfqHPCeiYrBTJY3B4jdzZVZxKInST
 fy1Mncf/wzE6UgRZTZ2KHlLBO2fA3Da8pU42ZJh4rvOuL6evYIVl8qjSh6DDfJuN60BP
 rmHw==
X-Gm-Message-State: AOAM531sZZonEdMLs7cmw3VtSJXwLbk1YKHM93bcg5on+kElLjxcUTOU
 Pe55zPcmQj0Ro4mnYpxvWb0=
X-Google-Smtp-Source: ABdhPJwqR8NMrIwZzkzg1wJTkhrSFvimCcaJhT2bLhkbvZckf6DyzC3fxY9/pwgERvcsc68jdjXVkQ==
X-Received: by 2002:a05:6000:2a3:: with SMTP id
 l3mr23222967wry.395.1623161472462; 
 Tue, 08 Jun 2021 07:11:12 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id n9sm18534552wmc.20.2021.06.08.07.11.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 07:11:12 -0700 (PDT)
Subject: Re: [PATCH v3] thermal: mediatek: add sensors-support
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210420172308.134685-1-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e164df94-ef34-8560-ab8f-f0519d632b22@gmail.com>
Date: Tue, 8 Jun 2021 16:11:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210420172308.134685-1-linux@fw-web.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_071214_544197_36CEC59D 
X-CRM114-Status: GOOD (  18.43  )
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



On 20/04/2021 19:23, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> add HWMON-support to mediateks thermal driver to allow lm-sensors
> userspace tools read soc temperature
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v3: drop no_hwmon - now really, sorry
> v2: drop ifdef and used devm_thermal_add_hwmon_sysfs
> ---
>  drivers/thermal/mtk_thermal.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index 149c6d7fd5a0..85964988684b 100644
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
> +		dev_err(&pdev->dev, "error in thermal_add_hwmon_sysfs");

I think dev_warn() is more appropriate here.

Regards,
Matthias

> +
>  	return 0;
>  
>  err_disable_clk_peri_therm:
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
