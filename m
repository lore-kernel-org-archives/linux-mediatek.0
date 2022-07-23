Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62030C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jul 2022 17:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/VzrMn8IRoR/XUw2GaIkz6W+3AiZWGAF5ssto6LX8c=; b=lOVS2wZ//yKZQDN0uUj7actOQ3
	4idy3bCDeJppqklWAHxwZkwDf40ezIgeEdYnZEEHRTwfiCsCc38gjYAHA/hDUUxDWfGXueivpipre
	3YxbqYPCP89z4Uw5nTzovp0RyA4LKju7A1WeeR34DtFOkqNPpBae4H5jni9/McMuM1SB+kVh7EAXN
	oCd/GTkgonyQdIZzxelTO0Ru5DJNSOM3XjEWxmtvxC8S73xW9ew6mXMUbqUh2JtGfg5tt4JdDJAql
	sqdDcF25wzqyfjK6su1ecyszPNXeTheLAjZqkwpCgfw6zy272X1mgBM7nIyDBYoQlQOd3/ElVEiXj
	YNNskdWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFIzn-0061Mb-Q8; Sat, 23 Jul 2022 17:32:55 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFIzl-0061Ki-3k
	for linux-mediatek@lists.infradead.org; Sat, 23 Jul 2022 17:32:54 +0000
Received: by mail-lj1-x230.google.com with SMTP id b34so3500577ljr.7
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Jul 2022 10:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=x/VzrMn8IRoR/XUw2GaIkz6W+3AiZWGAF5ssto6LX8c=;
        b=xgtnl3PPZqZRZyGiYh7t2imdcj4sSnzXczgHwKS8ckUS1IUCukpgRcY9SqKF7LynXi
         puuEHvJ2iLcVMM47QKj/jsDAlUvu6jFI+0TnPjsxr13Q6f/XacJPb9W9jw9RsO7PT1IH
         oEC8gCBQI+AWCpm8CB+Td3p7FLy0kE+5DwxmEIGZVPxsJsNXW40wnHfokUctKLrqle1h
         fpsLl/mpXpS/VeinwjnS3wMeSZQ4AWftDqgw81r7BE8hldMpfN/8KhuO+i2O7ZKQWuQX
         SDyRRcrlO7/ID4hvNtchMJ9vXSBZP/Bvzfq4blcVqaG3glnoFCcbqosqEirGQmTQJwyB
         SVgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=x/VzrMn8IRoR/XUw2GaIkz6W+3AiZWGAF5ssto6LX8c=;
        b=6Y/5/qc271rS3vOSwjs700jM85SKJEzQPCBnFHzDCd5a4WM9+pl+nwtfunQse5HgwX
         U290w9IQB3p/nloTA5W7cBh5utFnF8mfVq+4MfcGh6/vp0jHvNkms1D5q6hKFeLf2V6p
         ZtmcCT+j3tDuR8oPKfUi6nYveBbnpk3z2+vDuPM/eWJbkZV5lojLUrrGL+XWFfQ4jqdq
         GLIAhEMiqsRfoK9qUmVXYiTUay4aKYuxmvBy7G92RX7Zc0+d7xSmtb46qZSFNo+yo6yo
         j49c6MD+nM6oytX6Mdj1JnExtzPwVBhe4+4oQa6cBEhh/XEjNElW5BMR9IwdgmCk5C7C
         hjJQ==
X-Gm-Message-State: AJIora+0RE+DEDNP565CdW5V1K9i3xi1F2T1sX2WTqy2sxj7R+3SVXbq
	oNYJL6ANYYsaAOM4iZOIYnNfZg==
X-Google-Smtp-Source: AGRyM1sEVLBhf0FP/hJuoN3w9Mu0qolkvPJs5Kd7aIL1sOqGbzFi73wXw0ZOQDoqGnNjSehK/o0iPg==
X-Received: by 2002:a2e:82c6:0:b0:25d:eef5:8096 with SMTP id n6-20020a2e82c6000000b0025deef58096mr1763269ljh.201.1658597571541;
        Sat, 23 Jul 2022 10:32:51 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id u11-20020a056512128b00b004875a37b7b7sm1736514lfs.159.2022.07.23.10.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jul 2022 10:32:51 -0700 (PDT)
Message-ID: <875d6856-dea4-e1ff-60b3-706cf00f8bb9@linaro.org>
Date: Sat, 23 Jul 2022 19:32:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] memory: mtk-smi: Add enable IOMMU SMC command for MM
 master
Content-Language: en-US
To: "Chengci.Xu" <chengci.xu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 srv_heupstream@mediatek.com
References: <20220723031955.12552-1-chengci.xu@mediatek.com>
 <20220723031955.12552-3-chengci.xu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220723031955.12552-3-chengci.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220723_103253_199351_18ABE15E 
X-CRM114-Status: GOOD (  11.23  )
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

On 23/07/2022 05:19, Chengci.Xu wrote:

Thank you for your patch. There is something to discuss/improve.

>  #endif
> diff --git a/include/soc/mediatek/smi.h b/include/soc/mediatek/smi.h
> index 11f7d6b59642..76093b856335 100644
> --- a/include/soc/mediatek/smi.h
> +++ b/include/soc/mediatek/smi.h
> @@ -8,6 +8,15 @@
>  
>  #include <linux/bitops.h>
>  #include <linux/device.h>
> +#include <linux/arm-smccc.h>
> +#include <linux/soc/mediatek/mtk_sip_svc.h>

The headers do not look like used here. Include only relevant headers.

> +
> +/* IOMMU & SMI ATF CMD */
> +
> +enum IOMMU_ATF_CMD {
> +	IOMMU_ATF_CMD_CONFIG_SMI_LARB,		/* For mm master to en/disable iommu */
> +	IOMMU_ATF_CMD_COUNT,
> +};
>  
>  #if IS_ENABLED(CONFIG_MTK_SMI)
>  


Best regards,
Krzysztof

