Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C391ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 07:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0DoW8vregXVH+TM9mSXdMASvPMT9wSQ3N08H3J6evs=; b=jzioca1cHF5qVeZTlXeW3pZ44G
	PvJb46iKSMWB0xL0AktF7YpVGkl1rhDTq2AkyWPaD0mmXZWm5L6yKek7Ae3H5IlkGwlUIwFp0gcef
	+vAKuCHrAdTP3W9DlFQoWOoiS5GgOuVl1n1SIQkumgy/bwXffLs0iUInqUePZP9oCgVQM2dDdWwVr
	mTlelehsdoCho+FxEI1RLVmgnF+vc10uS4JXwfs5ggfYuBG/Qw8fufr9temX2aVzw0ikSp0qSCxqE
	Dg0FcN1ZdQd7VoF6nAR32pl2+Ab4BjhwFJDJpMvOGT7312G9Xsfw9cs855g3J5aYup4/EKjnY/QjS
	0Km8yv2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYAf-00DiB2-Ko; Fri, 09 Sep 2022 07:11:25 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYAU-00Di6E-MF
	for linux-mediatek@lists.infradead.org; Fri, 09 Sep 2022 07:11:16 +0000
Received: by mail-lj1-x236.google.com with SMTP id v6so810263ljj.0
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Sep 2022 00:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=y0DoW8vregXVH+TM9mSXdMASvPMT9wSQ3N08H3J6evs=;
        b=w290wK8hnQpSbBmI3NNQEyLEA0IUA1o7Yh2KDXNLksO9NzSUKeKrwKdCpZcrSqzj+u
         iM0CFYgP/r4t74k4pGZEg05CgZcSA1y5VZWab4+viW0PdL6vzWGGi8raEZun5V4UrjK1
         wYjdB5iYfKMNW/kj/4am9xtzGvglsW57d4gXgUeEleLJgUcY9xGarD/KCq1TEBCNmFQZ
         jj/MRGOPYfZDTND/SumPuDpt/Sv4AJLgpxC9NkbcX+vyjdZaKdzAlnVkPK9ymxWBBhMG
         6C1I2qGyG9dSrMd5y6LSPnz1PpwE4Z+dxZ+0ZAvaGA8aHT/0q/AB5iQ+e1BoLYnC/h5h
         qT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=y0DoW8vregXVH+TM9mSXdMASvPMT9wSQ3N08H3J6evs=;
        b=roPym8bDDtvkPwkxkBaxCSkNVVF903QdyuWuTcjP7LzgvlPF/4nRE/txPA5DaEKD8h
         6OYRFqdHUmD53BQ9vwA8frGTzZ5wAvr5sRC4D5845GYaa+OLizcON63oyhuTadzCBrKr
         fIeeUvoD/MZG0YN9aO7Z3F8WfVEBuOLxYDtUvNubomqdX85H4TVTETfAZ1IaG8k89rHR
         p7DfxWe2dtgN2fK1oXmpzLkHUSTOSn+hm76GSQ7dFmiZLLJJUqX4X3d5iw6eKSEmvrW4
         8cVaYAcD6DPimzdHeE2Qzun1EhSYQe4UVVwSwLeRzkuxkdvKXQKUvpPCCiFhrsMmzkTt
         t0Zg==
X-Gm-Message-State: ACgBeo3MPnr4debO6icfLL/HEROgQItHqxfb4cCfU16i4NzU+cP0QX1A
	3/CMbL61szPZ4RTb+t0zXFn1Lg==
X-Google-Smtp-Source: AA6agR5cskGKF9Nq7MxQL8NV1peMGWdlaRakuhFzDBcuIUAY5U+RObocA3dShuBgZsktmyl+JKAROw==
X-Received: by 2002:a2e:aa13:0:b0:264:eb98:b7fd with SMTP id bf19-20020a2eaa13000000b00264eb98b7fdmr3379497ljb.26.1662707468235;
        Fri, 09 Sep 2022 00:11:08 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q30-20020ac2511e000000b004979ec19387sm142439lfb.305.2022.09.09.00.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 00:11:07 -0700 (PDT)
Message-ID: <87307ae4-a320-5880-1333-6ea700b61ca7@linaro.org>
Date: Fri, 9 Sep 2022 09:11:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: mediatek: mt8188: Add binding for MM
 & INFRA IOMMU
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
References: <20220831125502.7818-1-chengci.xu@mediatek.com>
 <20220831125502.7818-2-chengci.xu@mediatek.com>
 <2e575ed1-b82c-c7bd-3ddf-ccb6022b2461@linaro.org>
 <c09f262422dd6cd0bf2147870a109bd2ede36d4f.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c09f262422dd6cd0bf2147870a109bd2ede36d4f.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_001114_733342_064DCC4B 
X-CRM114-Status: GOOD (  12.33  )
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

On 09/09/2022 05:20, Chengci.Xu wrote:
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
>>
>> Why do you license it under BSD-3 clause?
>>
> 
> A mediatek internal wiki suggest me use "BSD-3-Clause" without detial
> reason. May be it is not suitable for this file.
> 
> If you don't approve of this, I can change this license to "GPL-2.0-
> only OR BSD-2-Clause", which is perferred by DT bindings file according
> to "submitting-patches.rst". 
> 
> Do you think "BSD-2-Clause" is OK? Or could you kindly share me another
> proper license?

Please switch to "GPL-2.0-only OR BSD-2-Clause", which is preferred for
bindings.


Best regards,
Krzysztof

