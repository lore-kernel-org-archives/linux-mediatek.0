Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACB7C00140
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 07:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gtx/1NtYRUpYFSNfi/ck/6ru5mDdKGyHys400ty/Xyg=; b=d72m2C848YkQP3KDzbSY/U1aIZ
	OiHIZFg30kQDIetQRhLZjDi7/tTGsuz1Utwlm6Lo8ZPSUrGc4Jo7ZFcZljI/GduElem+4DpV+gu3P
	1wWl3Wuz3Cgm60mduJebroiarD1dCKC7Wj5Kb50JWgQh1vHQA9FXn+Ti7SFtYYzdlG3J619drkiVu
	gPfsBCCi9fCtDsLQoMzHNa41XAhh7mTW0KOlWHcZvDDGq0zbzxI1SKwiZq9gvMGSstmj38nSjtKEO
	zyCIZ+H48wkof3YYXylhCJNoxbLNmE6ubiGgvOesQ4WdzhqiWpIs5oQuaL7C1jz8uM+z1I++sCJ+v
	SlT+fzWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOaGh-000LdA-Qv; Thu, 18 Aug 2022 07:48:43 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOaGW-000LLN-0a
	for linux-mediatek@lists.infradead.org; Thu, 18 Aug 2022 07:48:34 +0000
Received: by mail-lf1-x12b.google.com with SMTP id u9so1071891lfg.11
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Aug 2022 00:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Gtx/1NtYRUpYFSNfi/ck/6ru5mDdKGyHys400ty/Xyg=;
        b=pA3vT8XbKPIIhMfNE2PsUnmxJJkmWap6JQJqjWxUjeuEtfkhAgrmbdfO6Yu/ZTLP7+
         SI16XaknZ5obeqxRLBGSBSc/1r4y45MRiSyeB6pwmB+cHec/6aTD4/5RxkzzmL0Ot/9z
         ucg0vtkF5wz+5MDMOvy8h//s+2H7ILParQqB74iLotZzx2nxXSbGhZQI24Ixe40Is7v0
         65gvD5eRu1tOo3oAL0u2bfaNj4l7CH9hHkZSIkk5HWj+82cUPcedRrWETKf4N+2+mHdR
         mseUANI8JD0T1a+1+jpxDM6W0m72On92z7wq5nbOpfJsU3BCUQBKBF/iRSe/qQwiJCap
         xc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Gtx/1NtYRUpYFSNfi/ck/6ru5mDdKGyHys400ty/Xyg=;
        b=Ekq0nHPMyBy26NPaGi4IOutYhhkUJb+RMzJ1IjGfj+1i9IRagcPOG7eKSCuS3dotV2
         R3BFT9wzZrDEzEMtDcF6BN7TKOLigwUwF7Z3C10FzStHZNySdA/C63rGM67vfoulSTaP
         SbsKOBKd9NuqG6niNsBu7DluXHSK/Ew49Gck+XEBw3QHo3mmbRrwRh5D5842Vd8LizBP
         BX3vt6KqHnOYa6K7YTTm0gLbRR7yVWPyO+M4b3Go5XF1FB7AArXqfam4kBb5UCv3OhlZ
         VoTN9irgu75H+NqmMz1ovDdwoc3AakSDyFSzQbVpTCkBaSFxq0juNEuxTsxPOc1O0sH2
         /jcA==
X-Gm-Message-State: ACgBeo3pI7XwxMmz3zbEuQEmhGp7GkTyKyma/haKjU5hpJOMf4PGS4P8
	fW1umDZOzQr9QZIRXUUClAxWXm4UTnFYuNM2
X-Google-Smtp-Source: AA6agR4KTEWECDn55d+h9/m11+vRY/poYCh80L5VL5lneKWL68GDtDsqJbwN9MQNwzUWsQWSiQTv3g==
X-Received: by 2002:a05:6512:201a:b0:48d:1101:cc9b with SMTP id a26-20020a056512201a00b0048d1101cc9bmr644396lfb.152.1660808908249;
        Thu, 18 Aug 2022 00:48:28 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:53ab:2635:d4f2:d6d5? (d15l54z9nf469l8226z-4.rev.dnainternet.fi. [2001:14bb:ae:539c:53ab:2635:d4f2:d6d5])
        by smtp.gmail.com with ESMTPSA id v10-20020a056512348a00b00491203d6cc9sm121513lfr.131.2022.08.18.00.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 00:48:27 -0700 (PDT)
Message-ID: <5a916595-12ee-92e6-d380-84146dd75218@linaro.org>
Date: Thu, 18 Aug 2022 10:48:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/3] dt-bindings: mediatek: mt8188: Add binding for MM &
 INFRA IOMMU
Content-Language: en-US
To: "Chengci.Xu" <chengci.xu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220804105834.626-1-chengci.xu@mediatek.com>
 <20220804105834.626-2-chengci.xu@mediatek.com>
 <ae06f644-b988-8fc3-fde8-258299f8f2ae@linaro.org>
 <f34db3a295b8c83e03bf79950cc25d39b6f81240.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f34db3a295b8c83e03bf79950cc25d39b6f81240.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_004832_080758_0D77210D 
X-CRM114-Status: GOOD (  13.35  )
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

On 18/08/2022 10:26, Chengci.Xu wrote:
> On Thu, 2022-08-04 at 13:13 +0200, Krzysztof Kozlowski wrote:
>> On 04/08/2022 12:58, Chengci.Xu wrote:
>>> This patch adds descriptions for mt8188 IOMMU which also use ARM
>>> Short-Descriptor translation table format.
>>>
>>
>>
>> Thank you for your patch. There is something to discuss/improve.
> 
> Tkanks for your review.
> 

BTW, none of your emails seem to reach devicetree mailing list:
https://lore.kernel.org/linux-devicetree/20220804105834.626-1-chengci.xu@mediatek.com/
which means they won't pop-up in Rob's Patchwork and won't tested by bot.
https://patchwork.ozlabs.org/project/devicetree-bindings/list/?series=&submitter=84571&state=*&q=&archive=&delegate=

I wonder if this is the same issue as with other Mediatek emails
filtered by spam...

Anyway, you should sort it out, otherwise patches won't get to Rob and I
won't apply them.

Best regards,
Krzysztof

