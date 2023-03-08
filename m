Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8224C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 10:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fGIZnLIFi80hX7HHpoCzBcvuUsXk3QpRs3UM2gL+lo=; b=3vvs2U789pFWo2R77ISaBwXLli
	hQowDCJCI7Xx+ClupuMgmZFcMF96jbiTSs40j9tKKQe1VZ2HahDPij0+WfOCGKiWX3Abmr3IjOG8n
	NJhV+8w1nlUaCdqmvrkfToW5caNkAxx9bHzUL1+3so52UeyzT7l9tmdJLHmpChDNNZ1wVw0eff5nm
	hG6xKpdSk/E8oTxKWp8QjBNOKUHv+bfyMTiCe+nCzX6LXEd0+VRictBaAHB/uc1Xwle7zcjR0fnnE
	bnHERfBTIX37IwDerq008UPMGbO8QTcHVmgFhQGidZ+GKj9OLbzoPPGkqsciloV4M8VWbaHsZnG3j
	II6r/8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZr5d-004Q82-WE; Wed, 08 Mar 2023 10:32:10 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZr5T-004Q5N-6H
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 10:32:00 +0000
Received: by mail-ed1-x535.google.com with SMTP id da10so63805272edb.3
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 02:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678271515;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5fGIZnLIFi80hX7HHpoCzBcvuUsXk3QpRs3UM2gL+lo=;
        b=gaQALzwpvcbL7KPjaDCk/STd4S5aL7hRPMVMHnoSgsnqWzXFVM8O2mTRBeM87QN8d6
         3RwBwl5RZ2MBa9OEXFWpjKDF+zDVQffKtQ6PfH57Vet14nyHXuigr6dcLcAKvp1yJjc1
         wCI/EZ8n9413H3OBa+1dgCXU7yKmY2+Lmu9ymbGXr+TD690DwPjGa59/zWr1WP9n1O9U
         7CpbJKPhs0YNMeuRt17ycKlbvX07jNubQabi33ykwGWV0XlibhYTmCGf2mJeT5V8DvGg
         tzaN7OEUUfhdPShfmhdoFsQPChx8m7hxGojLvgGstBPHGj9wVnYtdZGs7y2VOAoAemQH
         6HwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678271515;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5fGIZnLIFi80hX7HHpoCzBcvuUsXk3QpRs3UM2gL+lo=;
        b=wqdr68FQdH3Wc4ol2yVBMzYnnqoZbimYfKwN81cOTpB14UZxAAJdQ9kFEEQ0giP4Kb
         4gY54LhxdJCiClVo91iWT1T3daFMhMotgmDdBaKbBHVeB3M5u/K+sN5YX+H7reDL45YU
         7Yl0CHLnaruzil5p3JXpFtxVW22CByGbZhGs59ct+D1Lx6z0mQBJh9c4U6iezEEZhx7r
         vhH9jD8t1yD65+y83EHLY+rmuMx2jvDuip2QWXW7jjrGzcy6+yIM8f32pPc5bp1bimPa
         SS+cG8mXur1k7BCxS2ijvEr0A452pTSmKYUuOtQUWDfwCxP1Zr6g8gXbJx4oh/NFaIfY
         Y7qQ==
X-Gm-Message-State: AO0yUKVJ48C1+qunURhQHnmauNP/xeR3t0wLL6OvXNrDpoVEIhP9uLT3
	/WiREUKQz1JGRdB1pXNRxANnrw==
X-Google-Smtp-Source: AK7set/CYrEyIuSLyDDUXZR3jqT/vTu4yPfKXeDaChxuxkK9rk3kb6SHstIlWaN87B5ITGrT/52o2g==
X-Received: by 2002:a17:906:8a64:b0:88d:d76d:8527 with SMTP id hy4-20020a1709068a6400b0088dd76d8527mr15589278ejc.47.1678271515159;
        Wed, 08 Mar 2023 02:31:55 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id h10-20020a170906718a00b008c33ebac259sm7284857ejk.127.2023.03.08.02.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 02:31:54 -0800 (PST)
Message-ID: <dcf2b583-4b42-85b7-4de4-fb0b5011af5e@linaro.org>
Date: Wed, 8 Mar 2023 11:31:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/6] dt-bindings: memory-controllers: mediatek,smi-larb:
 add mt8365
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20230207-iommu-support-v1-0-4f0c81fd52c1@baylibre.com>
 <20230207-iommu-support-v1-2-4f0c81fd52c1@baylibre.com>
 <4dba4db2-60da-02fe-6237-c5893fdf2e14@linaro.org>
In-Reply-To: <4dba4db2-60da-02fe-6237-c5893fdf2e14@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_023159_269265_E6098EC4 
X-CRM114-Status: GOOD (  12.33  )
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

On 08/03/2023 11:30, Krzysztof Kozlowski wrote:
> On 07/03/2023 14:46, Alexandre Mergnat wrote:
>> Add binding description for mediatek,mt8365-smi-larb
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>  .../devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml     | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
>> index 5f4ac3609887..aee7f6cf1300 100644
>> --- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
>> +++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
>> @@ -34,6 +34,10 @@ properties:
>>            - const: mediatek,mt7623-smi-larb
>>            - const: mediatek,mt2701-smi-larb
>>  
>> +      - items:
>> +          - const: mediatek,mt8365-smi-larb
>> +          - const: mediatek,mt8186-smi-larb
> 
> You need to fix the allOf:if. It expects single item, so you need to add
> contains like for mt2701.

Wait, this was about common. LARB looks ok, but double check.

Best regards,
Krzysztof


