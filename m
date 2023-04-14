Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69B3C77B71
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 08:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBhd+vki+l/y35U/QxrHM0V6qWO53SJzOsxvHiS3VI4=; b=kKoBREg2weHavIF88U0JFn7M29
	ZkMaeVuxFtb7TiIqR6fze+he73fwgZ6gJ5a1gg4SkMgKuENyYFfqMD0a1xlv3jjLhWpt63ebgwSLf
	8nzh0khVR5HSFvx919tphciwZgbxJr+YJac8O7J3INOkexAFBU4GTbx7Ij8r78nBli/Bq6UrRmE6F
	eppQA6YmZYFw9VaQ1KG6fFVMIuh+74DLvZlsVk2zUII9E2W2MZYbPUiCN1Z8TqiV6s6KnSY8g9JJD
	iLSevhIk6mSg19vZQUygPMCDxkmSTkdbaGyajlhzkAV1ir+lvZTrTIL3klABHTMwb0CWoYLz25UZx
	n0tV6sTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEtT-008jIV-2u;
	Fri, 14 Apr 2023 08:34:55 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEtQ-008jFT-0h
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 08:34:53 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50685f1b6e0so121185a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 01:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681461289; x=1684053289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MBhd+vki+l/y35U/QxrHM0V6qWO53SJzOsxvHiS3VI4=;
        b=IkuwrlTZ7zhdSP0BuUPKvyREuOd14Kbfh+OkUBnZYPh19M/pPTs1AehNACOKrDUdOG
         mS4MITBjLL7awLODadt0N7TgsMQrt20z+ehY4MsckGyU/ZLfEpRUMjJ6zZJFFo1pUHm+
         DaOoGRLicugjTWnlVrxNhWHsxHKyfybWO7o1a5FbdhVsF2XFWdtON7SqlBPMawhF3wMn
         FgcSDitIhYEKTfb/ee7KSmy9bA+543T+wqlwInRxiSu8cwOxfZjhq57bAYdmU3dSXrxH
         nEIwLbiwZWKYu1v4zqBLmdoTxBkfuWIR5SYBNxNo67kvqzNok8hvxQXzZI/WpPM9sHD9
         aXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681461289; x=1684053289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MBhd+vki+l/y35U/QxrHM0V6qWO53SJzOsxvHiS3VI4=;
        b=SHyNi5hbo/ttd6Wb+/oybi2qow/nyJdE829k90RH3RdPlzQqK36fuUv1UwW8cRqtwe
         Nm/0zmyB9/bSn+NBS6qOR9NYKfw/NOPBr75AqsYI6BusCgv7vwD1O1DM2oiFcmJn99zs
         Hf3IKo7DkE/wjNGXuuRbIKh1JfTqL8qUCw9ywFX2pVWM4f+pL0Yjmi2uufzlbtnJ3hTI
         YOAtGEDisAyaeDB9ElFLBV/Tca92Sj4o8Z5UZjkIIyX0LfbCGxaY5QyK0SbZdyPg/Z+l
         iPIB/XGE3mn92Gq4IVQtDICG/5DCqfN2Izvcz3cpgpf1atOeMIgbb7Ot1Q7DpOsXwbhE
         6oYQ==
X-Gm-Message-State: AAQBX9cGbxJv1yNPupyqQun/buRn34LzsK6P64/Af7sabIWTJpjXSrTz
	8QLa2f4xra5l+eWgqV83CidAOg==
X-Google-Smtp-Source: AKy350b+AJCpD5JSQDbMuD6wVN5frKxcfCROijIG1NiaMj6S2xAmFKa5BnZL7BAyt/fgf8Mo/weUUQ==
X-Received: by 2002:aa7:d50f:0:b0:504:80f8:f6b2 with SMTP id y15-20020aa7d50f000000b0050480f8f6b2mr4795583edq.25.1681461289674;
        Fri, 14 Apr 2023 01:34:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id j23-20020aa7de97000000b0050432d2b443sm1883036edv.48.2023.04.14.01.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:34:49 -0700 (PDT)
Message-ID: <f8a4fd52-52b6-dded-c8b7-864be549e2ad@linaro.org>
Date: Fri, 14 Apr 2023 10:34:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek
 MT6795
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, chunkuang.hu@kernel.org,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
 houlong.wei@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org,
 kernel@collabora.com, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
 <aaeeb18d-f8e8-d6c1-1272-e5b797554b9e@linaro.org>
 <20230414083019.cpomx37tax4ibe5u@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230414083019.cpomx37tax4ibe5u@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_013452_254760_5DDB62E4 
X-CRM114-Status: GOOD (  17.39  )
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

On 14/04/2023 10:30, Uwe Kleine-König wrote:
> On Fri, Apr 14, 2023 at 10:21:05AM +0200, Krzysztof Kozlowski wrote:
>> On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
>>> Add a compatible string for MediaTek Helio X10 MT6795's display PWM
>>> block: this is the same as MT8173.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>  Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>>> index 0088bc8e7c54..153e146df7d4 100644
>>> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>>> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>>> @@ -22,7 +22,9 @@ properties:
>>>            - mediatek,mt8173-disp-pwm
>>>            - mediatek,mt8183-disp-pwm
>>>        - items:
>>> -          - const: mediatek,mt8167-disp-pwm
>>> +          - enum:
>>> +              - mediatek,mt6795-disp-pwm
>>> +              - mediatek,mt8167-disp-pwm
>>
>> This does not look correct. You do not add compatible, you replace
>> breaking all mt8167-disp-pwm. At least it looks like this from context.
> 
> I thought the old semantic to be:
> 
> 	"mediatek,mt8167-disp-pwm"
> 
> and the new
> 
> 	"mediatek,mt6795-disp-pwm" or "mediatek,mt8167-disp-pwm"
> 
> . What am I missing?

The new is ok for mt6795 but it is not valid for mt8167.

Best regards,
Krzysztof


