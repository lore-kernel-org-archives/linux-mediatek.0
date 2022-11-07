Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED31C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 11:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bE/B1hEKlsShE0rJtK/wqGe/9FUjw3TNSnOuMMxxx5c=; b=TLtPtMwJosJ/+KdCtvwrFwydaF
	I6xh5/vNqbmqeaqK8v8qwh1MXQkn4rab+B8YPvmpjXvuSW2JVNzApA23iNLpR9/sY1cx/aOUQUumW
	ip096A8IVc87XKmARoIJDXAf3hbD55HTk+M5CQq8e22UKdQ6kvnsXYJujhOJ0/vZf+/s4VGCHRtcj
	TuQxLKB6M+hvn4JsLtaBiOv3mA4oac0nNfQ7NzjjMF9g3z6GA26xVWJB3wWFwAWHH6z3ibp6sC+Z0
	WV9/xZsdNxCAXgjHNG38LjK/zuRzaFQLBE6YEk5e0XOJdCs/JqoJaJX7dUhnvHwLKqdvyXcXmElbw
	DZsYB+Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os09z-00E6GI-4i; Mon, 07 Nov 2022 11:19:23 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os09B-00E5mo-O7; Mon, 07 Nov 2022 11:18:37 +0000
Received: by mail-wm1-x334.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso6936651wmo.1;
        Mon, 07 Nov 2022 03:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bE/B1hEKlsShE0rJtK/wqGe/9FUjw3TNSnOuMMxxx5c=;
        b=kqG8f+Y6oT2x2fUWNz8vbbbNk4CncuhqoXWlJRRYGp7vCOyhe6FHCC+PhQ2spwH8kD
         o7ke5mugzwO5NHVfQnSdBhb1xupi+/WPzyUtOCFrTFOJrwh7QHhFxqIck1o3/e8d6sEN
         a+mXXGKpZV5oUQJntT+wxrjIt1jlD6VN01WMw2g1QXhdXMlzXoexB5vjwOSgwNOjtcTo
         poo7Kia1UZQHQnurHlLyQfPS6qa1dwa/tyVBm3jrWx2ue1VtYuOlvcKuQhV3sExaMKGB
         bisoLww9V2O0SuFlZjclSJ76xsL16/rA/g3DJWY7Z454d9Bpl2FQIgJPK+sqbNvHUvya
         Jn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bE/B1hEKlsShE0rJtK/wqGe/9FUjw3TNSnOuMMxxx5c=;
        b=fBMESIVcpUpPcKSICcnVD01hnfIZhDqqmZ2pS92UNLIJPOHcX8JmuuvyqstvHqr4qZ
         BrwDdogRdDSyS1RAmZYoM9Ddmab7NjLMpL7IwCbNdlyPGILQJh4T99A0DEdYI+6dLNrq
         MLd6dxQwrcfy6HzOrVqjBMAb3fUYOQNe15BIGjbiCECA9XlzHXPeG6irmJxRK9dscmEj
         KfiiKAIfuCoIy4zLiFAFCVAmFXEHxw1VlhwggFsKxouUC0uVoEXWuXrKPZECmi7uzlxX
         wWyJuOp6jBLHyOp1L4+kJMoz1fIsJv/0QMslNZH8eaJ7nptuga7bhcT8vcMZujeDPfnw
         kaBw==
X-Gm-Message-State: ACrzQf12yjEE8Dm+DlQDd1uFgDW5YUYkRcfQzkAHhuc3+lK/2aCOqMC0
	Opp5q2Du1KUmaA3e+iTdH8I=
X-Google-Smtp-Source: AMsMyM602bjMyEAIMHb7PPY/WchKiT9g7wWxWDeiZVVF/3WBk72v331wPVEgqU98Sqgeey5mI0NOTA==
X-Received: by 2002:a05:600c:5109:b0:3cf:5fd2:877f with SMTP id o9-20020a05600c510900b003cf5fd2877fmr32712091wms.156.1667819909730;
        Mon, 07 Nov 2022 03:18:29 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id c5-20020a05600c0a4500b003b4a68645e9sm12514451wmq.34.2022.11.07.03.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 03:18:28 -0800 (PST)
Message-ID: <fcec5536-6ba8-9cac-2001-710a7170df70@gmail.com>
Date: Mon, 7 Nov 2022 12:18:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 1/2] dt-bindings: gce: add gce header file for mt8188
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "Elvis.Wang" <Elvis.Wang@mediatek.com>, Jassi Brar
 <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221104074443.26172-1-Elvis.Wang@mediatek.com>
 <20221104074443.26172-2-Elvis.Wang@mediatek.com>
 <bdb46b7c-6e08-26cf-491d-ca68d36f29af@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <bdb46b7c-6e08-26cf-491d-ca68d36f29af@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_031833_854742_4D37EE3C 
X-CRM114-Status: GOOD (  15.87  )
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



On 06/11/2022 11:27, Krzysztof Kozlowski wrote:
> On 04/11/2022 08:44, Elvis.Wang wrote:
>> From: Elvis Wang <Elvis.Wang@mediatek.com>
>>
>> add gce header file to define the gce thread priority, gce subsys id,
>> event and constant for mt8188.
>>
>> Signed-off-by: Elvis Wang <Elvis.Wang@mediatek.com>
>> ---
>> Thanks for the reviews, I have removed the incorrect reviewed message.
>> ---
>>   include/dt-bindings/gce/mediatek,mt8188-gce.h | 966 ++++++++++++++++++
>>   1 file changed, 966 insertions(+)
>>   create mode 100644 include/dt-bindings/gce/mediatek,mt8188-gce.h
>>
>> diff --git a/include/dt-bindings/gce/mediatek,mt8188-gce.h b/include/dt-bindings/gce/mediatek,mt8188-gce.h
>> new file mode 100644
>> index 000000000000..e2e2c56016a1
>> --- /dev/null
>> +++ b/include/dt-bindings/gce/mediatek,mt8188-gce.h
> 
> 
> What is a "gce" subsystem or type of hardware? Why do you put headers in
> "gce"?
> 

Yes, I think we should move all header files from the gce folder into the 
mailbox folder.

Regards,
Matthias

> Don't continue this pattern. Mediatek devices do not get specific folders...
> 
> Best regards,
> Krzysztof
> 

