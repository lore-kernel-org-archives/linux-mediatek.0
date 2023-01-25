Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4085DC54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 10:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NuRPLNR6yWS1Hhhteoa3n5LG/0eiGai3p1MOQTw2W5s=; b=PhpEiqQ170HOT1YzPsMSPhiToV
	4XbuLkYa5CG/76Ll1HfZjYfqTiUzaXNdLpCiaWEjTg/FlJCqnWYofs0H1hxJSziZPglhqEZwU8wWE
	ggWHaDXCQcrJXPOCDv7YN61dtXbQ2iGoql+TX8018NAfh589MXc5DN1mbgckcb2jOXkOXJPB2809Y
	zDCLSTyhvEBEYSvhRZxoYl2leG9oCeWdFG9TycBtVBPJLGormfmmP4ag36tTd//qTsK3HFtT275EJ
	GEJ9dtK0vefAiybMmL1R3JgJu36KIIglq+TD+5cJaHeVa6LTfhhnZUSKXZSjD9oj3ssUbRxOx16Cu
	yGsDP8MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKdUX-0072eG-PP; Wed, 25 Jan 2023 10:58:57 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKdUN-0072bv-3G
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 10:58:49 +0000
Received: by mail-wm1-x335.google.com with SMTP id l8so13433955wms.3
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 02:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NuRPLNR6yWS1Hhhteoa3n5LG/0eiGai3p1MOQTw2W5s=;
        b=qqFffHbYUgKbOOFK779uTpAVqso7+NLJ/7bkN4/5eZa9nhE1BPZvGN3hRo3hkZ3If2
         3RWGYiofa3jdZiE4bKPCi1FVcI+kL75gFexqitR3HBMune8mzdR8HSeH9XQhh9pUMRy8
         2cseCQVoiJI8qenQzHDFGLvukgF1CksXVjXuSEnXYPRKVRiIudsXe8mf74z2ePTcHwal
         YPJGGPZTBIhwFTWYYFxKFKb0F3lG5ELQo/JZgPgT2l2r7iD9tPyXsuqqMchhPfW89QE6
         i3s7ZwdM4vHo1CDyO8Jv9xqoZc85wY8jNSSVXHvpU+hR4CK9VcL8WSrEdnymd8U8Uw2B
         Is4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NuRPLNR6yWS1Hhhteoa3n5LG/0eiGai3p1MOQTw2W5s=;
        b=IaighqVEZO0J3ozO4Z1Gw0n2cVtM7JqipKBOeSAxz9Hf13+rRq7tTi4kjchlaLl8QL
         hWAVkhLaPzlZKYvNeYpv2/rBWRarPmlm5CTRPCbfTPKfVe5leMzTqoN0doRrJ/hug2a8
         eZ0JXdMF6SgHZ8xdT3aM1QouFayg0PLZ2LziMjh/vOYCYzPptmKioApc8YZFV3ojbrmT
         MD0B+D/7NUCc1Qy578BJtw+MVPYD76Vj9eDmABQBEd0PnO1euR4sTGHf4Zr2XC0J98DB
         h7F3md03DDY2j39/BQbnBglPVIhKkuUb7obHGRmKnuknqiJ84xnAKJSpmvM54EfY/34C
         MvPQ==
X-Gm-Message-State: AFqh2kpGmCQF1sgVV2uSOvR8T4Ws/38oA1j9ziaIOnsPKbVEmjdvpMeF
	dQqQS17pFeuV8uc7aTS3RZ1CsQ==
X-Google-Smtp-Source: AMrXdXsGs6ewgIxoJSL9+UnhSb5FQ3Ji1mS2KqH1XkA7xk9/CI9dYwSwz8HLhMpk3nQ8WUuQSXcz8Q==
X-Received: by 2002:a05:600c:255:b0:3da:f9b7:74c7 with SMTP id 21-20020a05600c025500b003daf9b774c7mr29933425wmj.13.1674644322703;
        Wed, 25 Jan 2023 02:58:42 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id g12-20020a05600c310c00b003db012d49b7sm6645021wmo.2.2023.01.25.02.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 02:58:42 -0800 (PST)
Message-ID: <96e7aaf5-76ef-9356-84e2-ee1f747dafcd@linaro.org>
Date: Wed, 25 Jan 2023 11:58:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v8 5/5] thermal: mediatek: try again if first temp read is
 bogus
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Markus Schneider-Pargmann <msp@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Michael Kao <michael.kao@mediatek.com>
References: <20221018-up-i350-thermal-bringup-v8-0-23e8fbb08837@baylibre.com>
 <20221018-up-i350-thermal-bringup-v8-5-23e8fbb08837@baylibre.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20221018-up-i350-thermal-bringup-v8-5-23e8fbb08837@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_025847_143169_56677C4E 
X-CRM114-Status: GOOD (  18.08  )
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

On 25/01/2023 10:50, Amjad Ouled-Ameur wrote:
> In mtk_thermal_bank_temperature, return -EAGAIN instead of 0
> on the first read of sensor that often are bogus values.
> 
> Signed-off-by: Michael Kao <michael.kao@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/thermal/mtk_thermal.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
> index b8e06f6c7c42..e7be450cd40a 100644
> --- a/drivers/thermal/mtk_thermal.c
> +++ b/drivers/thermal/mtk_thermal.c
> @@ -736,7 +736,7 @@ static int mtk_thermal_bank_temperature(struct mtk_thermal_bank *bank)
>   		 * not immediately shut down.
>   		 */
>   		if (temp > 200000)
> -			temp = 0;
> +			temp = -EAGAIN;

Did you try to add a delay between the bank init and the thermal zone 
device register (eg. 1ms) ?

May be the HW did not have time to initialize and capture a temperature 
before thermal_zone_device_register() is called (this one calls get_temp) ?

>   		if (temp > max)
>   			max = temp;
> 

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


