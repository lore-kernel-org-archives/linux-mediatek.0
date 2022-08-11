Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B594C19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 08:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5Ft5sVhLXeWT9idHrJs9i/WomNuOkmhDhB2xyIuVDk=; b=lCjewZwF6Aampuef+A2tZShVqR
	6SOCfdi4/Oxas5mBiyrIC8n/1yGrxLeAqh804MYqNmNo8e8tYDOEdjfj6P9pD5S/PUpwn0U1arVX6
	IiFc3qjQQbVJCfDYonsXsaJPXEHC7fOBRmteH2xLXw+acjGkX/FNecLdWpxZehV8TVZfGyn2NrUTx
	ZTw6Jjwm3oemVaT70tM6daNjzIixh7RSDBq8hn95mfO4qQcL34zZ9tqnH9WK0JE5qhgTxU7kSynR8
	BT0mqI1FbuJdmZ+UGRenM/v7HEBvGSzP1C+AOjXdx45f+n6pbsnn3AuNxD65I8h45I+aV1YViUwGA
	RzhuQm+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM41B-00AUv0-Kx; Thu, 11 Aug 2022 08:58:17 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM419-00AUtB-4X
	for linux-mediatek@lists.infradead.org; Thu, 11 Aug 2022 08:58:16 +0000
Received: by mail-lj1-x230.google.com with SMTP id bx38so18621840ljb.10
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Aug 2022 01:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=N5Ft5sVhLXeWT9idHrJs9i/WomNuOkmhDhB2xyIuVDk=;
        b=wVyaWMWBQECdMUBpp7ZCsMs+ygcvsTNhL3QyN1Hd3bVN+jIscsZW1+Sk5718mb7T+9
         5AvoXULMa/v55wb0yPGXxOKYOpF2dD8DByh6BHnnFRwEo9FTZCwL/FfnNPwdlv2EtPhK
         Q24/SOHs2lrjO5qbXSWNhq0jwyFvovuBAP59gMTjZx0wv6dD48qGNpTcGnmvRUqYcJ9I
         Txg8SUshCo8Aq0AFZu6itRg0fhDD6HS2y8ctI6VTgtGZvXurw+bJWIc+HbktjkPk1LtD
         Tr1aTOpwiSRo0M/KuHjWW09YYo5AzUEy6njjIloYn9DnAOkE1+3YkWkSzi1LnMkyWfmr
         fZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=N5Ft5sVhLXeWT9idHrJs9i/WomNuOkmhDhB2xyIuVDk=;
        b=kSVohrHq8ui/KFpxPexuhSYKE3qlxJ6YDwvr+et/Or3IgWjdq+MXRsTqPJv1PlOCPD
         ZdLUATBVx672LqQI/6/0qNdOo9Aj+h/O8DP7d1mRvMy5W+3igvVuk3+XfQapJi7Cqu7L
         qPEK62ogwDtz1hbLHOylPrB2SCMwlpP2k8aqn+dG+baaLoarZCP0RZh0fppMhLGEZrJ/
         ZtZ1O8wYMFLG2zsHp9xPJn5BCdi5KIFYnLxaYr+FIqwaJfs90JfWWJ9QXqffrpf6foT2
         rR9plCxAMF3VLXEypuqoqp2gFhnleb9BVh+LRg/xm3iHqAnrxSxeFW+YEz2KSp/bs8LC
         xiUQ==
X-Gm-Message-State: ACgBeo1wpXuw/DonH8LqgGDWorPAq27JEWdZN17w093CbS5wAAFF/9/r
	gcIj2cWtM7K0qQ9LqijouDLePQ==
X-Google-Smtp-Source: AA6agR5IG/BKNBEX72bjzs3bSYNizTV99VINIDm/s2LxtwxR86KNQn9gvYNlkjqA9dNJgl+dksY4+A==
X-Received: by 2002:a2e:9e17:0:b0:25d:7654:4c6b with SMTP id e23-20020a2e9e17000000b0025d76544c6bmr10392843ljk.130.1660208292382;
        Thu, 11 Aug 2022 01:58:12 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id du14-20020a056512298e00b0048cf7e8145asm635053lfb.117.2022.08.11.01.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 01:58:11 -0700 (PDT)
Message-ID: <86ab77f5-8beb-7237-d6e2-734f52ca176b@linaro.org>
Date: Thu, 11 Aug 2022 11:58:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] pmic: add mt6366 regulator document
Content-Language: en-US
To: "zhiyong.tao" <zhiyong.tao@mediatek.com>, lee.jones@linaro.org,
 robh+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, eddie.huang@mediatek.com, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, fshao@chromium.org
Cc: sen.chu@mediatek.com, hui.liu@mediatek.com, allen-kh.cheng@mediatek.com,
 hsin-hsiung.wang@mediatek.com, sean.wang@mediatek.com,
 macpaul.lin@mediatek.com, wen.su@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 zhiyong tao <zhiyong.tao@mediatk.com>
References: <20220728062749.18701-1-zhiyong.tao@mediatek.com>
 <20220728062749.18701-2-zhiyong.tao@mediatek.com>
 <03a13ed4-e7cd-6f7d-f8f7-9b1e6193e202@linaro.org>
 <111e1073e1ce689e289e52c645a1be2e7dc7fe12.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <111e1073e1ce689e289e52c645a1be2e7dc7fe12.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_015815_323472_0092E880 
X-CRM114-Status: GOOD (  12.53  )
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

On 11/08/2022 11:42, zhiyong.tao wrote:
>>
>>>
>>> Signed-off-by: zhiyong tao <zhiyong.tao@mediatk.com>
>>> ---
>>>  .../regulator/mediatek,mt6366-regulator.yaml  | 375
>>> ++++++++++++++++++
>>>  1 file changed, 375 insertions(+)
>>
>> Subject does not match subsystem.
> 
> Hi Krzysztof,
> 
> Do you mean that we should change the title like this:
> regulator: dt-bindings: mediatek: add mt6366 regulator document
> is it right?

Yes. And remove redundant pieces so for example:

regulator: dt-bindings: mediatek: add mt6366
or:
regulator: dt-bindings: add mediatek,mt6366


(...)

>>> +    patternProperties:
>>> +      "^buck-
>>> v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$":
>>> +        type: object
>>> +        $ref: "regulator.yaml#"
>>
>> No need for quotes.
> ==>
> We will remove the line "$ref: "regulator.yaml#"" in next verison, is
> it right?

No, it is not. Why do you want to remove it?


Best regards,
Krzysztof

