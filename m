Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C879CE7A95
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 14:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12lvvZVko7HwcFd7BVr7FRaCYZcG3/6yf/N02oFBsK8=; b=W2skkZB9WjhZJipbtMqplAqOlE
	uuzAob2iMkEaMk8JcgtmH1SPJuE5fSn1yhq2CplrA7n9OTGSvJAbpqi9/F/QCHaXkrMnunHlbi+Ra
	r9bbIotDjAswhyATNh8HBwyQ6ExQnwe7JXn1tMP8dgmmVCEd6Ck347Uz4n6vZGX3txnaO5gYvMjr7
	WA6l62q7+kvZ5uH7ANAuPqLtIpVtDZiTuMEglxNZCmkw/MhS6bHoixwHTgAhHeNAtaGk9pfidigMt
	UK8841bkoybogdMUAghZqmKCcQ77Tj9oz7BbCS6bQqpNeejy2B+pN6mlIqO2EsWYM1MGRl1RMz8x7
	SgUJh0SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmxM-00ETYp-2p;
	Mon, 25 Sep 2023 14:53:04 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkmxK-00ETWu-0D
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 14:53:03 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c00c0f11b2so108229651fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Sep 2023 07:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695653578; x=1696258378; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=12lvvZVko7HwcFd7BVr7FRaCYZcG3/6yf/N02oFBsK8=;
        b=nCrl1tnRaCls/QGGuli6amOwaA3LxSDfrpKUMcxuXPbw4g7Cg7+FSk1Tenme/Pu4JK
         D4rnObPNZQcFStS7h3K+bItVPtx7Ykt0fy648iBM7V/atXi/SQpJdgWB1RnHWINkztJF
         bXJpHbTsv2HidL38dQq5UcR3wXBPxFfktjKiIEsuC0PBqF2Z/Qhcgv2jKVyP1cKWQBd4
         2UtWAGj+WZadGXiuoe4O+9GwO/0fmVHh2dPXmZDbnjNvf1XQORLnUqE/dFCnEYYqq3my
         I9MwNc1c/BDShevxigxVvmNThfbrnjxCn1aSwbnGqogpJpNfEGbp9djJdBy8Jof2hPCV
         f/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695653578; x=1696258378;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=12lvvZVko7HwcFd7BVr7FRaCYZcG3/6yf/N02oFBsK8=;
        b=Nuj8wvw6Gi/ganiVS6ifwL+bNi9skiJJJLEdChK+tI69ggBxqTfY9IiYzjXoapstkK
         ijpUpGimxNbhDo5b6/hlmgomc1JO79MH4C8Jh7pwtBOg1++s8zguTpLVr6V47xl7VEwA
         cnHs9yLN60CRTHGQXxX7Zq83pK8dPyUYY+MMwEWG5g9FA41b7QPUm2Ft3NxIXfNkQghP
         cs2gPfNB6Lj6aJ779RbpwJYrpuxuQ5Dov9RIwv08ge4oGYCavTIxdNvc+80+6m7qJXOK
         dVT6ZGcwRyNcxw8xKkGtVjxknIDSQHp4prSywDaDNs3OQGTVyh1HVrz+ctTsV1gCn19f
         9qtA==
X-Gm-Message-State: AOJu0YzTtmS6oj0yJCaxsS7KZAHEfthhLXrcb/6EMirMjPiE1W2KG9i+
	sro4yz1uKI3BE6u76JxLWYH+8g==
X-Google-Smtp-Source: AGHT+IFDQpUk2VXmAw55MR/ZBzMc5xEwHe1FQv75sipuCMabU5D0JcaGYP7gRdWeBjtjiRNoVPTmdA==
X-Received: by 2002:a2e:984e:0:b0:2bc:eceb:6a4b with SMTP id e14-20020a2e984e000000b002bceceb6a4bmr5683898ljj.28.1695653578381;
        Mon, 25 Sep 2023 07:52:58 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id md1-20020a170906ae8100b009a1be9c29d7sm6455357ejb.179.2023.09.25.07.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 07:52:57 -0700 (PDT)
Message-ID: <a16e1b9e-06b7-0dce-124e-f13c672d779d@baylibre.com>
Date: Mon, 25 Sep 2023 16:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 2/5] thermal/drivers/mediatek/lvts_thermal: Add suspend
 and resume
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
 matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
 ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, wenst@chromium.org, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com, nfraprado@collabora.com, abailon@baylibre.com,
 khilman@baylibre.com
References: <20230530195132.2286163-1-bero@baylibre.com>
 <20230530195132.2286163-3-bero@baylibre.com>
 <371790cd-5a7c-8fa6-cc38-3a3680525092@collabora.com>
 <b544e079-c9de-23d3-80f7-cff89293eeb5@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <b544e079-c9de-23d3-80f7-cff89293eeb5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_075302_110043_45C76BC4 
X-CRM114-Status: GOOD (  15.47  )
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



On 23/08/2023 09:48, Daniel Lezcano wrote:
> On 31/05/2023 10:05, AngeloGioacchino Del Regno wrote:
> 
> [ ... ]
> 
>>>   static const struct lvts_ctrl_data mt8195_lvts_mcu_data_ctrl[] = {
>>>       {
>>>           .cal_offset = { 0x04, 0x07 },
>>> @@ -1268,6 +1300,8 @@ MODULE_DEVICE_TABLE(of, lvts_of_match);
>>>   static struct platform_driver lvts_driver = {
>>>       .probe = lvts_probe,
>>>       .remove = lvts_remove,
>>> +    .suspend = lvts_suspend,
>>
>> Should we do that in noirq handlers?
>> We're risking to miss a thermal interrupt.
> 
> I'm not sure missing a thermal interrupt is a problem in this context 
> but we may go in the irq routine with an undefined state sensor setup 
> (eg. the internal clock stopped in the suspend and then read the sensor 
> in the isr).
> 
> IMO, using suspend_noirq and resume_noirq may be required here.
> 
> Alexandre are you taking over the next iteration?
> 
> 

Hi Daniel,

Sorry I missed your message...
I don't think taking over the next iteration, Bernhard should continue. 
Let me check internally to be sure. As I understood, the next change 
should be heavy.

-- 
Regards,
Alexandre

