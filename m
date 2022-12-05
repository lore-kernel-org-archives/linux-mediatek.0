Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38FDC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 19:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pzik94DCRnikniychtCYn/if7UtyQkTWFCyd0BXZAs=; b=DvFtVKDylNW5mqeIGzqKabtSzg
	VYG9vsBimkZnUsgEyXkC4puaqHky8dUAtQUEPec63m0sI2B3lejd63VYl35C0e64y/f5NhDhduQQU
	Rk+TDX1Kfa0htaT11s1M6Qhw8CdMkvDUDTyJ1CvOjsWQD8FtRRwaUPe4Lj7gLWjLFcbUksGiiR8yG
	DDor3E60ApKhEL1jUqoQ56IEckSeDHUauF9tgju2J+wNMBIU/MMLrzYzAE1CYG31puHTGQ0e6W9s5
	syHP9JtI0z6GF0gtt3plvyZEmCRozgxS8zi/Npy82B+Iy3uE5ISSm5Vqzm9QB++sT0W4p0RaygDXl
	mWvxRm4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2HJm-009Tcn-1f; Mon, 05 Dec 2022 19:39:58 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2HJP-009T8E-1h
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 19:39:36 +0000
Received: by mail-wm1-x336.google.com with SMTP id m19so9583708wms.5
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Dec 2022 11:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7pzik94DCRnikniychtCYn/if7UtyQkTWFCyd0BXZAs=;
        b=mPhxALAdZmhXA3LNUW3pO/6N9g17MLwyztZmXWZVb6a+DOYDAztdnk9+7GRr2lj+ON
         g3Y0gaqlIYyK/dkcOudswwzJYkV4QDFemDAKFOZfsxvEDrRuEjyHENJguwDr9rneRstQ
         Ys/AJ4BPPEWzUWUgGjyHCjTxK4WjajfsVRjLXweIKCPHc4b78j6VizaBs97dSVp/C2Wr
         DutF4W6xrJ9/AQ15NTZHpvCKMvVTx0MJokJnFrUyyrCJn29dWhmWmnTYaJIQAYF8vkik
         kVbQT0V0Gi2ZLbKIsBVfaoZJYRpYr41h4whRPg/iNg0swzNE/nmLIdcYYFZ9ixr3heC+
         uHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7pzik94DCRnikniychtCYn/if7UtyQkTWFCyd0BXZAs=;
        b=2LiXmkgVUq0AJa9rL2oG0MS5qcyR9xuwiD/y8me6ddRptdRzTqYDHhgyiCJN4le1Du
         DPJC2WORBPUpxaaUk7vSJQFeev/ynXZZsaxZu6mQW8XMbyWnus3t+SKq5NiJqYXUXq/Z
         t6yU5aPkwPO/t8MaFRc6ykAzLWVY7srjbzexzjYHYlOkXc6Tu6/6mDvAFn4iT7828aac
         MuIfepdTk2oEUcQw6rs6DlCksx4oHUFAs7x0Ri3aeJWLaS53dRpe6H4AwUCM9D4saG+p
         BNaC6pdNcUHIAJZOvGXadcorU4jXJTbnkhq1gtckS9lW/kTKRjeyqUC0On7Ae+9/nGxy
         Iy8w==
X-Gm-Message-State: ANoB5pmUKogVJxURkJNWgiteSegku1HhCVqs+8RYAKvdF41PTX6vSwTs
	eH9hF3QqV/gqa5lcf5p3YA/9vQ==
X-Google-Smtp-Source: AA0mqf7D6o5HZCbdZtrrkeiqgEkjfSmeglDG8CxGKl4IAXFIfOgqAXoQLydm+9jhl4i4m7nwJHIssA==
X-Received: by 2002:a05:600c:1da2:b0:3cf:147d:ad9a with SMTP id p34-20020a05600c1da200b003cf147dad9amr48581382wms.33.1670269171966;
        Mon, 05 Dec 2022 11:39:31 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id v14-20020a05600c444e00b003a1980d55c4sm23867622wmn.47.2022.12.05.11.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 11:39:31 -0800 (PST)
Message-ID: <adfe41f7-00e5-876b-7803-3127919fba13@linaro.org>
Date: Mon, 5 Dec 2022 20:39:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 4/4] thermal: mediatek: add another get_temp ops for
 thermal sensors
Content-Language: en-US
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>, linux-pm@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Michael Kao <michael.kao@mediatek.com>,
 linux-kernel@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20221018-up-i350-thermal-bringup-v7-0-ebf08ff2eddb@baylibre.com>
 <20221018-up-i350-thermal-bringup-v7-4-ebf08ff2eddb@baylibre.com>
 <4121bb6b-30db-7a23-f4c8-40afdda7a0b5@linaro.org>
 <COTTJX635TNF.1WL2TEZN7VW9O@amjad-ThinkPad-T490>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <COTTJX635TNF.1WL2TEZN7VW9O@amjad-ThinkPad-T490>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_113935_226867_F8106168 
X-CRM114-Status: GOOD (  14.17  )
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


Hi Amjad,


On 05/12/2022 11:41, Amjad Ouled-Ameur wrote:

[ ... ]

>>> @@ -1161,11 +1197,24 @@ static int mtk_thermal_probe(struct platform_device *pdev)
>>>    
>>>    	platform_set_drvdata(pdev, mt);
>>>    
>>> -	tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
>>> -					      &mtk_thermal_ops);
>>> -	if (IS_ERR(tzdev)) {
>>> -		ret = PTR_ERR(tzdev);
>>> -		goto err_disable_clk_peri_therm;
>>> +	for (i = 0; i < mt->conf->num_sensors + 1; i++) {
>>> +		tz = devm_kmalloc(&pdev->dev, sizeof(*tz), GFP_KERNEL);
>>> +		if (!tz)
>>> +			return -ENOMEM;
>>> +
>>> +		tz->mt = mt;
>>> +		tz->id = i;
>>> +
>>> +		tzdev = devm_thermal_of_zone_register(&pdev->dev, i, tz, (i == 0) ?
>>> +							     &mtk_thermal_ops :
>>> +							     &mtk_thermal_sensor_ops);
>>
>> Here you use again the aggregation
> I addressed this concern in V6, could you please take a look and let me
> know what you think [0].
> 
> [0]: https://lore.kernel.org/all/5eb0cdc2-e9f9-dd42-bf80-b7dcd8bcc196@baylibre.com/

May I misunderstanding but AFAICS, this patch is setting the 
mtk_thermal_ops if the sensor id is zero. The get_temp is computing the 
max temperature in this ops which is what we don't want to do.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


