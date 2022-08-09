Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80A0C19F2D
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Aug 2022 11:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kY0VW7WRH6OusbkpplS07Fdtd4JYKcNiADl2/iZxNM4=; b=qtQEtrC+BN8+ZcXB0jl1y0HyVK
	i17MMM11Oq2GT63E02vOILC9K1zW9TX0HPZSUaMVtrtcjDc551i8mGHv0A9e2SY/pUBoGUZALjF1n
	BCOvn8PXfxYg8hAERsFP7oPCxCSMmCdng28shcqtGTx+7jrcOS6UpBX79CN1u0MVu1cdgLF6Fx6iw
	uZT5so3vrfw/bZ07cpvFRVRLXbryexw8VG6sUlEzzSnAVZCv5UFHSY32jcwow6FY1tUy2KLAGG9g8
	2VwiWb2ke7Ac72tX8mPsklV9N/PsiAFBKVuYYu1QIWK/1Ike+0gThfkoQ0HGyqAaDakQLSH0AdBSU
	SCJeEXrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLNcH-003d34-PA; Tue, 09 Aug 2022 11:41:45 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLNVe-003aUX-Nw
	for linux-mediatek@lists.infradead.org; Tue, 09 Aug 2022 11:34:56 +0000
Received: by mail-lf1-x130.google.com with SMTP id d14so16542229lfl.13
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Aug 2022 04:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kY0VW7WRH6OusbkpplS07Fdtd4JYKcNiADl2/iZxNM4=;
        b=KJK0csbJ8X8iQUolwDewaQzJioe6tf+1Sc3oMKJRyphO8GNc5fAs8O9MdaLYQySOaa
         zwbXKjGxRnY5fGqIecaQHibZTxQOXUuzaI98Tv9mzYJcpPUAWa2fU+IzLuWzsI19Zs1u
         +P5+btFkh6Sy0kqfHmpN00+r2IgJL2ddRUJh6Tkb0A7/3nBIIcWbCgrPALKXIX9U0RL9
         Yg8yk8k5Zs87kPRl7UmCbOk2wsNG8S9wJQmvyHmQC1DuHCYKzQWYnt+LnU3lqTr8599m
         hOaI4yd2d+Rh2Ds4mClFiZzeT9l6I7KSVMJ3X5Hcn937rJsXvzpgabeGjlcxfC9Rzn/S
         i8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kY0VW7WRH6OusbkpplS07Fdtd4JYKcNiADl2/iZxNM4=;
        b=BffK2/5iLeGkz6Tj8mq47P6yGlfB3g8r2ZAwxZgC0sVrIraEbxXQH3pEyccte8HKqq
         s8zgHW1ACFNprzhycaBMK/LkYeqF3B0t0g5BigjWsjgXZgX6AtmqC5VlmnJpViP3WJsS
         5sREFVOD00pCd4Lt9ETZSsZfIvsBCfqVuZvKWRK2kGNmbgskWbqBKAvewKTjb2LifgRF
         cNL/v+5BjBgSd06iJuJGb7Fsl7EyNUj05iCz6zmZ/mv1O4nbU7X5HYVfGmXDbElU7dmi
         TjOvMryo87qOPqzcIPWVwucFNwcbCzkUPy8g8KBfP0+lApiJqNbMx9gHYXSTgmdxhecE
         1A9w==
X-Gm-Message-State: ACgBeo2KV9yeX9D69iXVFYPpHmDsYl++b/x0o7V17yIEdEklbZ1uLSlU
	XQIWnvpJ3X3JFuqnGV/ouobn4w==
X-Google-Smtp-Source: AA6agR646I5X0CTuqa55/u440pAF2eLYRijfxQzVMpjwQVklzq7IlNiFuXKLdtPE9t5FEybrYt56ig==
X-Received: by 2002:a05:6512:6c8:b0:48a:f375:9ecc with SMTP id u8-20020a05651206c800b0048af3759eccmr7515767lff.206.1660044893124;
        Tue, 09 Aug 2022 04:34:53 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id p8-20020a2eb7c8000000b0025e42f8e771sm1670846ljo.34.2022.08.09.04.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Aug 2022 04:34:52 -0700 (PDT)
Message-ID: <3a9c6f63-64c7-d95d-496a-79516cce3939@linaro.org>
Date: Tue, 9 Aug 2022 14:34:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 02/20] dt-bindings: memory: mediatek: Update condition
 for mt8195 smi node
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220804021553.14867-1-tinghan.shen@mediatek.com>
 <20220804021553.14867-3-tinghan.shen@mediatek.com>
 <96e66425-ff2a-4640-8b96-48fa39943bf9@linaro.org>
 <6a1977971317059fcfad685869b6ccf233edcb68.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6a1977971317059fcfad685869b6ccf233edcb68.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_043454_842557_D49B74CA 
X-CRM114-Status: GOOD (  13.02  )
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

On 09/08/2022 14:01, Tinghan Shen wrote:
> Hi Krzysztof,
> 
> On Thu, 2022-08-04 at 17:12 +0200, Krzysztof Kozlowski wrote:
>> On 04/08/2022 04:15, Tinghan Shen wrote:
>>>
>>> It's because the 'mediatek,mt8195-smi-sub-common' compatible incorrectly
>>> matches the 'else' conditions for gen2 HW without gals.
>>>
>>> Rewrite the 'else' condition to specifically identify the compatibles
>>> that utilizing gen2 HW without gals.
>>>
>>> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
>>> Reviewed-by: AngeloGioacchino Del Regno
>>>  <angelogioacchino.delregno@collabora.com>
>>
>> Unfortunately, your patches got corrupted.
>>
>>
>> Best regards,
>> Krzysztof
> 
> Do you mean rebase to the latest linux-next?
> I'll rebase in the next version, thanks!
> 

No, I mean look at the line above. And many other lines. That's not a
proper patch file.

It's not my email client. Lore reports the same.


Best regards,
Krzysztof

