Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FBFC6FD1C
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 10:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIqRqJQWxyWyp+7pWTYPje+scwaftD+oSHprfH2ssSw=; b=KUN+afy5nsSnyRWhVbM52HKUIK
	mfrIZbM3Ri174kSTBZlGNqayv0PcK4vuX05ztT+7xQfXeRFT7EfzBgKJ03ddi9zi303inePPU7Xy6
	2bu8Oxunn85ykZuD9gRasGAmH0IKMor8zzta9B9bACYRPmUCQH9fvGkYwQZYXRM7ebn84BizoUncQ
	j6oLLkJrGz7WZVHSS07fW+3nXCbmYHXaW602YVPoJMNqXfcjjr4kPUtUTW9cQxCoN3hL7rGe9HW9i
	Vjqg79CyZLC/x5zsCwUEfzYgtzaPHs8xshA3hZnqMUQAUNBGOI5YFm6fVBq8QfVFZvgE5jQYiFv4s
	D7OKsiHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbIYn-0024Kq-JT; Sun, 12 Mar 2023 10:04:13 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbIYf-0024JV-1T
	for linux-mediatek@lists.infradead.org; Sun, 12 Mar 2023 10:04:09 +0000
Received: by mail-ed1-x52a.google.com with SMTP id cn21so7368695edb.0
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 03:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678615440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RIqRqJQWxyWyp+7pWTYPje+scwaftD+oSHprfH2ssSw=;
        b=LwN1zyWcU+7gQx1gHeM0LZ6sL9jJ5FX9NnYNQp0itQFk17eu372cOAIxC8z+hmFoOZ
         ya/VO817mKfi1xinlpWmDvDFqDRjWxLg9AQjI5MFOqTEilbCmpqOEVqTj11bf62Aud0B
         mVq87JJ2nub44hMxXTv5h5yIaR6P1JI5b20AqvZNrJxruvm+v/esiuUfxl7AbDvCfBLA
         DkW5K+BEhitTJ0hqCQ1P1ZCGW/CG5/0J08Yp/XAOijhqa/TOIN7NzDacnWa9HmtFw/nR
         wFWyvY1LoTDOzQvtslVG1rqmHEg8xonBKClSY8G0ssNUiZKwutVTpWFoHkivNEpbiUHD
         PqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678615440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RIqRqJQWxyWyp+7pWTYPje+scwaftD+oSHprfH2ssSw=;
        b=zYhI6SFXa5LHPOx+Ty4em/M2QvopPR4HaH1S4edZ6vRerzuGla7TJvptuDDwVio/M7
         x84CaLOwMJjjg0Zp6lla5n+Hn++yuUqhkZKb9j6Dxh1pWeGsQLuZn21O0NCsRpDVYLoM
         lmy30oEGaOCJDfhtde2KyWvZpReY9lCXHHLDeHK6j3aP5N1+PblbjuNeIY8gjoyGD2jL
         ozUbilerC40Qf6uSQPinYlhsi8kEYSr8igGprAQ+JBqAYlKAcUKWAUUwF9D8x1kRIqjz
         /zoX6Uf2dRe4zMPnz8pWxuk/GqnMl7ixB1pqfkUwZ5WbpNF3AZAZ6JmiJmwpWJD3MgLu
         5Cpw==
X-Gm-Message-State: AO0yUKUrGwmS6aZzYjeaXQWBLK6YTGqvnaA0DozH+gVge+Xgm1cS2/hy
	3+5QxrWbtRj4nQ6XOcAAH4znng==
X-Google-Smtp-Source: AK7set9BNyklSZqUMLmjUu0BMV2qwFcaLVPC2rn+aSkSJjZmyq8uEhBBimKQ5IDtGdQHPDcEoYS4Pg==
X-Received: by 2002:a17:906:30c8:b0:8b1:4b6d:c57a with SMTP id b8-20020a17090630c800b008b14b6dc57amr5595353ejb.21.1678615440513;
        Sun, 12 Mar 2023 03:04:00 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d9f6:3e61:beeb:295a? ([2a02:810d:15c0:828:d9f6:3e61:beeb:295a])
        by smtp.gmail.com with ESMTPSA id x14-20020a1709060a4e00b008dd3956c2e3sm2057895ejf.183.2023.03.12.03.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 03:04:00 -0700 (PDT)
Message-ID: <b159616c-f665-42c5-6fbb-841de937d868@linaro.org>
Date: Sun, 12 Mar 2023 11:03:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/9] regulator: max20086: Mark OF related data as maybe
 unused
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tony Lindgren <tony@atomide.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230310214553.275450-1-krzysztof.kozlowski@linaro.org>
 <20230310214553.275450-2-krzysztof.kozlowski@linaro.org>
 <20230312094216.GC707@pendragon.ideasonboard.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312094216.GC707@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_030406_394606_D6E64450 
X-CRM114-Status: GOOD (  28.45  )
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

On 12/03/2023 10:42, Laurent Pinchart wrote:
> Hi Krzysztof,
> 
> Thank you for the patch.
> 
> On Fri, Mar 10, 2023 at 10:45:46PM +0100, Krzysztof Kozlowski wrote:
>> The driver can be compile tested with !CONFIG_OF making certain data
>> unused:
>>
>>   drivers/regulator/max20086-regulator.c:289:34: error: ‘max20086_dt_ids’ defined but not used [-Werror=unused-const-variable=]
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/regulator/max20086-regulator.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/regulator/max20086-regulator.c b/drivers/regulator/max20086-regulator.c
>> index b8bf76c170fe..c98a72f43935 100644
>> --- a/drivers/regulator/max20086-regulator.c
>> +++ b/drivers/regulator/max20086-regulator.c
>> @@ -286,7 +286,7 @@ static const struct i2c_device_id max20086_i2c_id[] = {
>>  
>>  MODULE_DEVICE_TABLE(i2c, max20086_i2c_id);
>>  
>> -static const struct of_device_id max20086_dt_ids[] = {
>> +static const struct of_device_id max20086_dt_ids[] __maybe_unused = {
> 
> The following change would also work, as the of_match_table field of
> struct device_driver isn't conditioned by CONFIG_OF:
> 
> diff --git a/drivers/regulator/max20086-regulator.c b/drivers/regulator/max20086-regulator.c
> index b8bf76c170fe..ad92f84b4abb 100644
> --- a/drivers/regulator/max20086-regulator.c
> +++ b/drivers/regulator/max20086-regulator.c
> @@ -320,7 +320,7 @@ MODULE_DEVICE_TABLE(of, max20086_dt_ids);
>  static struct i2c_driver max20086_regulator_driver = {
>  	.driver = {
>  		.name = "max20086",
> -		.of_match_table = of_match_ptr(max20086_dt_ids),
> +		.of_match_table = max20086_dt_ids,
>  	},
>  	.probe_new = max20086_i2c_probe,
>  	.id_table = max20086_i2c_id,
> 
> Your patch should reduce the module size without any real drawback as
> far as I can see, so that's probably best. I'm fine with either
> approach, so

I know it would work. If you check all my patches you see both patterns
used depending on the needs:
https://lore.kernel.org/all/?q=f%3Akrzysztof+of_device_id
(~100 patches so far)

The point is that here the device can actually match via ID table, so OF
table could stay optional. I don't think PRP0001 is relevant here, thus
I proposed to keep OF table optional. Different folks have different
opinion on that, so if general consensus is that availability of OF ID
table (for PRP0001) is preferred, I can rework the patch towards it.


> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks

Best regards,
Krzysztof


