Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E92E4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 16:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQyl09KlJloEdEBqQvzLME/FpSxQBXsXA9LgutQFqVM=; b=3YscPpSA8tXsuA
	8iwRpLHl7NEWdYnmZ6fQUP2qbbd7PJU8Be819MniDvzWgJ2oRXy+PoT7nBzTrEa6oOPaX9tZrgnjO
	bjEQ8iouZo1TAFWLffTZwwLJL4s6fDRMDZkEV4WQK4sgnOb8ZG+xGC2M2lQySnBiICBr+U8CSV7Im
	jaxyaTrYMtBDxzJd23ptvqcQN5riKowSG8RzJRyIzM1Pnb+YNe1N6Ee8FL5VyAh5iVGz6EngdAzrD
	HIIDxBR3aQ6WmF5MSqZsd9RZsvGVbTwQwPoxI7Ko72RPXE/XDztgBL2wn47DfEljIxutl1Tijf5do
	5I4WBThRdsRW34OvVPaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmedg-00Gv3R-DG; Thu, 05 May 2022 16:47:40 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmede-00Gv2h-0R; Thu, 05 May 2022 16:47:39 +0000
Received: by mail-oo1-xc31.google.com with SMTP id
 l9-20020a4abe09000000b0035eb3d4a2aeso818351oop.0; 
 Thu, 05 May 2022 09:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mZ1v1Dle2stU/b+5xs8mW34KpIG2CizYWSGqBNU2Bz8=;
 b=kIU1IzWI2h67CczNZjDrAqOu+7amMiU9BNzBUsm9+8eUorQIgmZj8BUaj81G12rNlE
 68e+vrj64mqY2psH6XqJCnztqqa0PQYdUiFVwlZFCUdnB10Eq3yPNuX2et/Qb7IiyrBz
 y4P4CTgj9qHdFctipJQQLZooa5lZ6p9+t/FJlW5OsvmErxS/8SHDugMU5U/PNC8J3vyD
 1HBZIl3MmaWUixyDAUco2zkiEwyySzadAX4fbQwpaHfhPJt5wbSxkV0ayhNZoX6n7e5a
 HyZWZIVKJQiHg1IN3LnTM/Yup1dPA9d0emXF3/6nbwpE3BNPdT1+QaKsJavswdrAetPZ
 rYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mZ1v1Dle2stU/b+5xs8mW34KpIG2CizYWSGqBNU2Bz8=;
 b=XD7ghkC3Qt2g6XJNEeofxFLNwfH+XT28HJXmi4kqrYLr17BmUXnUj++WDXMoE6j3Dp
 lGhuZgHZ7U4M66UM62atRpPfGFnrss40TQPO3fRSzAXhj67iz+DHp2Zjj2J0E/YGaVEq
 v8tvECeZaQSGPNz8sBXBaEVFHFiMN+sMJ7KTdLVZA6wUyeO+ujf/KpfRoDB/VU+QuiH0
 O5/pFObbxMVsrmJX9n+FvS3GTuUkULZTKKMpnHVWKSvO/tfY5++nU31bDZgm2QYyT6hk
 r9oazqluklQm6RUigtdkJGZwq2ssjllgVGSnvi9+TmIKoec/Huwpzy4rqKPnXBfZc9nq
 DXPg==
X-Gm-Message-State: AOAM531Rxe+CVt+gExdqKscVsTOgnhBzTQd9dwgdSuaEVppQCG5tM3jZ
 hSrtAuXdD5kNKpR7OHe8Fr0=
X-Google-Smtp-Source: ABdhPJx/mBD6xFVnxfzAwXo9hN2FbyZEsHhGERFB1m4oe7WTeGkz/+OsH6gYEs3iDqleRPT+1WANlg==
X-Received: by 2002:a4a:b289:0:b0:35e:7d6e:97eb with SMTP id
 k9-20020a4ab289000000b0035e7d6e97ebmr9583599ooo.57.1651769255626; 
 Thu, 05 May 2022 09:47:35 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 t28-20020a05683019fc00b0060603221260sm799519ott.48.2022.05.05.09.47.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 09:47:35 -0700 (PDT)
Message-ID: <26c2fb0c-e58a-5864-4256-f60f948ca634@gmail.com>
Date: Thu, 5 May 2022 18:47:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/2] dt-bindings: ARM: Mediatek: Remove msdc binding of
 MT8192 clock
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, matthias.bgg@kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, allen-kh.cheng@mediatek.com,
 weiyi.lu@mediatek.com, chun-jie.chen@mediatek.com,
 linux-kernel@vger.kernel.org, ikjn@chromium.org, miles.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220429123133.28869-1-matthias.bgg@kernel.org>
 <20220429123133.28869-2-matthias.bgg@kernel.org>
 <YnGjScfQA9axBYBO@robh.at.kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <YnGjScfQA9axBYBO@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_094738_100516_116B6388 
X-CRM114-Status: GOOD (  13.84  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 03/05/2022 23:48, Rob Herring wrote:
> On Fri, Apr 29, 2022 at 02:31:31PM +0200, matthias.bgg@kernel.org wrote:
>> From: Matthias Brugger <matthias.bgg@gmail.com>
>>
>> The msdc gate is part of the MMC driver. Delete the binding description
>> of this node.
> 
> An ABI break is okay because ...?
> 

Because the code controlling the clock gate was moved to the consumer. This node 
did never ever represent any working implementation of a peripheral. Just a 
lonely clock gate that wasn't used.

Regards,
Matthias

>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>>
>> ---
>>
>> Changes in v2:
>> - Delete compatible in binding descprition as well
>>
>>   .../bindings/arm/mediatek/mediatek,mt8192-clock.yaml      | 8 --------
>>   1 file changed, 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
>> index c8c67c033f8c..b57cc2e69efb 100644
>> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
>> @@ -24,7 +24,6 @@ properties:
>>             - mediatek,mt8192-imp_iic_wrap_w
>>             - mediatek,mt8192-imp_iic_wrap_n
>>             - mediatek,mt8192-msdc_top
>> -          - mediatek,mt8192-msdc
>>             - mediatek,mt8192-mfgcfg
>>             - mediatek,mt8192-imgsys
>>             - mediatek,mt8192-imgsys2
>> @@ -107,13 +106,6 @@ examples:
>>           #clock-cells = <1>;
>>       };
>>   
>> -  - |
>> -    msdc: clock-controller@11f60000 {
>> -        compatible = "mediatek,mt8192-msdc";
>> -        reg = <0x11f60000 0x1000>;
>> -        #clock-cells = <1>;
>> -    };
>> -
>>     - |
>>       mfgcfg: clock-controller@13fbf000 {
>>           compatible = "mediatek,mt8192-mfgcfg";
>> -- 
>> 2.34.1
>>
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
