Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE93C27C76
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 21:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JsLcxuxMTOazJRO3G1nL5/Q+Xnan4zO8kzHASnq1QZA=; b=LZcVaBBG2N+VLG3egxXOjfJDP/
	LApFwL38j8HfYa+2rmtsGurDSmGBh3RwLypmo51x19NbuVL0xHeqNLoonJY2PLmirr/MeNGq+iN8M
	Zj6yd8p/h1+uusbuy/iNxidSKyVSoSTKwA9LFLpzBLhFATvywk3ABJtfj3vf9BwylmMITM1D9l9FS
	G7OhLGsyQPIJusYDemwa+ka+VuyxT28jPtcIuLXHIrZIT+7R+5o2bPr9qp0HiE/mw2AdhDPv6mvy9
	LKQf6NlVFIuK4ZRjEfaj32zrz0OH0FUBlCpxtmjs7WNUhIxqVXNvJVR0kTnnKwUxzL91P7q9QD/f8
	aTctbhIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKn5U-008p37-KR; Wed, 25 Jan 2023 21:13:44 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKn5Q-008p0v-Ko
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 21:13:42 +0000
Received: by mail-wm1-x331.google.com with SMTP id l8so14711950wms.3
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 13:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JsLcxuxMTOazJRO3G1nL5/Q+Xnan4zO8kzHASnq1QZA=;
        b=BgPfXAy0xOw1jZzEbavomqOSRnTH55mU8tvfwtEZ211OT7cCuz4uXG8XLn1gMe7ONe
         WcCxHjrR7rmB4hCxBmvLnkyg1JeznuygjjtRQn7ShAW9vY/v1z6kaULuOCpQ3bTLU9LZ
         3VMp3nITMf74K8HDDlOagxUdAPoZSPLi1hlwVQIQjK6feAVtBoWa/psdPMOKVRijpms9
         Ij4B56IAUPDeJMzPlunCf/IZJVGvXMLU7jdEEvTmWPW8I2wht4agM1ZJHcJIyAGa22Vp
         Phu69pBL4/G/FWVWHETfTq7FEamrTTNYm/eoHFbNobTwA787DvNT6MeMxv+RLzTcuxda
         8EGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JsLcxuxMTOazJRO3G1nL5/Q+Xnan4zO8kzHASnq1QZA=;
        b=mi52M7xqImBNeJu+9Ya1js+2XBI2bwIsD0OQWAGoBk85rgrztrTk6ey1Gnh927uaui
         4UFJu9l0PRe3zNrPS/Ev79rzASmqvokQ+FxarcmM57QAodx+D7QS8d+2/VNUocMIJrcG
         CxVzJD9k5aV+0EJlqaaLDn2JXtfTLNcBmeVQATVXsfrL1YlYyHLbQis3LII5S+T542ef
         B3poTeTgUqGiUr6YuyJXF9ji09BMq0UaK5JL9WKNkxtO9Dd2BeWvg9k56zZoM3fNhS2A
         QiLtQHfAZ2M8pbL4BA58NPWbrUpzSgMB+tX+ijCcsSR9NVAqm8bnZvhevbjpEiFbyyo8
         PppQ==
X-Gm-Message-State: AFqh2kq6bsmTfJVAFzMmV+Lrm3BfavFQTCHqUcUFE8Z9jhhzGVPOJEdZ
	T5p4Pgg2ssD2zVmK5SHxPsZoHg==
X-Google-Smtp-Source: AMrXdXsPYFyzktUf5LMtw863JQqiB8bnQdiNRPJy/rhWvqe1b+FhuVVb7GKiJsFGeACA50mg+EvsQQ==
X-Received: by 2002:a05:600c:5028:b0:3db:1dea:75c9 with SMTP id n40-20020a05600c502800b003db1dea75c9mr25055623wmr.28.1674681216854;
        Wed, 25 Jan 2023 13:13:36 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id w19-20020a05600c099300b003cfd4e6400csm2807723wmp.19.2023.01.25.13.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 13:13:36 -0800 (PST)
Message-ID: <d4b8eee7-ab0a-03ab-01ba-a71e290099d6@linaro.org>
Date: Wed, 25 Jan 2023 22:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v11 2/6] dt-bindings/thermal/mediatek: Add LVTS thermal
 controllers dt-binding definition
To: Rob Herring <robh@kernel.org>
Cc: bchihi@baylibre.com, angelogioacchino.delregno@collabora.com,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 matthias.bgg@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230124131717.128660-1-bchihi@baylibre.com>
 <20230124131717.128660-3-bchihi@baylibre.com>
 <2471a5de-b7a6-fea7-152f-4fe25063abf9@linaro.org>
 <20230125203528.GB2855708-robh@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230125203528.GB2855708-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_131340_730161_094B1A23 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

On 25/01/2023 21:35, Rob Herring wrote:
> On Wed, Jan 25, 2023 at 12:14:17PM +0100, Daniel Lezcano wrote:
>> On 24/01/2023 14:17, bchihi@baylibre.com wrote:
>>> From: Balsam CHIHI <bchihi@baylibre.com>
>>>
>>> Add LVTS thermal controllers dt-binding definition for mt8195.
>>>
>>> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
>>> ---
>>
>> Krzysztof, Rob,
>>
>> are you ok with these changes ?
> 
> It says v11, but I sure don't recall the 10 other versions...

Ah, yes indeed. I remember Krzysztof told Balsam to fix the recipient 
list because some maintainers were missing.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


