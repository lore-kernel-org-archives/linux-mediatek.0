Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825A2C25B0E
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 07:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RV+ARt4gQhvfrcS7u827ZCv30OBKAwgCr4iLi8/48cU=; b=chuDNG648AeuHU3/VVQhNJnkDF
	Pv07x9zIaxIWct24syBvRAuEzt4yCD6O2CogRVtXnlA1sdMmdEMDhehmMPtpMj3IuAbwGMCLD1LkS
	ovIHXn0RiRlT7cXNWvZe3JjNtNqmQrSDiHv53cSwe3yc8llPxMiFCrrQWi9x825ngd4nHRMBxAyK6
	nO4abn+ltHNSUZCS14FPYrnjqeewZ6O48g9U/y8xvxthNJbOK1yvR1ErEG+c5PuYYGOhlZ5d3WGZs
	KytZBS4fDoZ5EMjYTmZ1u5UeP3pPaNdHjD/dtI+G7JEo+sZ5YTKbpHVStWbP6Pphy8zO9Fh7uX5T0
	yqPAOKMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOwTw-003PFZ-W4; Fri, 19 Aug 2022 07:31:53 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOwTl-003P6W-QP
	for linux-mediatek@lists.infradead.org; Fri, 19 Aug 2022 07:31:43 +0000
Received: by mail-wr1-x431.google.com with SMTP id ba1so4183209wrb.5
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Aug 2022 00:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=RV+ARt4gQhvfrcS7u827ZCv30OBKAwgCr4iLi8/48cU=;
        b=uPBQyrxzcJRob7in8TPErUSfRm3jOEFuSNQgZupp8+Ej6fHuZgxgNhI7L58GtA/r4q
         1kUAaFh6sZFr/Lv+8LELzSu7XAh+MbsHbi13EThBfYvbnJqLgnGj6tE0rCGEptfWco8C
         MisfjK6/VbW6wfA783dRwWjORTSsFkok6kGias/7AYzKYgYir3Rz2uDzdAt4x5PLJ47+
         u1QDM4t2Iu6tqff52mzhzokQh+79xRvvjosSTd8QGXJrncta5xHxMxgxiRoxCXETnHwp
         pNhzPnLLPf8MsgNmxQViIFmXB6tN3Y3gHN//f/lN7erANYZrr7IYck/UIt7SNzRfhfy1
         ryZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=RV+ARt4gQhvfrcS7u827ZCv30OBKAwgCr4iLi8/48cU=;
        b=eWkjeOOlu5PTrO4lS+BIOV8M/HqJoDuTfh81mowj9ZBR64I/AbBdFQbbqG7CdKHsYi
         rnj/QgOmcqFaweWyHoMNWj4w+3aS4iVJt3hKhiTrJH0RgSyTydbhIgLo8+yzfjJtv4Q3
         25dQxN/Iy41ebU2OWzXxtYuOJag2VTc2vEiVwjKtUwyFIrmj1/4yCFwH/d47dYh9WU5H
         Iq6MIGQtHNLrKZZI1W2S4bCMRiBsQ/Goh//OWDPUaF7s7WdhxagaBMmjeSTBIcW011Dz
         MMRa8jPEwxxv6uU1qulZsn1tpD9vTn/RbNOO0/aQR0s3OqN/xY+xxnR4NtXNzsZoiBbF
         tKCA==
X-Gm-Message-State: ACgBeo2GDhz7C+X6YanExT49skSQOuaB/UdkGju6URiw4mwNrJz0pTJk
	L0CF32Y9bM+rdsnTPiz9r9UPZA==
X-Google-Smtp-Source: AA6agR4CGIlqAV6RizwDoxYJFGlwJm1SK13W9rHLu2V5WQfDmh0FysHCD1l7Q3/xJfa5DFO9Az+90A==
X-Received: by 2002:a05:6000:2cc:b0:21e:e8c1:2704 with SMTP id o12-20020a05600002cc00b0021ee8c12704mr3693424wry.378.1660894298251;
        Fri, 19 Aug 2022 00:31:38 -0700 (PDT)
Received: from [192.168.86.238] (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
        by smtp.googlemail.com with ESMTPSA id v8-20020a05600c214800b003a5c244fc13sm8237202wml.2.2022.08.19.00.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 00:31:37 -0700 (PDT)
Message-ID: <1e365b6a-abc0-7745-572e-4bb76ff9a4c8@linaro.org>
Date: Fri, 19 Aug 2022 08:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] dt-bindings: nvmem: mediatek: efuse: Add support for
 MT8188
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220715120114.4243-1-johnson.wang@mediatek.com>
 <20220715120114.4243-3-johnson.wang@mediatek.com>
 <8ab34dd4-ca5a-2824-ccbf-867996ac6536@linaro.org>
 <726ec17f1b8d42f7ec9858a54ee952cb53f03188.camel@mediatek.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <726ec17f1b8d42f7ec9858a54ee952cb53f03188.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_003141_931639_DFB24CCA 
X-CRM114-Status: GOOD (  15.97  )
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



On 19/08/2022 04:28, Johnson Wang wrote:
> On Wed, 2022-08-17 at 13:21 +0100, Srinivas Kandagatla wrote:
>>
>> On 15/07/2022 13:01, Johnson Wang wrote:
>>> Add compatible for MT8188 SoC.
>>>
>>> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
>>> ---
>>> This patch is based on "linux-next"[1].
>>> [1]
>>> https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git__;!!CTRNKA9wMg0ARbw!yz8fBHH39-ntsRnAlXZfmS1k9PoKMtITUk-DhcvGQJOJSu9HP70OmFoCYMfvxnjWw4Ql$
>>>   
>>> ---
>>
>> Applied thanks,
>>
>> --srini
>>>    Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>>> b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>>> index b5a1109f2ee1..75e0a516e59a 100644
>>> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>>> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
>>> @@ -30,6 +30,7 @@ properties:
>>>                  - mediatek,mt8173-efuse
>>>                  - mediatek,mt8183-efuse
>>>                  - mediatek,mt8186-efuse
>>> +              - mediatek,mt8188-efuse
>>>                  - mediatek,mt8192-efuse
>>>                  - mediatek,mt8195-efuse
>>>                  - mediatek,mt8516-efuse
> 
> Hi Srinivas,
> 
> Just a gentle ping on this.
> It seems that this patch hasn't been applied into [1].

Its applied and pushed now!

--srini
> 
> If you have any concern about this patch, please let me know.
> 
> Thanks.
> 
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git


> 
> BRs,
> Johnson Wang
> 

