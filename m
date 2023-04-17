Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5359C77B70
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 09:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcr5YmlYoVcdrEFDHra0XuIJQfELMbNwudSm2TRrzow=; b=3HeVzbCLYaR/lQwZSlo+ICI/Bj
	Ed7Znyy+4q7Ky0N+5Lc1Kf3khHZkSnJIsrjUWDl3KCaBv9O2L/muG/XgY04lnOdrP6xNEKUhupfAB
	Z4uzutOq6dqVSj4ARZgzH47SJ5GQxZdm/CTA3Xt3CKol2HMB5en1hL4BkR7M+RWlnOMQXAUbK6c6k
	Ei8ZON9Vo6obmPy+kHqWyonEpR8IRrR1MNdVJXECmrdwHrS2skzGQW6QLF8j5gw5vxHM+Be2wfGH4
	3YbQMN2sd8+Ux8f4B+2TDjukz6hsghui7mhIx6dpySLcuZU8KyGiu14zFGSQbb1ZfikvrGanduUKl
	tKsl4hng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poLXZ-00FdQs-1g;
	Mon, 17 Apr 2023 09:52:53 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poLXU-00FdPe-2G
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Apr 2023 09:52:52 +0000
Received: by mail-ej1-x62a.google.com with SMTP id fy21so19561687ejb.9
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Apr 2023 02:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681725167; x=1684317167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gcr5YmlYoVcdrEFDHra0XuIJQfELMbNwudSm2TRrzow=;
        b=hNQPAeO7roIO6GhA/CDHT/L+bHgrIpMw4KHbMpBZt+dcE0MT6BRNLElolGrIjj06uL
         v0oeBt2oeiJD/PcMLXUpALj+R/gjciFhBbDSBvlWc8jurdVgST8yMwJAQqDf0jj7nRYO
         2obf9bHKgUan3lsRWrvnkF+95LCpROpb5aXOe9LtCYeUutwNJGuZfA2boOJbSjgrno/r
         S0TiHu7by/zGq+suQPr8zXNBbbpY9ECY3eskJjihRzEdLZFeJE9hthxtuNd70b/ERSss
         E2FPAGCAq38un6VzIXUF3v1w8vuPdlW7XlAX2+HFWQ/pS1QVSD6w5AP9qkBT9NISEGzP
         u//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681725167; x=1684317167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gcr5YmlYoVcdrEFDHra0XuIJQfELMbNwudSm2TRrzow=;
        b=HUxGr8LUZsSjXpy7Qb4fKRinC0CGV7j0qGQYW2QZEEL6kcE2UInlK/uBY7ipyHuLOq
         3Jn9tocCYzPHXftb2MKTErKaBgHz4GlQJodEJDqyTgYjvghHcObnKhLGwKLw1KstXz0N
         mXjIdfe1YgaulCdq1yA5zXKAYGjbMcwGsELggTj8O5RkXk3Skk7NW8Q5wzSbot4CHhww
         7q++n2XXKbYn33kLY09e4m9QNRW/2fevYghDBzdbfXKRkxa9DsuRmSvWKj2u/R8zP7R2
         fS559TGd7I5rpz6gjZa1DvfGIXbDgoPFzvag0we5qDFvzKf85D80NIkCGoPUCtFMs980
         hMvQ==
X-Gm-Message-State: AAQBX9dcwRQp/zccEP2YaZo+xjw7wcyQjqhKm9dVuWxU1UKb19vBXGJS
	CeaRnAWPfDXMcJYNKfjCdHyuiQ==
X-Google-Smtp-Source: AKy350YsZx2nKFyEnXBZglFwnu+EZhMUrIcOvtxJAINOd9ys3x1JK5D6h749rW6LsTd/MCLy+Pzwlw==
X-Received: by 2002:a17:906:e2d4:b0:94e:8d26:f610 with SMTP id gr20-20020a170906e2d400b0094e8d26f610mr6489616ejb.28.1681725167046;
        Mon, 17 Apr 2023 02:52:47 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id h3-20020a170906530300b0093a0e5977e2sm6357961ejo.225.2023.04.17.02.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 02:52:46 -0700 (PDT)
Message-ID: <cfb7743b-03b0-96c4-fcc3-7095694f6fbb@linaro.org>
Date: Mon, 17 Apr 2023 11:52:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/2] thermal: mediatek: change clk_prepare_enable to
 devm_clk_get_enabled in mtk_thermal_probe
To: void0red@hust.edu.cn
Cc: amitk@kernel.org, angelogioacchino.delregno@collabora.com,
 bchihi@baylibre.com, daniel@makrotopia.org, dzm91@hust.edu.cn,
 error27@gmail.com, henry.yen@mediatek.com,
 hust-os-kernel-patches@googlegroups.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 matthias.bgg@gmail.com, rafael@kernel.org, rdunlap@infradead.org,
 rui.zhang@intel.com, void0red@gmail.com
References: <b2e5ef14-9a12-15d5-8016-d0994c1177c3@linaro.org>
 <20230411063531.3976354-1-void0red@hust.edu.cn>
 <20230411063531.3976354-2-void0red@hust.edu.cn>
 <4fed91ef.3c256.18783c407e3.Coremail.void0red@hust.edu.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <4fed91ef.3c256.18783c407e3.Coremail.void0red@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_025248_813677_F9BF72B0 
X-CRM114-Status: GOOD (  21.74  )
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


Hi,

this patch does not apply:

Analyzing 9 messages in the thread
Will use the latest revision: v3
You can pick other revisions using the -vN flag
Checking attestation on all messages, may take a moment...
---
   [PATCH v3 2/2] thermal: mediatek: change clk_prepare_enable to 
devm_clk_get_enabled in mtk_thermal_probe
     + Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
     + Link: 
https://lore.kernel.org/r/20230411063531.3976354-2-void0red@hust.edu.cn
---
Total patches: 1 (cherrypicked: 2)
---
  Link: 
https://lore.kernel.org/r/20230411063531.3976354-1-void0red@hust.edu.cn
  Base: not specified
Applying: thermal: mediatek: change clk_prepare_enable to 
devm_clk_get_enabled in mtk_thermal_probe
error: patch failed: drivers/thermal/mediatek/auxadc_thermal.c:1182
error: drivers/thermal/mediatek/auxadc_thermal.c: patch does not apply
Patch failed at 0001 thermal: mediatek: change clk_prepare_enable to 
devm_clk_get_enabled in mtk_thermal_probe
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".



On 15/04/2023 09:14, void0red@hust.edu.cn wrote:
> 
> 
> 
>> -----Original Messages-----
>> From: "Kang Chen" <void0red@hust.edu.cn>
>> Sent Time: 2023-04-11 14:35:31 (Tuesday)
>> To: daniel.lezcano@linaro.org
>> Cc: amitk@kernel.org, angelogioacchino.delregno@collabora.com, bchihi@baylibre.com, daniel@makrotopia.org, dzm91@hust.edu.cn, error27@gmail.com, henry.yen@mediatek.com, hust-os-kernel-patches@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, matthias.bgg@gmail.com, rafael@kernel.org, rdunlap@infradead.org, rui.zhang@intel.com, void0red@gmail.com, void0red@hust.edu.cn
>> Subject: [PATCH v3 2/2] thermal: mediatek: change clk_prepare_enable to devm_clk_get_enabled in mtk_thermal_probe
>>
>> use devm_clk_get_enabled to do automatic resource management.
>> Meanwhile, remove error handling labels in the probe function and
>> the whole remove function.
>>
>> Signed-off-by: Kang Chen <void0red@hust.edu.cn>
>> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
>> ---
>> v3 -> v2: remove some useles func calls.
>> v2 -> v1: init
>>
>> Notice the devm_clk_get_enabled do the clk_get and clk_prepare_enable
>> at the same time.
>> I'm not sure if this has any side effects in initialization.
>>
>>   drivers/thermal/mediatek/auxadc_thermal.c | 48 +++++------------------
>>   1 file changed, 10 insertions(+), 38 deletions(-)
>>
>> diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
>> index 3372f7c29626..995837ce3ea2 100644
>> --- a/drivers/thermal/mediatek/auxadc_thermal.c
>> +++ b/drivers/thermal/mediatek/auxadc_thermal.c
>> @@ -1116,14 +1116,6 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>>   
>>   	mt->conf = of_device_get_match_data(&pdev->dev);
>>   
>> -	mt->clk_peri_therm = devm_clk_get(&pdev->dev, "therm");
>> -	if (IS_ERR(mt->clk_peri_therm))
>> -		return PTR_ERR(mt->clk_peri_therm);
>> -
>> -	mt->clk_auxadc = devm_clk_get(&pdev->dev, "auxadc");
>> -	if (IS_ERR(mt->clk_auxadc))
>> -		return PTR_ERR(mt->clk_auxadc);
>> -
>>   	mt->thermal_base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
>>   	if (IS_ERR(mt->thermal_base))
>>   		return PTR_ERR(mt->thermal_base);
>> @@ -1182,16 +1174,16 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		return ret;
>>   
>> -	ret = clk_prepare_enable(mt->clk_auxadc);
>> -	if (ret) {
>> -		dev_err(&pdev->dev, "Can't enable auxadc clk: %d\n", ret);
>> -		return ret;
>> +	mt->clk_auxadc = devm_clk_get_enabled(&pdev->dev, "auxadc");
>> +	if (IS_ERR(mt->clk_auxadc)) {
>> +		dev_err(&pdev->dev, "Can't enable auxadc clk: %d\n", mt->clk_auxadc);
>> +		return PTR_ERR(mt->clk_auxadc);
>>   	}
>>   
>> -	ret = clk_prepare_enable(mt->clk_peri_therm);
>> -	if (ret) {
>> -		dev_err(&pdev->dev, "Can't enable peri clk: %d\n", ret);
>> -		goto err_disable_clk_auxadc;
>> +	mt->clk_peri_therm = devm_clk_get_enabled(&pdev->dev, "therm");
>> +	if (IS_ERR(mt->clk_peri_therm)) {
>> +		dev_err(&pdev->dev, "Can't enable peri clk: %d\n", mt->clk_peri_therm);
>> +		return PTR_ERR(mt->clk_peri_therm);
>>   	}
>>   
>>   	if (mt->conf->version != MTK_THERMAL_V1) {
>> @@ -1215,38 +1207,18 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>>   
>>   	tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
>>   					      &mtk_thermal_ops);
>> -	if (IS_ERR(tzdev)) {
>> -		ret = PTR_ERR(tzdev);
>> -		goto err_disable_clk_peri_therm;
>> -	}
>> +	if (IS_ERR(tzdev))
>> +		return PTR_ERR(tzdev);
>>   
>>   	ret = devm_thermal_add_hwmon_sysfs(tzdev);
>>   	if (ret)
>>   		dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
>>   
>>   	return 0;
>> -
>> -err_disable_clk_peri_therm:
>> -	clk_disable_unprepare(mt->clk_peri_therm);
>> -err_disable_clk_auxadc:
>> -	clk_disable_unprepare(mt->clk_auxadc);
>> -
>> -	return ret;
>> -}
>> -
>> -static int mtk_thermal_remove(struct platform_device *pdev)
>> -{
>> -	struct mtk_thermal *mt = platform_get_drvdata(pdev);
>> -
>> -	clk_disable_unprepare(mt->clk_peri_therm);
>> -	clk_disable_unprepare(mt->clk_auxadc);
>> -
>> -	return 0;
>>   }
>>   
>>   static struct platform_driver mtk_thermal_driver = {
>>   	.probe = mtk_thermal_probe,
>> -	.remove = mtk_thermal_remove,
>>   	.driver = {
>>   		.name = "mtk-thermal",
>>   		.of_match_table = mtk_thermal_of_match,
>> -- 
>> 2.34.1
> 
> ping?

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


