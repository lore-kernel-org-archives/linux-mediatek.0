Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E316DEE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 06:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=znV8c1nZy2khF5/iHvM02K3LRI4Usqz/zkO1WU9q06M=; b=Ax5rh8bM3YHWtLw1Y3fFT3eaWh
	uYdgu3u+hZCDp75FWtARwLZCwBbuWzUhuqpdHWIG+cxD59ZOY0LdIi0DFvw+TOHd7K8O/WkCjEd+P
	DK5qN//Kz4M2+vo7OffRN4STa//6lA+35g86Grx6qguLRqMlRFKzx5Mbg4lVDQ2XhJB1ccnjRgCaU
	FJG/78ooPeTCZJtt8rKvAw71CTenPs+cwviHqTXq/4ZdllUjI6sr1a/xI0lyIlzmz5LqdmIk17rAl
	4urNn2ikKQW7xpePllMstfNo4EFg4s/UbRnIocxjZdt1yOCSmTEl+b8olQZDojYmIeZqa95QdarTO
	XHbm0Kfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfa5d-00HJ1V-2L;
	Mon, 11 Sep 2023 06:08:05 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfa5b-00HJ0M-00
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 06:08:04 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-401f68602a8so44070625e9.3
        for <linux-mediatek@lists.infradead.org>; Sun, 10 Sep 2023 23:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694412481; x=1695017281; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=znV8c1nZy2khF5/iHvM02K3LRI4Usqz/zkO1WU9q06M=;
        b=BQtKAdRRzXj5dn+3p7m+FqjbynL7aFH0OdZQXoFnZl7RBbJVfymhwTPotzKEtyZuip
         ccT3MB7HG/mU4fwvjCVfQu9P3fMinCokdtWLXhvA3y25Zz7/IUpmW/5tcHaQ2B8y4Mrt
         YLUQ72QebcUGy5Ap/5UHdUkukoQd1dwYVZi5V5UL/VGxIU0DNkXnAbXiG+uGBSGukRO/
         Nbx6QS5NhBoYOc7EzinhkyMKux4Ockhssk6AZKRvILNFyWcOSQOe+G73Fo3yGjDgeqAv
         8o1nvtVeQHEUsDOVxLGUmAevrNKuYfWGdSvHT5VtXGGTgBT+IE1NZb/LSkcx3a7m3O/E
         g+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694412481; x=1695017281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=znV8c1nZy2khF5/iHvM02K3LRI4Usqz/zkO1WU9q06M=;
        b=eN3O/wLiiMqO8aWOqwNu8UG1v5jZHct9WOB/CmYQarXt0unVQ81As3ICAf0u62LYvF
         5C3TBoodTnp6OfSbxItY9WV+XjB8ZDXuMnNsGXT1Yn5wN3CO+ZlHyMNlmw2NSPykMr04
         10/UxhJsOHkUcG3oMsSnv9hUm0D3sp/c/MPG0za0hJUo0F1K7UXwuHGg9JRtk8CVq4k8
         bi8KMUs934oBV2UVHKlWA7PBBvaHxoYkRjg6FwT7yIbqyZCLFqorwXkoIxljTBvo8EGr
         W7tfBpOiF9zoNfNZb20W5esbNHAqqQlAHZU479a+W19/h6A8nlFvzSA5A+3YRR4LJCf2
         qozQ==
X-Gm-Message-State: AOJu0Yz/fZYPl97D48AwBBT9h5aOjTFoPFyDPVRr6Mn8tCIzaCaMdekn
	fWCvpm2Iwi/GdBpi+upDCWvKqw==
X-Google-Smtp-Source: AGHT+IHMyTBUANYOv0uuLp74+1jLiLUu+Hfx5s3BwTAkzuzS/yebG+o7dj4lGFDQg2Xg4Mlst3xdFA==
X-Received: by 2002:a05:600c:5128:b0:402:f501:447c with SMTP id o40-20020a05600c512800b00402f501447cmr7275655wms.0.1694412480731;
        Sun, 10 Sep 2023 23:08:00 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id e6-20020a05600c218600b003fe1c332810sm12125267wme.33.2023.09.10.23.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Sep 2023 23:07:59 -0700 (PDT)
Message-ID: <fc4bd212-c112-0d42-e94c-c3ba569d2d32@linaro.org>
Date: Mon, 11 Sep 2023 08:07:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v5 1/2] dt-bindings: arm64: dts: mediatek: add mt8395-evk
 board
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
References: <20230909132819.21626-1-macpaul.lin@mediatek.com>
 <2318be3d-5687-8b6c-3669-1d2ae1c94d2c@linaro.org>
 <946ee1c5-77af-3ce0-83ba-2966fab70a5f@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <946ee1c5-77af-3ce0-83ba-2966fab70a5f@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_230803_068864_A7299518 
X-CRM114-Status: GOOD (  17.93  )
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

On 10/09/2023 14:23, Macpaul Lin wrote:
> 
> 
> On 9/10/23 18:56, Krzysztof Kozlowski wrote:
>> 	
>>
>> External email : Please do nost click links or open attachments until you 
>> have verified the sender or the content.
>>
>> On 09/09/2023 15:28, Macpaul Lin wrote:
>>> 1. Add compatible for MT8395.
>>> 2. Add bindings for the MediaTek mt8395-evk board, also known
>>> as the "Genio 1200-EVK".
>>>
>>> The MT8195 and MT8395 belong to the same SoC family,
>>> with only minor differences in their physical characteristics.
>>> They utilize unique efuse values for differentiation.
>>>
>>> The booting process and configurations are managed by boot
>>> loaders, firmware, and TF-A. Consequently, the part numbers
>>> and procurement channels vary.
>>>
>>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Changes for v4:
> Changes for v5:
>   - No change, update Reviewed-by tag only. Thanks.
> 
> The explanation is here. The version v4 and v5 are the same.
> For sending v5 is because "Patch v5 2/2" has been updated and these 2 
> patches were in the same patch set. I think to update the whole patch 
> set together with a single modified patch should be a usual operation.
> Did I miss anything?

Yeah, like not top-posting.

Why do you change the same line in other patchset?

> 
>> Confusing. You just sent a patch changing the same hunk - adding
>> description, without any explanation.
>>
> 
> The marketing naming rule of MediaTek SOCs are usually confusing people. 
> I guess the previous patch just confused you. Ha.

?



Best regards,
Krzysztof


