Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614B5C77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qmRsOqjOUeFEAObOHM4G+xJcIEgvL4vfHkv/prXzOo=; b=FhNJimu6MbATAuiin3oV0kxwQO
	t/emGKKqOI6hO/Nup49LDJZ7F5P5IhIGJ45KcofRwx7uoIsqaJhYSPbGrq3u/qilbkDJNzDknTDgS
	JO4ciPh3/SP6EF20S2HrIc8HrKBVR6o6xkrW/dPVjniN+wxh/oVK83vPbV7odgfHJwmerlBXuWjVd
	CPBdtnVxvTzEdW83WbzSbAhAK0es//OLXPLF38LQuPMnxDgu56oUkhEcZTvq6pnzWKJICPKUO7QV0
	WYs2rhWHVvXGekQvAQ+VfAlj4woGb1s4sYDDb0RF9yHtp8Lxmb4WF28l7dpPaCsWvOEuhJy5CvvJb
	QHgK0eFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmtOc-005eSF-2T;
	Thu, 13 Apr 2023 09:37:38 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmtOZ-005eQY-2N;
	Thu, 13 Apr 2023 09:37:37 +0000
Received: by mail-wr1-x42f.google.com with SMTP id g5so16946011wrb.5;
        Thu, 13 Apr 2023 02:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681378651; x=1683970651;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7qmRsOqjOUeFEAObOHM4G+xJcIEgvL4vfHkv/prXzOo=;
        b=WZhODdmsBmq0DDpYW5QhnP8UogRsjl3uxILhG7rzMdzvOaPrFt9vMZ/l05hsyRcjsM
         g41zMBTGZvqX7hyFGIFDenwO5z7v6pE++aQthO0EU4G1d2GzJvpABGSLqurZuS+3ExdT
         +rGiJF1aN3cZsb5JYgJhgTqhl70ZXt4zyrCoUmp+5vhTohyftdzsSp9ycF6sKoRDHkSF
         3VQvFTlsH/FbG+nZtuUL+KfSGXSOv7aNO3kcZvCGmBBqkFJN5iGPCQS+mfKa5/6mZjuX
         Jx2orYPy+oK4nCygJeIoTB60mGh/uxV3t21CAVkQWiDqEu8AtMYIwFmZDcn9TOw51VaN
         RSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681378651; x=1683970651;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7qmRsOqjOUeFEAObOHM4G+xJcIEgvL4vfHkv/prXzOo=;
        b=jFQGgbYgDPoEtYa/MEkZfzwj6MZgMvIau4GSeUkDj00nJnzcX5fv5DEuHL1xIv1IfU
         SWrZeRrvNUGQz5eBWcrm1LqOWnaBQn3d0hsTGTRqJ7nY6ppZq0a/m4GNbj4JFFRoqamH
         SOj3/lD1oF2CFZPyZG1vo6Xf1ASF5wHGjNMYnEj1jNg9s+P/JBBGq0W6x+g/aoQDtVWJ
         iIUV4Op0Za1w3Vmgz3Ls5wYNPuBJjU0wsweXWdTWjUf4lOmiOlwr5Gg6bVW40jcwKMdd
         FcgD6w+H3xcQ36+mG9vZH1z2cVgE5p7v5yd7i0VAdEPXEHp3zyhJhjSbpnHn38DdQhH6
         CLyw==
X-Gm-Message-State: AAQBX9e+8TZZW7T42uMm32EYqEFEWw/OiQu9QcKh73W+xyvZEZzWkM+k
	KjWrS8V2wGW8ZGH8qkfvzr0=
X-Google-Smtp-Source: AKy350Zm5/ATFD50uFkvJSI4h7GVs83srZ2sleq5RncSnBnC4X7VSxN0NN70mOhkcAIMMl0GJDBRIg==
X-Received: by 2002:a5d:55cf:0:b0:2f5:aadb:4642 with SMTP id i15-20020a5d55cf000000b002f5aadb4642mr945310wrw.41.1681378650844;
        Thu, 13 Apr 2023 02:37:30 -0700 (PDT)
Received: from [192.168.0.32] ([37.222.243.26])
        by smtp.gmail.com with ESMTPSA id w16-20020a5d6810000000b002e5ff05765esm883268wru.73.2023.04.13.02.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 02:37:29 -0700 (PDT)
Message-ID: <a311d52c-a07a-fdfe-5b48-502d05f70737@gmail.com>
Date: Thu, 13 Apr 2023 11:37:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] soc: mediatek: mtk-svs: change the function
 IS_ERR_OR_NULL() to IS_ERR()
Content-Language: en-US
To: =?UTF-8?B?5YiY57Sr55C0?= <ziqin_l@hust.edu.cn>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230406024200.3126080-1-ziqin_l@hust.edu.cn>
 <1b48b0ec.3b004.1877971d059.Coremail.ziqin_l@hust.edu.cn>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1b48b0ec.3b004.1877971d059.Coremail.ziqin_l@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_023735_770749_D87CCBAB 
X-CRM114-Status: GOOD (  14.90  )
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



On 13/04/2023 09:08, 刘紫琴 wrote:
> ping?
> 

Please be patient, maintainers are sometimes busy and can't cope with all the 
patches at a time.

Please don't top post :)

This was already fixed and applied to linux-next via
https://lore.kernel.org/all/20230202124104.16504-2-roger.lu@mediatek.com/

Best regards,
Matthias

> "Ziqin Liu" <ziqin_l@hust.edu.cn>写道：
>> nvmem_cell_get() will return an ERR_PTR() on error or a valid pointer to a
>> struct nvmem_cell but won't return NULL, the check function should be
>> IS_ERR() instead of IS_ERR_OR_NULL()
>>
>> Signed-off-by: Ziqin Liu <ziqin_l@hust.edu.cn>
>> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
>> ---
>>   drivers/soc/mediatek/mtk-svs.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
>> index a7eb019b5157..8127fb6d587b 100644
>> --- a/drivers/soc/mediatek/mtk-svs.c
>> +++ b/drivers/soc/mediatek/mtk-svs.c
>> @@ -1726,7 +1726,7 @@ static int svs_get_efuse_data(struct svs_platform *svsp,
>>   	struct nvmem_cell *cell;
>>   
>>   	cell = nvmem_cell_get(svsp->dev, nvmem_cell_name);
>> -	if (IS_ERR_OR_NULL(cell)) {
>> +	if (IS_ERR(cell)) {
>>   		dev_err(svsp->dev, "no \"%s\"? %ld\n",
>>   			nvmem_cell_name, PTR_ERR(cell));
>>   		return PTR_ERR(cell);
>> -- 
>> 2.25.1

