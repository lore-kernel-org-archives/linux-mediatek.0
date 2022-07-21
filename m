Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E73C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 13:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kecr5i+5DLqDAmpCrXdI3okGZBctpe1q4C972GZbARg=; b=ed+AuG0P/+qCLjup8vBtEIK1ie
	Tk8ugXqr87gjD6QfafCNS6lgAXJOrEk93lTLpQkdzEr3RlDtwI/RBRdwZJ/XuwhB5sLNFKuYrrNcB
	MNCcsxds1sQ+Yh0dGsne0UWXcW3rCslIo+ibEuQGEJGUlGPt0QMO8JBxbWU7RP2KV1C1QoJ26cN2x
	s0N/xIrh9HNi94YllUylESDKcHsyLpaN6wt0T7HnfWh6qx5YRs/inbPW+ZKfc8lL1nlgAsOIUqUFJ
	Sbea0Js63/eCd3PndOcSdt3FW2MWpJ3UUaE77XnYNT1sMU5a+CYQkfttmShHyc8hEupbldngyuAx2
	9dknI9mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWhd-007PbH-0b; Thu, 21 Jul 2022 13:58:57 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWaA-007HPg-Qs
	for linux-mediatek@lists.infradead.org; Thu, 21 Jul 2022 13:51:16 +0000
Received: by mail-lf1-x12f.google.com with SMTP id u19so2963904lfs.0
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Jul 2022 06:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kecr5i+5DLqDAmpCrXdI3okGZBctpe1q4C972GZbARg=;
        b=t+T9FmxDSET1eznoCZFy5FwJ1ygGlaE91MHfg567RS5eq0HIIhoshGcZqgbcPUTPs0
         DML/HMp9i7WzlYCUCDXr/j8xjWMaPLeurgwe0nr3WvKcjnX6/D3dqvvNQ530f0OMBeKD
         Ql4RQyM4kGU+93SJTClpPoh0X3m7iukKfp3+3Fv5gZdgA+XwE5bZsJujIfQ3Z4hRXFX3
         FRsPzQZsR9BDjhLvA2c0rI1gMapeAJgxaVhFRh1OlyTS2mnwbQO/NbyuNfYm13Y1c+PQ
         RFfFE+z5+1QfwTc9GMQq4q/jCF5DHw8DGJKfssxwJiWHg+vVpfY9HsFL22Mp0enGyREU
         Yfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kecr5i+5DLqDAmpCrXdI3okGZBctpe1q4C972GZbARg=;
        b=aBDpV/6cx+f244fyam5CHsQU7ablrc3vKkp4S1G1hbGyl4zeJXcfhoQiRp+v9MEVmp
         9tQ2Uc+3GmiemjsjOqNybg0HpWQm/pDMSqgXH4BlPy81wW6cNCUld/QRgJo1lisVNthy
         TXbOexSatHtwx+3Cl2nCv+WdnraP0egoNIFOVuXmr3oD5IPsvgmAQB/Bvuq9JPMH7eYc
         4B+OlbhC5BEG1GOYQ/wOjUMkthIklNHnVq8ylMyPkM7Z999USLvAkf2daz6N0BVrxxtR
         5MKS4KBk1Gy5BZynAvo8XnqIMEjb/ACriWS2SpmCuyCMnxmtChg8gXvVmWGzzjTJk9nK
         M5Cw==
X-Gm-Message-State: AJIora84fSg7VacLkG3q1LqZHj5M3bXHKrx5Ph0+olCneIrhtWiJQmNK
	pj6iMFGZrJwpAd/9+gjB3HMwiQ==
X-Google-Smtp-Source: AGRyM1skXS9BzdqmFA82kATV7e6ORmNPtgRU6LtaPvd+9FfzbJu0HXQ5nPVqtz0xd98CkqRG+GjCRw==
X-Received: by 2002:ac2:4bc1:0:b0:48a:ad3:f1af with SMTP id o1-20020ac24bc1000000b0048a0ad3f1afmr21039314lfq.240.1658411472064;
        Thu, 21 Jul 2022 06:51:12 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id s4-20020a056512314400b00488333b6515sm448587lfi.305.2022.07.21.06.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 06:51:11 -0700 (PDT)
Message-ID: <4084d7e6-e722-a4a7-1a34-c50983f7d93a@linaro.org>
Date: Thu, 21 Jul 2022 15:51:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 3/6] dt-bindings: mediatek,mt6779-keypad: add
 mediatek,double-keys
Content-Language: en-US
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
References: <20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com>
 <20220720-mt8183-keypad-v1-3-ef9fc29dbff4@baylibre.com>
 <98ec7967-d007-46d7-ef54-aa41426b5f9f@linaro.org>
 <87r12eh9qe.fsf@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87r12eh9qe.fsf@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_065114_928071_DDB087E7 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

On 21/07/2022 15:32, Mattijs Korpershoek wrote:
>>> diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
>>> index ca8ae40a73f7..03c9555849e5 100644
>>> --- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
>>> +++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
>>> @@ -49,6 +49,12 @@ properties:
>>>      maximum: 256
>>>      default: 16
>>>  
>>> +  mediatek,double-keys:
>>
>> Do you think there could be another MT keypad version with triple-keys?
> 
> Of all the SoC's i've worked on (MT8167, MT8183, MT8365, MT8195) I've
> never seen a "triple-keys" keypad.

OK, but the binding you create now would be poor if MT comes with such
tripe-key feature later...


Best regards,
Krzysztof

