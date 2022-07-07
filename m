Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5557BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 10:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWk1Z5M5SWdApDSOa1sdcUjH/ZrS41Uj70CxP1iIBEY=; b=4zM7h6Z8XtwBDoyxPD+viiOvgn
	/44ViUl3riV4g7L/DUc7mQvqWX/PkXnvqlvkhxTb4xgoioeUvTL1e96nyhyE3Qi6APxIVj6USHwiy
	Oqbk+GfhYYXnfUW4LtmnZ+1p1VP0Z9WaqFIQS9AA2pB1g1KFOUxq66ikBoB1nX24T5as03ShYG9ax
	kqobawcQ3D3GRPYb+nPz5M8T7r0mjje1P06/JaGsU6N5VJ+WCrLrI2eDmhEP0WBDQP6oWhiFm0ld4
	Airmu1A8fIuYM93f/l0rAXOSkSK7+qPLA09XKnhKHS+ycDJSvVCReYcH2v97/1NL71KZhNJmpgiJ3
	2QJeitrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9OxX-00Fd6h-6z; Thu, 07 Jul 2022 10:42:11 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9OxE-00FcuZ-8d; Thu, 07 Jul 2022 10:41:53 +0000
Received: by mail-wr1-x42a.google.com with SMTP id v16so14262444wrd.13;
        Thu, 07 Jul 2022 03:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=AWk1Z5M5SWdApDSOa1sdcUjH/ZrS41Uj70CxP1iIBEY=;
        b=Q9i8+V9mX7CMwLFG1MVGGhx8nrZVt5/zzB9FFoo4v8WHX89lbh1JhLeXgY5L9pKoco
         iRbJ7H2bZDSvjTe6f/HnJob3uyUBaV55v2LPxGsdH94HrSQ4kvebHFCeCGv7LlB9AKu7
         RrDEddLM6hngxF1yJMMC5JraOJsa1DnjE6RzRYjDsl4jBAqBV3rqxPXREKp8TwzsOkdt
         Eg5XbdWvU5CFUhtBHkzXrvapyIWK1NQh9z3wjMr66enK0/aW/HMuDsJXPkttKS0NPW92
         w+rYrB9voK80ctcuQI7pAdE/tLsBOd9B3EfrrL1e3CGs20Giw5HDR3jgeO8aneXyBXtk
         bXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=AWk1Z5M5SWdApDSOa1sdcUjH/ZrS41Uj70CxP1iIBEY=;
        b=E1FJChhafIDysE+LjbdwkPjdKJ09M5T9o1WWoCV/8SzPGlALo17Mq26Oh/d1lKrghP
         L2hXGxAq1bfu1I/+huYpkDZIW1TJH6XjWaL/0m1bCpREpJkmHln34XFbaaWs4OabiEW5
         WURE5GB2QB0LhwVHVabjoG8AL/2y514/Ac3Hjuk4MUKQ8oJ0G2mVqTHDEfYUdERtaBI8
         yf4p5Gpj3qb2zi/MvJDl3uXei9xmF+Sy4Ls9e/BVVWyUykHU0U3Yt37LvMB2y/m+Vcx1
         XcAgy8TZ/ws+vHZj8hXJp9XEYd8k2r9dx+6X05IHPFRncRd7zmavx8iPe9iPwLyaeWYF
         PhJw==
X-Gm-Message-State: AJIora8+UQqITa9HUemoUnIo9OZFOK5gqxhIu3pekRWe6x9uNSPVPRCS
	tfG1p5FBc0iQ+3eVhwIUaZk=
X-Google-Smtp-Source: AGRyM1t2zasbMiF3MWY2dw1TcEEKZ25K4+xE5Ii9yxj9FzxvwTPc8TRwQ7+xwCe9gkFE7vgFIV8tuw==
X-Received: by 2002:a5d:6da2:0:b0:21b:c9cb:f96c with SMTP id u2-20020a5d6da2000000b0021bc9cbf96cmr42764518wrs.670.1657190506913;
        Thu, 07 Jul 2022 03:41:46 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id d7-20020a5d5387000000b0021d5c52f4b4sm14133497wrv.34.2022.07.07.03.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 03:41:45 -0700 (PDT)
Message-ID: <640c1a9b-f8b5-aa89-19af-7d6f5c55eb12@gmail.com>
Date: Thu, 7 Jul 2022 12:41:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Xiandong Wang <xiandong.wang@mediatek.com>
References: <20220705122627.2273-1-allen-kh.cheng@mediatek.com>
 <20220705122627.2273-2-allen-kh.cheng@mediatek.com>
 <5916c91b-41a1-c97a-84b4-7d48739a0639@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: mediatek: add mdp3 mutex support
 for mt8186
In-Reply-To: <5916c91b-41a1-c97a-84b4-7d48739a0639@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_034152_355490_87F06183 
X-CRM114-Status: GOOD (  14.28  )
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



On 07/07/2022 10:52, AngeloGioacchino Del Regno wrote:
> Il 05/07/22 14:26, Allen-KH Cheng ha scritto:
>> Add mdp3 mutex compatible for mt8186 SoC.
>>
>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>
> 
> 
> Please drop this commit. Adding a mdp3-mutex compatible is not needed here.
> 

Thanks for checking. We probably would need a fallback compatible. We can only 
know from the HW engineers that can confirm if the IP block is the same as the 
disp mutex or a different one.

I'll drop both patches for now until things got clear.

Regards,
Matthias

>> ---
>>   .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml         | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml 
>> b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>> index 627dcc3e8b32..234fa5dc07c2 100644
>> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
>> @@ -30,6 +30,7 @@ properties:
>>         - mediatek,mt8173-disp-mutex
>>         - mediatek,mt8183-disp-mutex
>>         - mediatek,mt8186-disp-mutex
>> +      - mediatek,mt8186-mdp3-mutex
>>         - mediatek,mt8192-disp-mutex
>>         - mediatek,mt8195-disp-mutex
> 
> 
> 

