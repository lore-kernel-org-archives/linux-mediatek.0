Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E99C76196
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 14:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1v1oqbGwtutANfbZAgt8lNsLuoBjX9Am//6Vl/oFEfA=; b=SCmxU7JQICPJcgNMs7cr4cYuDJ
	fKXJFsQs8XZrxazfWGHzbXarMF9SIX5+wG2H4Ij5tvxO74n96NmCNiCb1qDPzmy2WzKronckZCQI3
	Mn5+yeLSrVvxA2vmsbJb2we0UuqhNc/CDIMCin9tCCgeYvFFm4SOQ9uvyM8BwlZdDNfGsYjx2zxWW
	btkmCTW9+AvL/qcDD6/Hd7CB39Z7eg5jTqq+4leOA1fo57dVCCJcqMYneyl9+7Lys4ugxu8pdzd9E
	cdbQm/1w9uFcu9K9davVnbRGxlmr7ZOBm46sXErztxYvLB0BxGJnhZo5UUwLxdkgWnfvl/JkscQbx
	W5v+LHSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piGAE-007oDa-1q;
	Fri, 31 Mar 2023 14:55:38 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piGAA-007oCG-3D;
	Fri, 31 Mar 2023 14:55:36 +0000
Received: by mail-wr1-x42a.google.com with SMTP id l27so22718930wrb.2;
        Fri, 31 Mar 2023 07:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680274530;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1v1oqbGwtutANfbZAgt8lNsLuoBjX9Am//6Vl/oFEfA=;
        b=K46Ne0U68WOC0jQyu1f6ef7pr7GDPh7f4Pjgd6JONmZ5vhy5RMvhlW4VUj7raalPXN
         aEAk419VYn+zMv1le8W80jEHTMAuP6mrf+zTSZazTT2K9obzDGaxQ54JqA4M3jRsWzm/
         dzQYQmw7NFmeKkZcjrgHRL1q1/DLzK2Ia3Iiay9q3+FhUszWuTwM65xERLQfBXgCe/Ot
         5yHZkVsNtjhU+MYbUZNaBz9IKuQO6lM1tlRrF7954KM39osWlOJHgnX0fDRKaOPXByTn
         BlYJiRupf+OVpQDWadhViNPq7nGEQqunlLJhVmTKX4eUDkUnW3y6BS7FTCh9aneafmAG
         g6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680274530;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1v1oqbGwtutANfbZAgt8lNsLuoBjX9Am//6Vl/oFEfA=;
        b=7gD4wjhESMUewVLsmqFxybHEAW6HfjGLXLhZAgNt8xb8ftU7W2oqYnx3Nl9qNw5FIF
         8XVgI7QMChulpXk/gRFAm9j6fH87x03YJVJxh5wRdWJI3Ec/zJPnac6UAALim1QQNnHX
         Eb40B99WpharOnq+WQ0BjFc/caMQntvrBcxw9lfNgvUM2zdeVcevaIgMY+Q4ZOoDq6bx
         pDSxx+fWSvRmX3kl0fzMVXchfl4W3zWOFfvw8Usn+MKTHqWF5WwVTaxtv/y622Mif5NY
         q6UdNPAF5bj4K1ZMGq1mqNs4+/knUnK5kS6CobMy1pE7iJyx9fxpix+VaMF/E0pBmFfF
         pPNg==
X-Gm-Message-State: AAQBX9fF4bCsKdVVEsbLeO5TXjVtMwnLAoKw/QlRywBi/FJ4XMtwJXqf
	tLJ1L1hZKkuQ1zxuHd7CZoQ=
X-Google-Smtp-Source: AKy350YSKtIqzT8X8vCZa/0jBsvl+GqGNYLY0iKeyTokK7bymrPZFg5K6qU89SULQhw0gw/NXjZGpw==
X-Received: by 2002:a5d:4dcb:0:b0:2ca:8da1:db96 with SMTP id f11-20020a5d4dcb000000b002ca8da1db96mr19386253wru.50.1680274530116;
        Fri, 31 Mar 2023 07:55:30 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g6-20020adfe406000000b002d743eeab39sm2398567wrm.58.2023.03.31.07.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 07:55:29 -0700 (PDT)
Message-ID: <c8861fda-63c6-7951-29a7-9d29a73e8f3e@gmail.com>
Date: Fri, 31 Mar 2023 16:55:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding
 <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-1-45cbc68e188b@baylibre.com>
 <CAAOTY_8G03TpY88hMmUgbq5E6P2Y8h5a4DB5T72qfNG6CA+NQA@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 01/21] dt-bindings: display: mediatek: aal: add binding
 for MT8365 SoC
In-Reply-To: <CAAOTY_8G03TpY88hMmUgbq5E6P2Y8h5a4DB5T72qfNG6CA+NQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_075535_055929_E2E0A9BC 
X-CRM114-Status: GOOD (  12.24  )
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

Hi Chun-Kuang Hu,

On 13/03/2023 16:02, Chun-Kuang Hu wrote:
> Hi, Alexandre:
> 
> Alexandre Mergnat <amergnat@baylibre.com> 於 2023年3月9日 週四 下午10:23寫道：
>>
>> Display Adaptive Ambient Light for MT8365 is compatible with another SoC.
>> Then, add MT8365 binding along with MT8183 SoC.
> 
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> 

I'm a bit puzzled that you give your reviewed by while I would have expected 
that you will take the display binding patches. Will you take these or do you 
want someone else to take them?

Regards,
Matthias

>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
>> index d4d585485e7b..d47bc72f09c0 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
>> @@ -33,6 +33,7 @@ properties:
>>                 - mediatek,mt8186-disp-aal
>>                 - mediatek,mt8192-disp-aal
>>                 - mediatek,mt8195-disp-aal
>> +              - mediatek,mt8365-disp-aal
>>             - const: mediatek,mt8183-disp-aal
>>
>>     reg:
>>
>> --
>> b4 0.10.1

