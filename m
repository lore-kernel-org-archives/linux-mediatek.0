Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66891ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Aug 2022 14:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mtje2qEwG9vnhoVDst4lRLcS6qO60Yh1gpKRylhbD4A=; b=0avGDb5ZA67LVTkweORHZjnc5a
	URakWYH6V5Ic/1RQjo8anFb9n31E7BbakBfSOdh63T4sN0QcrZQiJhWyDoRYmGiQFFObkN0+DPeR/
	MVZ3tvhcT0tpYFzXyxFZmE3KHV8TQSmavvSs0rKAbub3ZRcFG/xz86zSxhry9v7R3SSb5iwTrZlZg
	eC1YHi4kAAyjVzqlB6rjRBOSbtzcKl6Qh0Rry0VBOwkNJFgG81mlpHNbonH6RJDi6t3l3nCJfUuab
	vv2imLge5J9EyY4RDtkS6liEtpS490NCW/NUETIbcUx9X8BXkHykyA/vzIFSGJzxkynASbZ2t8cMy
	j6Cx7arA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRZvH-005hU5-9U; Fri, 26 Aug 2022 14:02:59 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRZvE-005hH3-Fu
	for linux-mediatek@lists.infradead.org; Fri, 26 Aug 2022 14:02:57 +0000
Received: by mail-wr1-x42a.google.com with SMTP id k9so1969087wri.0
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Aug 2022 07:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Mtje2qEwG9vnhoVDst4lRLcS6qO60Yh1gpKRylhbD4A=;
        b=ILSuAOJFTD/h1f9m7ZfHHZ442rhPDY2W34T7s/khlxcapxirVG63G9Nx3h3mNXeDni
         aTXDqWQkyhIKDTYdjrYtG3KJ3O/qvcUOiPTpfRH9oTj+YXz6NBy1kvlgVIFi/Db89OMZ
         gS6b1Y7Ks+UgHdrVKpeZW3Q40NY69hDKaMNs2nHZNCYtvhDCqw+QbBg1NgsLVWpldqWn
         jqPzvG+2mdT94h2/aGuFgbYB6Vw1r4r6+mXD4qLP2kSi0EfVuwOn7IWs08RejdtArAGZ
         VAWX3jntoqihIWSeXIGeszB2mPqncQxbvQwaHbYMBKeBECb37WyyMYvo0n3OMoMcUwT2
         L92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Mtje2qEwG9vnhoVDst4lRLcS6qO60Yh1gpKRylhbD4A=;
        b=VuPVQGVf/2XbuLN6GZTFs9W51FYhsvcOd+kJIVCRTn5f9qi7sMEc+6PgxbphBh2IaS
         k6Iiu8Sm+uZ47P5JUdflB6VDI6W/4ieZEKc3jUCKykP8YyJs0NHGZFnO0Mdjd26+l5fT
         AvN1o/DYtckBehpHdsg+/4nk8GuQIlyTBqHLMxCds+wQ41fQ/jpTqI249neLvHTvYLno
         iG6AYGyGTeuVuvcLsSVpKfGo/MZ2DhyJTTmseWWpKLoA/yQYAw7CE7xwVSu+vmwpsQmA
         8sTD+wkuoheK9GIskUR5nQPmUwKINCAG2gCrIZe0FZ1EHWzHxNiAzBdyr4GUaVUbMXW2
         NaNQ==
X-Gm-Message-State: ACgBeo18N8q8ppzpw5HXR3UWUl3uMYyw5f13KgatTzYs1cWxFFDH+ZV6
	LzekIYryca4ol1bBf8Q2umeUZw==
X-Google-Smtp-Source: AA6agR6idNMJp6sisxPJISIGgWJjg9TgG5bw/WX8AqedTH7Pdo4hmYpxkpIXFnZn/XBrUqZf1SWo/w==
X-Received: by 2002:adf:ed92:0:b0:225:464d:b083 with SMTP id c18-20020adfed92000000b00225464db083mr5160595wro.246.1661522574290;
        Fri, 26 Aug 2022 07:02:54 -0700 (PDT)
Received: from [192.168.0.20] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.gmail.com with ESMTPSA id f6-20020a0560001b0600b002206203ed3dsm1911823wrz.29.2022.08.26.07.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 07:02:53 -0700 (PDT)
Message-ID: <577de16a-0a6c-faa5-54da-2d808451b4e9@baylibre.com>
Date: Fri, 26 Aug 2022 16:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/4] dt-bindings: thermal: mediatek: add binding
 documentation for MT8365 SoC
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: rafael@kernel.org, fparent@baylibre.com, amitk@kernel.org,
 daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, robh+dt@kernel.org, rui.zhang@intel.com
References: <20220720181854.547881-1-aouledameur@baylibre.com>
 <20220720181854.547881-2-aouledameur@baylibre.com>
 <59dd19f6-8e20-56d6-506a-93656bf15138@gmail.com>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
In-Reply-To: <59dd19f6-8e20-56d6-506a-93656bf15138@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_070256_555702_7EE30DF3 
X-CRM114-Status: GOOD (  12.85  )
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

Hi Matthias,

On 7/21/22 10:57, Matthias Brugger wrote:
>
>
> On 20/07/2022 20:18, Amjad Ouled-Ameur wrote:
>> From: Fabien Parent <fparent@baylibre.com>
>>
>> Add the binding documentation for the thermal support on MT8365 SoC.
>>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>> Acked-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>
> I suppose you wanted to add Signed-off-by here, at least 
> get_maintainers.pl doesn't list you.
>
Right, will add my SoB in V3, thank you!

Regards,

Amjad

> Apart from that:
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>
>> ---
>>   Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt 
>> b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
>> index 5c7e7bdd029a..ba4ebffeade4 100644
>> --- a/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
>> +++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal.txt
>> @@ -14,6 +14,7 @@ Required properties:
>>     - "mediatek,mt2712-thermal" : For MT2712 family of SoCs
>>     - "mediatek,mt7622-thermal" : For MT7622 SoC
>>     - "mediatek,mt8183-thermal" : For MT8183 family of SoCs
>> +  - "mediatek,mt8365-thermal" : For MT8365 family of SoCs
>>     - "mediatek,mt8516-thermal", "mediatek,mt2701-thermal : For 
>> MT8516 family of SoCs
>>   - reg: Address range of the thermal controller
>>   - interrupts: IRQ for the thermal controller

