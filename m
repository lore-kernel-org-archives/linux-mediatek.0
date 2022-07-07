Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF975C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 08:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iEpJ0Faa5HinvvV8LbrdCivzlY1w4WWTlez8JQQ0Tqw=; b=UNFRUsnbWGM7LImFU3mXuyWRLq
	KRD12qQbqmD4bjK8pMBQRckDrST4xkm8kY2OYUNIKxOyavcZtf/6RBQQgln7s3TMnrL7tac0nqwM/
	w3ltftz4uLrLzYbfcw47pkj0x2tpmsysBBPi6y/47VK0kAi0u3prtuBW3CUUOE3HR6rjs0Fk7f+FE
	wThNqtaBylo+F0vutthl2RnNRbgXZbp3Py2kL+0s/X3SKVJvICClA7WeJL0VgUSuOyscvu28S0omX
	lGk9Dii1g2xqyplb9JYb2UNscoQJPy3h1l3zX/ht3JMPZQBcM7rWIbHnWdltrlwm339/15ZUDljwr
	+XHCy/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Mup-00FDJc-Pc; Thu, 07 Jul 2022 08:31:15 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9Mun-00FDIT-Mb
	for linux-mediatek@lists.infradead.org; Thu, 07 Jul 2022 08:31:15 +0000
Received: by mail-wr1-x432.google.com with SMTP id v14so25251057wra.5
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Jul 2022 01:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iEpJ0Faa5HinvvV8LbrdCivzlY1w4WWTlez8JQQ0Tqw=;
        b=hDhr2Tsswdl0BgVCFzv2nbBSNGEEsvCRgOaBeLa7ElSnrfaBGZCSrSKOHMigXxUaRk
         Akg9tzuYKLrHHONclkQqdFIXwhQKKxlMjJ3x92IiyTXMiGQh5ClJR+X8HJ6MFnqL7hJq
         bkNIzrg6ymYGWNME2LrM1NfWvzQuI0PzcZhJ54BhJxKve+tR5c9ZUBDG5fpoEo4B0frc
         J4JDS7EqAAvcdBXyvUojXo5KjIetPZMxlw4xm7JXC5MrH8ghwSCtzTitLyfYZP4qC9aU
         c/mxtj+SAMLb8Ec4iWiDp64ygRxvgZ0BSxzRKGZrEAa0V+AGbvnUKlOFasa16QFEHzv2
         HqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iEpJ0Faa5HinvvV8LbrdCivzlY1w4WWTlez8JQQ0Tqw=;
        b=ap43xrgtTxChi26wiWGGOLszfJbiM0MgdQDG+M4/z2fMKZAT83slSKQiwL64Y/W3ul
         ZT//7NiCaPX0Rjty5Bj9fjywDnCxRvKBvH3+4UvzXCvFK7qRrohR5qiPLnBUoEescZ7U
         ZwiTUqdf/6XaRS6/7OVK6Cm/dIudoq8BRnfxTGtuix0w2q50tZRP+9OyJwRGYmeCshoR
         C3JSKT1/43d+YO+C1qrkcIfy3O9Tse6EOQ5XWBJiU9lx7WX14mIfdq5F64we0M1vmge3
         uRBY1K57ShPdWOFFA87nGOGoBX2nR6l4k8FQQxwEeG7i+s+mwpHRo8zrwOan0jjCFHp/
         Agjw==
X-Gm-Message-State: AJIora9VWdnBWo/4UTA/DwCJZk9tmKb3TZfDwXrrSO170wCXFe6EQ+fv
	HeIFayhy3P4CXeQkPlqVGm9pbQ==
X-Google-Smtp-Source: AGRyM1sMvogXLR0SM3XrhPZifE5icXaMEbUXIgBNN7AIe+ZKwqUr0Lzy8U6Gveurz7cEokhdBJW4qw==
X-Received: by 2002:a05:6000:178d:b0:21d:7de8:de76 with SMTP id e13-20020a056000178d00b0021d7de8de76mr7010531wrg.624.1657182671527;
        Thu, 07 Jul 2022 01:31:11 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id v3-20020adfedc3000000b0021d76a1b0e3sm6116552wro.6.2022.07.07.01.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 01:31:10 -0700 (PDT)
Message-ID: <9b4bd8b5-d5d9-7f75-128a-87b727ad0bd7@linaro.org>
Date: Thu, 7 Jul 2022 10:31:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/4] PM: EM: convert power field to micro-Watts
 precision and align drivers
Content-Language: en-US
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Cc: amitk@kernel.org, rui.zhang@intel.com, viresh.kumar@linaro.org,
 rafael@kernel.org, dietmar.eggemann@arm.com, nm@ti.com, sboyd@kernel.org,
 sudeep.holla@arm.com, cristian.marussi@arm.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20220707071555.10085-1-lukasz.luba@arm.com>
 <20220707071555.10085-2-lukasz.luba@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220707071555.10085-2-lukasz.luba@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_013113_829451_FA6E8B07 
X-CRM114-Status: GOOD (  14.76  )
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

On 07/07/2022 09:15, Lukasz Luba wrote:
> The milli-Watts precision causes rounding errors while calculating
> efficiency cost for each OPP. This is especially visible in the 'simple'
> Energy Model (EM), where the power for each OPP is provided from OPP
> framework. This can cause some OPPs to be marked inefficient, while
> using micro-Watts precision that might not happen.
> 
> Update all EM users which access 'power' field and assume the value is
> in milli-Watts.
> 
> Solve also an issue with potential overflow in calculation of energy
> estimation on 32bit machine. It's needed now since the power value
> (thus the 'cost' as well) are higher.
> 
> Example calculation which shows the rounding error and impact:
> 
> power = 'dyn-power-coeff' * volt_mV * volt_mV * freq_MHz
> 
> power_a_uW = (100 * 600mW * 600mW * 500MHz) / 10^6 = 18000
> power_a_mW = (100 * 600mW * 600mW * 500MHz) / 10^9 = 18
> 
> power_b_uW = (100 * 605mW * 605mW * 600MHz) / 10^6 = 21961
> power_b_mW = (100 * 605mW * 605mW * 600MHz) / 10^9 = 21
> 
> max_freq = 2000MHz
> 
> cost_a_mW = 18 * 2000MHz/500MHz = 72
> cost_a_uW = 18000 * 2000MHz/500MHz = 72000
> 
> cost_b_mW = 21 * 2000MHz/600MHz = 70 // <- artificially better
> cost_b_uW = 21961 * 2000MHz/600MHz = 73203
> 
> The 'cost_b_mW' (which is based on old milli-Watts) is misleadingly
> better that the 'cost_b_uW' (this patch uses micro-Watts) and such
> would have impact on the 'inefficient OPPs' information in the Cpufreq
> framework. This patch set removes the rounding issue.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

