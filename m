Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486F7ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 07:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOGLHZxJ3ehuwDP9HL0oLd7ufIS2rSRxC4FcV3nNb7s=; b=pbLyYliubmyHzQXQ3Lc76SdO2J
	2FdCaDdaTcQFHtoJhqhljhW0TujVeI4xeoXCR9TIwp/u4fcQQeY3XhEieCMDBkYfCfE7y4lLFGOcC
	qlP1Y7kt3R7MR09gDgfoh9yAWOxVw0EmQR++gzDlsVBF1YBX/nxMOawNIemgzn1re/5erGNrYHBM9
	LAQx3efjwDODWYFADwwkPXbdNVtn8GMN/uQ3SrUpfOic5XrJip2bloX380lMld8Xf2v3ETjyumoff
	IZOI+sNNPt211p+RRxI8t34egTdexjnL5WtTKj2UO4kGCQKJTlkzq6idqwJr/G6q7Z1MD3VYVUKdQ
	aSzbCYJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYBN-00Dicl-6M; Fri, 09 Sep 2022 07:12:09 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYBJ-00DiXy-Lz
	for linux-mediatek@lists.infradead.org; Fri, 09 Sep 2022 07:12:06 +0000
Received: by mail-lj1-x230.google.com with SMTP id bx38so746938ljb.10
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Sep 2022 00:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=QOGLHZxJ3ehuwDP9HL0oLd7ufIS2rSRxC4FcV3nNb7s=;
        b=BWyXu++1uPwlKzxQQu+DxoxMeR/JrBSuK9lG6Z9QndN/sYkYtdJDhOaHN+s02etnn4
         OL3wW5pNwdxnhZHVAHt2/Vu/SkuOdEwcfO+mvG1g8/txQSDyPKe7zG6vHylL7omUjsHt
         sVCs87b7Yi/DcC/lyE6FsOEClx+iOGX+8QrBqSh1fMDxBuawlPraG4oZom4seGwsfryU
         IdUZE5aQq2EWHir43pvP0Qc0MJUvfMDTpfOl8s2yHolA970UkuJNpfhNMwr365Tw1I3h
         /bgH/n22xSXSryutBPlgdQrOhtfEYi0nEmzX0VKSnDKiZdiKN3/MZfEBC+Xj6GEXrVnR
         O56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=QOGLHZxJ3ehuwDP9HL0oLd7ufIS2rSRxC4FcV3nNb7s=;
        b=LPMlW20BOieREKY2hLMCZOOXROM+YoxXKjun+Gzd2IoUZnOwlroomysehK+Wpz8uF/
         LTLDb/C0NLOCBJKL5QCMAXPsvAO+VWMMY84+EXD99dWZ2epXqjDbVXp15jgTmslVP+zv
         qCtSAZtnEmFmQXRHV5MIS2HnSpWE3smAY7v8wPo9v+md3mzJEvQLqkzCG+Vsn4vflwUq
         +E/mnLFazK4ZP5iVhhDhOlJxlW4dnvNfL4Kpf5h1dDt7fFST9OTK7R0A2xVa8BnG0h1o
         y/nINoNIT+1AZ4b/xqsrWX9EadSCggc7Lwa/i+nhlh/vFwWNFW6Y6yAVHYsvX7dM00Xb
         UxDQ==
X-Gm-Message-State: ACgBeo3Zu7i6TwtWjj6ymuq/GrbtYjGJMWPBR1RrJl4bz/5SGWCpbbIn
	FC0VVJuy9lQf1I2yXD4qop7JLg==
X-Google-Smtp-Source: AA6agR5O2hfbFRKJ4pK/M7SIHVCeEmYbk7TXkg8QE0//OgIRJ37GSP2kOJFWCJOE92oCam0WI8m9sw==
X-Received: by 2002:a2e:2f03:0:b0:261:cb0e:c329 with SMTP id v3-20020a2e2f03000000b00261cb0ec329mr3277972ljv.106.1662707520203;
        Fri, 09 Sep 2022 00:12:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m5-20020ac24245000000b00498f36bce07sm150242lfl.214.2022.09.09.00.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 00:11:59 -0700 (PDT)
Message-ID: <d7fc281e-64e7-239f-8c53-1d494eaa69cd@linaro.org>
Date: Fri, 9 Sep 2022 09:11:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/7] dt-bindings: phy: mediatek,tphy: add property to
 set pre-emphasis
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Eddie Hung <eddie.hung@mediatek.com>
References: <20220829080830.5378-1-chunfeng.yun@mediatek.com>
 <20220829080830.5378-2-chunfeng.yun@mediatek.com>
 <d1f49935-b465-7495-d345-f35bf4dea9f9@linaro.org>
 <d30353e4dbb785c3ce31ef54b791bfe3d23df904.camel@mediatek.com>
 <82576790-9fb0-ee1b-2308-fbe292068bd9@linaro.org>
 <113219ac80cceaa4a39434e4370db821e26a5275.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <113219ac80cceaa4a39434e4370db821e26a5275.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_001205_756657_1DA1AB9A 
X-CRM114-Status: UNSURE (   9.19  )
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

On 09/09/2022 05:07, Chunfeng Yun wrote:
> On Wed, 2022-08-31 at 09:02 +0300, Krzysztof Kozlowski wrote:
>> On 31/08/2022 06:14, Chunfeng Yun wrote:
>>>> These bindings are expected to be
>>>> usable/applicable on several devices, so units, not register
>>>> values
>>>> which can change between devices, are the proper and reliable way
>>>> to
>>>> describe a feature.
>>>
>>> I prefer to use exact level values, but not the inexact values with
>>> units (e.g. -percent, -microvolt).
>>
>> What stops you from using exact values - bp?
> See reply for the first series, thanks

Not in my inbox anymore.


Best regards,
Krzysztof

