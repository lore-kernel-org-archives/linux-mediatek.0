Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A0BC76196
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Apr 2023 20:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RaeiX9EdxQ+G9xoCkZsd12/NSVD20AWdIKnmJIXd8HY=; b=iDhl9KRNCabHnvrAu1XuJlywMl
	msOj/TIrORxTb3vfh9Ze4N0jWqPr5gV96VVn/cE6idBXECBy5JMfadclpVxi0AhmjSj23Za9UdQpC
	GswYKPV//Cy8nmTFuqsTWws2Krato+rPC/hxRzj1tFaV0Ax/yVAG13euErVtPb9nnibWTK6JfdCQC
	oyejBGlfDaPdXg6BZxX0ql5kji87DH6JOJKvvXxo8Dw2iXLwlMY9fNuGI2jY8wdWsAUqkO4VTE6Da
	9oWDHYq91jv5JNKhr01HKdmcLw5s1nx9akD/gdUHVtUzfY5RIoxw9K2kXV/pgQLaa657B1gu17xN6
	Xm0AbFuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pihzL-00BGyd-1s;
	Sat, 01 Apr 2023 20:38:15 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pihzJ-00BGxs-1W
	for linux-mediatek@lists.infradead.org;
	Sat, 01 Apr 2023 20:38:14 +0000
Received: by mail-wm1-x330.google.com with SMTP id l37so14867024wms.2
        for <linux-mediatek@lists.infradead.org>; Sat, 01 Apr 2023 13:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680381491;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RaeiX9EdxQ+G9xoCkZsd12/NSVD20AWdIKnmJIXd8HY=;
        b=UvHq6rgsoUw5HQ+32mAlR47rUiWddxfGMkG7EsJPaUAFivKjA3JQI6Tr3zV/LiBDhW
         UpMHoqcSw2J5W37BJk94by64Ft0EgzYdogXx2fovMjwAV51c0qBccG/xoyROXPnrpBUJ
         Rh85eitRQQ0CSiw2iqP8ESbGCsNC6hS5j6jrUJFDW65y7m7ebWt0g1L3xpOiN+oMTpoo
         k/qnYZeCLyWgtGcd5nCiyLj5MWO0tVH6F0PIocO1w1PYOqrSH4FWTlA0TjF52z1HWIKk
         d+Jq+5PHuzk83HOgIs+5TfLA2LhTQIko80I/Oat3LfoyleCZfNodfGod1wJFPa60Gf4t
         iPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680381491;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RaeiX9EdxQ+G9xoCkZsd12/NSVD20AWdIKnmJIXd8HY=;
        b=6HCg0q4ecVSGrdNPhqjQGDMYFyeKH4r69k8XkyR/OqZDdfsVZUNQJDCH2HAVYPWscz
         gql5VI3BAPTmbhQSV1+zNSgFHX54lUt/4spJikwOlsiYAG+LBiwcljlINXcKcAy0jkQ1
         X4mx3DnNKwDV/y9MSnZN7nCufNZmVosf3s8hTxXOkNaqkKw3alC3AKFFSHUZIhdaMD63
         siCH0gxzkrNj3QkvEpz9wTWl0tHfnSuok81iv9jnxz2PGyL0W6jSF0/60b/du5E7sMad
         FlWaxXQaGGfRi819SOuAbdI3dysgj6MBoCoFW4IG8BbLNel89QSI56/hGCYxNEtGTfRx
         383Q==
X-Gm-Message-State: AO0yUKWEON9+czzH92Maa+BPr14YB8Qcs1rRTqfvhHXAQTXmkIcgeJxn
	yoiGsG/EkpYuJi+zvsS4ZfRG7g==
X-Google-Smtp-Source: AK7set+piPx/xqNwNWikmQSUIScX7VtS1tyyyibUMrga0PeSsXZPDOGRRgUpJYh4AX6OWPTmKTtyYA==
X-Received: by 2002:a05:600c:2283:b0:3eb:3104:efec with SMTP id 3-20020a05600c228300b003eb3104efecmr23097598wmf.16.1680381491524;
        Sat, 01 Apr 2023 13:38:11 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:b36a:1186:309c:1f9a? ([2a05:6e02:1041:c10:b36a:1186:309c:1f9a])
        by smtp.googlemail.com with ESMTPSA id t23-20020a1c7717000000b003edcc2223c6sm7089922wmi.28.2023.04.01.13.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Apr 2023 13:38:10 -0700 (PDT)
Message-ID: <0234d87e-1980-51d9-1656-70f7f7058af4@linaro.org>
Date: Sat, 1 Apr 2023 22:38:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Fix sensor 1
 interrupt status bitmask
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Balsam CHIHI <bchihi@baylibre.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230328031017.1360976-1-wenst@chromium.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230328031017.1360976-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_133813_510390_11837201 
X-CRM114-Status: GOOD (  11.72  )
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

On 28/03/2023 05:10, Chen-Yu Tsai wrote:
> The binary representation for sensor 1 interrupt status was incorrectly
> assembled, when compared to the full table given in the same comment
> section. The conversion into hex was also incorrect, leading to
> incorrect interrupt status bitmask for sensor 1. This would cause the
> driver to incorrectly identify changes for sensor 1, when in fact it
> was sensor 0, or a sensor access time out.
> 
> Fix the binary and hex representations in the comments, and the actual
> bitmask macro.
> 
> Fixes: f5f633b18234 ("thermal/drivers/mediatek: Add the Low Voltage Thermal Sensor driver")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


