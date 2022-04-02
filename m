Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4EBC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Apr 2022 16:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=okkqeEeNl7pLQVQp0h8M0N70n1jAVdUggWtvPbNKAcA=; b=Js/6rRfPGGltWy
	SleDEl4qiJNdfarH+VZ8abCqmako5rHKpg+rFEbAFQRrvaQ5DR67DS+jvIw5QjzTYJ+2LSicDomzW
	c7iRIBcburPRVmxBskubAYv+HddPb2IQnvyhxRC3qXcsgSuh45JXdEPFDZ7yL/w5/rUZjTBQ0IYV/
	gY+m3zoSmxzU+QYsk2f+03vEFMY9wKkWyjBcJAbz8MfXK0+ot3F8s+30mtU6GH69D67uIJLEEy2oU
	/bTFm/CQswJnL83ntQr8GpNkzXRpqZUvzudZdVPNElByDw9XuxGThgy6NSLFEXdahp2Q8oi0z/xTd
	D26k+sBEdscuVIoEWZNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nagV5-009aRK-AS; Sat, 02 Apr 2022 16:21:19 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nagUu-009aHm-P2
 for linux-mediatek@lists.infradead.org; Sat, 02 Apr 2022 16:21:10 +0000
Received: by mail-ej1-x62f.google.com with SMTP id bg10so11765631ejb.4
 for <linux-mediatek@lists.infradead.org>; Sat, 02 Apr 2022 09:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mnGt6W+Yxzjo9+/+HIyfnhtyS1WFSMtagQnoizbL1R0=;
 b=GJwZFGWMfHIBnC1wfxgc9r7rpLndt29L5PyMvPW1IFf+DRW2csbfA1olTD5scsM+SR
 dR20QG4DtEqIoAKSZfVB4YCPysxcGzrePbMs9EpqU5RRbYmg2hVdja0oIjKH7Q8YA18B
 Ah0LQQJJP56KZFtnNdO0nkaND7gz4n3Mrn3XDBRcfjc6LgMtUZpv/rrn7xdnr6upoqWK
 G9QU/IDTJ3hwr48aPieGhLZ5ynK6xU/mXHC7pPFzx/3dhQEriL12ADhztEptk8Aaf7iP
 0DeOfCQPgiZCPa29SoIWawVINwv3wuyypuV7fOLFHGwxOoLf4teOF0IXwcxqANHymCg8
 nkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mnGt6W+Yxzjo9+/+HIyfnhtyS1WFSMtagQnoizbL1R0=;
 b=h90JGB8MFkUOcARtQ2Ywmws8kOeN0tvi8LZSLNMPPsXWYNWi29hwyop5PxcLsAzKqn
 EKpEjHtd3Av8h6TGBIMvaJbRnFPjdRBq9lE/eSC57wuGXhY2bD6JRf7ufxutQjGGsMmy
 KqpXMoucPPQnroqnzQyQZXP37PMcM/1Vbi9nnaKOQICUDlGoF73E9fUiVyJQUweE+SWD
 b4o5KVBQrEqN3B2Vb87jG4ivB2QXvYEoBEkg4APZ0gp+LkLQi+4kuB7Jax816ctBBJwX
 M3sOZoCTuKKmr4k2Dp3sIU3M/JzPeAiGkf1bLx8bKta3CvLLET21gUD/ME2mqdt/AEm+
 b0gw==
X-Gm-Message-State: AOAM530aJk7Gg3O5FUEqae/Pc8PK5iDxkiby2lG8MCeh9KhncUjdhbOe
 5R2XpPiuDTHt9f930A5Nlouy5w==
X-Google-Smtp-Source: ABdhPJwr6iufJ5ANsNQoEWLNc+tMOFQ/Hxw54wk/gFKN6u6OnQXSWTkJJ9vsUMAaFPtBFxpnVzSNBw==
X-Received: by 2002:a17:907:9718:b0:6e0:6faa:3aa with SMTP id
 jg24-20020a170907971800b006e06faa03aamr4338206ejc.307.1648916464849; 
 Sat, 02 Apr 2022 09:21:04 -0700 (PDT)
Received: from [192.168.0.171] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 e11-20020a50becb000000b0041b64129200sm2709359edk.50.2022.04.02.09.21.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Apr 2022 09:21:04 -0700 (PDT)
Message-ID: <7d66c6ce-80d9-3a09-b34c-7ae5a7763465@linaro.org>
Date: Sat, 2 Apr 2022 18:21:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v13 1/2] dt-bindings: mmc: mtk-sd: increase reg items
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org,
 wenst@chromium.org, chunfeng.yun@mediatek.com
References: <20220330094532.21721-1-tinghan.shen@mediatek.com>
 <20220330094532.21721-2-tinghan.shen@mediatek.com>
 <aebbb5c8-1d27-5e66-e18a-e2b647bc8cb4@gmail.com>
 <53cb53b8614aa39e0785b99f46b708ad201c3dd8.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <53cb53b8614aa39e0785b99f46b708ad201c3dd8.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220402_092108_883936_5DE0D49E 
X-CRM114-Status: GOOD (  16.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 01/04/2022 04:18, Tinghan Shen wrote:
> Hi Matthias,
> 
> On Thu, 2022-03-31 at 12:54 +0200, Matthias Brugger wrote:
>>
>> On 30/03/2022 11:45, Tinghan Shen wrote:
>>> MediaTek has a new version of mmc IP since mt8183. Some IO registers
>>> are moved to top to improve hardware design and named as "host top
>>> registers".
>>>
>>> Add host top register in the reg binding description for mt8183 and
>>> successors.
>>>
>>> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
>>> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
>>> ---
>>>   Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 15 ++++++++++++++-
>>>   1 file changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>> b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>> index 297ada03e3de..2a2e9fa8c188 100644
>>> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
>>> @@ -40,7 +40,10 @@ properties:
>>>             - const: mediatek,mt8183-mmc
>>>   
>>>     reg:
>>> -    maxItems: 1
>>> +    minItems: 1
>>
>>  From my understanding adding minItems is correct, but you need to add also 
>> maxItems: 2 as there can't be more then two register entries.
>>
>> Regards,
>> Matthias
>>
> 
> After add "maxItems: 2", I get following message when doing dt_binding_check.
> from this message, it looks like that maxItems is not necessary.


That's correct, you don't need them because "items" defines it.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
