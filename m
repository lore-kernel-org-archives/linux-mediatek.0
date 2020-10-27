Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DFCC4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 10:11:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77A6D21D24
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 10:11:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FR7Jcby5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHFZ9R6N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77A6D21D24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JuWOCOEjd86iKGyB0bLrdvuVkg2hP38LgLZCZ6/CUII=; b=FR7Jcby5FV0516nBuywhPzEQz
	WFH/wB8XMFI6uwxDUbcxANSfNauxThqaord5KDC4h9ewLVhfe7+YAEoSsbwJa+E6ADEjCK4VYqCiR
	Pnnm8TNabhx1pxdbAFSGh93fq/B1S5oGDBzQPwt2jDyXuWJvjtxLPkj3oqSLw84FwdtrWXLYdyAjs
	18Yj7oXwYATYZxke7GVBCq9MoPlOLEniWFgzGfUFkjZOECXwhKTjXVtaNFtkeRU0ObCmv7nSsLkTo
	pP/mgt/6RgWtcPNs1WDpgceLROth8iohySwlB0XXXX0S298sa44yC8WxwUcJUvhIHmauIvOS3Pyty
	rjmNvmYNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXLwe-0002Es-Fq; Tue, 27 Oct 2020 10:11:12 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXLwX-0002CV-Fc; Tue, 27 Oct 2020 10:11:09 +0000
Received: by mail-wr1-x442.google.com with SMTP id e17so1158064wru.12;
 Tue, 27 Oct 2020 03:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DObrNorW8fXGsQynBmTwK5pAsWwCn0bs0/pvbbcTgUc=;
 b=AHFZ9R6NEbnDzOhxmUMC0hSZKwzYrpWItsikqA07XSSbJlJRoQWeyMDI1T2mjrcmI2
 qkVDe8IX2PSqVVAMFOng7ENsusWvdwhHeT8oivK7VxTIf37T0vv+xk2KgjEvnnqpCvMY
 xgXHPiaWgGXiLwD9zS55RVRgWzdX8aDXmddDqVuOlKo8uZo3aw0jGyxYSydYtOBBSaJx
 MllTTABXjHCtGLUMwZPPUl7q530Bw8zJSK4CvXmUL/Y5P1Z9q8SttGAlz05JK0CeadmD
 phBJFE4DERxjEx22zJ3+x8fuCGWYS3++EtRMDRqKtrKSX4oOltqf7WkjezI5tydSjJcU
 kbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DObrNorW8fXGsQynBmTwK5pAsWwCn0bs0/pvbbcTgUc=;
 b=C61H2cb6KmtIpaAfjth5KkI10dh9jYS8fcd1sJmszvwrMcqHu78vAyTDycaaUPI/DV
 cbOBBn0AOE56ZAdq/TPSYV3Suw4f0jSw3iKNd8c9kH29yLoZ4kQ6ZSCVrkf7bcBbREsp
 UE7X1q8vZGgURea5twKJo9Hu7yjvV+BqzI5jY1rpEVCiPCb+At5cvT9MtJnj5keFhul5
 HT4UOivK56DASkYIMqWGVVEGQ5zlAmqWhuKhGoPAzHJ5yJu36xz39gS/jwoOZfc2PjhR
 xK9A1fG/zK3x3OZlbNDAXteeP6nHlznTFt+dHAHiLXu/7KsKeuH3aGIvgvXcVnsDtVH3
 CaXQ==
X-Gm-Message-State: AOAM530F/AY4dttHW9iGjdmPjtRIahBnnQjKcGGH8qnOrV8DAsXN/OCH
 bLJ4JLhLEQu8Q+cmo126Lxg=
X-Google-Smtp-Source: ABdhPJwVwSFFsalOX6ObUB0OpSjsPedl8DAEpWCB0mQnIokTahpjUeij1x/ZbLbGqXoThegjbSzNng==
X-Received: by 2002:a5d:4ccd:: with SMTP id c13mr1879989wrt.221.1603793463075; 
 Tue, 27 Oct 2020 03:11:03 -0700 (PDT)
Received: from ziggy.stardust ([213.195.117.206])
 by smtp.gmail.com with ESMTPSA id j13sm1395863wru.86.2020.10.27.03.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 03:11:02 -0700 (PDT)
Subject: Re: [PATCH 3/3] thermal: mtk_thermal: make device_reset optional
To: Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org
References: <20201021164231.3029956-1-fparent@baylibre.com>
 <20201021164231.3029956-3-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <3edf970c-0435-3e8f-b262-4cc954032d53@gmail.com>
Date: Tue, 27 Oct 2020 11:11:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201021164231.3029956-3-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_061105_566553_DBF30535 
X-CRM114-Status: GOOD (  18.78  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: amitk@kernel.org, rui.zhang@intel.com, robh+dt@kernel.org,
 daniel.lezcano@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 21/10/2020 18:42, Fabien Parent wrote:
> MT8516 does not support thermal reset. Use device_reset_optional
> instead of device_reset.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/thermal/mtk_thermal.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index 0bd7aa564bc2..149c6d7fd5a0 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c
> @@ -1052,7 +1052,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	}
>   
> -	ret = device_reset(&pdev->dev);
> +	ret = device_reset_optional(&pdev->dev);
>   	if (ret)
>   		return ret;
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
