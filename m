Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE45C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 10:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tND8dMZ4UYN1tPgLmPx53SiIZZIqD2HEaBgLp/G2TeM=; b=aR4CAtU47SiSd3uFD7TXc2sSfn
	uKmwIT+x8zBLncPU9Qnv7C9XpYoVLyvC4xIdcTEKg5MEU+l6j0uHb/8SRAPyI+1TJ3Ua456n/f1FR
	nohzcQ/vdcv0R9O+EPuGb94ybzcZzY6dMCCHE8FlmXf15exZQjQd2AIjT8PDAb2wVfK7t5eVFIUYG
	lWoajYUY4s4yHDFhBq5q4MBG07pL9JICBLBjP8W0vT/C3rMdhsySxDfALuVhSGrVDGRxccykl9/GZ
	/m27eZBWZRLzgBmMtqVcFndkrAHEsM3rlkKhaxJz2kQg1mR++GDoIxU69k1B+rScZ6wyAHBl6e79p
	zXCqiT7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wSX-00DVqf-Iz; Wed, 21 Dec 2022 10:36:25 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wPP-00DU18-JO
	for linux-mediatek@lists.infradead.org; Wed, 21 Dec 2022 10:33:13 +0000
Received: by mail-lj1-x22d.google.com with SMTP id x11so15167773ljh.7
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Dec 2022 02:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tND8dMZ4UYN1tPgLmPx53SiIZZIqD2HEaBgLp/G2TeM=;
        b=UnSlf9Rhd8aRFFkqHiDrBj0ry1RguPMiz9Lv3xMQh2JPGHHvjOoLjolz8OHwK3FJOF
         KH8/9UiOtHq+1xys5RZGTubjWv1XIxq99OC+KdUKw/FNrkRpeYDWdWa8CC7Lj0i44gcr
         enmAnd2tr48Z6TD7P13KK7PovTdF45jYLHtqnwaGReb5SE4wN5DiOMXHO2/7/iKmDze+
         bWLchDN30mwJwnDCwmmTL84x5TPKN+LnOvvlpSsi3rKzTvebFKg4xc+jMFNP5I/ja2K2
         w+p8/skyt1gTlQAG69dXxeZqC5W5remmcRTrPKIjX2yXfZvmigCj8aX/P2ohE9+rEIJk
         Ucaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tND8dMZ4UYN1tPgLmPx53SiIZZIqD2HEaBgLp/G2TeM=;
        b=YUiDZ5vN4lsw9TTruiJaZkcnhE/6xXuar7ul2vAcFp1ViI0EpJub8G/VCyxs5UQ1PA
         dejUofE6Ism3So7s87Iuz9/8cfdrTvVpeGBuaQBW4T3ivxFDMcPGSwtE6ceKuC5eZU93
         gqVmn6yCC725Ccdscpf3uc4aJsm9UMzgr7VaGiK2Cc7GrLT4bNwzwVRBuFq3fPhvcBOl
         aMneOAXLGUBV5meUhtTx+8Hmph7YpML9FMUklzCY+rZCyKSVo4nLFbnhnVOijPKNhtrs
         09kc4XTWpCGwolJPEtPHgOhramq5qvQVUkIHt9/Qa7pR4BYRGThV2iogTOlAvXK2QS8N
         ghDA==
X-Gm-Message-State: AFqh2kpmvuMPYkznfD6EOuyGUQ9SjU/cPwy5epkv5RtWki8YDJBmA0kR
	WPYOfsz1oH2c4fO2pcLVx37BCQ==
X-Google-Smtp-Source: AMrXdXsJHVlkkI/BZHuiAvMoxQ5LOirVOUmT+bS3Zi3OPHcp+nkbM/OQR/hoQziwvFLBBAqVlRnbvQ==
X-Received: by 2002:a2e:8652:0:b0:279:bd34:dcd7 with SMTP id i18-20020a2e8652000000b00279bd34dcd7mr448734ljj.48.1671618788767;
        Wed, 21 Dec 2022 02:33:08 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id v15-20020a2ea44f000000b0027f792ed10fsm1046801ljn.134.2022.12.21.02.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 02:33:08 -0800 (PST)
Message-ID: <403b0310-070f-1ecc-2188-95c22859bae1@linaro.org>
Date: Wed, 21 Dec 2022 11:33:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 5/6] dt-bindings: arm: mediatek: Add missing
 power-domains property
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ikjoon Jang <ikjn@chromium.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20221221034407.19605-1-allen-kh.cheng@mediatek.com>
 <20221221034407.19605-6-allen-kh.cheng@mediatek.com>
 <ec927229-cf03-136c-5629-22719110313a@collabora.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ec927229-cf03-136c-5629-22719110313a@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_023311_743564_9C0BA367 
X-CRM114-Status: GOOD (  11.56  )
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

On 21/12/2022 11:22, AngeloGioacchino Del Regno wrote:
> Il 21/12/22 04:44, Allen-KH Cheng ha scritto:
>> The "mediatek,mt8192-scp_adsp" binding requires a power domain to be
>> specified.
>>
>> Fixes: 4a803990aeb1 ("dt-bindings: ARM: Mediatek: Add new document bindings of MT8192 clock")
>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>> ---
>>   .../arm/mediatek/mediatek,mt8192-clock.yaml     | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
>> index b57cc2e69efb..ce8dd2bfb533 100644
>> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
>> @@ -40,6 +40,9 @@ properties:
>>     reg:
>>       maxItems: 1
>>   
>> +  power-domains:
>> +    maxItems: 1
>> +
>>     '#clock-cells':
>>       const: 1
>>   
>> @@ -47,13 +50,27 @@ required:
>>     - compatible
>>     - reg
>>   
>> +allOf:
> 
> allOf is unnecessary here.

If you mean that "if:" can be without it, then it is better to have
allOf. It grows often, so you avoid useless indentation change later.


Best regards,
Krzysztof


