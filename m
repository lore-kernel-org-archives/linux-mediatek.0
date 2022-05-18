Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B6CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 09:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=na7qFI+1rRg1Z4bbTTN+vKZoZwhINtcFybJB7DAcBLw=; b=L86vJLtZvowKwa
	hvMfFSVZMVVWfz++3g2sjeipHiLY2tRMH4Hyg/r5O14jT7cQ0ftYI0vquwKYUwdvHYWmX+L4ARkmW
	J0povbqIyjTP4VeOdVEfQlhBArjgtTozd0fZSAPTvCLQd9xw0p4DGpA6/I1lBSFE11kQjMw/xHwYO
	Mjm6BCYUGd+vOtPjx3FdKTX47jAWYinmZp+5sGXw2sb4NOWKsAcYLrLnUIX6sSbhwpZ/SDURPPLvc
	4IfXUxe/xNrSRW90p+MTQeqCG8Fcdxfs07pBP4YLcAvttMAmY4AlvtfhcPKFZ745tmyB5+2MqGUpA
	hMdu8uIcRldofVO5IDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrG1A-0011fe-Ih; Wed, 18 May 2022 09:30:56 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrG0z-0011ce-EJ
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 09:30:47 +0000
Received: by mail-lj1-x229.google.com with SMTP id b32so1828135ljf.1
 for <linux-mediatek@lists.infradead.org>; Wed, 18 May 2022 02:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pEuG856eNrPsEk24LF5334+ERuSyEbx0udXSOjyyo+A=;
 b=jadEy/jwRZ8a/utyj7rT19tioRyAuF1iVtBo/+XjTN2yD0RdlZHtiF3DGgFlKWMtKJ
 D90u8Ym3Wpyw4sshRoIAE2UtdzchOB3LXtGiEVO1HwGcumHK6c9eSdg4F9Xm2RlCaV92
 mzmV0YqOt8ZXetvXzlxy+epqZSBQ7T+ii1rfgcSO1IqCPUFKRkYtg69bkrCzmQqoKVcO
 xa+4V9hL6OH9jqmAqTMvOqaHizpC/VnOoEk4QxCzgfHRvpOH6f7CgsyO4aoXLvazbR6J
 Jq5z4Yn9Lrsv+J9jQHQtcVbPhmGQSHddCbQ1cYtgeT4KWnXg1SoMaDGmZpeNkv97/83j
 vtJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pEuG856eNrPsEk24LF5334+ERuSyEbx0udXSOjyyo+A=;
 b=D2dwcltMkrkNmVRvGUBuAEHGbVRSYtPWrS28C2Y4pdPYOUCTRKZtFLxyqiHzJoQ+h/
 uMgQEtEi2wUNuAuap2HML8iP6okKfj3Tzzeu4do6TPq2X2GPSPeFdAHNDm7CfFJ2msFa
 c9zlcrafSzqrc7AAuOi5oCdGAfpojcrbJyqL4EqeiBGo1uuyUi4DFAruAo5WUgCQkdwo
 5Mz0g9G9bhmoidTvwB0jA7X8VGcCMvo7MlwNJBbkr7HLys4AgChgXAmKqUaQjSaMYWC6
 nSxInJOzqLS4SpZnk5F6ZgLr8e0ZJ4s8oPLyjhjB1HvxffCVtofnDopWVgC2MAxxX5B/
 +ZBg==
X-Gm-Message-State: AOAM5332grQl2M9FTXL63/Yzz7JOSQGzGu0P/7rexC+ZGb1kftSLPA3W
 fPa1f3EXW9C27cx9poHy0iiTIQ==
X-Google-Smtp-Source: ABdhPJyosrAxGczRVd6cfbCathJEWKApPLYPS9ky7y9dpYiREXQPMjHhIba3HPS92kh/mgUeLQdcqg==
X-Received: by 2002:a05:651c:893:b0:249:4023:3818 with SMTP id
 d19-20020a05651c089300b0024940233818mr17392024ljq.44.1652866241430; 
 Wed, 18 May 2022 02:30:41 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 w13-20020a05651204cd00b00473f03f22a3sm154234lfq.58.2022.05.18.02.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 02:30:40 -0700 (PDT)
Message-ID: <74b97963-3937-66fd-18e2-29278a99d706@linaro.org>
Date: Wed, 18 May 2022 11:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/6] dt-bindings: arm: mt8186: Set #clock-cells as
 required property
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 sboyd@kernel.org, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com,
 wenst@chromium.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
 <20220517101514.21639-3-angelogioacchino.delregno@collabora.com>
 <1cec6a09-9d80-99e7-ccc4-c918c6be7dbb@linaro.org>
 <5100b851-6787-fed8-a40f-7e6e64a123d8@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5100b851-6787-fed8-a40f-7e6e64a123d8@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_023045_536416_0965DD0A 
X-CRM114-Status: GOOD (  13.27  )
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

On 18/05/2022 11:24, AngeloGioacchino Del Regno wrote:
> Il 17/05/22 16:34, Krzysztof Kozlowski ha scritto:
>> On 17/05/2022 12:15, AngeloGioacchino Del Regno wrote:
>>> This is a clock-controller binding, so it needs #clock-cells, or
>>> it would be of no use: add that to the list of required properties.
>>>
>>> Fixes: f113a51aa2cf ("dt-bindings: ARM: MediaTek: Add new document bindings of MT8186 clock")
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> ---
>>>   .../devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml  | 1 +
>>
>> If these are clock controllers and new bindings, why they were added to
>> "arm" directory? arm is only for top-level stuff, not for devices.
>>
>> In the future please put your bindings in respective subsystem matching
>> the hardware. Fallback is soc directory, not arm.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
> 
> Hello Krzysztof,
> 
> I agree with you about these bindings belonging to the clock directory.
> Should I add a patch to this series that moves all of the mtxxxx-clock
> and mtxxxx-sys-clock yaml files to the clock directory?

They should not be added there, but no need to shuffle things around...


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
